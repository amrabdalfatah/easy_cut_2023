import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class BookingSalon extends StatelessWidget {
  const BookingSalon({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: CalendarControllerProvider(
        controller: EventController(),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.red,
                  unselectedLabelColor: Colors.blue,
                  tabs: [
                    Tab(text: 'Chair One'),
                    Tab(text: 'Chair Two'),
                  ],
                ),
                Expanded(
                  child: DayView(
                    // controller: EventController(),
                    // eventTileBuilder: (date, events, boundry, start, end) {
                    //   // Return your widget to display as event tile.
                    //   return Container();
                    // },
                    // fullDayEventBuilder: (events, date) {
                    //   // Return your widget to display full day event view.
                    //   return Container();
                    // },
                    // showVerticalLine: true, // To display live time line in day view.
                    // showLiveTimeLineInAllDays:
                    //     true, // To display live time line in all pages in day view.
                    minDay: DateTime.now(),
                    maxDay: DateTime(2050),
                    initialDay: DateTime.now(),
                    // heightPerMinute: 1, // height occupied by 1 minute time span.
                    // eventArranger:
                    //     SideEventArranger(), // To define how simultaneous events will be arranged.
                    // onEventTap: (events, date) => print(events),
                    // onDateLongPress: (date) => print(date),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
