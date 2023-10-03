package io.shubham0204.plugins

import io.ktor.server.application.*
import org.jetbrains.exposed.sql.Database

fun Application.configureDatabase(): Database {
    val jdbcUrl = System.getenv( "JDBC_URL" )
    return Database.connect(
        url = "jdbc:mysql://40.81.243.181:3306/inc_database",
        user = "root",
        password = "password",
        driver = "com.mysql.cj.jdbc.Driver"
    )
}
