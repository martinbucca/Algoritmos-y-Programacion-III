!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerAlreadyExists category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CustomerAlreadyExists
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #EmptyCustomer category: 'CodigoRepetido-Ejercicio'!
Error subclass: #EmptyCustomer
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: 'customerBook'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/25/2022 17:13:07'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	self should: [customerBook addCustomerNamed: 'John Lennon'] takeLessThan: 50  milliSeconds.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/25/2022 17:13:02'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| paulMcCartney |
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.

	self should: [customerBook removeCustomerNamed: paulMcCartney] takeLessThan: 100 milliSeconds.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/24/2022 18:51:01'!
test03CanNotAddACustomerWithEmptyName 

	self should: [customerBook addCustomerNamed: ''] raise: EmptyCustomer withExceptionDo: [:anError | 
		self assert: customerBook isEmpty] 
		description: 'Customer name cannot be empty'.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/24/2022 18:51:07'!
test04CanNotRemoveAnInvalidCustomer
	| johnLennon |

	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self should: [customerBook removeCustomerNamed: 'Paul McCartney'] raise: NotFound withExceptionDo:
	[ :anError |
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
		description: 'Can not remove an invalid customer'.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/27/2022 14:31:28'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| paulMcCartney|
	
	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	
	self assertNumberOfActiveCustomerIs: 0 andSuspendedCustomersIs: 1 andCustomersIs: 1.
	self assert: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/27/2022 14:31:04'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	|  paulMcCartney|

	paulMcCartney := 'Paul McCartney'.
	
	customerBook addCustomerNamed: paulMcCartney.
	customerBook suspendCustomerNamed: paulMcCartney.
	customerBook removeCustomerNamed: paulMcCartney.
	
	self assertNumberOfActiveCustomerIs: 0 andSuspendedCustomersIs: 0 andCustomersIs: 0.
	self deny: (customerBook includesCustomerNamed: paulMcCartney).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/24/2022 18:56:37'!
test07CanNotSuspendAnInvalidCustomer
	|  johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
		
	self should: [customerBook suspendCustomerNamed: 'Ringo Starr']
		raise: CantSuspend withExceptionDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].
! !

!CustomerBookTest methodsFor: 'testing' stamp: 'FG 9/24/2022 18:57:06'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| johnLennon |
			
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self should: [customerBook suspendCustomerNamed: johnLennon] raise: CantSuspend withExceptionDo: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ].! !


!CustomerBookTest methodsFor: 'setUp/tearDown' stamp: 'FG 9/24/2022 18:50:42'!
setUp	
	customerBook := CustomerBook new.! !


!CustomerBookTest methodsFor: 'assertions' stamp: 'FG 9/27/2022 14:26:31'!
assertNumberOfActiveCustomerIs: numberActives andSuspendedCustomersIs: numberSuspended andCustomersIs: numberCustomers
	self assert: numberActives equals: customerBook numberOfActiveCustomers.
	self assert: numberSuspended equals: customerBook numberOfSuspendedCustomers.
	self assert: numberCustomers equals: customerBook numberOfCustomers.! !

!CustomerBookTest methodsFor: 'assertions' stamp: 'FG 9/25/2022 17:09:02'!
should: aClosure takeLessThan: aLimit 
	| millisecondsLimit |

	millisecondsLimit := aLimit totalMilliseconds.
	self assert: aClosure millisecondsToRun < millisecondsLimit
		description: [ 'Took more than ', millisecondsLimit printString, ' milliseconds' ].! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'FG 9/25/2022 17:37:45'!
customerIsActive: aName	
	^active includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'FG 9/25/2022 17:38:16'!
customerIsSuspended: aName	
	^suspended includes: aName! !

!CustomerBook methodsFor: 'testing' stamp: 'FG 9/25/2022 17:38:45'!
includesCustomerNamed: aName

	^(self customerIsActive: aName) or: [ self customerIsSuspended: aName ]! !

!CustomerBook methodsFor: 'testing' stamp: 'NR 4/3/2019 10:14:26'!
isEmpty
	
	^active isEmpty and: [ suspended isEmpty ]! !


!CustomerBook methodsFor: 'initialization' stamp: 'FG 9/25/2022 17:42:24'!
initialize

	super initialize.
	active := OrderedCollection new.
	suspended:= OrderedCollection new.! !


!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 18:31:46'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ EmptyCustomer signal ].
	(self includesCustomerNamed: aName) ifTrue: [ CustomerAlreadyExists signal ].
	
	active add: aName! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 4/3/2019 10:14:26'!
numberOfActiveCustomers
	
	^active size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 18:30:38'!
numberOfCustomers
	
	^ self numberOfActiveCustomers + self numberOfSuspendedCustomers.! !

!CustomerBook methodsFor: 'customer management' stamp: 'NR 9/19/2018 17:36:09'!
numberOfSuspendedCustomers
	
	^suspended size! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/24/2022 18:20:18'!
removeCustomerNamed: aName
 	^ active remove: aName ifAbsent: [
		suspended remove: aName ifAbsent: [ NotFound signal ].
		].! !

!CustomerBook methodsFor: 'customer management' stamp: 'FG 9/25/2022 17:39:08'!
suspendCustomerNamed: aName 
	
	(self customerIsActive: aName) ifFalse: [CantSuspend signal].
	
	active remove: aName.
	
	suspended add: aName! !
