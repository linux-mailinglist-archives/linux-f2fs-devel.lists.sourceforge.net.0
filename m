Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDF38C2E11
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 May 2024 02:50:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5awr-00058t-4Y;
	Sat, 11 May 2024 00:50:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1s5awm-00058X-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YKuj0N9f9PDYhzjTh3y188CIeHAkVPNJXaef9SXbO/s=; b=UfjKIoFzPPWONzuRQffjvvnuAN
 IbTM+SPWYrLKTxj3jWkvkEcFnF/M7zOuT4TZLD+z/gY9miOYanUTuIzPHHGo2E8EAxxkqmcQmUqKA
 WgLHWZKtsXx37Ag5uxobWp0Du2CR9Mh/ZNdg9J7YJNgeAvxhoW5Zuk2i+30gHPuzKybw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YKuj0N9f9PDYhzjTh3y188CIeHAkVPNJXaef9SXbO/s=; b=I
 qUqRjemDGAKDe1ltj1qPE8CeYuRHlmMRxTylqvtbu9taZQuLDWS+LmbeeXrlzu3CdbjmIHMGDE7UH
 uR1HIcTJphWmtCyPBGXusvZ6I9IUKub0zWSVyR+bOh5zwfNL7iMY87QJMPGxoa5wKC/p1ne6UKGc1
 2lVl+bDlosoOPvZE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5awn-0004z8-4v for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 May 2024 00:50:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 0D42062035
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B604CC113CC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715388633;
 bh=KOvjys3G2n6Aw+xiulcAnQamlnTTdmk6N63ydnrJIas=;
 h=Subject:From:Date:To:From;
 b=QaBckpOLZr5L8bSeSkOXM7wjcQCTQaac20WWUo6bpmYzSjpDRfAb+ri8d786lQJXM
 /IibQZJvLGXSNB9cikWPTYE1kElMebCpoE8ldbxQ9SvodkF5zJnAfmFjOvr3YjaNmt
 5kHbeVkUaiMcwxC++tUr7Lu4VVoqBoF3YcTdwNv2VHBshdu09HblPXk4TsjKaKR2M6
 Y33VOyvmv+wvs+DRIeaJNwdmmNDHXBZ9qzXfh1L/Oj1V3xCf7wCIJIBMJ3ZVvvduHx
 dLBEegEqUg31S64lNMU+sjHpFygOBM9J80uEbBYeAR+lO81dnSWZj9B0H49FENjys0
 EE+KviJwkxUgQ==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id
 A28F0E7C112 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 May 2024 00:50:33 +0000 (UTC)
MIME-Version: 1.0
From: patchwork-bot+f2fs@kernel.org
Message-Id: <171538863361.11229.8235057458460841385.git-patchwork-summary@kernel.org>
Date: Sat, 11 May 2024 00:50:33 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev] f2fs: fix
 to do sanity check on i_xattr_nid in sanity_check_inode() Submitter: Chao
 Yu <chao@kernel.org> Committer: Jaegeuk Kim <jaegeuk@kernel.org> Patchwork:
 https://patchwork.kern [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5awn-0004z8-4v
