package com.example.wwwduongtuankietlab05.repositories;

import com.example.wwwduongtuankietlab05.models.Address;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AddressRepository extends JpaRepository<Address, Long> {
}
