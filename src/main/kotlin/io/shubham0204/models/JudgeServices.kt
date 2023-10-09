package io.shubham0204.models

import io.shubham0204.models.JudgeServices.JudgesTable.innerJoin
import kotlinx.serialization.Serializable
import org.jetbrains.exposed.sql.*
import org.jetbrains.exposed.sql.transactions.experimental.newSuspendedTransaction
import org.jetbrains.exposed.sql.transactions.transaction

class JudgeServices( database: Database ) {

    @Serializable
    data class Judge(
        val judgeId: Int,
        val name: String,
        val domain: String,
        val contactNumber: String
    )

    object JudgesTable: Table( name = "judges" ) {
        val judgeId = integer( "judge_id" ).autoIncrement()
        val name = varchar( "name" , length = 20 )
        val domain = varchar( "domain" , length = 20 )
        val contactNumber = char( "contact_number" , length = 10 )
        override val primaryKey = PrimaryKey( judgeId )
    }

    init {
        transaction( database ){
            SchemaUtils.create( JudgesTable )
        }
    }

    suspend fun <T> dbQuery( block: suspend () -> T ) : T =
        newSuspendedTransaction { block() }

    suspend fun getAllJudges() : List<Judge> = dbQuery {
        JudgesTable
            .selectAll()
            .map {
                Judge(
                    it[ JudgesTable.judgeId ] ,
                    it[ JudgesTable.name ] ,
                    it[ JudgesTable.domain ] ,
                    it[ JudgesTable.contactNumber ]
                )
            }
    }

}