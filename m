Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJpaOdCW4WnIvAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 04:11:28 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DC0416249
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 04:11:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7pWjKoEecwt6DGzBLsEYNbLSQj7k1dDi7wbwTac69+Y=; b=gq2duWVQ/FlzGigtT4BQj5NxQL
	O/0Oj5sw+B3U4FeM2PsWEK0p0H44dmlPC/fBopWfxVhM4eEyTf/SkT6sk+wSsG8NsDjxzad/ymIDG
	ryF06/vyz0Gl+XzDD4IORRbOdDT+cA41HvxOzdWrA/mlJhVTDBI/9XPRNS/M7eYGgDIw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDYfp-0004h6-Hn;
	Fri, 17 Apr 2026 02:11:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wDYfo-0004gy-IK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 02:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kvqvs5NXpQMnvRBIrhEPaX5dytNUNdBxI3oQE9F2s18=; b=nU20Q3xI8NkkAkuv9USAVmbFNQ
 R05+FWrcLPgTti2JTuyi0UaFmtvmtV/KzB0nnDsOasQ4UJuUJxfQYdEZH/R5NIdG+Sr6s0avBEcOz
 db5HIr1bqeC8Us6OfbDffxomv4/bwLi6fUUOe27qCN1BYGquNnAZ7U1bwrTfWT0A+75w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Kvqvs5NXpQMnvRBIrhEPaX5dytNUNdBxI3oQE9F2s18=; b=HP5M8m6uOd1yDrxxzQP5nRZZ3+
 gX3q83cePWesvVG32JX1hHTzadZh+qKBQlvmz9fMcaCsFe9I0ZEyVj1vYLKPIakoC38cj/L0Opr0u
 zv6hly1NPxfRKpDNQFSI19uW2kxDyJ3ePpBDl8yyOCEipkvhomohfhxdprslRYWlm5zE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDYfn-000435-N0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 02:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F0BED60128;
 Fri, 17 Apr 2026 02:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 176B1C2BCB3;
 Fri, 17 Apr 2026 02:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776391865;
 bh=6xqj18wJwt8IMEXssRsJfOry1F10o2AtBLYSKNGw+A4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=psc5PFTNXJuXZYAiCBcJduPpSGGDnaRHuX3cAQiYMm07o1u+yo/WBLdQEZ8ezF+cJ
 irupGHz+9ttBDpFh/sYqZb9lz5hf2cYq0YeYQFgpxGQEJDTyiUgJZ5jLzJpj8t0P9b
 XiVzWPIc7IVPk/ULjlDZnRBEq4vU/WWUyaEN8puwewtL+hxDMbz7RXJ24KgEQDcEW7
 9baH80NCtk1DgtntJjlpyL2LqNFjvA+tWXctyZ6Ge95DsdHCrTcM1HyrfHgMNGJ945
 H9Gy5JOynSz5HPubeMETgJaqMN6Kvc4TZcsiBDbr7CD+XdyyORDXMy1hvsiyukGmjN
 f3xkfYO3RYk0g==
