package com.example.backend.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.example.backend.model.Usuario;
import com.example.backend.service.UsuarioService;

@RestController
@RequestMapping("/api/usuario")
public class UsuarioController {

	@Autowired
	private UsuarioService usuarioService;

	@GetMapping
	public List<Usuario> obterTodos() {
		return usuarioService.obterTodos();
	}
	
	@GetMapping("/{id}")
	public Optional<Usuario> obterporId(@PathVariable Integer id) {
		return usuarioService.obterPorId(id);
	}
	
	@PostMapping
	public Usuario adicionar(@RequestBody Usuario usuario) {
		return usuarioService.adicionar(usuario);
	}
	
	@DeleteMapping("/{id}")
	public void deletar(@PathVariable Integer id) {
		usuarioService.deletar(id);
	}
	
	@PutMapping("/{id}")
	public Usuario atualizar(@PathVariable Integer id, @RequestBody Usuario usuario) {
		return usuarioService.atualizar(id, usuario);
	}

}