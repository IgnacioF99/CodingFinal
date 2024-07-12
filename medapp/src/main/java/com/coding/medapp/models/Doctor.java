package com.coding.medapp.models;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.PrePersist;
import jakarta.persistence.PreUpdate;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;

@Entity
@Table(name="doctors")
public class Doctor {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull(message="Must be required")
	private Long license;
	
	@Column(updatable=false)
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date createdAt;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date updatedAt;

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "user_id")
	private User doctor;
	
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "doctor_has_specialities",
		joinColumns = @JoinColumn(name = "doctor_id"),
		inverseJoinColumns = @JoinColumn(name = "speciality_id")
	)
	private List<Speciality> specialitiesDoctor;

	@OneToMany(mappedBy = "doctor", fetch = FetchType.LAZY)
	private List<MedicalAppointment> medicalAppointments;

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(
		name = "doctor_has_insurances",
		joinColumns = @JoinColumn(name = "doctor_id"),
		inverseJoinColumns = @JoinColumn(name = "healthInsurance_id")
	)
	private List<HealthInsurance> insurance;

	//---------------------- Constructor Empty --------------
	public Doctor() {}
	//---------------------- Constructor Empty ---------------

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getLicense() {
		return license;
	}

	public void setLicense(Long license) {
		this.license = license;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	public Date getUpdatedAt() {
		return updatedAt;
	}

	public void setUpdatedAt(Date updatedAt) {
		this.updatedAt = updatedAt;
	}

	
	//------------ Getters And Setters ----------
	
	//------------ PrePersist -------------------
	
	public User getDoctor() {
		return doctor;
	}

	public void setDoctor(User doctor) {
		this.doctor = doctor;
	}

	public List<Speciality> getSpecialitiesDoctor() {
		return specialitiesDoctor;
	}

	public void setSpecialitiesDoctor(List<Speciality> specialitiesDoctor) {
		this.specialitiesDoctor = specialitiesDoctor;
	}

	public List<MedicalAppointment> getMedicalAppointments() {
		return medicalAppointments;
	}

	public void setMedicalAppointments(List<MedicalAppointment> medicalAppointments) {
		this.medicalAppointments = medicalAppointments;
	}

	public List<HealthInsurance> getInsurance() {
		return insurance;
	}

	public void setInsurance(List<HealthInsurance> insurance) {
		this.insurance = insurance;
	}

	@PrePersist //Before creating a user
	protected void onCreate() {
		this.createdAt = new Date(); //Default current_timestamp
	}
	
	
	@PreUpdate //before update
	protected void onUpdate() {
		this.updatedAt = new Date(); //default current_timestamp on update current_timestamp
	
	}
	
	//------------ PrePersist -------------------
}
