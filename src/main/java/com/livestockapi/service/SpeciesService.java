package com.livestockapi.service;

import com.livestockapi.dto.SpeciesDTO;
import com.livestockapi.entity.Species;
import com.livestockapi.repository.BreedRepository;
import com.livestockapi.repository.SpeciesRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;

@Service
@RequiredArgsConstructor
@Slf4j
public class SpeciesService {

    private final SpeciesRepository speciesRepository;
    private final BreedRepository breedRepository;

    @Transactional(readOnly = true)
    @Cacheable("species")
    public List<SpeciesDTO> findAll() {
        log.debug("Finding all species");
        
        List<Species> species = speciesRepository.findAll();
        return species.stream()
            .map(this::convertToDTO)
            .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    @Cacheable(value = "species", key = "#id")
    public SpeciesDTO findById(Long id) {
        log.debug("Finding species by id: {}", id);
        
        Species species = speciesRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Species not found with id: " + id));
        
        return convertToDTO(species);
    }

    private SpeciesDTO convertToDTO(Species species) {
        SpeciesDTO dto = new SpeciesDTO();
        dto.setId(species.getId());
        dto.setName(species.getName());
        dto.setScientificName(species.getScientificName());
        dto.setDescription(species.getDescription());
        dto.setBreedCount(breedRepository.countBySpeciesId(species.getId()));
        return dto;
    }
}
