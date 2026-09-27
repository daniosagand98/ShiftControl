# Grafik Zmian / Arbeidsplan

Mobilna aplikacja przeglądarkowa dla zespołu. Działa od razu w trybie demonstracyjnym na jednym urządzeniu. Synchronizacja między telefonami wymaga bezpłatnego projektu Supabase.

## Uruchomienie
1. Rozpakuj ZIP i wgraj `index.html` na GitHub Pages tak jak poprzednią aplikację.
2. Otwórz stronę na telefonie. W Ustawieniach można dodać pracowników.
3. Aby włączyć synchronizację, utwórz projekt Supabase, otwórz SQL Editor i uruchom zawartość `supabase.sql`.
4. Z Project Settings > API skopiuj Project URL oraz anon/publishable key.
5. W aplikacji przejdź do Ustawień, wpisz oba pola i wybierz Połącz. Te same dane wpisz na każdym telefonie.

## Logika
- Cotygodniowa rotacja: 05:30, 07:00, 09:00.
- Osoba na 09:00 ma oznaczenie Vakt.
- Wolne jest czerwone dla całego zespołu.
- Zastępstwo proponowane jest pracownikowi z najmniejszą liczbą przyjętych zastępstw, z wyłączeniem osób mających wolne.
- Można dodawać kolejnych pracowników.
- Język PL/NO zmienia się w prawym górnym rogu.

## Uwaga o bezpieczeństwie
Dostarczona konfiguracja SQL jest prostym wariantem dla małego, zaufanego zespołu i korzysta ze wspólnego klucza publicznego. Przed publikacją poza zespołem należy dodać logowanie Supabase Auth i ograniczone polityki RLS.


## Konta użytkowników
Każdy pracownik tworzy konto e-mail i podaje swoje imię: Daniel, Adam albo Kevin. Po potwierdzeniu adresu e-mail loguje się do wspólnego grafiku. Połączenie z bazą jest dostępne wyłącznie dla zalogowanych użytkowników dzięki politykom RLS z pliku `supabase.sql`.
