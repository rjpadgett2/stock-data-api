package com.livestockapi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BreedDetailDTO {
    private Long id;
    private String name;
    private String[] alternateNames;
    private String speciesName;
    private String originCountry;
    private String originRegion;
    private String description;
    private String purpose;
    private List<CharacteristicDTO> characteristics;
    private List<CareRequirementDTO> careRequirements;
    private List<ImageDTO> images;
}
