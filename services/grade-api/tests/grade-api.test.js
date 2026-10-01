const request = require("supertest");
const app = require("../src/server");

describe("Employee Grade API", () => {

    test("GET /health should return service status", async () => {
        const response = await request(app)
            .get("/health");

        expect(response.statusCode).toBe(200);
        expect(response.body.status).toBe("UP");
        expect(response.body.service).toBe("grade-api");
    });

    test("GET /api/grades should return grades", async () => {
        const response = await request(app)
            .get("/api/grades");

        expect(response.statusCode).toBe(200);
        expect(Array.isArray(response.body)).toBe(true);
        expect(response.body.length).toBeGreaterThan(0);
    });

    test("POST /api/grades should create a new grade", async () => {
        const newGrade = {
            employee: "Test Employee",
            department: "Engineering",
            designation: "DevOps Engineer",
            experience: 3,
            subject: "Azure",
            score: 85
        };

        const response = await request(app)
            .post("/api/grades")
            .send(newGrade);

        expect(response.statusCode).toBe(201);
        expect(response.body.employee).toBe("Test Employee");
        expect(response.body.score).toBe(85);
        expect(response.body.grade).toBe("A");
    });

    test("POST /api/grades should return 400 for missing fields", async () => {
        const response = await request(app)
            .post("/api/grades")
            .send({
                employee: "Test Employee"
            });

        expect(response.statusCode).toBe(400);
        expect(response.body.error).toBe(
            "All employee and grade fields are required"
        );
    });

    test("POST /api/grades should calculate A+ grade for score 90 or above", async () => {
        const response = await request(app)
            .post("/api/grades")
            .send({
                employee: "A Plus Employee",
                department: "Engineering",
                designation: "Cloud Engineer",
                experience: 5,
                subject: "Azure",
                score: 95
            });

        expect(response.statusCode).toBe(201);
        expect(response.body.grade).toBe("A+");
    });

});