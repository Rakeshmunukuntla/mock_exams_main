package com.exam.exams_application.service;

import com.exam.exams_application.entity.CertificationEntity;
import com.exam.exams_application.repositary.CertificationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CertificationServices
{
    @Autowired
    private CertificationRepo certificationRepo;

    public void saveCertificate(CertificationEntity entity)
    {
        certificationRepo.save(entity);
    }

}
