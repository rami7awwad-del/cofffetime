class CoffeeBean {
  final String name;         // اسم نوع القهوة
  final String description;  // الوصف
  final String origin;       // مكان الصنع (البلد المنشأ)
  final String imageUrl;     // مسار الصورة
  final double rating;       // التقييم من 10 (مثلاً: 8.5)
  
  // خريطة تحتوي على الأحجام المتاحة وأسعارها
  // مثال: {'250gm': 4.20, '500gm': 8.00, '1kg': 15.00}
  final Map<String, double> sizesAndPrices; 

  // المنشئ (Constructor) الخاص بالكلاس
  CoffeeBean({
    required this.name,
    required this.description,
    required this.origin,
    required this.imageUrl,
    required this.rating,
    required this.sizesAndPrices,
  }) : assert(rating >= 0 && rating <= 10, 'التقييم يجب أن يكون بين 0 و 10 فقط!'),
       assert(sizesAndPrices.isNotEmpty, 'يجب إضافة حجم وسعر واحد على الأقل للمنتج!');

  // دالة مساعدة للحصول على السعر الافتراضي (سعر أول حجم متوفر) لعرضه في الشاشة الرئيسية
  double get defaultPrice => sizesAndPrices.values.first;

  // دالة مساعدة للحصول على الحجم الافتراضي (أول حجم متوفر)
  String get defaultSize => sizesAndPrices.keys.first;
}