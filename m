Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBB7IJcU72l85wAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 09:47:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9993846E8E4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 09:47:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA7qTxSRMT2R1yLoyHeedipMl1m1E21EUKoR6rE04RQ=; b=Ks4Rs9QxiYW0dwD+9H4CQJJV3X
	PBfGArpj8PhInWi5ucXr3ODFgItGPlhX4YiVh7QsGiuYYhJXQUv27/F2yp94TAF8C3ZjJ3os7vD0S
	PgLl1NRD0KH1QgmYSFAOEkse83rKbUUkQVc80PTbSuChs2LxHJH4FRsWrw6cc0hmQG/Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHGgh-0002Fo-WF;
	Mon, 27 Apr 2026 07:47:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wHGgG-0002FF-2F
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 07:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BLlSJ0bVVzqpUfsSR37eb8vEqaVb0WhhJdoPyM2P9Uk=; b=TxakU73YLtT8DjXZ25MV2MtSKl
 hdnwkhfzxzWnw7en3Eyaes3t9v2qdr/kk3odMaQQMrudkJmzohZBusIuU7oF3drRcvww3oN8zFyHF
 eAKMN7SjKCoBpqtbVhzEGNml61nfMRQcPlRrGQ1Qin3tMxZSWmvswIxe4gWeB7pesnVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BLlSJ0bVVzqpUfsSR37eb8vEqaVb0WhhJdoPyM2P9Uk=; b=GoVdzvXM79YMOGoOMZeCEryKdB
 J70TD1BRJ4n82KgkDp18ZFz6yhlufubO5e+7ZXHtLW5OkaSGPxznZsVZX4tbd9OytwGRhA0VnhEDZ
 pJwISFxM+5HldYDyTReiPMX1VGRKrMfFBJ4adqEzUzjnJ9cNvkDXGSIJSbWYR7c0ngF8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHGgF-0004LV-8n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 07:46:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5C95460145;
 Mon, 27 Apr 2026 07:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F13F7C2BCB6;
 Mon, 27 Apr 2026 07:46:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777276008;
 bh=LS8FFCQXZ/udqpzy+MgLMqK/9/cMfw2aflYuqBABqTw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=lLsCxp2Ps2ckOXJg3a/f8vplY4scVTwU21yiDk88H+HiA1nYRqHSXme8sPGQDR4fR
 ByIdUDiyK2rTdhn4qG6QiSjHHr7tcLU0Wr1m9ALzguTKJY6O96XLtJ+wyR4Bj0G8gu
 hn7YUUVArlMPxHNFY7jwvYBVTvC9dnYP+H/B4QgbtvOTU6HBBHSWp8dXIvb8+qD9MK
 farAtyafNmXKFsJ5NAgr8QWrzkqB69fI/M0QpzgYWQXbMeOpdbKLuuzO8OGpOYBOU3
 IATPnI5PydEIMJoDkiw/YOBzZFjTkj836Gtfc2ugLcWWEhQDd0MXzUPuYE+jihJoD1
 kmoSYsPGVYHaA==
Message-ID: <6fbd773c-d7f9-41ac-b712-c0079af14d1e@kernel.org>
Date: Mon, 27 Apr 2026 15:46:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Ruipeng Qi <ruipengqi3@gmail.com>, jaegeuk@kernel.org
References: <20260325133749.1053541-1-ruipengqi3@gmail.com>
 <607d2d34-9d58-42d1-8436-e85d9c73eb7a@kernel.org>
 <47128c90-86e3-48a6-aa11-3da39218ae7c@gmail.com>
