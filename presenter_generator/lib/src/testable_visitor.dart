import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ExecutorVisitor extends SimpleElementVisitor<dynamic> {
  final List<MethodElement> abstractMethods = [];

  @override
  visitMethodElement(MethodElement element) {
    if (element.isAbstract) {
      abstractMethods.add(element);
    }

    return super.visitMethodElement(element);
  }
}
