!classDefinition: #MarsRoverTest category: 'Mars Rover'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:17:01'!
test01MarsRoverStaysInInitialPositionAfterRecievingEmptyCommand
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: ''.
	self assert: marsRover position equals: 0@0! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:17:54'!
test02MarsRoverStaysInInitialDirectionAfterRecievingEmptyCommand
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: ''.
	self assert: marsRover direction equals: 'N'! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:21:23'!
test03MarsRoverChangesPositionAfterMovingFordwards
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: 'f'.
	self assert: marsRover position equals: 0@1
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:21:41'!
test04MarsRoverChangesPositionAfterMovingBackwards
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: 'b'.
	self assert: marsRover position equals: 0@-1
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:20:51'!
test05MarsRoverPositionAndDirectionChangesAfterTurningLeftAndMovingForward
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: 'lf'.
	self assert: marsRover position equals: -1@0.
	self assert: marsRover direction equals: 'O'
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:23:28'!
test06MarsRoverPositionAndDirectionChangesAfterTurningRightAndMovingForward
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: 'rf'.
	self assert: marsRover position equals: 1@0.
	self assert: marsRover direction equals: 'E'
! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:23:20'!
test07MarsRoverPositionChangesAfterTurningLeftTwiceAndMovingForward
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: 'llf'.
	self assert: marsRover position equals: 0@-1.

	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:24:06'!
test08MarsRoverPositionChangesAfterTurningLeftTwiceAndMovingBackwards
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: 'llb'.
	self assert: marsRover position equals: 0@1
	! !

!MarsRoverTest methodsFor: 'testing' stamp: 'MB 11/4/2022 14:26:10'!
test09MarsRoverStopProcessingAfterRecievingIncorrectCommand
	|marsRover|
	marsRover := MarsRover new.
	marsRover move: 'llbkf'.
	self assert: marsRover position equals: 0@1
	! !


!classDefinition: #CardinalPoint category: 'Mars Rover'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!CardinalPoint methodsFor: 'operations' stamp: 'MB 11/3/2022 20:54:29'!
moveBackwards
	^self moveForwards negated! !

!CardinalPoint methodsFor: 'operations' stamp: 'MB 11/3/2022 20:54:20'!
moveForwards
	^self subclassResponsibility ! !

!CardinalPoint methodsFor: 'operations' stamp: 'MB 11/3/2022 21:03:45'!
turnLeft
	^self subclassResponsibility ! !

!CardinalPoint methodsFor: 'operations' stamp: 'MB 11/3/2022 21:04:01'!
turnRight
	^self subclassResponsibility ! !


!CardinalPoint methodsFor: 'accessing' stamp: 'MB 11/3/2022 20:58:59'!
direction
	^self subclassResponsibility ! !


!classDefinition: #East category: 'Mars Rover'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!East methodsFor: 'accessing' stamp: 'MB 11/3/2022 20:59:11'!
direction
	^'E'! !


!East methodsFor: 'operations' stamp: 'MB 11/3/2022 20:50:57'!
moveForwards
	^(1@0)! !

!East methodsFor: 'operations' stamp: 'MB 11/3/2022 21:03:45'!
turnLeft
	^North new! !

!East methodsFor: 'operations' stamp: 'MB 11/3/2022 21:04:01'!
turnRight
	^South new! !


!classDefinition: #North category: 'Mars Rover'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!North methodsFor: 'accessing' stamp: 'MB 11/3/2022 20:59:24'!
direction
	^'N'! !


!North methodsFor: 'operations' stamp: 'MB 11/3/2022 20:51:56'!
moveForwards
	^(0@1)! !

!North methodsFor: 'operations' stamp: 'MB 11/3/2022 21:03:45'!
turnLeft
	^West new! !

!North methodsFor: 'operations' stamp: 'MB 11/3/2022 21:04:01'!
turnRight
	^East new! !


!classDefinition: #South category: 'Mars Rover'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!South methodsFor: 'accessing' stamp: 'MB 11/3/2022 20:59:31'!
direction
	^'S'! !


!South methodsFor: 'operations' stamp: 'MB 11/3/2022 20:52:23'!
moveForwards
	^(0@-1)! !

!South methodsFor: 'operations' stamp: 'MB 11/3/2022 21:03:45'!
turnLeft
	^East new! !

!South methodsFor: 'operations' stamp: 'MB 11/3/2022 21:04:01'!
turnRight
	^West new! !


!classDefinition: #West category: 'Mars Rover'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!West methodsFor: 'accessing' stamp: 'MB 11/3/2022 20:59:39'!
direction
	^'O'! !


!West methodsFor: 'operations' stamp: 'MB 11/3/2022 20:55:21'!
moveForwards
	^(-1@0)! !

!West methodsFor: 'operations' stamp: 'MB 11/3/2022 21:03:45'!
turnLeft
	^South new! !

!West methodsFor: 'operations' stamp: 'MB 11/3/2022 21:04:01'!
turnRight
	^North new! !


