import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FrozenLastColumnExample(),
    );
  }
}

class FrozenLastColumnExample extends StatefulWidget {
  @override
  _FrozenLastColumnExampleState createState() => _FrozenLastColumnExampleState();
}

class _FrozenLastColumnExampleState extends State<FrozenLastColumnExample> {
  List<Employee> employees = <Employee>[];
  late EmployeeDataSource employeeDataSource;

  @override
  void initState() {
    super.initState();
    employees = getEmployeeData();
    employeeDataSource = EmployeeDataSource(employeeData: employees);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Frozen Last Column Example3'),
      ),
      body: SfDataGrid(
        source: employeeDataSource,
        columnWidthMode: ColumnWidthMode.fill,
        columns: <GridColumn>[
          GridColumn(
              columnName: 'id',
              width: 100,
              label: Container(
                  padding: EdgeInsets.all(16.0),
                  alignment: Alignment.center,
                  child: Text('ID'))),
          GridColumn(
              columnName: 'name',
              // width: 150,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Name'))),
          GridColumn(
              columnName: 'designation',
              // width: 150,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Designation'))),
          GridColumn(
              columnName: 'email',
              width: 200,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Email'))),
          GridColumn(
              columnName: 'phone',
              width: 150,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Phone'))),
          GridColumn(
              columnName: 'department',
              width: 150,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Department'))),
          GridColumn(
              columnName: 'experience',
              width: 120,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Experience (Years)'))),
          GridColumn(
              columnName: 'salary',
              width: 120,
              label: Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.center,
                  child: Text('Salary'))),
        ],
        footerFrozenColumnsCount: 1, // 冻结最后一列
      ),
    );
  }

  List<Employee> getEmployeeData() {
    return [
      Employee(10001, 'James', 'Project Lead', 'james@example.com', '123-456-7890', 'IT', 8, 20000),
      Employee(10002, 'Kathryn', 'Manager', 'kathryn@example.com', '234-567-8901', 'HR', 12, 30000),
      Employee(10003, 'Lara', 'Developer', 'lara@example.com', '345-678-9012', 'IT', 4, 15000),
      Employee(10004, 'Michael', 'Designer', 'michael@example.com', '456-789-0123', 'Design', 6, 18000),
      Employee(10005, 'Martin', 'Developer', 'martin@example.com', '567-890-1234', 'IT', 3, 14000),
      Employee(10006, 'Newberry', 'Developer', 'newberry@example.com', '678-901-2345', 'IT', 2, 13000),
      Employee(10007, 'Balnc', 'Developer', 'balnc@example.com', '789-012-3456', 'IT', 5, 16000),
      Employee(10008, 'Perry', 'Developer', 'perry@example.com', '890-123-4567', 'IT', 4, 15000),
      Employee(10009, 'Gable', 'Developer', 'gable@example.com', '901-234-5678', 'IT', 6, 17000),
      Employee(10010, 'Grimes', 'Developer', 'grimes@example.com', '012-345-6789', 'IT', 7, 19000)
    ];
  }
}

class EmployeeDataSource extends DataGridSource {
  EmployeeDataSource({required List<Employee> employeeData}) {
    _employeeData = employeeData
        .map<DataGridRow>((e) => DataGridRow(cells: [
      DataGridCell<int>(columnName: 'id', value: e.id),
      DataGridCell<String>(columnName: 'name', value: e.name),
      DataGridCell<String>(columnName: 'designation', value: e.designation),
      DataGridCell<String>(columnName: 'email', value: e.email),
      DataGridCell<String>(columnName: 'phone', value: e.phone),
      DataGridCell<String>(columnName: 'department', value: e.department),
      DataGridCell<int>(columnName: 'experience', value: e.experience),
      DataGridCell<int>(columnName: 'salary', value: e.salary),
    ]))
        .toList();
  }

  List<DataGridRow> _employeeData = [];

  @override
  List<DataGridRow> get rows => _employeeData;

  @override
  DataGridRowAdapter buildRow(DataGridRow row) {
    return DataGridRowAdapter(
        cells: row.getCells().map<Widget>((e) {
          return Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(8.0),
            child: Text(e.value.toString()),
          );
        }).toList());
  }
}

class Employee {
  Employee(this.id, this.name, this.designation, this.email, this.phone, this.department, this.experience, this.salary);

  final int id;
  final String name;
  final String designation;
  final String email;
  final String phone;
  final String department;
  final int experience;
  final int salary;
}