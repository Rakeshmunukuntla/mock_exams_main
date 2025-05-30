package com.exam.exams_application.repositary;

import com.exam.exams_application.entity.CertificationEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CertificationRepo extends JpaRepository<CertificationEntity ,Long>
{

}
