Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJAoNl7WqWnbFwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:15:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32878217541
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 20:15:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Date:Message-Id:MIME-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Zfh2lSq3sU2Jaj7yNxG8seETV9eerJbCZnXIzhp6mbc=; b=Y5xLgR1SkF170MrJNiXANi/dID
	bgAoUJGbGDne0AbOQto4fcz6tdRj6qWJoLN4+vtSUKuKmXF1aHJuma+sQgYz8UbnfopizYTCRFww6
	57yb+ldZpoHKaje5X2nAIur1U9Rm13LcxG9mZqX1SIWqrVvhjMYCFLMV5CR1dbL9XPaA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyEAV-00064q-Lf;
	Thu, 05 Mar 2026 19:15:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <patchwork-bot+f2fs@kernel.org>) id 1vyEAT-00064Z-PO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=To:Date:Message-Id:From:Subject:
 Content-Transfer-Encoding:MIME-Version:Content-Type:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NjjyVMQqEgvnryYDX3p8d+TnUifEROf2+hzUA08Ksbg=; b=JuNNS+ThdJ4Po7q8ioK2CrFWfq
 tueZkTPphKKIbXPM8/XWPtIc6rzWW2Ia6Kv9ezOB9ehzFBPIt28q1oLxhSqJOT8L242+oQ5Woa+pg
 UDy3TGtGTraN6JYqNIUNGJITeFPYWE1+sDJGLBr0PSQFoKcbSJj2SXHvEBCoQ7AHR8KU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=To:Date:Message-Id:From:Subject:Content-Transfer-Encoding:MIME-Version:
 Content-Type:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NjjyVMQqEgvnryYDX3p8d+TnUifEROf2+hzUA08Ksbg=; b=I
 SxViXLtQA35en3TKaPr+y5gAMg18JqwiZSL//gKBcCOw46O8giYWiX/cTd5cExsUwO3rAKN9tYh97
 S3TrZSFnMbz6tU7rAisOWvohDzHpRgzM4HrVIrnNXoi5Br8KOscr0HtOUhtg9rPUd7ItFJCMO4WtB
 2bLRlntD6LR/1Oko=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyE5U-0001uq-0Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 19:10:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 31D4E6001D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 Mar 2026 19:10:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5A9C116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 Mar 2026 19:10:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772737808;
 bh=2ugu+MtmXHCdR3meGLxsziFmucFtbFdJZlNoHjKQcuU=;
 h=Subject:From:Date:To:From;
 b=NdhJlFMIaLy3mal3UUdW9OY21xtZLHFSWpzBHKbZfXoC8oErq/Ctlxkh8qZnfr42J
 7sfHX4C/SuoyoiGzQxJXQikx46AgzYrBopAGS7uFwAgOjAslBimn9foUnft/eROUbx
 IswsLkoBNaNAWQSAWUMHxctBseyyos9vy6k1Vx3rqjx5bx12DCxzyenXrfxI05k59e
 98IkS8B4gq6tHLvH+eVcqGdYNef9TOakdqcD5p3q5Forum9a5DUrUQlps8Z5M/LQj0
 43IjpFecfFKEdDZU9yQKi5ndEMHqXtHx3pTK0oKLSGgIF3v5z0PNeB4tHzNRRPRFzn
 jYZUlu3Egtzdw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
 by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id
 02EA13808200 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 Mar 2026 19:10:10 +0000 (UTC)
