( -------------------------------------------------------------	)

( ANOTACIONES: 																	)



( T#: Número de herramienta que vamos a utilizar. 												)

(	Hay otras máquinas que tienen un magazine (cargador) con varias herramientas.								)

( 	Esto nos permite hacer un programa donde, por ejemplo, una parte se trabaja con una fresa de 5mm y otra parte con una fresa de 1mm. 	)

( 	Nuestra CNC no tiene magazine, pero de todas formas nos permite hacer cambio de herramienta manual si fuera necesario.			)

(	En ese caso se utiliza G5 que es la suspensión momentánea de programa. 									)

(																		)

(	T1 --> Usar la prmera herramienta, la unica que tenemos 										)

(																		)

(																		)

( M#: Controlar el husillo para: Arrancar en horario, antihorario o detenerlo 									)

( 	M3 --> Arrancar en sentido horario		 											)

( 	M4 --> Arrancar en sentido anti -horario	 											)

( 	M5 --> Detener el husillo														)

( 	M2 --> Finalizar el Programa ( Implica M5 )												)

(																		)

(																		)

( S#: Controlar la velocidad de giro del husillo												)

(	S1 --> Velocidad de giro en 1, 	es la que vamos a usar											)

(																		)

(																		)

( F#: Velocidad de desplazamiento en mm/min 													)

(	F100 --> 100 mm / min, 		es la que vamos a usar											)

(																		)

(																		)

( G## No se como categorizarlo 															)

(	G90: Especifica que todo lo que se escriba a continuación será con el sistema de coordenadas respecto al origen (0,0) )			)

(		Un ejemplo de G90 se vería asi:													)

(		 > Ir a la coordenada Y20 (no afecta X, sigue en X=0										)

(		 > Ir a la coordenada X30 (no afecta Y, sigue en Y=2)										)

(		 > Ir a la coordenada Y30 (no afecta X, sigue en X=3)										)

(		 > Ir a la coordenada X20 (no afecta Y, sigue en Y=3)										)

(		 > Ir a la coordenada Y10 (no afecta X, sigue en X=2)										)

(		En este caso, con leer las últimas dos líneas es suficiente para saber dónde quedo la fresa					)

(																		)

(	G91: Especifica que todo lo que se escriba a continuación será en referencia a la posición actual. ( moverse en mm )			)

(		Un ejemplo de G91 se vería asi:													)

(		 > Movete en Y 20mm														)

(		 > en X 30mm															)

(		 > en Y 10mm															)

(		 > en -X 10mm															)

(		 > en -Y 20mm															)

(		En este caso, no se entiende donde quedó al final la fresa, sino que hay que ir siguiendo la fresa paso a paso.			)

(																		)

(																		)

(	G92: Cambio de cero matemático por programación. 											)

(	Permite redefinir la posición actual. 													)

(	Es útil para "copiar y pegar" un bloque de código, 											)

(	cuando tenemos una figura que se tiene que repetir											)

(																		)

(	usamos el G92 para decir " esta posición, ahora es 0,0,Z "										)

(																		)

(																		)

(																		)

(	G0: Velocidad de desplazamiento rápida o "aérea" .											)

(	Se utiliza para ir rápidamente de un punto a otro pero SIN ESTAR MECANIZANDO LA PIEZA, SIN "COMER" MATERIAL				)

(																		)

(	G1: Velocidad de mecanizado.														)

(	s suficientemente lento como para que la fresa pueda despejar el material que está "comiendo" sin flexionarla				)

(			********************************************************************							)

(																		)

(	*** IMPORTANTE   IMPORTANTE   IMPORTANTE   IMPORTANTE   IMPORTANTE   IMPORTANTE : ***							)

(		       confundir un G1 con un G0 es GARANTáA de que la fresa se va a partir							)

(			********************************************************************							)

(	G2: Movimiento circular en sentido horario.												)

(	Necesita parametros adicionales: posición final en X, en Y y el radio de giro.								)

( 	La posición inicial y la final no pueden ser iguales, por lo tanto no sirve para hacer un circulo completo.				)

(	En tal caso se pueden usar dos líneas de código, donde cada una es un semi-circulo.							)

(																		)

(																		)

(	G3: Igual a G2 en sentido anti-horario													)

(	Generalmente al final de un bloque G2 o G3 se vuelve a G0 o G1 según sea necesario							)

(																		)

(		Traduccion de esto ultimo, reemplazando G# por su accion correspondiente:							)

(	Generalmente al final de un bloque que gira en sentido horario o antihorario,								)

(	se vuelve a la velocidad de desplazamiento o a la de mecanizado.									)

(																		)

(	O sea, que uno puede hacer un giro con G2-3 y tiene 2 opciones										)

(		--> Cambiar a velocidad de "Seguir Mecanizando"											)

(		--> Cambiar a velocidad de "Moverse sin mecanizar"										)

(																		)

( ---------------------------------------------------------------------------------------------------------------------------------------------	)





( PROGRAMA CON EXPLICACION: )



T1			( Usar la herramienta 1 )

F100 S1 M3		( Velocidad de desplazamiento 100  ----  Velocidad de giro de husillo 1  ----  Arranque de Husillo en Sentido Horario )

G90 G0 X30 Y30 Z50	( Se va a usar el sistema de coordenadas respecto al origen (0,0) ----  Velocidad de desplazamiento rápida ----  Coordenada X## Y## Z 50 ( Z es la altura ) )



(acercamiento a la posición del primer mecanizado)



Z3 			( Mover a la coordenada Z = 3 )

G1 Z-30			( Pasar a velocidad de mecanizado  ----  Moverse a altura de Z = -# , Aqui lo importante es reemplazar " # " por un valor numerico. )

			( Este valor numerico NEGATIVO tiene que ser que tan profundo queremos ir dentro del material )

			( Fin del proceso de mecanizado )



G0 Z100			( Pasar a velocidad de desplazamiento ---- Moverse a altura de Z = 100 )

X0 Y0			( Moverse a coordenadas X = 0  &  Y = 0 )

M2 			( Fin del programa ( Tambien implica M5, que es fin del husillo )  )

i
