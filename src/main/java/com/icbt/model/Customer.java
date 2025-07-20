package com.icbt.model;

public class Customer {
    private int id;
    private String accountNumber;
    private String name;
    private String address;
    private String telephone;

    // Full constructor (with id - used in GET, PUT)
    public Customer(int id, String accountNumber, String name, String address, String telephone) {
        this.id = id;
        this.accountNumber = accountNumber;
        this.name = name;
        this.address = address;
        this.telephone = telephone;
    }

    // Constructor without id (used in POST)
    public Customer(String accountNumber, String name, String address, String telephone) {
        this.accountNumber = accountNumber;
        this.name = name;
        this.address = address;
        this.telephone = telephone;
    }

    // Default constructor
    public Customer() {
    }

    // GETTERS & SETTERS (Used in all CRUD operations)

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    // Optional: toString() for easy display/logging
    @Override
    public String toString() {
        return "Customer ID: " + id + "\n" +
                "Account Number: " + accountNumber + "\n" +
                "Name: " + name + "\n" +
                "Address: " + address + "\n" +
                "Telephone: " + telephone + "\n";
    }
}