class Users {
  int id;
  String name;
  String avatar;
  String username;
  String password;
  String phoneNumber;
  int roleId;
  Users({
    required this.id,
    required this.name,
    required this.avatar,
    required this.username,
    required this.password,
    required this.phoneNumber,
    required this.roleId,
  });
  static List<Users> init() {
    List<Users> data = [
      Users(
          id: 1,
          name: "user1",
          avatar: "",
          username: "user1",
          password: "123",
          phoneNumber: "123",
          roleId: 1),
      Users(
          id: 2,
          name: "user1",
          avatar: "https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80",
          username: "user1",
          password: "123",
          phoneNumber: "123",
          roleId: 1),
    ];
    return data;
  }
}
