package com.bank.demo.Repository;

import com.bank.demo.Model.UserDetail;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface UserDetialRepo extends JpaRepository<UserDetail,Integer> {
    Optional<UserDetail> findByEmail(String email);

//    @Override
//    List<UserDetail> findAllById(Iterable<Integer> integers);


    Optional<UserDetail> findById(Integer integer);

    UserDetail findByusername(String username);
}
