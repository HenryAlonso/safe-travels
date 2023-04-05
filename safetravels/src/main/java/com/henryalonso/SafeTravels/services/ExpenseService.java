package com.henryalonso.SafeTravels.services;

import java.util.List;
import java.util.Optional;

import org.springframework.stereotype.Service;

import com.henryalonso.SafeTravels.models.Expense;
import com.henryalonso.SafeTravels.repositories.ExpenseRepository;

@Service
public class ExpenseService {
	//adding expense repository as a dependency
	private final ExpenseRepository expenseRepository;
	
	public ExpenseService(ExpenseRepository expenseRepository) {
		this.expenseRepository = expenseRepository;
	}
	
	//returns all expenses
	public List<Expense> allExpenses() {
		return expenseRepository.findAll();
	}
	//returns one expense
	public Expense findExpenseEntry(Long id) {
		Optional<Expense> optionalExpense = expenseRepository.findById(id);
		if(optionalExpense.isPresent()) {
			return optionalExpense.get();
		} else {
			return null;
		}
	}
	//adds an expense
	public Expense addExpenseEntry(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	// updates an expense
	public Expense updateExpenseEntry(Expense expense) {
		return expenseRepository.save(expense);
	}
	
	//deletes an expense
	public void deleteExpenseEntry(Expense expense) {
		expenseRepository.delete(expense);
	}
	
	
}
