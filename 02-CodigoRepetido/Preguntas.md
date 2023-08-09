# Preguntas

## Abstracción de los tests 01 y 02 

En los test 01 y 02 hay código repetido. Cuando lo extrajeron crearon algo nuevo. Eso es algo que estaba en la realidad y no estaba representado en nuestro código, por eso teníamos código repetido. ¿Cuál es esa entidad de la realidad que crearon?

- Reutilizamos un método existente en la clase TestCase, que en la realidad representa mediciones en el tiempo.

## Cómo representar en Smalltalk

¿Cuáles son las formas en que podemos representar entes de la realidad en Smalltalk que conocés? Es decir, ¿qué cosas del lenguaje Smalltalk puedo usar para representar entidades de la realidad?

- Para representar entes de la realidad en Smalltalk podemos usar clases, instancias de clases, mensajes, etc.

## Teoría de Naur

¿Qué relación hay entre sacar código repetido (creando abstracciones) y la teoría del modelo/sistema (del paper de Naur)?

- Según Naur, las abstracciones y modificaciones al código deben adherir a la teoría del modelo, para mantener una buena estructura y simplicidad. Además, evitando código repetido se ahorran costos y complejidad durante la modificación.
