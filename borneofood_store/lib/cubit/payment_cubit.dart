import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/models/payment_model.dart';
import 'package:borneofood_store/services/payment_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());

  Future<void> getPayments() async {
    ApiReturnValue<List<Payment>> result = await PaymentServices.getPayments();
    if (result.value != null) {
      emit(PaymentLoaded(result.value));
    } else {
      emit(Paymentfailed(result.message));
    }
  }
}

class Paymentfailed extends PaymentState {
  final String errMessage;

  Paymentfailed(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}

class PaymentInitial extends PaymentState {}

class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentLoaded extends PaymentState {
  final List<Payment> payments;

  PaymentLoaded(this.payments);
  @override
  List<Object> get props => [payments];
}