Message-ID: <143ae906-d6a5-40d4-8573-68fe798cdcfa@kernel.org>
Date: Fri, 17 Apr 2026 10:11:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Xiaosen <xiaosen.he@oss.qualcomm.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260410105311.3260515-1-xiaosen.he@oss.qualcomm.com>
 <20260410105311.3260515-2-xiaosen.he@oss.qualcomm.com>
 <c640e206-66bb-42a0-aa30-425520670e1e@kernel.org>
 <90f3c071-9567-476f-aa27-866cd5310776@oss.qualcomm.com>
 <765aa6b4-a77e-473e-98a2-bcb41eddeb51@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <765aa6b4-a77e-473e-98a2-bcb41eddeb51@oss.qualcomm.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/2026 2:56 PM, Xiaosen wrote: > > On 4/13/2026 10:42
 PM, Xiaosen via Linux-f2fs-devel wrote: >> >> On 4/13/2026 7:54 PM, Chao
 Yu wrote: >>> On 4/10/2026 6:53 PM, Xiaosen He wrote: >>>> kworker/ [...] 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wDYfn-000435-N0
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
X-Rspamd-Queue-Id: F1DC0416249
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8xNC8yMDI2IDI6NTYgUE0sIFhpYW9zZW4gd3JvdGU6Cj4gCj4gT24gNC8xMy8yMDI2IDEw
OjQyIFBNLCBYaWFvc2VuIHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+Pgo+PiBPbiA0LzEz
LzIwMjYgNzo1NCBQTSwgQ2hhbyBZdSB3cm90ZToKPj4+IE9uIDQvMTAvMjAyNiA2OjUzIFBNLCBY
aWFvc2VuIEhlIHdyb3RlOgo+Pj4+IGt3b3JrZXIvdTMyOjcoZjJmcyB3cml0ZWJhY2sgdGhyZWFk
KSB3YXMgdHJ5aW5nIHRvIGFjcXVpcmUKPj4+PiBzYmktPndyaXRlcGFnZXMsIHRoZSBtdXRleCB3
YXMgYWxyZWFkeSBhY3F1aXJlZCBieSBlbXVsYXRlZDswLgo+Pj4+IGt3b3JrZXIvdTMyOjcgdHJp
ZWQgdG8gZmx1c2ggcGx1Z2dlZCBJTyBiZWZvcmUgc2xlZXAsIGR1cmluZwo+Pj4+IGZsdXNoaW5n
IHBsdWcgbGlzdCwga3dvcmtlci91MzI6NyBnb3QgcHJlZW1wdGVkIGluIFJDVSByZWFkLXNpZGUK
Pj4+PiBjcml0aWNhbCBzZWN0aW9uIGFuZCBnb3Qgc2NoZWR1bGVkIG91dCB3YWl0aW5nIHRvIGJl
IHdva2VuIHVwIGJ5Cj4+Pj4gdGhlIHJlbGVhc2Ugb2YgbXV0ZXguIGVtdWxhdGVkOzAgd2FzIGJs
b2NrZWQgb24gYmxrX21xX2dldF90YWcKPj4+PiBhcyB0aGVyZSB3YXMgbm8gYXZhaWxhYmxlIHRh
ZyBhbmQgZXhwZWN0ZWQgdGhlIHByZXZpb3VzIElPCj4+Pj4gcmVxdWVzdHMgdG8gYmUgaGFuZGxl
ZCBieSBVRlMgaG9zdCB0byByZWxlYXNlIHRhZ3MsIGJ1dCBVRlMgaG9zdAo+Pj4+IHdhcyBibG9j
a2VkIG9uIHN5bmNocm9uaXplX3JjdSB3YWl0aW5nIGZvciBlbmRpbmcgb2YgUkNVIGdyYWNlCj4+
Pj4gcGVyaW9kLiB0aGUgZGVhZGxvY2sgd2FzIGNhdXNlZCBieSB3cml0ZWJhY2sgdGhyZWFkIHdh
cyBzdHVjayBpbgo+Pj4+IFJDVSBjcml0aWNhbCBzZWN0aW9uIHdhaXRpbmcgZm9yIG11dGV4LiBj
YWxsIGJsa19mbHVzaF9wbHVnKCkgaWYKPj4+PiBtdXRleF90cnlsb2NrKCZzYmktPndyaXRlcGFn
ZXMpIGZhaWxlZCwgc28gdGhhdCB0aGUgcGx1ZyBsaXN0IGlzCj4+Pj4gZW1wdHkgd2hlbiBibGtf
Zmx1c2hfcGx1ZygpIGlzIGNhbGxlZCBpbiBzY2hlZF9zdWJtaXRfd29yayB0bwo+Pj4+IGZpeCB0
aGUgZGVhZGxvY2suCj4+Pgo+Pj4gSU1PLCBsb29rIG1vcmUgbGlrZSBhIGNvbW1vbiBidWc/IG90
aGVyd2lzZSwgc291bmRzIGxpa2Ugd2UgY2FuIG5vdAo+Pj4gZ3JhYiBtdXRleCBsb2NrIHcvIG11
dGV4X2xvY2sgZGlyZWN0bHkgZHVyaW5nIHdyaXRlYmFjayBpbiAud3JpdGVwYWdlcz8KPj4+Cj4g
SW4gd3JpdGViYWNrIHRocmVhZCwgdGhlIGNhbGwgcGF0aCB3b3VsZCBiZSBhcyBmb2xsb3dzLgo+
IGJsa19zdGFydF9wbHVnCj4gbXV0ZXhfbG9jawo+IHdyaXRlYmFjayBmaWxlIEEKPiBtdXRleF91
bmxvY2sKPiBtdXRleHRfbG9jawo+IHdyaXRlYmFjayBmaWxlIEIKPiBtdXRleF91bmxvY2sKPiAu
Li4uLi4KPiBibGtfZmluaXNoX3BsdWcKPiAKPiBTbywgbW9zdCBwcm9iYWJseSB3aGVuIHRoZSB0
aHJlYWQgZmFpbGVkIHRvIGFjcXVpcmUgdGhlIG11dGV4IGZvciB3cml0aW5nIGJhY2sgYQo+IGZp
bGUncyBkYXRhLCB0aGUgYmxvY2sgcGx1ZyBsaXN0IGlzIG5vdCBlbXB0eSBhcyB0aGUgcHJldmlv
dXNseSBoYW5kbGVkIGZpbGVzJwo+IGRhdGHCoCBoYXZlIGJlZW4gcHJlcGFyZWQgYXMgd3JpdGUg
cmVxdWVzdHMgYW5kIHBsdWdnZWQgb24gdGhlIGxpc3QuCj4+Pj4KPj4+PiAgwqDCoMKgwqAgVGFz
ayBuYW1lOiBrd29ya2VyL3UzMjo3wqDCoMKgIFthZmZpbml0eTogMHhmZl0gcGlkOsKgwqDCoCAy
MzMgdGdpZDrCoMKgwqAgMjMzIGNwdTogNiBwcmlvOiA5OCBzdGFydDogMHhmZmZmZmY4MDk5Mzkw
MDQwCj4+Pj4gIMKgwqDCoMKgIHN0YXRlOiAweDJbRF0gZXhpdF9zdGF0ZTogMHgwIHN0YWNrIGJh
c2U6IDB4ZmZmZmZmYzA4M2M0ODAwMAo+Pj4+ICDCoMKgwqDCoCBMYXN0X2VucXVldWVkX3RzOsKg
wqDCoMKgIDM5MC4xNjkzOTU4NzcgTGFzdF9zbGVlcF90czogMzg5Ljc1NjYzOTU3NAo+Pj4+ICDC
oMKgwqDCoCBTdGFjazoKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFkMjU0Pl0gX19zd2l0
Y2hfdG8rMHgyMTQKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFkZWI4Pl0gX19zY2hlZHVs
ZSsweGEzMAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWU3NTQ+XSBwcmVlbXB0X3NjaGVk
dWxlX25vdHJhY2UrMHg2OAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5ZGRmMzg+XSByY3Vf
aXNfd2F0Y2hpbmdbanRdKzB4NWMKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTk5NWI4Pl0g
bG9ja19hY3F1aXJlKzB4NjgKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZmU4NzBjPl0gcmN1
X2xvY2tfYWNxdWlyZSsweDM0Cj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZlODc2ND5dIHBl
cmNwdV9yZWZfcHV0X21hbnkrMHgyMAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTNhNjQ+
XSBibGtfbXFfZGlzcGF0Y2hfbGlzdCsweDU3MAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZm
ZTMyNjQ+XSBibGtfbXFfZmx1c2hfcGx1Z19saXN0KzB4MTNjCj4+Pj4gIMKgwqDCoMKgIFs8ZmZm
ZmZmZDM5ZmZkNDNhOD5dIF9fYmxrX2ZsdXNoX3BsdWcrMHgxMWMKPj4+Cj4+PiBJdCB0cmllcyB0
byBmbHVzaCBwbHVnIGxpc3QgaW5zaWRlIG11dGV4X2xvY2soKSBhbmQgdGhlbiBiZSBibG9ja2Vk
LiBXaWxsIGl0IGNhdXNlCj4+PiB0aGUgc2FtZSBpc3N1ZSB3LyB5b3VyIGJlbG93IGltcGxlbWVu
dGF0aW9uOgo+Pj4KPj4+IGlmICghbXV0ZXhfdHJ5bG9jaygmc2JpLT53cml0ZXBhZ2VzKSkKPj4+
ICDCoMKgwqDCoGJsa19mbHVzaF9wbHVnKCgoc3RydWN0IHRhc2tfc3RydWN0ICopY3VycmVudCkt
PnBsdWcsIHRydWUpOyA8LS0tIGhlcmUKPj4KPj4gSWYgYmxrX2ZsdXNoX3BsdWcgaXMgY2FsbGVk
IGhlcmUsIHdoZW4gcHJlZW1wdGlvbiBoYXBwZW5lZCBpbiBSQ1UgY3JpdGljYWwKPj4KPj4gc2Vj
aXRvbiwgdGhlIHRhc2sgd291bGQgYmUgc2NoZWR1bGVkIG91dCBpbiBSIHN0YXRlLCBzbyB0aGF0
IHRoZSB0YXNrIGNhbiBiZQo+Pgo+PiBzY2hlZHVsZWQgaW4gcXVpY2tseSB0byBlbmQgUkNVIGdy
YWNlIHBlcmlvZCwgdGhlbiBpdCB3b24ndCBibG9jayBVRlMgaG9zdC4KPj4KPj4gUmVnYXJkcywK
Pj4KPj4gWGlhb3Nlbgo+Pgo+Pj4gLi4uCj4+PiBtdXRleF9sb2NrKCZzYmktPndyaXRlcGFnZXMp
Owo+Pj4KPj4+IExldCBtZSBrbm93IGlmIEknbSBtaXNzaW5nIGFueXRoaW5nLgo+Pj4KPj4+IFRo
YW5rcywKPiBrd29ya2VyL3UzMjoyICh3cml0ZWJhY2sgdGhyZWFkKQo+IF9fbXV0ZXhfbG9ja19j
b21tb24KPiAgIMKgIHNldF9jdXJyZW50X3N0YXRlKFRBU0tfVU5JTlRFUlJVUFRJQkxFKTsKPiAg
IMKgIHNjaGVkdWxlX3ByZWVtcHRfZGlzYWJsZWQKPiAgIMKgIMKgIHNjaGVkdWxlCj4gICDCoCDC
oCDCoCBzY2hlZF9zdWJtaXRfd29yawo+ICAgwqAgwqAgwqAgwqAgYmxrX2ZsdXNoX3BsdWcKPiAg
IMKgIMKgIMKgIMKgIMKgIF9fYmxrX2ZsdXNoX3BsdWcKPiAgIMKgIMKgIMKgIMKgIMKgIMKgIGJs
a19tcV9mbHVzaF9wbHVnX2xpc3QKPiAgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGJsa19tcV9kaXNw
YXRjaF9saXN0Cj4gICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBwZXJjcHVfcmVmX3B1dAo+ICAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcGVyY3B1X3JlZl9wdXRfbWFueQo+ICAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgcmN1X3JlYWRfbG9jawo+ICAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgcHJlZW1wdF9zY2hlZHVsZV9ub3RyYWNlCj4gCj4gSW4gX19tdXRl
eF9sb2NrX3Nsb3dwYXRoLCB0aGUgdGFzaydzIHN0YXRlIGlzIHNldCB0byBUQVNLX1VOSU5URVJS
VVBUSUJMRSwgdGhlbgoKT2gsIEkgc2VlLCBpdCdzIFRBU0tfVU5JTlRFUlJVUFRJQkxFIHN0YXRl
IGFuZCBiZSBwcmVlbXB0ZWQsIHNob3VsZG4ndCB3ZSBzZXQKVEFTS19JTlRFUlJVUFRJQkxFIHN0
YXRlIGJlZm9yZSBpdCBydW5zIGludG8gcmN1IGNyaXRpY2FsIHJlZ2lvbj8gTm90IHN1cmUsIGJ1
dApJIHN1c3BlY3QgaXQncyBhIGJ1ZyBmcm9tIGNvbW1vbiBtdXRleGxvY2svYmxvY2svdWZzIG1v
ZHVsZXMgcmF0aGVyIHRoYW4gZjJmcycuCgpTaW5jZSBpdCdzIGhhcmQgdG8gY2hhbmdlIGNvbW1v
biBtb2R1bGUsIG9yIGNhbiB3ZSBjb25zaWRlciB0byB1c2UgcndzZW0gbG9jawppbnN0ZWFkIG9m
IG11dGV4IGxvY2sgaW4gLndyaXRlcGFnZXM/IEkgc3VzcGVjdCB3ZSBtYXkgc3VmZmVyIHBlcmZv
cm1hbmNlCnJlZ3Jlc3Npb24gaWYgd2UgZmx1c2ggcGx1ZyBsaXN0IGluIGFkdmFuY2UgYmVmb3Jl
IG11dGV4X2xvY2suCgpDYW4geW91IHBsZWFzZSBnaXZlIHNvbWUgcGVyZm9ybWFuY2UgbnVtYmVy
cyBmb3IgYm90aCBtdXRleCBhbmQgcndzZW0gdmVyc2lvbj8KClRoYW5rcywKCj4gY2FsbCBibGtf
Zmx1c2hfcGx1ZyBsYXRlciwgc28gb25jZSBwcmVlbXB0aW9uIGhhcHBlbmVkIGluIFJDVSBjcml0
aWNhbCBzZWN0aW9uLAo+IHRoZSB0YXNrIHdvdWxkIGJlIHN0dWNrIGluIFJDVSBjcml0aWNhbCBz
ZWN0aW9uIHdhaXRpbmcgZm9yIHRoZSByZWxlYXNlIG9mIG11dGV4Lgo+IFJlZ2FyZGluZyBteSBm
aXgsIGluIG11dGV4X3RyeWxvY2ssIGl0IHdvbid0IGNhbGwgYmxrX2ZsdXNoX3BsdWcgaWYgbXV0
ZXhfdHJ5bG9jawo+IGZhaWxlZC4gTGV0J3MgZmx1c2ggcGx1ZyBsaXN0IGlmIG11dGV4X3RyeWxv
Y2sgZmFpbGVkLCBzbyB0aGF0IHdoZW4gaXQgZ29lcyB0bwo+IG11dGV4X2xvY2sgYW5kIGZhaWxl
ZCB0byBhY3F1aXJlIHRoZSBtdXRleCwgdGhlIGxhdGVyIGNhbGwgdG8gYmxrX2ZsdXNoX3BsdWcK
PiB3b3VsZCBiZSBzaW1wbGUgYXMgdGhlIHBsdWcgbGlzdCBpcyBlbXB0eSBhbmQgdGhlcmUgaXMg
bm8gY2hhbmNlIHRvIGdvIHRvCj4gcmN1X3JlYWRfbG9jay4KPiAKPiBSZWdhcmRzLAo+IFhpYW9z
ZW4KPj4+Cj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkzZTZjND5dIHNjaGVkX3N1Ym1pdF93
b3JrKzB4NzgKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlNGQ4Pl0gc2NoZWR1bGUrMHgz
OAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWU1YzQ+XSBzY2hlZHVsZV9wcmVlbXB0X2Rp
c2FibGVkKzB4MTgKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjIwYzdjPl0gX19tdXRleF9s
b2NrX2NvbW1vbisweGFiOAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMjAwODQ+XSBtdXRl
eF9sb2NrX25lc3RlZCsweDJjCj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmVlYTcyYz5dIGYy
ZnNfd3JpdGVfZGF0YV9wYWdlcysweGQ2NAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZiYjM5
NTg+XSBkb193cml0ZXBhZ2VzKzB4ZDQKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZDA5ZmQ4
Pl0gX193cml0ZWJhY2tfc2luZ2xlX2lub2RlKzB4NzgKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZk
MzlmZDA5OTU4Pl0gd3JpdGViYWNrX3NiX2lub2RlcysweDJiOAo+Pj4+ICDCoMKgwqDCoCBbPGZm
ZmZmZmQzOWZkMDljYzA+XSBfX3dyaXRlYmFja19pbm9kZXNfd2IrMHhhMAo+Pj4+ICDCoMKgwqDC
oCBbPGZmZmZmZmQzOWZkMDkwNTQ+XSB3Yl93cml0ZWJhY2srMHgxODgKPj4+PiAgwqDCoMKgwqAg
WzxmZmZmZmZkMzlmZDA2NmQwPl0gd2Jfd29ya2ZuW2p0XSsweDQzOAo+Pj4+ICDCoMKgwqDCoCBb
PGZmZmZmZmQzOWY5MTk4ZTA+XSBwcm9jZXNzX29uZV93b3JrKzB4MjdjCj4+Pj4gIMKgwqDCoMKg
IFs8ZmZmZmZmZDM5ZjkxYmFmOD5dIHdvcmtlcl90aHJlYWQrMHgzNTgKPj4+PiAgwqDCoMKgwqAg
WzxmZmZmZmZkMzlmOTI0NTM0Pl0ga3RocmVhZCsweDE1MAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZm
ZmQzOWY4MzBlNDQ+XSByZXRfZnJvbV9mb3JrKzB4MTAKPj4+Pgo+Pj4+ICDCoMKgwqDCoCBUYXNr
IG5hbWU6IGt3b3JrZXIvdTMyOjLCoMKgwqAgW2FmZmluaXR5OiAweGZmXSBwaWQ6wqDCoMKgwqAg
OTAgdGdpZDrCoMKgwqDCoCA5MCBjcHU6IDEgcHJpbzogMTIwIHN0YXJ0OiAweGZmZmZmZjgwYWRh
ZTgwNDAKPj4+PiAgwqDCoMKgwqAgc3RhdGU6IDB4MltEXSBleGl0X3N0YXRlOiAweDAgc3RhY2sg
YmFzZTogMHhmZmZmZmZjMDgwYTE4MDAwCj4+Pj4gIMKgwqDCoMKgIExhc3RfZW5xdWV1ZWRfdHM6
wqDCoMKgwqAgMzg5Ljg5OTYwODYzNyBMYXN0X3NsZWVwX3RzOiAzODkuODk5NjY1MzAzCj4+Pj4g
IMKgwqDCoMKgIFN0YWNrOgo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWQyNTQ+XSBfX3N3
aXRjaF90bysweDIxNAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWRlYjg+XSBfX3NjaGVk
dWxlKzB4YTMwCj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZTRlOD5dIHNjaGVkdWxlKzB4
NDgKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOWRmYTY0Pl0gc3luY2hyb25pemVfcmN1X2V4
cGVkaXRlZCsweDkyOAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5ZGVlYjA+XSBzeW5jaHJv
bml6ZV9yY3VbanRdKzB4MjM0Cj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZkZTVkND5dIGJs
a19tcV9xdWllc2NlX3RhZ3NldFtqdF0rMHhhOAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTA2
MWNkOTA+XSB1ZnNoY2RfZGV2ZnJlcV9zY2FsZSsweDkwCj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZm
ZDNhMDYxY2E2Yz5dIHVmc2hjZF9kZXZmcmVxX3RhcmdldCsweDIwNAo+Pj4+ICDCoMKgwqDCoCBb
PGZmZmZmZmQzYTA2ZGUyNDQ+XSBkZXZmcmVxX3NldF90YXJnZXQrMHhiOAo+Pj4+ICDCoMKgwqDC
oCBbPGZmZmZmZmQzYTA2ZGUxNGM+XSBkZXZmcmVxX3VwZGF0ZV90YXJnZXRbanRdKzB4ZDgKPj4+
PiAgwqDCoMKgwqAgWzxmZmZmZmZkM2EwNmRlNWU4Pl0gZGV2ZnJlcV9tb25pdG9yKzB4MzgKPj4+
PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlmOTE5OGUwPl0gcHJvY2Vzc19vbmVfd29yaysweDI3Ywo+
Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWY5MWJhZjg+XSB3b3JrZXJfdGhyZWFkKzB4MzU4Cj4+
Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZjkyNDUzND5dIGt0aHJlYWQrMHgxNTAKPj4+PiAgwqDC
oMKgwqAgWzxmZmZmZmZkMzlmODMwZTQ0Pl0gcmV0X2Zyb21fZm9yaysweDEwCj4+Pj4KPj4+PiAg
wqDCoMKgwqAgVGFzayBuYW1lOiBlbXVsYXRlZDswwqDCoMKgwqDCoMKgIFthZmZpbml0eTogMHhm
Zl0gcGlkOsKgwqAgNTI0NSB0Z2lkOsKgwqAgNDkyMiBjcHU6IDYgcHJpbzogMTIwIHN0YXJ0OiAw
eGZmZmZmZjg5ZTJlNjAwNDAKPj4+PiAgwqDCoMKgwqAgc3RhdGU6IDB4MltEXSBleGl0X3N0YXRl
OiAweDAgc3RhY2sgYmFzZTogMHhmZmZmZmZjMGQ0MmY4MDAwCj4+Pj4gIMKgwqDCoMKgIExhc3Rf
ZW5xdWV1ZWRfdHM6wqDCoMKgwqAgMzkwLjE2OTM5NTg3NyBMYXN0X3NsZWVwX3RzOiAzOTAuMTc4
NDU5NzMxCj4+Pj4gIMKgwqDCoMKgIFN0YWNrOgo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBi
MWQyNTQ+XSBfX3N3aXRjaF90bysweDIxNAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMWRl
Yjg+XSBfX3NjaGVkdWxlKzB4YTMwCj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDNhMGIxZTRlOD5d
IHNjaGVkdWxlKzB4NDgKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkM2EwYjFlOGY0Pl0gaW9fc2No
ZWR1bGUrMHgzOAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZWIxMTA+XSBibGtfbXFfZ2V0
X3RhZysweDFhNAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZGVkYzg+XSBfX2Jsa19tcV9h
bGxvY19yZXF1ZXN0cysweDM1OAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZTQwOWM+XSBi
bGtfbXFfc3VibWl0X2JpbysweDUwYwo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmZDRjYjg+
XSBfX3N1Ym1pdF9iaW9banRdKzB4MTY0Cj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5ZmZkMmU3
Yz5dIHN1Ym1pdF9iaW9fbm9hY2N0X25vY2hlY2srMHgxNGMKPj4+PiAgwqDCoMKgwqAgWzxmZmZm
ZmZkMzlmZmQzMzk0Pl0gc3VibWl0X2Jpb19ub2FjY3QrMHgzMzAKPj4+PiAgwqDCoMKgwqAgWzxm
ZmZmZmZkMzlmZmQzODE0Pl0gc3VibWl0X2JpbysweDFmNAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZm
ZmQzOWZlZTJiYTg+XSBmMmZzX3N1Ym1pdF93cml0ZV9iaW8rMHg4OAo+Pj4+ICDCoMKgwqDCoCBb
PGZmZmZmZmQzOWZlZTQxM2M+XSBfX3N1Ym1pdF9tZXJnZWRfYmlvW2p0XSsweGJjCj4+Pj4gIMKg
wqDCoMKgIFs8ZmZmZmZmZDM5ZmVlM2M0Yz5dIGYyZnNfc3VibWl0X3BhZ2Vfd3JpdGUrMHg0MDAK
Pj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlmZjA0YWFjPl0gZG9fd3JpdGVfcGFnZSsweDE4MAo+
Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZmMDRjYTA+XSBmMmZzX291dHBsYWNlX3dyaXRlX2Rh
dGErMHg3OAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZTg4ZDQ+XSBmMmZzX2RvX3dyaXRl
X2RhdGFfcGFnZSsweDM5MAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWZlZThkZjA+XSBmMmZz
X3dyaXRlX3NpbmdsZV9kYXRhX3BhZ2UrMHgxZTAKPj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlm
ZWVhMjg4Pl0gZjJmc193cml0ZV9kYXRhX3BhZ2VzKzB4OGMwCj4+Pj4gIMKgwqDCoMKgIFs8ZmZm
ZmZmZDM5ZmJiMzk1OD5dIGRvX3dyaXRlcGFnZXMrMHhkNAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZm
ZmQzOWZiYTE1M2M+XSBfX2ZpbGVtYXBfZmRhdGF3cml0ZV9yYW5nZSsweDk0Cj4+Pj4gIMKgwqDC
oMKgIFs8ZmZmZmZmZDM5ZmJiMDM3MD5dIGdlbmVyaWNfZmFkdmlzZSsweDFkOAo+Pj4+ICDCoMKg
wqDCoCBbPGZmZmZmZmQzOWZlYWJhYTA+XSBmMmZzX2ZpbGVfZmFkdmlzZSsweDEyNAo+Pj4+ICDC
oMKgwqDCoCBbPGZmZmZmZmQzOWZiYjA1NzA+XSBfX2FybTY0X3N5c19mYWR2aXNlNjRfNjQrMHg3
MAo+Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzOWY4NDdlN2M+XSBpbnZva2Vfc3lzY2FsbCsweDU4
Cj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5Zjg0N2RhND5dIGVsMF9zdmNfY29tbW9uW2p0XSsw
eGI4Cj4+Pj4gIMKgwqDCoMKgIFs8ZmZmZmZmZDM5Zjg0N2QxOD5dIGRvX2VsMF9zdmMrMHgxYwo+
Pj4+ICDCoMKgwqDCoCBbPGZmZmZmZmQzYTBiMTRmYWM+XSBlbDBfc3ZjKzB4NDAKPj4+PiAgwqDC
oMKgwqAgWzxmZmZmZmZkM2EwYjE0ZWY4Pl0gZWwwdF82NF9zeW5jX2hhbmRsZXJbanRdKzB4ZDAK
Pj4+PiAgwqDCoMKgwqAgWzxmZmZmZmZkMzlmODExNmEwPl0gcmV0X3RvX3VzZXJbanRdKzB4MAo+
Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogWGlhb3NlbiBIZSA8eGlhb3Nlbi5oZUBvc3MucXVhbGNv
bW0uY29tPgo+Pj4+IC0tLQo+Pj4+ICDCoCBmcy9mMmZzL2RhdGEuYyB8IDYgKysrKysrCj4+Pj4g
IMKgIDEgZmlsZSBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykKPj4+Pgo+Pj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4gaW5kZXggMzM4ZGY3YTJhZWE2
Li5jOGU4MWY2M2ZlNzMgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+PiArKysg
Yi9mcy9mMmZzL2RhdGEuYwo+Pj4+IEBAIC0zNTg1LDcgKzM1ODUsMTMgQEAgc3RhdGljIGludCBf
X2YyZnNfd3JpdGVfZGF0YV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPj4+
PiAgwqDCoMKgwqDCoCB9Cj4+Pj4gIMKgIMKgwqDCoMKgwqAgaWYgKF9fc2hvdWxkX3NlcmlhbGl6
ZV9pbyhpbm9kZSwgd2JjKSkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIW11dGV4X3RyeWxv
Y2soJnNiaS0+d3JpdGVwYWdlcykpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYmxrX2Zs
dXNoX3BsdWcoKChzdHJ1Y3QgdGFza19zdHJ1Y3QgKiljdXJyZW50KS0+cGx1ZywgdHJ1ZSk7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGVsc2UKPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3Rv
IHNldF9sb2NrZWQ7Cj4+Pj4gKwo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgbXV0ZXhfbG9jaygm
c2JpLT53cml0ZXBhZ2VzKTsKPj4+PiArc2V0X2xvY2tlZDoKPj4+PiAgwqDCoMKgwqDCoMKgwqDC
oMKgIGxvY2tlZCA9IHRydWU7Cj4+Pj4gIMKgwqDCoMKgwqAgfQo+Pj4KPj4KPj4KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
