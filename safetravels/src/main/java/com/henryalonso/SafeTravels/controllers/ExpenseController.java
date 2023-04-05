package com.henryalonso.SafeTravels.controllers;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.henryalonso.SafeTravels.models.Expense;
import com.henryalonso.SafeTravels.services.ExpenseService;

@Controller
public class ExpenseController {
	@Autowired
	ExpenseService expenseService;
	
	@GetMapping("/")
	public String home() {
		return "redirect:/expenses";
	}
	
	@GetMapping("/expenses")
	public String index(@ModelAttribute("expense") Expense expense, Model model) {
		List<Expense> expenses = expenseService.allExpenses();
		model.addAttribute("expenses", expenses);
		return "index.jsp";
	}
	
	@PostMapping("/expenses/new")
	public String createExpense(
			@Valid @ModelAttribute("expense") Expense expense, 
			BindingResult result, Model model ) {
		if (result.hasErrors()) {
			List<Expense> expenses = expenseService.allExpenses();
			model.addAttribute("expenses", expenses);
			return "index.jsp";
		} else {			
			expenseService.addExpenseEntry(expense);
			return "redirect:/expenses";
		}
	}
	
	@GetMapping("/expenses/edit/{id}")
	public String editExpense(
		@PathVariable("id") Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpenseEntry(id));
		return "edit.jsp";
	}
	
	@GetMapping("/expenses/show/{id}")
	public String showOne(@PathVariable("id") Long id, Model model) {
		model.addAttribute("expense", expenseService.findExpenseEntry(id));
		return "show.jsp";
	}
	
	@PostMapping("/expenses/edit/{id}")
	public String update(
			@PathVariable("id") Long id, 
			Model model, 
			@Valid @ModelAttribute("expense") Expense expense, 
			BindingResult result) {
		if(result.hasErrors()) {
			model.addAttribute("expense", expenseService.findExpenseEntry(id));
			return "redirect:/edit/{id}";
		}else {
			expenseService.updateExpenseEntry(expense);
			return "redirect:/expenses";
		}
	}
	
	@GetMapping("/expenses/delete/{id}")
	public String deleteExpense(@PathVariable("id") Long id) {
		Expense expense = expenseService.findExpenseEntry(id);
		expenseService.deleteExpenseEntry(expense);
		return "redirect:/expenses";
	}
	
}
