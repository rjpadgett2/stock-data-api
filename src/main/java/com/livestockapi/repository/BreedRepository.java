package com.livestockapi.repository;

import com.livestockapi.entity.Breed;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface BreedRepository extends JpaRepository<Breed, Long> {
    
    Page<Breed> findBySpeciesId(Long speciesId, Pageable pageable);
    
    Page<Breed> findByOriginCountry(String originCountry, Pageable pageable);
    
    Page<Breed> findBySpeciesIdAndOriginCountry(Long speciesId, String originCountry, Pageable pageable);
    
    @Query("SELECT b FROM Breed b WHERE LOWER(b.name) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<Breed> searchByName(@Param("query") String query);
    
    @Query("SELECT b FROM Breed b JOIN b.species s WHERE " +
           "LOWER(b.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(s.name) LIKE LOWER(CONCAT('%', :query, '%')) OR " +
           "LOWER(b.originCountry) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<Breed> searchByKeyword(@Param("query") String query);
    
    Optional<Breed> findBySpeciesIdAndName(Long speciesId, String name);
    
    boolean existsBySpeciesIdAndName(Long speciesId, String name);
    
    @Query("SELECT COUNT(b) FROM Breed b WHERE b.species.id = :speciesId")
    long countBySpeciesId(@Param("speciesId") Long speciesId);
}
