package com.example.demo.repository;

import com.example.demo.entity.Account;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface AccountRepository extends CrudRepository<Account, Integer> {
    Account findByAccountId(int id);
    boolean existsByUsernameAndPassword(String var1, String var2);
}
