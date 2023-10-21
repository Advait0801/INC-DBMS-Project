package io.shubham0204

import io.ktor.server.application.*
import io.ktor.server.engine.*
import io.ktor.server.netty.*
import io.shubham0204.plugins.configureDatabase
import io.shubham0204.plugins.configureRouting
import io.shubham0204.plugins.configureSecurity
import io.shubham0204.plugins.configureSerialization

fun main() {
    embeddedServer(
        Netty,
        port = 8080,
        host = "0.0.0.0",
        module = Application::module)
        .start(wait = true)
}

fun Application.module() {
    configureSecurity()
    configureSerialization()
    val database = configureDatabase()
    configureRouting( database )
}
