package com.livestockapi.repository;

import com.livestockapi.entity.BreedCharacteristic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CharacteristicRepository extends JpaRepository<BreedCharacteristic, Long> {
    
    List<BreedCharacteristic> findByBreedId(Long breedId);
    
    List<BreedCharacteristic> findByBreedIdAndCharacteristicType(Long breedId, String characteristicType);
}
