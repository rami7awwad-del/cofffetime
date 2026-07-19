// كلاس يمثل تفاصيل حجم معين داخل الطلب (مثال: حجم S، السعر 4.20، الكمية 2)
class OrderSizeDetail {
  final String size;       // S, M, L أو 250gm, 1kg
  final double price;      // 4.20
  final int quantity;      // 2

  OrderSizeDetail({
    required this.size,
    required this.price,
    required this.quantity,
  });

  // حساب المجموع الفرعي لهذا الحجم (السعر * الكمية)
  double get subTotal => price * quantity;
}

// كلاس يمثل العنصر المشتري بالكامل (مثلا كابتشينو أو حبات البن)
class OrderItem {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final List<OrderSizeDetail> sizeDetails;

  OrderItem({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.sizeDetails,
  });

  // حساب إجمالي السعر لهذا المنتج بناءً على جميع أحجامه المشتراة
  double get itemTotal {
    return sizeDetails.fold(0.0, (sum, detail) => sum + detail.subTotal);
  }
}

// كلاس يمثل الطلب الكامل في تاريخ معين ويحتوي على قائمة من المنتجات
class OrderHistoryModel {
  final String orderId;
  final String orderDate;
  final List<OrderItem> items;

  OrderHistoryModel({
    required this.orderId,
    required this.orderDate,
    required this.items,
  });

  // حساب الإجمالي الكلي للطلب بالكامل (مجموع كل المنتجات بداخله)
  double get totalAmount {
    return items.fold(0.0, (sum, item) => sum + item.itemTotal);
  }
}
final List<OrderHistoryModel> mockOrders = [
  // الطلب الأول (20th March)
  OrderHistoryModel(
    orderId: 'ORD-001',
    orderDate: '20th March 16:23',
    items: [
      // المنتج الأول: كابتشينو بـ 3 أحجام
      OrderItem(
        id: 'c1',
        name: 'Cappuccino',
        description: 'With Steamed Milk',
        imageUrl: 'assets/images/6.png',
        sizeDetails: [
          OrderSizeDetail(size: 'S', price: 4.20, quantity: 2),
          OrderSizeDetail(size: 'M', price: 6.20, quantity: 2),
          OrderSizeDetail(size: 'L', price: 8.20, quantity: 2),
        ],
      ),
      // المنتج الثاني: كابتشينو آخر بحجمين فقط
      OrderItem(
        id: 'c2',
        name: 'Cappuccino',
        description: 'With Steamed Milk',
        imageUrl: 'assets/images/7.png',
        sizeDetails: [
          OrderSizeDetail(size: 'S', price: 4.20, quantity: 2),
          OrderSizeDetail(size: 'M', price: 6.20, quantity: 2),
        ],
      ),
    ],
  ),
  
  // الطلب الثاني (19th March)
  OrderHistoryModel(
    orderId: 'ORD-002',
    orderDate: '19th March 2023',
    items: [
      // المنتج الثالث: بن لبيريكا بأحجام الغرامات والـ الكيلو
      OrderItem(
        id: 'b1',
        name: 'Liberica Beans',
        description: 'From Africa',
        imageUrl: 'assets/images/1.png',
        sizeDetails: [
          OrderSizeDetail(size: '250gm', price: 4.20, quantity: 2),
          OrderSizeDetail(size: '500gm', price: 6.20, quantity: 2),
          OrderSizeDetail(size: '1Kg', price: 8.20, quantity: 2),
        ],
      ),
    ],
  ),
];