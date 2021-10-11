import vendedores.*

class CentroDistribucion {
	var vendedores = []
	var ciudad
	
	method ubicacion(unaCiudad) = unaCiudad == ciudad
	
	method agregarVendedor(unVendedor){
		if (vendedores.contains(unVendedor)){self.error("Este Trabajador ya existe en este Centro")}else{vendedores.add(unVendedor)}
		}
		
	method vendedorEstrella() = vendedores.max()
}

class Ciudad{
	var provincia
	
	method provincia() = provincia
}

class Provincia {
	var property poblacion
}