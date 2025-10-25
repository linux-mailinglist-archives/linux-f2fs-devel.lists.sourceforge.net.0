Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C7179C09635
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 25 Oct 2025 18:24:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMrRXYPbLn4IHZL+mi5rziTD3pzWIQ0YeRV3vrmC8xk=; b=nRX+ZFwCW7BzTyVhLaF+Q4I50E
	LJUQ0LqbrVpCSolbCBdzfvDY9k8bnzCG+JNYgDOE43iQYjzseJGTXcqoRnch66scgeUzFLCSXpmkE
	tusdrTw5gnUA6RCNYci+9V/r3nC9GJoeMSkVx8Pf1RQop5JLoyFGtr11dVxQXNoNhPmw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vCh3W-0000ek-GF;
	Sat, 25 Oct 2025 16:23:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sashal@kernel.org>) id 1vCh3V-0000ec-HY
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:23:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fyo1+W/FvRHvgMOZZ+/fZTO2rRaxSefbvhauOkCMqoI=; b=g4tX5CEqPC+y2fR/AYECrVUw32
 tzbn7J9U/3OR4mq72xUran+k8eIB4KnEC3iSjD1rE7b8c14avWU3KIdiCY0Ef5vmGKcUZI7+6b5We
 SbGiueeQVvJ/Zqt+kdBLqWWv4Fw9ofJg4w09pCyG0VlBBeicVCw4BB8R1Jw60rEBUJwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fyo1+W/FvRHvgMOZZ+/fZTO2rRaxSefbvhauOkCMqoI=; b=GbGhSzZ6gHp3P9L/MyTs6X+wS+
 Fr8BC+hoSxKLPMgNhhYMssiR4DYNaSoOjRmcMH4g2GECWWQGaDfFV0mpjmPyKcSRLNC0AVmVP+wkU
 QqjuqbpEMevOu96WRotrX9wOJWeYIosz/NfEOxtNhrx4tbCh1bGZLWpDyy+/VqAN6LYk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vCh3U-0003de-OJ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 25 Oct 2025 16:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0A04C60587
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Oct 2025 16:23:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEAB5C4CEF5;
 Sat, 25 Oct 2025 16:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761409417;
 bh=HLjCvzwRgY1PZy/hshRgN0ARIhMJU2Dy3g4uCtbnmZU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hg3kuOLw6BcpsJiPUQCgxpsfIevJ0k+ZZAjCfSHW/mTRnP4wjwdvBU2gWuj1URF5X
 5ucr3etK6qV6x5ErHi2QMp5GY+rMPy6Kup68lAWE0wv07m5vtKfHmh98QEafKXo3/q
 iQwzqEKQHcY35hHvTkl6jv/7lJ7ndBjpCRB4z8NSyOFp8y0sFYKe7dmLMtfrWpdqie
 /3CFVrT/VggyTM53NO+DgyWUJkBCqH8rimuVnPbUx6zWG2eMYgfw50iyhQ/PJ5vso3
 p2dJeAxhjPNqnFX+ag1ADOWX03UipW7nz1Pm/TXE4SJQNBY0cckvvv4EhKzABfZA2F
 osb8YbqbA1qFA==
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Date: Sat, 25 Oct 2025 11:59:06 -0400
Message-ID: <20251025160905.3857885-315-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251025160905.3857885-1-sashal@kernel.org>
References: <20251025160905.3857885-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.17.5
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 8fc6056dcf79937c46c97fa4996cda65956437a9
 ] As reported, on-disk footer.ino and footer.nid is the same and out-of-range, 
 let's add sanity check on f2fs_alloc_nid() to detect any potential corruption
 in free_nid_list. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vCh3U-0003de-OJ
