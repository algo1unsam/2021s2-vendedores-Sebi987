import vendedores.*

class CentroDistribucion {
	var vendedores = [] 
	var ciudad
	
	method ciudad() = ciudad

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
	
	method vendedorCandidato() = vendedores.filter{unVendedor => unVendedor.tieneAfinidadA(self) and unVendedor.esVersatil()}
	

}

class Ciudad{
	var provincia
	method provincia() = provincia
}

class Provincia {
	var property poblacion
}

class CertificacionCentro{
	const property puntos
	var property esDeProducto = false
}

class ClienteInseguro{
	method puedeSerAtendidoPor(unVendedor) = unVendedor.esVersatil() and unVendedor.esFirme()
}
class ClienteDetallista{
	method puedeSerAtendidoPor(unVendedor) = unVendedor.totalCertificacionesEsProducto() >= 3
}
class ClienteHumanista{
	method puedeSerAtendidoPor(unVendedor) = unVendedor.personaFisica()
}