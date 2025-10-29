package com.livestockapi.controller;

import com.livestockapi.dto.SpeciesDTO;
import com.livestockapi.service.SpeciesService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/species")
@RequiredArgsConstructor
@Tag(name = "Species", description = "Livestock species management")
public class SpeciesController {

    private final SpeciesService speciesService;

    @GetMapping
    @Operation(summary = "Get all species", description = "Returns a list of all livestock species")
    public ResponseEntity<List<SpeciesDTO>> getAllSpecies() {
        return ResponseEntity.ok(speciesService.findAll());
    }

    @GetMapping("/{id}")
    @Operation(summary = "Get species by ID", description = "Returns a single species by ID")
    public ResponseEntity<SpeciesDTO> getSpeciesById(@PathVariable Long id) {
        return ResponseEntity.ok(speciesService.findById(id));
    }
}
