class Pizza {
  String name;
  String? sauce;
  String? size;
  String? toppings;

  Pizza({required this.name, this.sauce, this.size, this.toppings});

  @override
  String toString() {
    return 'Pizza{name: $name, sauce: $sauce, size: $size, toppings: $toppings}';
  }
}

class PizzaBuilder {
  String _name = 'Salam';
  String? _sauce;
  String? _size;
  String? _toppings;

  PizzaBuilder setName(String name) {
    _name = name;
    return this;
  }

  PizzaBuilder setSauce(String sauce) {
    _sauce = sauce;
    return this;
  }

  PizzaBuilder setSize(String size) {
    _size = size;
    return this;
  }

  PizzaBuilder setToppings(String toppings) {
    _toppings = toppings;
    return this;
  }

  Pizza build() {
    return Pizza(name: _name, sauce: _sauce, size: _size, toppings: _toppings);
  }
}

// void main() {
//   Pizza pizza =
//       PizzaBuilder()
//           .setName("Pepperoni")
//           .setSauce("BBQ")
//           .setSize("M")
//           .setToppings("Cheese, Mushroom")
//           .build();

//   print(
//     pizza,
//   ); // Output: Pizza{name: Pepperoni, sauce: BBQ, size: Medium, toppings: Cheese, Mushroom}
// }
/// Decorator
abstract class Coffee {
  String getDescription();
  double cost();
}

class EspressoCoffee implements Coffee {
  @override
  String getDescription() => 'Espresso Coffee';

  @override
  double cost() => 3.0;
}

class MilkDecorator implements Coffee {
  final Coffee _coffee;

  MilkDecorator(this._coffee);

  @override
  String getDescription() => '${_coffee.getDescription()}, Milk';

  @override
  double cost() => _coffee.cost() + 0.5;
}

class SugarDecorator implements Coffee {
  final Coffee _coffee;

  SugarDecorator(this._coffee);

  @override
  String getDescription() => '${_coffee.getDescription()}, Sugar';

  @override
  double cost() => _coffee.cost() + 0.2;
}
void main() {
  Coffee coffee = EspressoCoffee();
  print('${coffee.getDescription()} costs \$${coffee.cost()}');

  coffee = MilkDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.cost()}');

  coffee = SugarDecorator(coffee);
  print('${coffee.getDescription()} costs \$${coffee.cost()}');
}
