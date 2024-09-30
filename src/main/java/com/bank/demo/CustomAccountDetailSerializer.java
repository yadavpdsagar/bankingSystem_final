package com.bank.demo;
import com.bank.demo.Model.AccountDetail;
import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
import java.io.IOException;

public class CustomAccountDetailSerializer extends JsonSerializer<AccountDetail> {

    @Override
    public void serialize(AccountDetail value, JsonGenerator gen, SerializerProvider serializers) throws IOException {
        gen.writeStartObject();
        gen.writeStringField("accountNumber", value.getAccountNumber());
        // Add other fields, but limit or omit nested objects
        gen.writeStringField("address", value.getAddress());
        // Don't serialize transactionDetails or limit its depth
        gen.writeEndObject();
    }
}

