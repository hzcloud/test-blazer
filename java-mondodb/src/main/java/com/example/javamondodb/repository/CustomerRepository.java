package com.example.javamondodb.repository;
import java.util.List;

import com.example.javamondodb.model.Customer;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CustomerRepository extends MongoRepository<Customer, String> {

}