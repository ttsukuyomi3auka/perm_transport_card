import 'package:freezed_annotation/freezed_annotation.dart';

part 'fake_api_response.freezed.dart';

@freezed
class FakeApiResponse<T> with _$FakeApiResponse<T> {
  factory FakeApiResponse.success(T data) = _Success<T>;
  factory FakeApiResponse.loading() = _Loading;
  factory FakeApiResponse.failed(String message) = _Failed;
}
