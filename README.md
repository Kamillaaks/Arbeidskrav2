# Arbeidskrav 2
## Om prosjektet
Dette prosjektet er en del av arbeidskrav 2 i emnet Backend-programmering ver Gokstad Akademiet.

Oppgaven går ut på å opprette og arbeide med en relasjonsdatabase for en fiktiv nettbutikk, ved hjelp av MySQL.

Databasen består av tre tabeller: `customers`, `products` og `orders`. Gjennom arbeidskravet har jeg jobbet med å
opprette tabeller og relasjoner, legge inn og hente ut data, og oppdatere og slette informasjon. Jeg har også jobbet
med JOIN, grupperinger, aggregatfunksjoner og transaksjoner.

## Oppsett og kjøring
Prosjektet er laget med MySQL, Dokcer Desktop og DataGrip.

SQL-koden er fordelt på to filer:
- `oppgave-1-database.sql` - Oppreter databasen `nettbutikk`, tabellene og legger inn eksempeldata.
- `oppgave-3-sporringer.sql` - Inneholder SQL-spørringene fra oppgave 3 og 4.

For å kjøre prosjektet må MySQL-serveren være startet, og man må være koblet til serveren gjennom et databaseverktøy, f.eks.
DataGrip.

Kjør først `oppgave-1-database.sql` for å opprette databasen og legge inn eksempeldataene. Så kan `oppgave-3-sporringer.sql` kjøres.

## Forklaringer

### Oppgave 3.15
I denne oppgaven så jeg tilbake på  oppgaver hvor jeg hadde jobbet med JOIN, SUM og GROUP BY. For å finne den kunden som hadde
høyest samlet bestillingsverdi, måtte jeg beregne verdien av bestillingene og summere disse for hver kunde. Etter det så sorterte
jeg resultatet fra høyest til lavest, og brukte LIMIT 1 for å bare vise den kunden som hadde høyest verdi.

Jeg hadde egentlig kommet frem til riktig løsning, men tenkte at det var for lett. Derfor søkte jeg etter andre løsninger,
gjorde noen endringer, fikk feil, og så gikk jeg tilbake til den løsningen jeg hadde aller først.

### Oppgave 4.8
Slettingsrekkefølgen har noe å si fordi `orders` har fremmednøkler som referer til både `products` og `customers`.

Derfor måtte jeg slette bestillingen fra `orders` først, før jeg kunne slette testproduktet og testkunden. Om jeg hadde prøvd
å slette kunden eller produktet først, så ville databasen normalt hindret slettingen pga. fremmednøkkelbegrensningene.

Dette bidrar til å opprettholde dataintegriteten fordi det forhindrer at bestillinger refererer til kunder eller produkter som ikke finnes
lengre. 

### Oppgave 4.9
I denne oppgaven brukte jeg en transaksjon for å registrere en ny bestilling og samtidig redusere lagerbeholdningen til produktet
som ble bestilt.

Jeg brukte START TRANSACTION for å starte transaksjonen, så kontrollerte jeg at begge endringene var riktige, og så avsluttet
jeg med COMMIT.

Om noe hadde gått galt underveis, så kunne jeg ha brukt ROLLBACK for å angre begge endringene, så lenge transaksjonen ikke
allerede var bekreftet med COMMIT.

Transaksjoner er nyttige fordi de gjør det mulig å behandle flere endringer som en samlet operasjon. I en nettbutikk er dette
viktig for å unngå at en bestilling blir registrert uten at lagerbeholdningen blir oppdatert, eller omvendt.

## Bruk av KI
Jeg har brukt ChatGPT som et støtteverktøy under arbeidet med arbeidskravet, hovedsaklig til å finne kilder for, og få forklaringer
på SQL-begreper. 

Jeg har forsøkt å løse oppgavene selv før jeg har bedt om hjelp. Når jeg har stått fast eller vært usikker på om en spørring
var riktig, har jeg brukt KI for å få veiledning, tilbakemeldinger og relevante kilder jeg kunne lese på for å se hvorfor noe var eller
ikke var rett.

KI har bidratt til at jeg har fått bedre forståelse for enkelte SQL-elementer, og har kunne oppdaget feil i spørringene mine, når jeg
selv har "sett meg blind" på dem. Den har med andre ord fungert som en "ruber duck". Jeg har selv vurdert tilbakemeldingene, gjort 
nødvendige endringer og kontrollert resultatene i DataGrip.

Jeg har også opplevd at KI har gitt feilaktige eller motstridende tilbakemeldinger på kode som allerede var riktig. Dette har
gjort meg mer bevisst på at jeg ikke alltid kan stole på svarene jeg får, og at jeg må kontrollere både forslag og resultater selv.
