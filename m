Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0A0AAD550
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 May 2025 07:37:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e8YZjRnAvz48N1zj/C+5P9zXrgADF4GL10Uc2ohQTKc=; b=N6aIEXD1z47TOn3suJXGm6LVby
	iWzfPJuo34PGlKy3IRLX0ZYoeWi6UC6kM+YBUbsJ3KonJi269TjqBApyFC0Vbyg2eGktiBHoFyFTz
	ROitwsC33RS2nUVgTpWdZgJ3ZBVj0SR94Fy55y3jtiHKDWQDFuQ4dvX3N5Tl4Q9C4S/o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCXT8-0002ri-Tl;
	Wed, 07 May 2025 05:37:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uCXT0-0002r8-Cv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 05:37:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elNP7tJc3kovODUgAY4l8nTFzi+G/SKAP+yqeD7JyGo=; b=OAIJjlO7dJxDn9ZjMxrsIXb2j9
 EcCTExqWszf3Z1VUEqFNNUq3i8KOXMHElWNO0m0jabUM999iNEmdPLdAjdSAQlVBawatzkvqwCUEX
 GU/VUWP8jqqTx++5046zVOvrY2Wi5KYWVh4/NrF4DSovo8FMKPukxamEMVXbVuwUDl8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=elNP7tJc3kovODUgAY4l8nTFzi+G/SKAP+yqeD7JyGo=; b=N
 kqqzMk1YL4nIgcx9YMBA87QyxZDWia9BgwbZxC/LzKtpTK1nSbdH1WV78dStmP1vjPIR7bFP3HaWb
 DCw7mEtN/GmPZM6Z77yUo582+MGbQ4drMg4qScMjrL2V3vEXjCPfC0b9l20kEh+R/1rgAe7HBj/WM
 vYCYwfwB564R7lt4=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCXSk-0005xB-P9 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 May 2025 05:37:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E9A7161165;
 Wed,  7 May 2025 05:36:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34762C4CEE7;
 Wed,  7 May 2025 05:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1746596207;
 bh=oP7GWOz1dMTCA+UStJls48e11l2RKAG9iYa+VLRD7i0=;
 h=From:To:Cc:Subject:Date:From;
 b=o99rFe36hueJfCE/cZTmn3DGTJVXKsj19xtS57YpcH9xms8E73+vvn1+DkzCobJnJ
 WJo1N7LhEC0fAnAOxuu7h1dlkzNCcSq4Gyg9NAQuBbas5AR0waMlvF73Yy+EZe/kUn
 +6dpdqfvc98iDwOQQZv/VnSlc4k325W5ca6gOl+/pXNDNGyZZokiK0JuB92/cfQcwB
 29LTVMT3uh35o/9B2BGG2o+BKbWSgeamCLztc9djnlUE4yDMMHOTBnkSxV3QbaBg3/
 oK4mPCtJDBtiEB1JdOI/D6sjNoQnU3m6fZhjQSCiI6K3gZrxFgv+/9waE2BaXtxgqJ
 0oF1BpRUtbh5A==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Wed,  7 May 2025 13:36:42 +0800
