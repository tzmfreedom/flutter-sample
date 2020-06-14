import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/components/task_view_model.dart';

import 'package:flutterapp/models/task.dart';
import 'package:http/http.dart';
import 'package:http/testing.dart';

void main() {
  test('add', () async {
    final viewModel = TaskViewModel()
      ..client = MockClient((_) async {
        return Response(
            json.encode({'id': 1}),
            201
        );
      });
    await viewModel.add(const Task(
        id: 1,
        done: true,
        title: 'title',
        body: 'body'
    ));

    expect(viewModel.items.length, 1);
    final item = viewModel.items[0];
    expect(item.id, 1);
    expect(item.done, true);
    expect(item.title, 'title');
    expect(item.body, 'body');
  });

  test('load', () async {
    final viewModel = TaskViewModel()
      ..client = MockClient((_) async {
        return Response(
            json.encode([
              {
                'id': 1,
                'done': true,
                'title': 'title',
                'body': 'body',
              },
            ]),
            200
        );
      });
    await viewModel.load();
    expect(viewModel.items.length, 1);

    final item = viewModel.items[0];
    expect(item.id, 1);
    expect(item.done, true);
    expect(item.title, 'title');
    expect(item.body, 'body');
  });

  test('update', () async {
    final viewModel = TaskViewModel()
      ..items = [
        const Task(
            id: 1,
            done: false,
            title: 'title',
            body: 'body'
        ),
      ]
      ..client = MockClient((_) async {
        return Response(
            json.encode({
              'id': 1,
              'done': true,
              'title': 'title',
              'body': 'body',
            }),
            200
        );
      });
    await viewModel.update(const Task(
        id: 1,
        done: true,
        title: 'title',
        body: 'body'
    ));
    expect(viewModel.items.length, 1);

    final item = viewModel.items[0];
    expect(item.id, 1);
    expect(item.done, true);
    expect(item.title, 'title');
    expect(item.body, 'body');
  });
}
