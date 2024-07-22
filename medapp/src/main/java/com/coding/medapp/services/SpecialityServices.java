package com.coding.medapp.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.coding.medapp.models.Doctor;
import com.coding.medapp.models.Speciality;
import com.coding.medapp.repository.SpecialityRepository;

@Service
public class SpecialityServices {
    
	@Autowired
    private SpecialityRepository specialityRepository;
	
	@Autowired
	private DoctorServices doctorServices;
    
    public List<Speciality> findAllSpecialties(){
    	return specialityRepository.findAll();
    }
    
    public Speciality getSpeciality(Long id) {
    	return specialityRepository.findById(id).orElse(null);
    }
    	
    public  void addSpeciality(Long doctorId, Long specialityId) {
    	Doctor myDoctor = doctorServices.getDoctor(doctorId);
    	Speciality mySpeciality = getSpeciality(specialityId);
    	
    	// Verifica si la especialidad ya está presente
        if (myDoctor.getSpecialitiesDoctor().contains(mySpeciality)) {
            // Si ya la tiene, no la agrega
            return;
        }
    	
    	myDoctor.getSpecialitiesDoctor().add(mySpeciality);
    	doctorServices.saveDoctor(myDoctor);
    }
    
    

    
}