Subject: [f2fs-dev] Patchwork summary for: f2fs
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGVsbG86CgpUaGUgZm9sbG93aW5nIHBhdGNoZXMgd2VyZSBtYXJrZWQgImFjY2VwdGVkIiwgYmVj
YXVzZSB0aGV5IHdlcmUgYXBwbGllZCB0bwpqYWVnZXVrL2YyZnMuZ2l0IChkZXYpOgoKUGF0Y2g6
IFtmMmZzLWRldl0gZjJmczogZml4IHRvIGRvIHNhbml0eSBjaGVjayBvbiBpX3hhdHRyX25pZCBp
biBzYW5pdHlfY2hlY2tfaW5vZGUoKQogIFN1Ym1pdHRlcjogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPgogIENvbW1pdHRlcjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KICBQYXRj
aHdvcms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xpc3QvP3Nl
cmllcz04NDc3NTUKICBMb3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0
MjUwODU4MzguNDAzMjY1Ny0xLWNoYW9Aa2VybmVsLm9yZwoKU2VyaWVzOiBbZjJmcy1kZXYsMS81
XSBmMmZzOiBjb21wcmVzczogZml4IHRvIHVwZGF0ZSBpX2NvbXByX2Jsb2NrcyBjb3JyZWN0bHkK
ICBTdWJtaXR0ZXI6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KICBDb21taXR0ZXI6IEphZWdl
dWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CiAgUGF0Y2h3b3JrOiBodHRwczovL3BhdGNod29y
ay5rZXJuZWwub3JnL3Byb2plY3QvZjJmcy9saXN0Lz9zZXJpZXM9ODUwNzUwCiAgTG9yZSBsaW5r
OiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNTA2MTA0MTQwLjc3Njk4Ni0xLWNoYW9A
a2VybmVsLm9yZwogICAgUGF0Y2hlczogW2YyZnMtZGV2LDEvNV0gZjJmczogY29tcHJlc3M6IGZp
eCB0byB1cGRhdGUgaV9jb21wcl9ibG9ja3MgY29ycmVjdGx5CiAgICAgICAgICAgICBbZjJmcy1k
ZXYsMi81XSBmMmZzOiBjb21wcmVzczogZml4IGVycm9yIHBhdGggb2YgaW5jX3ZhbGlkX2Jsb2Nr
X2NvdW50KCkKICAgICAgICAgICAgIFtmMmZzLWRldiwzLzVdIGYyZnM6IGNvbXByZXNzOiBmaXgg
dHlwbyBpbiBmMmZzX3Jlc2VydmVfY29tcHJlc3NfYmxvY2tzKCkKICAgICAgICAgICAgIFtmMmZz
LWRldiw0LzVdIGYyZnM6IGNvbXByZXNzOiBmaXggdG8gY292ZXIge3Jlc2VydmUsIHJlbGVhc2V9
X2NvbXByZXNzX2Jsb2NrcygpIHcvIGNwX3J3c2VtIGxvY2sKClBhdGNoOiBbZjJmcy1kZXZdIGYy
ZnM6IHVzZSBmMmZzX3tlcnIsIGluZm99X3JhdGVsaW1pdGVkKCkgZm9yIGNsZWFudXAKICBTdWJt
aXR0ZXI6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KICBDb21taXR0ZXI6IEphZWdldWsgS2lt
IDxqYWVnZXVrQGtlcm5lbC5vcmc+CiAgUGF0Y2h3b3JrOiBodHRwczovL3BhdGNod29yay5rZXJu
ZWwub3JnL3Byb2plY3QvZjJmcy9saXN0Lz9zZXJpZXM9ODUwNzU1CiAgTG9yZSBsaW5rOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNTA2MTA0NzQyLjc3ODc4OS0xLWNoYW9Aa2VybmVs
Lm9yZwoKU2VyaWVzOiBbZjJmcy1kZXYsMS8yXSBmMmZzOiByZW1vdmUgdW51c2VkIEdDX0ZBSUxV
UkVfUElOCiAgU3VibWl0dGVyOiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+CiAgQ29tbWl0dGVy
OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgogIFBhdGNod29yazogaHR0cHM6Ly9w
YXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2YyZnMvbGlzdC8/c2VyaWVzPTg1MDc1MQogIExv
cmUgbGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDUwNjEwNDUzOC43NzgxMTYt
MS1jaGFvQGtlcm5lbC5vcmcKICAgIFBhdGNoZXM6IFtmMmZzLWRldiwxLzJdIGYyZnM6IHJlbW92
ZSB1bnVzZWQgR0NfRkFJTFVSRV9QSU4KICAgICAgICAgICAgIFtmMmZzLWRldiwyLzJdIGYyZnM6
IGZpeCB0byBsaW1pdCBnY19waW5fZmlsZV90aHJlc2hvbGQKClBhdGNoOiBbZjJmcy1kZXYsdjJd
IGYyZnM6IGFsbG93IGRpcnR5IHNlY3Rpb25zIHdpdGggemVybyB2YWxpZCBibG9jayBmb3IgY2hl
Y2twb2ludCBkaXNhYmxlZAogIFN1Ym1pdHRlcjogRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwu
Y29tPgogIENvbW1pdHRlcjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KICBQYXRj
aHdvcms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xpc3QvP3Nl
cmllcz04NTIzMDMKICBMb3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA1
MTAxMzQ5MDguMzI3MTcyNS0xLWRhZWhvNDNAZ21haWwuY29tCgpTZXJpZXM6IFtmMmZzLWRldiwx
LzNdIGYyZnM6IGZpeCB0byByZWxlYXNlIG5vZGUgYmxvY2sgY291bnQgaW4gZXJyb3IgcGF0aCBv
ZiBmMmZzX25ld19ub2RlX3BhZ2UoKQogIFN1Ym1pdHRlcjogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPgogIFBhdGNod29yazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2Yy
ZnMvbGlzdC8/c2VyaWVzPTg1MDc0NwogIExvcmUgbGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MDUwNjEwMzMxMy43NzM1MDMtMS1jaGFvQGtlcm5lbC5vcmcKICAgIFBhdGNoZXM6
IFtmMmZzLWRldiwxLzNdIGYyZnM6IGZpeCB0byByZWxlYXNlIG5vZGUgYmxvY2sgY291bnQgaW4g
ZXJyb3IgcGF0aCBvZiBmMmZzX25ld19ub2RlX3BhZ2UoKQogICAgICAgICAgICAgW2YyZnMtZGV2
LDIvM10gZjJmczogZml4IHRvIGFkZCBtaXNzaW5nIGlwdXQoKSBpbiBnY19kYXRhX3NlZ21lbnQo
KQoKUGF0Y2g6IE5vbmUKICBTdWJtaXR0ZXI6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KICBD
b21taXR0ZXI6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CiAgUGF0Y2h3b3JrOiBo
dHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZjJmcy9saXN0Lz9zZXJpZXM9ODUy
MTA0CiAgTG9yZSBsaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNTEwMDM0MzMz
LjM1ODY1My0xLWNoYW9Aa2VybmVsLm9yZwoKUGF0Y2g6IFtmMmZzLWRldl0gZjJmczogcmVtb3Zl
IHJlZHVuZGFudCBwYXJhbWV0ZXIgaW4gaXNfbmV4dF9zZWdtZW50X2ZyZWUoKQogIFN1Ym1pdHRl
cjogWWlmYW4gWmhhbyA8emhhb3lpZmFuQHNqdHUuZWR1LmNuPgogIENvbW1pdHRlcjogSmFlZ2V1
ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KICBQYXRjaHdvcms6IGh0dHBzOi8vcGF0Y2h3b3Jr
Lmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xpc3QvP3Nlcmllcz04NDc5MDIKICBMb3JlIGxpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MjUxNDU1MjguMjkyNTM3Mi0xLXpoYW95
aWZhbkBzanR1LmVkdS5jbgoKUGF0Y2g6IFtmMmZzLWRldix2Ml0gZjJmczogY2hlY2sgdmFsaWRh
dGlvbiBvZiBmYXVsdCBhdHRycyBpbiBmMmZzX2J1aWxkX2ZhdWx0X2F0dHIoKQogIFN1Ym1pdHRl
cjogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgogIENvbW1pdHRlcjogSmFlZ2V1ayBLaW0gPGph
ZWdldWtAa2VybmVsLm9yZz4KICBQYXRjaHdvcms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5v
cmcvcHJvamVjdC9mMmZzL2xpc3QvP3Nlcmllcz04NTEwMDIKICBMb3JlIGxpbms6IGh0dHBzOi8v
bG9yZS5rZXJuZWwub3JnL3IvMjAyNDA1MDcwMzM4NDcuMTA0NzI1MS0xLWNoYW9Aa2VybmVsLm9y
ZwoKUGF0Y2g6IFtmMmZzLWRldix2Ml0gZjJmczogem9uZTogZml4IHRvIGRvbid0IHRyaWdnZXIg
T1BVIG9uIHBpbmZpbGUgZm9yIGRpcmVjdCBJTwogIFN1Ym1pdHRlcjogQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPgogIENvbW1pdHRlcjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4K
ICBQYXRjaHdvcms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xp
c3QvP3Nlcmllcz04NDg1NjEKICBMb3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNDA0MjgwMTEyMzYuMTAwODkxNy0xLWNoYW9Aa2VybmVsLm9yZwoKUGF0Y2g6IFtmMmZzLWRl
dix2MiwxLzNdIGYyZnM6IGZpeCB0byByZWxlYXNlIG5vZGUgYmxvY2sgY291bnQgaW4gZXJyb3Ig
cGF0aCBvZiBmMmZzX25ld19ub2RlX3BhZ2UoKQogIFN1Ym1pdHRlcjogQ2hhbyBZdSA8Y2hhb0Br
ZXJuZWwub3JnPgogIENvbW1pdHRlcjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4K
ICBQYXRjaHdvcms6IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xp
c3QvP3Nlcmllcz04NTEwMDEKICBMb3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3Iv
MjAyNDA1MDcwMzMxMDAuMTA0NDg4NC0xLWNoYW9Aa2VybmVsLm9yZwoKUGF0Y2g6IFtmMmZzLWRl
dl0gZjJmczogZml4IHRvIGF2b2lkIGFsbG9jYXRpbmcgV0FSTV9EQVRBIHNlZ21lbnQgZm9yIGRp
cmVjdCBJTwogIFN1Ym1pdHRlcjogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgogIENvbW1pdHRl
cjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KICBQYXRjaHdvcms6IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xpc3QvP3Nlcmllcz04NDgxNzIKICBM
b3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNDA0MjYwOTMzNDguMzc3MDE4
LTEtY2hhb0BrZXJuZWwub3JnCgpQYXRjaDogW2YyZnMtZGV2LHYyXSBmMmZzOiBmaXggYmxvY2sg
bWlncmF0aW9uIHdoZW4gc2VjdGlvbiBpcyBub3QgYWxpZ25lZCB0byBwb3cyCiAgU3VibWl0dGVy
OiBXdSBCbyA8Ym8ud3VAdml2by5jb20+CiAgQ29tbWl0dGVyOiBKYWVnZXVrIEtpbSA8amFlZ2V1
a0BrZXJuZWwub3JnPgogIFBhdGNod29yazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9w
cm9qZWN0L2YyZnMvbGlzdC8/c2VyaWVzPTg0ODY5OQogIExvcmUgbGluazogaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvci8yMDI0MDQyOTAzNTE0Mi43MDYzNTYtMS1iby53dUB2aXZvLmNvbQoKUGF0
Y2g6IE5vbmUKICBTdWJtaXR0ZXI6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KICBDb21taXR0
ZXI6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CiAgUGF0Y2h3b3JrOiBodHRwczov
L3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZjJmcy9saXN0Lz9zZXJpZXM9ODUxMDMzCiAg
TG9yZSBsaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjQwNTA3MDYyMDE5LjEwOTc2
ODMtMS1jaGFvQGtlcm5lbC5vcmcKClBhdGNoOiBOb25lCiAgU3VibWl0dGVyOiBDaGFvIFl1IDxj
aGFvQGtlcm5lbC5vcmc+CiAgQ29tbWl0dGVyOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwu
b3JnPgogIFBhdGNod29yazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2Yy
ZnMvbGlzdC8/c2VyaWVzPTg1MjEwMwogIExvcmUgbGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvci8yMDI0MDUxMDAzMzMzOS4zMDAzMzEtMS1jaGFvQGtlcm5lbC5vcmcKClBhdGNoOiBbZjJm
cy1kZXYsVjJdIGYyZnM6IGZpeCBzb21lIGFtYmlndW91cyBjb21tZW50cwogIFN1Ym1pdHRlcjog
54mb5b+X5Zu9IChaaGlndW8gTml1KSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgogIENvbW1pdHRl
cjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KICBQYXRjaHdvcms6IGh0dHBzOi8v
cGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xpc3QvP3Nlcmllcz04NDgyMjgKICBM
b3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMTcxNDEzMjg4OS05NDIzLTEtZ2l0
LXNlbmQtZW1haWwtemhpZ3VvLm5pdUB1bmlzb2MuY29tCgoKVG90YWwgcGF0Y2hlczogMjEKCi0t
IApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJuZWwub3Jn
L3BhdGNod29yay9wd2JvdC5odG1sCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
