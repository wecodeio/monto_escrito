require_relative "spec_helper"
require File.expand_path("lib/monto_escrito/decorador.rb")

describe MontoEscrito::Decorador do

  def convertir(numero, formato)
    MontoEscrito::Decorador.new(numero).to_s(formato)
  end

  def verificar_conversiones(numeros, formato = :integer)
    numeros.each { |numero, letras|
      convertir(numero, formato).must_equal letras
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
      1_000 => 'un mil',
      2_134 => 'dos mil ciento treinta y cuatro',
      37_690 => 'treinta y siete mil seiscientos noventa',
      654_321 => 'seiscientos cincuenta y cuatro mil trescientos veintiún',
      808_080 => 'ochocientos ocho mil ochenta',
      999_999 => 'novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(miles)
  end

  it "convierte millones" do
    millones = {
      1_000_000 => 'un millón',
      2_134_567 => 'dos millones ciento treinta y cuatro mil quinientos sesenta y siete',
      37_690_163 => 'treinta y siete millones seiscientos noventa mil ciento sesenta y tres',
      654_321_784 => 'seiscientos cincuenta y cuatro millones trescientos veintiún mil setecientos ochenta y cuatro',
      808_080_080 => 'ochocientos ocho millones ochenta mil ochenta',
      999_999_999 => 'novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(millones)
  end

  it "convierte miles de millones" do
    miles_de_millones = {
      1_000_000_000 => 'un mil millones',
      10_000_000_000 => 'diez mil millones',
      100_000_000_000 => 'cien mil millones',
      999_999_999_999 => 'novecientos noventa y nueve mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(miles_de_millones)
  end

  it "convierte billones" do
    billones = {
      1_000_000_000_000 => 'un billón',
      2_000_000_000_000 => 'dos billones',
      999_999_999_999_999_999 => 'novecientos noventa y nueve mil novecientos noventa y nueve billones novecientos noventa y nueve mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(billones)
  end

  it "convierte trillones" do
    trillones = {
      1_000_000_000_000_000_000 => 'un trillón',
      2_000_000_000_000_000_000 => 'dos trillones',
      999_999_999_999_999_999_999_999 => 'novecientos noventa y nueve mil novecientos noventa y nueve trillones novecientos noventa y nueve mil novecientos noventa y nueve billones novecientos noventa y nueve mil novecientos noventa y nueve millones novecientos noventa y nueve mil novecientos noventa y nueve'
    }

    verificar_conversiones(trillones)
  end

  it "no soporta cuatrillones" do
    numero = 1_000_000_000_000_000_000_000_000
    proc {MontoEscrito::Decorador.new(numero)}.must_raise(ArgumentError)
  end

  it "no soporta negativos" do
    numero = -1
    proc {MontoEscrito::Decorador.new(numero)}.must_raise(ArgumentError)
  end

  it "imprime decimales en formato :short" do

    decimales = {
      0.25 => 'cero con 25/100',
      1.50 => 'un con 50/100',
      2.75 => 'dos con 75/100',
      0.1 => 'cero con 10/100',
      0.01 => 'cero con 1/100',
      0.100 => 'cero con 10/100',
      0.123 => 'cero con 12/100',
      0.125 => 'cero con 13/100',
      0.129 => 'cero con 13/100'
    }

    verificar_conversiones(decimales, :short)
  end

  it "imprime decimales en formato :long" do

    decimales = {
      0.25 => 'cero con veinticinco',
      1.50 => 'un con cincuenta',
      2.75 => 'dos con setenta y cinco',
      0.1 => 'cero con diez',
      0.01 => 'cero con un',
      0.100 => 'cero con diez',
      0.123 => 'cero con doce',
      0.125 => 'cero con trece',
      0.129 => 'cero con trece'
    }

    verificar_conversiones(decimales, :long)
  end

end
