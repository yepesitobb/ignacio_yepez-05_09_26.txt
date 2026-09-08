
CREATE TABLE tbl_alumnos
(
id_alumno UUID PRIMARY KEY DEFAULT gen_random_vvid(),
nombre VARCHAR (100) not null,
apellido_paterno varchar(100) not null,
apellido_materno varchar(100)null,
fecha_de_nacimiento date not null 
curp VARCHAR (18) not null,
num_telefono_fijo varchar (15) null,
num_telefono_movil varchar (10) not null,
correo_personal varchar (100) null,
correo_institucional varchar (100) null

);

create table ctl_paises(
id_pais bigint generated  always as identity primary key, --genera key  automatico de forma incremnetable
nombre varchar not null,
prefijo varchar (5) not null 
);


create table ctl_estado(
id_estado bigint generated  always as identity primary key,
nombre varchar (100) not null,
id_pais bigint,
constraint fk_paises_to_estados foreign  key (id_pais) references ctl_paises (id_pais) on delete cascade 

);

create table ctl_ciudades (
id_ciudad bigint generated  always as identity primary key,
nombre varchar(100) not null,
estado bigint,
constraint fk_estados_to_ciudades foreign key (id_estado) references ctl estados (id_estado) on delete cascade

);


create table tbl_direcciones(

id_direccion UUID PRIMARY KEY DEFAULT gen_random_vvid(),
calle varchar (50) not null,
numero_ext varchar (10) not null,
numero_int varchar (10) null,
colonia varchar (50) not null,
cp varchar (5) not null,
ciudad bigint,
constraint fk_ciudades_to_direcciones foreign key (id ciudad )ctl ciudades (id_ciudad) on delete cascade,


);

create table rel_alumnos direcciones (
primary key (direccion, alumno),
direccion uuid,
alumno uuid
);

create table tbl_datos_medicos(
id_dato_medico bigint generated  always as identity primary key,
tipo_de_sangre VARCHAR (5) null,
);

create table ctl discapacidades(
id_incapacidad bigint generated  always as identity primary key,
nombre varchar (100)not null,
descripcion varchar (300) not null,

);

create table datos_medicos_discapacidades(

);