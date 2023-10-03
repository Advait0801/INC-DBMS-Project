package io.shubham0204.models

import kotlinx.serialization.Serializable
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction

class TeamServices( database : Database ) {

    @Serializable
    data class Team(
        val teamId: Int,
        val name: String,
        val abstract: String,
        val domain: String,
        val projectType: String,
        val leaderId: Int,
        val roomNumber: String,
        val instituteName: String
    )

    object TeamsTable: Table( name="teams" ) {
        val teamId = integer( "team_id" )
        val name = varchar( "name" , length = 20 )
        val abstract = text( "abstract" )
        val domain = varchar( "domain" , length = 20 )
        val projectType = varchar( "project_type" , length = 20 )
        val leaderId = integer( "leader_id" )
        val roomNumber = varchar( "room_number" , length = 5 )
        val instituteName = varchar( "institute_name" , length = 50 )
        override val primaryKey = PrimaryKey( teamId )
    }

    suspend fun <T> dbQuery( block: suspend () -> T ) : T =
        newSuspendedTransaction { block() }

    init {
        transaction( database ){
            SchemaUtils.create( TeamsTable )
        }
    }

}