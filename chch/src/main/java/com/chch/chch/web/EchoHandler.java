package com.chch.chch.web;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.chch.chch.model.Chat;
import com.chch.chch.service.ChatService;

@Controller
public class EchoHandler extends TextWebSocketHandler {
	
	@Autowired
	private ChatService cs;
	
	Map<String, WebSocketSession> userSessionsMap = new HashMap<String, WebSocketSession>();	// (유저아이디, 세션) 형태로 세션 저장

	// 서버에 접속이 성공 했을때
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		System.out.println("afterConnectionEstablished : " + session + "(connected)");
		String accessId = getId(session);														//	httpSession session상의 유저아이디를 getId메서드로 가져온다
		userSessionsMap.put(accessId, session);													// (유저아이디, 세션) 형태로 userSessionsMap에 입력
		System.out.println("접속자 아이디 : "+accessId + " - " + userSessionsMap.get(accessId).getId());
		System.out.println("총 접속 인원 : "+userSessionsMap);
	}

	// 소켓에 메세지를 보냈을때
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		
		String msg = message.getPayload();
		System.out.println(msg);
		
		String[] strs = msg.split(",");				// 들어온 메세지를 , 기준으로 나눠 어떠한 메세지인지 분류한다
		String cmd = strs[0];
		
		if (StringUtils.isNotEmpty(msg)) {				// 메세지가 null이 아니고 ""이 아니다
			
			if (strs !=null && "notice".equals(cmd)) {		// 3개로 나뉘는 메세지
					String requestId = strs[1];
					WebSocketSession recieverWriterSession = userSessionsMap.get(requestId);
					recieverWriterSession.sendMessage(new TextMessage(msg));
					
				} else if (strs !=null && "inquiryReply".equals(cmd)) {				// notice로 분류될 때
					String userId = strs[1];
					WebSocketSession recieverWriterSession = userSessionsMap.get(userId);
					recieverWriterSession.sendMessage(new TextMessage(msg));
					
				} else if (strs !=null && "joinRoom".equals(cmd)) {				// notice로 분류될 때
					int room_no = Integer.parseInt(strs[2]);
					
					List<Chat> roomMember = cs.selectRoomMember(room_no);			
					
					WebSocketSession recieverWriterSession;
					
					for (int i = 0; i < roomMember.size(); i++) {
						recieverWriterSession = userSessionsMap.get(roomMember.get(i).getId());		// roomMember에서 구한 유저들의 세션정보 가져오기
						if (recieverWriterSession != null) {							// 세션에 해당 유저가 접속해있는지 확인
							recieverWriterSession.sendMessage(new TextMessage(msg));	// 세션에 접속해 있을 때만 해당 유저에게 채팅 전달
						}
					}
				} else if (strs !=null && "chat".equals(cmd)) {						// chat으로 분류될 때
					int room_no = Integer.parseInt(strs[2]);
					
					List<Chat> roomMember = cs.selectRoomMember(room_no);	// 메세지를 보내려는 방에 포함된 멤버 구하기
					
					WebSocketSession recieverWriterSession;					// 메세지 받을 사람들의 세션 선언
					
					for (int i = 0; i < roomMember.size(); i++) {
						recieverWriterSession = userSessionsMap.get(roomMember.get(i).getId());		// roomMember에서 구한 유저들의 세션정보 가져오기
						if (recieverWriterSession != null) {							// 세션에 해당 유저가 접속해있는지 확인
							recieverWriterSession.sendMessage(new TextMessage(msg));	// 세션에 접속해 있을 때만 해당 유저에게 채팅 전달
						}
					}
				} else if (strs !=null && "status".equals(cmd)) {
					String sender = strs[1];
					System.out.println("접속자 확인 메세지 받음");
					
					var key = userSessionsMap.keySet().toString().substring(1);
					
					var key1 = "status,"+key.substring(0,key.length()-1);
					System.out.println(key1);
					
					WebSocketSession senderWriterSession = userSessionsMap.get(sender);
					
					System.out.println("접속인원 확인");
					
					TextMessage statusMsg = new TextMessage(key1);
					senderWriterSession.sendMessage(statusMsg);
				} 
			}
			
		}
			
			
