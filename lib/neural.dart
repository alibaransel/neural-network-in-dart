import 'dart:math';

class Network {
  List<Layer> layers;

  Network(this.layers);

  factory Network.build(List<int> neuronCounts) => Network([
        for (int i = 1; i < neuronCounts.length; i++)
          Layer.build(neuronCounts[i - 1], neuronCounts[i])
      ]);

  List<double> forward(List<double> inputs) {
    var current = inputs;
    for (var layer in layers) {
      current = layer.forward(current);
    }
    return current;
  }
}

class Layer {
  List<Neuron> neurons;

  Layer(this.neurons);

  factory Layer.build(int previousCount, int count) =>
      Layer([for (int i = 0; i < count; i++) Neuron.build(previousCount)]);

  List<double> forward(List<double> inputs) {
    return [
      for (var neuron in neurons) neuron.forward(inputs),
    ];
  }
}

class Neuron {
  List<double> weights;

  double bias;

  Neuron(this.weights, this.bias);

  factory Neuron.build(int inputCount) => Neuron(
        // TODO: Create weights and bias
        [for (int i = 0; i < inputCount; i++) 0.5],
        0.5,
      );

  double forward(List<double> inputs) {
    assert(inputs.length == weights.length);
    var result = 0.0;
    for (var i = 0; i < inputs.length; i++) {
      result += inputs[i] * weights[i];
    }
    result += bias;

    // ReLu
    result = max(0, result);

    return result;
  }
}
