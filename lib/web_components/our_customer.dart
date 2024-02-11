import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pgc/constants/text_const.dart';

class OurCustomer extends StatelessWidget {
  const OurCustomer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(
            "CUSTOMER PHOTOS",
            style: kSubHeadingTextStyle.copyWith(
                color: Colors.red, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 60),
          Text(
            "Our work describes why we are best in the business",
            maxLines: 2,
            style: kMainTitleBoldTextStyle.copyWith(fontSize: 36),
          ),
          SizedBox(height: MediaQuery.of(context).size.height / 10),
          StaggeredGrid.count(
            crossAxisCount: 6,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            children: [
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 3,
                child: imageCustomerContainer(
                    'assets/images/image1.png', "Customer", "Jane D."),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: imageCustomerContainer(
                    'assets/images/image2.png', "Regular Customer", "Rahul P."),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 4,
                child: imageCustomerContainer(
                    'assets/images/image3.png', "Customer", "Ganesh"),
              ),
              StaggeredGridTile.count(
                crossAxisCellCount: 2,
                mainAxisCellCount: 2,
                child: imageCustomerContainer(
                    'assets/images/image4.png', "Customer", "Sahil M."),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

imageCustomerContainer(imgPath, type, customer) {
  return ClipPath(
    clipper: ShapeBorderClipper(
      shape: ContinuousRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    // borderRadius: BorderRadius.circular(15.46),
    child: Container(
      alignment: Alignment.bottomLeft,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            imgPath,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              type,
              style: kMainTitleBoldTextStyle.copyWith(color: Colors.white),
            ),
            Text(
              customer,
              style: kSubHeadingTextStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    ),
  );
}
