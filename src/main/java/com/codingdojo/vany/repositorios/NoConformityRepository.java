package com.codingdojo.vany.repositorios;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.codingdojo.vany.modelos.NoConformity;

@Repository
public interface NoConformityRepository extends CrudRepository<NoConformity,Long>{
	
	List<NoConformity> findAll();
	
	List<NoConformity> findById(long id);
	
	long countByTipo(String tipo);

}
