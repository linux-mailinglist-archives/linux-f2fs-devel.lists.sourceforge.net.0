Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9DDA75E3F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 05:30:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tz5qh-0003ow-I4;
	Mon, 31 Mar 2025 03:30:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tz5qg-0003ol-KI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 03:30:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pfdVDlIj2ipI8JIp8JMzxyWuoJJlrfR9Z7A0lxoh25A=; b=NJnkNXpBn+wY38YMu1By1I2Blo
 Lik69bl7hUo/zvpPFH5iuKvRkXvvBdm+SajYISKGux4IpJa1ZU1bYTPLYKbZjXKl7YceHIOty+uxh
 Ti2lk0gSAdP48QiEnQ0B/EYTmjPPqOxVEW6pr+AoFsUTTt4mH04IZ/co4y0YPBIFxo9A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pfdVDlIj2ipI8JIp8JMzxyWuoJJlrfR9Z7A0lxoh25A=; b=P
 ZG4wPi30ORHRbYavjPH01vyL6NwcB2VEVcq4692taN0h+XALkG1A5aNR6PTxCzGpkyvtdFnbiB+Fs
 akMLk9qI2ARWxgwxoTChjTzon5G0bro0Upt9BWuHx7o77p0SJ/B7bXk6SjKrCDlvTOc5tlLh5RGsW
 R9OvFNQWSMPTE1cY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tz5qW-0005sO-GS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 03:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B7775436E7;
 Mon, 31 Mar 2025 03:29:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC02FC4CEE4;
 Mon, 31 Mar 2025 03:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1743391786;
 bh=vCeKXokJDtsIiaj5SsmYmTNxsKqJ9Qwa0X6PWRrP9Og=;
 h=From:To:Cc:Subject:Date:From;
 b=E+svVkoKzlmMfe+uGwOxbeVEzhF/VnU0iH3OId2xOdzcPlGxaRe95wHteqWKAiYjp
 jPutDuMFkcdiaNNX1gIXdhuBhwTti3XRHF/NbsnmQqgf/H82y+MY+OynkelcLg0MPJ
 F2s3dJkVr84ZET8FZLMjaIE/92sf2zyvPzC9W2z4oiiGZtwGhT3KTqDbR5BUyiJFuw
 fQEaaK8OrroShsknduLij6410X3whUiOpda+PWmks75VkbHisQDUUCzSE2mkHqp/5P
 uOazd7QuhX4/IwuHhrYQdVD1lRe7B/V0pnFfpaNzqIux25AUMXQJUv/YhF92bCBgFs
 YCT5t3ThtVY8g==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon, 31 Mar 2025 11:29:16 +0800
