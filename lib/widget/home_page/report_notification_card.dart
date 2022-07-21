import 'package:capstone_management/constant/color.dart';
import 'package:capstone_management/modal/report_notification.dart';
import 'package:flutter/material.dart';

class ReportNotificationCard extends StatelessWidget {
  final ReportNotification notification;

  const ReportNotificationCard({Key? key, required this.notification}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 2 row: picture| name   time   ( expand)
    ///               |team            column
    ///               |feed          column
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///profile picture
        Container(
          margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(right: 5),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(notification.avatarUrl ?? 'https://pbs.twimg.com/profile_images/1455185376876826625/s1AjSxph_400x400.jpg')
                    )),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: (Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(mainAxisSize: MainAxisSize.min, children: [
                        ///
                        Text(
                          notification.displayName,
                          style: const TextStyle(
                              color: kTextColor,
                              fontWeight: FontWeight.w500,
                              fontSize: 17),
                        ),
                        const SizedBox(width: 5),

                        ///
                        Container(
                          height: 3,
                          width: 3,
                          decoration: const BoxDecoration(
                              color: gray, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 5),
                        Flexible(
                          child: Text(
                            notification.email.length > 10
                                ? '${notification.email.substring(0, 10)}...'
                                : notification.email,
                            style: const TextStyle(
                                color: kTeamColor, fontSize: 15),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 5),

                        ///
                        Container(
                          height: 3,
                          width: 3,
                          decoration: const BoxDecoration(
                              color: gray, shape: BoxShape.circle),
                        ),
                        const SizedBox(width: 5),
                      ]),
                      const SizedBox(
                        height: 5,
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                    ],
                  )),
                ),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 0.8,
          color: gray,
          height: 20,
        )
      ],
    );
  }
}
