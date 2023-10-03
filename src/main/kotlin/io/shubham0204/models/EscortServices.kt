package io.shubham0204.models

import kotlinx.coroutines.Dispatchers
import kotlinx.serialization.Serializable
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.SqlExpressionBuilder.eq
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction

class EscortServices( database: Database ) {

    @Serializable
    data class Escort(
        val escortId: Int,
        val name: String,
        val contactNumber: String,
        val judgeId: Int
    )

    object EscortsTable: Table( name = "escorts" ) {
        val escortId = integer( "escort_id" )
        val name = varchar( "name" , length = 20 )
        val contactNumber = char( "contact_number" , length = 10 )
        val judgeId = integer( "judge_id" ) references JudgeServices.JudgesTable.judgeId
        override val primaryKey = PrimaryKey( escortId )
    }

    init {
        transaction( database ){
            SchemaUtils.create( EscortsTable )
        }
    }

    suspend fun <T> dbQuery( block: suspend () -> T ): T =
        newSuspendedTransaction( Dispatchers.IO ) { block() }

    suspend fun getAllEscorts(): List<Escort> = dbQuery {
        EscortsTable
            .selectAll()
            .map{ Escort(
                    it[EscortsTable.escortId] ,
                    it[EscortsTable.name] ,
                    it[EscortsTable.contactNumber],
                    it[EscortsTable.judgeId]
                ) }
    }

    suspend fun getEscortFromId( escortId: Int ) : Escort = dbQuery {
        EscortsTable
            .select( EscortsTable.escortId eq escortId )
            .map {
                Escort(
                    it[EscortsTable.escortId] ,
                    it[EscortsTable.name] ,
                    it[EscortsTable.contactNumber],
                    it[EscortsTable.judgeId]
                )
            }
            .single()
    }

    suspend fun getEscortsFromJudgeID( judgeId : Int ) : List<Escort> = dbQuery{
        EscortsTable
            .innerJoin( JudgeServices.JudgesTable , { EscortsTable.judgeId } , { JudgeServices.JudgesTable.judgeId } )
            .select( JudgeServices.JudgesTable.judgeId eq judgeId )
            .map{
                Escort(
                    it[EscortsTable.escortId] ,
                    it[EscortsTable.name] ,
                    it[EscortsTable.contactNumber],
                    it[EscortsTable.judgeId]
                )
            }
    }




}