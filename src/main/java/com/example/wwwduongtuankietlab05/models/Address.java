package com.example.wwwduongtuankietlab05.models;

import com.neovisionaries.i18n.CountryCode;
import jakarta.persistence.*;
import lombok.*;

@Entity
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Address {
    @Column(columnDefinition = "varchar(50)")
    private String city;
    private CountryCode country;
    @Id
    @Column(name = "add_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(columnDefinition = "varchar(7)")
    private String zipcode;
    @Column(columnDefinition = "varchar(150)", name = "street")
    private String street;
    @OneToOne(mappedBy = "address",fetch = FetchType.EAGER)
    private Candidate candidate;
    @Column(columnDefinition = "varchar(30)")
    private String number;
    @OneToOne(mappedBy = "address",fetch = FetchType.EAGER)
    private Company company;

    @Override
    public String toString() {
        return number + ' ' + street + ' ' + zipcode + ' ' + city + ' ' + country.name();

    }
}
