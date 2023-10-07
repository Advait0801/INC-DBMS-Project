package io.shubham0204.plugins

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

private fun Routing.teamRoutes(teamServices: TeamServices ) {
    get( "/teams" ) {
        call.respond( teamServices.getAllTeams() )
    }
}

private fun Routing.judgeRoutes(judgeServices: JudgeServices ) {
    get( "/judges" ) {
        call.respond( judgeServices.getAllJudges() )
    }
}

private fun Routing.escortRoutes(escortServices: EscortServices ) {
    get( "/escorts/{id}" ) {
        val escortID = call.parameters[ "id" ]
    }
    get( "/escorts" ) {
        call.respond( escortServices.getAllEscorts() )
    }
}