//			if (message.getPayload().startsWith("{")) {
//				for(WebSocketSession ws : sessions) {
//					ws.sendMessage(message);
//				}
//			}
//		}

//		String senderEmail = getEmail(session);
		// 모든 유저에게 보낸다 - 브로드 캐스팅
//		for (WebSocketSession sess : sessions) {
//			sess.sendMessage(new TextMessage(senderNickname + ": " +  message.getPayload()));
//		}

		// protocol : cmd , 댓글작성자, 게시글 작성자 , seq (reply , user2 , user1 , 12)
//		String msg = message.getPayload();
//		if(StringUtils.isNotEmpty(msg)) {
//			String[] strs = msg.split(",");
//			
//			if(strs != null && strs.length == 5) {
//				String cmd = strs[0];
//				String caller = strs[1]; 
//				String receiver = strs[2];
//				String receiverEmail = strs[3];
//				String seq = strs[4];
//				
//				//작성자가 로그인 해서 있다면
//				WebSocketSession boardWriterSession = userSessionsMap.get(receiverEmail);
//				
//				if("reply".equals(cmd) && boardWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(caller + "님이 " + 
//										"<a type='external' href='/mentor/menteeboard/menteeboardView?seq="+seq+"&pg=1'>" + seq + "</a> 번 게시글에 댓글을 남겼습니다.");
//					boardWriterSession.sendMessage(tmpMsg);
//				
//				}else if("follow".equals(cmd) && boardWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(caller + "님이 " + receiver +
//							 "님을 팔로우를 시작했습니다.");
//					boardWriterSession.sendMessage(tmpMsg);
//					
//				}else if("scrap".equals(cmd) && boardWriterSession != null) {
//					TextMessage tmpMsg = new TextMessage(caller + "님이 " +
//										//변수를 하나더 보낼수 없어서 receiver 변수에 member_seq를 넣어서 썼다.
//										"<a type='external' href='/mentor/essayboard/essayboardView?pg=1&seq="+seq+"&mentors="+ receiver +"'>" + seq + "</a>번 에세이를 스크랩 했습니다.");
//					boardWriterSession.sendMessage(tmpMsg);
//				}
//			}
//			// 모임 신청 했을때
//			if(strs != null && strs.length == 5) {
//				String cmd = strs[0];
//				String mentee_name = strs[1];
//				String mentor_email = strs[2];
//				String meetingboard_seq = strs[3];
//				String participation_seq = strs[4];
//				
//				// 모임 작성한 멘토가 로그인 해있으면
//				WebSocketSession mentorSession = userSessionsMap.get(mentor_email);
//				if(cmd.equals("apply") && mentorSession != null) {
//					TextMessage tmpMsg = new TextMessage(
//							mentee_name + "님이 모임을 신청했습니다. " +"<a type='external' href='/mentor/participation/participationView?mseq="+ meetingboard_seq +"&pseq="+ participation_seq +"'>신청서 보기</a>");
//					mentorSession.sendMessage(tmpMsg);
//				}
//			}
//		}
//	}

	// 연결 해제될때
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		System.out.println("afterConnectionClosed : " + session + ", " + status);
		userSessionsMap.remove(session.getAttributes().get("id"));			// userSessionsMap에서 아이디 및 세션 제거
		userSessionsMap.remove(session.getId());
		System.out.println("세션에 남아있는 인원 : "+userSessionsMap);								//
	}

	// 웹소켓 id 가져오기
	private String getId(WebSocketSession session) {				// httpSession 상에 저장된 id를 가져온다 
		Map<String, Object> httpSession = session.getAttributes();
		String loginUser = (String) httpSession.get("id");
		if (loginUser == null) {
			return session.getId();
		} else {
			return loginUser;
		}
	}
}