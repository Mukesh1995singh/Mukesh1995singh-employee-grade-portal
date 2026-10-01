const express = require("express");

const app = express();
const PORT = 3000;

app.use(express.json());

let grades = [
    {
        id: 1,
        employee: "Rahul Sharma",
        department: "Engineering",
        designation: "Azure Engineer",
        experience: 5,
        subject: "Azure",
        score: 85,
        grade: "A"
    },
    {
        id: 2,
        employee: "Priya Singh",
        department: "Engineering",
        designation: "DevOps Engineer",
        experience: 4,
        subject: "Kubernetes",
        score: 92,
        grade: "A+"
    },
    {
        id: 3,
        employee: "Amit Kumar",
        department: "Operations",
        designation: "System Administrator",
        experience: 6,
        subject: "Linux",
        score: 76,
        grade: "B"
    },
    {
        id: 4,
        employee: "Neha Verma",
        department: "QA",
        designation: "QA Engineer",
        experience: 3,
        subject: "Testing",
        score: 68,
        grade: "C"
    },
    {
        id: 5,
        employee: "Rohit Gupta",
        department: "Engineering",
        designation: "Cloud Engineer",
        experience: 7,
        subject: "Azure",
        score: 95,
        grade: "A+"
    }
];

app.get("/health", (req, res) => {
    res.json({
        status: "UP",
        service: "grade-api"
    });
});

app.get("/api/grades", (req, res) => {
    res.json(grades);
});

app.post("/api/grades", (req, res) => {
    const {
        employee,
        department,
        designation,
        experience,
        subject,
        score
    } = req.body;

    if (
        !employee ||
        !department ||
        !designation ||
        experience === undefined ||
        !subject ||
        score === undefined
    ) {
        return res.status(400).json({
            error: "All employee and grade fields are required"
        });
    }

    let grade;

    if (score >= 90) {
        grade = "A+";
    } else if (score >= 80) {
        grade = "A";
    } else if (score >= 70) {
        grade = "B";
    } else if (score >= 60) {
        grade = "C";
    } else {
        grade = "D";
    }

    const newGrade = {
        id: grades.length + 1,
        employee,
        department,
        designation,
        experience,
        subject,
        score,
        grade
    };

    grades.push(newGrade);

    res.status(201).json(newGrade);
});

if (require.main === module) {
    app.listen(PORT, "0.0.0.0", () => {
        console.log(`Grade API running on port ${PORT}`);
    });
}

module.exports = app;