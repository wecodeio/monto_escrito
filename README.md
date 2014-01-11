# MontoEscrito

Helper para escribir montos con palabras en español

## Installation

Add this line to your application's Gemfile:

    gem 'monto_escrito'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install monto_escrito

## Usage

Para convertir una cantidad a palabras, simplemente hay que utilizar el método `to_s` de la clase `MontoEscrito::Decorador`:

    irb(main):001:0> MontoEscrito::Decorador.new(10).to_s
    => "diez"
    irb(main):002:0> MontoEscrito::Decorador.new(14).to_s
    => "catorce"

Esta forma permite interpolar las conversiones:

    irb(main):001:0> monto = MontoEscrito::Decorador.new(10)
    irb(main):002:0> "Son pesos #{monto}"
    => "Son pesos diez"

> **Nota:** actualmente se soportan sólamente números positivos menores a un cuatrillón. Puede extenderse fácilmente, pero a fines prácticos se deja en esa cantidad. Se arrojará un `ArgumentError` en caso de violar esa restricción de dominio.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Change Log


* `monto_escrito-1.0.0`: Se implementa una API basada en un objeto decorador, permitiendo interpolar llamadas.
* `monto_escrito-0.0.1`: Se utiliza la primera API que opera como helper