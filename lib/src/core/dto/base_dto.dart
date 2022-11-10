abstract class BaseDto<T> {
  T fromMap(Map<String, dynamic> json);
}
