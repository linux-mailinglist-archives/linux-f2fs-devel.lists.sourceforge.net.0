Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DKrBp8h6GmjFgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 03:17:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2517F4410BB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Apr 2026 03:17:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9uM2M6Oq9TCk+pYFT+lFb0oj5eJ/ndSSGupFX7J0n2k=; b=d0YFzUZeQc4p4uSk2Jh+OKdk81
	UPHWQyXcZyzO+McYqYSQ6BMYreC72lvcZu89Vlpm+nWEJQ1zHCLFVJHP66z+wbvMbd6Tn2KUbxuFW
	ajiJlmpio1SIKABFZBFLcCGWJZGHm0iBjjMoIIuimimAUzcnO/CkSaw7cAVt+N1q31Mg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFMD4-0001kn-WA;
	Wed, 22 Apr 2026 01:16:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wFMD3-0001ka-It
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 01:16:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NksIoBrWw0xtIFOvYUm8yrZe1G76tF1nDNe0xlSQ3F0=; b=bVoWcgrslCHXSqhYkcN0Uk4YjR
 kglAW9XAv8V1MP1Am5XCDOmBjS2E32qSKbHF6SGB3G1ErAc1OmjRaI/7+ZnevqMoInxYuIy/A1jku
 AHNoOnbt9qUui11Z0kNDwMm7ONZZF1GAJ5iTShQLVHuJhTiQCnwPHGjD4Us2TMnhG/74=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NksIoBrWw0xtIFOvYUm8yrZe1G76tF1nDNe0xlSQ3F0=; b=D8V9u5DlHEXtd5ATGG6qWDxIYJ
 KHOluCOy4Syl5x6vuOCUtZu1foMvjpYv8xwHsvfXWf7fBuEsyLMIGocuFjtFvp+K/p/KRmO2/jXpJ
 9zPdNOYsFcrOYR9KNwSqJ1XXtfNhLL8NIc2fFKZsPHFzhfnHYlaKRf7eo3jftdv/xUgo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFMD3-0005Yw-F5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Apr 2026 01:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AEFCD60018;
 Wed, 22 Apr 2026 01:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5316C2BCB0;
 Wed, 22 Apr 2026 01:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776820606;
 bh=orMfl6hviauaGhOkAKBLZa86ETim8FXaBtlxWsjex7A=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=WLWHWJiYIvpZttFxdod3obD0fTANWlBCveKRDkCN5H159MANI9mzgFRHyAhGT9DDM
 c6H8m2/Tj7ar/DTNnpitqVpU7bh0+FWoN3R8PlohmT0uQoJkbtUnaKZHxhwYtKY8NT
 G5uUxqajvg0w1HmCFKsc/+CqIhnRMPzrpJH0x4MUgym4BER6ckX/JG6cLNxn9qQkKS
 GVGZ5D0iOTHN9AbNILERPbjvcvdhOqYAjIVTJec2kkoyaTZnal4w7fqdnHG50W2xf8
 NVStQFgfWevmaFdf1rBz4sotvOz3QH1YKyvobcxsxRwfeb1CDM6Y1PJ0umKZ5JtuB+
 UBotCUDvmb+GA==
