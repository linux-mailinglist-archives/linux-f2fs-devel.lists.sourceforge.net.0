Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHHMLbEer2kgOQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:25:37 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5151423FD02
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 09 Mar 2026 20:25:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iiPCClQXuaU33hHbG1LOydfb687/O/i+Y2C/8WHib24=; b=g3C5bNx/F4FWeTDZGfcvebaKCp
	bXrNRivyYtj7n1vQgP0k1jo5WB+nW2mF4+fOKoZQFIdEVjv9MKtGYaZnam1Mxn1s6AM9z0iALyTFI
	DnqjjV1zEOvCoUUY1S7StwvY10W15hMLxz7ecaKWs/ixn+zyvqKkT/gs2JqSXzXLE8k0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzgER-00074n-62;
	Mon, 09 Mar 2026 19:25:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1vzgE5-00070u-Qs
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:25:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MsLp902GO338LOEJA6008qRCvAJ2a9oCHEFikLwwfgU=; b=PLAWqW1R4bKQUps34Dk276K1ck
 oy/Pv8ZqOUpFOS7+Z6ot1QMXFkbmVddgJ5+dPUZPN/UMlHvGDeXiKG1XVbG3OaoABQIreVIfYnda5
 uMLf6xlOGlaVTmiJQjgKbq16t9O8XzweLuJv8YNEWkE9FOSlq9SdpeviEoKIZs1+S4vg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MsLp902GO338LOEJA6008qRCvAJ2a9oCHEFikLwwfgU=; b=eAfFm2cnLfEWKo8Rmz+gFZL2at
 nqtZcFiCsjgmjnpudD5QaHPNomIuSKXiimTEk+1+/WWGAfvLGzHWb9b6eo5dhZiYPpjtM2ARLAE4M
 n1RQVtHyOdbDJTcFj3T32e2kNBYK49uL4K9jMk4eFgsEflq3CAMjDycWAWYr1gM4CeB4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzgE5-0001HQ-1z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 09 Mar 2026 19:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id BBF2E4459F;
 Mon,  9 Mar 2026 19:25:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EB72C2BCAF;
 Mon,  9 Mar 2026 19:25:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773084302;
 bh=tYbjI+WVak8meQnKlyr+vZIOgAJGdR7WXm1pNIS8NS8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HRjRDk4FX0hBnAYAotk8ijnnjdaWQyZ6WlaUlCrRdsqgvLLdbYCSNaoGNJG3jdZ2A
 LJfxd49dOi9Uy08YlNbUf0gZk+IFKq3gQZR1cLGvQYTRgHVgUoUUggWA5lo/DImQus
 3mOADjInyeAgpUPGT7upsaetUOL49pEQUmcccW9nxbVqxiduBMmKdPDrMfFwlLuJXh
 twbR++xq+JzGek7uqNJtNtvyMqzvIjztvaP41tehO4GSLX8dATLICtTKwt5U1xKpmR
 nChDmt9FbdfjW2WYRNWPOXVE9E3txCanWFlMRCAOzCx0B0gAx42gdDlDGaZ7NUbEsy
 c/Xf9ED2Ynb9g==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Mon,  9 Mar 2026 20:23:31 +0100
Message-ID: <20260309192355.176980-17-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260309192355.176980-1-aalbersh@kernel.org>
References: <20260309192355.176980-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: For write/writeback set IOMAP_F_FSVERITY flag telling iomap
 to not update inode size and to not skip folios beyond EOF. Initiate fsverity
 writeback with IOMAP_F_FSVERITY set to tell iomap should not skip folio that
 is dirty beyond EOF. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vzgE5-0001HQ-1z
Subject: [f2fs-dev] [PATCH v4 16/25] xfs: handle fsverity I/O in write/read
 path
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 5151423FD02
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

