package com.example.wwwduongtuankietlab05.models;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Table(name = "company")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@Builder
public class Company {
    @Id
    @Column(name = "com_id", columnDefinition = "bigint(20)")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(columnDefinition = "varchar(255)", name = "comp_name", nullable = false)
    private String name;
    @Column(columnDefinition = "varchar(2000)")
    private String about;
    @OneToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "add_id", referencedColumnName = "add_id", nullable = false)
    private Address address;
    @Column(columnDefinition = "varchar(255)", nullable = false)
    private String phone;
    @Column(columnDefinition = "varchar(255)", name = "web_url")
    private String webURL;
    @OneToMany(mappedBy = "company")
    @ToString.Exclude
    private List<Job> jobs;
    @Column(columnDefinition = "varchar(255)", nullable = false)
    private String email;

    @Override
    public String toString() {
        return "Company{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", about='" + about + '\'' +
                ", address=" + address.getId() +
                ", phone='" + phone + '\'' +
                ", webURL='" + webURL + '\'' +
                ", email='" + email + '\'' +
                '}';
    }
}
