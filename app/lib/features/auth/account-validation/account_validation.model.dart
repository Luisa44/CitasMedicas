class ChangePass {
    String? password;

    ChangePass({this.password});

    ChangePass.fromJson(Map<String, dynamic> json) {
        password = json["password"];
    }

    Map<String, dynamic> toJson() {
        final Map<String, dynamic> _data = <String, dynamic>{};
        _data["password"] = password;
        return _data;
    }
}