Rm9yIHdyaXRlL3dyaXRlYmFjayBzZXQgSU9NQVBfRl9GU1ZFUklUWSBmbGFnIHRlbGxpbmcgaW9t
YXAgdG8gbm90CnVwZGF0ZSBpbm9kZSBzaXplIGFuZCB0byBub3Qgc2tpcCBmb2xpb3MgYmV5b25k
IEVPRi4KCkluaXRpYXRlIGZzdmVyaXR5IHdyaXRlYmFjayB3aXRoIElPTUFQX0ZfRlNWRVJJVFkg
c2V0IHRvIHRlbGwgaW9tYXAKc2hvdWxkIG5vdCBza2lwIGZvbGlvIHRoYXQgaXMgZGlydHkgYmV5
b25kIEVPRi4KCkluIHJlYWQgcGF0aCBsZXQgaW9tYXAga25vdyB0aGF0IHdlIGFyZSByZWFkaW5n
IGZzdmVyaXR5IG1ldGFkYXRhLiBTbywKdHJlYXQgaG9sZXMgaW4gdGhlIHRyZWUgYXMgcmVxdWVz
dCB0byBzeW50aGVzaXplIHRyZWUgYmxvY2tzIGFuZCBob2xlCmFmdGVyIGRlc2NyaXB0b3IgYXMg
ZW5kIG9mIHRoZSBmc3Zlcml0eSByZWdpb24uCgpJbnRyb2R1Y2UgYSBuZXcgaW5vZGUgZmxhZyBt
ZWFuaW5nIHRoYXQgbWVya2xlIHRyZWUgaXMgYmVpbmcgYnVpbGQgb24KdGhlIGlub2RlLgoKU2ln
bmVkLW9mZi1ieTogQW5kcmV5IEFsYmVyc2h0ZXluIDxhYWxiZXJzaEBrZXJuZWwub3JnPgotLS0K
IGZzL3hmcy9NYWtlZmlsZSAgICAgICAgICB8ICAxICsKIGZzL3hmcy9saWJ4ZnMveGZzX2JtYXAu
YyB8ICA3ICsrKysrKysKIGZzL3hmcy94ZnNfYW9wcy5jICAgICAgICB8IDE2ICsrKysrKysrKysr
KysrKy0KIGZzL3hmcy94ZnNfZnN2ZXJpdHkuYyAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysKIGZzL3hmcy94ZnNfZnN2ZXJpdHkuaCAgICB8IDIwICsrKysrKysrKysr
KysrKysrKysrCiBmcy94ZnMveGZzX2lub2RlLmggICAgICAgfCAgNiArKysrKysKIGZzL3hmcy94
ZnNfaW9tYXAuYyAgICAgICB8IDE1ICsrKysrKysrKysrKystLQogNyBmaWxlcyBjaGFuZ2VkLCA5
NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGZzL3hm
cy94ZnNfZnN2ZXJpdHkuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGZzL3hmcy94ZnNfZnN2ZXJpdHku
aAoKZGlmZiAtLWdpdCBhL2ZzL3hmcy9NYWtlZmlsZSBiL2ZzL3hmcy9NYWtlZmlsZQppbmRleCA5
ZjcxMzNlMDI1NzYuLjM4YjdmNTFlNWQ4NCAxMDA2NDQKLS0tIGEvZnMveGZzL01ha2VmaWxlCisr
KyBiL2ZzL3hmcy9NYWtlZmlsZQpAQCAtMTQ5LDYgKzE0OSw3IEBAIHhmcy0kKENPTkZJR19YRlNf
UE9TSVhfQUNMKQkrPSB4ZnNfYWNsLm8KIHhmcy0kKENPTkZJR19TWVNDVEwpCQkrPSB4ZnNfc3lz
Y3RsLm8KIHhmcy0kKENPTkZJR19DT01QQVQpCQkrPSB4ZnNfaW9jdGwzMi5vCiB4ZnMtJChDT05G
SUdfRVhQT1JURlNfQkxPQ0tfT1BTKQkrPSB4ZnNfcG5mcy5vCit4ZnMtJChDT05GSUdfRlNfVkVS
SVRZKQkJKz0geGZzX2ZzdmVyaXR5Lm8KIAogIyBub3RpZnkgZmFpbHVyZQogaWZlcSAoJChDT05G
SUdfTUVNT1JZX0ZBSUxVUkUpLHkpCmRpZmYgLS1naXQgYS9mcy94ZnMvbGlieGZzL3hmc19ibWFw
LmMgYi9mcy94ZnMvbGlieGZzL3hmc19ibWFwLmMKaW5kZXggN2E0YzhmMWFhNzZjLi45MzFkMDI2
NzhkMTkgMTAwNjQ0Ci0tLSBhL2ZzL3hmcy9saWJ4ZnMveGZzX2JtYXAuYworKysgYi9mcy94ZnMv
bGlieGZzL3hmc19ibWFwLmMKQEAgLTQxLDYgKzQxLDggQEAKICNpbmNsdWRlICJ4ZnNfaW5vZGVf
dXRpbC5oIgogI2luY2x1ZGUgInhmc19ydGdyb3VwLmgiCiAjaW5jbHVkZSAieGZzX3pvbmVfYWxs
b2MuaCIKKyNpbmNsdWRlICJ4ZnNfZnN2ZXJpdHkuaCIKKyNpbmNsdWRlIDxsaW51eC9mc3Zlcml0
eS5oPgogCiBzdHJ1Y3Qga21lbV9jYWNoZQkJKnhmc19ibWFwX2ludGVudF9jYWNoZTsKIApAQCAt
NDQ1MSw2ICs0NDUzLDExIEBAIHhmc19ibWFwaV9jb252ZXJ0X29uZV9kZWxhbGxvYygKIAlYRlNf
U1RBVFNfQUREKG1wLCB4c194c3RyYXRfYnl0ZXMsIFhGU19GU0JfVE9fQihtcCwgYm1hLmxlbmd0
aCkpOwogCVhGU19TVEFUU19JTkMobXAsIHhzX3hzdHJhdF9xdWljayk7CiAKKwlpZiAoeGZzX2lm
bGFnc190ZXN0KGlwLCBYRlNfVkVSSVRZX0NPTlNUUlVDVElPTikgJiYKKwkgICAgWEZTX0ZTQl9U
T19CKG1wLCBibWEuZ290LmJyX3N0YXJ0b2ZmKSA+PQorCQkgICAgeGZzX2ZzdmVyaXR5X21ldGFk
YXRhX29mZnNldChpcCkpCisJCWZsYWdzIHw9IElPTUFQX0ZfRlNWRVJJVFk7CisKIAlBU1NFUlQo
IWlzbnVsbHN0YXJ0YmxvY2soYm1hLmdvdC5icl9zdGFydGJsb2NrKSk7CiAJeGZzX2JtYnRfdG9f
aW9tYXAoaXAsIGlvbWFwLCAmYm1hLmdvdCwgMCwgZmxhZ3MsCiAJCQkJeGZzX2lvbWFwX2lub2Rl
X3NlcXVlbmNlKGlwLCBmbGFncykpOwpkaWZmIC0tZ2l0IGEvZnMveGZzL3hmc19hb3BzLmMgYi9m
cy94ZnMveGZzX2FvcHMuYwppbmRleCBmMjc5MDU1ZmNlYTAuLjk1MDMyNTJhMGZhNCAxMDA2NDQK
LS0tIGEvZnMveGZzL3hmc19hb3BzLmMKKysrIGIvZnMveGZzL3hmc19hb3BzLmMKQEAgLTIyLDYg
KzIyLDcgQEAKICNpbmNsdWRlICJ4ZnNfaWNhY2hlLmgiCiAjaW5jbHVkZSAieGZzX3pvbmVfYWxs
b2MuaCIKICNpbmNsdWRlICJ4ZnNfcnRncm91cC5oIgorI2luY2x1ZGUgInhmc19mc3Zlcml0eS5o
IgogI2luY2x1ZGUgPGxpbnV4L2Jpby1pbnRlZ3JpdHkuaD4KIAogc3RydWN0IHhmc193cml0ZXBh
Z2VfY3R4IHsKQEAgLTMzOSwxMiArMzQwLDE2IEBAIHhmc19tYXBfYmxvY2tzKAogCWludAkJCXJl
dHJpZXMgPSAwOwogCWludAkJCWVycm9yID0gMDsKIAl1bnNpZ25lZCBpbnQJCSpzZXE7CisJdW5z
aWduZWQgaW50CQlpb21hcF9mbGFncyA9IDA7CiAKIAlpZiAoeGZzX2lzX3NodXRkb3duKG1wKSkK
IAkJcmV0dXJuIC1FSU87CiAKIAlYRlNfRVJST1JUQUdfREVMQVkobXAsIFhGU19FUlJUQUdfV0Jf
REVMQVlfTVMpOwogCisJaWYgKHhmc19pZmxhZ3NfdGVzdChpcCwgWEZTX1ZFUklUWV9DT05TVFJV
Q1RJT04pKQorCQlpb21hcF9mbGFncyB8PSBJT01BUF9GX0ZTVkVSSVRZOworCiAJLyoKIAkgKiBD
T1cgZm9yayBibG9ja3MgY2FuIG92ZXJsYXAgZGF0YSBmb3JrIGJsb2NrcyBldmVuIGlmIHRoZSBi
bG9ja3MKIAkgKiBhcmVuJ3Qgc2hhcmVkLiAgQ09XIEkvTyBhbHdheXMgdGFrZXMgcHJlY2VkZW50
LCBzbyB3ZSBtdXN0IGFsd2F5cwpAQCAtNDMyLDcgKzQzNyw4IEBAIHhmc19tYXBfYmxvY2tzKAog
CSAgICBpc251bGxzdGFydGJsb2NrKGltYXAuYnJfc3RhcnRibG9jaykpCiAJCWdvdG8gYWxsb2Nh
dGVfYmxvY2tzOwogCi0JeGZzX2JtYnRfdG9faW9tYXAoaXAsICZ3cGMtPmlvbWFwLCAmaW1hcCwg
MCwgMCwgWEZTX1dQQyh3cGMpLT5kYXRhX3NlcSk7CisJeGZzX2JtYnRfdG9faW9tYXAoaXAsICZ3
cGMtPmlvbWFwLCAmaW1hcCwgMCwgaW9tYXBfZmxhZ3MsCisJCQkgIFhGU19XUEMod3BjKS0+ZGF0
YV9zZXEpOwogCXRyYWNlX3hmc19tYXBfYmxvY2tzX2ZvdW5kKGlwLCBvZmZzZXQsIGNvdW50LCB3
aGljaGZvcmssICZpbWFwKTsKIAlyZXR1cm4gMDsKIGFsbG9jYXRlX2Jsb2NrczoKQEAgLTcwNSw2
ICs3MTEsMTQgQEAgeGZzX3ZtX3dyaXRlcGFnZXMoCiAJCQl9LAogCQl9OwogCisJCS8qCisJCSAq
IFdyaXRlYmFjayBkb2VzIG5vdCB3b3JrIGZvciBmb2xpb3MgcGFzdCBFT0YsIGxldCBpdCBrbm93
IHRoYXQKKwkJICogSS9PIGhhcHBlbnMgZm9yIGZzdmVyaXR5IG1ldGFkYXRhIGFuZCB0aGlzIHJl
c3RyaWN0aW9uIG5lZWQKKwkJICogdG8gYmUgc2tpcHBlZAorCQkgKi8KKwkJaWYgKHhmc19pZmxh
Z3NfdGVzdChpcCwgWEZTX1ZFUklUWV9DT05TVFJVQ1RJT04pKQorCQkJd3BjLmN0eC5pb21hcC5m
bGFncyB8PSBJT01BUF9GX0ZTVkVSSVRZOworCiAJCXJldHVybiBpb21hcF93cml0ZXBhZ2VzKCZ3
cGMuY3R4KTsKIAl9CiB9CmRpZmYgLS1naXQgYS9mcy94ZnMveGZzX2ZzdmVyaXR5LmMgYi9mcy94
ZnMveGZzX2ZzdmVyaXR5LmMKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAw
Li5iYzYwMjBjYzZlNDEKLS0tIC9kZXYvbnVsbAorKysgYi9mcy94ZnMveGZzX2ZzdmVyaXR5LmMK
QEAgLTAsMCArMSwzNCBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8K
Ky8qCisgKiBDb3B5cmlnaHQgKEMpIDIwMjYgUmVkIEhhdCwgSW5jLgorICovCisjaW5jbHVkZSAi
eGZzX3BsYXRmb3JtLmgiCisjaW5jbHVkZSAieGZzX2Zvcm1hdC5oIgorI2luY2x1ZGUgInhmc19p
bm9kZS5oIgorI2luY2x1ZGUgInhmc19zaGFyZWQuaCIKKyNpbmNsdWRlICJ4ZnNfdHJhbnNfcmVz
di5oIgorI2luY2x1ZGUgInhmc19tb3VudC5oIgorI2luY2x1ZGUgInhmc19mc3Zlcml0eS5oIgor
I2luY2x1ZGUgInhmc19mc3Zlcml0eS5oIgorI2luY2x1ZGUgPGxpbnV4L2ZzdmVyaXR5Lmg+Cisj
aW5jbHVkZSA8bGludXgvaW9tYXAuaD4KKworLyoKKyAqIEF0IG1heGltdW0gb2YgOCBsZXZlbHMg
d2l0aCAxMjggaGFzaGVzIHBlciBibG9jayAoMzIgYnl0ZXMgU0hBLTI1NikgbWF4aW11bQorICog
dHJlZSBzaXplIGlzICgoMTI4Xjgg4oiSIDEpLygxMjgg4oiSIDEpKSA9IDU2NyoxMF4xMiBibG9j
a3MuIFRoaXMgc2hvdWxkIGZpdCBpbgorICogNTMgYml0cyBhZGRyZXNzIHNwYWNlLgorICoKKyAq
IEF0IHRoaXMgTWVya2xlIHRyZWUgc2l6ZSB3ZSBjYW4gY292ZXIgMjk1RUIgbGFyZ2UgZmlsZS4g
VGhpcyBpcyBtdWNoIGxhcmdlcgorICogdGhhbiB0aGUgY3VycmVudGx5IHN1cHBvcnRlZCBmaWxl
IHNpemUuCisgKgorICogRm9yIHNoYTUxMiB0aGUgbGFyZ2VzdCBmaWxlIHdlIGNhbiBjb3ZlciBl
bmRzIGF0IDEgPDwgNTAgb2Zmc2V0LCB0aGlzIGlzIGFsc28KKyAqIGdvb2QuCisgKi8KKyNkZWZp
bmUgWEZTX0ZTVkVSSVRZX0xBUkdFU1RfRklMRSAoKGxvZmZfdCkxVUxMIDw8IDUzKQorCitsb2Zm
X3QKK3hmc19mc3Zlcml0eV9tZXRhZGF0YV9vZmZzZXQoCisJY29uc3Qgc3RydWN0IHhmc19pbm9k
ZQkqaXApCit7CisJcmV0dXJuIHJvdW5kX3VwKGlfc2l6ZV9yZWFkKFZGU19JQyhpcCkpLCA2NTUz
Nik7Cit9CmRpZmYgLS1naXQgYS9mcy94ZnMveGZzX2ZzdmVyaXR5LmggYi9mcy94ZnMveGZzX2Zz
dmVyaXR5LmgKbmV3IGZpbGUgbW9kZSAxMDA2NDQKaW5kZXggMDAwMDAwMDAwMDAwLi41NzcxZGIy
Y2Q3OTcKLS0tIC9kZXYvbnVsbAorKysgYi9mcy94ZnMveGZzX2ZzdmVyaXR5LmgKQEAgLTAsMCAr
MSwyMCBAQAorLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8KKy8qCisgKiBD
b3B5cmlnaHQgKEMpIDIwMjYgUmVkIEhhdCwgSW5jLgorICovCisjaWZuZGVmIF9fWEZTX0ZTVkVS
SVRZX0hfXworI2RlZmluZSBfX1hGU19GU1ZFUklUWV9IX18KKworI2luY2x1ZGUgInhmc19wbGF0
Zm9ybS5oIgorCisjaWZkZWYgQ09ORklHX0ZTX1ZFUklUWQorbG9mZl90IHhmc19mc3Zlcml0eV9t
ZXRhZGF0YV9vZmZzZXQoY29uc3Qgc3RydWN0IHhmc19pbm9kZSAqaXApOworI2Vsc2UKK3N0YXRp
YyBpbmxpbmUgbG9mZl90IHhmc19mc3Zlcml0eV9tZXRhZGF0YV9vZmZzZXQoY29uc3Qgc3RydWN0
IHhmc19pbm9kZSAqaXApCit7CisJV0FSTl9PTl9PTkNFKDEpOworCXJldHVybiBVTExPTkdfTUFY
OworfQorI2VuZGlmCS8qIENPTkZJR19GU19WRVJJVFkgKi8KKworI2VuZGlmCS8qIF9fWEZTX0ZT
VkVSSVRZX0hfXyAqLwpkaWZmIC0tZ2l0IGEvZnMveGZzL3hmc19pbm9kZS5oIGIvZnMveGZzL3hm
c19pbm9kZS5oCmluZGV4IGJkNmQzMzU1NzE5NC4uNmRmNDhkNjhhOTE5IDEwMDY0NAotLS0gYS9m
cy94ZnMveGZzX2lub2RlLmgKKysrIGIvZnMveGZzL3hmc19pbm9kZS5oCkBAIC00MTUsNiArNDE1
LDEyIEBAIHN0YXRpYyBpbmxpbmUgYm9vbCB4ZnNfaW5vZGVfY2FuX3N3X2F0b21pY193cml0ZShj
b25zdCBzdHJ1Y3QgeGZzX2lub2RlICppcCkKICAqLwogI2RlZmluZSBYRlNfSVJFTUFQUElORwkJ
KDFVIDw8IDE1KQogCisvKgorICogZnMtdmVyaXR5J3MgTWVya2xlIHRyZWUgaXMgdW5kZXIgY29u
c3RydWN0aW9uLiBUaGUgZmlsZSBpcyByZWFkLW9ubHksIHRoZQorICogb25seSB3cml0ZXMgaGFw
cGVuaW5nIGFyZSBmb3IgdGhlIGZzdmVyaXR5IG1ldGFkYXRhLgorICovCisjZGVmaW5lIFhGU19W
RVJJVFlfQ09OU1RSVUNUSU9OCSgxVSA8PCAxNikKKwogLyogQWxsIGlub2RlIHN0YXRlIGZsYWdz
IHJlbGF0ZWQgdG8gaW5vZGUgcmVjbGFpbS4gKi8KICNkZWZpbmUgWEZTX0FMTF9JUkVDTEFJTV9G
TEFHUwkoWEZTX0lSRUNMQUlNQUJMRSB8IFwKIAkJCQkgWEZTX0lSRUNMQUlNIHwgXApkaWZmIC0t
Z2l0IGEvZnMveGZzL3hmc19pb21hcC5jIGIvZnMveGZzL3hmc19pb21hcC5jCmluZGV4IDljMmYx
MmQ1ZmVjOS4uNzFjY2Q0ZmY1ZjQ4IDEwMDY0NAotLS0gYS9mcy94ZnMveGZzX2lvbWFwLmMKKysr
IGIvZnMveGZzL3hmc19pb21hcC5jCkBAIC0zMiw2ICszMiw4IEBACiAjaW5jbHVkZSAieGZzX3J0
Yml0bWFwLmgiCiAjaW5jbHVkZSAieGZzX2ljYWNoZS5oIgogI2luY2x1ZGUgInhmc196b25lX2Fs
bG9jLmgiCisjaW5jbHVkZSAieGZzX2ZzdmVyaXR5LmgiCisjaW5jbHVkZSA8bGludXgvZnN2ZXJp
dHkuaD4KIAogI2RlZmluZSBYRlNfQUxMT0NfQUxJR04obXAsIG9mZikgXAogCSgoKG9mZikgPj4g
bXAtPm1fYWxsb2NzaXplX2xvZykgPDwgbXAtPm1fYWxsb2NzaXplX2xvZykKQEAgLTE3ODksNiAr
MTc5MSw5IEBAIHhmc19idWZmZXJlZF93cml0ZV9pb21hcF9iZWdpbigKIAkJcmV0dXJuIHhmc19k
aXJlY3Rfd3JpdGVfaW9tYXBfYmVnaW4oaW5vZGUsIG9mZnNldCwgY291bnQsCiAJCQkJZmxhZ3Ms
IGlvbWFwLCBzcmNtYXApOwogCisJaWYgKHhmc19pZmxhZ3NfdGVzdChpcCwgWEZTX1ZFUklUWV9D
T05TVFJVQ1RJT04pKQorCQlpb21hcF9mbGFncyB8PSBJT01BUF9GX0ZTVkVSSVRZOworCiAJZXJy
b3IgPSB4ZnNfcW1fZHFhdHRhY2goaXApOwogCWlmIChlcnJvcikKIAkJcmV0dXJuIGVycm9yOwpA
QCAtMjExMywxMiArMjExOCwxNyBAQCB4ZnNfcmVhZF9pb21hcF9iZWdpbigKIAlib29sCQkJc2hh
cmVkID0gZmFsc2U7CiAJdW5zaWduZWQgaW50CQlsb2NrbW9kZSA9IFhGU19JTE9DS19TSEFSRUQ7
CiAJdTY0CQkJc2VxOworCXVuc2lnbmVkIGludAkJaW9tYXBfZmxhZ3MgPSAwOwogCiAJQVNTRVJU
KCEoZmxhZ3MgJiAoSU9NQVBfV1JJVEUgfCBJT01BUF9aRVJPKSkpOwogCiAJaWYgKHhmc19pc19z
aHV0ZG93bihtcCkpCiAJCXJldHVybiAtRUlPOwogCisJaWYgKGZzdmVyaXR5X2FjdGl2ZShpbm9k
ZSkgJiYKKwkgICAgKG9mZnNldCA+PSB4ZnNfZnN2ZXJpdHlfbWV0YWRhdGFfb2Zmc2V0KGlwKSkp
CisJCWlvbWFwX2ZsYWdzIHw9IElPTUFQX0ZfRlNWRVJJVFk7CisKIAllcnJvciA9IHhmc19pbG9j
a19mb3JfaW9tYXAoaXAsIGZsYWdzLCAmbG9ja21vZGUpOwogCWlmIChlcnJvcikKIAkJcmV0dXJu
IGVycm9yOwpAQCAtMjEzMiw4ICsyMTQyLDkgQEAgeGZzX3JlYWRfaW9tYXBfYmVnaW4oCiAJaWYg
KGVycm9yKQogCQlyZXR1cm4gZXJyb3I7CiAJdHJhY2VfeGZzX2lvbWFwX2ZvdW5kKGlwLCBvZmZz
ZXQsIGxlbmd0aCwgWEZTX0RBVEFfRk9SSywgJmltYXApOwotCXJldHVybiB4ZnNfYm1idF90b19p
b21hcChpcCwgaW9tYXAsICZpbWFwLCBmbGFncywKLQkJCQkgc2hhcmVkID8gSU9NQVBfRl9TSEFS
RUQgOiAwLCBzZXEpOworCWlvbWFwX2ZsYWdzIHw9IHNoYXJlZCA/IElPTUFQX0ZfU0hBUkVEIDog
MDsKKworCXJldHVybiB4ZnNfYm1idF90b19pb21hcChpcCwgaW9tYXAsICZpbWFwLCBmbGFncywg
aW9tYXBfZmxhZ3MsIHNlcSk7CiB9CiAKIGNvbnN0IHN0cnVjdCBpb21hcF9vcHMgeGZzX3JlYWRf
aW9tYXBfb3BzID0gewotLSAKMi41MS4yCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
