## Preguntas teóricas

### Aporte de los mensajes de DD
En un double dispatch (DD), ¿qué información aporta cada uno de los dos llamados?

- El primer llamado aporta informacion sobre la clase del objeto que recibe el mensaje. En el segundo llamado el objeto ya sabe cómo operar con el objeto que recibe, porque tiene un método específico para éste.


### Lógica de instanciado
Con lo que vieron y saben hasta ahora, ¿donde les parece mejor tener la lógica de cómo instanciar un objeto? ¿por qué? ¿Y si se crea ese objeto desde diferentes lugares y de diferentes formas? ¿cómo lo resuelven?

- Nos parece mejor tener la lógica del instanciado del objeto en la clase del mismo, de esta forma cada objeto tiene la responsabilidad de saber cómo instanciarse. Se puede crear de diferentes lugares enviando un mensaje a la clase y que ésta misma se encargue de instanciarlo, también en caso de tener distintas subclasificaciones. 


### Nombres de las categorías de métodos
Con lo que vieron y trabajaron hasta ahora, ¿qué criterio están usando para categorizar métodos?

- Categorizamos métodos según la función que cumplen, ya sea de instanciamiento, inicialización, o operaciones propias del dominio del problema.


### Subclass Responsibility
Si todas las subclases saben responder un mismo mensaje, ¿por qué ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase? ¿para qué sirve?

- De esta forma, obligamos a las subclases a implementar el método que responda a ese mensaje. Al definirlo con “self subclassResponsibility”, si instanciamos esta superclase (que no debería pasar ya que es abstracta) emite un error.


### No rompas
¿Por qué está mal/qué problemas trae romper encapsulamiento?

- Está mal romper el encapsulamiento, porque estamos accediendo a la implentación interna, cuya responsabilidad de resolverla es del otro objeto. El problema que puede traer esto que que el código queda acoplado a los cambios que pueda tener el otro objeto en su implementación interna. Además, si hay cambios en esa implementación, habría que modificar también los objetos que interactuan con éste.
