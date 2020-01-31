USE AudioStreamingPlatform;

/*1. Haetaan työntekijän Isabella Di Scenza kaikki työtehtävät (ensisijäiset ja toissijaiset).*/
SELECT FirstName, SecondName, PrimaryTask, SecondaryTask
FROM Employee
WHERE FirstName='Isabella' AND SecondName='Di Scenza';

/*2. Haetaan artistin Dark Tranquillity kaikki albumit aikaväliltä 2000-2005.*/
SELECT al.Name
FROM Album AS al, Artist AS ar
WHERE ar.Name='Dark Tranquillity' AND  al.ArtistID = ar.ArtistID
AND al.ReleaseYear BETWEEN 2000 AND 2005;

/*3. Haetaan käyttäjän, jonka ID on 287, kaikki tiedot kuten nimi, sukunimi, maa, kaupunki, rekisteröintipäivämäärä ja tilin tila.*/
SELECT FirstName, SecondName, Country, City, RegistrationDate, AccountStatus
FROM Customer
WHERE CustomerID=287;

/*4. Haetaan kaikki kappaleet albumilta Epitaph lajiteltuna kappaleen pituuden mukaan nousevasti.*/
SELECT Song.Name, SongLength
FROM Song, Album
WHERE Album.AlbumID = Song.AlbumID 
AND Album.Name='Epitaph'
ORDER BY SongLength ASC;

/*5. Lasketaan Atoma -albumin kaikkien kappaleiden pituus yhteensä.*/
SELECT SUM(SongLength) AS 'Atoma -albumin kesto sekunneissa'
FROM Song, Album
WHERE Album.AlbumID = Song.AlbumID
AND Album.Name='Atoma';

/*6. Lasketaan liikevaihdon (taulukko Revenue) keskiarvo (sarakeesta Amount) vuonna 2018 (sarakkeesta RevenueDate).*/
SELECT AVG(Amount)
FROM Revenue
WHERE RevenueDate BETWEEN '2018-01-01' AND '2018-12-31';