package entities;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.time.LocalDate;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Dog {
    @Id@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "dog_id")
    private int id;

    private String name;

    private String breed;

    private LocalDate birthDate;
}
