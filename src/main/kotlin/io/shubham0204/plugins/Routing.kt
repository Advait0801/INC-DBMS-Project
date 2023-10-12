package io.shubham0204.plugins

import io.ktor.http.*
import io.ktor.server.application.*
import io.ktor.server.response.*
import io.ktor.server.routing.*
import io.shubham0204.models.*
import org.jetbrains.exposed.sql.Database

fun Application.configureRouting( database: Database ) {
    val escortServices = EscortServices( database )
    val judgeServices = JudgeServices( database )
    val judgeAllocationServices = JudgeAllocationServices( database )
    val teamServices = TeamServices( database )
    val participantServices = ParticipantServices( database )

    routing {
        escortRoutes( escortServices )
        judgeRoutes( judgeServices )
        teamRoutes( teamServices )
        allocationRoutes( judgeAllocationServices )
        testRoutes()
    }
}

private fun Routing.testRoutes() {
    get( "/echo/{message}" ) {
        if( call.parameters[ "message" ] != null ) {
            call.respondText( call.parameters[ "message" ]!! )
        }
    }
}

private fun Routing.allocationRoutes( judgeAllocationServices: JudgeAllocationServices ) {
    get( "/allocation/judges/{team_id}" ) {
        val teamId = call.parameters[ "team_id" ]
        if( teamId.isNullOrBlank() ) {
            call.respond(
                HttpStatusCode.InternalServerError ,
                "Please provide a valid team_id parameter."
            )
        }
        else {
            val judges = judgeAllocationServices.getJudgesForTeam( teamId.toInt() )
            if( judges.isNotEmpty() ) {
                call.respond( judges )
            }
            else {
                call.respond(
                    HttpStatusCode.NotFound ,
                    "Could not find judges for given team_id"
                    )
            }
        }
    }
    get( "/allocation/teams/{judge_id}" ) {
        val judgeId = call.parameters[ "judge_id" ]
        if( judgeId.isNullOrBlank() ) {
            call.respond(
                HttpStatusCode.InternalServerError ,
                "Please provide a valid judge_id parameter."
            )
        }
        else {
            val teams = judgeAllocationServices.getTeamsForJudges( judgeId.toInt() )
            if( teams.isNotEmpty() ) {
                call.respond( teams )
            }
            else {
                call.respond(
                    HttpStatusCode.NotFound ,
                    "Could not find teams for given judge_id"
                )
            }
        }
    }
}

private fun Routing.teamRoutes( teamServices: TeamServices ) {
    get( "/teams" ) {
        call.respond( teamServices.getAllTeams() )
    }
    get( "/teams/from-escort/{escort_id}" ) {
        val escortId = call.parameters[ "escort_id" ]
        if( escortId.isNullOrBlank() ) {
            call.respond(
                HttpStatusCode.InternalServerError ,
                "Please provide a valid escort_id parameter."
            )
        }
        else {
            call.respond( teamServices.getTeamsFromEscortID( escortId.toInt() ) )
        }
    }
}

private fun Routing.judgeRoutes(judgeServices: JudgeServices ) {
    get( "/judges" ) {
        call.respond( judgeServices.getAllJudges() )
    }
    get( "/judges/contact_num/{judge_id}" ) {
        val judgeId = call.parameters[ "judge_id" ]
        if( judgeId.isNullOrBlank() ) {
            call.respond(
                HttpStatusCode.InternalServerError ,
                "Please provide a valid judge_id parameter."
            )
        }
        else {
            call.respond( mapOf( "contact_number" to judgeServices.getContactNumber( judgeId.toInt() ) ) )
        }
    }
}

private fun Routing.escortRoutes(escortServices: EscortServices ) {
    get( "/escorts/from-judge/{judge_id}" ) {
        val judgeId = call.parameters[ "judge_id" ]
        if( judgeId.isNullOrBlank() ) {
            call.respond(
                HttpStatusCode.InternalServerError ,
                "Please provide a valid judge_id parameter."
            )
        }
        else {
            call.respond( escortServices.getEscortsFromJudgeID( judgeId.toInt() ) )
        }
    }
    get( "/escorts/{id}" ) {
        val escortId = call.parameters[ "id" ]
        if( escortId.isNullOrBlank() ) {
            call.respond(
                HttpStatusCode.InternalServerError ,
                "Please provide a valid escort_id parameter."
            )
        }
        else {
            call.respond( escortServices.getEscortFromId( escortId.toInt() ) )
        }
    }
    get( "/escorts" ) {
        call.respond( escortServices.getAllEscorts() )
    }
}
