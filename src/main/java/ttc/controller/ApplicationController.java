package ttc.controller;

import ttc.context.RequestContext;
import ttc.context.ResponseContext;

import ttc.exception.PresentationException;

public interface ApplicationController{

	RequestContext getRequest(Object request);

	ResponseContext handleRequest(RequestContext reqc);

	void handleResponse(RequestContext reqc, ResponseContext resc) throws PresentationException;
}
