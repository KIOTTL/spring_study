package com.sist.chat;

import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/site/chat/chat-ws")
public class ChatServer {
	private Set<Session> users=Collections.synchronizedSet(new HashSet<Session>());
	// 접속자의 중복을 허용하지 않는다 => 저장시 동기화
	
	@OnOpen
	public void onOpen(Session session) {
		users.add(session);
		System.out.println("클라이언트 접속 : "+session.getId());
	}
	
	@OnClose
	public void onClose(Session session) {
		users.remove(session);
		System.out.println("클라이언트 퇴장 : "+session.getId());
	}
	
	@OnMessage
	public void onMessage(String message, Session session) throws Exception {
		// 쓰레드 동기화
		synchronized (users) {
			for(Session s:users) {
				s.getBasicRemote().sendText(message);
			}
		}
	}
	
}
