public with sharing class Company {

    public String companyName;
    public String ceo;
    public Integer employeeCount;
    public Long revenue;
    //list of custoemrs
    private List<Customer> customers = new List<Customer>();

    //add new customer
    public void addNewCustomer(String customerName, String website, String email, Long phone){
        Customer customer = new Customer(clineName,website,email,phone);
        customers.add(customer);

    }

    //print the list of all customers
    public void getAllCustomers(){
        for(Customer customer : customers){
            System.debug('Customer Name: '+ customer.customerName);
            System.debug('Customer website: '+ customer.website);
            System.debug('Customer email: '+ customer.email);
            System.debug('Customer phone '+ customer.phone);
  }
    }


    public Company() {


    }

    // private inner class to store the customer info
    private class Customer{
        public String customerName;
        public String website;
        public String email;
        public Long phone;

    Customer(String customerName, String website, String email, Long phone){
        this.customerName = customerName;
        this.website = website;
        this.email = email;
        this.phone = phone;
    }

    }
}
