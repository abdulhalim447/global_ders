import 'package:flutter/material.dart';
import 'package:pdfrx/pdfrx.dart';

class PdfViewScreen extends StatelessWidget {
  final String pdfPath;
  const PdfViewScreen({super.key, required this.pdfPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PdfViewer.uri(
          Uri.parse(pdfPath),
          params: PdfViewerParams(
            // Custom loading indicator while PDF is being downloaded
            loadingBannerBuilder: (context, bytesDownloaded, totalBytes) {
              return Container(
                color: const Color(0xFF1A1A2E),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          Color(0xFF00D9A5),
                        ),
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
                              style: const TextStyle(
                                color: Colors.white54,
                                fontSize: 14,
                              ),
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
            },
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1A1A2E),
    );
  }
}
