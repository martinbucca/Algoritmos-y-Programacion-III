!classDefinition: #NumeroTest category: 'Numeros-Parte2-Ejercicio'!
TestCase subclass: #NumeroTest
	instanceVariableNames: 'zero one two four oneFifth oneHalf five twoFifth twoTwentyfifth fiveHalfs three eight negativeOne negativeTwo'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:50'!
test01isZeroReturnsTrueWhenAskToZero

	self assert: zero isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'LL 9/13/2020 16:17:58'!
test02isZeroReturnsFalseWhenAskToOthersButZero

	self deny: one isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test03isOneReturnsTrueWhenAskToOne

	self assert: one isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 20:13'!
test04isOneReturnsFalseWhenAskToOtherThanOne

	self deny: zero isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:39:57'!
test05EnteroAddsWithEnteroCorrectly

	self assert: two equals: one + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:10'!
test06EnteroMultipliesWithEnteroCorrectly

	self assert: four equals: two * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:22'!
test07EnteroDividesEnteroCorrectly

	self assert: one equals: two / two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:40:57'!
test08FraccionAddsWithFraccionCorrectly
"
    La suma de fracciones es:
	 
	a/b + c/d = (a.d + c.b) / (b.d)
	 
	SI ESTAN PENSANDO EN LA REDUCCION DE FRACCIONES NO SE PREOCUPEN!!
	TODAVIA NO SE ESTA TESTEANDO ESE CASO
"
	| sevenTenths |

	sevenTenths := (Entero with: 7) / (Entero with: 10).

	self assert: sevenTenths equals: oneFifth + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:20'!
test09FraccionMultipliesWithFraccionCorrectly
"
    La multiplicacion de fracciones es:
	 
	(a/b) * (c/d) = (a.c) / (b.d)
"

	self assert: twoTwentyfifth equals: oneFifth * twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:34'!
test10FraccionDividesFraccionCorrectly
"
    La division de fracciones es:
	 
	(a/b) / (c/d) = (a.d) / (b.c)
"

	self assert: fiveHalfs equals: oneHalf / oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:41:58'!
test11EnteroAddsFraccionCorrectly
"
	Ahora empieza la diversion!!
"

	self assert: (Entero with: 6) / (Entero with: 5) equals: one + oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:42:29'!
test12FraccionAddsEnteroCorrectly

	self assert: (Entero with: 6) / (Entero with: 5) equals: oneFifth + one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:16'!
test13EnteroMultipliesFraccionCorrectly

	self assert: twoFifth equals: two * oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:27'!
test14FraccionMultipliesEnteroCorrectly

	self assert: twoFifth equals: oneFifth * two! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:40'!
test15EnteroDividesFraccionCorrectly

	self assert: fiveHalfs equals: one / twoFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:43:58'!
test16FraccionDividesEnteroCorrectly

	self assert: twoTwentyfifth equals: twoFifth / five! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:38'!
test17AFraccionCanBeEqualToAnEntero

	self assert: two equals: four / two! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:39'!
test18AparentFraccionesAreEqual

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:44:53'!
test19AddingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf + oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:13'!
test20MultiplyingFraccionesCanReturnAnEntero

	self assert: one equals: (two/five) * (five/two)! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:27'!
test21DividingFraccionesCanReturnAnEntero

	self assert: one equals: oneHalf / oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:45:40'!
test22DividingEnterosCanReturnAFraccion

	self assert: oneHalf equals: two / four! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:17'!
