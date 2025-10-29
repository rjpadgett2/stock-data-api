package com.livestockapi.service;

import com.livestockapi.dto.*;
import com.livestockapi.entity.*;
import com.livestockapi.repository.*;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class BreedService {

    private final BreedRepository breedRepository;
    private final SpeciesRepository speciesRepository;
    private final CharacteristicRepository characteristicRepository;
    private final CareRequirementRepository careRequirementRepository;

    @Transactional(readOnly = true)
    public Page<BreedDTO> findAll(Long speciesId, String originCountry, Pageable pageable) {
        log.debug("Finding breeds with speciesId: {}, originCountry: {}", speciesId, originCountry);
        
        Page<Breed> breeds;
        
        if (speciesId != null && originCountry != null) {
            breeds = breedRepository.findBySpeciesIdAndOriginCountry(speciesId, originCountry, pageable);
        } else if (speciesId != null) {
            breeds = breedRepository.findBySpeciesId(speciesId, pageable);
        } else if (originCountry != null) {
            breeds = breedRepository.findByOriginCountry(originCountry, pageable);
        } else {
            breeds = breedRepository.findAll(pageable);
        }
        
        return breeds.map(this::convertToDTO);
    }

    @Transactional(readOnly = true)
    @Cacheable(value = "breeds", key = "#id")
    public BreedDetailDTO findById(Long id) {
        log.debug("Finding breed by id: {}", id);
        
        Breed breed = breedRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Breed not found with id: " + id));
        
        return convertToDetailDTO(breed);
    }

    @Transactional(readOnly = true)
    public List<BreedDTO> search(String query) {
        log.debug("Searching breeds with query: {}", query);
        
        List<Breed> breeds = breedRepository.searchByKeyword(query);
        return breeds.stream()
            .map(this::convertToDTO)
            .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<CharacteristicDTO> getCharacteristics(Long breedId, String type) {
        log.debug("Getting characteristics for breed: {}, type: {}", breedId, type);
        
        List<BreedCharacteristic> characteristics;
        if (type != null && !type.isEmpty()) {
            characteristics = characteristicRepository.findByBreedIdAndCharacteristicType(breedId, type);
        } else {
            characteristics = characteristicRepository.findByBreedId(breedId);
        }
        
        return characteristics.stream()
            .map(this::convertCharacteristicToDTO)
            .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public List<CareRequirementDTO> getCareRequirements(Long breedId, String category) {
        log.debug("Getting care requirements for breed: {}, category: {}", breedId, category);
        
        List<CareRequirement> requirements;
        if (category != null && !category.isEmpty()) {
            requirements = careRequirementRepository.findByBreedIdAndCareCategory(breedId, category);
        } else {
            requirements = careRequirementRepository.findByBreedId(breedId);
        }
        
        return requirements.stream()
            .map(this::convertCareRequirementToDTO)
            .collect(Collectors.toList());
    }

    private BreedDTO convertToDTO(Breed breed) {
        BreedDTO dto = new BreedDTO();
        dto.setId(breed.getId());
        dto.setName(breed.getName());
        dto.setAlternateNames(breed.getAlternateNames());
        dto.setSpeciesName(breed.getSpecies().getName());
        dto.setOriginCountry(breed.getOriginCountry());
        dto.setOriginRegion(breed.getOriginRegion());
        dto.setDescription(breed.getDescription());
        dto.setPurpose(breed.getPurpose());
        return dto;
    }

    private BreedDetailDTO convertToDetailDTO(Breed breed) {
        BreedDetailDTO dto = new BreedDetailDTO();
        dto.setId(breed.getId());
        dto.setName(breed.getName());
        dto.setAlternateNames(breed.getAlternateNames());
        dto.setSpeciesName(breed.getSpecies().getName());
        dto.setOriginCountry(breed.getOriginCountry());
        dto.setOriginRegion(breed.getOriginRegion());
        dto.setDescription(breed.getDescription());
        dto.setPurpose(breed.getPurpose());
        
        dto.setCharacteristics(breed.getCharacteristics().stream()
            .map(this::convertCharacteristicToDTO)
            .collect(Collectors.toList()));
        
        dto.setCareRequirements(breed.getCareRequirements().stream()
            .map(this::convertCareRequirementToDTO)
            .collect(Collectors.toList()));
        
        dto.setImages(breed.getImages().stream()
            .map(this::convertImageToDTO)
            .collect(Collectors.toList()));
        
        return dto;
    }

    private CharacteristicDTO convertCharacteristicToDTO(BreedCharacteristic characteristic) {
        CharacteristicDTO dto = new CharacteristicDTO();
        dto.setId(characteristic.getId());
        dto.setCharacteristicType(characteristic.getCharacteristicType());
        dto.setValueNumeric(characteristic.getValueNumeric());
        dto.setValueText(characteristic.getValueText());
        dto.setUnit(characteristic.getUnit());
        dto.setSex(characteristic.getSex());
        dto.setAgeCategory(characteristic.getAgeCategory());
        dto.setNotes(characteristic.getNotes());
        if (characteristic.getSource() != null) {
            dto.setSourceCitation(characteristic.getSource().getCitation());
        }
        return dto;
    }

    private CareRequirementDTO convertCareRequirementToDTO(CareRequirement requirement) {
        CareRequirementDTO dto = new CareRequirementDTO();
        dto.setId(requirement.getId());
        dto.setCareCategory(requirement.getCareCategory());
        dto.setRequirement(requirement.getRequirement());
        dto.setPriority(requirement.getPriority());
        dto.setNotes(requirement.getNotes());
        if (requirement.getSource() != null) {
            dto.setSourceCitation(requirement.getSource().getCitation());
        }
        return dto;
    }

    private ImageDTO convertImageToDTO(BreedImage image) {
        ImageDTO dto = new ImageDTO();
        dto.setId(image.getId());
        dto.setUrl(image.getUrl());
        dto.setCaption(image.getCaption());
        dto.setLicense(image.getLicense());
        dto.setAttribution(image.getAttribution());
        dto.setIsPrimary(image.getIsPrimary());
        return dto;
    }
}
