import 'package:borneofood_store/models/model_cart.dart';
import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/services/cart_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());
  Future<void> getCarts() async {
    ApiReturnValue<List<Cart>> result = await CartServices.getCarts();
    if (result.value != null) {
      emit(CartLoaded(result.value));
    } else {
      emit(CartFailedLoaded(result.message));
    }
  }

  Future<void> submitCart(Cart cart) async {
    ApiReturnValue<Cart> result = await CartServices.submitCart(cart);
    if (result.value != null) {
      emit(CartCreated(result.value));
    } else {
      emit(CartFailedLoaded(result.message));
    }
  }

  Future<void> delete(int id) async {
    var result = await CartServices.deleteCart(id);
    if (result.value != null) {
      emit(CartDeleted(result.value));
    } else {
      emit(CartFailedLoaded(result.message));
    }
  }

  Future<void> updateCart(Cart cart) async {
    var result = await CartServices.updateCart(cart);
    if (result.value != null) {
      emit(CartUpdated(result.value));
    } else {
      emit(CartFailedLoaded(result.message));
    }
  }
}

class CartState extends Equatable {
  const CartState();
  @override
  List<Object> get props => [];
}

class CartInitial extends CartState {}

class CartLoaded extends CartState {
  final List<Cart> carts;

  CartLoaded(this.carts);
  @override
  List<Object> get props => [carts];
}

class CartFailedLoaded extends CartState {
  final String errMessage;

  CartFailedLoaded(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}

class CartCreated extends CartState {
  final Cart cart;

  CartCreated(this.cart);
  @override
  List<Object> get props => [cart];
}

class CartDeleted extends CartState {
  final String deleteMessage;
  CartDeleted(this.deleteMessage);
  @override
  List<Object> get props => [deleteMessage];
}

class CartUpdated extends CartState {
  final Cart cart;
  CartUpdated(this.cart);
  @override
  List<Object> get props => [cart];
}