test23CanNotDivideEnteroByZero

	self 
		should: [ one / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:50:32'!
test24CanNotDivideFraccionByZero

	self 
		should: [ oneHalf / zero ]
		raise: Error
		withExceptionDo: [ :anError | self assert: Numero canNotDivideByZeroErrorDescription equals: anError messageText ]
	! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test25AFraccionCanNotBeZero

	self deny: oneHalf isZero! !

!NumeroTest methodsFor: 'tests' stamp: 'HernanWilkinson 5/7/2016 22:50'!
test26AFraccionCanNotBeOne

	self deny: oneHalf isOne! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:21'!
test27EnteroSubstractsEnteroCorrectly

	self assert: two equals: three - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:36'!
test28FraccionSubstractsFraccionCorrectly
	
	self assert: oneFifth equals: twoFifth - oneFifth! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:46:50'!
test29EnteroSubstractsFraccionCorrectly

	self assert: oneHalf equals: one - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:11'!
test30FraccionSubstractsEnteroCorrectly

	| sixFifth |
	
	sixFifth := (Entero with: 6) / (Entero with: 5).
	
	self assert: oneFifth equals: sixFifth - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:25'!
test31SubstractingFraccionesCanReturnAnEntero

	| threeHalfs |
	
	threeHalfs := (Entero with: 3) / (Entero with: 2).
	
	self assert: one equals: threeHalfs - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:44'!
test32SubstractingSameEnterosReturnsZero

	self assert: zero equals: one - one! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:47:59'!
test33SubstractingSameFraccionesReturnsZero

	self assert: zero equals: oneHalf - oneHalf! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:16'!
test34SubstractingAHigherValueToANumberReturnsANegativeNumber

	| negativeThreeHalfs |
	
	negativeThreeHalfs := (Entero with: -3) / (Entero with: 2).	

	self assert: negativeThreeHalfs equals: one - fiveHalfs! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:45'!
test35FibonacciZeroIsOne

	self assert: one equals: zero fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:48:58'!
test36FibonacciOneIsOne

	self assert: one equals: one fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:24'!
test37FibonacciEnteroReturnsAddingPreviousTwoFibonacciEnteros

	self assert: five equals: four fibonacci.
	self assert: three equals: three fibonacci. 
	self assert: five fibonacci equals: four fibonacci + three fibonacci! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:40'!
test38FibonacciNotDefinedForNegativeNumbers

	self 
		should: [negativeOne fibonacci]
		raise: Error
		withExceptionDo: [ :anError | self assert: Entero negativeFibonacciErrorDescription equals: anError messageText ]! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:52:17'!
test39NegationOfEnteroIsCorrect

	self assert: negativeTwo equals: two negated
		! !

!NumeroTest methodsFor: 'tests' stamp: 'JS 5/5/2022 03:53:27'!
test40NegationOfFraccionIsCorrect

	self assert: negativeOne / two equals: oneHalf negated ! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:11'!
test41SignIsCorrectlyAssignedToFractionWithTwoNegatives

	self assert: oneHalf equals: (negativeOne / negativeTwo)! !

!NumeroTest methodsFor: 'tests' stamp: 'NR 9/23/2018 23:50:17'!
test42SignIsCorrectlyAssignedToFractionWithNegativeDivisor

	self assert: oneHalf negated equals: (one / negativeTwo)! !


!NumeroTest methodsFor: 'setup' stamp: 'NR 9/23/2018 23:46:28'!
setUp

	zero := Entero with: 0.
	one := Entero with: 1.
	two := Entero with: 2.
	three:= Entero with: 3.
	four := Entero with: 4.
	five := Entero with: 5.
	eight := Entero with: 8.
	negativeOne := Entero with: -1.
	negativeTwo := Entero with: -2.
	
	oneHalf := one / two.
	oneFifth := one / five.
	twoFifth := two / five.
	twoTwentyfifth := two / (Entero with: 25).
	fiveHalfs := five / two.
	! !


!classDefinition: #Numero category: 'Numeros-Parte2-Ejercicio'!
Object subclass: #Numero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:48'!
* aMultiplier

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
+ anAdder

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 22:21:28'!
- aSubtrahend

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'HernanWilkinson 5/7/2016 22:49'!
/ aDivisor

	self subclassResponsibility ! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:51:39'!
multiplicarEntero: aMultiplier
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:51:50'!
multiplicarFraccion: aMultiplier
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'NR 9/23/2018 23:37:13'!
negated
	
	^self * (Entero with: -1)! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:52:39'!
serDivididoPorEntero: aDivisor
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:52:36'!
serDivididoPorFraccion: aDivisor
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:52:20'!
serRestadoPorEntero: aSubtrahend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:52:24'!
serRestadoPorFraccion: aSubtrahend
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 20:01:06'!
sumarEntero: anAdder
	self subclassResponsibility.! !

!Numero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:52:02'!
sumarFraccion: anAdder
	self subclassResponsibility.! !


!Numero methodsFor: 'testing' stamp: 'NR 9/23/2018 23:36:49'!
isNegative

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:49'!
isOne

	self subclassResponsibility ! !

!Numero methodsFor: 'testing' stamp: 'FG 10/2/2022 23:29:30'!
isZero
	self subclassResponsibility ! !


!Numero methodsFor: 'private' stamp: 'HernanWilkinson 5/7/2016 22:48'!
invalidNumberType

	self error: self class invalidNumberTypeErrorDescription! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Numero class' category: 'Numeros-Parte2-Ejercicio'!
Numero class
	instanceVariableNames: ''!

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:47:38'!
canNotDivideByZeroErrorDescription

	^'No se puede Dividir por Cero'! !

!Numero class methodsFor: 'error descriptions' stamp: 'NR 5/7/2020 17:46:56'!
invalidNumberTypeErrorDescription
	^ 'Tipo de Número Inválido'! !


!classDefinition: #Entero category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Entero
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 18:41:11'!
* aMultiplier 
	^aMultiplier multiplicarEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:58:16'!
+ anAdder 
	^anAdder sumarEntero: self.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:15:03'!
- aSubtrahend 
	^aSubtrahend serRestadoPorEntero: self
	
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:19:36'!
/ aDivisor 
	^aDivisor serDivididoPorEntero: self! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 20:10:50'!
fibonacci
	self subclassResponsibility.! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 18:38:52'!
multiplicarEntero: aMultiplier
	^self class with: value * aMultiplier integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 18:42:57'!
multiplicarFraccion: aMultiplier
	| newNumerator |
	newNumerator := self value * aMultiplier numerator.
	^ Fraccion with: newNumerator over: aMultiplier denominator! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:19:36'!
serDivididoPorEntero: aDivisor
	^Fraccion with: aDivisor over: self
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:50:45'!
serDivididoPorFraccion: aDivisor
	| newDenominator |
	newDenominator := aDivisor denominator * self value.
	^ Fraccion with: aDivisor numerator over: newDenominator! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 19:11:22'!
serRestadoPorEntero: aSubtrahend
	^ self class with: aSubtrahend integerValue - self integerValue.
! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:18:40'!
serRestadoPorFraccion: aSubtrahend
	| newDenominator newNumerator |
	newNumerator := aSubtrahend numerator - (aSubtrahend denominator * self value).
	newDenominator := aSubtrahend denominator.
	^Fraccion with: newNumerator over: newDenominator
	! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 17:49:56'!
sumarEntero: anAdder
	^self class with: value + anAdder integerValue! !

!Entero methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 17:57:45'!
sumarFraccion: anAdder
	| newNumerator |
	newNumerator := (anAdder denominator * self value) + anAdder numerator.
	^ Fraccion with: newNumerator over: anAdder denominator! !


!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 21:01'!
= anObject

	^(anObject isKindOf: self class) and: [ value = anObject integerValue ]! !

!Entero methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:17'!
hash

	^value hash! !


!Entero methodsFor: 'initialization' stamp: 'JS 5/5/2022 03:55:37'!
initializeWith: aValue 
	
	value := aValue! !


!Entero methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:02'!
integerValue

	"Usamos integerValue en vez de value para que no haya problemas con el mensaje value implementado en Object - Hernan"
	
	^value! !


!Entero methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:53:19'!
printOn: aStream

	aStream print: value ! !


!Entero methodsFor: 'testing' stamp: 'FG 10/2/2022 18:35:40'!
isMoreThanOne
	
	^value > 1! !

!Entero methodsFor: 'testing' stamp: 'FG 10/2/2022 20:37:07'!
isNegative
	^value < 0! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:14'!
isOne
	
	^value = 1! !

!Entero methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 20:12'!
isZero
	
	^value = 0! !


!Entero methodsFor: 'arithmetic operations - private' stamp: 'FG 10/2/2022 17:57:29'!
// aDivisor 
	
	^self class with: value // aDivisor integerValue! !

!Entero methodsFor: 'arithmetic operations - private' stamp: 'HernanWilkinson 5/7/2016 21:00'!
greatestCommonDivisorWith: anEntero 
	
	^self class with: (value gcd: anEntero integerValue)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Entero class' category: 'Numeros-Parte2-Ejercicio'!
Entero class
	instanceVariableNames: ''!

!Entero class methodsFor: 'instance creation' stamp: 'FG 10/2/2022 20:19:35'!
isTheClassOfTheValue: aValue
	self subclassResponsibility ! !

!Entero class methodsFor: 'instance creation' stamp: 'NR 4/8/2019 02:57:57'!
negativeFibonacciErrorDescription
	^ ' Fibonacci no está definido aquí para Enteros Negativos'! !

!Entero class methodsFor: 'instance creation' stamp: 'FG 10/2/2022 20:19:36'!
with: aValue 
	| selectedSubclass |	
	"Esta verificacion esta puesta por si se equivocan y quieren crear un Entero pasando otra cosa que un Integer - Hernan"
	aValue isInteger ifFalse: [  self error: 'aValue debe ser anInteger' ].
	
	selectedSubclass := Entero subclasses detect: [:enteroSubclass | (enteroSubclass isTheClassOfTheValue: aValue)].
	^selectedSubclass new initializeWith: aValue.
! !


!classDefinition: #MoreThanOne category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #MoreThanOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!MoreThanOne methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 20:11:08'!
fibonacci
	| one two |
	one := Entero with: 1.
	two := Entero with: 2.
	
	^ ( self - one) fibonacci + (self - two) fibonacci.! !


!MoreThanOne methodsFor: 'initialization' stamp: 'FG 10/2/2022 20:03:37'!
initializeWith: aValue
	value := aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoreThanOne class' category: 'Numeros-Parte2-Ejercicio'!
MoreThanOne class
	instanceVariableNames: ''!

!MoreThanOne class methodsFor: 'as yet unclassified' stamp: 'FG 10/2/2022 20:19:35'!
isTheClassOfTheValue: aValue
	^ aValue > 1.! !


!classDefinition: #Negative category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #Negative
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Negative methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 18:53:53'!
fibonacci
	^self error: Entero negativeFibonacciErrorDescription! !


!Negative methodsFor: 'initialization' stamp: 'FG 10/2/2022 20:03:42'!
initializeWith: aValue
	value := aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Negative class' category: 'Numeros-Parte2-Ejercicio'!
Negative class
	instanceVariableNames: ''!

!Negative class methodsFor: 'as yet unclassified' stamp: 'FG 10/2/2022 20:19:35'!
isTheClassOfTheValue: aValue
	^ aValue < 0.! !


!classDefinition: #ZeroOrOne category: 'Numeros-Parte2-Ejercicio'!
Entero subclass: #ZeroOrOne
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!ZeroOrOne methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 18:56:31'!
fibonacci
	^ Entero with: 1! !


!ZeroOrOne methodsFor: 'initialization' stamp: 'FG 10/2/2022 20:03:45'!
initializeWith: aValue
	value := aValue.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ZeroOrOne class' category: 'Numeros-Parte2-Ejercicio'!
ZeroOrOne class
	instanceVariableNames: ''!

!ZeroOrOne class methodsFor: 'as yet unclassified' stamp: 'FG 10/2/2022 20:19:36'!
isTheClassOfTheValue: aValue
	^ (aValue = 0) or: (aValue = 1)! !


!classDefinition: #Fraccion category: 'Numeros-Parte2-Ejercicio'!
Numero subclass: #Fraccion
	instanceVariableNames: 'numerator denominator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 18:43:14'!
* aMultiplier 
	^aMultiplier multiplicarFraccion: self.
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:51:02'!
+ anAdder 
	^anAdder sumarFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:15:57'!
- aSubtrahend 
	^aSubtrahend serRestadoPorFraccion: self	
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:50:56'!
/ aDivisor
	^aDivisor  serDivididoPorFraccion: self.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 18:40:51'!
multiplicarEntero: aMultiplier
	| newNumerator |
	newNumerator := aMultiplier value * self numerator.
	^ Fraccion with: newNumerator over: self denominator.! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 18:41:55'!
multiplicarFraccion: aMultiplier
	^(numerator * aMultiplier numerator) / (denominator * aMultiplier denominator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:43:46'!
serDivididoPorEntero: aDivisor
	| newNumerator |
	newNumerator := aDivisor value * self denominator.
	^ Fraccion with: newNumerator over: self numerator
! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 10/2/2022 17:45:16'!
serDivididoPorFraccion: aDivisor
	^(aDivisor numerator * self denominator) / (aDivisor denominator * self numerator)! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:18:14'!
serRestadoPorEntero: aSubtrahend
	| newDenominator newNumerator |
	newNumerator := (aSubtrahend value * self denominator) - self numerator.
	newDenominator := self denominator.
	^Fraccion with: newNumerator over: newDenominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 19:15:57'!
serRestadoPorFraccion: aSubtrahend

	| newDenominator newNumerator |
	newNumerator := (aSubtrahend numerator *  denominator) - (aSubtrahend denominator *  numerator).
	newDenominator := denominator * aSubtrahend denominator.
	
	^newNumerator / newDenominator ! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 17:51:18'!
sumarEntero: anAdder
	| newNumerator |
	newNumerator := (self denominator * anAdder value) + self numerator.
		^ Fraccion with: newNumerator over: self denominator! !

!Fraccion methodsFor: 'arithmetic operations' stamp: 'FG 9/30/2022 17:55:49'!
sumarFraccion: anAdder
	| newDenominator newNumerator |
	newNumerator := (numerator * anAdder denominator) + (denominator * anAdder numerator).
	newDenominator := denominator * anAdder denominator.
	^newNumerator / newDenominator! !


!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:42'!
= anObject

	^(anObject isKindOf: self class) and: [ (numerator * anObject denominator) = (denominator * anObject numerator) ]! !

!Fraccion methodsFor: 'comparing' stamp: 'HernanWilkinson 5/7/2016 20:50'!
hash

	^(numerator hash / denominator hash) hash! !


!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
denominator

	^ denominator! !

!Fraccion methodsFor: 'accessing' stamp: 'HernanWilkinson 5/7/2016 21:56'!
numerator

	^ numerator! !


!Fraccion methodsFor: 'initialization' stamp: ',B 10/2/2022 22:39:15'!
initializeWith: aNumerator over: aDenominator
	
	"Estas precondiciones estan por si se comenten errores en la implementacion - Hernan"
	aNumerator isZero ifTrue: [ self error: 'una fraccion no puede ser cero' ].
	aDenominator isOne ifTrue: [ self error: 'una fraccion no puede tener denominador 1 porque sino es un entero' ].
	self subclassResponsibility.
	! !


!Fraccion methodsFor: 'testing' stamp: 'NR 9/23/2018 23:41:38'!
isNegative
	
	^numerator < 0! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isOne
	
	^false! !

!Fraccion methodsFor: 'testing' stamp: 'HernanWilkinson 5/7/2016 22:51'!
isZero
	
	^false! !


!Fraccion methodsFor: 'printing' stamp: 'HAW 9/24/2018 08:54:46'!
printOn: aStream

	aStream 
		print: numerator;
		nextPut: $/;
		print: denominator ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Fraccion class' category: 'Numeros-Parte2-Ejercicio'!
Fraccion class
	instanceVariableNames: ''!

!Fraccion class methodsFor: 'intance creation' stamp: 'FG 10/2/2022 23:23:52'!
isTheClassOfTheDividend: aDividend over: aDivisor
	self subclassResponsibility! !

!Fraccion class methodsFor: 'intance creation' stamp: 'FG 10/2/2022 23:23:53'!
with: aDividend over: aDivisor
	| selectedSubclass|
	selectedSubclass := Fraccion subclasses detect: [:fraccionSubclass | (fraccionSubclass isTheClassOfTheDividend: aDividend over: aDivisor)].
	^selectedSubclass new initializeWith: aDividend over: aDivisor.! !


!classDefinition: #DenominadorUno category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #DenominadorUno
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!DenominadorUno methodsFor: 'initialization' stamp: ',B 10/2/2022 22:43:45'!
initializeWith: aDividend over: aDivisor
	|greatestCommonDivisor|
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 

	 ^(aDividend // greatestCommonDivisor)
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DenominadorUno class' category: 'Numeros-Parte2-Ejercicio'!
DenominadorUno class
	instanceVariableNames: ''!

!DenominadorUno class methodsFor: 'instance creation' stamp: 'FG 10/2/2022 23:23:52'!
isTheClassOfTheDividend: aDividend over: aDivisor
	|denominator greatestCommonDivisor |
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	denominator := aDivisor // greatestCommonDivisor.
	^denominator isOne! !


!classDefinition: #DividendoCero category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #DividendoCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!DividendoCero methodsFor: 'initialization' stamp: ',B 10/2/2022 22:46:26'!
initializeWith: aDividend over: aDivisor
	^aDividend
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DividendoCero class' category: 'Numeros-Parte2-Ejercicio'!
DividendoCero class
	instanceVariableNames: ''!

!DividendoCero class methodsFor: 'instance creation' stamp: 'FG 10/2/2022 23:23:52'!
isTheClassOfTheDividend: aDividend over: aDivisor
	^aDividend isZero
! !


!classDefinition: #DivisorCero category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #DivisorCero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!DivisorCero methodsFor: 'initialization' stamp: 'FG 10/2/2022 23:21:50'!
initializeWith: aDividend over: aDivisor
	self error: self class canNotDivideByZeroErrorDescription
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DivisorCero class' category: 'Numeros-Parte2-Ejercicio'!
DivisorCero class
	instanceVariableNames: ''!

!DivisorCero class methodsFor: 'instance creation' stamp: 'FG 10/2/2022 23:23:52'!
isTheClassOfTheDividend: aDividend over: aDivisor
	^aDivisor isZero! !


!classDefinition: #DivisorNegativo category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #DivisorNegativo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!DivisorNegativo methodsFor: 'initialization' stamp: ',B 10/2/2022 22:51:53'!
initializeWith: aDividend over: aDivisor
	^(aDividend negated / aDivisor negated)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DivisorNegativo class' category: 'Numeros-Parte2-Ejercicio'!
DivisorNegativo class
	instanceVariableNames: ''!

!DivisorNegativo class methodsFor: 'instance creation' stamp: 'FG 10/2/2022 23:23:53'!
isTheClassOfTheDividend: aDividend over: aDivisor
	^aDivisor isNegative! !


!classDefinition: #RestoDeCasos category: 'Numeros-Parte2-Ejercicio'!
Fraccion subclass: #RestoDeCasos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros-Parte2-Ejercicio'!

!RestoDeCasos methodsFor: 'initialization' stamp: 'FG 10/2/2022 23:20:26'!
initializeWith: aDividend over: aDivisor
	| greatestCommonDivisor |
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	
	numerator := aDividend // greatestCommonDivisor.
	denominator  := aDivisor // greatestCommonDivisor.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'RestoDeCasos class' category: 'Numeros-Parte2-Ejercicio'!
RestoDeCasos class
	instanceVariableNames: ''!

!RestoDeCasos class methodsFor: 'instance creation' stamp: 'FG 10/2/2022 23:23:53'!
isTheClassOfTheDividend: aDividend over: aDivisor
	| denominator greatestCommonDivisor  denominatorIsNotOne |
	greatestCommonDivisor := aDividend greatestCommonDivisorWith: aDivisor. 
	denominator := aDivisor // greatestCommonDivisor.
	denominatorIsNotOne := (denominator = 1) not.
	^(((aDivisor isNegative) not) and: ((aDividend = 0) not) and: denominatorIsNotOne)! !
