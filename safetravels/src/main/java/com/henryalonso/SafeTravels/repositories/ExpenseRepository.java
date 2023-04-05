package com.henryalonso.SafeTravels.repositories;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;
import com.henryalonso.SafeTravels.models.Expense;
import java.util.List;

@Repository
public interface ExpenseRepository extends CrudRepository<Expense, Long> {
	// Brings all expenses from the database
	List<Expense> findAll();
	
	//not sure what other method to make. come back

}
