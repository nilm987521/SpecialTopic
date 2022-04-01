package net.ddns.iiiedug02.model.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.ddns.iiiedug02.model.bean.StudentAnalysis;
import net.ddns.iiiedug02.model.repository.StudentAnalRepository;



@Service
@Transactional
public class StudentAnalService {
	
	@Autowired
	private StudentAnalRepository analRepo;
	
	public StudentAnalysis findById(Integer id) {
		Optional<StudentAnalysis> op1 = analRepo.findById(id);
		
		if(op1.isEmpty()) {
			return null;
		}
		return op1.get();
		
	}
	
	public List<StudentAnalysis> findAll(){
		return analRepo.findAll();
	}
	
	public void  insert(StudentAnalysis an){
		analRepo.save(an);
	}
}