package io.shubham0204.models

import org.jetbrains.exposed.sql.ResultRow
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction

fun ResultRow.toTeam(): TeamServices.Team {
    return TeamServices.Team(
        this[TeamServices.TeamsTable.teamId],
        this[TeamServices.TeamsTable.name],
        this[TeamServices.TeamsTable.abstract],
        this[TeamServices.TeamsTable.domain],
        this[TeamServices.TeamsTable.projectType],
        this[TeamServices.TeamsTable.roomNumber],
        this[TeamServices.TeamsTable.instituteName],
    )
}

fun ResultRow.toEscort(): EscortServices.Escort {
    return EscortServices.Escort(
        this[EscortServices.EscortsTable.escortId],
        this[EscortServices.EscortsTable.name],
        this[EscortServices.EscortsTable.contactNumber],
        this[EscortServices.EscortsTable.judgeId]
    )
}

suspend fun <T> dbQuery( block: suspend () -> T ) : T =
    newSuspendedTransaction { block() }