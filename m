Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHX/D0txr2m6YQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:18:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A18924375C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 02:18:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Pl/tthRzjgcL4B3O8EUkstoIqADd2mwpqV/dKUVmhM=; b=ii/esGYooMlz8/vs4/Ima7DFNU
	UNwArmRq1OMxtKcMyktDg3ytGDYIrMMbC6ceiqhbZ6nHwd5W+V256XWjwjVzuGy8B05NYSixQlebz
	sWGUtEaS779k7hWRl8pEvFVZa1IbLcOT57zP912iJHMfSXRRMm0fXiDr/u8sym9dflZY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzljQ-00080k-00;
	Tue, 10 Mar 2026 01:17:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vzljO-00080Y-VB
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:17:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mMsWtjFfdzc2pb1gJCuGw/ksE2opqcinsWgN8sAvXtg=; b=cc6WVVTrR8qDEZTg8c6geDqBka
 n2PeWaQQbW6Hy7p1qcA35mDfymTJpLsNIGCSodDvzCTWgeOV31HApHwBvPNsNNxt1yb7Xdkp7+ByB
 /wuXTzSdNfHps5VyfMTno9LMsqnz6GIPhB6bOWkf0W++NLLDjYa3R/xabILdCa6yTc3k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mMsWtjFfdzc2pb1gJCuGw/ksE2opqcinsWgN8sAvXtg=; b=CWiS6RPkUeqokpBMBQS0IIZZc8
 IR3e8QqK9TNmpACI6LpCJ6KPlaDFQkPOVbNWlIQyajgdH93kX1S7G1JIX95HMzt42RTRpqZh9EVZ8
 RMmfk88W2TktnFtPpsqOSepqopCKLEojBeQYouqGl0MKZf6IcqmeJbvQAzDenv3UpqYo=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzljO-0007lK-T5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 01:17:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5289E43D25;
 Tue, 10 Mar 2026 01:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 293B4C4CEF7;
 Tue, 10 Mar 2026 01:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773105464;
 bh=56nUjjKM7Ah5K6O4pNWS96wSR3WUSaWfhbp+8xaYKE8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=stFSN5L8sfCRPDMCe2F664UFPXnPmY8Pgr0bJXpIWNcENTM+E1sba/PXsnWA8wdoc
 sTy4itKJFWuH0zv0qcO87Xa65d6MRqq1ypre2/fX9RPuddA+lS6c5XqMOGRGyx6rYM
 Q4pjVzVx4kTAYyLHtkhM30XllxejOcI3+Luv5i1ygTfsDLEI0djm3BDssJvYLTFccF
 eOorbzm3opINq+yp2zWpEkBxKLBLz6hYBtp1eRG/UPh89mR2ALJcijZ6fLkiFiPL94
 ReXr8LH1jIhJK6Moxl+0GrP2n4FvOvf7PewhzUbrGlSKyVWAAZG48l1eQtmBeThwc0
 wSsmmYYAHNymg==
Date: Mon, 9 Mar 2026 18:17:43 -0700
To: Andrey Albershteyn <aalbersh@kernel.org>
Message-ID: <20260310011743.GD1105363@frogsfrogsfrogs>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-17-aalbersh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260309192355.176980-17-aalbersh@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:23:31PM +0100, Andrey Albershteyn
 wrote: > For write/writeback set IOMAP_F_FSVERITY flag telling iomap to not
 > update inode size and to not skip folios beyond EOF. > > Init [...] 
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
X-Headers-End: 1vzljO-0007lK-T5
Subject: Re: [f2fs-dev] [PATCH v4 16/25] xfs: handle fsverity I/O in
 write/read path
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 8A18924375C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:aalbersh@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

