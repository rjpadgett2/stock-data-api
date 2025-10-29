package com.livestockapi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CareRequirementDTO {
    private Long id;
    private String careCategory;
    private String requirement;
    private String priority;
    private String notes;
    private String sourceCitation;
}
