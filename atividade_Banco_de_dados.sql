-- Questao 1
CREATE SCHEMA Empresa;
-- Questao 2
create table Funcionario(
	cpf CHAR(11) PRIMARY KEY,
    nome VARCHAR(100) not null,
    salario float default 2000,
    data_nascimento DATE
);

-- Questao 3
alter table Funcionario add column email varchar(100);

-- Questao 4
create table Departamento(
	id int primary key,
    nome varchar(50) unique,
    gerente char(11),
    foreign key (gerente) references Funcionario(cpf)
);

-- Questao 5
alter table Funcionario add constraint chk_salario2 check(salario > 1000);

-- Questao 6
insert into Funcionario (cpf, nome, salario, data_nascimento, email)
values 
	('12345678911', 'Ana Virn', 2500, '2000-04-04', 'ana@email.com'),
    ('98765432100', 'Maria Bern', 3000, '1985-08-15', 'carlos@email.com'),
  ('45678912300', 'Alice Bern', 1800, '1992-11-25', 'mariana@email.com');
  
set SQL_SAFE_UPDATES =0
-- Questao 7
update Funcionario set salario = 4500 where salario = 2500;

-- Questao 8
delete from Funcionario where cpf = '12345678911';


-- Questao 9
insert into Departamento (id, nome, gerente)
values
(1, 'Financeiro', '98765432100'),
(2, 'TI', '45678912300');

-- Questao 10
select * from Funcionario where salario > 2200;

-- Questao 11
CREATE TABLE Projeto (
    id_projeto INT PRIMARY KEY,
    nome VARCHAR(100),
    local VARCHAR(50),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento(id)
);

-- Questao 12
INSERT INTO Projeto (id_projeto, nome, local, id_departamento) VALUES
(1, 'Sistema ERP', 'São Paulo', 1),
(2, 'Aplicativo Mobile', 'Rio de Janeiro', 2);

-- Questao 13
SELECT 
    p.nome AS projeto,
    d.nome AS departamento,
    f.nome AS gerente
FROM Projeto p
JOIN Departamento d ON p.id_departamento = d.id
JOIN Funcionario f ON d.gerente = f.cpf;