module MontoEscrito
  class Decorador

    def initialize(numero)
      raise ArgumentError if numero >= 1_000_000_000_000_000_000_000_000 or numero < 0
      @numero = numero
    end

    def to_s(format=:integer)
      if (format == :integer)
        @monto_escrito ||= calcular_monto_escrito(@numero)
      else
        centavos = (@numero - @numero.floor) * 100
        @numero = @numero.floor
        if (format == :short)
          @monto_escrito ||= "#{calcular_monto_escrito(@numero)} con #{centavos.to_i}/100"
        else
          @monto_escrito ||= "#{calcular_monto_escrito(@numero)} con #{calcular_monto_escrito(centavos)}"
        end
      end
    end

    private

    def calcular_monto_escrito(numero)

      if casos_especiales[numero]
        monto_escrito = casos_especiales[numero]
      else

        monto_escrito = ''

        casos.each do |caso, detalles|
          if numero >= caso
            valor = (numero.to_i / detalles[:divisor]) * detalles[:multiplicador_primario]
            monto_escrito += calcular_monto_escrito(valor) + detalles[:sufijo]
            numero -= valor * detalles[:multiplicador_secundario]
            if numero > 0
              monto_escrito += detalles[:continuacion]
            end
          end
        end
      end
      monto_escrito
    end

    def casos_especiales
      {0 => 'cero', 1 => 'un', 2 => 'dos', 3 => 'tres', 4 => 'cuatro', 5 => 'cinco', 6 => 'seis', 7 => 'siete', 8 => 'ocho', 9 => 'nueve', 10 => 'diez', 11 => 'once', 12 => 'doce', 13 => 'trece', 14 => 'catorce', 15 => 'quince', 16 => 'dieciséis', 17 => 'diecisiete', 18 => 'dieciocho', 19 => 'diecinueve', 21 => 'veintiún', 22 => 'veintidós', 23 => 'veintitrés', 24 => 'veinticuatro', 25 => 'veinticinco', 26 => 'veintiséis', 27 => 'veintisiete', 28 => 'veintiocho', 29 => 'veintinueve', 10 => 'diez', 20 => 'veinte', 30 => 'treinta', 40 => 'cuarenta', 50 => 'cincuenta', 60 => 'sesenta', 70 => 'setenta', 80 => 'ochenta', 90 => 'noventa', 100 => 'cien', 200 => 'doscientos', 300 => 'trescientos', 400 => 'cuatrocientos', 500 => 'quinientos', 600 => 'seiscientos', 700 => 'setecientos', 800 => 'ochocientos', 900 => 'novecientos'}
    end

    def casos
      {
        2_000_000_000_000_000_000 =>
          {
            :divisor => 1_000_000_000_000_000_000,
            :multiplicador_primario => 1,
            :multiplicador_secundario => 1_000_000_000_000_000_000,
            :sufijo => ' trillones',
            :continuacion => ' ',
          },
        1_000_000_000_000_000_000 =>
          {
            :divisor => 1_000_000_000_000_000_000,
            :multiplicador_primario => 1,
            :multiplicador_secundario => 1_000_000_000_000_000_000,
            :sufijo => ' trillón',
            :continuacion => ' ',
          },
        2_000_000_000_000 =>
          {
            :divisor => 1_000_000_000_000,
            :multiplicador_primario => 1,
            :multiplicador_secundario => 1_000_000_000_000,
            :sufijo => ' billones',
            :continuacion => ' ',
          },
        1_000_000_000_000 =>
          {
            :divisor => 1_000_000_000_000,
            :multiplicador_primario => 1,
            :multiplicador_secundario => 1_000_000_000_000,
            :sufijo => ' billón',
            :continuacion => ' ',
          },
        2_000_000 =>
          {
            :divisor => 1_000_000,
            :multiplicador_primario => 1,
            :multiplicador_secundario => 1_000_000,
            :sufijo => ' millones',
            :continuacion => ' ',
          },
        1_000_000 =>
          {
            :divisor => 1_000_000,
            :multiplicador_primario => 1,
            :multiplicador_secundario => 1_000_000,
            :sufijo => ' millón',
            :continuacion => ' ',
          },
        1_000 =>
          {
            :divisor => 1_000,
            :multiplicador_primario => 1,
            :multiplicador_secundario => 1_000,
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

end
