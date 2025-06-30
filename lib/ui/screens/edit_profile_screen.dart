import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reverie_flutter/data/model/user.dart';
import 'package:reverie_flutter/l10n/app_localizations.dart';
import 'package:reverie_flutter/ui/components/error_field.dart';
import 'package:reverie_flutter/ui/components/single_field.dart';
import '../../viewmodel/edit_profile_viewmodel.dart';


class EditProfileScreen extends StatelessWidget {
  final void Function(User) onComplete;

  const EditProfileScreen({
    super.key,
    required this.onComplete,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<EditProfileViewModel>();
    final uiState = context.watch<EditProfileViewModel>().uiState;
    final inputState = context.watch<EditProfileViewModel>().inputState;

    if (uiState is EditProfileLoadingState) {
      return const Center(child: CircularProgressIndicator());
    }

    if (uiState is EditProfileLoadingErrorState) {
      return Center(child: Text('${AppLocalizations.of(context)!.errorMessage}: ${uiState.exception.toString()}'));
    }

    if (uiState is EditProfileCompletedState) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        onComplete(uiState.profile);
      });
      return const SizedBox.shrink(); // niente da mostrare qui
    }

    if (uiState is EditProfileIdleState || uiState is EditProfileInputErrorState) {
      final errorState = uiState is EditProfileInputErrorState ? uiState.errorMessage : '';

      return Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.editProfileTitle, // o usa localization
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),

            SingleLineFieldWithError(
              value: inputState.username,
              errorMessage: inputState.usernameError,
              onNewValue: viewModel.onUsernameChange,
              label: AppLocalizations.of(context)!.username,
            ),

            const SizedBox(height: 16),

            SingleLineFieldWithError(
              value: inputState.name,
              errorMessage: inputState.nameError,
              onNewValue: viewModel.onNameChange,
              label: AppLocalizations.of(context)!.name,
            ),

            const SizedBox(height: 16),

            SingleLineFieldWithError(
              value: inputState.surname,
              errorMessage: inputState.surnameError,
              onNewValue: viewModel.onSurnameChange,
              label: AppLocalizations.of(context)!.surname,
            ),

            const SizedBox(height: 32),

            ElevatedButton(
              onPressed: () => viewModel.onSaveProfile(),
              child: Text(AppLocalizations.of(context)!.saveButton),
            ),

            if (errorState.isNotEmpty) ErrorField(errorMessage: errorState),
          ],
        ),
      );
    }
    return const SizedBox.shrink(); // fallback
  }
}