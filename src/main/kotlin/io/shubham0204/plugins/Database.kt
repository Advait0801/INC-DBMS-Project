package io.shubham0204.plugins

import io.ktor.server.application.*
import org.jetbrains.exposed.sql.Database

fun Application.configureDatabase(): Database {
    return Database.connect(
        url = "jdbc:mysql://localhost:3306/inc_database",
        user = "root",
        password = "password",
        driver = "com.mysql.cj.jdbc.Driver"
    )
}
