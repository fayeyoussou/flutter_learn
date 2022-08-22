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
public class SaisonChampionnat {
    @javax.persistence.Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long Id;
    private String saison;
    @ManyToOne
    @JoinColumn(name="championnat_id")
    private Championnat championnat;
    @ManyToMany(fetch = FetchType.LAZY,cascade = CascadeType.ALL)
    @JoinTable(
            name = "saisons_championnat_club",
            joinColumns = {@JoinColumn(name="saison")},
            inverseJoinColumns = {@JoinColumn(name = "club_id")}
    )
    private List<Club> clubs;

}
