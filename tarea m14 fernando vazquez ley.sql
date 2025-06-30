CREATE DATABASE Biblioteca;
GO

USE Biblioteca;
GO


CREATE TABLE Libro (
    ISBN VARCHAR(20) PRIMARY KEY,
    T�tulo VARCHAR(100) NOT NULL
);

CREATE TABLE Socio (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Pr�stamo (
    ID INT PRIMARY KEY IDENTITY(1,1),
    Fecha DATE NOT NULL DEFAULT GETDATE(),
    ID_Libro VARCHAR(20) NOT NULL,
    ID_Socio INT NOT NULL,
    FOREIGN KEY (ID_Libro) REFERENCES Libro(ISBN),
    FOREIGN KEY (ID_Socio) REFERENCES Socio(ID)
);

-- diagrama
    LIBRO ||--o{ PR�STAMO : "tiene"
    SOCIO ||--o{ PR�STAMO : "realiza"

    LIBRO {
        varchar(20) ISBN PK
        varchar(100) T�tulo NN
        varchar(50) Autor NN
    }

    SOCIO {
        int ID_Socio PK
        varchar(100) Nombre NN
        varchar(20) Tel�fono
    }

    PR�STAMO {
        int ID_Pr�stamo PK
        date Fecha_inicio NN
        date Fecha_devoluci�n
        varchar(20) ISBN FK NN
        int ID_Socio FK NN
    }
