package com.calculator.api.services;

import com.calculator.api.model.user;
import com.calculator.api.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;
@Service
public class AuthService {
    @Autowired
    private UserRepository userRepository;

    public Optional<user> login(String usuario, String pass) {
        return userRepository.findByUsuarioAndPass(usuario, pass);
    }
}

