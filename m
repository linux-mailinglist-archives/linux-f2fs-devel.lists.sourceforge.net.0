Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CKdIJPk4WmKzgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 09:43:15 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 035F141815D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Apr 2026 09:43:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x1aZDc5n1zfzCHNM8Y9OgXZP2f+YYRUP+CvwoklKRxs=; b=TDY+UxJaT3KnmNf2HnbRyGT0T3
	eS4Eh57KCEM5redstod9BpNLidp2FriZAyPAgtZB/rgeBy72N5afBBWiUtLtLaVrUIWLFuLXqiU8O
	hd6rF4GFeCbDofVqa4sa1zgB+TFhwJs/aoFQVSYpd75YJgSm0LatICBA8+9H0rty92no=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wDdr7-0006IC-NY;
	Fri, 17 Apr 2026 07:43:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wDdr6-0006I1-Li
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 07:43:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Fi0BG/xesfzqc/m3DO9cURkGKAKvqP5VTKoOLgW99cQ=; b=gxSqG9zD6AzsCxbFrFkv64FdlV
 8w+Gjp3HOOA12IW5CU65ZlaM19OF5RhDCSFy8SrQEhc6zhV4BGJ4AykMszHI/2RHj1XmEXlmRKhzL
 prXo7do3YK2H2+QFP+yzGPysCvNqHuQyPvEiEbSE+k/LEMzkVKNSp8LJ/36b2UYX+zU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Fi0BG/xesfzqc/m3DO9cURkGKAKvqP5VTKoOLgW99cQ=; b=k6To8dfx9uZMOrncaPzVEWKw0R
 inkKu1+1ejPCMvUQN4T+eIJH8R3IFSI4Pk72jpW93n9GNYrsqzYaFyQ9VmVwJ0ZAzTi5zGjAMUWRY
 LfLPW5ayXTgb7I3iuCER43/h8YIoH0Ecvgix4d/03svbxwcM1Tc/mTxC1yHoDkloLq+Y=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wDdr5-000154-RD for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Apr 2026 07:43:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 46C2244528;
 Fri, 17 Apr 2026 07:43:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1C39C19425;
 Fri, 17 Apr 2026 07:42:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776411781;
 bh=IRRr5gU2WMHULLGBS6/22wzyEtF1GXYZx6AW7HYwmX8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=pwTn7b4PTJWKtT41iLcA1HlyUGg/v7ZqlTFL286R8YENNQnAdi5RmiSSUK4brx/Mo
 XIjV7Mw6Os9O//1NeDrHMMqqzo3TTb8pVDY6rMwHHW0jX+2FHuAo+Vv3b8q7PKItyt
 hbm7mzwlOLdOiSIMdQeRiHSDjsvm581qVkw8b0NCXKf4HXEDWlKMskdDEwI6IhaFAe
 4E8nYLhl750/wrUi2yUe0+69JpZ6zUNkhLG59HCpEQCyF2+QnzOxRQTrcjGQrN4Lbb
 T3VTKiGGFc8ObLrD11zXlyPsswOP0uVh86TPLW/Sf2OzJt53WYed5nXHuMQbJFwh8E
 puMdGKqwjCZ4g==
Message-ID: <501bee59-0a8b-4b7c-b120-b0d1b61265bc@kernel.org>
Date: Fri, 17 Apr 2026 15:42:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: liujinbao1 <jinbaoliu365@gmail.com>, jaegeuk@kernel.org
References: <20260415114237.3089952-1-jinbaoliu365@gmail.com>
 <d004abbf-c794-4103-a34d-1a8f52c5b65a@kernel.org>
 <5a216f80-fe22-4134-abb7-28fbd0731b52@gmail.com>
