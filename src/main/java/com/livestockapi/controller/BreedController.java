package com.livestockapi.controller;

import com.livestockapi.dto.BreedDTO;
import com.livestockapi.dto.BreedDetailDTO;
import com.livestockapi.dto.CareRequirementDTO;
import com.livestockapi.dto.CharacteristicDTO;
import com.livestockapi.service.BreedService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.Parameter;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/breeds")
@RequiredArgsConstructor
@Tag(name = "Breeds", description = "Livestock breed information")
public class BreedController {

    private final BreedService breedService;

    @GetMapping
    @Operation(summary = "Get all breeds", 
               description = "Returns a paginated list of livestock breeds with optional filtering")
    public ResponseEntity<Page<BreedDTO>> getAllBreeds(
            @Parameter(description = "Filter by species ID")
            @RequestParam(required = false) Long speciesId,
            @Parameter(description = "Filter by origin country")
            @RequestParam(required = false) String originCountry,
            @Parameter(description = "Page number (0-based)")
            @RequestParam(defaultValue = "0") int page,
            @Parameter(description = "Page size")
            @RequestParam(defaultValue = "20") int size,
            @Parameter(description = "Sort by field")
            @RequestParam(defaultValue = "name") String sortBy,
            @Parameter(description = "Sort direction (asc or desc)")
            @RequestParam(defaultValue = "asc") String sortDirection) {
        
        Sort.Direction direction = sortDirection.equalsIgnoreCase("desc") 
            ? Sort.Direction.DESC 
            : Sort.Direction.ASC;
        Pageable pageable = PageRequest.of(page, size, Sort.by(direction, sortBy));
        
        return ResponseEntity.ok(breedService.findAll(speciesId, originCountry, pageable));
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get breed by ID", 
               description = "Returns detailed information about a specific breed including characteristics and care requirements")
    public ResponseEntity<BreedDetailDTO> getBreedById(@PathVariable Long id) {
        return ResponseEntity.ok(breedService.findById(id));
    }

    @GetMapping("/search")
    @Operation(summary = "Search breeds", 
               description = "Search breeds by name, species, or origin country")
    public ResponseEntity<List<BreedDTO>> searchBreeds(
            @Parameter(description = "Search query", required = true)
            @RequestParam String query) {
        return ResponseEntity.ok(breedService.search(query));
    }

    @GetMapping("/{id}/characteristics")
    @Operation(summary = "Get breed characteristics", 
               description = "Returns all characteristics for a specific breed with optional filtering by type")
    public ResponseEntity<List<CharacteristicDTO>> getCharacteristics(
            @PathVariable Long id,
            @Parameter(description = "Filter by characteristic type (e.g., weight, height, temperament)")
            @RequestParam(required = false) String type) {
        return ResponseEntity.ok(breedService.getCharacteristics(id, type));
    }

    @GetMapping("/{id}/care")
    @Operation(summary = "Get care requirements", 
               description = "Returns all care requirements for a specific breed with optional filtering by category")
    public ResponseEntity<List<CareRequirementDTO>> getCareRequirements(
            @PathVariable Long id,
            @Parameter(description = "Filter by care category (e.g., feeding, housing, healthcare)")
            @RequestParam(required = false) String category) {
        return ResponseEntity.ok(breedService.getCareRequirements(id, category));
    }
}
