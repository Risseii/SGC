package com.codingdojo.vany.servicios;

import java.util.List;
import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.codingdojo.vany.modelos.LoginUser;
import com.codingdojo.vany.modelos.Message;
import com.codingdojo.vany.modelos.NoConformity;
import com.codingdojo.vany.modelos.User;
import com.codingdojo.vany.repositorios.MessageRepository;
import com.codingdojo.vany.repositorios.NoConformityRepository;
import com.codingdojo.vany.repositorios.UserRepository;

@Service
public class AppService {
	
	//no es necesario colocar el constructor,solo se usa en servicio o controlador
		@Autowired
		private UserRepository repositorio_user;
		
		//agregar otro
		@Autowired
		private MessageRepository repositorio_message;
		
		@Autowired
		private NoConformityRepository repositorio_noconformidad;
		
		//registro
		public User register(User nuevoUsuario,BindingResult result) {
			
			String nuevoEmail = nuevoUsuario.getEmail();
			
			//revisar si el correo existe en la BD 
			if(repositorio_user.findByEmail(nuevoEmail).isPresent()) {
				result.rejectValue("email", "Unique","El correo fue ingresado previamente");
			}
			
			if(! nuevoUsuario.getPassword().equals(nuevoUsuario.getConfirm()) ) {
				result.rejectValue("confirm", "Matches","Las contraseñas no coinciden");
			}
			
			if(result.hasErrors()) {
				return null;
			} else {
				//encriptar la contraseña
				String contra_encr = BCrypt.hashpw(nuevoUsuario.getPassword(),BCrypt.gensalt());
				nuevoUsuario.setPassword(contra_encr);
				//guardo usuario
				return repositorio_user.save(nuevoUsuario);
			}
			
		}
		
		public User Login(LoginUser nuevoLogin, BindingResult result) {
			
			if(result.hasErrors()) {
				return null;
			}
			
			//buscamos por correo
			Optional<User> posibleUsuario = repositorio_user.findByEmail(nuevoLogin.getEmail());
			if(!posibleUsuario.isPresent()) {
				result.rejectValue("email", "Unique", "Correo ingresado no existe");
				return null;
			}
			
			User user_login = posibleUsuario.get(); 
			
			//comparacion contraseñas no encriptada con la encriptada
			if(! BCrypt.checkpw(nuevoLogin.getPassword(), user_login.getPassword())) {
				result.rejectValue("password","Matches","Contraseña inválida");
			}
			
			if(result.hasErrors()){
				return null;
			} else {
				return user_login;
			}
			
			
		}
		
		//guardar mensajes
		public Message save_message(Message thisMessage) {
			return repositorio_message.save(thisMessage);
		}
		
		//mostrar los mensajes
		public List<Message> get_messages(){
			return repositorio_message.findAll();
		}
		
		//guardar la NC
		public NoConformity save_noconformity(NoConformity thisNoConformity) {
			return repositorio_noconformidad.save(thisNoConformity);
		}
		
		//mostrar las NC
		public List<NoConformity> get_noconformity(){
			return repositorio_noconformidad.findAll();
		}
		
		//buscar el ID de la NC
		public NoConformity find_noconformidad(Long id) {
			Optional<NoConformity> optionalNc = repositorio_noconformidad.findById(id);
			if(optionalNc.isPresent()) {
				return optionalNc.get();
			}else {
				return null;
			}
		}
		
		//eliminar la NC
	    public void delete_noconformity(Long id) {
	    	repositorio_noconformidad.deleteById(id);
	    }
		
		//probando
	    public Long count(String tipo) {

	        return repositorio_noconformidad.countByTipo(tipo);
	    }

}
