package io.shubham0204.models

import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction

class JudgeAllocationServices( database : Database ) {

    object JudgeAllocationTable: Table( name = "judge_allocation" ) {
        val judgeId = integer( "judge_id" ) references JudgeServices.JudgesTable.judgeId
        val teamId = integer( "team_id" ) references TeamServices.TeamsTable.teamId
    }

    init {
        transaction( database ){
            SchemaUtils.create( JudgeAllocationTable )
        }
    }

    suspend fun getJudgesForTeam( teamId: Int ) : List<JudgeServices.Judge> = dbQuery {
        JudgeAllocationTable
            .innerJoin( JudgeServices.JudgesTable , { judgeId } , { judgeId } )
            .innerJoin( TeamServices.TeamsTable  , { JudgeAllocationTable.teamId } , { TeamServices.TeamsTable.teamId } )
            .select( TeamServices.TeamsTable.teamId eq teamId )
            .map {
                JudgeServices.Judge(
                    it[JudgeServices.JudgesTable.judgeId],
                    it[JudgeServices.JudgesTable.name],
                    it[JudgeServices.JudgesTable.domain],
                    it[JudgeServices.JudgesTable.contactNumber]
                )
            }
    }

    suspend fun getTeamsForJudges( judgeId: Int ) : List<TeamServices.Team> = dbQuery {
        JudgeAllocationTable
            .innerJoin( JudgeServices.JudgesTable , { JudgeAllocationTable.judgeId } , { JudgeServices.JudgesTable.judgeId } )
            .innerJoin( TeamServices.TeamsTable  , { JudgeAllocationTable.teamId } , { teamId } )
            .select( JudgeServices.JudgesTable.judgeId eq judgeId )
            .map { it.toTeam() }
    }


}