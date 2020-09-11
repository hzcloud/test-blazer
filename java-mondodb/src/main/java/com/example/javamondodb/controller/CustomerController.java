package com.example.javamondodb.controller;

import com.example.javamondodb.model.ApiResponse;
import com.example.javamondodb.model.Customer;
import com.example.javamondodb.repository.CustomerRepository;
import com.example.javamondodb.utils.ApiResponseUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@CrossOrigin(origins = "http://localhost:8081")
@RestController
@RequestMapping("/api")
public class CustomerController {

    @Autowired
    CustomerRepository customerRepository;

    @GetMapping("/customers")
    public ResponseEntity<Object> getAllCustomers() {


        ApiResponse response = null;
        try {
            List<Customer> costumers = new ArrayList<Customer>();

            customerRepository.findAll().forEach(costumers::add);


            if (costumers.isEmpty()) {
                response = ApiResponseUtils.Error("No records");
                return new ResponseEntity<>(response, response.getStatus());
            }
            response = ApiResponseUtils.Ok("Customers obtained. Request completed successfully", costumers);

            return new ResponseEntity<>(response, response.getStatus());
        } catch (Exception e) {
            response = ApiResponseUtils.Error(e.getMessage());

            return new ResponseEntity<>(response, response.getStatus());
        }
    }


    @PostMapping("/customers")
    public ResponseEntity<Object> createCustomer(@RequestBody Customer customer) {

        ApiResponse response = null;

        try {
            Customer _customer = customerRepository.save(new Customer(customer.getFirstName(), customer.getLastName(), customer.getEmail(), customer.getPhoneNumber()));

            response = ApiResponseUtils.Ok("Customer added. Registration completed successfully.", _customer);
            return new ResponseEntity<>(response, response.getStatus());
        } catch (Exception e) {
            response = ApiResponseUtils.Error(e.getMessage());

            return new ResponseEntity<>(response, response.getStatus());
        }

    }


}