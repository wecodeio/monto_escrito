require_relative "../spec_helper"
require File.expand_path("lib/monto_escrito/helpers/conversor.rb")

describe MontoEscrito::Conversor do

  def convertir(numero)
    MontoEscrito::Conversor.convertir(numero)
  end

  def verificar_conversiones(numeros)
    numeros.each { |numero, letras|
      convertir(numero).must_equal letras
    }
  end

  it "convierte un dígito" do
    digitos = {
      0 => 'cero',
      1 => 'un',
      2 => 'dos',
      3 => 'tres',
      4 => 'cuatro',
      5 => 'cinco',
      6 => 'seis',
      7 => 'siete',
      8 => 'ocho',
      9 => 'nueve'
    }

    verificar_conversiones(digitos)
  end

  it "convierte los números del 11 al 19" do
    numeros = {
      11 => 'once',
      12 => 'doce',
      13 => 'trece',
      14 => 'catorce',
      15 => 'quince',
      16 => 'dieciséis',
      17 => 'diecisiete',
      18 => 'dieciocho',
      19 => 'diecinueve'
    }

    verificar_conversiones(numeros)
  end

  it "convierte los números del 21 al 29" do
    numeros = {
      21 => 'veintiún',
      22 => 'veintidós',
      23 => 'veintitrés',
      24 => 'veinticuatro',
      25 => 'veinticinco',
      26 => 'veintiséis',
      27 => 'veintisiete',
      28 => 'veintiocho',
      29 => 'veintinueve'
    }

    verificar_conversiones(numeros)
  end

  it "convierte las decenas" do
    numeros = {
      10 => 'diez',
      20 => 'veinte',
      30 => 'treinta',
      40 => 'cuarenta',
      50 => 'cincuenta',
      60 => 'sesenta',
      70 => 'setenta',
      80 => 'ochenta',
      90 => 'noventa'
    }

    verificar_conversiones(numeros)
  end

  it "convierte entre 31 y 99" do
    numeros = {
      31 => 'treinta y un',
      32 => 'treinta y dos',
      47 => 'cuarenta y siete',
      58 => 'cincuenta y ocho',
      63 => 'sesenta y tres',
      78 => 'setenta y ocho',
      87 => 'ochenta y siete',
      99 => 'noventa y nueve'
    }

    verificar_conversiones(numeros)
  end

  it "convierte centenas" do
    numeros = {
      100 => 'cien',
      200 => 'doscientos',
      300 => 'trescientos',
      400 => 'cuatrocientos',
      500 => 'quinientos',
      600 => 'seiscientos',
      700 => 'setecientos',
      800 => 'ochocientos',
      900 => 'novecientos'
    }

    verificar_conversiones(numeros)
  end

  it "convierte entre 101 y 199" do
    numeros = {
      101 => 'ciento un',
      102 => 'ciento dos',
      125 => 'ciento veinticinco',
      150 => 'ciento cincuenta',
      187 => 'ciento ochenta y siete',
      199 => 'ciento noventa y nueve'
    }

    verificar_conversiones(numeros)
  end

  it "convierte entre 201 y 999" do
    numeros = {
      201 => 'doscientos un',
      302 => 'trescientos dos',
      425 => 'cuatrocientos veinticinco',
      550 => 'quinientos cincuenta',
      787 => 'setecientos ochenta y siete',
      999 => 'novecientos noventa y nueve'
    }

    verificar_conversiones(numeros)
  end

  it "convierte miles" do
    miles = {
      1000 => 'un mil',
      2134 => 'dos mil ciento treinta y cuatro',
      37690 => 'treinta y siete mil seiscientos noventa',
      654321 => 'seiscientos cincuenta y cuatro mil trescientos veintiún',
      808080 => 'ochocientos ocho mil ochenta',
      999999 => 'novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(miles)
  end

  it "convierte millones" do
    millones = {
      1000000 => 'un millón',
      2134567 => 'dos millones ciento treinta y cuatro mil quinientos sesenta y siete',
      37690163 => 'treinta y siete millones seiscientos noventa mil ciento sesenta y tres',
      654321784 => 'seiscientos cincuenta y cuatro millones trescientos veintiún mil setecientos ochenta y cuatro',
      808080080 => 'ochocientos ocho millones ochenta mil ochenta',
      999999999 => 'novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(millones)
  end

  it "convierte miles de millones" do
    miles_de_millones = {
      1000000000 => 'un mil millones',
      10000000000 => 'diez mil millones',
      100000000000 => 'cien mil millones',
      999999999999 => 'novecientos noventa y nueve mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(miles_de_millones)
  end

  it "convierte billones" do
    billones = {
      1000000000000 => 'un billón',
      2000000000000 => 'dos billones',
      999999999999999999 => 'novecientos noventa y nueve mil novecientos noventa y nueve billones novecientos noventa y nueve mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(billones)
  end

  it "convierte trillones" do
    trillones = {
      1000000000000000000 => 'un trillón',
      2000000000000000000 => 'dos trillones',
      999999999999999999999999 => 'novecientos noventa y nueve mil novecientos noventa y nueve trillones novecientos noventa y nueve mil novecientos noventa y nueve billones novecientos noventa y nueve mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(trillones)
  end

  it "no soporta cuatrillones" do
    numero = 1000000000000000000000000
    proc {MontoEscrito::Conversor.convertir(numero)}.must_raise(ArgumentError)
  end

  it "no soporta negativos" do
    numero = -1
    proc {MontoEscrito::Conversor.convertir(numero)}.must_raise(ArgumentError)
  end

end
