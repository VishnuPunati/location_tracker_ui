import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../theme/app_theme.dart';
import '../viewmodels/location_view_model.dart';

class PermissionStatusChip extends StatelessWidget {
  const PermissionStatusChip({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LocationViewModel>();

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.secondary.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            vm.isLocationServiceOn ? Icons.check_circle : Icons.error,
            size: 18,
            color: vm.isLocationServiceOn
                ? AppTheme.secondary
                : AppTheme.danger,
          ),
          const SizedBox(width: 6),
          Text(
            'Permission: ${vm.permissionStatus}',
            style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}
