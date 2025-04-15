Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0AF3A89819
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 11:39:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4ckv-0003h6-2v;
	Tue, 15 Apr 2025 09:39:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u4ckt-0003gy-Lv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 09:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtUbW2Mj2oCiUx2EPqVVRtZxZSm8qN6GHmAm/xIGtjk=; b=G0A/LP6RdTkRGs4uvxvn8XCwsV
 BWksj3VRV7dzrYHsVX4mdVjdfb/AL1RlFmPAOaUDO8Bi+HKuUOL4f4CCgD/jkSdvO0b5twvDlUKu9
 wofLdELOvWUr80+95MaxBD0pxINUZWpb9adWhVGNvDhNtqgGrgr2ktj/eaYFf6vWcZe8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rtUbW2Mj2oCiUx2EPqVVRtZxZSm8qN6GHmAm/xIGtjk=; b=f
 KEmQUZRWSipJ6ZC/uX1hSMu8p/YOL9Jbdl/1kgRmZKCatAg29iMmcYayOrebJX2Dsk06uTIh4JS93
 bR4Srpr15btaBQ1PyGQiHmvBDNY+aA0+y+Ykes9JxMVZPTY6gzAHHQBnshcwMpl4HoAIUuYAeHGm7
 KLVW88wSrhn9D970=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u4cke-0004nw-8v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Apr 2025 09:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 0B8EB6115F;
 Tue, 15 Apr 2025 09:38:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC2F0C4CEDD;
 Tue, 15 Apr 2025 09:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744709913;
 bh=u0EytPYWMSeIqaz6DAmJzDvepXrVjSRMwN12Ddna4Ys=;
 h=From:To:Cc:Subject:Date:From;
 b=iDeDXkAtZ22AmwKMg1lzAiIVoSgjhgDm2WwARAZahJ+d2vFOQscrHu5kZBHJbN2Zj
 lJi4TZoEH5TUmS7VWb3XJonCZaZJbolVV1bjLmKPQEcEW/mLptlK5M+ABHc2QA1B8k
 5ra5RMeayJ55GMpZAEiLop54cC+hAM4yE2/uUouua7pydGM6xy5gIkWEOdQpfen12V
 IkHn+CsaDXACfqL3q6T+oy6ep2LdsTRLbFT7iXv/0BTxR2ck4Sh41guDEBDwPX/xc8
 PrKIFYA8S/phEx5stCQN4gDD02dQ+GzWCviMMSKxDu1ye2OnHCssK6qtouPHI41urE
 c7zJj+XwxChUA==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Tue, 15 Apr 2025 17:38:22 +0800
