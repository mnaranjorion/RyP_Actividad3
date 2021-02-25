;Header and description

(define (domain Ambulancia)

;remove requirements that are not needed
(:requirements :strips :typing :negative-preconditions)

(:types 
    
    localizacion ambulancia paciente hospital - object
    ; sitio - localizacion
    ; persona - elemento
    ; hospital - elemento
    ; ambulancia - vehiculo

)

(:predicates ;cosas que hacen falta en las acciones
    
    (enlace ?l1 - localizacion ?l2 - localizacion)
    (ubicacionAmbulancia ?v - ambulancia ?l - localizacion)
    (ubicacionPaciente ?p - paciente ?l - localizacion)
    (ubicacionHospital ?hosp - hospital ?l - localizacion)
    (aBordo ?v - ambulancia ?p - paciente)

)


(:action Conducir
    :parameters (?v - ambulancia ?localizacionOrigen - localizacion ?localizacionDestino - localizacion)
    :precondition (and 
        
        (ubicacionAmbulancia ?v ?localizacionOrigen)
        (enlace ?localizacionOrigen ?localizacionDestino)

    )
    :effect (and 
        
        (ubicacionAmbulancia ?v ?localizacionDestino)
        (not (ubicacionAmbulancia ?v ?localizacionOrigen))

    )
)

(:action RecogerEnfermo
    :parameters (?v - ambulancia ?persona - paciente ?hosp - hospital ?locP - localizacion)
    :precondition (and 
        
        (ubicacionAmbulancia ?v ?locP)
        (ubicacionPaciente ?persona ?locP)
        (not (aBordo ?v ?persona))
        (not (ubicacionHospital ?hosp ?locP))

    )
    :effect (and 
        
        (ubicacionAmbulancia ?v ?locP)
        (not (ubicacionPaciente ?persona ?locP))
        (not (ubicacionHospital ?hosp ?locP))
        (aBordo ?v ?persona)
        
    )
)


(:action DejarEnfermo
    :parameters (?v - ambulancia ?persona - paciente ?hosp - hospital ?locH - localizacion)
    :precondition (and 
        
        (ubicacionAmbulancia ?v ?locH)
        (not (ubicacionPaciente ?persona ?locH))
        (ubicacionHospital ?hosp ?locH)
        (aBordo ?v ?persona)

    )
    :effect (and 
        
        (ubicacionAmbulancia ?v ?locH)
        (ubicacionPaciente ?persona ?locH)
        (ubicacionHospital ?hosp ?locH)
        (not (aBordo ?v ?persona))

    )
)


)