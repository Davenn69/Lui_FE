import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lui_fe/core/bases/base_notifier.dart';

class BaseView<T extends BaseNotifier> extends ConsumerWidget {
    final AutoDisposeChangeNotifierProvider<T> provider;
    final Widget Function(BuildContext, T) builder;
    final Widget Function(BuildContext, T) overlayBuilder;
    final PreferredSizeWidget Function(T) appBar;
    final bool extendBodyBehindAppBar;

    const BaseView({
        required this.provider,
        required this.appBar,
        required this.builder,
        this.overlayBuilder,
        this.extendBodyBehindAppBar = false,
    });

    @override
    Widget build(BuildContext context, WidgetRef ref) {
        final viewModel = ref.watch(provider);
        return _buildScreenContent(context, viewModel);
    }

    Widget _buildScreenContent(BuildContext context, T viewModel) => GestureDetector(
        onTap: () {
            FocusScope.of(context).unfocus();
        },

        child: Stack(
            children: [
                Scaffold(
                    appBar: appBar,
                    extendBodyBehindAppBar: extendBodyBehindAppBar,
                    body: (!viewModel.isInitialized)
                        ? const LoadingIndicator()
                        : builder(context, viewModel),
                ),
                if (viewModel.isLoading &&
                    !viewModel.showOverlay &&
                    viewModel.isInitialized)
                    const LoadingIndicator(showBackdrop: true)
                if (viewModel.showOverlay &&
                    overlayBuilder != null &&
                    viewModel.isInitialized)
                    overlayBuilder(context, viewModel),
            ],
        ),
    );
}