Message-ID: <cd4f543a-a1cc-46b9-a9db-b2fab46fe6c1@kernel.org>
Date: Wed, 22 Apr 2026 09:16:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaosen He <xiaosen.he@oss.qualcomm.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
 <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
 <c640e206-66bb-42a0-aa30-425520670e1e@kernel.org>
 <90f3c071-9567-476f-aa27-866cd5310776@oss.qualcomm.com>
 <765aa6b4-a77e-473e-98a2-bcb41eddeb51@oss.qualcomm.com>
 <143ae906-d6a5-40d4-8573-68fe798cdcfa@kernel.org>
 <c91ba4f4-99ba-4ee4-be21-3b678e8b0093@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c91ba4f4-99ba-4ee4-be21-3b678e8b0093@oss.qualcomm.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/20/2026 9:06 PM,
 Xiaosen He wrote: > > On 4/17/2026 10:11
 AM, Chao Yu wrote: >> On 4/14/2026 2:56 PM, Xiaosen wrote: >>> >>> On 4/13/2026
 10:42 PM, Xiaosen via Linux-f2fs-devel wrote: >>>> >>>> O [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFMD3-0005Yw-F5
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: fix deadlock in serializing io
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
Cc: can.guo@oss.qualcomm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:xiaosen.he@oss.qualcomm.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:can.guo@oss.qualcomm.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
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
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 2517F4410BB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8yMC8yMDI2IDk6MDYgUE0sIFhpYW9zZW4gSGUgd3JvdGU6Cj4gCj4gT24gNC8xNy8yMDI2
IDEwOjExIEFNLCBDaGFvIFl1IHdyb3RlOgo+PiBPbiA0LzE0LzIwMjYgMjo1NiBQTSwgWGlhb3Nl
biB3cm90ZToKPj4+Cj4+PiBPbiA0LzEzLzIwMjYgMTA6NDIgUE0sIFhpYW9zZW4gdmlhIExpbnV4
LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4KPj4+PiBPbiA0LzEzLzIwMjYgNzo1NCBQTSwgQ2hhbyBZ
dSB3cm90ZToKPj4+Pj4gT24gNC8xMC8yMDI2IDY6NTMgUE0sIFhpYW9zZW4gSGUgd3JvdGU6Cj4+
Pj4+PiBrd29ya2VyL3UzMjo3KGYyZnMgd3JpdGViYWNrIHRocmVhZCkgd2FzIHRyeWluZyB0byBh
Y3F1aXJlCj4+Pj4+PiBzYmktPndyaXRlcGFnZXMsIHRoZSBtdXRleCB3YXMgYWxyZWFkeSBhY3F1
aXJlZCBieSBlbXVsYXRlZDswLgo+Pj4+Pj4ga3dvcmtlci91MzI6NyB0cmllZCB0byBmbHVzaCBw
bHVnZ2VkIElPIGJlZm9yZSBzbGVlcCwgZHVyaW5nCj4+Pj4+PiBmbHVzaGluZyBwbHVnIGxpc3Qs
IGt3b3JrZXIvdTMyOjcgZ290IHByZWVtcHRlZCBpbiBSQ1UgcmVhZC1zaWRlCj4+Pj4+PiBjcml0
aWNhbCBzZWN0aW9uIGFuZCBnb3Qgc2NoZWR1bGVkIG91dCB3YWl0aW5nIHRvIGJlIHdva2VuIHVw
IGJ5Cj4+Pj4+PiB0aGUgcmVsZWFzZSBvZiBtdXRleC4gZW11bGF0ZWQ7MCB3YXMgYmxvY2tlZCBv
biBibGtfbXFfZ2V0X3RhZwo+Pj4+Pj4gYXMgdGhlcmUgd2FzIG5vIGF2YWlsYWJsZSB0YWcgYW5k
IGV4cGVjdGVkIHRoZSBwcmV2aW91cyBJTwo+Pj4+Pj4gcmVxdWVzdHMgdG8gYmUgaGFuZGxlZCBi
eSBVRlMgaG9zdCB0byByZWxlYXNlIHRhZ3MsIGJ1dCBVRlMgaG9zdAo+Pj4+Pj4gd2FzIGJsb2Nr
ZWQgb24gc3luY2hyb25pemVfcmN1IHdhaXRpbmcgZm9yIGVuZGluZyBvZiBSQ1UgZ3JhY2UKPj4+
Pj4+IHBlcmlvZC4gdGhlIGRlYWRsb2NrIHdhcyBjYXVzZWQgYnkgd3JpdGViYWNrIHRocmVhZCB3
YXMgc3R1Y2sgaW4KPj4+Pj4+IFJDVSBjcml0aWNhbCBzZWN0aW9uIHdhaXRpbmcgZm9yIG11dGV4
LiBjYWxsIGJsa19mbHVzaF9wbHVnKCkgaWYKPj4+Pj4+IG11dGV4X3RyeWxvY2soJnNiaS0+d3Jp
dGVwYWdlcykgZmFpbGVkLCBzbyB0aGF0IHRoZSBwbHVnIGxpc3QgaXMKPj4+Pj4+IGVtcHR5IHdo
ZW4gYmxrX2ZsdXNoX3BsdWcoKSBpcyBjYWxsZWQgaW4gc2NoZWRfc3VibWl0X3dvcmsgdG8KPj4+
Pj4+IGZpeCB0aGUgZGVhZGxvY2suCj4+Pj4+Cj4+Pj4+IElNTywgbG9vayBtb3JlIGxpa2UgYSBj
b21tb24gYnVnPyBvdGhlcndpc2UsIHNvdW5kcyBsaWtlIHdlIGNhbiBub3QKPj4+Pj4gZ3JhYiBt
dXRleCBsb2NrIHcvIG11dGV4X2xvY2sgZGlyZWN0bHkgZHVyaW5nIHdyaXRlYmFjayBpbgo+Pj4+
PiAud3JpdGVwYWdlcz8KPj4+Pj4KPj4+IEluIHdyaXRlYmFjayB0aHJlYWQsIHRoZSBjYWxsIHBh
dGggd291bGQgYmUgYXMgZm9sbG93cy4KPj4+IGJsa19zdGFydF9wbHVnCj4+PiBtdXRleF9sb2Nr
Cj4+PiB3cml0ZWJhY2sgZmlsZSBBCj4+PiBtdXRleF91bmxvY2sKPj4+IG11dGV4dF9sb2NrCj4+
PiB3cml0ZWJhY2sgZmlsZSBCCj4+PiBtdXRleF91bmxvY2sKPj4+IC4uLi4uLgo+Pj4gYmxrX2Zp
bmlzaF9wbHVnCj4+Pgo+Pj4gU28sIG1vc3QgcHJvYmFibHkgd2hlbiB0aGUgdGhyZWFkIGZhaWxl
ZCB0byBhY3F1aXJlIHRoZSBtdXRleCBmb3IKPj4+IHdyaXRpbmcgYmFjayBhCj4+PiBmaWxlJ3Mg
ZGF0YSwgdGhlIGJsb2NrIHBsdWcgbGlzdCBpcyBub3QgZW1wdHkgYXMgdGhlIHByZXZpb3VzbHkK
Pj4+IGhhbmRsZWQgZmlsZXMnCj4+PiBkYXRhwqAgaGF2ZSBiZWVuIHByZXBhcmVkIGFzIHdyaXRl
IHJlcXVlc3RzIGFuZCBwbHVnZ2VkIG9uIHRoZSBsaXN0Lgo+Pj4+Pj4KPj4+Pj4+ICDCoMKgwqDC
oMKgIFRhc2sgbmFtZToga3dvcmtlci91MzI6N8KgwqDCoCBbYWZmaW5pdHk6IDB4ZmZdIHBpZDog
MjMzCj4+Pj4+PiB0Z2lkOsKgwqDCoCAyMzMgY3B1OiA2IHByaW86IDk4IHN0YXJ0OiAweGZmZmZm
ZjgwOTkzOTAwNDAKPj4+Pj4+ICDCoMKgwqDCoMKgIHN0YXRlOiAweDJbRF0gZXhpdF9zdGF0ZTog
MHgwIHN0YWNrIGJhc2U6IDB4ZmZmZmZmYzA4M2M0ODAwMAo+Pj4+Pj4gIMKgwqDCoMKgwqAgTGFz
dF9lbnF1ZXVlZF90czrCoMKgwqDCoCAzOTAuMTY5Mzk1ODc3IExhc3Rfc2xlZXBfdHM6Cj4+Pj4+
PiAzODkuNzU2NjM5NTc0Cj4+Pj4+PiAgwqDCoMKgwqDCoCBTdGFjazoKPj4+Pj4+ICDCoMKgwqDC
oMKgIFs8ZmZmZmZmZDNhMGIxZDI1ND5dIF9fc3dpdGNoX3RvKzB4MjE0Cj4+Pj4+PiAgwqDCoMKg
wqDCoCBbPGZmZmZmZmQzYTBiMWRlYjg+XSBfX3NjaGVkdWxlKzB4YTMwCj4+Pj4+PiAgwqDCoMKg
wqDCoCBbPGZmZmZmZmQzYTBiMWU3NTQ+XSBwcmVlbXB0X3NjaGVkdWxlX25vdHJhY2UrMHg2OAo+
Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOWRkZjM4Pl0gcmN1X2lzX3dhdGNoaW5nW2p0
XSsweDVjCj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5OTk1Yjg+XSBsb2NrX2FjcXVp
cmUrMHg2OAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmU4NzBjPl0gcmN1X2xvY2tf
YWNxdWlyZSsweDM0Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTg3NjQ+XSBwZXJj
cHVfcmVmX3B1dF9tYW55KzB4MjAKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZlM2E2
ND5dIGJsa19tcV9kaXNwYXRjaF9saXN0KzB4NTcwCj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZm
ZmQzOWZmZTMyNjQ+XSBibGtfbXFfZmx1c2hfcGx1Z19saXN0KzB4MTNjCj4+Pj4+PiAgwqDCoMKg
wqDCoCBbPGZmZmZmZmQzOWZmZDQzYTg+XSBfX2Jsa19mbHVzaF9wbHVnKzB4MTFjCj4+Pj4+Cj4+
Pj4+IEl0IHRyaWVzIHRvIGZsdXNoIHBsdWcgbGlzdCBpbnNpZGUgbXV0ZXhfbG9jaygpIGFuZCB0
aGVuIGJlCj4+Pj4+IGJsb2NrZWQuIFdpbGwgaXQgY2F1c2UKPj4+Pj4gdGhlIHNhbWUgaXNzdWUg
dy8geW91ciBiZWxvdyBpbXBsZW1lbnRhdGlvbjoKPj4+Pj4KPj4+Pj4gaWYgKCFtdXRleF90cnls
b2NrKCZzYmktPndyaXRlcGFnZXMpKQo+Pj4+PiAgwqDCoMKgwqDCoGJsa19mbHVzaF9wbHVnKCgo
c3RydWN0IHRhc2tfc3RydWN0ICopY3VycmVudCktPnBsdWcsIHRydWUpOwo+Pj4+PiA8LS0tIGhl
cmUKPj4+Pgo+Pj4+IElmIGJsa19mbHVzaF9wbHVnIGlzIGNhbGxlZCBoZXJlLCB3aGVuIHByZWVt
cHRpb24gaGFwcGVuZWQgaW4gUkNVCj4+Pj4gY3JpdGljYWwKPj4+Pgo+Pj4+IHNlY2l0b24sIHRo
ZSB0YXNrIHdvdWxkIGJlIHNjaGVkdWxlZCBvdXQgaW4gUiBzdGF0ZSwgc28gdGhhdCB0aGUKPj4+
PiB0YXNrIGNhbiBiZQo+Pj4+Cj4+Pj4gc2NoZWR1bGVkIGluIHF1aWNrbHkgdG8gZW5kIFJDVSBn
cmFjZSBwZXJpb2QsIHRoZW4gaXQgd29uJ3QgYmxvY2sKPj4+PiBVRlMgaG9zdC4KPj4+Pgo+Pj4+
IFJlZ2FyZHMsCj4+Pj4KPj4+PiBYaWFvc2VuCj4+Pj4KPj4+Pj4gLi4uCj4+Pj4+IG11dGV4X2xv
Y2soJnNiaS0+d3JpdGVwYWdlcyk7Cj4+Pj4+Cj4+Pj4+IExldCBtZSBrbm93IGlmIEknbSBtaXNz
aW5nIGFueXRoaW5nLgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+PiBrd29ya2VyL3UzMjoyICh3cml0
ZWJhY2sgdGhyZWFkKQo+Pj4gX19tdXRleF9sb2NrX2NvbW1vbgo+Pj4gIMKgIMKgIHNldF9jdXJy
ZW50X3N0YXRlKFRBU0tfVU5JTlRFUlJVUFRJQkxFKTsKPj4+ICDCoCDCoCBzY2hlZHVsZV9wcmVl
bXB0X2Rpc2FibGVkCj4+PiAgwqAgwqAgwqAgc2NoZWR1bGUKPj4+ICDCoCDCoCDCoCDCoCBzY2hl
ZF9zdWJtaXRfd29yawo+Pj4gIMKgIMKgIMKgIMKgIMKgIGJsa19mbHVzaF9wbHVnCj4+PiAgwqAg
wqAgwqAgwqAgwqAgwqAgX19ibGtfZmx1c2hfcGx1Zwo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IGJsa19tcV9mbHVzaF9wbHVnX2xpc3QKPj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBibGtf
bXFfZGlzcGF0Y2hfbGlzdAo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHBlcmNwdV9y
ZWZfcHV0Cj4+PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGVyY3B1X3JlZl9wdXRf
bWFueQo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHJjdV9yZWFkX2xvY2sK
Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwcmVlbXB0X3NjaGVkdWxl
X25vdHJhY2UKPj4+Cj4+PiBJbiBfX211dGV4X2xvY2tfc2xvd3BhdGgsIHRoZSB0YXNrJ3Mgc3Rh
dGUgaXMgc2V0IHRvCj4+PiBUQVNLX1VOSU5URVJSVVBUSUJMRSwgdGhlbgo+Pgo+PiBPaCwgSSBz
ZWUsIGl0J3MgVEFTS19VTklOVEVSUlVQVElCTEUgc3RhdGUgYW5kIGJlIHByZWVtcHRlZCwgc2hv
dWxkbid0Cj4+IHdlIHNldAo+PiBUQVNLX0lOVEVSUlVQVElCTEUgc3RhdGUgYmVmb3JlIGl0IHJ1
bnMgaW50byByY3UgY3JpdGljYWwgcmVnaW9uPyBOb3QKPj4gc3VyZSwgYnV0Cj4+IEkgc3VzcGVj
dCBpdCdzIGEgYnVnIGZyb20gY29tbW9uIG11dGV4bG9jay9ibG9jay91ZnMgbW9kdWxlcyByYXRo
ZXIKPj4gdGhhbiBmMmZzJy4KPj4KPj4gU2luY2UgaXQncyBoYXJkIHRvIGNoYW5nZSBjb21tb24g
bW9kdWxlLCBvciBjYW4gd2UgY29uc2lkZXIgdG8gdXNlCj4+IHJ3c2VtIGxvY2sKPj4gaW5zdGVh
ZCBvZiBtdXRleCBsb2NrIGluIC53cml0ZXBhZ2VzPyBJIHN1c3BlY3Qgd2UgbWF5IHN1ZmZlciBw
ZXJmb3JtYW5jZQo+PiByZWdyZXNzaW9uIGlmIHdlIGZsdXNoIHBsdWcgbGlzdCBpbiBhZHZhbmNl
IGJlZm9yZSBtdXRleF9sb2NrLgo+Pgo+PiBDYW4geW91IHBsZWFzZSBnaXZlIHNvbWUgcGVyZm9y
bWFuY2UgbnVtYmVycyBmb3IgYm90aCBtdXRleCBhbmQgcndzZW0KPj4gdmVyc2lvbj8KPj4KPj4g
VGhhbmtzLAo+IAo+IEEgdGFzayB3b3VsZCBiZSBzZXQgdG8gVEFTS19VTklOVEVSUlVQVElCTEUg
dGhlbiBjYWxsCj4gc2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxlZAo+IAo+IGFsc28gaWYgZmFpbGVk
IHRvIGFjcXVpcmXCoHJ3c2VtIGxvY2ssIGFuZCB0aGUgdGFzayB3aWxsIGVuY291bnRlcgo+IHNp
bWlsYXIgZGVhZGxvY2suCgpPaCwgd2VsbCwgd2Ugd2lsbCBzdWZmZXIgdGhlIHNhbWUgaXNzdWUg
dy8gaW9fcndzZW0/CgotIHdyaXRlcGFnZXMKICAtIGYyZnNfd3JpdGVfY2FjaGVfcGFnZXMKICAg
LSBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UKICAgIC0gZjJmc19kb193cml0ZV9kYXRhX3Bh
Z2UKICAgICAtIGYyZnNfb3V0cGxhY2Vfd3JpdGVfZGF0YQogICAgICAtIGRvX3dyaXRlX3BhZ2UK
ICAgICAgIC0gZjJmc19zdWJtaXRfcGFnZV93cml0ZQogICAgICAgIC0gZjJmc19kb3duX3dyaXRl
X3RyYWNlKGlvX3J3c2VtKQogICAgICAgICAgOiBjYW4gYmxvY2sgb24gYmxrX3BsdWdfZmx1c2gg
LT4gcmN1X3JlYWRfbG9jayAtPiBwcmVlbXB0CiAgICAgICAgICAgIG1lYW53aGlsZSBibGtfbXFf
cXVpZXNjZV90YWdzZXQgd2lsbCBibG9jayBvbiBzeW5jaHJvbml6ZV9yY3UKICAgICAgICAgLSBf
X3N1Ym1pdF9tZXJnZWRfYmlvCgo+IAo+IElmIHRoZSBtdXRleCBoYXMgYWxyZWFkeSBiZWVuIGFj
cXVpcmVkIGJ5IGFub3RoZXIgdGFzaywgdGhlIHdyaXRlYmFjawo+IHRocmVhZCB3b3VsZCBmbHVz
aAo+IAo+IHBsdWcgbGlzdCBhbnl3YXkuIEFuZCB0aGUgcGx1ZyBsaXN0IGlzIGVtcHR5IHdoZW4g
anVzdCB3cml0ZSBiYWNrIGEKPiBzaW5nbGUgZmlsZSdzIGRhdGEuCj4gCj4gSSBkb24ndCB0aGlu
ayBpdCB3aWxsIG1ha2UgYmlnIGRpZmZlcmVuY2UgdG8gcGVyZm9ybWFuY2UuCj4gCj4gSSBjYW4g
Z2l2ZSBwZXJmb3JtYW5jZSBudW1iZXJzIGlmIHlvdSBpbnNpc3QuCgpQbGVhc2UgZmlndXJlIG91
dCBzb21lIG51bWJlcnMsIEkgZ3Vlc3MgeW91IGNhbiBmbHVzaCBwbHVnIGxpc3Qgd2hlbmV2ZXIK
dHJ5aW5nIHRvIGdyYWIgc2JpLT53cml0ZXBhZ2VzIGxvY2sgaW4gdGhlIGNvbnRyb2wgZ3JvdXAs
IGl0IGNhbiBoZWxwIHRvCnNpbXVsYXRlIHRoZSBleHRyZW1lIGNhc2UuCgpUaGFua3MsCgo+IAo+
IFJlZ2FyZHMsCj4gCj4gWGlhb3Nlbgo+IAo+Pgo+Pj4gY2FsbCBibGtfZmx1c2hfcGx1ZyBsYXRl
ciwgc28gb25jZSBwcmVlbXB0aW9uIGhhcHBlbmVkIGluIFJDVQo+Pj4gY3JpdGljYWwgc2VjdGlv
biwKPj4+IHRoZSB0YXNrIHdvdWxkIGJlIHN0dWNrIGluIFJDVSBjcml0aWNhbCBzZWN0aW9uIHdh
aXRpbmcgZm9yIHRoZQo+Pj4gcmVsZWFzZSBvZiBtdXRleC4KPj4+IFJlZ2FyZGluZyBteSBmaXgs
IGluIG11dGV4X3RyeWxvY2ssIGl0IHdvbid0IGNhbGwgYmxrX2ZsdXNoX3BsdWcgaWYKPj4+IG11
dGV4X3RyeWxvY2sKPj4+IGZhaWxlZC4gTGV0J3MgZmx1c2ggcGx1ZyBsaXN0IGlmIG11dGV4X3Ry
eWxvY2sgZmFpbGVkLCBzbyB0aGF0IHdoZW4KPj4+IGl0IGdvZXMgdG8KPj4+IG11dGV4X2xvY2sg
YW5kIGZhaWxlZCB0byBhY3F1aXJlIHRoZSBtdXRleCwgdGhlIGxhdGVyIGNhbGwgdG8KPj4+IGJs
a19mbHVzaF9wbHVnCj4+PiB3b3VsZCBiZSBzaW1wbGUgYXMgdGhlIHBsdWcgbGlzdCBpcyBlbXB0
eSBhbmQgdGhlcmUgaXMgbm8gY2hhbmNlIHRvCj4+PiBnbyB0bwo+Pj4gcmN1X3JlYWRfbG9jay4K
Pj4+Cj4+PiBSZWdhcmRzLAo+Pj4gWGlhb3Nlbgo+Pj4+Pgo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxm
ZmZmZmZkMzlmOTNlNmM0Pl0gc2NoZWRfc3VibWl0X3dvcmsrMHg3OAo+Pj4+Pj4gIMKgwqDCoMKg
wqAgWzxmZmZmZmZkM2EwYjFlNGQ4Pl0gc2NoZWR1bGUrMHgzOAo+Pj4+Pj4gIMKgwqDCoMKgwqAg
WzxmZmZmZmZkM2EwYjFlNWM0Pl0gc2NoZWR1bGVfcHJlZW1wdF9kaXNhYmxlZCsweDE4Cj4+Pj4+
PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMjBjN2M+XSBfX211dGV4X2xvY2tfY29tbW9uKzB4
YWI4Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMjAwODQ+XSBtdXRleF9sb2NrX25l
c3RlZCsweDJjCj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZWE3MmM+XSBmMmZzX3dy
aXRlX2RhdGFfcGFnZXMrMHhkNjQKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmJiMzk1
OD5dIGRvX3dyaXRlcGFnZXMrMHhkNAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5
ZmQ4Pl0gX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NzgKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8
ZmZmZmZmZDM5ZmQwOTk1OD5dIHdyaXRlYmFja19zYl9pbm9kZXMrMHgyYjgKPj4+Pj4+ICDCoMKg
wqDCoMKgIFs8ZmZmZmZmZDM5ZmQwOWNjMD5dIF9fd3JpdGViYWNrX2lub2Rlc193YisweGEwCj4+
Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZkMDkwNTQ+XSB3Yl93cml0ZWJhY2srMHgxODgK
Pj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmQwNjZkMD5dIHdiX3dvcmtmbltqdF0rMHg0
MzgKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkxOThlMD5dIHByb2Nlc3Nfb25lX3dv
cmsrMHgyN2MKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkxYmFmOD5dIHdvcmtlcl90
aHJlYWQrMHgzNTgKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkyNDUzND5dIGt0aHJl
YWQrMHgxNTAKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjgzMGU0ND5dIHJldF9mcm9t
X2ZvcmsrMHgxMAo+Pj4+Pj4KPj4+Pj4+ICDCoMKgwqDCoMKgIFRhc2sgbmFtZToga3dvcmtlci91
MzI6MsKgwqDCoCBbYWZmaW5pdHk6IDB4ZmZdIHBpZDrCoMKgwqDCoCA5MAo+Pj4+Pj4gdGdpZDrC
oMKgwqDCoCA5MCBjcHU6IDEgcHJpbzogMTIwIHN0YXJ0OiAweGZmZmZmZjgwYWRhZTgwNDAKPj4+
Pj4+ICDCoMKgwqDCoMKgIHN0YXRlOiAweDJbRF0gZXhpdF9zdGF0ZTogMHgwIHN0YWNrIGJhc2U6
IDB4ZmZmZmZmYzA4MGExODAwMAo+Pj4+Pj4gIMKgwqDCoMKgwqAgTGFzdF9lbnF1ZXVlZF90czrC
oMKgwqDCoCAzODkuODk5NjA4NjM3IExhc3Rfc2xlZXBfdHM6Cj4+Pj4+PiAzODkuODk5NjY1MzAz
Cj4+Pj4+PiAgwqDCoMKgwqDCoCBTdGFjazoKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNh
MGIxZDI1ND5dIF9fc3dpdGNoX3RvKzB4MjE0Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQz
YTBiMWRlYjg+XSBfX3NjaGVkdWxlKzB4YTMwCj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQz
YTBiMWU0ZTg+XSBzY2hlZHVsZSsweDQ4Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5
ZGZhNjQ+XSBzeW5jaHJvbml6ZV9yY3VfZXhwZWRpdGVkKzB4OTI4Cj4+Pj4+PiAgwqDCoMKgwqDC
oCBbPGZmZmZmZmQzOWY5ZGVlYjA+XSBzeW5jaHJvbml6ZV9yY3VbanRdKzB4MjM0Cj4+Pj4+PiAg
wqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZGU1ZDQ+XSBibGtfbXFfcXVpZXNjZV90YWdzZXRbanRd
KzB4YTgKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDYxY2Q5MD5dIHVmc2hjZF9kZXZm
cmVxX3NjYWxlKzB4OTAKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDNhMDYxY2E2Yz5dIHVm
c2hjZF9kZXZmcmVxX3RhcmdldCsweDIwNAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkM2Ew
NmRlMjQ0Pl0gZGV2ZnJlcV9zZXRfdGFyZ2V0KzB4YjgKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZm
ZmZmZDNhMDZkZTE0Yz5dIGRldmZyZXFfdXBkYXRlX3RhcmdldFtqdF0rMHhkOAo+Pj4+Pj4gIMKg
wqDCoMKgwqAgWzxmZmZmZmZkM2EwNmRlNWU4Pl0gZGV2ZnJlcV9tb25pdG9yKzB4MzgKPj4+Pj4+
ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkxOThlMD5dIHByb2Nlc3Nfb25lX3dvcmsrMHgyN2MK
Pj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkxYmFmOD5dIHdvcmtlcl90aHJlYWQrMHgz
NTgKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkyNDUzND5dIGt0aHJlYWQrMHgxNTAK
Pj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjgzMGU0ND5dIHJldF9mcm9tX2ZvcmsrMHgx
MAo+Pj4+Pj4KPj4+Pj4+ICDCoMKgwqDCoMKgIFRhc2sgbmFtZTogZW11bGF0ZWQ7MMKgwqDCoMKg
wqDCoCBbYWZmaW5pdHk6IDB4ZmZdIHBpZDogNTI0NQo+Pj4+Pj4gdGdpZDrCoMKgIDQ5MjIgY3B1
OiA2IHByaW86IDEyMCBzdGFydDogMHhmZmZmZmY4OWUyZTYwMDQwCj4+Pj4+PiAgwqDCoMKgwqDC
oCBzdGF0ZTogMHgyW0RdIGV4aXRfc3RhdGU6IDB4MCBzdGFjayBiYXNlOiAweGZmZmZmZmMwZDQy
ZjgwMDAKPj4+Pj4+ICDCoMKgwqDCoMKgIExhc3RfZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzkwLjE2
OTM5NTg3NyBMYXN0X3NsZWVwX3RzOgo+Pj4+Pj4gMzkwLjE3ODQ1OTczMQo+Pj4+Pj4gIMKgwqDC
oMKgwqAgU3RhY2s6Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWQyNTQ+XSBfX3N3
aXRjaF90bysweDIxNAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFkZWI4Pl0gX19z
Y2hlZHVsZSsweGEzMAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlNGU4Pl0gc2No
ZWR1bGUrMHg0OAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlOGY0Pl0gaW9fc2No
ZWR1bGUrMHgzOAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmViMTEwPl0gYmxrX21x
X2dldF90YWcrMHgxYTQKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZkZWRjOD5dIF9f
YmxrX21xX2FsbG9jX3JlcXVlc3RzKzB4MzU4Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQz
OWZmZTQwOWM+XSBibGtfbXFfc3VibWl0X2JpbysweDUwYwo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxm
ZmZmZmZkMzlmZmQ0Y2I4Pl0gX19zdWJtaXRfYmlvW2p0XSsweDE2NAo+Pj4+Pj4gIMKgwqDCoMKg
wqAgWzxmZmZmZmZkMzlmZmQyZTdjPl0gc3VibWl0X2Jpb19ub2FjY3Rfbm9jaGVjaysweDE0Ywo+
Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmQzMzk0Pl0gc3VibWl0X2Jpb19ub2FjY3Qr
MHgzMzAKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZkMzgxND5dIHN1Ym1pdF9iaW8r
MHgxZjQKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlMmJhOD5dIGYyZnNfc3VibWl0
X3dyaXRlX2JpbysweDg4Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZTQxM2M+XSBf
X3N1Ym1pdF9tZXJnZWRfYmlvW2p0XSsweGJjCj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQz
OWZlZTNjNGM+XSBmMmZzX3N1Ym1pdF9wYWdlX3dyaXRlKzB4NDAwCj4+Pj4+PiAgwqDCoMKgwqDC
oCBbPGZmZmZmZmQzOWZmMDRhYWM+XSBkb193cml0ZV9wYWdlKzB4MTgwCj4+Pj4+PiAgwqDCoMKg
wqDCoCBbPGZmZmZmZmQzOWZmMDRjYTA+XSBmMmZzX291dHBsYWNlX3dyaXRlX2RhdGErMHg3OAo+
Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZWU4OGQ0Pl0gZjJmc19kb193cml0ZV9kYXRh
X3BhZ2UrMHgzOTAKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlOGRmMD5dIGYyZnNf
d3JpdGVfc2luZ2xlX2RhdGFfcGFnZSsweDFlMAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZk
MzlmZWVhMjg4Pl0gZjJmc193cml0ZV9kYXRhX3BhZ2VzKzB4OGMwCj4+Pj4+PiAgwqDCoMKgwqDC
oCBbPGZmZmZmZmQzOWZiYjM5NTg+XSBkb193cml0ZXBhZ2VzKzB4ZDQKPj4+Pj4+ICDCoMKgwqDC
oMKgIFs8ZmZmZmZmZDM5ZmJhMTUzYz5dIF9fZmlsZW1hcF9mZGF0YXdyaXRlX3JhbmdlKzB4OTQK
Pj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmJiMDM3MD5dIGdlbmVyaWNfZmFkdmlzZSsw
eDFkOAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZWFiYWEwPl0gZjJmc19maWxlX2Zh
ZHZpc2UrMHgxMjQKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmJiMDU3MD5dIF9fYXJt
NjRfc3lzX2ZhZHZpc2U2NF82NCsweDcwCj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4
NDdlN2M+XSBpbnZva2Vfc3lzY2FsbCsweDU4Cj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZmZmZmZmQz
OWY4NDdkYTQ+XSBlbDBfc3ZjX2NvbW1vbltqdF0rMHhiOAo+Pj4+Pj4gIMKgwqDCoMKgwqAgWzxm
ZmZmZmZkMzlmODQ3ZDE4Pl0gZG9fZWwwX3N2YysweDFjCj4+Pj4+PiAgwqDCoMKgwqDCoCBbPGZm
ZmZmZmQzYTBiMTRmYWM+XSBlbDBfc3ZjKzB4NDAKPj4+Pj4+ICDCoMKgwqDCoMKgIFs8ZmZmZmZm
ZDNhMGIxNGVmOD5dIGVsMHRfNjRfc3luY19oYW5kbGVyW2p0XSsweGQwCj4+Pj4+PiAgwqDCoMKg
wqDCoCBbPGZmZmZmZmQzOWY4MTE2YTA+XSByZXRfdG9fdXNlcltqdF0rMHgwCj4+Pj4+Pgo+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogWGlhb3NlbiBIZSA8eGlhb3Nlbi5oZUBvc3MucXVhbGNvbW0uY29t
Pgo+Pj4+Pj4gLS0tCj4+Pj4+PiAgwqDCoCBmcy9mMmZzL2RhdGEuYyB8IDYgKysrKysrCj4+Pj4+
PiAgwqDCoCAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4+Pj4+Pgo+Pj4+Pj4gZGlm
ZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+IGluZGV4IDMz
OGRmN2EyYWVhNi4uYzhlODFmNjNmZTczIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRh
LmMKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+PiBAQCAtMzU4NSw3ICszNTg1LDEz
IEBAIHN0YXRpYyBpbnQgX19mMmZzX3dyaXRlX2RhdGFfcGFnZXMoc3RydWN0Cj4+Pj4+PiBhZGRy
ZXNzX3NwYWNlICptYXBwaW5nLAo+Pj4+Pj4gIMKgwqDCoMKgwqDCoCB9Cj4+Pj4+PiAgwqDCoCDC
oMKgwqDCoMKgIGlmIChfX3Nob3VsZF9zZXJpYWxpemVfaW8oaW5vZGUsIHdiYykpIHsKPj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoCBpZiAoIW11dGV4X3RyeWxvY2soJnNiaS0+d3JpdGVwYWdlcykpCj4+
Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibGtfZmx1c2hfcGx1ZygoKHN0cnVjdCB0YXNr
X3N0cnVjdCAqKWN1cnJlbnQpLT5wbHVnLAo+Pj4+Pj4gdHJ1ZSk7Cj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgZWxzZQo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRfbG9ja2Vk
Owo+Pj4+Pj4gKwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgIG11dGV4X2xvY2soJnNiaS0+
d3JpdGVwYWdlcyk7Cj4+Pj4+PiArc2V0X2xvY2tlZDoKPj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBsb2NrZWQgPSB0cnVlOwo+Pj4+Pj4gIMKgwqDCoMKgwqDCoCB9Cj4+Pj4+Cj4+Pj4KPj4+
Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+
Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4+PiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4KCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
