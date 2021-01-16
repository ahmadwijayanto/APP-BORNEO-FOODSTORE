import 'package:borneofood_store/cubit/transaction_cubit.dart';
import 'package:borneofood_store/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class OrderPage extends StatefulWidget {
  static final routeName = '/order_page';

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    context.read<TransactionCubit>().getTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.deepOrangeAccent,
        title: Text(
          "Order List",
          style: GoogleFonts.poppins(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: BlocBuilder<TransactionCubit, TransactionState>(
        builder: (_, state) => (state is TransactionLoaded)
            ? ListView.builder(
                itemCount: state.transactions.length,
                itemBuilder: (_, index) => Card(
                  elevation: 3.0,
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Image(
                      image: NetworkImage(imageURL +
                          state.transactions[index].items.first.food.images
                              .first.image),
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                    title: Text(state.transactions[index].invoice.toString()),
                    subtitle: Text(
                        "Total: ${state.transactions[index].items.length} @ ${NumberFormat.currency(locale: 'id_ID', symbol: 'Rp.', decimalDigits: 0).format(state.transactions[index].totalPrice)}"),
                    trailing: FlatButton(
                      child: Text("Detail"),
                      onPressed: () {},
                    ),
                  ),
                ),
              )
            : Center(
                child: loadingIndicator,
              ),
      )),
    );
  }
}
