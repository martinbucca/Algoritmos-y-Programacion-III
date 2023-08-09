!classDefinition: #StackTest category: 'StackPrimeraParte'!
TestCase subclass: #StackTest
	instanceVariableNames: 'stack anElement'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!StackTest methodsFor: 'setUp/tearDown' stamp: 'MB 10/8/2022 18:05:23'!
setUp

	stack := Stack new.
	anElement := 'element1'! !


!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 17:32:49'!
test01StackShouldBeEmptyWhenCreated
	
	self assert: stack isEmpty! !

!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 18:05:39'!
test02StackShouldBeEmptyWhenAddAndRemoveAnElement
	stack push: anElement.
	stack pop.
	self assert: stack isEmpty! !

!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 18:05:46'!
test03StackShouldNotBeEmptyWhenAddAnElement
	stack push: anElement.
	self assert: (stack isEmpty) not! !

!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 18:06:28'!
test04StackPopShouldReturnTheElementPushed
	
	| elementPushed|
	stack push: anElement.
	elementPushed := stack pop.
	self assert: anElement equals: elementPushed! !

!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 18:06:59'!
test05StackPopShouldReturnTheLastElementPushed
	
	| elementPushed element2|
	element2 := 'element2'.
	stack push: anElement.
	stack push: element2.
	elementPushed := stack pop.
	self assert: element2 equals: elementPushed! !

!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 18:07:14'!
test06StackTopShouldReturnTheLastElementPushed
	
	| elementTop element2|
	element2 := 'element2'.
	stack push: anElement.
	stack push: element2.
	elementTop := stack top.
	self assert: element2 equals: elementTop! !

!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 17:57:43'!
test07CanNotTopWithEmptyStack
		
	self should: [stack top ] raise: Error withExceptionDo: [:anError | 
		self assert: anError messageText = Stack stackIsEmptyErrorMessage.
		self assert: stack isEmpty
		]! !

!StackTest methodsFor: 'testing' stamp: 'MB 10/8/2022 17:58:59'!
test08CanNotPopWithEmptyStack		

	self should: [stack pop ] raise: Error withExceptionDo: [:anError | 
		self assert: anError messageText = Stack stackIsEmptyErrorMessage.
		self assert: stack isEmpty
		]! !


!classDefinition: #Stack category: 'StackPrimeraParte'!
Object subclass: #Stack
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'StackPrimeraParte'!

!Stack methodsFor: 'initialization' stamp: 'MB 10/8/2022 17:12:50'!
initialize
	stack := OrderedCollection new! !


!Stack methodsFor: 'error handling' stamp: 'MB 10/8/2022 17:25:35'!
signalErrorStackIsEmpty
	self error: self class stackIsEmptyErrorMessage! !


!Stack methodsFor: 'operations' stamp: 'MB 10/8/2022 17:22:53'!
isEmpty
	^stack isEmpty ! !

!Stack methodsFor: 'operations' stamp: 'MB 10/8/2022 17:34:31'!
pop
	(self isEmpty) ifTrue: [self signalErrorStackIsEmpty ].
	^stack removeLast! !

!Stack methodsFor: 'operations' stamp: 'MB 10/8/2022 17:13:26'!
push: element
	stack add: element! !

!Stack methodsFor: 'operations' stamp: 'MB 10/8/2022 17:47:31'!
top
	(self isEmpty) ifTrue: [self signalErrorStackIsEmpty ].
	^stack at: (stack size)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Stack class' category: 'StackPrimeraParte'!
Stack class
	instanceVariableNames: ''!

!Stack class methodsFor: 'as yet unclassified' stamp: 'MB 10/8/2022 17:25:22'!
stackIsEmptyErrorMessage
	^'Stack is empty'! !
