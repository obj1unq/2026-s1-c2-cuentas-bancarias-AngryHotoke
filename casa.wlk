object casa {
    var gastosMensuales = 0
    var cuenta = cuentaCorriente

    method cuenta(_cuenta){
        cuenta = _cuenta
    }
    method cuenta(){
        return cuenta
    }
    method gasto(monto) {
      cuenta.extraer(monto)
      gastosMensuales = gastosMensuales + monto
    }
    method cambiarMes() {
      gastosMensuales = 0
    }
    method gastosMensuales() {
      return gastosMensuales
    }
    method gastosMensuales(_gastosMensuales) {
      gastosMensuales = _gastosMensuales
    }
}
object julian {
}
object pepe{
}
object cuentaCorriente {
    var saldo = 0

  method saldo() {
    return saldo
  }
  method extraer(monto) {
    saldo = saldo - monto
  }
  method depositar(monto) {
    saldo = saldo + monto
  }
  method saldo(_saldo) {
    saldo = _saldo
  }

}
object cuentaConGasto {
    var saldo = 0
    var costoOperacion = 1

  method saldo() {
    return saldo
  }
  method extraer(monto) {
    saldo = saldo - monto
  }
  method depositar(monto) {
    self.validarDeposito(monto)
    saldo = saldo + monto - costoOperacion
  }
  method saldo(_saldo) {
    saldo = _saldo
  }
  method validarDeposito(monto) {
    if(monto <= costoOperacion){
        self.error("Monto invalido." + monto + "Es menor que el costo de operacion" + costoOperacion)
    }
  }
  method costoOperacion(_costoOperacion) {
    costoOperacion = _costoOperacion
  }
  method costoOperacion() {
    return costoOperacion
  }

}
