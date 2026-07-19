class CartItem {
  final String id;
  final String name;
  final String description; // مثل: With Steamed Milk
  final String origin;      // مثل: Medium Roasted أو From Africa
  final String imageUrl;
  // خريطة لتخزين كمية كل حجم تم تحديده داخل السلة
  // مثال: {'S': 1, 'M': 2} أو {'250gm': 1}
  final Map<String, int> selectedSizesQty; 
  final Map<String, double> sizesAndPrices; // الأسعار الخاصة بكل حجم

  CartItem({
    required this.id,
    required this.name,
    required this.description,
    required this.origin,
    required this.imageUrl,
    required this.selectedSizesQty,
    required this.sizesAndPrices,
  });

  // حساب السعر الإجمالي للعنصر بناءً على كميات الأحجام المختلفة
  double get totalPrice {
    double total = 0.0;
    selectedSizesQty.forEach((size, qty) {
      double price = sizesAndPrices[size] ?? 0.0;
      total += price * qty;
    });
    return total;
  }
}