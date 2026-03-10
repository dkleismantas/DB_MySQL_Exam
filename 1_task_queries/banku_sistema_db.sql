DROP DATABASE IF EXISTS banku_sistema;
CREATE DATABASE banku_sistema;
USE banku_sistema;

-- table: bankai
CREATE TABLE bankai (
    id INT NOT NULL,
    pavadinimas VARCHAR(30) NOT NULL,
    bustines_adresas VARCHAR(30),
    pagalbos_tel_nr VARCHAR(20),
    PRIMARY KEY (id)
);

INSERT INTO bankai (id, pavadinimas, bustines_adresas, pagalbos_tel_nr) VALUES
(1, 'SEB', 'Va ten 15', '+3701'),
(2, 'Swedbank', 'Anaten 6', '+3702'),
(3, 'DNB', 'Sitaiten 20', '+3703'),
(4, 'Vilniaus Bankas', 'Centro 30', '+3704');

-- table: vartotojai
CREATE TABLE vartotojai (
    asmens_kodas BIGINT NOT NULL,
    vardas VARCHAR(30),
    pavarde VARCHAR(30),
    adresas VARCHAR(40),
    tel_nr VARCHAR(20),
    PRIMARY KEY (asmens_kodas)
);

INSERT INTO vartotojai (asmens_kodas, vardas, pavarde, adresas, tel_nr) VALUES
(35214569870, 'Jonas', 'Jonaitis', 'Vilnius 12', '+37011'),
(35681258402, 'Petras', 'Jonaitis', 'Vilnius 13', '+37022'),
(36621056870, 'Arturas', 'Grauzinenas', 'Zarasai 1', '+37055'),
(40210587691, 'Julija', 'Jonaitiene', 'Vilnius 12', '+37044'),
(46521025687, 'Petra', 'Kvarbatka', 'Kaunas 20', '+37033');

-- table: saskaitos
CREATE TABLE saskaitos (
    saskaitos_nr INT NOT NULL,
    banko_id INT NOT NULL,
    vartotojo_ak BIGINT NOT NULL,
    balansas DECIMAL(12,2),
    PRIMARY KEY (saskaitos_nr),
    FOREIGN KEY (banko_id) REFERENCES bankai(id),
    FOREIGN KEY (vartotojo_ak) REFERENCES vartotojai(asmens_kodas)
);

INSERT INTO saskaitos (saskaitos_nr, banko_id, vartotojo_ak, balansas) VALUES
(1, 1, 35214569870, 50),
(2, 2, 35214569870, 650),
(3, 3, 35681258402, 3000),
(4, 4, 36621056870, 600),
(5, 2, 40210587691, 800),
(6, 3, 36621056870, 7000),
(7, 1, 35681258402, 1),
(8, 3, 35214569870, 700),
(9, 3, 40210587691, 6587),
(10, 2, 36621056870, 87),
(11, 4, 35214569870, 1234);