MIME-Version: 1.0
Message-Id: <177273780852.3248266.6459367761165754987.git-patchwork-summary@kernel.org>
Date: Thu, 05 Mar 2026 19:10:08 +0000
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello: The following patches were marked "accepted", because
 they were applied to jaegeuk/f2fs.git (dev): Patch: [f2fs-dev,v2] f2fs:Fix
 incomplete search range in f2fs_get_victim when f2fs_need_rand_seg is enabled
 Submitter: liujinbao1 <jinbaoliu365@gmail.com> Committer: Jaegeuk Kim
 <jaegeuk@kernel.org> P [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vyE5U-0001uq-0Q
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
From: patchwork-bot+f2fs--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: patchwork-bot+f2fs@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 32878217541
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[patchwork-bot+f2fs@kernel.org];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

SGVsbG86CgpUaGUgZm9sbG93aW5nIHBhdGNoZXMgd2VyZSBtYXJrZWQgImFjY2VwdGVkIiwgYmVj
YXVzZSB0aGV5IHdlcmUgYXBwbGllZCB0bwpqYWVnZXVrL2YyZnMuZ2l0IChkZXYpOgoKUGF0Y2g6
IFtmMmZzLWRldix2Ml0gZjJmczpGaXggaW5jb21wbGV0ZSBzZWFyY2ggcmFuZ2UgaW4gZjJmc19n
ZXRfdmljdGltIHdoZW4gZjJmc19uZWVkX3JhbmRfc2VnIGlzIGVuYWJsZWQKICBTdWJtaXR0ZXI6
IGxpdWppbmJhbzEgPGppbmJhb2xpdTM2NUBnbWFpbC5jb20+CiAgQ29tbWl0dGVyOiBKYWVnZXVr
IEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgogIFBhdGNod29yazogaHR0cHM6Ly9wYXRjaHdvcmsu
a2VybmVsLm9yZy9wcm9qZWN0L2YyZnMvbGlzdC8/c2VyaWVzPTEwNTM5MTYKICBMb3JlIGxpbms6
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAyMTMxMjI2MzAuMjg3NTE2LTEtamluYmFv
bGl1MzY1QGdtYWlsLmNvbQoKU2VyaWVzOiBbZjJmcy1kZXYsMS8yXSBmMmZzOiBmaXggVUFGIGNh
dXNlZCBieSBkZWNyZW1lbnRpbmcgc2JpLT5ucl9wYWdlc1tdIGluIGYyZnNfd3JpdGVfZW5kX2lv
KCkKICBTdWJtaXR0ZXI6IFlvbmdwZW5nIFlhbmcgPG1vbnR5X3BhdmVsQHNpbmEuY29tPgogIENv
bW1pdHRlcjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KICBQYXRjaHdvcms6IGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9mMmZzL2xpc3QvP3Nlcmllcz0xMDU4
ODM1CiAgTG9yZSBsaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjYwMjI3MDczMDUy
LjM5NDA5NTgtMi1tb250eV9wYXZlbEBzaW5hLmNvbQogICAgUGF0Y2hlczogW2YyZnMtZGV2LDEv
Ml0gZjJmczogZml4IFVBRiBjYXVzZWQgYnkgZGVjcmVtZW50aW5nIHNiaS0+bnJfcGFnZXNbXSBp
biBmMmZzX3dyaXRlX2VuZF9pbygpCiAgICAgICAgICAgICBbZjJmcy1kZXYsMi8yXSBmMmZzOiBk
cm9wIHVudXNlZCBzYmkgcGFyYW1ldGVyIGZyb20gZjJmc19pbl93YXJtX25vZGVfbGlzdCgpCgpQ
YXRjaDogW2YyZnMtZGV2LHYyXSBmMmZzOiBhdm9pZCByZWFkaW5nIGFscmVhZHkgdXBkYXRlZCBw
YWdlcyBkdXJpbmcgR0MKICBTdWJtaXR0ZXI6IOm7hOS9s+eUtyA8aHVhbmdqaWFuYW5AeGlhb21p
LmNvbT4KICBDb21taXR0ZXI6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CiAgUGF0
Y2h3b3JrOiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvZjJmcy9saXN0Lz9z
ZXJpZXM9MTA2MTY0MAogIExvcmUgbGluazogaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2
MDMwNTAxMTgxMC40MTg5NjU1LTEtaHVhbmdqaWFuYW5AeGlhb21pLmNvbQoKUGF0Y2g6IFtmMmZz
LWRldl0gZjJmczogZml4IHRvIGF2b2lkIG1lbW9yeSBsZWFrIGluIGYyZnNfcmVuYW1lKCkKICBT
dWJtaXR0ZXI6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KICBDb21taXR0ZXI6IEphZWdldWsg
S2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CiAgUGF0Y2h3b3JrOiBodHRwczovL3BhdGNod29yay5r
ZXJuZWwub3JnL3Byb2plY3QvZjJmcy9saXN0Lz9zZXJpZXM9MTA2MTExNgogIExvcmUgbGluazog
aHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDMwNDA4MjIzMS41OTk3NzAtMS1jaGFvQGtl
cm5lbC5vcmcKClNlcmllczogW2YyZnMtZGV2LDEvNF0gZjJmczogZml4IGluY29ycmVjdCBleHRl
bnQgZmxhZyB3aGVuIHBoeXNpY2FsIGFkZHIgaXMgTkVXX0FERFIgaW4gZjJmc19maWVtYXAKICBT
dWJtaXR0ZXI6IFlvbmdwZW5nIFlhbmcgPG1vbnR5X3BhdmVsQHNpbmEuY29tPgogIFBhdGNod29y
azogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2YyZnMvbGlzdC8/c2VyaWVz
PTEwNTAzMDMKICBMb3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAyMDMx
MzM2MzUuMzk0MjUwMi0yLW1vbnR5X3BhdmVsQHNpbmEuY29tCiAgICBQYXRjaGVzOiBbZjJmcy1k
ZXYsMS80XSBmMmZzOiBmaXggaW5jb3JyZWN0IGV4dGVudCBmbGFnIHdoZW4gcGh5c2ljYWwgYWRk
ciBpcyBORVdfQUREUiBpbiBmMmZzX2ZpZW1hcAogICAgICAgICAgICAgW2YyZnMtZGV2LDIvNF0g
ZjJmczogZml4IGluY29ycmVjdCBmaWxlIGFkZHJlc3MgbWFwcGluZyB3aGVuIGlubGluZSBpbm9k
ZSBpcyB1bndyaXR0ZW4KClBhdGNoOiBbZjJmcy1kZXZdIGYyZnM6IEFkZCBkZWZyYWdfYmxvY2tz
IHN5c2ZzIG5vZGUKICBTdWJtaXR0ZXI6IGxpdWppbmJhbzEgPGppbmJhb2xpdTM2NUBnbWFpbC5j
b20+CiAgQ29tbWl0dGVyOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgogIFBhdGNo
d29yazogaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2YyZnMvbGlzdC8/c2Vy
aWVzPTEwNTg3NDMKICBMb3JlIGxpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyNjAy
MjcwMzAyNTQuMjcwMDY4LTEtamluYmFvbGl1MzY1QGdtYWlsLmNvbQoKClRvdGFsIHBhdGNoZXM6
IDgKCi0tIApEZWV0LWRvb3QtZG90LCBJIGFtIGEgYm90LgpodHRwczovL2tvcmcuZG9jcy5rZXJu
ZWwub3JnL3BhdGNod29yay9wd2JvdC5odG1sCgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