Message-ID: <20250507053642.842805-1-chao@kernel.org>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As Han Qi reported in bugzilla [1],
 commit 5c26d2f1d3f5 ("unicode:
 Don't special case ignorable code points") changes logic to handle ignorable
 code points, when we handle filename which has special u [...] 
 Content analysis details:   (-1.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uCXSk-0005xB-P9
Subject: [f2fs-dev] [PATCH v3] f2fs/012: test red heart lookup
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
IGludHJvZHVjZWQgYSBsaW5lYXIgbG9va3VwIGZhbGxiYWNrIHcvIGNvbW1pdCA5MWI1ODdiYTc5
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
YW9Aa2VybmVsLm9yZz4KLS0tCnYzOgotIHVzZSBfcmVxdWlyZV9zY3JhdGNoX25vY2hlY2sgaW5z
dGVhZCBvZiBfcmVxdWlyZV9zY3JhdGNoIHRvIGF2b2lkCl9jaGVja19maWxlc3lzdGVtcyBmYWls
dXJlIG9uIGNvcnJ1cHRlZCBpbWFnZQotIGZpeCB0eXBvOiBzL2ludHJvZHVjZXMvaW50cm9kdWNl
ZAogdGVzdHMvZjJmcy8wMTIgICAgIHwgNzAgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKwogdGVzdHMvZjJmcy8wMTIub3V0IHwgIDIgKysKIDIgZmlsZXMgY2hh
bmdlZCwgNzIgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUgMTAwNzU1IHRlc3RzL2YyZnMvMDEy
CiBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZjJmcy8wMTIub3V0CgpkaWZmIC0tZ2l0IGEvdGVz
dHMvZjJmcy8wMTIgYi90ZXN0cy9mMmZzLzAxMgpuZXcgZmlsZSBtb2RlIDEwMDc1NQppbmRleCAw
MDAwMDAwMC4uYjNkZjlhOGYKLS0tIC9kZXYvbnVsbAorKysgYi90ZXN0cy9mMmZzLzAxMgpAQCAt
MCwwICsxLDcwIEBACisjISAvYmluL2Jhc2gKKyMgU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQ
TC0yLjAKKyMgQ29weXJpZ2h0IChjKSAyMDI1IENoYW8gWXUuICBBbGwgUmlnaHRzIFJlc2VydmVk
LgorIworIyBGUyBRQSBUZXN0IE5vLiBmMmZzLzAxMgorIworIyBUaGlzIHRlc3RjYXNlIGNoZWNr
cyB3aGV0aGVyIGxpbmVhciBsb29rdXAgZmFsbGJhY2sgd29ya3Mgd2VsbAorIyBvciBub3QgYXMg
YmVsb3c6CisjIDEuY3JlYXRlIGZpbGUgdy8gcmVkIGhlYXJ0IGFzIGl0cyBmaWxlbmFtZQorIyAy
LmluamVjdCB3cm9uZyBoYXNoIGNvZGUgdG8gdGhlIGZpbGUKKyMgMy5kaXNhYmxlIGxpbmVhciBs
b29rdXAsIGV4cGVjdCBsb29rdXAgZmFpbHVyZQorIyA0LmVuYWJsZSBsaW5lYXIgbG9va3VwLCBl
eHBlY3QgbG9va3VwIHN1Y2NlZWQKKyMKKy4gLi9jb21tb24vcHJlYW1ibGUKK19iZWdpbl9mc3Rl
c3QgYXV0byBxdWljayBjYXNlZm9sZAorCitfZml4ZWRfYnlfa2VybmVsX2NvbW1pdCA5MWI1ODdi
YTc5ZTEgXAorCSJmMmZzOiBJbnRyb2R1Y2UgbGluZWFyIHNlYXJjaCBmb3IgZGVudHJpZXMiCisK
K2V4cG9ydCBMQ19BTEw9Qy5VVEYtOAorX3JlcXVpcmVfc2NyYXRjaF9ub2NoZWNrCitfcmVxdWly
ZV9jb21tYW5kICIkRjJGU19JT19QUk9HIiBmMmZzX2lvCitfcmVxdWlyZV9jb21tYW5kICIkRjJG
U19JTkpFQ1RfUFJPRyIgaW5qZWN0LmYyZnMKKworY2hlY2tfbG9va3VwKCkKK3sKKwlsb2NhbCBu
b2xpbmVhcl9sb29rdXA9JDEKKwlsb2NhbCBkaXI9JFNDUkFUQ0hfTU5UL2RpcgorCSMgcmVkIGhl
YXJ0IGNoYXJhY3RvciBpbiB1bmljb2RlIGZvcm1hdAorCWxvY2FsIHJlZGhlYXJ0PSRkaXIvJCdc
dTI3NjRcdWZlMGYnCisKKwlfc2NyYXRjaF9ta2ZzIC1PIGNhc2Vmb2xkIC1DIHV0ZjggPj4gJHNl
cXJlcy5mdWxsCisJX3NjcmF0Y2hfbW91bnQKKworCW1rZGlyICRkaXIKKwkkRjJGU19JT19QUk9H
IHNldGZsYWdzIGNhc2Vmb2xkICRkaXIgPj4gJHNlcXJlcy5mdWxsCisJdG91Y2ggJHJlZGhlYXJ0
CisJaW5vPWBzdGF0IC1jICclaScgJHJlZGhlYXJ0YAorCV9zY3JhdGNoX3VubW91bnQKKworCSMg
c2hvdWxkIHR1bmUgbm9saW5lYXJfbG9va3VwIGZlYXR1cmUgYmVmb3JlIGZhdWx0IGluamVjdGlv
bgorCSRGMkZTX0ZTQ0tfUFJPRyAtLW5vbGluZWFyLWxvb2t1cD0kbm9saW5lYXJfbG9va3VwICRT
Q1JBVENIX0RFViA+PiAkc2VxcmVzLmZ1bGwKKworCSMgY2hlY2sgd2hldGhlciBsaW5lYXJfbG9v
a3VwIGlzIGNoYW5nZWQgYXMgZXhwZWN0ZWQKKwlpZiBbICRub2xpbmVhcl9sb29rdXAgPT0gIjEi
IF07IHRoZW4KKwkJJEYyRlNfRlNDS19QUk9HICRTQ1JBVENIX0RFViB8IGdyZXAgLXEgImxpbmVh
cl9sb29rdXAgXFtkaXNhYmxlXF0iIHx8CVwKKwkJCQkJX2ZhaWwgImxpbmVhcl9sb29rdXAgaXMg
bm90IGRpc2FibGVkIgorCWVsc2UKKwkJJEYyRlNfRlNDS19QUk9HICRTQ1JBVENIX0RFViB8IGdy
ZXAgLXEgImxpbmVhcl9sb29rdXAgXFtlbmFibGVcXSIgfHwJXAorCQkJCQlfZmFpbCAibGluZWFy
X2xvb2t1cCBpcyBub3QgZW5hYmxlZCIKKwlmaQorCisJJEYyRlNfSU5KRUNUX1BST0cgLS1kZW50
IC0tbWIgZF9oYXNoIC0tbmlkICRpbm8gLS12YWwgMHg5YTJlYTA2OCAkU0NSQVRDSF9ERVYgPj4g
JHNlcXJlcy5mdWxsCisKKwlfc2NyYXRjaF9tb3VudAorCWlmIFsgJG5vbGluZWFyX2xvb2t1cCA9
PSAiMSIgXTsgdGhlbgorCQlbIC1mICRyZWRoZWFydCBdICYmIF9mYWlsICJyZWQgaGVhcnQgZmls
ZSBzaG91bGQgbm90IGV4aXN0IgorCWVsc2UKKwkJWyAtZiAkcmVkaGVhcnQgXSB8fCBfZmFpbCAi
cmVkIGhlYXJ0IGZpbGUgc2hvdWxkIGV4aXN0IgorCWZpCisJX3NjcmF0Y2hfdW5tb3VudAorfQor
CitjaGVja19sb29rdXAgMQorY2hlY2tfbG9va3VwIDAKKworZWNobyAiU2lsZW5jZSBpcyBnb2xk
ZW4iCisKK3N0YXR1cz0wCitleGl0CmRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAxMi5vdXQgYi90
ZXN0cy9mMmZzLzAxMi5vdXQKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAuLjNh
ZmVjYTJmCi0tLSAvZGV2L251bGwKKysrIGIvdGVzdHMvZjJmcy8wMTIub3V0CkBAIC0wLDAgKzEs
MiBAQAorUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMDEyCitTaWxlbmNlIGlzIGdvbGRlbgotLSAKMi40
OS4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwK
