package com.livestockapi.repository;

import com.livestockapi.entity.Species;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface SpeciesRepository extends JpaRepository<Species, Long> {
    
    Optional<Species> findByName(String name);
    
    boolean existsByName(String name);
}