Message-ID: <20250415093822.1100476-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
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
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u4cke-0004nw-8v
Subject: [f2fs-dev] [PATCH v2] f2fs/012: test red heart lookup
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
YW9Aa2VybmVsLm9yZz4KLS0tCnYyOgotIHR1bmUgbGluZWFyX2xvb2t1cCBmZWF0dXJlIGJlZm9y
ZSBmYXVsdCBpbmplY3Rpb24KLSBjaGVjayBzdGF0dXMgYWZ0ZXIgdHVuaW5nIGxpbmVhcl9sb29r
dXAgZmVhdHVyZQotIGNsZWFuIHVwIGNvZGVzCiB0ZXN0cy9mMmZzLzAxMiAgICAgfCA3MyArKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCiB0ZXN0cy9mMmZzLzAx
Mi5vdXQgfCAgMiArKwogMiBmaWxlcyBjaGFuZ2VkLCA3NSBpbnNlcnRpb25zKCspCiBjcmVhdGUg
bW9kZSAxMDA3NTUgdGVzdHMvZjJmcy8wMTIKIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9mMmZz
LzAxMi5vdXQKCmRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAxMiBiL3Rlc3RzL2YyZnMvMDEyCm5l
dyBmaWxlIG1vZGUgMTAwNzU1CmluZGV4IDAwMDAwMDAwLi4zOGE2M2YyZQotLS0gL2Rldi9udWxs
CisrKyBiL3Rlc3RzL2YyZnMvMDEyCkBAIC0wLDAgKzEsNzMgQEAKKyMhIC9iaW4vYmFzaAorIyBT
UERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAorIyBDb3B5cmlnaHQgKGMpIDIwMjUgQ2hh
byBZdS4gIEFsbCBSaWdodHMgUmVzZXJ2ZWQuCisjCisjIEZTIFFBIFRlc3QgTm8uIGYyZnMvMDEy
CisjCisjIFRoaXMgdGVzdGNhc2UgY2hlY2tzIHdoZXRoZXIgbGluZWFyIGxvb2t1cCBmYWxsYmFj
ayB3b3JrcyB3ZWxsCisjIG9yIG5vdCBhcyBiZWxvdzoKKyMgMS5jcmVhdGUgZmlsZSB3LyByZWQg
aGVhcnQgYXMgaXRzIGZpbGVuYW1lCisjIDIuaW5qZWN0IHdyb25nIGhhc2ggY29kZSB0byB0aGUg
ZmlsZQorIyAzLmRpc2FibGUgbGluZWFyIGxvb2t1cCwgZXhwZWN0IGxvb2t1cCBmYWlsdXJlCisj
IDQuZW5hYmxlIGxpbmVhciBsb29rdXAsIGV4cGVjdCBsb29rdXAgc3VjY2VlZAorIworLiAuL2Nv
bW1vbi9wcmVhbWJsZQorX2JlZ2luX2ZzdGVzdCBhdXRvIHF1aWNrIGNhc2Vmb2xkCisKK19maXhl
ZF9ieV9rZXJuZWxfY29tbWl0IDkxYjU4N2JhNzllMSBcCisJImYyZnM6IEludHJvZHVjZSBsaW5l
YXIgc2VhcmNoIGZvciBkZW50cmllcyIKKworZXhwb3J0IExDX0FMTD1DLlVURi04CitfcmVxdWly
ZV9zY3JhdGNoCitfcmVxdWlyZV9jb21tYW5kICIkRjJGU19JT19QUk9HIiBmMmZzX2lvCitfcmVx
dWlyZV9jb21tYW5kICIkRjJGU19JTkpFQ1RfUFJPRyIgaW5qZWN0LmYyZnMKKworY2hlY2tfbG9v
a3VwKCkKK3sKKwlsb2NhbCBub2xpbmVhcl9sb29rdXA9JDEKKwlsb2NhbCBkaXI9JFNDUkFUQ0hf
TU5UL2RpcgorCSMgcmVkIGhlYXJ0IGNoYXJhY3RvciBpbiB1bmljb2RlIGZvcm1hdAorCWxvY2Fs
IHJlZGhlYXJ0PSRkaXIvJCdcdTI3NjRcdWZlMGYnCisKKwlfc2NyYXRjaF9ta2ZzIC1PIGNhc2Vm
b2xkIC1DIHV0ZjggPj4gJHNlcXJlcy5mdWxsCisJX3NjcmF0Y2hfbW91bnQKKworCW1rZGlyICRk
aXIKKwkkRjJGU19JT19QUk9HIHNldGZsYWdzIGNhc2Vmb2xkICRkaXIgPj4gJHNlcXJlcy5mdWxs
CisJdG91Y2ggJHJlZGhlYXJ0CisJaW5vPWBzdGF0IC1jICclaScgJHJlZGhlYXJ0YAorCV9zY3Jh
dGNoX3VubW91bnQKKworCSMgc2hvdWxkIHR1bmUgbm9saW5lYXJfbG9va3VwIGZlYXR1cmUgYmVm
b3JlIGZhdWx0IGluamVjdGlvbgorCSRGMkZTX0ZTQ0tfUFJPRyAtLW5vbGluZWFyLWxvb2t1cD0k
bm9saW5lYXJfbG9va3VwICRTQ1JBVENIX0RFViA+PiAkc2VxcmVzLmZ1bGwKKworCSMgY2hlY2sg
d2hldGhlciBsaW5lYXJfbG9va3VwIGlzIGNoYW5nZWQgYXMgZXhwZWN0ZWQKKwlpZiBbICRub2xp
bmVhcl9sb29rdXAgPT0gIjEiIF07IHRoZW4KKwkJJEYyRlNfRlNDS19QUk9HICRTQ1JBVENIX0RF
ViB8IGdyZXAgLXEgImxpbmVhcl9sb29rdXAgXFtkaXNhYmxlXF0iIHx8CVwKKwkJCQkJX2ZhaWwg
ImxpbmVhcl9sb29rdXAgaXMgbm90IGRpc2FibGVkIgorCWVsc2UKKwkJJEYyRlNfRlNDS19QUk9H
ICRTQ1JBVENIX0RFViB8IGdyZXAgLXEgImxpbmVhcl9sb29rdXAgXFtlbmFibGVcXSIgfHwJXAor
CQkJCQlfZmFpbCAibGluZWFyX2xvb2t1cCBpcyBub3QgZW5hYmxlZCIKKwlmaQorCisJJEYyRlNf
SU5KRUNUX1BST0cgLS1kZW50IC0tbWIgZF9oYXNoIC0tbmlkICRpbm8gLS12YWwgMHg5YTJlYTA2
OCAkU0NSQVRDSF9ERVYgPj4gJHNlcXJlcy5mdWxsCisKKwlfc2NyYXRjaF9tb3VudAorCWlmIFsg
JG5vbGluZWFyX2xvb2t1cCA9PSAiMSIgXTsgdGhlbgorCQlbIC1mICRyZWRoZWFydCBdICYmIF9m
YWlsICJyZWQgaGVhcnQgZmlsZSBzaG91bGQgbm90IGV4aXN0IgorCWVsc2UKKwkJWyAtZiAkcmVk
aGVhcnQgXSB8fCBfZmFpbCAicmVkIGhlYXJ0IGZpbGUgc2hvdWxkIGV4aXN0IgorCWZpCisJX3Nj
cmF0Y2hfdW5tb3VudAorCisJIyB0byBhdm9pZCBfY2hlY2tfZmlsZXN5c3RlbXMgZmFpbHVyZSBp
biB0aGUgZW5kIG9mIHRlc3QKKwlfcmVwYWlyX3NjcmF0Y2hfZnMgPj4gJHNlcXJlcy5mdWxsCit9
CisKK2NoZWNrX2xvb2t1cCAxCitjaGVja19sb29rdXAgMAorCitlY2hvICJTaWxlbmNlIGlzIGdv
bGRlbiIKKworc3RhdHVzPTAKK2V4aXQKZGlmZiAtLWdpdCBhL3Rlc3RzL2YyZnMvMDEyLm91dCBi
L3Rlc3RzL2YyZnMvMDEyLm91dApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMC4u
M2FmZWNhMmYKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0cy9mMmZzLzAxMi5vdXQKQEAgLTAsMCAr
MSwyIEBACitRQSBvdXRwdXQgY3JlYXRlZCBieSAwMTIKK1NpbGVuY2UgaXMgZ29sZGVuCi0tIAoy
LjQ5LjAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
