package com.kh.byulmee.member.model.dto;

public class KakaoProfile {

	private Integer id;
	private String connected_at;
	private Properties properties;
	private KakaoAccount kakaoAccount;
	
	public KakaoProfile() {}
	
	public KakaoProfile(Integer id, String connected_at, Properties properties, KakaoAccount kakaoAccount) {
		super();
		this.id = id;
		this.connected_at = connected_at;
		this.properties = properties;
		this.kakaoAccount = kakaoAccount;
	}

	public class KakaoAccount {
	
		private Boolean profileNeedsAgreement;
		private Profile profile;
		private Boolean hasEmail;
		private Boolean emailNeedsAgreement;
		private Boolean isEmailValid;
		private Boolean isEmailVerified;
		private String email;
		
		
		public KakaoAccount() {}

		public KakaoAccount(Boolean profileNeedsAgreement, Profile profile, Boolean hasEmail,
				Boolean emailNeedsAgreement, Boolean isEmailValid, Boolean isEmailVerified, String email) {
			super();
			this.profileNeedsAgreement = profileNeedsAgreement;
			this.profile = profile;
			this.hasEmail = hasEmail;
			this.emailNeedsAgreement = emailNeedsAgreement;
			this.isEmailValid = isEmailValid;
			this.isEmailVerified = isEmailVerified;
			this.email = email;
		}

		public class Profile {
			
			private String nickname;
			private String thumbnailImageUrl;
			private String profileImageUrl;
			
			public Profile() {}

			public Profile(String nickname, String thumbnailImageUrl, String profileImageUrl) {
				super();
				this.nickname = nickname;
				this.thumbnailImageUrl = thumbnailImageUrl;
				this.profileImageUrl = profileImageUrl;
			}

			public String getNickname() {
				return nickname;
			}

			public void setNickname(String nickname) {
				this.nickname = nickname;
			}

			public String getThumbnailImageUrl() {
				return thumbnailImageUrl;
			}

			public void setThumbnailImageUrl(String thumbnailImageUrl) {
				this.thumbnailImageUrl = thumbnailImageUrl;
			}

			public String getProfileImageUrl() {
				return profileImageUrl;
			}

			public void setProfileImageUrl(String profileImageUrl) {
				this.profileImageUrl = profileImageUrl;
			}

			@Override
			public String toString() {
				return "Profile [nickname=" + nickname + ", thumbnailImageUrl=" + thumbnailImageUrl
						+ ", profileImageUrl=" + profileImageUrl + "]";
			}
		}
		
		public Boolean getProfileNeedsAgreement() {
			return profileNeedsAgreement;
		}

		public void setProfileNeedsAgreement(Boolean profileNeedsAgreement) {
			this.profileNeedsAgreement = profileNeedsAgreement;
		}

		public Profile getProfile() {
			return profile;
		}

		public void setProfile(Profile profile) {
			this.profile = profile;
		}

		public Boolean getHasEmail() {
			return hasEmail;
		}

		public void setHasEmail(Boolean hasEmail) {
			this.hasEmail = hasEmail;
		}

		public Boolean getEmailNeedsAgreement() {
			return emailNeedsAgreement;
		}

		public void setEmailNeedsAgreement(Boolean emailNeedsAgreement) {
			this.emailNeedsAgreement = emailNeedsAgreement;
		}

		public Boolean getIsEmailValid() {
			return isEmailValid;
		}

		public void setIsEmailValid(Boolean isEmailValid) {
			this.isEmailValid = isEmailValid;
		}

		public Boolean getIsEmailVerified() {
			return isEmailVerified;
		}

		public void setIsEmailVerified(Boolean isEmailVerified) {
			this.isEmailVerified = isEmailVerified;
		}

		public String getEmail() {
			return email;
		}

		public void setEmail(String email) {
			this.email = email;
		}

		@Override
		public String toString() {
			return "KakaoAccount [profileNeedsAgreement=" + profileNeedsAgreement + ", profile=" + profile
					+ ", hasEmail=" + hasEmail + ", emailNeedsAgreement=" + emailNeedsAgreement + ", isEmailValid="
					+ isEmailValid + ", isEmailVerified=" + isEmailVerified + ", email=" + email + "]";
		}
	}

	class Properties {
		public String nickname;
		public String profileImage;
		public String thumbnailImage;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getConnected_at() {
		return connected_at;
	}

	public void setConnected_at(String connected_at) {
		this.connected_at = connected_at;
	}

	public Properties getProperties() {
		return properties;
	}

	public void setProperties(Properties properties) {
		this.properties = properties;
	}

	public KakaoAccount getKakaoAccount() {
		return kakaoAccount;
	}

	public void setKakaoAccount(KakaoAccount kakaoAccount) {
		this.kakaoAccount = kakaoAccount;
	}

	@Override
	public String toString() {
		return "KakaoProfile [id=" + id + ", connected_at=" + connected_at + ", properties=" + properties
				+ ", kakaoAccount=" + kakaoAccount + "]";
	}
}