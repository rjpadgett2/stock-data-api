package com.livestockapi.entity;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "breeds", uniqueConstraints = {
    @UniqueConstraint(columnNames = {"species_id", "name"})
})
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Breed {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "species_id", nullable = false)
    private Species species;

    @Column(nullable = false, length = 200)
    private String name;

    @Column(name = "alternate_names", columnDefinition = "TEXT[]")
    private String[] alternateNames;

    @Column(name = "origin_country", length = 100)
    private String originCountry;

    @Column(name = "origin_region", length = 100)
    private String originRegion;

    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(length = 100)
    private String purpose;

    @OneToMany(mappedBy = "breed", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BreedCharacteristic> characteristics = new ArrayList<>();

    @OneToMany(mappedBy = "breed", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<CareRequirement> careRequirements = new ArrayList<>();

    @OneToMany(mappedBy = "breed", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<BreedImage> images = new ArrayList<>();

    @CreationTimestamp
    @Column(name = "created_at", nullable = false, updatable = false)
    private LocalDateTime createdAt;

    @UpdateTimestamp
    @Column(name = "updated_at")
    private LocalDateTime updatedAt;
}
