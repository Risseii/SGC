package com.codingdojo.vany.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.vany.modelos.Message;

@Repository
public interface MessageRepository extends CrudRepository<Message,Long>{

	List<Message> findAll();

}
