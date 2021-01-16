import 'package:borneofood_store/models/models.dart';
import 'package:borneofood_store/models/transcation_model.dart';
import 'package:borneofood_store/services/transaction_services.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionCubit extends Cubit<TransactionState> {
  TransactionCubit() : super(TransactionInitial());

  Future<void> submitTransaction(int total) async {
    ApiReturnValue<Transaction> result =
        await TransactionServices.submitTransaction(total);
    if (result.value != null) {
      emit(TransactionCreated(result.value));
    } else {
      emit(TransactionFailed(result.message));
    }
  }

  Future<void> getTransactions() async {
    print("Halllo");
    ApiReturnValue<List<Transaction>> result =
        await TransactionServices.getTransactions();
    if (result.value != null) {
      emit(TransactionLoaded(result.value));
    } else {
      emit(TransactionFailed(result.message));
    }
  }
}

class TransactionState extends Equatable {
  const TransactionState();
  @override
  List<Object> get props => [];
}

class TransactionInitial extends TransactionState {}

class TransactionLoaded extends TransactionState {
  final List<Transaction> transactions;

  TransactionLoaded(this.transactions);
  @override
  List<Object> get props => [transactions];
}

class TransactionFailed extends TransactionState {
  final String errMessage;

  TransactionFailed(this.errMessage);
  @override
  List<Object> get props => [errMessage];
}

class TransactionCreated extends TransactionState {
  final Transaction transaction;

  TransactionCreated(this.transaction);
  @override
  List<Object> get props => [transaction];
}
