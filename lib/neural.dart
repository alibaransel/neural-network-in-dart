import 'dart:math';

class Network {
  List<Layer> layers;

  Network(this.layers);

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
