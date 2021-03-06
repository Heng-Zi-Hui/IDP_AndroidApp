package com.example.hooka_androidapp.models;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Session {
    public int sessionId;
    public int sessionPin;
    public String sessionName;
    public int userId;
    public int sessionRunningStatus;
    public int totalQns;
}
