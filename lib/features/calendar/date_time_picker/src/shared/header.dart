import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart' show DateFormat;
import 'package:task/features/calendar/date_time_picker/src/shared/picker_grid_delegate.dart';

import 'leading_date.dart';

/// The `Header` class represents the header widget that is displayed above the calendar grid.
///
/// This widget includes information about the currently displayed date, as well as navigation controls
/// for moving to the next or previous page in the calendar.
///
/// ### Example:
///
/// ```dart
/// Header(
///   displayedDate: "December 2023",
///   centerLeadingDate: true,
///   onDateTap: () {
///     // Handle date tap action
///   },
///   onNextPage: () {
///     // Handle next page navigation
///   },
///   onPreviousPage: () {
///     // Handle previous page navigation
///   },
///   slidersColor: Colors.blue,
///   slidersSize: 20.0,
///   leadingDateTextStyle: TextStyle(
///     fontWeight: FontWeight.bold,
///     fontSize: 18.0,
///   ),
/// )
/// ```
///
/// See also:
///
///  * [LeadingDate], a widget that shows an indication of the opened year/month.
///
///
class Header extends StatelessWidget {
  /// Creates a new [Header] instance.
  ///
  /// The [displayedDate], [onDateTap], [onNextPage], [onPreviousPage], [slidersColor],
  /// [slidersSize], and [leadingDateTextStyle] parameters are required.
  const Header({
    super.key,
    required this.displayedDate,
    required this.onDateTap,
    required this.onNextPage,
    required this.onPreviousPage,
    required this.slidersColor,
    required this.slidersSize,
    required this.leadingDateTextStyle,
    this.centerLeadingDate = false,
    this.previousPageSemanticLabel,
    this.nextPageSemanticLabel,
  });

  /// The currently displayed date. It is typically in a format
  /// indicating the month and year.
  final String displayedDate;

  /// the text style for the [displayedDate] in the header.
  final TextStyle leadingDateTextStyle;

  /// Called when the displayed date is tapped. This can
  /// be used to trigger actions related to selecting or
  /// interacting with the displayed date.
  final VoidCallback onDateTap;

  /// called when the user wants to navigate to the next
  /// page in the calendar. This function is associated
  /// with the forward navigation control.
  final VoidCallback onNextPage;

  /// called when the user wants to navigate to the
  /// previous page in the calendar. This function is
  /// associated with the backward navigation control.
  final VoidCallback onPreviousPage;

  /// The color of the page navigation sliders
  /// (forward and backward).
  final Color slidersColor;

  /// The size of the page navigation sliders
  /// (forward and backward).
  final double slidersSize;

  /// Centring the leading date. e.g:
  ///
  /// <       December 2023      >
  ///
  final bool centerLeadingDate;

  /// Semantic label for button to go to the previous page.
  final String? previousPageSemanticLabel;

  /// Semantic label for button to go to the next page.
  final String? nextPageSemanticLabel;

  @override
  Widget build(BuildContext context) {
    final forwardButton = GestureDetector(
      onTap: onNextPage,
      child: SizedBox(
        width: 36,
        height: 36,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(child: SvgPicture.asset('assets/images/arrow-right.svg')),
        ),
      ),
    );

    final backButton = GestureDetector(
      onTap: onPreviousPage,
      child: SizedBox(
        width: 36,
        height: 36,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
          ),
          child: Center(child: SvgPicture.asset('assets/images/arrow-left.svg')),
        ),
      ),
    );

    return Column(
      children: [


        GridView.custom(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: PickerGridDelegate(
            columnCount: 7,
            rowCount: _dayHeaders(  TextStyle(), Localizations.localeOf(context),
                MaterialLocalizations.of(context)).toList().length >= 43 ? 7 : 6,
          ),
          childrenDelegate: SliverChildListDelegate(
            addRepaintBoundaries: false,
            _dayHeaders(  TextStyle(), Localizations.localeOf(context),
                MaterialLocalizations.of(context)).toList(),
          ),
        ),

        // Container(
        //   height: 40,
        //   child: ListView(
        //     shrinkWrap: true,
        //     scrollDirection: Axis.horizontal,
        //     children:  _dayHeaders(  TextStyle(), Localizations.localeOf(context),
        //         MaterialLocalizations.of(context)).toList(),
        //   ),
        // ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            backButton,
            Expanded(
              child: LeadingDate(
                onTap: onDateTap,
                displayedText: displayedDate,
                displayedTextStyle: leadingDateTextStyle,
              ),
            ),

            forwardButton,
          ],
        ),
      ],
    );
  }

  List<Widget> _dayHeaders(
      TextStyle headerStyle,
      Locale locale,
      MaterialLocalizations localizations,
      ) {
    final List<Widget> result = <Widget>[];
    final weekdayNames = DateFormat('', locale.toString()).dateSymbols.SHORTWEEKDAYS;

    for (int i = localizations.firstDayOfWeekIndex; true; i = (i + 1) % 7) {
      // to save space in arabic as arabic don't has short week days.
      final String weekday = weekdayNames[i].replaceFirst('ال', '');
      result.add(
        ExcludeSemantics(
          child: Center(
            child: Text(
              weekday.toUpperCase(),
              style: TextStyle(fontWeight: FontWeight.w600,fontSize: 16,color: Color(0xFF191D2B)),
            ),
          ),
        ),
      );
      if (i == (localizations.firstDayOfWeekIndex - 1) % 7) {
        break;
      }
    }
    return result;
  }

}
