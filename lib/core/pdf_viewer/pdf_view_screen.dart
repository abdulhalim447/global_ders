import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

/// PDF View Screen that supports both asset and network PDFs
class PdfViewScreen extends StatelessWidget {
  final String pdfPath;
  final bool isAsset;
  final String? title;

  const PdfViewScreen({
    super.key,
    required this.pdfPath,
    this.isAsset = false,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A1A2E),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: title != null
            ? Text(
                title!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              )
            : null,
        elevation: 0,
      ),
      body: isAsset ? _buildAssetPdfViewer() : _buildNetworkPdfViewer(),
      backgroundColor: const Color(0xFF1A1A2E),
    );
  }

  /// Build PDF viewer for asset files
  Widget _buildAssetPdfViewer() {
    return PdfViewer.asset(
      pdfPath,
      params: PdfViewerParams(
        loadingBannerBuilder: (context, bytesDownloaded, totalBytes) {
          return _buildLoadingIndicator(bytesDownloaded, totalBytes);
        },
      ),
    );
  }

  /// Build PDF viewer for network files
  Widget _buildNetworkPdfViewer() {
    return PdfViewer.uri(
      Uri.parse(pdfPath),
      params: PdfViewerParams(
        loadingBannerBuilder: (context, bytesDownloaded, totalBytes) {
          return _buildLoadingIndicator(bytesDownloaded, totalBytes);
        },
      ),
    );
  }

  /// Build loading indicator widget
  Widget _buildLoadingIndicator(int bytesDownloaded, int? totalBytes) {
    return Container(
      color: const Color(0xFF1A1A2E),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00D9A5)),
              strokeWidth: 3,
            ),
            const SizedBox(height: 20),
            const Text(
              'PDF Loading...',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),
            if (totalBytes != null && bytesDownloaded > 0)
              Column(
                children: [
                  Text(
                    '${(bytesDownloaded / 1024 / 1024).toStringAsFixed(1)} MB / ${(totalBytes / 1024 / 1024).toStringAsFixed(1)} MB',
                    style: const TextStyle(color: Colors.white54, fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: LinearProgressIndicator(
                      value: bytesDownloaded / totalBytes,
                      backgroundColor: Colors.white24,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                        Color(0xFF00D9A5),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