Content-Language: en-US
In-Reply-To: <47128c90-86e3-48a6-aa11-3da39218ae7c@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/26/26 17:30, Ruipeng Qi wrote: > > On 2026/4/20 15:35, 
 Chao Yu wrote: >> Hi Ruipeng, >> >> Sorry, I missed your patch. >> >> On
 3/25/2026 9:37 PM, ruipengqi wrote: >>> From: Ruipeng Qi <ruipengqi [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wHGgF-0004LV-8n
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential deadlock in
 f2fs_balance_fs()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 9993846E8E4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruipengqi3@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

T24gNC8yNi8yNiAxNzozMCwgUnVpcGVuZyBRaSB3cm90ZToKPiAKPiBPbiAyMDI2LzQvMjAgMTU6
MzUsIENoYW8gWXUgd3JvdGU6Cj4+IEhpIFJ1aXBlbmcsCj4+Cj4+IFNvcnJ5LCBJIG1pc3NlZCB5
b3VyIHBhdGNoLgo+Pgo+PiBPbiAzLzI1LzIwMjYgOTozNyBQTSwgcnVpcGVuZ3FpIHdyb3RlOgo+
Pj4gRnJvbTogUnVpcGVuZyBRaSA8cnVpcGVuZ3FpM0BnbWFpbC5jb20+Cj4+Pgo+Pj4gV2hlbiB0
aGUgZjJmcyBmaWxlc3lzdGVtIHNwYWNlIGlzIG5lYXJseSBleGhhdXN0ZWQsIHdlIGVuY291bnRl
ciBkZWFkbG9jawo+Pj4gaXNzdWVzIGFzIGJlbG93Ogo+Pj4KPj4+IElORk86IHRhc2sgQToxODkw
IGJsb2NrZWQgZm9yIG1vcmUgdGhhbiAxMjAgc2Vjb25kcy4KPj4+IMKgwqDCoMKgwqDCoCBUYWlu
dGVkOiBHwqDCoMKgwqDCoMKgwqDCoMKgwqAgT8KgwqDCoMKgwqDCoCA2LjEyLjQxLWczZmUwN2Rk
ZjA1YWIgIzEKPj4+ICJlY2hvIDAgPiAvcHJvYy9zeXMva2VybmVsL2h1bmdfdGFza190aW1lb3V0
X3NlY3MiIGRpc2FibGVzIHRoaXMgbWVzc2FnZS4KPj4+IHRhc2s6QcKgwqDCoCBzdGF0ZTpEIHN0
YWNrOjDCoMKgwqDCoCBwaWQ6MTg5MMKgIHRnaWQ6MTYyNsKgIHBwaWQ6MTE1MyBmbGFnczoweDAw
MDAwMjA0Cj4+PiBDYWxsIHRyYWNlOgo+Pj4gwqAgX19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+Pj4g
wqAgX19zY2hlZHVsZSsweDI3Yy8weDkwOAo+Pj4gwqAgc2NoZWR1bGUrMHgzYy8weDExOAo+Pj4g
wqAgaW9fc2NoZWR1bGUrMHg0NC8weDY4Cj4+PiDCoCBmb2xpb193YWl0X2JpdF9jb21tb24rMHgx
NzQvMHgzNzAKPj4+IMKgIGZvbGlvX3dhaXRfYml0KzB4MjAvMHgzOAo+Pj4gwqAgZm9saW9fd2Fp
dF93cml0ZWJhY2srMHg1NC8weGM4Cj4+PiDCoCB0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFsX2ZvbGlv
KzB4NzAvMHgxZTAKPj4+IMKgIHRydW5jYXRlX2lub2RlX3BhZ2VzX3JhbmdlKzB4MWIwLzB4NDUw
Cj4+PiDCoCB0cnVuY2F0ZV9wYWdlY2FjaGUrMHg1NC8weDg4Cj4+PiDCoCBmMmZzX2ZpbGVfd3Jp
dGVfaXRlcisweDNlOC8weGI4MAo+Pj4gwqAgZG9faXRlcl9yZWFkdl93cml0ZXYrMHhmMC8weDFl
MAo+Pj4gwqAgdmZzX3dyaXRldisweDEzOC8weDJjOAo+Pj4gwqAgZG9fd3JpdGV2KzB4ODgvMHgx
MzAKPj4+IMKgIF9fYXJtNjRfc3lzX3dyaXRldisweDI4LzB4NDAKPj4+IMKgIGludm9rZV9zeXNj
YWxsKzB4NTAvMHgxMjAKPj4+IMKgIGVsMF9zdmNfY29tbW9uLmNvbnN0cHJvcC4wKzB4YzgvMHhm
MAo+Pj4gwqAgZG9fZWwwX3N2YysweDI0LzB4MzgKPj4+IMKgIGVsMF9zdmMrMHgzMC8weGY4Cj4+
PiDCoCBlbDB0XzY0X3N5bmNfaGFuZGxlcisweDEyMC8weDEzMAo+Pj4gwqAgZWwwdF82NF9zeW5j
KzB4MTkwLzB4MTk4Cj4+Pgo+Pj4gSU5GTzogdGFzayBrd29ya2VyL3U4OjExOjI2ODA4NTMgYmxv
Y2tlZCBmb3IgbW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+Pj4gwqDCoMKgwqDCoMKgIFRhaW50ZWQ6
IEfCoMKgwqDCoMKgwqDCoMKgwqDCoCBPwqDCoMKgwqDCoMKgIDYuMTIuNDEtZzNmZTA3ZGRmMDVh
YiAjMQo+Pj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2Vj
cyIgZGlzYWJsZXMgdGhpcyBtZXNzYWdlLgo+Pj4gdGFzazprd29ya2VyL3U4OjExwqDCoCBzdGF0
ZTpEIHN0YWNrOjDCoMKgwqDCoCBwaWQ6MjY4MDg1MyB0Z2lkOjI2ODA4NTMgcHBpZDoywqDCoMKg
wqDCoCBmbGFnczoweDAwMDAwMjA4Cj4+PiBXb3JrcXVldWU6IHdyaXRlYmFjayB3Yl93b3JrZm4g
KGZsdXNoLTI1NDowKQo+Pj4gQ2FsbCB0cmFjZToKPj4+IMKgIF9fc3dpdGNoX3RvKzB4ZjQvMHgx
NTgKPj4+IMKgIF9fc2NoZWR1bGUrMHgyN2MvMHg5MDgKPj4+IMKgIHNjaGVkdWxlKzB4M2MvMHgx
MTgKPj4+IMKgIGlvX3NjaGVkdWxlKzB4NDQvMHg2OAo+Pj4gwqAgZm9saW9fd2FpdF9iaXRfY29t
bW9uKzB4MTc0LzB4MzcwCj4+PiDCoCBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKzB4MjE0LzB4MzQ4Cj4+
PiDCoCBwYWdlY2FjaGVfZ2V0X3BhZ2UrMHgyMC8weDcwCj4+PiDCoCBmMmZzX2dldF9yZWFkX2Rh
dGFfcGFnZSsweDE1MC8weDNlOAo+Pj4gwqAgZjJmc19nZXRfbG9ja19kYXRhX3BhZ2UrMHgyYy8w
eDE2MAo+Pj4gwqAgbW92ZV9kYXRhX3BhZ2UrMHg1MC8weDQ3OAo+Pj4gwqAgZG9fZ2FyYmFnZV9j
b2xsZWN0KzB4ZDM4LzB4MTUyOAo+Pj4gwqAgZjJmc19nYysweDI0MC8weDdlMAo+Pj4gwqAgZjJm
c19iYWxhbmNlX2ZzKzB4MWEwLzB4MjA4Cj4+PiDCoCBmMmZzX3dyaXRlX3NpbmdsZV9kYXRhX3Bh
Z2UrMHg2ZTQvMHg3MzDCoCAvLzB4ZmZmZmZlMGQ2Y2EwODMwMAo+Pj4gwqAgZjJmc193cml0ZV9j
YWNoZV9wYWdlcysweDM3OC8weDliMAo+Pj4gwqAgZjJmc193cml0ZV9kYXRhX3BhZ2VzKzB4MmU0
LzB4Mzg4Cj4+PiDCoCBkb193cml0ZXBhZ2VzKzB4OGMvMHgyYzgKPj4+IMKgIF9fd3JpdGViYWNr
X3NpbmdsZV9pbm9kZSsweDRjLzB4NDk4Cj4+PiDCoCB3cml0ZWJhY2tfc2JfaW5vZGVzKzB4MjM0
LzB4NGE4Cj4+PiDCoCBfX3dyaXRlYmFja19pbm9kZXNfd2IrMHg1OC8weDExOAo+Pj4gwqAgd2Jf
d3JpdGViYWNrKzB4MmY4LzB4M2MwCj4+PiDCoCB3Yl93b3JrZm4rMHgyYzQvMHg1MDgKPj4+IMKg
IHByb2Nlc3Nfb25lX3dvcmsrMHgxODAvMHg0MDgKPj4+IMKgIHdvcmtlcl90aHJlYWQrMHgyNTgv
MHgzNjgKPj4+IMKgIGt0aHJlYWQrMHgxMTgvMHgxMjgKPj4+IMKgIHJldF9mcm9tX2ZvcmsrMHgx
MC8weDIwMAo+Pj4KPj4+IElORk86IHRhc2sga3dvcmtlci91ODo4OjI2NDEyOTcgYmxvY2tlZCBm
b3IgbW9yZSB0aGFuIDEyMCBzZWNvbmRzLgo+Pj4gwqDCoMKgwqDCoMKgIFRhaW50ZWQ6IEfCoMKg
wqDCoMKgwqDCoMKgwqDCoCBPwqDCoMKgwqDCoMKgIDYuMTIuNDEtZzNmZTA3ZGRmMDVhYiAjMQo+
Pj4gImVjaG8gMCA+IC9wcm9jL3N5cy9rZXJuZWwvaHVuZ190YXNrX3RpbWVvdXRfc2VjcyIgZGlz
YWJsZXMgdGhpcyBtZXNzYWdlLgo+Pj4gdGFzazprd29ya2VyL3U4OjjCoMKgwqAgc3RhdGU6RCBz
dGFjazowwqDCoMKgwqAgcGlkOjI2NDEyOTcgdGdpZDoyNjQxMjk3IHBwaWQ6MsKgwqDCoMKgwqAg
ZmxhZ3M6MHgwMDAwMDIwOAo+Pj4gV29ya3F1ZXVlOiB3cml0ZWJhY2sgd2Jfd29ya2ZuIChmbHVz
aC0yNTQ6MCkKPj4+IENhbGwgdHJhY2U6Cj4+PiDCoCBfX3N3aXRjaF90bysweGY0LzB4MTU4Cj4+
PiDCoCBfX3NjaGVkdWxlKzB4MjdjLzB4OTA4Cj4+PiDCoCBydF9tdXRleF9zY2hlZHVsZSsweDMw
LzB4NjAKPj4+IMKgIF9fcnRfbXV0ZXhfc2xvd2xvY2tfbG9ja2VkLmNvbnN0cHJvcC4wKzB4NDYw
LzB4OGE4Cj4+PiDCoCByd2Jhc2Vfd3JpdGVfbG9jaysweDI0Yy8weDM3OAo+Pj4gwqAgZG93bl93
cml0ZSsweDFjLzB4MzAKPj4+IMKgIGYyZnNfYmFsYW5jZV9mcysweDE4NC8weDIwOAo+Pj4gwqAg
ZjJmc193cml0ZV9pbm9kZSsweGY0LzB4MzI4Cj4+PiDCoCBfX3dyaXRlYmFja19zaW5nbGVfaW5v
ZGUrMHgzNzAvMHg0OTgKPj4+IMKgIHdyaXRlYmFja19zYl9pbm9kZXMrMHgyMzQvMHg0YTgKPj4+
IMKgIF9fd3JpdGViYWNrX2lub2Rlc193YisweDU4LzB4MTE4Cj4+PiDCoCB3Yl93cml0ZWJhY2sr
MHgyZjgvMHgzYzAKPj4+IMKgIHdiX3dvcmtmbisweDJjNC8weDUwOAo+Pj4gwqAgcHJvY2Vzc19v
bmVfd29yaysweDE4MC8weDQwOAo+Pj4gwqAgd29ya2VyX3RocmVhZCsweDI1OC8weDM2OAo+Pj4g
wqAga3RocmVhZCsweDExOC8weDEyOAo+Pj4gwqAgcmV0X2Zyb21fZm9yaysweDEwLzB4MjAKPj4+
Cj4+PiBJTkZPOiB0YXNrIEI6MTkwMiBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMu
Cj4+PiDCoMKgwqDCoMKgwqAgVGFpbnRlZDogR8KgwqDCoMKgwqDCoMKgwqDCoMKgIE/CoMKgwqDC
oMKgwqAgNi4xMi40MS1nM2ZlMDdkZGYwNWFiICMxCj4+PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tl
cm5lbC9odW5nX3Rhc2tfdGltZW91dF9zZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3NhZ2UuCj4+PiB0
YXNrOkLCoMKgwqDCoCBzdGF0ZTpEIHN0YWNrOjDCoMKgwqDCoCBwaWQ6MTkwMsKgIHRnaWQ6MTYy
NsKgIHBwaWQ6MTE1MyBmbGFnczoweDAwMDAwMjBjCj4+PiBDYWxsIHRyYWNlOgo+Pj4gwqAgX19z
d2l0Y2hfdG8rMHhmNC8weDE1OAo+Pj4gwqAgX19zY2hlZHVsZSsweDI3Yy8weDkwOAo+Pj4gwqAg
cnRfbXV0ZXhfc2NoZWR1bGUrMHgzMC8weDYwCj4+PiDCoCBfX3J0X211dGV4X3Nsb3dsb2NrX2xv
Y2tlZC5jb25zdHByb3AuMCsweDQ2MC8weDhhOAo+Pj4gwqAgcndiYXNlX3dyaXRlX2xvY2srMHgy
NGMvMHgzNzgKPj4+IMKgIGRvd25fd3JpdGUrMHgxYy8weDMwCj4+PiDCoCBmMmZzX2JhbGFuY2Vf
ZnMrMHgxODQvMHgyMDgKPj4+IMKgIGYyZnNfbWFwX2Jsb2NrcysweDk0Yy8weDExMTAKPj4+IMKg
IGYyZnNfZmlsZV93cml0ZV9pdGVyKzB4MjI4LzB4YjgwCj4+PiDCoCBkb19pdGVyX3JlYWR2X3dy
aXRldisweGYwLzB4MWUwCj4+PiDCoCB2ZnNfd3JpdGV2KzB4MTM4LzB4MmM4Cj4+PiDCoCBkb193
cml0ZXYrMHg4OC8weDEzMAo+Pj4gwqAgX19hcm02NF9zeXNfd3JpdGV2KzB4MjgvMHg0MAo+Pj4g
wqAgaW52b2tlX3N5c2NhbGwrMHg1MC8weDEyMAo+Pj4gwqAgZWwwX3N2Y19jb21tb24uY29uc3Rw
cm9wLjArMHhjOC8weGYwCj4+PiDCoCBkb19lbDBfc3ZjKzB4MjQvMHgzOAo+Pj4gwqAgZWwwX3N2
YysweDMwLzB4ZjgKPj4+IMKgIGVsMHRfNjRfc3luY19oYW5kbGVyKzB4MTIwLzB4MTMwCj4+PiDC
oCBlbDB0XzY0X3N5bmMrMHgxOTAvMHgxOTgKPj4+Cj4+PiBJTkZPOiB0YXNrIHN5bmM6Mjc2OTg0
OSBibG9ja2VkIGZvciBtb3JlIHRoYW4gMTIwIHNlY29uZHMuCj4+PiDCoMKgwqDCoMKgwqAgVGFp
bnRlZDogR8KgwqDCoMKgwqDCoMKgwqDCoMKgIE/CoMKgwqDCoMKgwqAgNi4xMi40MS1nM2ZlMDdk
ZGYwNWFiICMxCj4+PiAiZWNobyAwID4gL3Byb2Mvc3lzL2tlcm5lbC9odW5nX3Rhc2tfdGltZW91
dF9zZWNzIiBkaXNhYmxlcyB0aGlzIG1lc3NhZ2UuCj4+PiB0YXNrOnN5bmPCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHN0YXRlOkQgc3RhY2s6MMKgwqDCoMKgIHBpZDoyNzY5ODQ5IHRnaWQ6Mjc2OTg0
OSBwcGlkOjczNsKgwqDCoCBmbGFnczoweDAwMDAwMjBjCj4+PiBDYWxsIHRyYWNlOgo+Pj4gwqAg
X19zd2l0Y2hfdG8rMHhmNC8weDE1OAo+Pj4gwqAgX19zY2hlZHVsZSsweDI3Yy8weDkwOAo+Pj4g
wqAgc2NoZWR1bGUrMHgzYy8weDExOAo+Pj4gwqAgd2Jfd2FpdF9mb3JfY29tcGxldGlvbisweGIw
LzB4ZTgKPj4+IMKgIHN5bmNfaW5vZGVzX3NiKzB4YzgvMHgyYjAKPj4+IMKgIHN5bmNfaW5vZGVz
X29uZV9zYisweDI0LzB4MzgKPj4+IMKgIGl0ZXJhdGVfc3VwZXJzKzB4YTgvMHgxMzgKPj4+IMKg
IGtzeXNfc3luYysweDU0LzB4YzgKPj4+IMKgIF9fYXJtNjRfc3lzX3N5bmMrMHgxOC8weDMwCj4+
PiDCoCBpbnZva2Vfc3lzY2FsbCsweDUwLzB4MTIwCj4+PiDCoCBlbDBfc3ZjX2NvbW1vbi5jb25z
dHByb3AuMCsweGM4LzB4ZjAKPj4+IMKgIGRvX2VsMF9zdmMrMHgyNC8weDM4Cj4+PiDCoCBlbDBf
c3ZjKzB4MzAvMHhmOAo+Pj4gwqAgZWwwdF82NF9zeW5jX2hhbmRsZXIrMHgxMjAvMHgxMzAKPj4+
IMKgIGVsMHRfNjRfc3luYysweDE5MC8weDE5OAo+Pj4KPj4+IFRoZSByb290IGNhdXNlIGlzIGEg
cG90ZW50aWFsIGRlYWRsb2NrIGJldHdlZW4gdGhlIGZvbGxvd2luZyB0YXNrczoKPj4+Cj4+PiBr
d29ya2VyL3U4OjExwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFRocmVhZCBBCj4+PiAt
IGYyZnNfd3JpdGVfc2luZ2xlX2RhdGFfcGFnZQo+Pj4gwqAgLSBmMmZzX2RvX3dyaXRlX2RhdGFf
cGFnZQo+Pj4gwqDCoCAtIGZvbGlvX3N0YXJ0X3dyaXRlYmFjayhYKQo+Pj4gwqDCoCAtIGYyZnNf
b3V0cGxhY2Vfd3JpdGVfZGF0YQo+Pj4gwqDCoMKgIC0gYmlvX2FkZF9mb2xpbyhYKQo+Pj4gwqAg
LSBmb2xpb191bmxvY2soWCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIC0gdHJ1bmNhdGVfaW5vZGVfcGFnZXNfcmFuZ2UKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKFgsIEZHUF9MT0NLKQo+
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIHRydW5jYXRlX2lu
b2RlX3BhcnRpYWxfZm9saW8oWCkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAtIGZvbGlvX3dhaXRfd3JpdGViYWNrKFgpCj4+PiDCoCAtIGYyZnNfYmFsYW5j
ZV9mcwo+Pj4gwqDCoCAtIGYyZnNfZ2MKPj4+IMKgwqDCoCAtIGRvX2dhcmJhZ2VfY29sbGVjdAo+
Pj4gwqDCoMKgwqAgLSBtb3ZlX2RhdGFfcGFnZQo+Pj4gwqDCoMKgwqDCoCAtIGYyZnNfZ2V0X2xv
Y2tfZGF0YV9wYWdlCj4+PiDCoMKgwqDCoMKgwqAgLSBfX2ZpbGVtYXBfZ2V0X2ZvbGlvKFgsIEZH
UF9MT0NLKQo+Pj4KPj4+IEJvdGggdGhyZWFkcyB0cnkgdG8gYWNjZXNzIGZvbGlvIFguIFRocmVh
ZCBBIGhvbGRzIHRoZSBsb2NrIGJ1dCB3YWl0cwo+Pj4gZm9yIHdyaXRlYmFjaywgd2hpbGUga3dv
cmtlciB3YWl0cyBmb3IgdGhlIGxvY2suIFRoaXMgY2F1c2VzIGEgZGVhZGxvY2suCj4+Pgo+Pj4g
T3RoZXIgdGhyZWFkcyBhbHNvIGVudGVyIEQgc3RhdGUsIHdhaXRpbmcgZm9yIGxvY2tzIHN1Y2gg
YXMgZ2NfbG9jayBhbmQKPj4+IHdyaXRlcGFnZXMuCj4+Pgo+Pj4gVG8gYXZvaWQgdGhpcyBwb3Rl
bnRpYWwgZGVhZGxvY2ssIGFsd2F5cyBjYWxsIGYyZnNfc3VibWl0X21lcmdlZF93cml0ZQo+Pj4g
YmVmb3JlIHRyaWdnZXJpbmcgZjJmc19nYyBpbiBmMmZzX2JhbGFuY2VfZnMuCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogUnVpcGVuZyBRaSA8cnVpcGVuZ3FpM0BnbWFpbC5jb20+Cj4+PiAtLS0KPj4+
IMKgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTQgKysrKysrKysrKysrKysKPj4+IMKgIDEgZmlsZSBj
aGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2Vn
bWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+IGluZGV4IDZhOTdmZTc2NzEyYi4uYjU4Mjk5
ZTQ5YzIzIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPj4+ICsrKyBiL2ZzL2Yy
ZnMvc2VnbWVudC5jCj4+PiBAQCAtNDU0LDYgKzQ1NCwyMCBAQCB2b2lkIGYyZnNfYmFsYW5jZV9m
cyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgbmVlZCkKPj4+IMKgwqDCoMKgwqDCoMKg
wqDCoCBpb19zY2hlZHVsZSgpOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGZpbmlzaF93YWl0KCZz
YmktPmdjX3RocmVhZC0+ZmdnY193cSwgJndhaXQpOwo+Pj4gwqDCoMKgwqDCoCB9IGVsc2Ugewo+
Pj4gKwo+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIEJlZm9y
ZSB0cmlnZ2VyaW5nIGZvcmVncm91bmQgR0MsIHN1Ym1pdCBhbGwgY2FjaGVkIERBVEEKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgICogd3JpdGUgYmlvcy4gRHVyaW5nIHdyaXRlYmFjaywgcGFnZXMgbWF5
IGJlIGFkZGVkIHRvCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHdyaXRlX2lvW0RBVEFdLmJpbyB3
aXRoIFBHX3dyaXRlYmFjayBzZXQgYnV0IHRoZSBiaW8gbm90Cj4+PiArwqDCoMKgwqDCoMKgwqDC
oCAqIHlldCBzdWJtaXR0ZWQuIElmIEdDJ3MgbW92ZV9kYXRhX3BhZ2UoKSBibG9ja3Mgb24KPj4+
ICvCoMKgwqDCoMKgwqDCoMKgICogX19mb2xpb19sb2NrKCkgZm9yIHN1Y2ggYSBmb2xpbywgYW5k
IHRoZSBsb2NrIGhvbGRlciB3YWl0cwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBmb3IgUEdfd3Jp
dGViYWNrIHRvIGNsZWFyIHZpYSBWRlMgZm9saW9fd2FpdF93cml0ZWJhY2soKQo+Pj4gK8KgwqDC
oMKgwqDCoMKgwqAgKiBuZWl0aGVyIHRocmVhZCBjYW4gbWFrZSBwcm9ncmVzcy4gRmx1c2hpbmcg
aGVyZSBlbnN1cmVzCj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIHRoZSBiaW8gY29tcGxldGlvbiBj
YWxsYmFjayBjYW4gY2xlYXIgUEdfd3JpdGViYWNrLgo+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8K
Pj4+ICsKPj4+ICvCoMKgwqDCoMKgwqDCoCBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGUoc2JpLCBE
QVRBKTsKPj4KPj4gRG8gd2UgbmVlZCB0byBjYWxsIGYyZnNfc3VibWl0X21lcmdlZF9pcHVfd3Jp
dGUoc2JpLCBiaW8sIE5VTEwpIHRvIGNvbW1pdAo+PiBjYWNoZWQgSVBVIGZvbGlvcyBhcyB3ZWxs
Pwo+Pgo+PiBOb3Qgc3VyZSwgdGhpcyByYWNlIGNvbmRpdGlvbiB3aWxsIGhhcHBlbiBmb3Igbm9k
ZSBmb2xpby4KPj4KPj4gVGhhbmtzLAo+Pgo+IEhpLCBDaGFvCj4gCj4gVGhhbmtzIGZvciB5b3Vy
IHN1Z2dlc3Rpb24uIEFmdGVyIGRlZXBlciBhbmFseXNpcywgdGhpcyByYWNlIGNvbmRpdGlvbgo+
IGFwcGxpZXMgdG8gSVBVIGZvbGlvcyBidXQgbm90IG5vZGUgZm9saW9zLiBOb2RlIGZvbGlvcyBh
cmUgdW5saWtlbHkgdG8KPiBoYXZlIHRoaXMgZmxvdy4KClJ1aXBlbmcsCgpJIGFncmVlLCBJIGRv
bid0IHNlZSBhbnkgZmxvdyBjYWxsaW5nIHRydW5jYXRlX2lub2RlX3BhZ2VzX3JhbmdlKG5vZGVf
aW5vZGUpIHdpbGwKcmFjZSB3LyB3cml0ZXBhZ2UgLT4gYmFsYW5jZV9mcy4KCj4gCj4gSSB3aWxs
IHNlbmQgYSBjb3JyZWN0ZWQgdmVyc2lvbiBzaG9ydGx5Lgo+IHYyOgo+IC0gQ29tbWl0IGNhY2hl
ZCBPUFUgYW5kIElQVSBmb2xpb3MsIG5vdCBqdXN0IE9QVSBmb2xpb3MgYXMgaW4gdjEuCj4gCj4g
QlRXLCBEbyB5b3UgdGhpbmsgaXQgaXMgcG9zc2libGUgdG8gYWRkIGFuIG9wdGlvbmFsIC0+d2Fp
dF9mb2xpb193cml0ZWJhY2soKQo+IGNhbGxiYWNrIHRvIGFkZHJlc3Nfc3BhY2Vfb3BlcmF0aW9u
cy4gd2hlbiBwcm92aWRlZCwKPiB0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFsX2ZvbGlvKCkgY2FsbHMg
ZjJmc193YWl0X29uX3BhZ2Vfd3JpdGViYWNrIGluc3RlYWQgb2YKPiB0aGUgZ2VuZXJpYyBmb2xp
b193YWl0X3dyaXRlYmFjaygpLCB3aGljaCBhbHNvIGZpeCB0aGlzIHJhY2UgY29uZGl0aW9uLgoK
WWVzLCBJIHRoaW5rIGl0IHdpbGwgYmUgYmV0dGVyIGFzIGl0IGNhbiBmaXggYWxsIHBvdGVudGlh
bCB3YWl0X3dyaXRlYmFjayBidWdzLApJIGd1ZXNzIHdlIGNhbiBoYXZlIGEgdHJ5LgoKVGhhbmtz
LAoKPiAKPiBUaGFua3MsCj4gCj4+PiArCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYy
ZnNfZ2NfY29udHJvbCBnY19jb250cm9sID0gewo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgLnZpY3RpbV9zZWdubyA9IE5VTExfU0VHTk8sCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAuaW5pdF9nY190eXBlID0gZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSA/CgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
