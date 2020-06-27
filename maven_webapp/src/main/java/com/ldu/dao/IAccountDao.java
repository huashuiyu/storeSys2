package com.ldu.dao;

import com.ldu.domain.Account;

import java.util.List;

public interface IAccountDao {

    void saveAccount(Account account);
    void deleteAccount(Integer accountId);
    void updateAccount(Account account);
    List<Account> findAllAccount();
    Account findAccountById(Integer accountId);
}
