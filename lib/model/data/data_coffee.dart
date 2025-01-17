import 'package:coffee/model/data/data_image.dart';

enum CoffeeType {
  all,
  machiato,
  latte,
  americano,
}

class Coffee {
  final String image;
  final String name;
  final String description;
  final double price;
  final double rating;
  final String fullDescription;
  final double buyer;
  final CoffeeType type;

  Coffee({
    required this.image,
    required this.name,
    required this.description,
    required this.price,
    required this.rating,
    required this.fullDescription,
    required this.buyer,
    required this.type,
  });
}

class DataCoffee {
  static final List<Coffee> listCoffee = [
    Coffee(
      image: DataImage.homeCardCoffee1,
      name: 'Caffe Mocha',
      description: 'Deep Foam',
      price: 4.53,
      rating: 4.8,
      type: CoffeeType.latte,
      fullDescription:
          'A cappuccino is an approximately 150 ml (5 oz) beverage, with 25 ml of espresso coffee and 85ml of fresh milk the foam is about 1 cm thick. '
          'It is made up of espresso, steamed milk, and chocolate syrup or powder. '
          'This delightful beverage offers a perfect balance of coffee and chocolate, '
          'topped with whipped cream for an indulgent experience.',
      buyer: 230,
    ),
    Coffee(
      image: DataImage.homeCardCoffee2,
      name: 'Caramel Machiato',
      description: 'Espresso',
      price: 3.53,
      rating: 4.8,
      type: CoffeeType.machiato,
      fullDescription:
          'A Caramel Macchiato is a sweet and creamy espresso-based drink. '
          'It features vanilla syrup, steamed milk, espresso, and is topped with '
          'caramel drizzle. The word "macchiato" means "marked" in Italian.',
      buyer: 100,
    ),
    Coffee(
      image: DataImage.homeCardCoffee3,
      name: 'Vanilla Latte',
      description: 'Vanilla',
      price: 4.20,
      rating: 4.7,
      type: CoffeeType.latte,
      fullDescription:
          'A Vanilla Latte combines espresso with steamed milk and vanilla syrup. '
          'This sweet and creamy beverage offers a perfect balance of coffee and vanilla, '
          'topped with a light layer of milk foam.',
      buyer: 150,
    ),
    Coffee(
      image: DataImage.homeCardCoffee4,
      name: 'Americano',
      description: 'Americano cuy',
      price: 3.95,
      rating: 4.6,
      type: CoffeeType.americano,
      fullDescription:
          'Americano is a coffee-based drink that originated in Italy. '
          'It is made with espresso and hot water. '
          'The result is a strong, robust, and slightly bitter coffee flavor.',
      buyer: 119,
    ),
  ];

  static List<Coffee> searchCoffee(String query) {
    return listCoffee
        .where(
            (coffee) => coffee.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  static List<Coffee> filterByType(CoffeeType type) {
    if (type == CoffeeType.all) {
      return listCoffee;
    }
    return listCoffee.where((coffee) => coffee.type == type).toList();
  }
}
