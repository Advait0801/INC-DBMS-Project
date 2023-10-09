package io.shubham0204.models

import kotlinx.serialization.Serializable
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
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
        val roomNumber: String,
        val instituteName: String
    )

    object TeamsTable: Table( name="teams" ) {
        val teamId = integer( "team_id" ).autoIncrement()
        val name = varchar( "name" , length = 20 )
        val abstract = text( "abstract" )
        val domain = varchar( "domain" , length = 20 )
        val projectType = varchar( "project_type" , length = 20 )
        val roomNumber = varchar( "room_number" , length = 5 )
        val instituteName = varchar( "institute_name" , length = 100 )
        override val primaryKey = PrimaryKey( teamId )
    }

    suspend fun <T> dbQuery( block: suspend () -> T ) : T =
        newSuspendedTransaction { block() }

    init {
        transaction( database ){
            SchemaUtils.create( TeamsTable )
        }
    }

    suspend fun getAllTeams() : List<Team> = dbQuery {
        TeamsTable
            .selectAll()
            .map {
                Team(
                    it[ TeamsTable.teamId ],
                    it[ TeamsTable.name ],
                    it[ TeamsTable.abstract ],
                    it[ TeamsTable.domain ],
                    it[ TeamsTable.projectType ],
                    it[ TeamsTable.roomNumber ],
                    it[ TeamsTable.instituteName ]
                )
            }
    }

    suspend fun getTeamsFromEscortID( escortId: Int ): List<Team> = dbQuery {
        val judgeId = EscortServices.EscortsTable
            .select( EscortServices.EscortsTable.escortId eq escortId )
            .single()[EscortServices.EscortsTable.judgeId]
        JudgeAllocationServices.JudgeAllocationTable
            .innerJoin( JudgeServices.JudgesTable , { JudgeAllocationServices.JudgeAllocationTable.judgeId } , { JudgeServices.JudgesTable.judgeId } )
            .innerJoin( TeamsTable  , { JudgeAllocationServices.JudgeAllocationTable.teamId } , { teamId } )
            .select( TeamsTable.teamId eq judgeId )
            .map {
                TeamServices.Team(
                    it[TeamsTable.teamId] ,
                    it[TeamsTable.name],
                    it[TeamsTable.abstract],
                    it[TeamsTable.domain],
                    it[TeamsTable.projectType],
                    it[TeamsTable.roomNumber],
                    it[TeamsTable.instituteName],
                )
            }
    }


}