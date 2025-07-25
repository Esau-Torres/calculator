package com.calculator.api.repository;

import com.calculator.api.model.user;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface UserRepository extends JpaRepository<user, Long> {
    Optional<user> findByUsuarioAndPass(String usuario, String pass);
}
