class AutocompleteSearch {
  AutocompleteSearch({
    this.id,
    this.title,
    this.imageType,
  });

  AutocompleteSearch.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        imageType = json['imageType'] as String?;
  final int? id;
  final String? title;
  final String? imageType;

  Map<String, dynamic> toJson() =>
      <String, dynamic>{'id': id, 'title': title, 'imageType': imageType};
}
