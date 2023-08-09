## Preguntas

1. ¿Qué crítica le harías al protocolo de #estaHerido y #noEstaHerido? (en vez de tener solo el mensaje #estaHerido y hacer “#estaHerido not” para saber la negación)

- Es código innecesario ya que uno es el opuesto del otro. Para implementar uno se puede utilizar el que fue implementado anteriormente.


2. ¿Qué opinan de que para algunas funcionalidades tenemos 3 tests para el mismo comportamiento pero aplicando a cada uno de los combatientes (Arthas, Mankrik y Olgra)

- Es importante porque verifica el correcto funcionamiento en todos los combatientes, que son objetos diferentes.


3. ¿Cómo modelaron el resultado de haber desarrollado un combate? ¿qué opciones consideraron y por qué se quedaron con la que entregaron y por qué descartaron a las otras?

- El resultado se obtiene del OrquestadorDeCombates luego de realizada la batalla. Consideramos crear un objeto ResultadoCombate que tenga la información del bando ganador y la cantidad de rondas. Finalmente lo descartamos porque al avanzar con los tests, necesitábamos usar otro protocolo y seguir con ésta implementación requeriría darle más información a este nuevo objeto.
