object casa {
    var property gastosMensuales = 0
    var property cuenta = cuentaCorriente
    var property viveres = 0
    var reparaciones = 0

    method gasto(monto) {
      cuenta.extraer(monto)
      gastosMensuales = gastosMensuales + monto
    }
    method cambiarMes() {
      gastosMensuales = 0
    }
    method romperElementosDeCasa(monto){
      reparaciones += monto
    }
    method reparar() {
      self.gasto(reparaciones)
      reparaciones = 0
    }
    method reparaciones(_reparaciones) {
      reparaciones = _reparaciones
    }
    method comprarViveres(porcentaje,calidad) {
      self.verificarCompra(porcentaje)
      self.gasto(porcentaje * calidad * 100)
      viveres += porcentaje
    }
    method verificarCompra(porcentaje) {
      if (not self.esCompraValida(porcentaje)){
        self.error("Porcentaje ingresado invalido. El porcentaje: " + porcentaje +
        " ingresado supera la capacidad maxima de viveres en la casa")
      }
    }
    method esCompraValida(porcentaje) {
      return porcentaje + viveres < 1
    }
    method hayViveresSuficientes() {
      return viveres >= 0.40
    }
    method hayReparacionesPendientes() {
      return reparaciones > 0
    }
    method casaEnOrden() {
      return self.hayViveresSuficientes() &&  not self.hayReparacionesPendientes()
    }
}
object cuentaCorriente {
    var property saldo = 0

  method extraer(monto) {
    saldo = saldo - monto
  }
  method depositar(monto) {
    saldo = saldo + monto
  }

}
object cuentaConGasto {
    var property saldo = 0
    var property costoOperacion = 1

  method extraer(monto) {
    saldo = saldo - monto
  }
  method depositar(monto) {
    self.validarDeposito(monto)
    saldo = saldo + monto - costoOperacion
  }

  method validarDeposito(monto) {
    if(monto <= costoOperacion){
        self.error("Monto invalido. El monto: " + monto + " es menor que el costo de operacion" + costoOperacion)
    }
  }

}
object cuentaCombinada {
  var property cuentaPrimaria = null
  var property cuentaSecundaria = null

  method saldo() {
    return 0.max(cuentaPrimaria.saldo()) + 0.max(cuentaSecundaria.saldo());
  }
  method depositar(monto) {
    cuentaPrimaria.depositar(monto)
  }
  method extraer(monto) {
    self.validarExtraccion(monto)
    if(monto <= cuentaPrimaria.saldo()){ 
        cuentaPrimaria.extraer(monto)
    }else{
        cuentaSecundaria.extraer(monto - cuentaPrimaria.saldo())
        cuentaPrimaria.extraer(cuentaPrimaria.saldo())
    }
  }
  method validarExtraccion(monto) {
    if (not self.esExtraccionPermitida(monto)){
         self.error("Monto invalido. El monto: " + monto + " supera el saldo de las cuentas conbinadas" )
    }
  }
  method esExtraccionPermitida(monto) {
    return monto < self.saldo()
  }






}
