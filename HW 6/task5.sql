-- 1
SELECT W.first_name, W.surname, B.bill_date, COUNT(B.bill_no) AS num_bills
FROM restBill B
JOIN restStaff W ON B.waiter_no = W.staff_no
GROUP BY W.first_name, W.surname, B.bill_date
HAVING COUNT(B.bill_no) >= 2;

-- 2
SELECT room_name, COUNT(table_no) AS num_tables
FROM restRest_table
WHERE no_of_seats > 6
GROUP BY room_name;

-- 3
SELECT RM.room_name, SUM(B.bill_total) AS total_bill_amount
FROM restRoom_management RM
JOIN restBill B ON RM.room_name = (SELECT room_name FROM restRest_table WHERE table_no = B.table_no)
GROUP BY RM.room_name;

-- 4
SELECT HW.first_name, HW.surname, SUM(B.bill_total) AS total_bill_amount
FROM restRoom_management RM
JOIN restStaff HW ON RM.headwaiter = HW.staff_no
JOIN restBill B ON B.waiter_no IN (
    SELECT staff_no
    FROM restStaff
    WHERE headwaiter = HW.staff_no
)
GROUP BY HW.first_name, HW.surname
ORDER BY total_bill_amount DESC;

-- 5
SELECT B.cust_name
FROM restBill B
GROUP BY B.cust_name
HAVING AVG(B.bill_total) > 400;

-- 6
SELECT W.first_name, W.surname, B.bill_date, COUNT(B.bill_no) AS num_bills
FROM restBill B
JOIN restStaff W ON B.waiter_no = W.staff_no
GROUP BY W.first_name, W.surname, B.bill_date
HAVING COUNT(B.bill_no) >= 3;