Subject: [f2fs-dev] [PATCH AUTOSEL 6.17-6.12] f2fs: fix to detect potential
 corrupted nid in free_nid_list
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
From: Sasha Levin via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sasha Levin <sashal@kernel.org>
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RnJvbTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKWyBVcHN0cmVhbSBjb21taXQgOGZjNjA1
NmRjZjc5OTM3YzQ2Yzk3ZmE0OTk2Y2RhNjU5NTY0MzdhOSBdCgpBcyByZXBvcnRlZCwgb24tZGlz
ayBmb290ZXIuaW5vIGFuZCBmb290ZXIubmlkIGlzIHRoZSBzYW1lIGFuZApvdXQtb2YtcmFuZ2Us
IGxldCdzIGFkZCBzYW5pdHkgY2hlY2sgb24gZjJmc19hbGxvY19uaWQoKSB0byBkZXRlY3QKYW55
IHBvdGVudGlhbCBjb3JydXB0aW9uIGluIGZyZWVfbmlkX2xpc3QuCgpTaWduZWQtb2ZmLWJ5OiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+ClNpZ25lZC1vZmYtYnk6IFNhc2hhIExldmluIDxzYXNoYWxAa2VybmVs
Lm9yZz4KLS0tCgpMTE0gR2VuZXJhdGVkIGV4cGxhbmF0aW9ucywgbWF5IGJlIGNvbXBsZXRlbHkg
Ym9ndXM6CgpZRVMKCldoeSB0aGlzIGlzIGEgZ29vZCBzdGFibGUgYmFja3BvcnQKLSBGaXhlcyBh
IHJlYWwgY29ycnVwdGlvbiBjYXNlOiBkZXRlY3RzIG91dC1vZi1yYW5nZSBub2RlIElEcyAoTklE
cykgaW4KICB0aGUgYWxsb2NhdG9y4oCZcyBgZnJlZV9uaWRfbGlzdGAsIHByZXZlbnRpbmcgc2ls
ZW50IHVzZSBvZiBhIGNvcnJ1cHRlZAogIE5JRCB0aGF0IGNhbiBjYXNjYWRlIGludG8gZnVydGhl
ciBvbi1kaXNrIGNvcnJ1cHRpb24gYW5kL29yIG1lbW9yeQogIGNvcnJ1cHRpb24uCi0gTWluaW1h
bCwgc3VyZ2ljYWwgY2hhbmdlcyBpbiBmMmZzOiBhZGRzIGEgZ3VhcmQgYW5kIGEgc3RvcC1jaGVj
a3BvaW50CiAgcmVhc29uOyBubyBhcmNoaXRlY3R1cmFsIHJlZmFjdG9yLgotIExvdyByZWdyZXNz
aW9uIHJpc2s6IHRoZSBuZXcgYnJhbmNoIHJ1bnMgb25seSB3aGVuIGEgTklEIGlzIG91dC1vZi0K
ICByYW5nZSwgd2hpY2ggc2hvdWxkIG5ldmVyIGhhcHBlbiBvbiBhIGhlYWx0aHkgZmlsZXN5c3Rl
bS4KCldoYXQgY2hhbmdlZCAoYnkgZmlsZS9mdW5jdGlvbikKLSBmcy9mMmZzL25vZGUuYzogQWRk
cyBhIHNoYXJlZCBoZWxwZXIuCiAgLSBBZGRzIGBpc19pbnZhbGlkX25pZChzYmksIG5pZClgIHRv
IGNlbnRyYWxpemUgdGhlIHZhbGlkaXR5IGNoZWNrCiAgICAoTklEIDwgcm9vdCBvciBOSUQgPj0g
bWF4X25pZCkuCi0gZnMvZjJmcy9ub2RlLmM6IGYyZnNfY2hlY2tfbmlkX3JhbmdlCiAgLSBSZXBs
YWNlcyBpbmxpbmUgY2hlY2sgd2l0aCBgaXNfaW52YWxpZF9uaWRgIGZvciBjb25zaXN0ZW5jeSBh
bmQgYWRkcwogICAgZXJyb3Igc2lnbmFsaW5nIHZpYSBgZjJmc19oYW5kbGVfZXJyb3IoLi4uLCBF
UlJPUl9DT1JSVVBURURfSU5PREUpYAogICAgd2hlbiBpbnZhbGlkLiBSZWZlcmVuY2UgcG9pbnQg
aW4gb2xkZXIgdHJlZXM6IGZzL2YyZnMvbm9kZS5jOjMzCiAgICBzdGFydHMgdGhlIGZ1bmN0aW9u
OyBpdCBjdXJyZW50bHkgY2FsbHMgYHNldF9zYmlfZmxhZyguLi4sCiAgICBTQklfTkVFRF9GU0NL
KWAgYW5kIHdhcm5zLCBidXQgbGFja3MgYGYyZnNfaGFuZGxlX2Vycm9yYC4KLSBmcy9mMmZzL25v
ZGUuYzogZjJmc19hbGxvY19uaWQKICAtIEFmdGVyIHRha2luZyB0aGUgZmlyc3QgZW50cnkgZnJv
bSBgZnJlZV9uaWRfbGlzdGAsIGFkZHMgYW4gaW1tZWRpYXRlCiAgICByYW5nZSBjaGVjayBhbmQg
YmFpbHMgb3V0IG9uIGNvcnJ1cHRpb246CiAgICAtIExvZ3Mg4oCcQ29ycnVwdGVkIG5pZCAldSBp
biBmcmVlX25pZF9saXN04oCdCiAgICAtIFN0b3BzIGNoZWNrcG9pbnRzIGZvciBhIHNhZmUgZXJy
b3IgaGFuZGxpbmcgcGF0aC4KICAtIFJlZmVyZW5jZSBwb2ludHMgaW4gNS40OiBmdW5jdGlvbiBz
dGFydCBhdCBmcy9mMmZzL25vZGUuYzoyNDI0OyB0aGUKICAgIGxpc3QgaGVhZCByZWFkIGF0IGZz
L2YyZnMvbm9kZS5jOjI0NDQgaXMgd2hlcmUgdGhlIG5ldyBjaGVjayB3b3VsZAogICAgaW5zZXJ0
LgotIGluY2x1ZGUvbGludXgvZjJmc19mcy5oOiBBZGRzIGBTVE9QX0NQX1JFQVNPTl9DT1JSVVBU
RURfTklEYCB0byBzdG9wLQogIGNoZWNrcG9pbnQgcmVhc29ucyBzbyBlcnJvciBwYXRoIHJlcG9y
dHMgYSBzcGVjaWZpYyBjYXVzZS4KCldoeSBpdCBtYXR0ZXJzCi0gV2l0aG91dCB0aGUgY2hlY2ss
IGEgY29ycnVwdGVkIE5JRCB0YWtlbiBmcm9tIGBmcmVlX25pZF9saXN0YCB3aWxsIGJlCiAgdXNl
ZCBmb3IgcHJlYWxsb2NhdGlvbiBhbmQgYml0bWFwIHVwZGF0ZXMgKHNlZQogIGZzL2YyZnMvbm9k
ZS5jOjI0NDjigJMyNDUyKSwgd2hpY2ggY2FuIGxlYWQgdG8gb3V0LW9mLWJvdW5kcyBhY2Nlc3Nl
cyBvcgogIGZ1cnRoZXIgZmlsZXN5c3RlbSBtZXRhZGF0YSBkYW1hZ2UuCi0gVGhlIGZpeCBjb252
ZXJ0cyBhIHNpbGVudCBjb3JydXB0aW9uIGludG8gYSBjb250YWluZWQsIGV4cGxpY2l0bHkKICBy
ZXBvcnRlZCBlcnJvciwgcHJvbXB0aW5nIGZzY2sgYW5kIHByZXZlbnRpbmcgZnVydGhlciBkYW1h
Z2UuCgpCYWNrcG9ydCBjb25zaWRlcmF0aW9ucyBhY3Jvc3Mgc3RhYmxlIHNlcmllcwotIE5ld2Vy
IHN0YWJsZSAodGhhdCBhbHJlYWR5IGhhcyBzdG9wLWNoZWNrcG9pbnQg4oCccmVhc29uc+KAnSBh
bmQKICBgZjJmc19oYW5kbGVfZXJyb3JgKToKICAtIEFwcGx5IGFzLWlzOiBhZGQgYGlzX2ludmFs
aWRfbmlkYCwgY2FsbCBpdCBpbgogICAgYGYyZnNfY2hlY2tfbmlkX3JhbmdlYCwgYWRkIHRoZSBl
YXJseSBjaGVjayBpbiBgZjJmc19hbGxvY19uaWRgLCBhbmQKICAgIGV4dGVuZCBgc3RvcF9jcF9y
ZWFzb25gIHdpdGggYFNUT1BfQ1BfUkVBU09OX0NPUlJVUFRFRF9OSURgLgotIE9sZGVyIHN0YWJs
ZSAoZS5nLiwgdjUuNCBhcyBpbiB0aGlzIHRyZWUpOgogIC0gQVBJIGRpZmZlcmVuY2VzIHRvIGFk
YXB0OgogICAgLSBgZjJmc19zdG9wX2NoZWNrcG9pbnRgIGlzIDItYXJnIChmcy9mMmZzL2NoZWNr
cG9pbnQuYzoyNikuIFVzZQogICAgICBgZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSlg
IGFuZCBvbWl0IHRoZSByZWFzb24uCiAgICAtIFRoZXJlIGlzIG5vIGBmMmZzX2hhbmRsZV9lcnJv
cmAgb3IgYGVudW0gZjJmc19lcnJvcmA7IGtlZXAKICAgICAgZXhpc3RpbmcgYFNCSV9ORUVEX0ZT
Q0tgICsgd2FybmluZyBpbiBgZjJmc19jaGVja19uaWRfcmFuZ2VgIGFuZAogICAgICBkbyBub3Qg
YWRkIHRoZSBoYW5kbGVfZXJyb3IgY2FsbC4KICAgIC0gYGluY2x1ZGUvbGludXgvZjJmc19mcy5o
YCBpbiA1LjQgZG9lcyBub3QgZGVmaW5lIHN0b3AgcmVhc29uczsKICAgICAgc2tpcCB0aGUgcmVh
c29uIGFkZGl0aW9uLgogIC0gQ29yZSBzYWZldHkgZml4IHJlbWFpbnMgaWRlbnRpY2FsOiBpbnNl
cnQgYGlzX2ludmFsaWRfbmlkYCBhbmQgdGhlCiAgICBlYXJseSBiYWlsLW91dCBpbiBgZjJmc19h
bGxvY19uaWRgIGJlZm9yZSB1c2luZyB0aGUgTklEIG9yIHRvdWNoaW5nCiAgICBiaXRtYXBzLgoK
UmlzayBhc3Nlc3NtZW50Ci0gU2NvcGU6IGNvbmZpbmVkIHRvIGYyZnMgbmlkIGFsbG9jYXRpb24g
YW5kIGEgc2hhcmVkIGhlbHBlcjsgbm8gY3Jvc3MtCiAgc3Vic3lzdGVtIGltcGFjdC4KLSBCZWhh
dmlvcmFsIGNoYW5nZSBvbmx5IG9uIGNvcnJ1cHRlZCBzdGF0ZXM7IG5vcm1hbCBzeXN0ZW1zIHVu
YWZmZWN0ZWQuCi0gUGVyZm9ybWFuY2Ugb3ZlcmhlYWQgbmVnbGlnaWJsZSAob25lIGJyYW5jaCAr
IGZ1bmN0aW9uIGlubGluZSkuCgpTZWN1cml0eS9pbnRlZ3JpdHkgaW1wYWN0Ci0gUHJldmVudHMg
cG90ZW50aWFsIG91dC1vZi1ib3VuZHMvaW52YWxpZCBhY2Nlc3NlcyB3aGVuIHVwZGF0aW5nIE5J
RAogIGJpdG1hcHMgYW5kIGFsbG9jYXRvciBzdGF0ZSwgaW1wcm92aW5nIHJvYnVzdG5lc3MgYWdh
aW5zdCBvbi1kaXNrCiAgY29ycnVwdGlvbi4gVHVybmluZyBzaWxlbnQgbWlzdXNlIGludG8gYSBo
YXJkLCByZXBvcnRlZCBlcnJvciByZWR1Y2VzCiAgZGF0YS1sb3NzIHJpc2suCgpBZGRpdGlvbmFs
IG5vdGVzIGZyb20gcmVwb3NpdG9yeSByZXZpZXcKLSBJbiB2NS40IChmb3ItZ3JlZy81LjQtMjAz
KSwgYGYyZnNfc3RvcF9jaGVja3BvaW50YCBoYXMgbm8gcmVhc29uCiAgcGFyYW1ldGVyIChmcy9m
MmZzL2NoZWNrcG9pbnQuYzoyNikgYW5kIHRoZXJlIGlzIG5vCiAgYGYyZnNfaGFuZGxlX2Vycm9y
YC4gVGhlIGJhY2twb3J0IHNob3VsZCB0aGVyZWZvcmUgYmUgdGhlIHJlZHVjZWQKICB2YXJpYW50
IGRlc2NyaWJlZCBhYm92ZS4KLSBUaGUgYWxsb2NhdG9yIHBhdGggd2hlcmUgdGhlIGNoZWNrIGlz
IGFkZGVkIGNvcnJlc3BvbmRzIHRvCiAgYGZzL2YyZnMvbm9kZS5jOjI0MjRgIG9ud2FyZCwgdGFr
aW5nIHRoZSBmaXJzdCBlbnRyeSBmcm9tCiAgYGZyZWVfbmlkX2xpc3RgIGF0IGBmcy9mMmZzL25v
ZGUuYzoyNDQ0YCwgZXhhY3RseSB0aGUgc3BvdCB3aGVyZSB0aGUKICBzYW5pdHkgY2hlY2sgcHJl
dmVudHMgbWlzdXNlLgoKQ29uY2x1c2lvbgotIFRoaXMgaXMgYSBjbGFzc2ljIHN0YWJsZS1lbGln
aWJsZSBidWdmaXg6IHNtYWxsLCBjb250YWluZWQsIGFuZAogIHByZXZlbnRzIHJlYWwgY29ycnVw
dGlvbi4gQmFja3BvcnQgaXQsIGFkYXB0aW5nIHRoZSBlcnJvci9zdG9wLUNQIEFQSQogIHRvIGVh
Y2ggc3RhYmxlIHNlcmllcyBhcyBuZWVkZWQuCgogZnMvZjJmcy9ub2RlLmMgICAgICAgICAgfCAx
NyArKysrKysrKysrKysrKysrLQogaW5jbHVkZS9saW51eC9mMmZzX2ZzLmggfCAgMSArCiAyIGZp
bGVzIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCmluZGV4IDkyMDU0ZGNiZTIwZDAuLjQy
NTRkYjQ1M2IyZDMgMTAwNjQ0Ci0tLSBhL2ZzL2YyZnMvbm9kZS5jCisrKyBiL2ZzL2YyZnMvbm9k
ZS5jCkBAIC0yNywxMiArMjcsMTcgQEAgc3RhdGljIHN0cnVjdCBrbWVtX2NhY2hlICpmcmVlX25p
ZF9zbGFiOwogc3RhdGljIHN0cnVjdCBrbWVtX2NhY2hlICpuYXRfZW50cnlfc2V0X3NsYWI7CiBz
dGF0aWMgc3RydWN0IGttZW1fY2FjaGUgKmZzeW5jX25vZGVfZW50cnlfc2xhYjsKIAorc3RhdGlj
IGlubGluZSBib29sIGlzX2ludmFsaWRfbmlkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlk
X3QgbmlkKQoreworCXJldHVybiBuaWQgPCBGMkZTX1JPT1RfSU5PKHNiaSkgfHwgbmlkID49IE5N
X0koc2JpKS0+bWF4X25pZDsKK30KKwogLyoKICAqIENoZWNrIHdoZXRoZXIgdGhlIGdpdmVuIG5p
ZCBpcyB3aXRoaW4gbm9kZSBpZCByYW5nZS4KICAqLwogaW50IGYyZnNfY2hlY2tfbmlkX3Jhbmdl
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3QgbmlkKQogewotCWlmICh1bmxpa2VseShu
aWQgPCBGMkZTX1JPT1RfSU5PKHNiaSkgfHwgbmlkID49IE5NX0koc2JpKS0+bWF4X25pZCkpIHsK
KwlpZiAodW5saWtlbHkoaXNfaW52YWxpZF9uaWQoc2JpLCBuaWQpKSkgewogCQlzZXRfc2JpX2Zs
YWcoc2JpLCBTQklfTkVFRF9GU0NLKTsKIAkJZjJmc193YXJuKHNiaSwgIiVzOiBvdXQtb2YtcmFu
Z2UgbmlkPSV4LCBydW4gZnNjayB0byBmaXguIiwKIAkJCSAgX19mdW5jX18sIG5pZCk7CkBAIC0y
NjU0LDYgKzI2NTksMTYgQEAgYm9vbCBmMmZzX2FsbG9jX25pZChzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIG5pZF90ICpuaWQpCiAJCWYyZnNfYnVnX29uKHNiaSwgbGlzdF9lbXB0eSgmbm1faS0+
ZnJlZV9uaWRfbGlzdCkpOwogCQlpID0gbGlzdF9maXJzdF9lbnRyeSgmbm1faS0+ZnJlZV9uaWRf
bGlzdCwKIAkJCQkJc3RydWN0IGZyZWVfbmlkLCBsaXN0KTsKKworCQlpZiAodW5saWtlbHkoaXNf
aW52YWxpZF9uaWQoc2JpLCBpLT5uaWQpKSkgeworCQkJc3Bpbl91bmxvY2soJm5tX2ktPm5pZF9s
aXN0X2xvY2spOworCQkJZjJmc19lcnIoc2JpLCAiQ29ycnVwdGVkIG5pZCAldSBpbiBmcmVlX25p
ZF9saXN0IiwKKwkJCQkJCQkJaS0+bmlkKTsKKwkJCWYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwg
ZmFsc2UsCisJCQkJCVNUT1BfQ1BfUkVBU09OX0NPUlJVUFRFRF9OSUQpOworCQkJcmV0dXJuIGZh
bHNlOworCQl9CisKIAkJKm5pZCA9IGktPm5pZDsKIAogCQlfX21vdmVfZnJlZV9uaWQoc2JpLCBp
LCBGUkVFX05JRCwgUFJFQUxMT0NfTklEKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvZjJm
c19mcy5oIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKaW5kZXggMmY4YjhiZmMwZTczMS4uNmFm
YjRhMTNiODFkNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKKysrIGIvaW5j
bHVkZS9saW51eC9mMmZzX2ZzLmgKQEAgLTc5LDYgKzc5LDcgQEAgZW51bSBzdG9wX2NwX3JlYXNv
biB7CiAJU1RPUF9DUF9SRUFTT05fRkxVU0hfRkFJTCwKIAlTVE9QX0NQX1JFQVNPTl9OT19TRUdN
RU5ULAogCVNUT1BfQ1BfUkVBU09OX0NPUlJVUFRFRF9GUkVFX0JJVE1BUCwKKwlTVE9QX0NQX1JF
QVNPTl9DT1JSVVBURURfTklELAogCVNUT1BfQ1BfUkVBU09OX01BWCwKIH07CiAKLS0gCjIuNTEu
MAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
