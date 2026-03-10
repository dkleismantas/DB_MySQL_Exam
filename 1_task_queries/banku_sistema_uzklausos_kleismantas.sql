-- Užklausos atliekamos vienu sakiniu. Užklausos turi veikti nepriklausomai nuo ieškomų duomenų formato (didžiosios/mažosios).

-- 1. Išrinkite visus duomenis iš lentelės “VARTOTOJAI”.

select * from vartotojai;

-- 2. Išveskite, kiek iš viso veikėjų yra lentelėje “VARTOTOJAI”.

select count(*) as Veikejai from vartotojai;

-- 3. Išrinkite duomenis (vardas, pavardė, adresas) apie visas vartotojas moteris.

select vardas, pavarde, adresas from vartotojai where asmens_kodas like '4%';

-- 4. Išrinkite duomenis (pavadinimas, būstinės adresas) apie bankus, kurių ID yra 1 arba 3 arba 4.

select pavadinimas, bustines_adresas from bankai where id in (1, 3, 4);

-- 5. Išrinkite visus bankus (ID, pavadinimas, būstinės adresas), kurių ID yra nuo 2 iki 4.

select id, pavadinimas, bustines_adresas from bankai where id between 2 and 4;

-- 6. Išrinkite visus duomenis apie vartotojus, kurių pavardėje trečia nuo priekio raidė yra “n”.

select * from vartotojai where pavarde like '__n%';

-- 7. Išrinkite visus duomenis apie vartotojus ir išrikiuokite juos pagal asmens kodą nuo didžiausio iki mažiausio.

select * from vartotojai order by asmens_kodas desc;

-- 8. Išrinkite iš lentelės “SASKAITOS” mažiausią ir didžiausią balansus.

select min(balansas) from saskaitos;
select max(balansas) from saskaitos;

-- 9. Išrinkite duomenis (vardas, pavardė, kiekis), kiek iš viso sąskaitų turi kiekvienas vartotojas.

select vardas, pavarde, count(saskaitos_nr) as kiekis from vartotojai left join saskaitos on asmens_kodas = vartotojo_ak group by asmens_kodas;

-- 10. #9 užklausą pataisykite taip, kad rodytų tik tuos vartotojus, kurie turi daugiau nei 2 sąskaitas.

select vardas, pavarde, count(saskaitos_nr) as kiekis from vartotojai join saskaitos on asmens_kodas = vartotojo_ak
group by asmens_kodas having count(saskaitos_nr) > 2;

-- 11. Išrinkite duomenis (pavadinimas, ID, adresas), kiek kiekvienam bankui yra priskirta vartotojų.

select pavadinimas, id, bustines_adresas, count(asmens_kodas) as 'vartotoju kiekis' from bankai
left join saskaitos on id = banko_id join vartotojai on vartotojo_ak = asmens_kodas group by id;

-- 12. Išveskite duomenis (vardas, pavardė, asmens_kodas) apie tuos vartotojus: kurių visų sąskaitų bendra suma (balansas) yra mažesnė nei 500,
-- arba kurie iš viso neturi nė vienos sąskaitos jokioje sąskaitų lentelėje.

select vardas, pavarde, asmens_kodas from vartotojai left join saskaitos on asmens_kodas = vartotojo_ak group by asmens_kodas
having sum(balansas) < 500 or count(saskaitos_nr) = 0;

-- 13. Įterpkite į lentelę “SASKAITOS” naują įrašą, užpildydami visus laukus bei priskirdami jam “Swedbank” banko ID (panaudodami subužklausą).

insert into saskaitos (saskaitos_nr, banko_id, vartotojo_ak, balansas) 
values (12, (select id from bankai where pavadinimas = 'Swedbank'), 35214569870, 4000);

-- 14. Atnaujinkite sąskaitos duomenis apie vartotoją, kurio asmens kodas yra 35681258402, priskirdami jam “Vilniaus bankas” banko ID.

update saskaitos set banko_id = 4 where vartotojo_ak = 35681258402;

-- 15. Ištrinkite iš lentelės “SASKAITOS” įrašą, kurį sukūrėte #13 užklausoje.

delete from saskaitos where saskaitos_nr = 12;