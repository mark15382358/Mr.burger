class AddToCartParams {
  final List<CartItemParams> items;

  AddToCartParams({required this.items});

  Map<String, dynamic> toJson() => {
    "items": items.map((x) => x.toJson()).toList(),
  };
}

class CartItemParams {
  final int productId;
  final int quantity;
  final double spicy;
  final List<int> toppings;
  final List<int> sideOptions;

  CartItemParams({
    required this.productId,
    required this.quantity,
    required this.spicy,
    required this.toppings,
    required this.sideOptions,
  });

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "quantity": quantity,
    "spicy": spicy,
    "toppings": toppings,
    "side_options": sideOptions,
  };
}
