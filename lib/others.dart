import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class AppLifeCycle extends StatefulWidget {
  final Widget child;
  AppLifeCycle({ this.child });
  
  @override
  State<StatefulWidget> createState() {
    return _AppLifeCycleState();
  }
}

class _AppLifeCycleState extends State<AppLifeCycle> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();

    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);

    print('app lifecyle change: ${state.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}

class MyButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('tap button');
      },
      child: Container(
        height: 36,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.lightGreen[500],
        ),
        child: Center(
          child: Text('Click Me!!'),
        ),
      ),
    );
  }
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
        ),
        title: Text('Example Title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: null,
          )
        ],
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Hello World'),
            MyButton(),
            Counter()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add',
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class MyScaffold extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          MyAppBar(
            title: Text(
              'Example Title'
            )
          ),
          Expanded(
            child: Center(
              child: Text('Hello world'),
            ),
          )
        ],
      )
    );
  }
}

class MyAppBar extends StatelessWidget {
  MyAppBar({ this.title });

  final Widget title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(color: Colors.blue[500]),
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.menu),
            tooltip: 'Navigation menu',
            onPressed: null,
          ),
          Expanded(
            child: title,
          ),
          IconButton(
            icon: Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          )
        ],
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  // state
  int _counter = 0;

  // actions
  void _increment() {
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();

    print('call init state');

    SchedulerBinding.instance.addPostFrameCallback((duration) {
      print('post frame callback ${duration.inMilliseconds}');
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    print('didChangeDependencies');
  }

  @override
  void didUpdateWidget(Counter oldWidget) {
    super.didUpdateWidget(oldWidget);

    print('did update');
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Row(
      children: <Widget>[
        RaisedButton(
          onPressed: this._increment,
          child: Text('Plus'),
        ),
        Text('Counter: ${this._counter}')
      ],
    );
  }
}
