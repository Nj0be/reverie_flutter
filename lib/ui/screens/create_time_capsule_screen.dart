import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_libphonenumber/flutter_libphonenumber.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reverieflutter/data/model/time_capsule.dart';
import 'package:reverieflutter/data/model/user.dart';
import 'package:reverieflutter/l10n/app_localizations.dart';
import 'package:reverieflutter/notifier/create_time_capsule_notifier.dart';
import 'package:reverieflutter/ui/components/content_text_field.dart';
import 'package:reverieflutter/ui/components/error_field.dart';
import 'package:reverieflutter/ui/components/phone_number.dart';
import 'package:reverieflutter/ui/components/single_field.dart';
import 'package:reverieflutter/utils.dart';

class CreateTimeCapsuleScreen extends ConsumerWidget {
  static const String name = 'create_time_capsule';
  static const String path = '/create';

  final void Function(TimeCapsule) onComplete;

  const CreateTimeCapsuleScreen({
    super.key,
    required this.onComplete
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localizations = AppLocalizations.of(context)!;
    final state = ref.watch(createTimeCapsuleNotifierProvider);
    final notifier = ref.watch(createTimeCapsuleNotifierProvider.notifier);

    final timeCapsule = state.timeCapsule;
    final matchingUsers = state.matchingUsers;
    final receivers = state.userReceivers;

    return SingleChildScrollView(
      padding: EdgeInsets.only(top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              localizations.createTimeCapsuleMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),

          SizedBox(height: 8),

          SingleLineFieldWithError(
            value: timeCapsule.title,
            errorMessage: state.titleError,
            onNewValue: notifier.updateTitle,
            label: localizations.title,
          ),

          SizedBox(height: 16),

          ContentTextFieldWithError(
            value: timeCapsule.content,
            errorMessage: state.contentError,
            onNewValue: notifier.updateContent,
            label: localizations.content,
          ),

          SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: DatePicker(
                  selectedDate: timeCapsule.deadline,
                  onUpdateDate: notifier.updateDeadline,
                ),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  timeCapsule.deadline.toDate().isBefore(DateTime.now())
                      ? localizations.noDateSelected
                      : '${localizations.date}: ${formatDate(timeCapsule.deadline.toDate())}',
                ),
              )
            ],
          ),
          ErrorField(errorMessage: state.deadlineError),

          SizedBox(height: 16),

          SingleLineField(
            value: state.partialUsername,
            onNewValue: notifier.updatePartialUsername,
            label: localizations.username,
          ),

          if (matchingUsers.isNotEmpty)
            SelectUserDropDownMenu(
              users: matchingUsers,
              onSelectedUser: notifier.addUser,
            ),

          SizedBox(height: 16),

          PhoneNumberField(
            phoneNumber: state.phoneNumber,
            errorMessage: state.phoneNumberError,
            onUpdatePhoneNumber: notifier.updatePhoneNumber,
            trailingIcon: AddIconButton(onPressed: notifier.addPhoneNumber),
          ),

          SizedBox(height: 16),

          SingleLineFieldWithError(
            value: state.email,
            errorMessage: state.emailError,
            onNewValue: notifier.updateEmail,
            label: localizations.email,
            trailingIcon: AddIconButton(onPressed: notifier.addEmail),
          ),

          SizedBox(height: 16),

          Align(
            alignment: Alignment.center, // Center the SizedBox itself horizontally
            child: SizedBox(
              width: 280,
              child: Align(
                alignment: Alignment.centerLeft, // Align text to the left inside SizedBox
                child: Text(
                  '${localizations.receivers}:',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
            ),
          ),

          Container(
            width: 280,
            constraints: BoxConstraints(minHeight: 80, maxHeight: 193),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 2),
              shrinkWrap: true,
              children: [
                ...timeCapsule.phones.map(
                  (phone) => ReceiverElement(
                    text: formatNumberSync(phone),
                    onDelete: () => notifier.removePhoneNumber(phone),
                  ),
                ),
                ...timeCapsule.emails.map(
                  (email) => ReceiverElement(
                    text: email,
                    onDelete: () => notifier.removeEmail(email),
                  ),
                ),
                ...receivers.map(
                  (receiver) => ReceiverElement(
                    text: receiver.username,
                    onDelete: () => notifier.removeUser(receiver),
                  ),
                ),
              ],
            ),
          ),

          if (state.formError.isNotEmpty)
              Text(
                state.formError,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),

          SizedBox(height: 16),

          ElevatedButton(
            onPressed: () => notifier.createTimeCapsule(onComplete),
            child: Text(localizations.create),
          ),
        ],
      ),
    );
  }
}

class DatePicker extends StatelessWidget {
  final Timestamp selectedDate;
  final ValueChanged<Timestamp> onUpdateDate;

  DatePicker({required this.selectedDate, required this.onUpdateDate});

  @override
  Widget build(BuildContext context) {
    final initialDate = selectedDate.toDate();
    final tomorrow = DateTime.now().add(Duration(days: 1));

    return ElevatedButton(
      onPressed: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: initialDate.isBefore(tomorrow) ? tomorrow : initialDate,
          firstDate: tomorrow,
          lastDate: DateTime(2100),
        );

        if (pickedDate != null) {
          // Convert to Timestamp
          final timestamp = Timestamp.fromDate(
            DateTime(pickedDate.year, pickedDate.month, pickedDate.day),
          );
          onUpdateDate(timestamp);
        }
      },
      child: Text('Select Date'),
    );
  }
}

class ReceiverElement extends StatelessWidget {
  final String text;
  final VoidCallback onDelete;

  const ReceiverElement({
    super.key,
    required this.text,
    required this.onDelete
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: onDelete,
            borderRadius: BorderRadius.circular(15),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.delete_outline,
                color: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
          ),
          SizedBox(width: 6),
          Text(text),
        ],
      ),
    );
  }
}

class SelectUserDropDownMenu extends StatelessWidget {
  final List<User> users;
  final Function(User) onSelectedUser;

  const SelectUserDropDownMenu({
    super.key,
    required this.users,
    required this.onSelectedUser
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      constraints: BoxConstraints(maxHeight: 140),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(vertical: 2),
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];
          return GestureDetector(
            onTap: () => onSelectedUser(user),
            child: Container(
              height: 40,
              padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              margin: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.centerLeft,
              child: Text(user.username),
            ),
          );
        },
      ),
    );
  }
}

class AddIconButton extends StatelessWidget {
  final VoidCallback onPressed;
  final EdgeInsetsGeometry? padding;

  const AddIconButton({
    super.key,
    required this.onPressed,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      shape: CircleBorder(),
      child: InkWell(
        borderRadius: BorderRadius.circular(15),
        onTap: onPressed,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(6),
          child: Icon(Icons.add, color: Theme.of(context).colorScheme.onPrimary, size: 20),
        ),
      ),
    );
  }
}
