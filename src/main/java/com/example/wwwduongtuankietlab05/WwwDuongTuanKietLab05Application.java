package com.example.wwwduongtuankietlab05;

import com.example.wwwduongtuankietlab05.models.Address;
import com.example.wwwduongtuankietlab05.models.Candidate;
import com.example.wwwduongtuankietlab05.models.Experience;
import com.example.wwwduongtuankietlab05.repositories.*;
import com.neovisionaries.i18n.CountryCode;
import net.datafaker.Faker;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

import java.time.LocalDate;
import java.time.ZoneId;
import java.util.concurrent.TimeUnit;

@SpringBootApplication
public class WwwDuongTuanKietLab05Application {

    @Autowired
    private ExperienceRepository experienceRepository;

    @Autowired
    private CandidateRepository candidateRepository;

    @Autowired
    private SkillRepository skillRepository;

    @Autowired
    private CompanyRepository companyRepository;

    @Autowired
    private JobRepository jobRepository;

    @Autowired
    private AddressRepository addressRepository;


    public static void main(String[] args) {
        SpringApplication.run(WwwDuongTuanKietLab05Application.class, args);
    }

    @Bean
    CommandLineRunner commandLineRunner(){
        return args -> {
          Faker faker = new Faker();

          try{
              for(int i = 0; i < 20; i++){
                  // Address
                  Address address = Address.builder()
                          .country(CountryCode.getByCode(faker.address().countryCode()))
                          .street(faker.address().streetName())
                          .city(faker.address().city())
                          .zipcode(faker.address().zipCode())
                          .number(faker.address().streetAddress())
                          .build();
                  addressRepository.save(address);

                  //Experience
//                  LocalDate fromDate = faker.date().past(365, TimeUnit.DAYS).toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
//                  LocalDate toDate = fromDate.plusDays(faker.number().numberBetween(1, 30));
//                  Experience experience = Experience.builder()
//                          .companyName(faker.company().name())
//                          .fromDate(fromDate)
//                          .role(faker.job().title())
//                          .toDate(toDate)
//                          .workDescription(faker.lorem().sentence())
//                          .candidate(Candidate.builder().id(i).build())
//                          .build();
//                  experienceRepository.save(experience);


              }
          }catch (Exception e){
             System.out.println(e.getMessage());
          }


        };
    }

}
