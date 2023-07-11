package com.trading.auth.controller;

import com.trading.auth.model.Employee;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/v2/user-svc/user")
public class TestV2Controller {

    private List<Employee> employees = new ArrayList<>();


    @GetMapping(produces = { "application/json" })
    public ResponseEntity<List<Employee>> getAll() {
        return ResponseEntity.ok(employees);
    }

    @GetMapping(path = "/{id}", produces = { "application/json" })
    public ResponseEntity<Employee> find(@PathVariable("id") Integer id) {
        Employee employee = employees.stream().filter(employee1 -> (employee1.getId().intValue() == id)).findFirst().get();
        return ResponseEntity.ok(employee);
    }

    @DeleteMapping
    public ResponseEntity<Boolean> delete() {
        return null;
    }

    @PostMapping
    @ResponseBody
    public ResponseEntity<Employee> create(@RequestBody Employee employee) {
        employees.add(employee);
        return ResponseEntity.ok(employee);
    }
}
