import centrosDeDistribucion.*

class Vendedor{
	var certificaciones = []
	
	method esVersatil() = certificaciones.size() >= 3 and self.tieneCertificadoDeProducto() and self.tieneCertificadoQueNoEsDeProducto()
	method tieneCertificadoDeProducto() = certificaciones.any{ c => c.esDeProducto() }
	method tieneCertificadoQueNoEsDeProducto() = certificaciones.any{ c => !c.esDeProducto() }
	
	method esFirme() = certificaciones.sum() >= 30
	method esInfluyente() = false
}

class Fijo inherits Vendedor{
	var ciudad
	
	method puedeTrabajarEn(unaCiudad) = unaCiudad == ciudad
	
}

class Viajante inherits Vendedor{
	var provincias = []
	
	method puedeTrabajarEn(unaCiudad) = provincias.contains(unaCiudad.provincia())
	
	override method esInfluyente() = provincias.sum({p => p.poblacion()}) >= 10000000
}

class ComercioCorresponsal inherits Vendedor{
	var ciudades = []
	
	method puedeTrabajarEn(unaCiudad) = ciudades.contains(unaCiudad)
	
	override method esInfluyente() = ciudades.size() >= 5 or self.estaEnMuchasProvincias()
	
	method estaEnMuchasProvincias() = ciudades.map{ c => c.provincia() }.withoutDuplicates().size() >= 3
}


class Certificacion{
	
	const puntos
	var property esDeProducto = false
	
}