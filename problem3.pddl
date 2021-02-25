(define (problem transportarPaciente) (:domain Ambulancia)
(:objects 
    
    l1 l2 l3 l4 l5 - localizacion
    ambulancia1 ambulancia2 - ambulancia
    hospital - hospital
    p1 p2 p3 p4 - paciente

)

(:init
    ;todo: put the initial state's facts and numeric values here
    (ubicacionHospital  hospital l1)
    (ubicacionAmbulancia ambulancia1 l1)
    (ubicacionAmbulancia ambulancia2 l1)
    (ubicacionPaciente p1 l3)
    (ubicacionPaciente p2 l4)
    (ubicacionPaciente p3 l5)
    (enlace l1 l2)
    (enlace l2 l1)
    (enlace l2 l4)
    (enlace l4 l2)
    (enlace l4 l3)
    (enlace l3 l4)
    (enlace l3 l5)
    (enlace l5 l3)
    (enlace l4 l5)
    (enlace l5 l4)


)

(:goal (and
    ;todo: put the goal condition here

    (ubicacionPaciente p1 l1)
    (ubicacionPaciente p2 l1)
    (ubicacionPaciente p3 l1)
    ; (ubicacionAmbulancia ambulancia l3)

))

;un-comment the following line if metric is needed
;(:metric minimize (???))
)
