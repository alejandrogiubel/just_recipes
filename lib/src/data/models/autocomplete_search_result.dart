import 'package:equatable/equatable.dart';

class AutocompleteSearch extends Equatable {
  const AutocompleteSearch({
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

  @override
  List<Object?> get props => [id, title, imageType];
}
