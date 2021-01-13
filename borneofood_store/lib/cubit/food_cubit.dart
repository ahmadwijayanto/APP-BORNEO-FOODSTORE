import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/food_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FoodCubit extends Cubit<FoodState> {
  FoodCubit() : super(FoodInitial());

  Future<void> getFoods()  async{
    ApiReturnValue<List<Food>> result = await FoodServices.getFoods();
    if(result.value != null){
      emit(FoodLoaded(result.value));
    }else{
      emit(FoodLoadFailed(result.message));
    }
  }
}

abstract class FoodState extends Equatable {
  const FoodState();
  @override
  List<Object> get props => [];
}

class FoodInitial extends FoodState {}

class FoodLoaded extends FoodState {
  final List<Food> foods;
  FoodLoaded(this.foods);
  @override
  List<Object> get props => [foods];
}

class FoodLoadFailed extends FoodState {
  final String errMessage;

  FoodLoadFailed(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}
