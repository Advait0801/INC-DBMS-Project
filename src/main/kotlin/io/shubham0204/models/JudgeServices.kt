package io.shubham0204.models

import kotlinx.serialization.Serializable
import org.jetbrains.exposed.sql.Database
import org.jetbrains.exposed.sql.SchemaUtils
import org.jetbrains.exposed.sql.Table
import org.jetbrains.exposed.sql.selectAll
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
        val judgeId = integer( "judge_id" )
        val name = varchar( "name" , length = 20 )
        val domain = varchar( "domain" , length = 20 )
        val contactNumber = char( "contact_number" , length = 20 )
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