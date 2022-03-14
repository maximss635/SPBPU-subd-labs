# drop table Appointments;
# drop table Medicine;
# drop view v_Medicine;
# drop user doctor@localhost;

create table Medicine (
    batch_number int not null,
    code int not null,
    serial_number int primary key not null,
    pills_in_pack int,
    manufacturer varchar(30) not null,
    expiry_date date not null,
    storage_temperature int,
    drag_concentration int not null
);

create table Appointments (
    doctor_firstname varchar(15) not null,
    doctor_lastname varchar(15) not null,
    doctor_patronymic varchar(15) not null,
    medicine_serial_number int not null,
    primary key (doctor_firstname, doctor_lastname, doctor_patronymic, medicine_serial_number),
    appointment_date date not null,
    patient_firstname varchar(15) not null,
    patient_lastname varchar(15) not null,
    patient_patronymic varchar(15) not null,
    foreign key (medicine_serial_number) references Medicine(serial_number) on delete cascade,
    count int
);

create user doctor@localhost identified by 'doctor';

create view v_Medicine as (
    select code, pills_in_pack, manufacturer, expiry_date,
              storage_temperature, drag_concentration
    from Medicine
    where expiry_date < NOW()
);

grant select (code, pills_in_pack, manufacturer, expiry_date,
              storage_temperature, drag_concentration)
on lab1.v_Medicine
to doctor@localhost;

grant
    select(doctor_firstname, doctor_lastname, doctor_patronymic,
              appointment_date, patient_firstname, patient_lastname, patient_patronymic, count),
    update(patient_firstname, patient_lastname, patient_patronymic, count),
    insert
on lab1.Appointments
to doctor@localhost;
