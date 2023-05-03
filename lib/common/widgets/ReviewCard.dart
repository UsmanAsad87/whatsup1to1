import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:intl/intl.dart';
import 'package:whatsup1to1/common/common_libs.dart';
import 'package:whatsup1to1/utils/constants/assets_manager.dart';
class ReviewCard extends StatelessWidget {
  final String image;
  final String name;
  final DateTime dateTime;
  final double rating;
  final String review;
  const ReviewCard({
    super.key,
    required this.image,
    required this.name,
    required this.dateTime,
    required this.rating,
    required this.review,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0.h, horizontal: 5.w),
      child: Column(
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 22.r,
                backgroundColor: Theme.of(context)
                    .colorScheme
                    .secondaryContainer
                    .withOpacity(0.5),
                backgroundImage: AssetImage(AppAssets.personImg),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        name,
                        style: getMediumStyle(
                            fontSize: 11.sp,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Container(
                        height: 16.h,
                        width: 1.h,
                        color: Theme.of(context).colorScheme.tertiaryContainer,
                      ),
                      SizedBox(
                        width: 10.w,
                      ),
                      Text(
                        DateFormat('MMM dd, yyyy').format(dateTime),
                        style: getMediumStyle(
                            fontSize: 11.sp,
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 3.h),
                    child: RatingBarIndicator(
                      rating: 4,
                      itemBuilder: (context, index) =>
                      const Icon(Icons.star, color: Color(0xFFF8C51B)),
                      itemCount: 5,
                      itemSize: 12.0.h,
                      direction: Axis.horizontal,
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            review,
            style: getMediumStyle(
                fontSize: 10.sp, color: Theme.of(context).colorScheme.tertiary),
          ),
          SizedBox(
            height: 20.h,
          ),
          Divider(
            thickness: 1.h,
            color: Theme.of(context).colorScheme.tertiaryContainer,
          )
        ],
      ),
    );
  }
}
