class Vendedor{
	var certificaciones = []
	
	method agregarCertificacion(unaCertificacion) = certificaciones.add(unaCertificacion)

	method esVersatil() = certificaciones.size() >= 3 and self.tieneCertificadoDeProducto() and self.tieneCertificadoQueNoEsDeProducto()
	method tieneCertificadoDeProducto() = certificaciones.any{ c => c.esDeProducto() }
	method tieneCertificadoQueNoEsDeProducto() = certificaciones.any{ c => !c.esDeProducto() }
	
	method esFirme(){ 
		return certificaciones.sum{certificacion => certificacion.puntos()} >= 30
	}
	
	method esInfluyente() = false
}

class Fijo inherits Vendedor{
	var property ciudad
	
	method puedeTrabajarEn(unaCiudad) = unaCiudad == ciudad
	
}

class Viajante inherits Vendedor{
	var provincias = []
	
	method agregarProvincia(unaProvincia) = provincias.add(unaProvincia)
	
	method puedeTrabajarEn(unaCiudad) = provincias.contains(unaCiudad.provincia())
	
	override method esInfluyente() = provincias.sum({p => p.poblacion()}) >= 10000000
}

class ComercioCorresponsal inherits Vendedor{
	var ciudades = []
	
	method agregarCiudad(unaCiudad) = ciudades.add(unaCiudad)
	
	method puedeTrabajarEn(unaCiudad) = ciudades.contains(unaCiudad)
	
	override method esInfluyente() = ciudades.size() >= 5 or self.estaEnMuchasProvincias()
	
	method estaEnMuchasProvincias() = ciudades.map{ c => c.provincia() }.withoutDuplicates().size() >= 3
}


class Certificacion{
	
	const property puntos
	var property esDeProducto = false
	
}