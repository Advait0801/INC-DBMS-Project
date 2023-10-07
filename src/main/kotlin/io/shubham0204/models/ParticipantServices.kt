package io.shubham0204.models

import kotlinx.serialization.Serializable
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.transactions.transaction

class ParticipantServices( database : Database ) {

    @Serializable
    data class Participant(
        val participantId: Int,
        val name: String,
        val teamId: Int,
        val contactNumber: String
    )

    object ParticipantTable: Table( name="participants" ) {
        val participantId = integer( "participant_id" ).autoIncrement()
        val name = varchar( "name" , length = 20 )
        val teamId = integer( "team_id" ) references TeamServices.TeamsTable.teamId
        val contactNumber = char( "contact_number" )
    }

    init {
        transaction( database ){
            SchemaUtils.create( ParticipantTable )
        }
    }

}