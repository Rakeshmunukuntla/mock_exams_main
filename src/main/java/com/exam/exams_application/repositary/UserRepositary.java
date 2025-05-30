package com.exam.exams_application.repositary;

import com.exam.exams_application.entity.UserEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepositary extends JpaRepository<UserEntity,Integer>
{
    Optional<UserEntity> findByEmail(String email);

    // Find user by name
    Optional<UserEntity> findByName(String name);

    // Check if user exists by email
    boolean existsByEmail(String email);

    // Find user by email and password
    Optional<UserEntity> findByEmailAndPassword(String email, String password);
}
