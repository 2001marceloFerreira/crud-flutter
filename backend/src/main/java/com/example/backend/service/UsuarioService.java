package com.example.backend.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.backend.model.Usuario;
import com.example.backend.repository.UsuarioRepository;

@Service
public class UsuarioService {

	@Autowired
	private UsuarioRepository usuarioRepository;

	public List<Usuario> obterTodos() {
		return usuarioRepository.findAll();
	}

	public Optional<Usuario> obterPorId(Integer id) {
		return usuarioRepository.findById(id);
	}

	public Usuario adicionar(Usuario usuario) {
		usuario.setId(null);
		return usuarioRepository.save(usuario);
	}

	public void deletar(Integer id) {
		usuarioRepository.deleteById(id);
	}

	public Usuario atualizar(Integer id, Usuario usuario) {
		usuario.setId(id);
		return usuarioRepository.save(usuario);
	}

}