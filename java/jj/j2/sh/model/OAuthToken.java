package jj.j2.sh.model;

import lombok.Data;

@Data
public class OAuthToken {
	private String access_token;
	private String token_type;
	private String refresh_token;
	private int expires_in;
	private String scope;
	private int refresh_token_expires_in;
	public String getAccess_token() {
		// TODO Auto-generated method stub
		return null;
	}
}