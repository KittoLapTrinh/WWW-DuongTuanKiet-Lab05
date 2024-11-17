package com.example.wwwduongtuankietlab05;

import com.example.wwwduongtuankietlab05.enums.SkillLevel;
import com.example.wwwduongtuankietlab05.enums.SkillType;
import com.example.wwwduongtuankietlab05.models.*;
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

//    @Bean
    CommandLineRunner commandLineRunner(JobSkillRepository jobSkillRepository, CandidateSkillRepository candidateSkillRepository){
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

                  // Candidate
                  Candidate candidate = Candidate.builder()
                          .phone(faker.phoneNumber().phoneNumber())
                          .dob(faker.date().birthday().toInstant().atZone(java.time.ZoneId.systemDefault()).toLocalDate())  // Chuyển đổi ngày sinh sang LocalDate
                          .email(faker.internet().emailAddress())
                          .fullName(faker.name().fullName())
                          .address(address)  // Gắn địa chỉ vào candidate
                          .build();
                  candidateRepository.save(candidate);

                  // Company
                  Company company = Company.builder()
                          .about(faker.lorem().sentence(10))
                          .email(faker.internet().emailAddress())
                          .name(faker.company().name())
                          .phone(faker.phoneNumber().phoneNumber())
                          .webURL(faker.internet().url())
                          .address(address)
                          .build();
                  companyRepository.save(company);

                  //Experience
                  int experienceCount = faker.number().numberBetween(1, 6);

                  for (int j = 0; j < experienceCount; j++) {
                      try {
                          LocalDate fromDate = faker.date().past(365, TimeUnit.DAYS)
                                  .toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
                          LocalDate toDate = fromDate.plusDays(faker.number().numberBetween(1, 30));

                          String companyName = faker.company().name();
                          companyName = companyName.length() > 255 ? companyName.substring(0, 255) : companyName;

                          String role = faker.job().title();
                          role = role.length() > 255 ? role.substring(0, 255) : role;

                          String workDescription = faker.lorem().sentence();
                          workDescription = workDescription.length() > 500 ? workDescription.substring(0, 500) : workDescription;

                          Experience experience = Experience.builder()
                                  .companyName(companyName)
                                  .fromDate(fromDate)
                                  .toDate(toDate)
                                  .role(role)
                                  .workDescription(workDescription)
                                  .candidate(candidate) // Đảm bảo candidate đã được lưu trước đó
                                  .build();

                          experienceRepository.save(experience);
                      } catch (Exception e) {
                          System.out.println("Error creating experience: " + e.getMessage());
                          e.printStackTrace();
                      }
                  }

                  // Job
                  Job job = Job.builder()
                          .description(faker.lorem().sentence(10))
                          .name(faker.job().position())
                          .company(company)
                          .build();
                  jobRepository.save(job);

                  // Skill
                  Skill skill = Skill.builder()
                          .skillDescription(faker.lorem().sentence(faker.number().numberBetween(5, 10)))
                          .type(SkillType.values()[faker.number().numberBetween(0, SkillType.values().length)])
                          .skillName(faker.job().keySkills())
                          .build();
                  skillRepository.save(skill);

                  // JobSkill
                  JobSkill jobSkill = JobSkill.builder()
                          .job(job)
                          .skill(skill)
                          .skillLevel(SkillLevel.values()[faker.number().numberBetween(0, SkillLevel.values().length)])
                          .moreInfo(faker.lorem().sentence(10))
                          .build();
                  jobSkillRepository.save(jobSkill);

                  // CandidateSkill
                  CandidateSkill candidateSkill = CandidateSkill.builder()
                          .candidate(candidate)
                          .skill(skill)
                          .skillLevel(SkillLevel.values()[faker.number().numberBetween(0, SkillLevel.values().length)])
                          .moreInfo(faker.lorem().sentence(10))
                          .build();
                  candidateSkillRepository.save(candidateSkill);
              }




          }catch (Exception e){
             System.out.println(e.getMessage());
          }


        };
    }

}
