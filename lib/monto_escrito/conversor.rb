module MontoEscrito
  class Conversor

    def self.convertir(numero)

      raise ArgumentError if numero >= 1000000000000000000000000 or numero < 0

      if @@casos_especiales[numero]
        monto_escrito = @@casos_especiales[numero]
      else

        monto_escrito = ''

        @@casos.each do |caso, detalles|
          if numero >= caso
            valor = (numero.to_i / detalles[:divisor]) * detalles[:multiplicador_primario]
            monto_escrito += convertir(valor) + detalles[:sufijo]
            numero -= valor * detalles[:multiplicador_secundario]
            if numero > 0
              monto_escrito += detalles[:continuacion]
            end
          end
        end
      end
      monto_escrito
    end

    private

    @@casos_especiales = { 0 => 'cero', 1 => 'un', 2 => 'dos', 3 => 'tres', 4 => 'cuatro', 5 => 'cinco', 6 => 'seis', 7 => 'siete', 8 => 'ocho', 9 => 'nueve', 10 => 'diez', 11 => 'once', 12 => 'doce', 13 => 'trece', 14 => 'catorce', 15 => 'quince', 16 => 'dieciséis', 17 => 'diecisiete', 18 => 'dieciocho', 19 => 'diecinueve', 21 => 'veintiún', 22 => 'veintidós', 23 => 'veintitrés', 24 => 'veinticuatro', 25 => 'veinticinco', 26 => 'veintiséis', 27 => 'veintisiete', 28 => 'veintiocho', 29 => 'veintinueve', 10 => 'diez', 20 => 'veinte', 30 => 'treinta', 40 => 'cuarenta', 50 => 'cincuenta', 60 => 'sesenta', 70 => 'setenta', 80 => 'ochenta', 90 => 'noventa', 100 => 'cien', 200 => 'doscientos', 300 => 'trescientos', 400 => 'cuatrocientos', 500 => 'quinientos', 600 => 'seiscientos', 700 => 'setecientos', 800 => 'ochocientos', 900 => 'novecientos'
    }

    @@casos = {
      2000000000000000000 =>
        {
          :divisor => 1000000000000000000,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1000000000000000000,
          :sufijo => ' trillones',
          :continuacion => ' ',
        },
      1000000000000000000 =>
        {
          :divisor => 1000000000000000000,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1000000000000000000,
          :sufijo => ' trillón',
          :continuacion => ' ',
        },
      2000000000000 =>
        {
          :divisor => 1000000000000,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1000000000000,
          :sufijo => ' billones',
          :continuacion => ' ',
        },
      1000000000000 =>
        {
          :divisor => 1000000000000,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1000000000000,
          :sufijo => ' billón',
          :continuacion => ' ',
        },
      2000000 =>
        {
          :divisor => 1000000,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1000000,
          :sufijo => ' millones',
          :continuacion => ' ',
        },
      1000000 =>
        {
          :divisor => 1000000,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1000000,
          :sufijo => ' millón',
          :continuacion => ' ',
        },
      1000 =>
        {
          :divisor => 1000,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1000,
          :sufijo => ' mil',
          :continuacion => ' ',
        },
      200 =>
        {
          :divisor => 100,
          :multiplicador_primario => 100,
          :multiplicador_secundario => 1,
          :sufijo => '',
          :continuacion => ' ',
        },
      100 =>
        {
          :divisor => 100,
          :multiplicador_primario => 100,
          :multiplicador_secundario => 1,
          :sufijo => 'to',
          :continuacion => ' ',
        },
      30 =>
        {
          :divisor => 10,
          :multiplicador_primario => 10,
          :multiplicador_secundario => 1,
          :sufijo => '',
          :continuacion => ' y ',
        },
      1 =>
        {
          :divisor => 1,
          :multiplicador_primario => 1,
          :multiplicador_secundario => 1,
          :sufijo => '',
          :continuacion => '',
        }
    }

  end

end