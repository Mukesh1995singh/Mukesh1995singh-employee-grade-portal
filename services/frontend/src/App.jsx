import { useEffect, useMemo, useState } from "react";
import "./App.css";

function App() {
  const [employees, setEmployees] = useState([]);
  const [search, setSearch] = useState("");
  const [gradeFilter, setGradeFilter] = useState("All");
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");

  useEffect(() => {
    fetch("/api/grades")
      .then((response) => {
        if (!response.ok) {
          throw new Error("Failed to fetch employee data");
        }

        return response.json();
      })
      .then((data) => {
        setEmployees(data);
        setLoading(false);
      })
      .catch((err) => {
        console.error(err);
        setError("Unable to load employee data");
        setLoading(false);
      });
  }, []);

  const filteredEmployees = useMemo(() => {
    return employees.filter((employee) => {
      const matchesSearch =
        employee.employee.toLowerCase().includes(search.toLowerCase()) ||
        employee.department.toLowerCase().includes(search.toLowerCase()) ||
        employee.designation.toLowerCase().includes(search.toLowerCase()) ||
        employee.subject.toLowerCase().includes(search.toLowerCase());

      const matchesGrade =
        gradeFilter === "All" || employee.grade === gradeFilter;

      return matchesSearch && matchesGrade;
    });
  }, [employees, search, gradeFilter]);

  const totalEmployees = employees.length;

  const gradeA = employees.filter(
    (employee) => employee.grade === "A" || employee.grade === "A+"
  ).length;

  const gradeB = employees.filter(
    (employee) => employee.grade === "B"
  ).length;

  const gradeC = employees.filter(
    (employee) => employee.grade === "C"
  ).length;

  return (
    <div className="app">
      <header className="header">
        <div>
          <h1>Employee Grade Portal</h1>
          <p>Employee performance and grade management</p>
        </div>

        <button className="add-button">
          + Add Employee
        </button>
      </header>

      <section className="stats-grid">
        <div className="stat-card">
          <span>Total Employees</span>
          <strong>{totalEmployees}</strong>
        </div>

        <div className="stat-card">
          <span>Grade A / A+</span>
          <strong>{gradeA}</strong>
        </div>

        <div className="stat-card">
          <span>Grade B</span>
          <strong>{gradeB}</strong>
        </div>

        <div className="stat-card">
          <span>Grade C</span>
          <strong>{gradeC}</strong>
        </div>
      </section>

      <section className="content-card">
        <div className="toolbar">
          <input
            type="text"
            placeholder="Search employee, department, designation..."
            value={search}
            onChange={(event) => setSearch(event.target.value)}
          />

          <select
            value={gradeFilter}
            onChange={(event) => setGradeFilter(event.target.value)}
          >
            <option value="All">All Grades</option>
            <option value="A+">A+</option>
            <option value="A">A</option>
            <option value="B">B</option>
            <option value="C">C</option>
            <option value="D">D</option>
          </select>
        </div>

        {loading && (
          <div className="message">
            Loading employee data...
          </div>
        )}

        {error && (
          <div className="message error">
            {error}
          </div>
        )}

        {!loading && !error && (
          <div className="table-container">
            <table>
              <thead>
                <tr>
                  <th>Employee</th>
                  <th>Department</th>
                  <th>Designation</th>
                  <th>Experience</th>
                  <th>Subject</th>
                  <th>Score</th>
                  <th>Grade</th>
                </tr>
              </thead>

              <tbody>
                {filteredEmployees.map((employee) => (
                  <tr key={employee.id}>
                    <td>{employee.employee}</td>
                    <td>{employee.department}</td>
                    <td>{employee.designation}</td>
                    <td>{employee.experience} yrs</td>
                    <td>{employee.subject}</td>
                    <td>{employee.score}</td>
                    <td>
                      <span className={`grade grade-${employee.grade.replace("+", "plus")}`}>
                        {employee.grade}
                      </span>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>

            {filteredEmployees.length === 0 && (
              <div className="message">
                No employees found.
              </div>
            )}
          </div>
        )}
      </section>
    </div>
  );
}

export default App;