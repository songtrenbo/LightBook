import 'dart:convert';
class Books {
  int id;
  String name;
  double price;
  String review;
  int pages;
  String picture;
  String chapter;
  int categoryId;
  Books(
      {required this.id,
      required this.name,
      required this.price,
      required this.review,
      required this.pages,
      required this.picture,
      required this.chapter,
      required this.categoryId});
      
  List<Books> postFromJson(String str) =>
      List<Books>.from(json.decode(str).map((x) => Books.fromMap(x)));

  factory Books.fromMap(Map<String, dynamic> json) => Books(
        id: json['id'],
        name: json['name'],
        price: json['price'] * 1.0,
        review: json['review'],
        pages: int.parse(json['pages'] ?? "0"),
        picture: json['picture'],
        chapter: json['chapter'],
        categoryId: json['categoryID'],
      );
  static List<Books> init() {
    List<Books> data = [
      Books(
        id: 1,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 2,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 3,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 4,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 5,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 6,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 7,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 8,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 9,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 10,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 1,
      ),
      Books(
        id: 11,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 12,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 13,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 14,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 15,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 16,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 17,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 18,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 19,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 20,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 2,
      ),
      Books(
        id: 21,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 22,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 23,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 24,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 25,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 26,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 27,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 28,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 29,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 30,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 3,
      ),
      Books(
        id: 31,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 32,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 33,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 34,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 35,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 36,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 37,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 38,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 39,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 40,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 4,
      ),
      Books(
        id: 41,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 42,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 43,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 44,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 45,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 46,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 47,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 48,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 49,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
      Books(
        id: 50,
        name: "Mắt biếc",
        price: 8.0,
        review:
            "Một tác phẩm được nhiều người bình chọn là hay nhất của nhà văn này. Một tác phẩm đang được dịch và giới thiệu tại Nhật Bản (theo thông tin từ các báo)… Bởi sự trong sáng của một tình cảm, bởi cái kết thúc rất, rất buồn khi suốt câu chuyện vẫn là những điều vui, buồn lẫn lộn (cái kết thúc không như mong đợi của mọi người). Cũng bởi, mắt biếc… năm xưa nay đâu (theo lời một bài hát).\nCảnh báo: Truyện có thể khiến bạn buồn cả tuần, chú ý chuẩn bị tinh thần trước khi đọc.",
        pages: 50,
        picture:
            "https://gacsach.club/sites/default/files/styles/book310/public/mat_biec.gif?itok=9gfKhHHl",
        chapter: "",
        categoryId: 5,
      ),
    ];
    return data;
  }
}
