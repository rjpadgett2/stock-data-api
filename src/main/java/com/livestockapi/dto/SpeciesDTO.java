package com.livestockapi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SpeciesDTO {
    private Long id;
    private String name;
    private String scientificName;
    private String description;
    private Long breedCount;
}
