part of 'widgets.dart';

class CategoryCard extends StatelessWidget {
  final String name;
  final bool isSelected;
  final double width;
  final double height;
  final Function onTap;

  CategoryCard(this.name,
    {
      this.isSelected = false,
      this.width = 130,
      this.height = 60,
      this.onTap
      }
  );

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (this.onTap != null) {
          this.onTap();
        }
      },
      child: Container(
        margin: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 0),
        width: getProportionateScreenWidth(this.width),
        height: getProportionateScreenHeight(this.height),
        decoration: BoxDecoration(
          color: this.isSelected ? Colors.orange : Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Colors.transparent,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(1, 1),
            ),
          ],
        ),
        child: Center(
          child: Text(
            this.name,
            style: TextStyle(
              color: Colors.white,
              fontSize: 15
            ),
          )
        ),
      ),
    );
  }
}