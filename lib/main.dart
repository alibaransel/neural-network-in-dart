import 'dart:math';
import 'neural.dart';

void main(List<String> args) {
  // Create data (optional, for problems can be solved with formula or algorithm)
  // Read data
  // Shuffle data
  // Split data to train and test parts
  // Build neural network
  // Train network
  // Test data
  // Calculate and print accuracy

  List<List<int>> data = [];
  for (int i = 0; i < 10000; i++) {
    int firstBit = Random().nextInt(2);
    int secondBit = Random().nextInt(2);
    int result = firstBit & secondBit;
    data.add([firstBit, secondBit, result]);
  }
  Network network = Network.build([2, 10, 2]);
}
