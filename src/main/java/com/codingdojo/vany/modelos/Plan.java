package com.codingdojo.vany.modelos;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="plan")
public class Plan {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
	
	@NotEmpty(message="¡La actividad es obligatoria!")
	private String actividad;
	
	@NotEmpty(message="¡El responsable es obligatorio!")
	private String responsable;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fechapro;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date fechareal;
	
	private String conformidad;
	
	private String author;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date created_at;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updated_at;
	
	//relacion uno a uno
	@OneToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="noconformity_id")
	private NoConformity conformity;

	//constructor
	public Plan() {
		
	}

	//getters and setters
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getActividad() {
		return actividad;
	}

	public void setActividad(String actividad) {
		this.actividad = actividad;
	}

	public String getResponsable() {
		return responsable;
	}

	public void setResponsable(String responsable) {
		this.responsable = responsable;
	}

	public Date getFechapro() {
		return fechapro;
	}

	public void setFechapro(Date fechapro) {
		this.fechapro = fechapro;
	}

	public Date getFechareal() {
		return fechareal;
	}

	public void setFechareal(Date fechareal) {
		this.fechareal = fechareal;
	}

	public String getConformidad() {
		return conformidad;
	}

	public void setConformidad(String conformidad) {
		this.conformidad = conformidad;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public NoConformity getConformity() {
		return conformity;
	}

	public void setConformity(NoConformity conformity) {
		this.conformity = conformity;
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