Message-ID: <20250331032916.489543-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.472.ge94155a9ec-goog
MIME-Version: 1.0
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As Han Qi reported in bugzilla [1],
 commit 5c26d2f1d3f5 ("unicode:
 Don't special case ignorable code points") changes logic to handle ignorable
 code points, when we handle filename which has special u [...] 
 Content analysis details:   (-1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.234.252.31 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tz5qW-0005sO-GS
Subject: [f2fs-dev] [PATCH] f2fs/012: test red heart lookup
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QXMgSGFuIFFpIHJlcG9ydGVkIGluIGJ1Z3ppbGxhIFsxXSwgY29tbWl0IDVjMjZkMmYxZDNmNSAo
InVuaWNvZGU6IERvbid0CnNwZWNpYWwgY2FzZSBpZ25vcmFibGUgY29kZSBwb2ludHMiKSBjaGFu
Z2VzIGxvZ2ljIHRvIGhhbmRsZSBpZ25vcmFibGUKY29kZSBwb2ludHMsIHdoZW4gd2UgaGFuZGxl
IGZpbGVuYW1lIHdoaWNoIGhhcyBzcGVjaWFsIHVuaWNvZGUgY2hhcmFjdG9yCmxpa2UgcmVkIGhl
YXJ0IOKdpO+4jywgdXRmOF9jYXNlZm9sZCgpIG1heSByZXR1cm4gZGlmZmVyZW50IGxlbmd0aCB0
aGFuIGluIHRoZQpwYXN0LCByZXN1bHQgaW4gdGhhdCBmMmZzIGNhY2x1YXRlcyBoYXNoIGNvZGUg
aW5jb3JyZWNsdHksIGV2ZW50dWFsbHksCmZpbGVuYW1lIHcvIHNwZWNpYWwgdW5pY29kZSBjaGFy
YWN0b3Igd2lsbCBub3QgYmUgZm91bmQgdy8gdGhlIHdyb25nIGhhc2gKY29kZS4KCmYyZnMgaGFz
IGludHJvZHVjZXMgYSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIHcvIGNvbW1pdCA5MWI1ODdiYTc5
ZTEKKCJmMmZzOiBJbnRyb2R1Y2UgbGluZWFyIHNlYXJjaCBmb3IgZGVudHJpZXMiKSwgb25jZSBo
YXNoLWJhc2VkIGxvb2t1cApmYWlscywgaXQgdHJpZXMgbGluZWFyIGxvb2t1cCBhcyBhIGZhbGxi
YWNrLgoKVGhpcyBwYXRjaCBjYW4gaGVscCB0byBjaGVjayB3aGV0aGVyIGxpbmVhciBsb29rdXAg
ZmFsbGJhY2sgd29ya3Mgd2VsbApvciBub3QuCgpGaXJzdGx5LCB3ZSB1c2UgYmVsb3cgdGVzdGNh
c2UgdG8gY2hlY2sgaG93IGhhc2ggY29kZSBjaGFuZ2VzOgoKbWtmcy5mMmZzIC1mIC1PIGNhc2Vm
b2xkIC1DIHV0ZjggL2Rldi92ZGEKbW91bnQgL2Rldi92ZGEgL21udC9mMmZzCm1rZGlyIC9tbnQv
ZjJmcy9kaXIvCmYyZnNfaW8gc2V0ZmxhZ3MgY2FzZWZvbGQgL21udC9mMmZzL2Rpcgp0b3VjaCAv
bW50L2YyZnMvZGlyLyQnXHUyNzY0XHVmZTBmJwp1bW91bnQgL21udC9mMmZzCmR1bXAuZjJmcyAt
aSA0IC1kIDMgL2Rldi92ZGEKZHVtcC5mMmZzIC1iICRibGthZGRyX29mX2RpciAtZCAzIC9kZXYv
dmRhCgp3L28gKCJ1bmljb2RlOiBEb24ndCBzcGVjaWFsIGNhc2UgaWdub3JhYmxlIGNvZGUgcG9p
bnRzIikKW2R1bXBfZGlyZW50OiA5OTFdIGJpdG1hcCBwb3NbMHgyXSBuYW1lW+KdpO+4j10gbGVu
WzB4Nl0gaGFzaFsweDE5ZGQ3MTMyXSBpbm9bMHg1XSB0eXBlWzB4MV0KW2R1bXBfZGlyZW50OiA5
OThdIG5hbWUoaGV4KVsweGUyIDB4OWQgMHhhNCAweGVmIDB4YjggMHg4ZiAweDBdCgp3LyAoInVu
aWNvZGU6IERvbid0IHNwZWNpYWwgY2FzZSBpZ25vcmFibGUgY29kZSBwb2ludHMiKQpbZHVtcF9k
aXJlbnQ6IDk5MV0gYml0bWFwIHBvc1sweDJdIG5hbWVb4p2k77iPXSBsZW5bMHg2XSBoYXNoWzB4
OWEyZWEwNjhdIGlub1sweDVdIHR5cGVbMHgxXQpbZHVtcF9kaXJlbnQ6IDk5OF0gbmFtZShoZXgp
WzB4ZTIgMHg5ZCAweGE0IDB4ZWYgMHhiOCAweDhmIDB4MF0KCkNvcnJlY3QgaGFzaCBjb2RlOgkw
eDE5ZGQ3MTMyCldyb25nIGhhc2ggY29kZToJMHg5YTJlYTA2OAoKU28sIHdlIGNhbiB0ZXN0IGFz
IGJlbG93OgoKMS4gY3JlYXRlIGZpbGUgdy8gcmVkIGhlYXJ0IGFzIGl0cyBmaWxlbmFtZQoyLiBp
bmplY3Qgd3JvbmcgaGFzaCBjb2RlIHRvIHRoZSBmaWxlCjMuIGRpc2FibGUgbGluZWFyIGxvb2t1
cCwgZXhwZWN0IGxvb2t1cCBmYWlsdXJlCjQuIGVuYWJsZSBsaW5lYXIgbG9va3VwLCBleHBlY3Qg
bG9va3VwIHN1Y2NlZWQKClsxXSBodHRwczovL2J1Z3ppbGxhLmtlcm5lbC5vcmcvc2hvd19idWcu
Y2dpP2lkPTIxOTU4NgoKQ2M6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+CkNjOiBE
YW5pZWwgTGVlIDxjaHVsbGVlQGdvb2dsZS5jb20+ClNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNo
YW9Aa2VybmVsLm9yZz4KLS0tCiB0ZXN0cy9mMmZzLzAxMiAgICAgfCA1NCArKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy9mMmZzLzAxMi5vdXQgfCAg
MiArKwogMiBmaWxlcyBjaGFuZ2VkLCA1NiBpbnNlcnRpb25zKCspCiBjcmVhdGUgbW9kZSAxMDA3
NTUgdGVzdHMvZjJmcy8wMTIKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9mMmZzLzAxMi5vdXQK
CmRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAxMiBiL3Rlc3RzL2YyZnMvMDEyCm5ldyBmaWxlIG1v
ZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwLi5mZGMzMGJlYQotLS0gL2Rldi9udWxsCisrKyBiL3Rl
c3RzL2YyZnMvMDEyCkBAIC0wLDAgKzEsNTQgQEAKKyMhIC9iaW4vYmFzaAorIyBTUERYLUxpY2Vu
c2UtSWRlbnRpZmllcjogR1BMLTIuMAorIyBDb3B5cmlnaHQgKGMpIDIwMjUgQ2hhbyBZdS4gIEFs
bCBSaWdodHMgUmVzZXJ2ZWQuCisjCisjIEZTIFFBIFRlc3QgTm8uIGYyZnMvMDEyCisjCisjIFRo
aXMgdGVzdGNhc2UgY2hlY2tzIHdoZXRoZXIgbGluZWFyIGxvb2t1cCBmYWxsYmFjayB3b3JrcyB3
ZWxsCisjIG9yIG5vdCBhcyBiZWxvdzoKKyMgMS5jcmVhdGUgZmlsZSB3LyByZWQgaGVhcnQgYXMg
aXRzIGZpbGVuYW1lCisjIDIuaW5qZWN0IHdyb25nIGhhc2ggY29kZSB0byB0aGUgZmlsZQorIyAz
LmRpc2FibGUgbGluZWFyIGxvb2t1cCwgZXhwZWN0IGxvb2t1cCBmYWlsdXJlCisjIDQuZW5hYmxl
IGxpbmVhciBsb29rdXAsIGV4cGVjdCBsb29rdXAgc3VjY2VlZAorIworLiAuL2NvbW1vbi9wcmVh
bWJsZQorX2JlZ2luX2ZzdGVzdCBhdXRvIHF1aWNrIGNhc2Vmb2xkCisKK19maXhlZF9ieV9rZXJu
ZWxfY29tbWl0IDkxYjU4N2JhNzllMSBcCisJImYyZnM6IEludHJvZHVjZSBsaW5lYXIgc2VhcmNo
IGZvciBkZW50cmllcyIKKworZXhwb3J0IExDX0FMTD1DLlVURi04CitfcmVxdWlyZV9zY3JhdGNo
CitfcmVxdWlyZV9jb21tYW5kICIkRjJGU19JT19QUk9HIiBmMmZzX2lvCitfcmVxdWlyZV9jb21t
YW5kICIkRjJGU19JTkpFQ1RfUFJPRyIgaW5qZWN0LmYyZnMKKworX3NjcmF0Y2hfbWtmcyAtZiAt
TyBjYXNlZm9sZCAtQyB1dGY4ID4+ICRzZXFyZXMuZnVsbAorX3NjcmF0Y2hfbW91bnQKKworZGly
PSRTQ1JBVENIX01OVC9kaXIKKworIyByZWQgaGVhcnQgY2hhcmFjdG9yIGluIHVuaWNvZGUgZm9y
bWF0CityZWRoZWFydD0kZGlyLyQnXHUyNzY0XHVmZTBmJworCitta2RpciAkZGlyCiskRjJGU19J
T19QUk9HIHNldGZsYWdzIGNhc2Vmb2xkICRkaXIgPj4gJHNlcXJlcy5mdWxsCit0b3VjaCAkcmVk
aGVhcnQKK2lubz1gc3RhdCAtYyAnJWknICRyZWRoZWFydGAKK19zY3JhdGNoX3VubW91bnQKKwor
JEYyRlNfSU5KRUNUX1BST0cgLS1kZW50IC0tbWIgZF9oYXNoIC0tbmlkICRpbm8gLS12YWwgMHg5
YTJlYTA2OCAkU0NSQVRDSF9ERVYgPj4gJHNlcXJlcy5mdWxsCisKKyRGMkZTX0ZTQ0tfUFJPRyAt
LW5vbGluZWFyLWxvb2t1cD0xICRTQ1JBVENIX0RFViA+PiAkc2VxcmVzLmZ1bGwKK19zY3JhdGNo
X21vdW50CitbIC1mICRyZWRoZWFydCBdICYmIF9mYWlsICJyZWQgaGVhcnQgZmlsZSBzaG91bGQg
bm90IGV4aXN0IgorX3NjcmF0Y2hfdW5tb3VudAorCiskRjJGU19GU0NLX1BST0cgLS1ub2xpbmVh
ci1sb29rdXA9MCAkU0NSQVRDSF9ERVYgPj4gJHNlcXJlcy5mdWxsCitfc2NyYXRjaF9tb3VudAor
WyAtZiAkcmVkaGVhcnQgXSB8fCBfZmFpbCAicmVkIGhlYXJ0IGZpbGUgc2hvdWxkIGV4aXN0Igor
X3NjcmF0Y2hfdW5tb3VudAorCitlY2hvICJTaWxlbmNlIGlzIGdvbGRlbiIKKworc3RhdHVzPTAK
K2V4aXQKZGlmZiAtLWdpdCBhL3Rlc3RzL2YyZnMvMDEyLm91dCBiL3Rlc3RzL2YyZnMvMDEyLm91
dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4uM2FmZWNhMmYKLS0tIC9kZXYv
bnVsbAorKysgYi90ZXN0cy9mMmZzLzAxMi5vdXQKQEAgLTAsMCArMSwyIEBACitRQSBvdXRwdXQg
Y3JlYXRlZCBieSAwMTIKK1NpbGVuY2UgaXMgZ29sZGVuCi0tIAoyLjQ5LjAKCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
