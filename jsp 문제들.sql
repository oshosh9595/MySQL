select count(*) as 'Count' from countrylanguage where language = 'English';
select CountryCode, language from countrylanguage where CountryCode = 'KOR';

select Region, count(*) from countrylanguage, country 
where countrylanguage.CountryCode=country.Code && language = 'English'
group by Region;
