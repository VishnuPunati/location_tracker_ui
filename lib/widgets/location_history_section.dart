import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../viewmodels/location_view_model.dart';
import '../theme/app_theme.dart';

class LocationHistorySection extends StatelessWidget {
  const LocationHistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<LocationViewModel>();
    final history = vm.history;

    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Location History',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.08),
                    borderRadius: BorderRadius.circular(999),
                  ),
                  child: Text(
                    '${history.length} entries',
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ListView.separated(
              itemCount: history.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              separatorBuilder: (_, __) =>
                  Divider(height: 14, color: Colors.grey.shade300),
              itemBuilder: (context, index) {
                final item = history[index];
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      alignment: Alignment.topCenter,
                      child: Column(
                        children: [
                          Icon(
                            index == 0
                                ? Icons.radio_button_checked
                                : Icons.radio_button_unchecked,
                            size: 18,
                            color: index == 0
                                ? AppTheme.primary
                                : Colors.grey.shade500,
                          ),
                          if (index != history.length - 1)
                            Container(
                              width: 2,
                              height: 30,
                              margin: const EdgeInsets.only(top: 2),
                              color: Colors.grey.shade300,
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['city'] ?? '',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            item['coords'] ?? '',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey.shade700,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      item['time'] ?? '',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
