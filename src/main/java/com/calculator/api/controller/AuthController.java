package com.calculator.api.controller;

import com.calculator.api.model.user;
import com.calculator.api.services.AuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

@RestController
@RequestMapping("/api/auth")
@CrossOrigin(origins = "*")
public class AuthController {

    @Autowired
    private AuthService authService;

    @PostMapping("/login")
    public Map<String, Object> login(@RequestBody Map<String, String> credentials) {
        String usuario = credentials.get("usuario");
        String pass = credentials.get("pass");

        Map<String, Object> response = new HashMap<>();
        // los valores no pueden ser nulos
        if (usuario == null || pass == null || usuario.isEmpty() || pass.isEmpty()) {
            response.put("status", 3);
            return response;
        }

        Optional<user> userOpt = authService.login(usuario, pass);

        if (userOpt.isPresent()) {
            user user = userOpt.get();
            // Validar si el estado_id es activo 1 u otro estado
            if (user.getEstadoId() == 1) {
                response.put("status", 1);
                // se puede enviar el ID, nombre, rol, etc.
                response.put("userId", user.getId());
                response.put("nombre", user.getNombre());
                response.put("estado_Id", user.getEstadoId());
                response.put("rol", user.getRolId());
            } else {
                response.put("status", 2); // Usuario inactivo o bloqueado
            }
        } else {
            response.put("status", 2); // Credenciales incorrectas
        }

        return response;
    }
}
