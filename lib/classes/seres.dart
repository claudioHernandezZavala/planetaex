class Seres {
  String _nombre;
  String _imagen;
  double _distanciaAtierra;
  String _informacion;

  String get nombre => _nombre;

  Seres(this._nombre, this._distanciaAtierra, this._informacion, this._imagen);

  double get distanciaAtierra => _distanciaAtierra;

  String get informacion => _informacion;

  set informacion(String value) {
    _informacion = value;
  }

  set nombre(String value) {
    _nombre = value;
  }

  set distanciaAtierra(double value) {
    _distanciaAtierra = value;
  }

  String get imagen => _imagen;

  set imagen(String value) {
    _imagen = value;
  }
}