T24gTW9uLCBNYXIgMDksIDIwMjYgYXQgMDg6MjM6MzFQTSArMDEwMCwgQW5kcmV5IEFsYmVyc2h0
ZXluIHdyb3RlOgo+IEZvciB3cml0ZS93cml0ZWJhY2sgc2V0IElPTUFQX0ZfRlNWRVJJVFkgZmxh
ZyB0ZWxsaW5nIGlvbWFwIHRvIG5vdAo+IHVwZGF0ZSBpbm9kZSBzaXplIGFuZCB0byBub3Qgc2tp
cCBmb2xpb3MgYmV5b25kIEVPRi4KPiAKPiBJbml0aWF0ZSBmc3Zlcml0eSB3cml0ZWJhY2sgd2l0
aCBJT01BUF9GX0ZTVkVSSVRZIHNldCB0byB0ZWxsIGlvbWFwCj4gc2hvdWxkIG5vdCBza2lwIGZv
bGlvIHRoYXQgaXMgZGlydHkgYmV5b25kIEVPRi4KPiAKPiBJbiByZWFkIHBhdGggbGV0IGlvbWFw
IGtub3cgdGhhdCB3ZSBhcmUgcmVhZGluZyBmc3Zlcml0eSBtZXRhZGF0YS4gU28sCj4gdHJlYXQg
aG9sZXMgaW4gdGhlIHRyZWUgYXMgcmVxdWVzdCB0byBzeW50aGVzaXplIHRyZWUgYmxvY2tzIGFu
ZCBob2xlCj4gYWZ0ZXIgZGVzY3JpcHRvciBhcyBlbmQgb2YgdGhlIGZzdmVyaXR5IHJlZ2lvbi4K
PiAKPiBJbnRyb2R1Y2UgYSBuZXcgaW5vZGUgZmxhZyBtZWFuaW5nIHRoYXQgbWVya2xlIHRyZWUg
aXMgYmVpbmcgYnVpbGQgb24KPiB0aGUgaW5vZGUuCj4gCj4gU2lnbmVkLW9mZi1ieTogQW5kcmV5
IEFsYmVyc2h0ZXluIDxhYWxiZXJzaEBrZXJuZWwub3JnPgo+IC0tLQo+ICBmcy94ZnMvTWFrZWZp
bGUgICAgICAgICAgfCAgMSArCj4gIGZzL3hmcy9saWJ4ZnMveGZzX2JtYXAuYyB8ICA3ICsrKysr
KysKPiAgZnMveGZzL3hmc19hb3BzLmMgICAgICAgIHwgMTYgKysrKysrKysrKysrKysrLQo+ICBm
cy94ZnMveGZzX2ZzdmVyaXR5LmMgICAgfCAzNCArKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gIGZzL3hmcy94ZnNfZnN2ZXJpdHkuaCAgICB8IDIwICsrKysrKysrKysrKysrKysr
KysrCj4gIGZzL3hmcy94ZnNfaW5vZGUuaCAgICAgICB8ICA2ICsrKysrKwo+ICBmcy94ZnMveGZz
X2lvbWFwLmMgICAgICAgfCAxNSArKysrKysrKysrKysrLS0KPiAgNyBmaWxlcyBjaGFuZ2VkLCA5
NiBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZnMv
eGZzL3hmc19mc3Zlcml0eS5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBmcy94ZnMveGZzX2ZzdmVy
aXR5LmgKPiAKPiBkaWZmIC0tZ2l0IGEvZnMveGZzL01ha2VmaWxlIGIvZnMveGZzL01ha2VmaWxl
Cj4gaW5kZXggOWY3MTMzZTAyNTc2Li4zOGI3ZjUxZTVkODQgMTAwNjQ0Cj4gLS0tIGEvZnMveGZz
L01ha2VmaWxlCj4gKysrIGIvZnMveGZzL01ha2VmaWxlCj4gQEAgLTE0OSw2ICsxNDksNyBAQCB4
ZnMtJChDT05GSUdfWEZTX1BPU0lYX0FDTCkJKz0geGZzX2FjbC5vCj4gIHhmcy0kKENPTkZJR19T
WVNDVEwpCQkrPSB4ZnNfc3lzY3RsLm8KPiAgeGZzLSQoQ09ORklHX0NPTVBBVCkJCSs9IHhmc19p
b2N0bDMyLm8KPiAgeGZzLSQoQ09ORklHX0VYUE9SVEZTX0JMT0NLX09QUykJKz0geGZzX3BuZnMu
bwo+ICt4ZnMtJChDT05GSUdfRlNfVkVSSVRZKQkJKz0geGZzX2ZzdmVyaXR5Lm8KPiAgCj4gICMg
bm90aWZ5IGZhaWx1cmUKPiAgaWZlcSAoJChDT05GSUdfTUVNT1JZX0ZBSUxVUkUpLHkpCj4gZGlm
ZiAtLWdpdCBhL2ZzL3hmcy9saWJ4ZnMveGZzX2JtYXAuYyBiL2ZzL3hmcy9saWJ4ZnMveGZzX2Jt
YXAuYwo+IGluZGV4IDdhNGM4ZjFhYTc2Yy4uOTMxZDAyNjc4ZDE5IDEwMDY0NAo+IC0tLSBhL2Zz
L3hmcy9saWJ4ZnMveGZzX2JtYXAuYwo+ICsrKyBiL2ZzL3hmcy9saWJ4ZnMveGZzX2JtYXAuYwo+
IEBAIC00MSw2ICs0MSw4IEBACj4gICNpbmNsdWRlICJ4ZnNfaW5vZGVfdXRpbC5oIgo+ICAjaW5j
bHVkZSAieGZzX3J0Z3JvdXAuaCIKPiAgI2luY2x1ZGUgInhmc196b25lX2FsbG9jLmgiCj4gKyNp
bmNsdWRlICJ4ZnNfZnN2ZXJpdHkuaCIKPiArI2luY2x1ZGUgPGxpbnV4L2ZzdmVyaXR5Lmg+Cj4g
IAo+ICBzdHJ1Y3Qga21lbV9jYWNoZQkJKnhmc19ibWFwX2ludGVudF9jYWNoZTsKPiAgCj4gQEAg
LTQ0NTEsNiArNDQ1MywxMSBAQCB4ZnNfYm1hcGlfY29udmVydF9vbmVfZGVsYWxsb2MoCj4gIAlY
RlNfU1RBVFNfQUREKG1wLCB4c194c3RyYXRfYnl0ZXMsIFhGU19GU0JfVE9fQihtcCwgYm1hLmxl
bmd0aCkpOwo+ICAJWEZTX1NUQVRTX0lOQyhtcCwgeHNfeHN0cmF0X3F1aWNrKTsKPiAgCj4gKwlp
ZiAoeGZzX2lmbGFnc190ZXN0KGlwLCBYRlNfVkVSSVRZX0NPTlNUUlVDVElPTikgJiYKPiArCSAg
ICBYRlNfRlNCX1RPX0IobXAsIGJtYS5nb3QuYnJfc3RhcnRvZmYpID49Cj4gKwkJICAgIHhmc19m
c3Zlcml0eV9tZXRhZGF0YV9vZmZzZXQoaXApKQo+ICsJCWZsYWdzIHw9IElPTUFQX0ZfRlNWRVJJ
VFk7Cj4gKwo+ICAJQVNTRVJUKCFpc251bGxzdGFydGJsb2NrKGJtYS5nb3QuYnJfc3RhcnRibG9j
aykpOwo+ICAJeGZzX2JtYnRfdG9faW9tYXAoaXAsIGlvbWFwLCAmYm1hLmdvdCwgMCwgZmxhZ3Ms
Cj4gIAkJCQl4ZnNfaW9tYXBfaW5vZGVfc2VxdWVuY2UoaXAsIGZsYWdzKSk7Cj4gZGlmZiAtLWdp
dCBhL2ZzL3hmcy94ZnNfYW9wcy5jIGIvZnMveGZzL3hmc19hb3BzLmMKPiBpbmRleCBmMjc5MDU1
ZmNlYTAuLjk1MDMyNTJhMGZhNCAxMDA2NDQKPiAtLS0gYS9mcy94ZnMveGZzX2FvcHMuYwo+ICsr
KyBiL2ZzL3hmcy94ZnNfYW9wcy5jCj4gQEAgLTIyLDYgKzIyLDcgQEAKPiAgI2luY2x1ZGUgInhm
c19pY2FjaGUuaCIKPiAgI2luY2x1ZGUgInhmc196b25lX2FsbG9jLmgiCj4gICNpbmNsdWRlICJ4
ZnNfcnRncm91cC5oIgo+ICsjaW5jbHVkZSAieGZzX2ZzdmVyaXR5LmgiCj4gICNpbmNsdWRlIDxs
aW51eC9iaW8taW50ZWdyaXR5Lmg+Cj4gIAo+ICBzdHJ1Y3QgeGZzX3dyaXRlcGFnZV9jdHggewo+
IEBAIC0zMzksMTIgKzM0MCwxNiBAQCB4ZnNfbWFwX2Jsb2NrcygKPiAgCWludAkJCXJldHJpZXMg
PSAwOwo+ICAJaW50CQkJZXJyb3IgPSAwOwo+ICAJdW5zaWduZWQgaW50CQkqc2VxOwo+ICsJdW5z
aWduZWQgaW50CQlpb21hcF9mbGFncyA9IDA7Cj4gIAo+ICAJaWYgKHhmc19pc19zaHV0ZG93biht
cCkpCj4gIAkJcmV0dXJuIC1FSU87Cj4gIAo+ICAJWEZTX0VSUk9SVEFHX0RFTEFZKG1wLCBYRlNf
RVJSVEFHX1dCX0RFTEFZX01TKTsKPiAgCj4gKwlpZiAoeGZzX2lmbGFnc190ZXN0KGlwLCBYRlNf
VkVSSVRZX0NPTlNUUlVDVElPTikpCj4gKwkJaW9tYXBfZmxhZ3MgfD0gSU9NQVBfRl9GU1ZFUklU
WTsKPiArCj4gIAkvKgo+ICAJICogQ09XIGZvcmsgYmxvY2tzIGNhbiBvdmVybGFwIGRhdGEgZm9y
ayBibG9ja3MgZXZlbiBpZiB0aGUgYmxvY2tzCj4gIAkgKiBhcmVuJ3Qgc2hhcmVkLiAgQ09XIEkv
TyBhbHdheXMgdGFrZXMgcHJlY2VkZW50LCBzbyB3ZSBtdXN0IGFsd2F5cwo+IEBAIC00MzIsNyAr
NDM3LDggQEAgeGZzX21hcF9ibG9ja3MoCj4gIAkgICAgaXNudWxsc3RhcnRibG9jayhpbWFwLmJy
X3N0YXJ0YmxvY2spKQo+ICAJCWdvdG8gYWxsb2NhdGVfYmxvY2tzOwo+ICAKPiAtCXhmc19ibWJ0
X3RvX2lvbWFwKGlwLCAmd3BjLT5pb21hcCwgJmltYXAsIDAsIDAsIFhGU19XUEMod3BjKS0+ZGF0
YV9zZXEpOwo+ICsJeGZzX2JtYnRfdG9faW9tYXAoaXAsICZ3cGMtPmlvbWFwLCAmaW1hcCwgMCwg
aW9tYXBfZmxhZ3MsCj4gKwkJCSAgWEZTX1dQQyh3cGMpLT5kYXRhX3NlcSk7Cj4gIAl0cmFjZV94
ZnNfbWFwX2Jsb2Nrc19mb3VuZChpcCwgb2Zmc2V0LCBjb3VudCwgd2hpY2hmb3JrLCAmaW1hcCk7
Cj4gIAlyZXR1cm4gMDsKPiAgYWxsb2NhdGVfYmxvY2tzOgo+IEBAIC03MDUsNiArNzExLDE0IEBA
IHhmc192bV93cml0ZXBhZ2VzKAo+ICAJCQl9LAo+ICAJCX07Cj4gIAo+ICsJCS8qCj4gKwkJICog
V3JpdGViYWNrIGRvZXMgbm90IHdvcmsgZm9yIGZvbGlvcyBwYXN0IEVPRiwgbGV0IGl0IGtub3cg
dGhhdAo+ICsJCSAqIEkvTyBoYXBwZW5zIGZvciBmc3Zlcml0eSBtZXRhZGF0YSBhbmQgdGhpcyBy
ZXN0cmljdGlvbiBuZWVkCj4gKwkJICogdG8gYmUgc2tpcHBlZAo+ICsJCSAqLwo+ICsJCWlmICh4
ZnNfaWZsYWdzX3Rlc3QoaXAsIFhGU19WRVJJVFlfQ09OU1RSVUNUSU9OKSkKPiArCQkJd3BjLmN0
eC5pb21hcC5mbGFncyB8PSBJT01BUF9GX0ZTVkVSSVRZOwo+ICsKPiAgCQlyZXR1cm4gaW9tYXBf
d3JpdGVwYWdlcygmd3BjLmN0eCk7Cj4gIAl9Cj4gIH0KPiBkaWZmIC0tZ2l0IGEvZnMveGZzL3hm
c19mc3Zlcml0eS5jIGIvZnMveGZzL3hmc19mc3Zlcml0eS5jCj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLmJjNjAyMGNjNmU0MQo+IC0tLSAvZGV2L251bGwKPiAr
KysgYi9mcy94ZnMveGZzX2ZzdmVyaXR5LmMKPiBAQCAtMCwwICsxLDM0IEBACj4gKy8qIFNQRFgt
TGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykg
MjAyNiBSZWQgSGF0LCBJbmMuCj4gKyAqLwo+ICsjaW5jbHVkZSAieGZzX3BsYXRmb3JtLmgiCj4g
KyNpbmNsdWRlICJ4ZnNfZm9ybWF0LmgiCj4gKyNpbmNsdWRlICJ4ZnNfaW5vZGUuaCIKPiArI2lu
Y2x1ZGUgInhmc19zaGFyZWQuaCIKPiArI2luY2x1ZGUgInhmc190cmFuc19yZXN2LmgiCj4gKyNp
bmNsdWRlICJ4ZnNfbW91bnQuaCIKPiArI2luY2x1ZGUgInhmc19mc3Zlcml0eS5oIgo+ICsjaW5j
bHVkZSAieGZzX2ZzdmVyaXR5LmgiCj4gKyNpbmNsdWRlIDxsaW51eC9mc3Zlcml0eS5oPgo+ICsj
aW5jbHVkZSA8bGludXgvaW9tYXAuaD4KPiArCj4gKy8qCj4gKyAqIEF0IG1heGltdW0gb2YgOCBs
ZXZlbHMgd2l0aCAxMjggaGFzaGVzIHBlciBibG9jayAoMzIgYnl0ZXMgU0hBLTI1NikgbWF4aW11
bQo+ICsgKiB0cmVlIHNpemUgaXMgKCgxMjheOCDiiJIgMSkvKDEyOCDiiJIgMSkpID0gNTY3KjEw
XjEyIGJsb2Nrcy4gVGhpcyBzaG91bGQgZml0IGluCj4gKyAqIDUzIGJpdHMgYWRkcmVzcyBzcGFj
ZS4KPiArICoKPiArICogQXQgdGhpcyBNZXJrbGUgdHJlZSBzaXplIHdlIGNhbiBjb3ZlciAyOTVF
QiBsYXJnZSBmaWxlLiBUaGlzIGlzIG11Y2ggbGFyZ2VyCj4gKyAqIHRoYW4gdGhlIGN1cnJlbnRs
eSBzdXBwb3J0ZWQgZmlsZSBzaXplLgo+ICsgKgo+ICsgKiBGb3Igc2hhNTEyIHRoZSBsYXJnZXN0
IGZpbGUgd2UgY2FuIGNvdmVyIGVuZHMgYXQgMSA8PCA1MCBvZmZzZXQsIHRoaXMgaXMgYWxzbwo+
ICsgKiBnb29kLgo+ICsgKi8KPiArI2RlZmluZSBYRlNfRlNWRVJJVFlfTEFSR0VTVF9GSUxFICgo
bG9mZl90KTFVTEwgPDwgNTMpCgpJIHRoaW5rIHRoaXMgb3VnaHQgdG8gZ28gaW4geGZzX2Zvcm1h
dC5oIHNpbmNlIGl0J3MgcmVsYXRlZCB0byB0aGUKb25kaXNrIGZpbGUgbGF5b3V0LiAgSW4gYWRk
aXRpb24sIEkgdGhpbmsgdGhlIHJvdW5kdXAgdmFsdWUgb3VnaHQgdG8KZ2V0IGl0cyBvd24gI2Rl
ZmluZSBpbiB4ZnNfZm9ybWF0Lmggc2ltaWxhciB0byB0aGUgd2F5IGJ0cmZzIGRvZXMgaXQuCgoj
ZGVmaW5lIFhGU19GU1ZFUklUWV9TVEFSVF9BTElHTgkJKDY1NTM2KQoKPiArCj4gK2xvZmZfdAo+
ICt4ZnNfZnN2ZXJpdHlfbWV0YWRhdGFfb2Zmc2V0KAo+ICsJY29uc3Qgc3RydWN0IHhmc19pbm9k
ZQkqaXApCj4gK3sKPiArCXJldHVybiByb3VuZF91cChpX3NpemVfcmVhZChWRlNfSUMoaXApKSwg
NjU1MzYpOwo+ICt9CgoKdGhlbiB0aGlzIHR1cm5zIGludG86Cgpsb2ZmX3QKeGZzX2ZzdmVyaXR5
X21ldGFkYXRhX29mZnNldCgKCWNvbnN0IHN0cnVjdCB4ZnNfaW5vZGUJKmlwKQp7CglyZXR1cm4g
cm91bmRfdXAoaV9zaXplX3JlYWQoVkZTX0lDKGlwKSksIFhGU19GU1ZFUklUWV9TVEFSVF9BTElH
Tik7Cn0KCldpdGggdGhvc2UgdHdvICNkZWZpbmUgdGhpbmdzIGFkZHJlc3NlZCwgSSdtIHNhdGlz
ZmllZApSZXZpZXdlZC1ieTogIkRhcnJpY2sgSi4gV29uZyIgPGRqd29uZ0BrZXJuZWwub3JnPgoK
LS1ECgoKPiBkaWZmIC0tZ2l0IGEvZnMveGZzL3hmc19mc3Zlcml0eS5oIGIvZnMveGZzL3hmc19m
c3Zlcml0eS5oCj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPiBpbmRleCAwMDAwMDAwMDAwMDAuLjU3
NzFkYjJjZDc5Nwo+IC0tLSAvZGV2L251bGwKPiArKysgYi9mcy94ZnMveGZzX2ZzdmVyaXR5LmgK
PiBAQCAtMCwwICsxLDIwIEBACj4gKy8qIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4w
ICovCj4gKy8qCj4gKyAqIENvcHlyaWdodCAoQykgMjAyNiBSZWQgSGF0LCBJbmMuCj4gKyAqLwo+
ICsjaWZuZGVmIF9fWEZTX0ZTVkVSSVRZX0hfXwo+ICsjZGVmaW5lIF9fWEZTX0ZTVkVSSVRZX0hf
Xwo+ICsKPiArI2luY2x1ZGUgInhmc19wbGF0Zm9ybS5oIgo+ICsKPiArI2lmZGVmIENPTkZJR19G
U19WRVJJVFkKPiArbG9mZl90IHhmc19mc3Zlcml0eV9tZXRhZGF0YV9vZmZzZXQoY29uc3Qgc3Ry
dWN0IHhmc19pbm9kZSAqaXApOwo+ICsjZWxzZQo+ICtzdGF0aWMgaW5saW5lIGxvZmZfdCB4ZnNf
ZnN2ZXJpdHlfbWV0YWRhdGFfb2Zmc2V0KGNvbnN0IHN0cnVjdCB4ZnNfaW5vZGUgKmlwKQo+ICt7
Cj4gKwlXQVJOX09OX09OQ0UoMSk7Cj4gKwlyZXR1cm4gVUxMT05HX01BWDsKPiArfQo+ICsjZW5k
aWYJLyogQ09ORklHX0ZTX1ZFUklUWSAqLwo+ICsKPiArI2VuZGlmCS8qIF9fWEZTX0ZTVkVSSVRZ
X0hfXyAqLwo+IGRpZmYgLS1naXQgYS9mcy94ZnMveGZzX2lub2RlLmggYi9mcy94ZnMveGZzX2lu
b2RlLmgKPiBpbmRleCBiZDZkMzM1NTcxOTQuLjZkZjQ4ZDY4YTkxOSAxMDA2NDQKPiAtLS0gYS9m
cy94ZnMveGZzX2lub2RlLmgKPiArKysgYi9mcy94ZnMveGZzX2lub2RlLmgKPiBAQCAtNDE1LDYg
KzQxNSwxMiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgeGZzX2lub2RlX2Nhbl9zd19hdG9taWNfd3Jp
dGUoY29uc3Qgc3RydWN0IHhmc19pbm9kZSAqaXApCj4gICAqLwo+ICAjZGVmaW5lIFhGU19JUkVN
QVBQSU5HCQkoMVUgPDwgMTUpCj4gIAo+ICsvKgo+ICsgKiBmcy12ZXJpdHkncyBNZXJrbGUgdHJl
ZSBpcyB1bmRlciBjb25zdHJ1Y3Rpb24uIFRoZSBmaWxlIGlzIHJlYWQtb25seSwgdGhlCj4gKyAq
IG9ubHkgd3JpdGVzIGhhcHBlbmluZyBhcmUgZm9yIHRoZSBmc3Zlcml0eSBtZXRhZGF0YS4KPiAr
ICovCj4gKyNkZWZpbmUgWEZTX1ZFUklUWV9DT05TVFJVQ1RJT04JKDFVIDw8IDE2KQo+ICsKPiAg
LyogQWxsIGlub2RlIHN0YXRlIGZsYWdzIHJlbGF0ZWQgdG8gaW5vZGUgcmVjbGFpbS4gKi8KPiAg
I2RlZmluZSBYRlNfQUxMX0lSRUNMQUlNX0ZMQUdTCShYRlNfSVJFQ0xBSU1BQkxFIHwgXAo+ICAJ
CQkJIFhGU19JUkVDTEFJTSB8IFwKPiBkaWZmIC0tZ2l0IGEvZnMveGZzL3hmc19pb21hcC5jIGIv
ZnMveGZzL3hmc19pb21hcC5jCj4gaW5kZXggOWMyZjEyZDVmZWM5Li43MWNjZDRmZjVmNDggMTAw
NjQ0Cj4gLS0tIGEvZnMveGZzL3hmc19pb21hcC5jCj4gKysrIGIvZnMveGZzL3hmc19pb21hcC5j
Cj4gQEAgLTMyLDYgKzMyLDggQEAKPiAgI2luY2x1ZGUgInhmc19ydGJpdG1hcC5oIgo+ICAjaW5j
bHVkZSAieGZzX2ljYWNoZS5oIgo+ICAjaW5jbHVkZSAieGZzX3pvbmVfYWxsb2MuaCIKPiArI2lu
Y2x1ZGUgInhmc19mc3Zlcml0eS5oIgo+ICsjaW5jbHVkZSA8bGludXgvZnN2ZXJpdHkuaD4KPiAg
Cj4gICNkZWZpbmUgWEZTX0FMTE9DX0FMSUdOKG1wLCBvZmYpIFwKPiAgCSgoKG9mZikgPj4gbXAt
Pm1fYWxsb2NzaXplX2xvZykgPDwgbXAtPm1fYWxsb2NzaXplX2xvZykKPiBAQCAtMTc4OSw2ICsx
NzkxLDkgQEAgeGZzX2J1ZmZlcmVkX3dyaXRlX2lvbWFwX2JlZ2luKAo+ICAJCXJldHVybiB4ZnNf
ZGlyZWN0X3dyaXRlX2lvbWFwX2JlZ2luKGlub2RlLCBvZmZzZXQsIGNvdW50LAo+ICAJCQkJZmxh
Z3MsIGlvbWFwLCBzcmNtYXApOwo+ICAKPiArCWlmICh4ZnNfaWZsYWdzX3Rlc3QoaXAsIFhGU19W
RVJJVFlfQ09OU1RSVUNUSU9OKSkKPiArCQlpb21hcF9mbGFncyB8PSBJT01BUF9GX0ZTVkVSSVRZ
Owo+ICsKPiAgCWVycm9yID0geGZzX3FtX2RxYXR0YWNoKGlwKTsKPiAgCWlmIChlcnJvcikKPiAg
CQlyZXR1cm4gZXJyb3I7Cj4gQEAgLTIxMTMsMTIgKzIxMTgsMTcgQEAgeGZzX3JlYWRfaW9tYXBf
YmVnaW4oCj4gIAlib29sCQkJc2hhcmVkID0gZmFsc2U7Cj4gIAl1bnNpZ25lZCBpbnQJCWxvY2tt
b2RlID0gWEZTX0lMT0NLX1NIQVJFRDsKPiAgCXU2NAkJCXNlcTsKPiArCXVuc2lnbmVkIGludAkJ
aW9tYXBfZmxhZ3MgPSAwOwo+ICAKPiAgCUFTU0VSVCghKGZsYWdzICYgKElPTUFQX1dSSVRFIHwg
SU9NQVBfWkVSTykpKTsKPiAgCj4gIAlpZiAoeGZzX2lzX3NodXRkb3duKG1wKSkKPiAgCQlyZXR1
cm4gLUVJTzsKPiAgCj4gKwlpZiAoZnN2ZXJpdHlfYWN0aXZlKGlub2RlKSAmJgo+ICsJICAgIChv
ZmZzZXQgPj0geGZzX2ZzdmVyaXR5X21ldGFkYXRhX29mZnNldChpcCkpKQo+ICsJCWlvbWFwX2Zs
YWdzIHw9IElPTUFQX0ZfRlNWRVJJVFk7Cj4gKwo+ICAJZXJyb3IgPSB4ZnNfaWxvY2tfZm9yX2lv
bWFwKGlwLCBmbGFncywgJmxvY2ttb2RlKTsKPiAgCWlmIChlcnJvcikKPiAgCQlyZXR1cm4gZXJy
b3I7Cj4gQEAgLTIxMzIsOCArMjE0Miw5IEBAIHhmc19yZWFkX2lvbWFwX2JlZ2luKAo+ICAJaWYg
KGVycm9yKQo+ICAJCXJldHVybiBlcnJvcjsKPiAgCXRyYWNlX3hmc19pb21hcF9mb3VuZChpcCwg
b2Zmc2V0LCBsZW5ndGgsIFhGU19EQVRBX0ZPUkssICZpbWFwKTsKPiAtCXJldHVybiB4ZnNfYm1i
dF90b19pb21hcChpcCwgaW9tYXAsICZpbWFwLCBmbGFncywKPiAtCQkJCSBzaGFyZWQgPyBJT01B
UF9GX1NIQVJFRCA6IDAsIHNlcSk7Cj4gKwlpb21hcF9mbGFncyB8PSBzaGFyZWQgPyBJT01BUF9G
X1NIQVJFRCA6IDA7Cj4gKwo+ICsJcmV0dXJuIHhmc19ibWJ0X3RvX2lvbWFwKGlwLCBpb21hcCwg
JmltYXAsIGZsYWdzLCBpb21hcF9mbGFncywgc2VxKTsKPiAgfQo+ICAKPiAgY29uc3Qgc3RydWN0
IGlvbWFwX29wcyB4ZnNfcmVhZF9pb21hcF9vcHMgPSB7Cj4gLS0gCj4gMi41MS4yCj4gCj4gCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