Content-Language: en-US
In-Reply-To: <5a216f80-fe22-4134-abb7-28fbd0731b52@gmail.com>
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 4/17/2026 12:02 PM, liujinbao1 wrote: > > 在 2026/4/17
    09:26, Chao Yu 写道: >> On 4/15/2026 7:42 PM, liujinbao1 wrote: >>> From:
    liujinbao1 <liujinbao1@xiaomi.com> >>> >>> Add trace_f2fs_fault_r [...] 
 
 Content analysis details:   (-0.7 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wDdr5-000154-RD
Subject: Re: [f2fs-dev] [PATCH] [PATCH v2] f2fs: Add trace_f2fs_fault_report
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
Cc: shengyong1 <shengyong1@xiaomi.com>, liujinbao1 <liujinbao1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jinbaoliu365@gmail.com,m:jaegeuk@kernel.org,m:shengyong1@xiaomi.com,m:liujinbao1@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Queue-Id: 035F141815D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gNC8xNy8yMDI2IDEyOjAyIFBNLCBsaXVqaW5iYW8xIHdyb3RlOgo+IAo+IOWcqCAyMDI2LzQv
MTcgMDk6MjYsIENoYW8gWXUg5YaZ6YGTOgo+PiBPbiA0LzE1LzIwMjYgNzo0MiBQTSwgbGl1amlu
YmFvMSB3cm90ZToKPj4+IEZyb206IGxpdWppbmJhbzEgPGxpdWppbmJhbzFAeGlhb21pLmNvbT4K
Pj4+Cj4+PiBBZGQgdHJhY2VfZjJmc19mYXVsdF9yZXBvcnQgdG8gdHJpZ2dlciByZXBvcnRpbmcg
dXBvbiBmMmZzX2J1Z19vbiwKPj4+IG5lZWRfZnNjaywgc3RvcF9jaGVja3BvaW50LCBhbmQgaGFu
ZGxlX2Vpby4gU2luY2UgZjJmc19idWdfb24gYW5kCj4+PiBuZWVkX2ZzY2sgY2FuIGJlIHRyaWdn
ZXJlZCBpbiBodW5kcmVkcyBvZiBzY2VuYXJpb3MsIGRlZmluZSBzZXRfc2JpX2ZsYWcKPj4+IGFz
IGEgbWFjcm8gdG8gaGVscCBjYXB0dXJlIHRoZSBlZmZlY3RpdmUgZmF1bHQgZnVuY3Rpb24gYW5k
IGxpbmUgbnVtYmVyLgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IHNoZW5neW9uZzEgPHNoZW5neW9u
ZzFAeGlhb21pLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6IGxpdWppbmJhbzEgPGxpdWppbmJhbzFA
eGlhb21pLmNvbT4KPj4+IC0tLQo+Pj4gwqAgZnMvZjJmcy9mMmZzLmjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8IDE4ICsrKysrKysrKysrKysrKysrLQo+Pj4gwqAgZnMvZjJmcy9zdXBlci5j
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA5ICsrKysrKysrKwo+Pj4gwqAgaW5jbHVkZS90
cmFjZS9ldmVudHMvZjJmcy5oIHwgMjggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4g
wqAgMyBmaWxlcyBjaGFuZ2VkLCA1NCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+IGluZGV4
IDU2YzRhZjRiMTczNy4uMjI0OWE2OGQ2YmY1IDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9mMmZz
LmgKPj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+PiBAQCAtOTcsNiArOTcsMTUgQEAgZXh0ZXJu
IGNvbnN0IGNoYXIgKmYyZnNfZmF1bHRfbmFtZVtGQVVMVF9NQVhdOwo+Pj4gwqAgI2RlZmluZSBE
RUZBVUxUX0ZBSUxVUkVfUkVUUllfQ09VTlTCoMKgwqDCoMKgwqDCoCAxCj4+PiDCoCAjZW5kaWYK
Pj4+IMKgICtlbnVtIHsKPj4+ICvCoMKgwqAgUkVQT1JUX0ZBVUxUX05FRURfRlNDSywKPj4+ICvC
oMKgwqAgUkVQT1JUX0ZBVUxUX1NUT1BfQ1AsCj4+PiArwqDCoMKgIFJFUE9SVF9GQVVMVF9NQVgs
Cj4+PiArfTsKPj4+ICsKPj4+ICt2b2lkIGYyZnNfZmF1bHRfcmVwb3J0KHN0cnVjdCBzdXBlcl9i
bG9jayAqc2IsIHVuc2lnbmVkIGludCBlcnJfY29kZSwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGNvbnN0IGNoYXIgKmZ1bmMsIHVuc2lnbmVkIGludCBkYXRhKTsKPj4+ICsKPj4+IMKgIC8q
Cj4+PiDCoMKgICogRm9yIG1vdW50IG9wdGlvbnMKPj4+IMKgwqAgKi8KPj4+IEBAIC0yMjc4LDEx
ICsyMjg3LDE4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBpc19zYmlfZmxhZ19zZXQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCB1bnNpZ25lZCBpbnQgdHlwZSkKPj4+IMKgwqDCoMKgwqAgcmV0dXJu
IHRlc3RfYml0KHR5cGUsICZzYmktPnNfZmxhZyk7Cj4+PiDCoCB9Cj4+PiDCoCAtc3RhdGljIGlu
bGluZSB2b2lkIHNldF9zYmlfZmxhZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVk
IGludCB0eXBlKQo+Pj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3NldF9zYmlfZmxhZyhzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGludCB0eXBlKQo+Pj4gwqAgewo+Pj4gwqDCoMKg
wqDCoCBzZXRfYml0KHR5cGUsICZzYmktPnNfZmxhZyk7Cj4+PiDCoCB9Cj4+PiDCoCArI2RlZmlu
ZSBzZXRfc2JpX2ZsYWcoc2JpLCB0eXBlKcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBc
Cj4+PiArZG8ge8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBcCj4+PiArwqDCoMKgIF9fc2V0X3NiaV9mbGFnKHNiaSwgdHlwZSk7wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBcCj4+PiArwqDCoMKgIGlmICgodHlwZSkgPT0gU0JJX05FRURfRlNDSynC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIFwKPj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX2ZhdWx0X3Jl
cG9ydChzYmktPnNiLCBSRVBPUlRfRkFVTFRfTkVFRF9GU0NLLCBfX2Z1bmNfXywgX19MSU5FX18p
O8KgwqDCoCBcCj4+PiArfSB3aGlsZSAoMCkKPj4KPj4gSXQncyBtaW5vciwgYnV0LCB3aGF0IGFi
b3V0Pwo+Pgo+PiB2b2lkIGYyZnNfZmF1bHRfcmVwb3J0KHN0cnVjdCBzdXBlcl9ibG9jayAqc2Is
IHVuc2lnbmVkIGludCBlcnJfY29kZSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGNvbnN0IGNoYXIgKmZ1bmMsIHVuc2lnbmVkIGludCBkYXRhKTsKPj4gc3RhdGljIGlubGluZSB2
b2lkIHNldF9zYmlfZmxhZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGludCB0
eXBlKQo+PiB7Cj4+IMKgwqDCoMKgc2V0X2JpdCh0eXBlLCAmc2JpLT5zX2ZsYWcpOwo+PiDCoMKg
wqDCoGlmICgodHlwZSkgPT0gU0JJX05FRURfRlNDSykKPj4gwqDCoMKgwqDCoMKgwqAgZjJmc19m
YXVsdF9yZXBvcnQoc2JpLT5zYiwgUkVQT1JUX0ZBVUxUX05FRURfRlNDSywgX19mdW5jX18sIF9f
TElORV9fKTsKPj4gfQo+Pgo+PiBUaGFua3MsCj4+Cj4gVGhlIGFkdmFudGFnZSBvZiBkZWZpbmlu
Z3xzZXRfc2JpX2ZsYWd8YXMgYSBtYWNybyBpcyB0aGF0LAo+IHdoZW58ZjJmc19idWdfb258YW5k
fG5lZWRfZnNja3xhcmUgdHJpZ2dlcmVkLAo+IHRoZSBmdW5jdGlvbiBuYW1lIGFuZCBsaW5lIG51
bWJlciB3aGVyZSB0aGUgZmF1bHQgb2NjdXJyZWQgY2FuIGJlIGRpcmVjdGx5IGNhcHR1cmVkLgo+
IElmIGl0IHdlcmUgaW1wbGVtZW50ZWQgYXMgYSBmdW5jdGlvbiwgdGhlIGZ1bmN0aW9uIGFuZCBs
aW5lIG51bWJlciBwYXNzZWQgaW4gd291bGQgYmUgaW52YWxpZCwKPiBsZWF2aW5nIG9ubHkgdGhl
IG9wdGlvbiB0byBpbmZlciB0aGUgZmF1bHQgbG9jYXRpb24gZnJvbSB0aGUgY2FsbCBzdGFjay4K
Ck9oLCByaWdodCwgSSBtaXNzZWQgdGhhdC4KClRoYW5rcywKCj4gQnV0IEknbSBmaW5lIHdpdGgg
ZWl0aGVyIGFwcHJvYWNoIOKAlCBJJ2xsIGdvIHdpdGggeW91ciBzdWdnZXN0aW9uLgo+IAo+IFRo
YW5rcwo+IAo+Pj4gKwo+Pj4gwqAgc3RhdGljIGlubGluZSB2b2lkIGNsZWFyX3NiaV9mbGFnKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgaW50IHR5cGUpCj4+PiDCoCB7Cj4+PiDC
oMKgwqDCoMKgIGNsZWFyX2JpdCh0eXBlLCAmc2JpLT5zX2ZsYWcpOwo+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gaW5kZXggY2NmODA2YjY3NmY1
Li5iNDMxODQyNzUxZDYgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4+ICsrKyBi
L2ZzL2YyZnMvc3VwZXIuYwo+Pj4gQEAgLTQ3MjQsOSArNDcyNCwxOCBAQCBzdGF0aWMgdm9pZCBm
MmZzX2hhbmRsZV9jcml0aWNhbF9lcnJvcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiDC
oMKgwqDCoMKgwqAgKi8KPj4+IMKgIH0KPj4+IMKgICt2b2lkIGYyZnNfZmF1bHRfcmVwb3J0KHN0
cnVjdCBzdXBlcl9ibG9jayAqc2IsIHVuc2lnbmVkIGludCBlcnJfY29kZSwKPj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKmZ1bmMsIHVuc2lnbmVkIGludCBkYXRhKQo+Pj4g
K3sKPj4+ICvCoMKgwqAgdHJhY2VfZjJmc19mYXVsdF9yZXBvcnQoc2IsIGVycl9jb2RlLCBmdW5j
LCBkYXRhKTsKPj4+ICt9Cj4+PiArCj4+PiDCoCB2b2lkIGYyZnNfc3RvcF9jaGVja3BvaW50KHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYm9vbCBlbmRfaW8sCj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBjaGFyIHJlYXNvbikK
Pj4+IMKgIHsKPj4+ICvCoMKgwqAgaWYgKHJlYXNvbiAhPSBTVE9QX0NQX1JFQVNPTl9TSFVURE9X
TikKPj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX2ZhdWx0X3JlcG9ydChzYmktPnNiLCBSRVBPUlRf
RkFVTFRfU1RPUF9DUCwgX19mdW5jX18sIHJlYXNvbik7Cj4+PiArCj4+PiDCoMKgwqDCoMKgIGYy
ZnNfYnVpbGRfZmF1bHRfYXR0cihzYmksIDAsIDAsIEZBVUxUX0FMTCk7Cj4+PiDCoMKgwqDCoMKg
IGlmICghZW5kX2lvKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZmx1c2hfbWVyZ2VkX3dy
aXRlcyhzYmkpOwo+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaCBi
L2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaAo+Pj4gaW5kZXggOTM2NGU2Nzc1NTYyLi5iOTdi
YzNiZjQ5OWEgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL3RyYWNlL2V2ZW50cy9mMmZzLmgKPj4+
ICsrKyBiL2luY2x1ZGUvdHJhY2UvZXZlbnRzL2YyZnMuaAo+Pj4gQEAgLTI1ODIsNiArMjU4Miwz
NCBAQCBERUZJTkVfRVZFTlQoZjJmc19wcmlvcml0eV91cGRhdGUsIGYyZnNfcHJpb3JpdHlfcmVz
dG9yZSwKPj4+IMKgwqDCoMKgwqAgVFBfQVJHUyhzYmksIGxvY2tfbmFtZSwgaXNfd3JpdGUsIHAs
IG9yaWdfcHJpbywgbmV3X3ByaW8pCj4+PiDCoCApOwo+Pj4gwqAgK1RSQUNFX0VWRU5UKGYyZnNf
ZmF1bHRfcmVwb3J0LAo+Pj4gKwo+Pj4gK8KgwqDCoCBUUF9QUk9UTyhzdHJ1Y3Qgc3VwZXJfYmxv
Y2sgKnNiLCB1bnNpZ25lZCBpbnQgZXJyX2NvZGUsCj4+PiArwqDCoMKgwqDCoMKgwqAgY29uc3Qg
Y2hhciAqZnVuYywgdW5zaWduZWQgaW50IGRhdGEpLAo+Pj4gKwo+Pj4gK8KgwqDCoCBUUF9BUkdT
KHNiLCBlcnJfY29kZSwgZnVuYywgZGF0YSksCj4+PiArCj4+PiArwqDCoMKgIFRQX1NUUlVDVF9f
ZW50cnkoCj4+PiArwqDCoMKgwqDCoMKgwqAgX19maWVsZChkZXZfdCwgZGV2KQo+Pj4gK8KgwqDC
oMKgwqDCoMKgIF9fZmllbGQodW5zaWduZWQgaW50LCBlcnJfY29kZSkKPj4+ICvCoMKgwqDCoMKg
wqDCoCBfX3N0cmluZyhmdW5jLCBmdW5jKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fZmllbGQodW5z
aWduZWQgaW50LCBkYXRhKQo+Pj4gK8KgwqDCoCApLAo+Pj4gKwo+Pj4gK8KgwqDCoCBUUF9mYXN0
X2Fzc2lnbigKPj4+ICvCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5kZXbCoMKgwqDCoMKgwqDCoCA9
IHNiLT5zX2RldjsKPj4+ICvCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5lcnJfY29kZcKgwqDCoCA9
IGVycl9jb2RlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fYXNzaWduX3N0cihmdW5jLCBmdW5jKTsK
Pj4+ICvCoMKgwqDCoMKgwqDCoCBfX2VudHJ5LT5kYXRhwqDCoMKgwqDCoMKgwqAgPSBkYXRhOwo+
Pj4gK8KgwqDCoCApLAo+Pj4gKwo+Pj4gK8KgwqDCoCBUUF9wcmludGsoImRldiA9ICglZCwlZCks
IGVycl9jb2RlID0gJXUsIGZ1bmMgPSAlcywgZGF0YSA9ICV1IiwKPj4+ICvCoMKgwqDCoMKgwqDC
oCBzaG93X2RldihfX2VudHJ5LT5kZXYpLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fZW50cnktPmVy
cl9jb2RlLAo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fZ2V0X3N0cihmdW5jKSwKPj4+ICvCoMKgwqDC
oMKgwqDCoCBfX2VudHJ5LT5kYXRhKQo+Pj4gKyk7Cj4+PiArCj4+PiDCoCAjZW5kaWYgLyogX1RS
QUNFX0YyRlNfSCAqLwo+Pj4gwqAgwqDCoCAvKiBUaGlzIHBhcnQgbXVzdCBiZSBvdXRzaWRlIHBy
b3RlY3Rpb24gKi8KPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
