USE credit_risk_db;

CREATE TABLE credit_risk (
    person_age INT,
    person_income INT,
    person_home_ownership VARCHAR(20),
    person_emp_length DECIMAL(5,2),
    loan_intent VARCHAR(50),
    loan_grade CHAR(1),
    loan_amnt INT,
    loan_int_rate DECIMAL(5,2),
    loan_status TINYINT,
    loan_percent_income DECIMAL(5,2),
    cb_person_default_on_file CHAR(1),
    cb_person_cred_hist_length INT,
    age_group VARCHAR(10),
    income_band VARCHAR(20),
    high_risk VARCHAR(15)
);
SELECT COUNT(*) FROM credit_risk;
SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amnt) AS total_loan_amount,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount,
    ROUND(AVG(loan_int_rate), 2) AS avg_interest_rate,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk;
SELECT
    loan_grade,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY loan_grade
ORDER BY loan_grade;
SELECT
    loan_intent,
    COUNT(*) AS total_loans,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY loan_intent
ORDER BY default_rate DESC;
SELECT
    cb_person_default_on_file,
    COUNT(*) AS total_customers,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY cb_person_default_on_file;
SELECT
    high_risk,
    COUNT(*) AS total_customers,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY high_risk;
SELECT
    income_band,
    ROUND(AVG(loan_amnt), 2) AS avg_loan_amount
FROM credit_risk
GROUP BY income_band
ORDER BY avg_loan_amount DESC;
SELECT
    age_group,
    COUNT(*) AS total_customers,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY age_group
ORDER BY age_group;
SELECT
    loan_grade,
    loan_intent,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate,
    COUNT(*) AS total_loans
FROM credit_risk
GROUP BY loan_grade, loan_intent
HAVING COUNT(*) >= 50
ORDER BY default_rate DESC
LIMIT 10;
SELECT
    cb_person_cred_hist_length,
    ROUND(AVG(loan_status) * 100, 2) AS default_rate
FROM credit_risk
GROUP BY cb_person_cred_hist_length
ORDER BY cb_person_cred_hist_length;