!classDefinition: #Command category: 'Mars Rover'!
Object subclass: #Command
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!Command methodsFor: 'operations' stamp: 'MB 11/4/2022 14:34:53'!
execute: aMarsRover
	^self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Command class' category: 'Mars Rover'!
Command class
	instanceVariableNames: ''!

!Command class methodsFor: 'instance creation' stamp: 'MB 11/4/2022 15:03:40'!
initializeWith: aCommand

	^ Command subclasses 
		detect: [:commandSubclass| commandSubclass isTheClassOfTheCommand: aCommand]
		ifFound: [:commandSelected | commandSelected new]
		ifNone: [	InvalidCommand new]


	! !


!Command class methodsFor: 'private' stamp: 'MB 11/4/2022 14:42:22'!
isTheClassOfTheCommand: aCommand
	^self subclassResponsibility ! !


!classDefinition: #InvalidCommand category: 'Mars Rover'!
Command subclass: #InvalidCommand
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!InvalidCommand methodsFor: 'operations' stamp: 'MB 11/4/2022 14:58:13'!
execute: aMarsRover
	^false! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'InvalidCommand class' category: 'Mars Rover'!
InvalidCommand class
	instanceVariableNames: ''!

!InvalidCommand class methodsFor: 'private' stamp: 'MB 11/4/2022 15:04:19'!
isTheClassOfTheCommand: aCommand
	^false! !


!classDefinition: #MoveBackward category: 'Mars Rover'!
Command subclass: #MoveBackward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MoveBackward methodsFor: 'operations' stamp: 'MB 11/4/2022 14:58:07'!
execute: aMarsRover
	aMarsRover moveBackwards.
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveBackward class' category: 'Mars Rover'!
MoveBackward class
	instanceVariableNames: ''!

!MoveBackward class methodsFor: 'private' stamp: 'MB 11/4/2022 14:44:05'!
isTheClassOfTheCommand: aCommand
	^aCommand = 'b'! !


!classDefinition: #MoveForward category: 'Mars Rover'!
Command subclass: #MoveForward
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MoveForward methodsFor: 'operations' stamp: 'MB 11/4/2022 14:58:02'!
execute: aMarsRover
	aMarsRover moveForwards.
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MoveForward class' category: 'Mars Rover'!
MoveForward class
	instanceVariableNames: ''!

!MoveForward class methodsFor: 'private' stamp: 'MB 11/4/2022 14:44:26'!
isTheClassOfTheCommand: aCommand
	^aCommand = 'f'! !


!classDefinition: #TurnLeft category: 'Mars Rover'!
Command subclass: #TurnLeft
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!TurnLeft methodsFor: 'operations' stamp: 'MB 11/4/2022 14:57:57'!
execute: aMarsRover
	aMarsRover turnLeft.
	^true! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnLeft class' category: 'Mars Rover'!
TurnLeft class
	instanceVariableNames: ''!

!TurnLeft class methodsFor: 'private' stamp: 'MB 11/4/2022 14:44:38'!
isTheClassOfTheCommand: aCommand
	^aCommand = 'l'! !


!classDefinition: #TurnRight category: 'Mars Rover'!
Command subclass: #TurnRight
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!TurnRight methodsFor: 'operations' stamp: 'MB 11/4/2022 14:57:53'!
execute: aMarsRover
	aMarsRover turnRight.
	^true
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TurnRight class' category: 'Mars Rover'!
TurnRight class
	instanceVariableNames: ''!

!TurnRight class methodsFor: 'private' stamp: 'MB 11/4/2022 14:44:44'!
isTheClassOfTheCommand: aCommand
	^aCommand = 'r'! !


!classDefinition: #MarsRover category: 'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'position cardinalPoint'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'operations' stamp: 'MB 11/4/2022 14:58:46'!
move: aString
	(1 to: aString size) do: [
		:index| |actualLetter status command|
		actualLetter  := (aString at: index) asString.
		command := Command initializeWith: actualLetter.
		status := command execute: self.
		status ifFalse: [^self]
		]


! !

!MarsRover methodsFor: 'operations' stamp: 'MB 11/3/2022 21:02:48'!
moveBackwards
		position := position + cardinalPoint moveBackwards

! !

!MarsRover methodsFor: 'operations' stamp: 'MB 11/3/2022 21:02:54'!
moveForwards
		position := position + cardinalPoint moveForwards

! !

!MarsRover methodsFor: 'operations' stamp: 'MB 11/3/2022 21:04:51'!
turnLeft
	cardinalPoint := cardinalPoint turnLeft

	! !

!MarsRover methodsFor: 'operations' stamp: 'MB 11/3/2022 21:04:43'!
turnRight
	cardinalPoint := cardinalPoint turnRight
! !


!MarsRover methodsFor: 'initializing' stamp: 'MB 11/3/2022 20:58:37'!
initialize
	position := 0@0.
	cardinalPoint := North new! !


!MarsRover methodsFor: 'accesing' stamp: 'MB 11/3/2022 20:58:46'!
direction
	^cardinalPoint direction! !

!MarsRover methodsFor: 'accesing' stamp: 'MB 11/3/2022 19:37:52'!
position
	^position! !
