package com.exam.exams_application.service;


import com.exam.exams_application.entity.UserEntity;
import com.exam.exams_application.model.UserModel;
import com.exam.exams_application.repositary.UserRepositary;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService
{
    @Autowired
    private UserRepositary userRepositary;

    public UserModel saveAdmin(UserModel user)
    {
        return convertToModel(userRepositary.save(convertToEntity(user)));
    }

    public List<UserModel> getAllAdmins()
    {
        return userRepositary.findAll().stream().map(this::convertToModel).toList();
    }

    public UserModel getAdminById(int id)
    {
        return convertToModel(userRepositary.findById(id).orElse(null));
    }

    public UserModel updateAdmin(UserModel user)
    {
        return convertToModel(userRepositary.save(convertToEntity(user)));
    }

    public void deleteAdmin(int id)
    {
        userRepositary.deleteById(id);
    }

    public UserModel findByEmail(String email)
    {

      if(userRepositary.findByEmail(email).isPresent())
      {
          return convertToModel(userRepositary.findByEmail(email).get());
      }
      return null;

    }

    public UserModel findByEmailAndPassword(String email, String password)
    {
        //return convertToModel(userRepositary.findByEmailAndPassword(email, password).get());
        if(userRepositary.findByEmailAndPassword(email,password).isPresent())
        {
            return convertToModel(userRepositary.findByEmailAndPassword(email,password).get());
        }
        return null;
    }

    public UserModel convertToModel(UserEntity entity)
    {
        UserModel model=new UserModel();
        BeanUtils.copyProperties(entity,model);
        return model;
    }
    public UserEntity convertToEntity(UserModel model)
    {
        UserEntity entity=new UserEntity();
        BeanUtils.copyProperties(model,entity);
        return entity;
    }
}
