import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/element.dart';

class ExecutorVisitor extends SimpleElementVisitor<dynamic> {
  final List<MethodElement> methods = [];
  final List<Element> getters = [];

  @override
  visitMethodElement(MethodElement element) {
    methods.add(element);
    return super.visitMethodElement(element);
  }
  @override
  visitFieldElement(FieldElement element) {
    return super.visitFieldElement(element);
  }
}
