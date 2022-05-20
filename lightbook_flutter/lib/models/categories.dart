class Categories {
  int id;
  String name;
  Categories({required this.id, required this.name});

  static List<Categories> init() {
    List<Categories> data = [
      Categories(id: 1, name: "Văn học"),
      Categories(id: 2, name: "Trinh thám"),
      Categories(id: 3, name: "Kinh tế"),
      Categories(id: 4, name: "Văn hóa"),
      Categories(id: 5, name: "Lịch sử"),
    ];
    return data;
  }
}
