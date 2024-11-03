package com.example.wwwduongtuankietlab05.models;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate;
import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Candidate {
    @Column(columnDefinition = "varchar(15)", nullable = false, unique = true)
    private String phone;
    @Id
    @Column(name = "can_id", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(columnDefinition = "date", nullable = false)
    private LocalDate dob;
    @Column(columnDefinition = "varchar(255)", nullable = false, unique = true)
    private String email;
    @Column(columnDefinition = "varchar(255)", name = "full_name", nullable = false)
    private String fullName;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(referencedColumnName = "add_id", name = "add_id", nullable = false)
    private Address address;
    @OneToMany(mappedBy = "candidate")
    @ToString.Exclude
    private List<CandidateSkill> candidateSkills;
    @OneToMany(mappedBy = "candidate")
    @ToString.Exclude
    private List<Experience> experiences;

    public Candidate(long id) {
        this.id = id;
    }

    public Candidate(String phone, LocalDate dob, String email, String fullName, Address address) {
        this.phone = phone;
        this.dob = dob;
        this.email = email;
        this.fullName = fullName;
        this.address = address;
    }

    @Override
    public String toString() {
        return "Candidate{" +
                "phone='" + phone + '\'' +
                ", id=" + id +
                ", dob=" + dob +
                ", email='" + email + '\'' +
                ", fullName='" + fullName + '\'' +
                ", address=" + address.getId() +
                '}';
    }
}
