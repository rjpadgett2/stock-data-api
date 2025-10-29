package com.livestockapi.repository;

import com.livestockapi.entity.CareRequirement;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CareRequirementRepository extends JpaRepository<CareRequirement, Long> {
    
    List<CareRequirement> findByBreedId(Long breedId);
    
    List<CareRequirement> findByBreedIdAndCareCategory(Long breedId, String careCategory);
}
