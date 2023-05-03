class AttachmentModel {
  String? fileName;
  String? fileUrl;

  AttachmentModel({this.fileName, this.fileUrl});

  AttachmentModel.fromJson(Map<String, dynamic> json) {
    fileName = json['fileName'];
    fileUrl = json['fileUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fileName'] = fileName;
    data['fileUrl'] = fileUrl;
    return data;
  }
}