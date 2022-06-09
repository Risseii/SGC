package com.codingdojo.vany.modelos;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="noconformity")
public class NoConformity {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotNull
	private int number;
	
	@NotEmpty(message="¡El area es obligatorio!")
	private String area;
	
	@NotEmpty(message="¡El proceso es obligatorio!")
	private String proceso;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fecha;
	
	@NotEmpty(message="¡El tipo de fuente es obligatorio!")
	private String fuente;
	
	@NotEmpty(message="¡El tipo de hallazgo es obligatorio!")
	private String tipo;
	
	@NotEmpty(message="¡La descripcion es obligatorio!")
	@Size(min=6, max=128, message="El campo de análisis tiene como mínimo 6 caracteres")
	private String description;
	
	@NotEmpty(message="¡El análisis es obligatorio!")
	@Size(min=6, max=128, message="El campo de análisis tiene como mínimo 6 caracteres")
	private String analisis;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date created_at;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updated_at;
	
	
	//ManytoOne
		@ManyToOne(fetch=FetchType.LAZY)
		@JoinColumn(name="user_id")
		private User user;
		
	//OnetoOne
		@OneToOne(mappedBy="conformity",cascade=CascadeType.ALL,fetch=FetchType.LAZY)
		private Plan plan;

	//constructor
		public NoConformity() {
			
		}

	//getters and setters
		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public int getNumber() {
			return number;
		}

		public void setNumber(int number) {
			this.number = number;
		}

		public String getArea() {
			return area;
		}

		public void setArea(String area) {
			this.area = area;
		}

		public String getProceso() {
			return proceso;
		}

		public void setProceso(String proceso) {
			this.proceso = proceso;
		}

		public Date getFecha() {
			return fecha;
		}

		public void setFecha(Date fecha) {
			this.fecha = fecha;
		}

		public String getFuente() {
			return fuente;
		}

		public void setFuente(String fuente) {
			this.fuente = fuente;
		}

		public String getTipo() {
			return tipo;
		}

		public void setTipo(String tipo) {
			this.tipo = tipo;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getAnalisis() {
			return analisis;
		}

		public void setAnalisis(String analisis) {
			this.analisis = analisis;
		}

		public User getUser() {
			return user;
		}

		public void setUser(User user) {
			this.user = user;
		}
		
		
		public Plan getPlan() {
			return plan;
		}

		public void setPlan(Plan plan) {
			this.plan = plan;
		}

		@PrePersist
		protected void onCreate() {
			this.created_at = new Date();
		}
		
		@PreUpdate
		protected void onUpdate() {
			this.updated_at = new Date();
		}
		
	
		
	
	
	

}
