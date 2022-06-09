package com.codingdojo.vany.controladores;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.codingdojo.vany.modelos.LoginUser;
import com.codingdojo.vany.modelos.Message;
import com.codingdojo.vany.modelos.NoConformity;
import com.codingdojo.vany.modelos.User;
import com.codingdojo.vany.servicios.AppService;

@Controller
public class UserController {
	
	@Autowired
	private AppService servicio;
	
	@GetMapping("/") //La otra forma es con @ModelAttribute
	public String index(Model model) {
		model.addAttribute("nuevoUsuario",new User()); //se crea una nueva instancia vacia de User
		model.addAttribute("nuevoLogin",new LoginUser());
		
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("nuevoUsuario") User nuevoUsuario,
							BindingResult result,Model model,HttpSession session) {
		
		servicio.register(nuevoUsuario, result);
		if(result.hasErrors()) {
			model.addAttribute("nuevoLogin",new LoginUser());
			return "index.jsp";
		}
		
		session.setAttribute("user_session",nuevoUsuario); 
		return "redirect:/dashboard";
		
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("nuevoLogin") LoginUser nuevoLogin,
								BindingResult result,Model model,HttpSession session) {
		
		User user = servicio.Login(nuevoLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("nuevoUsuario",new User());
			return "index.jsp";
		}
		
		session.setAttribute("user_session", user); //estoy guardando en user_session
		return "redirect:/dashboard";
		
	}

	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user_session");
		return "redirect:/";
	}
	
	@GetMapping("/dashboard")
	public String dashboard(HttpSession session,Model model,@ModelAttribute("message") Message message){
		
		//revisar session
		User currentUser = (User)session.getAttribute("user_session");
		
		if(currentUser == null){
			return "redirect:/";
		}
		//revisar session
		
		model.addAttribute("user_session", currentUser);
		//para que se muestren el numero de NC,OM
		Long nc = servicio.count("NC");
		Long om = servicio.count("OM");
		model.addAttribute("show_nc",nc);
		model.addAttribute("show_om", om);
		
		//mostrar mensajes en dashboard
		List<Message> messages = servicio.get_messages();
		model.addAttribute("show_message", messages);
	
		return "dashboard.jsp";
	}
	
	//mensaje
	@PostMapping("/message")
	public String message(@Valid @ModelAttribute("message") Message message, BindingResult result,
						  HttpSession session, Model model) {
		/*REVISAMOS SESION*/
		User currentUser = (User)session.getAttribute("user_session");
		if(currentUser == null) {
			return "redirect:/";
		}
		/*REVISAMOS SESION*/
		
		Long message_id = message.getAdmi().getId();
		
		
		if(result.hasErrors()) {
			model.addAttribute("message", message_id);
			return "dashboard.jsp";
		}
		
		servicio.save_message(message);
		
		return "redirect:/dashboard";
		
		
	}
	
	//mostrar las NC
	@RequestMapping("/show")
	public String show_noconformity(HttpSession session,Model model) {
		//revisar session
		User currentUser = (User)session.getAttribute("user_session");
		
		if(currentUser == null){
			return "redirect:/";
		}
		//revisar session
		model.addAttribute("user_session", currentUser);
		//para que se muestren todos los NC:
		List<NoConformity> noconformity = servicio.get_noconformity();
		model.addAttribute("show_nc",noconformity);
		
		return "show.jsp";
	}
	
	//new NC
	@RequestMapping("/new")
	public String new_noconformity(@ModelAttribute("noconformity")NoConformity noconformity,HttpSession session,Model model) {
		//revisar session
		User currentUser = (User)session.getAttribute("user_session");
		
		if(currentUser == null){
			return "redirect:/";
		}
		//revisar session
		model.addAttribute("user_session", currentUser);
		
		return "new.jsp";
	}
	
	//crear o guardar la NC
	@PostMapping("/create")
	public String create_noconformity(@Valid @ModelAttribute("noconformity")NoConformity noconformity,BindingResult result,Model model,HttpSession session) {
		
		//revisar session
				User currentUser = (User)session.getAttribute("user_session");
				
				if(currentUser == null){
					return "redirect:/";
				}
		//revisar session
		
		
		if(result.hasErrors()) { 
			return "new.jsp";  
		} else {
			servicio.save_noconformity(noconformity);
			return "redirect:/show"; 
		}
	}
	
	
	//editar las NC
	@GetMapping(value="/show/edit/{id}")
	public String edit(@PathVariable("id") Long id,
						Model model,HttpSession session,
						@ModelAttribute("noconformity") NoConformity noconformity) {
		
    	//revisar session
    	User currentUser = (User)session.getAttribute("user_session");
    			
    	if(currentUser == null){
    	return "redirect:/";
    	}
    	//revisar session
    	
		NoConformity nc_edit = servicio.find_noconformidad(id);
		model.addAttribute("noconformity",nc_edit); //El nombre de la izq debe ser el mismo que arriba en ModelAttribute! para que salga la info del guardado
		return "edit.jsp";
		
	}
	
	//guardar el edit
	@PutMapping("/show/edit/{id}")
  	public String update(@PathVariable("id") Long id, @Valid @ModelAttribute("noconformity") NoConformity noconformity,BindingResult result) {
  		if(result.hasErrors()) {
  			return "edit.jsp";	
  		} else{
  			servicio.save_noconformity(noconformity);	
  			return "redirect:/show";
  		}
  	
  	}
	
	//eliminar
	@DeleteMapping("/delete/{noconformity_id}")
		public String delete_noconformity(@PathVariable("noconformity_id")Long noconformity_id,HttpSession session) {
		
		//revisar session
		User currentUser = (User)session.getAttribute("user_session");
			
		if(currentUser == null){
			return "redirect:/";
		}
		//revisar session
		
		servicio.delete_noconformity(noconformity_id);
		return "redirect:/show";
	}
	

}
