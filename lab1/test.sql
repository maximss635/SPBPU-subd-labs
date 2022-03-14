#============ Medicine tests ===========

# не пройдет
select * from Medicine;

# можно читать только через вьюху
select * from v_Medicine;

# не пройдет - read-only
insert into v_Medicine values (999, 999, 999, 999, "test999", NOW() + interval 3 day, 999, 999);

#============ Appointments tests ===========

# Не пройдет - нет доступа к некоторым фичам
select * from Appointments;

# пройдет
select doctor_firstname, patient_firstname, count
from Appointments;

# Не пройдет - не все фичи можно апдейтить
update Appointments
set doctor_firstname = "new"
where patient_firstname = "patient_1";

# пройдет
update Appointments
set count = count + 1, patient_firstname = "update"
where doctor_firstname = "doctor_1";

# Пройдет
insert into Appointments(doctor_firstname, doctor_lastname, doctor_patronymic,
                         medicine_serial_number, appointment_date,
                         patient_firstname, patient_lastname, patient_patronymic, count) values
("new doctor", "new doctor", "new doctor", 1, NOW(), "new_patient", "new_patient", "new_patient", 1);