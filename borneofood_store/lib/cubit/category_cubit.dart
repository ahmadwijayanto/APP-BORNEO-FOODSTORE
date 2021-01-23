import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  Future<void> getCategories() async {
    ApiReturnValue<List<Category>> result =
        await CategoryServices.getCategories();
    result.value.add(Category(id: 1000, name: "Semua"));
    if (result.value != null) {
      emit(CategoryLoaded(result.value));
    } else {
      emit(CategoryLoadFailed(result.message));
    }
  }
}

abstract class CategoryState extends Equatable {
  const CategoryState();
  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<Category> categories;
  CategoryLoaded(this.categories);

  @override
  List<Object> get props => [categories];
}

class CategoryLoadFailed extends CategoryState {
  final String message;
  CategoryLoadFailed(this.message);

  @override
  List<Object> get props => [message];
}
