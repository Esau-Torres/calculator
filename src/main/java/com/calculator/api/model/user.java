package com.calculator.api.model;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "usuario")
@Data
public class user {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nombre;
    private String apellido;
    private int edad;
    private String sexo;

    @Column(name = "f_nacimiento") // se mapea a la columna f_nacimiento
    private String fNacimiento;

    @Column(name = "f_creacion")
    private String fCreacion;

    private String correo;
    private String usuario;
    private String pass;

    @Column(name = "rol_id")
    private int rolId;

    @Column(name = "estado_id")
    private int estadoId;
}
