package com.livestockapi.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class CharacteristicDTO {
    private Long id;
    private String characteristicType;
    private BigDecimal valueNumeric;
    private String valueText;
    private String unit;
    private String sex;
    private String ageCategory;
    private String notes;
    private String sourceCitation;
}
