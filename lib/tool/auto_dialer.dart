import 'dart:io';
import 'dart:async';

void main() {
  // List of phone numbers to dial
  List<String> phoneNumbers = [
    '8617742849',
    '7364814984',
  ];

  // Start auto-dialing the numbers
  autoDialNumbers(phoneNumbers);
}

void autoDialNumbers(List<String> phoneNumbers) async {
  for (String phoneNumber in phoneNumbers) {
    print('Dialing $phoneNumber...');
    await dialNumber(phoneNumber);

    // Wait for a few seconds before dialing the next number
    // Adjust the delay as needed
    await Future.delayed(Duration(seconds: 10));
  }
}

Future<void> dialNumber(String phoneNumber) async {
  final scriptPath =
      r'D:\Flutter Project\employee_management\lib\tool\dial_number.ps1';
  final powershellPath =
      r'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe';

  try {
    final result = await Process.run(
      powershellPath,
      ['-File', scriptPath, phoneNumber],
    );

    if (result.exitCode == 0) {
      print('Successfully dialed $phoneNumber');
    } else {
      print('Error dialing $phoneNumber: ${result.stderr}');
    }
  } catch (e) {
    print('Failed to run PowerShell script: $e');
  }
}
