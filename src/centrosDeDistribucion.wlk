import vendedores.*

class CentroDistribucion {
	var vendedores = [] 
	var sucursales = []
//	var clientes = []
	var ciudad
	
	method ubicacion(unaCiudad) = unaCiudad == ciudad
	
	method agregarSucursal(unaSucursal) = sucursales.add(unaSucursal)
	
//	method agregarCliente(unCliente) = clientes.add(unCliente)
	
	method agregarVendedor(unVendedor){
		if (vendedores.contains(unVendedor)){self.error("Este Trabajador ya existe en este Centro")}else{vendedores.add(unVendedor)}
		}
		
	method vendedorEstrella() = vendedores.max{unVendedor => unVendedor.totalPuntos()}
	
	method cubrirCiudad(unaCiudad) = vendedores.any{unVendedor => unVendedor.puedeTrabajarEn(unaCiudad)}
	
	method vendedoresGenericos(){
		return vendedores.filter{unVendedor => unVendedor.tieneCertificadoQueNoEsDeProducto()}
	}
	
	method esRobusto(){
		return vendedores.count{unVendedor => unVendedor.esFirme()} >= 3
	}
	
	method repartirCertificacion(certificacion){
		vendedores.forEach{unVendedor => unVendedor.agregarCertificacion(certificacion)}
	}
	
	method vendedorCandidato() = vendedores.filter{unVendedor => unVendedor.puedeTrabajarEn(ciudad) and unVendedor.esVersatil()}
	
	method atenderClienteInseguro() = vendedores.filter{unVendedor => unVendedor.esVersatil() and unVendedor.esFirme()}
	method atenderClienteDetallista() = vendedores.filter{unVendedor => unVendedor.totalCertificacionesEsProducto() >= 3}
	method atenderClienteHumanista() = vendedores.filter{unVendedor => unVendedor.personaFisica()}
	
}

class Ciudad{
	var provincia
	
	method provincia() = provincia
}

class Provincia {
	var property poblacion
}

class SucursalDelCentro{
	var ciudad
	
	method ubicacion(unaCiudad) = unaCiudad == ciudad
}

class CertificacionCentro{
	const property puntos
	var property esDeProducto = false
}

//class ClienteInseguro{}
//class ClienteDetallista{}
//class ClienteHumanista{}