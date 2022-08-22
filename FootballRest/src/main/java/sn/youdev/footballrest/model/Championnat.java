package sn.youdev.footballrest.model;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@NoArgsConstructor
@Getter
@Setter
@Entity
public class Championnat {
    @javax.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String nom;
    private int numberOfClub;
    @OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL,mappedBy = "championnat")
    private List<SaisonChampionnat> saisons;
}
