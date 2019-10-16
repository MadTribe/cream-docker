FROM rodolpheche/wiremock

CMD ["java", "-Djavax.net.debug=all","-Dhttps.protocols=TLSv1.1,TLSv1.2", "-cp", "/var/wiremock/lib/*:/var/wiremock/extensions/*", "com.github.tomakehurst.wiremock.standalone.WireMockServerRunner", "--port=80", "--https-port=443", "--https-keystore=/truststore/wiremock.jks", "--keystore-password=123456"]
