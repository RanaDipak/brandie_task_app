import 'package:flutter/material.dart';
import 'package:task_app/core/theme/app_colors.dart';
import 'package:task_app/core/utils/responsive_layout.dart';

class UploadDownloadButtons extends StatelessWidget {
  final VoidCallback onUpload;
  final VoidCallback onDownload;

  const UploadDownloadButtons({
    super.key,
    required this.onUpload,
    required this.onDownload,
  });

  @override
  Widget build(BuildContext context) {
    // Get responsive dimensions
    final isMobile = ResponsiveLayout.isMobile(context);
    final buttonHeight = isMobile ? 36.0 : 40.0;
    final iconSize = isMobile ? 14.0 : 16.0;
    final padding = isMobile ? 3.0 : 4.0;
    final spacing = isMobile ? 6.0 : 8.0;

    return Container(
      height: buttonHeight,
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: AppColors.buttonBackground,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: AppColors.lightGreyText.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildIconButton(
            icon: Icons.arrow_upward,
            color: AppColors.primaryBlue,
            onPressed: onUpload,
            isActive: true,
            iconSize: iconSize,
            buttonHeight: buttonHeight - (padding * 2),
          ),
          SizedBox(width: spacing),
          _buildIconButton(
            icon: Icons.arrow_downward,
            color: AppColors.mediumGreyText,
            onPressed: onDownload,
            isActive: false,
            iconSize: iconSize,
            buttonHeight: buttonHeight - (padding * 2),
          ),
        ],
      ),
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required Color color,
    required VoidCallback onPressed,
    required bool isActive,
    required double iconSize,
    required double buttonHeight,
  }) {
    return Container(
      height: buttonHeight,
      decoration: BoxDecoration(
        color: isActive ? AppColors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: IconButton(
        icon: Icon(icon, color: color, size: iconSize),
        onPressed: onPressed,
        padding: EdgeInsets.all(buttonHeight / 4), // Responsive padding
        constraints: BoxConstraints(
          minWidth: buttonHeight,
          minHeight: buttonHeight,
        ),
      ),
    );
  }
}
