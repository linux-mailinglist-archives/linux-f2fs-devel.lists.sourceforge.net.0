Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id U4wqGJjiuGmhkwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 06:11:52 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBAC2A3E99
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Mar 2026 06:11:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB6WHBAUvEXZN/K/pQKrkeC40wtvOtioNQ7mJUiqPMU=; b=EqoKdTyDUcV4M4HBC0w/SO3Br2
	2oqf5xfaJGFz8ZObeUgLXNrSvq8HWW7eOjHcTtriJpcaB1UgvL10TZ6plTu6XH7fjRQSEHr3unT2H
	lIkYVLn6WIF30lJSe46eZ1aA4ggZLfPQT8is/klAyhzgS9qUhW6lAUKCLipsP6eKhtKQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2MiP-0000si-2z;
	Tue, 17 Mar 2026 05:11:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1w2MiN-0000sc-8o
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 05:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zZpPrkMJ/T2mzfCOK6o36YWZBfQws+ihlKYJPVyb/+U=; b=ffQFCgA7wdc/r/cKAQHQ0Vo0pD
 bCGZRj71mwg/odUL68d9K2etmTMbF+Z8sh0+/XSWirkKgiMo29yKE1dUq912bl74sm02m/16N36vi
 GKxhf8MbkGwmOMqnIiJ8eREjGq3nefzRJAhFhaObvIsjJu27Z0BrpctfrOx39JcUQgY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zZpPrkMJ/T2mzfCOK6o36YWZBfQws+ihlKYJPVyb/+U=; b=CSy0fNiIKqut3M8VNAzFar2FyX
 EQj9gJ1X9WEzbgQFJ7tiZnPzuXu1T/86ILBS1Keb0jYinu4NZ940q7PgFqfoNwBJVz+0/uTkKRs6x
 +aqK4w1c9xNFslQR2Mnfk1QRT0GU8EppOlYsw2rGQ+j1X+6SpnE71jZb/ZL9xVSYozBQ=;
Received: from smtp153-171.sina.com.cn ([61.135.153.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2MiM-0008FK-1y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Mar 2026 05:11:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1773724294; bh=zZpPrkMJ/T2mzfCOK6o36YWZBfQws+ihlKYJPVyb/+U=;
 h=Message-ID:Date:Subject:From;
 b=jA9NAP1gbIcEG3rZ5q8d/ju3pBqsHpfectqfVOA0B0SsDEcpMxBj8OHXbYipfQYah
 bKGum0w6xiH3qe+2Fd3KU6GBTbCOljZsDaDH3c5h+a/zjlAVsoN2plLYpii9K2eLdv
 /p2a84qArCsZQTPZaqBA5fNtE9jApQpOZWQ7sO8k=
X-SMAIL-HELO: [10.189.138.37]
Received: from unknown (HELO [10.189.138.37])([114.247.175.249])
 by sina.com (10.54.253.34) with ESMTP
 id 69B8B9D100001AB0; Tue, 17 Mar 2026 10:17:54 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 9619536292059
X-SMAIL-UIID: C4DCA90CA5AF47A2BFD6C8FF14ACF5B0-20260317-101754-1
Message-ID: <a042029a-8465-4b63-af13-c60cd03dc070@sina.com>
Date: Tue, 17 Mar 2026 10:17:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260315181321.4063984-2-monty_pavel@sina.com>
 <a8e1b900-1976-43da-9894-ac7f9697f5aa@kernel.org>
Content-Language: en-US
From: Yongpeng Yang <monty_pavel@sina.com>
In-Reply-To: <a8e1b900-1976-43da-9894-ac7f9697f5aa@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/17/26 10:01, Chao Yu via Linux-f2fs-devel wrote: > On
 2026/3/16 02:13, Yongpeng Yang wrote: >> From: Yongpeng Yang >> >> This patch
 refactor the f2fs_move_node_folio() function. No logical >> c [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [61.135.153.171 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URI: sina.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1w2MiM-0008FK-1y
Subject: Re: [f2fs-dev] [PATCH v3 1/3] f2fs: refactor f2fs_move_node_folio
 function
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-0.91 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	FORGED_SENDER_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: EBBAC2A3E99
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xNy8yNiAxMDowMSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPiBP
biAyMDI2LzMvMTYgMDI6MTMsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+IEZyb206IFlvbmdwZW5n
IFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBUaGlzIHBhdGNoIHJlZmFjdG9y
IHRoZSBmMmZzX21vdmVfbm9kZV9mb2xpbygpIGZ1bmN0aW9uLiBObyBsb2dpY2FsCj4+IGNoYW5n
ZS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5nQHhpYW9t
aS5jb20+Cj4+IC0tLQo+PiDCoCBmcy9mMmZzL2YyZnMuaCB8wqAgMiArKwo+PiDCoCBmcy9mMmZz
L25vZGUuYyB8IDU0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0t
LS0tLS0tCj4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMzQgaW5zZXJ0aW9ucygrKSwgMjIgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5o
Cj4+IGluZGV4IDg5NDJiMmE2M2NmZC4uYmU1MTMyZjk5MmU4IDEwMDY0NAo+PiAtLS0gYS9mcy9m
MmZzL2YyZnMuaAo+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+PiBAQCAtMzk0Nyw2ICszOTQ3LDgg
QEAgaW50IGYyZnNfc2FuaXR5X2NoZWNrX25vZGVfZm9vdGVyKHN0cnVjdAo+PiBmMmZzX3NiX2lu
Zm8gKnNiaSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVu
dW0gbm9kZV90eXBlIG50eXBlLCBib29sIGluX2lycSk7Cj4+IMKgIHN0cnVjdCBmb2xpbyAqZjJm
c19nZXRfaW5vZGVfZm9saW8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBwZ29mZl90Cj4+IGlu
byk7Cj4+IMKgIHN0cnVjdCBmb2xpbyAqZjJmc19nZXRfeG5vZGVfZm9saW8oc3RydWN0IGYyZnNf
c2JfaW5mbyAqc2JpLCBwZ29mZl90Cj4+IHhuaWQpOwo+PiAraW50IGYyZnNfd3JpdGVfc2luZ2xl
X25vZGVfZm9saW8oc3RydWN0IGZvbGlvICpub2RlX2ZvbGlvLCBpbnQKPj4gc3luY19tb2RlLAo+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBib29sIG1hcmtfZGlydHksIGVudW0gaW9zdGF0X3R5
cGUgaW9fdHlwZSk7Cj4+IMKgIGludCBmMmZzX21vdmVfbm9kZV9mb2xpbyhzdHJ1Y3QgZm9saW8g
Km5vZGVfZm9saW8sIGludCBnY190eXBlKTsKPj4gwqAgdm9pZCBmMmZzX2ZsdXNoX2lubGluZV9k
YXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4+IMKgIGludCBmMmZzX2ZzeW5jX25vZGVf
cGFnZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3QgaW5vZGUKPj4gKmlub2RlLAo+
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+PiBpbmRleCBi
YmZhNjc3ZWY0NmYuLjEyYjk0M2VhZTRkOSAxMDA2NDQKPj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMK
Pj4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPj4gQEAgLTE4NDMsNDEgKzE4NDMsNTEgQEAgc3RhdGlj
IGJvb2wgX193cml0ZV9ub2RlX2ZvbGlvKHN0cnVjdCBmb2xpbwo+PiAqZm9saW8sIGJvb2wgYXRv
bWljLCBib29sICpzdWJtaXR0ZWQKPj4gwqDCoMKgwqDCoCByZXR1cm4gZmFsc2U7Cj4+IMKgIH0K
Pj4gwqAgLWludCBmMmZzX21vdmVfbm9kZV9mb2xpbyhzdHJ1Y3QgZm9saW8gKm5vZGVfZm9saW8s
IGludCBnY190eXBlKQo+PiAraW50IGYyZnNfd3JpdGVfc2luZ2xlX25vZGVfZm9saW8oc3RydWN0
IGZvbGlvICpub2RlX2ZvbGlvLCBpbnQKPj4gc3luY19tb2RlLAo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBib29sIG1hcmtfZGlydHksIGVudW0gaW9zdGF0X3R5cGUgaW9fdHlwZSkKPj4gwqAg
ewo+PiDCoMKgwqDCoMKgIGludCBlcnIgPSAwOwo+PiArwqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tf
Y29udHJvbCB3YmMgPSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCAuc3luY19tb2RlID0gV0JfU1lOQ19B
TEwsCj4+ICvCoMKgwqDCoMKgwqDCoCAubnJfdG9fd3JpdGUgPSAxLAo+PiArwqDCoMKgIH07Cj4+
IMKgIC3CoMKgwqAgaWYgKGdjX3R5cGUgPT0gRkdfR0MpIHsKPj4gLcKgwqDCoMKgwqDCoMKgIHN0
cnVjdCB3cml0ZWJhY2tfY29udHJvbCB3YmMgPSB7Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IC5zeW5jX21vZGUgPSBXQl9TWU5DX0FMTCwKPj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLm5y
X3RvX3dyaXRlID0gMSwKPj4gLcKgwqDCoMKgwqDCoMKgIH07Cj4+ICvCoMKgwqAgaWYgKCFzeW5j
X21vZGUpIHsKPj4gK8KgwqDCoMKgwqDCoMKgIC8qIHNldCBwYWdlIGRpcnR5IGFuZCB3cml0ZSBp
dCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKG1hcmtfZGlydHkgJiYgIWZvbGlvX3Rlc3Rfd3Jp
dGViYWNrKG5vZGVfZm9saW8pKQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2xpb19tYXJr
X2RpcnR5KG5vZGVfZm9saW8pOwo+PiArwqDCoMKgwqDCoMKgwqAgZ290byBvdXRfZm9saW87Cj4+
ICvCoMKgwqAgfQo+PiDCoCAtwqDCoMKgwqDCoMKgwqAgZjJmc19mb2xpb193YWl0X3dyaXRlYmFj
ayhub2RlX2ZvbGlvLCBOT0RFLCB0cnVlLCB0cnVlKTsKPj4gK8KgwqDCoCBmMmZzX2ZvbGlvX3dh
aXRfd3JpdGViYWNrKG5vZGVfZm9saW8sIE5PREUsIHRydWUsIHRydWUpOwo+PiDCoCArwqDCoMKg
IGlmIChtYXJrX2RpcnR5KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZm9saW9fbWFya19kaXJ0eShu
b2RlX2ZvbGlvKTsKPj4gK8KgwqDCoCBlbHNlIGlmICghZm9saW9fdGVzdF9kaXJ0eShub2RlX2Zv
bGlvKSkKPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gb3V0X2ZvbGlvOwo+PiDCoCAtwqDCoMKgwqDC
oMKgwqAgaWYgKCFmb2xpb19jbGVhcl9kaXJ0eV9mb3JfaW8obm9kZV9mb2xpbykpIHsKPj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gLUVBR0FJTjsKPj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgZ290byBvdXRfcGFnZTsKPj4gLcKgwqDCoMKgwqDCoMKgIH0KPj4gLQo+PiAtwqDCoMKg
wqDCoMKgwqAgaWYgKCFfX3dyaXRlX25vZGVfZm9saW8obm9kZV9mb2xpbywgZmFsc2UsIE5VTEws
Cj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmd2JjLCBmYWxzZSwg
RlNfR0NfTk9ERV9JTywgTlVMTCkpCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IC1F
QUdBSU47Cj4+IC3CoMKgwqDCoMKgwqDCoCBnb3RvIHJlbGVhc2VfcGFnZTsKPj4gLcKgwqDCoCB9
IGVsc2Ugewo+PiAtwqDCoMKgwqDCoMKgwqAgLyogc2V0IHBhZ2UgZGlydHkgYW5kIHdyaXRlIGl0
ICovCj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoIWZvbGlvX3Rlc3Rfd3JpdGViYWNrKG5vZGVfZm9s
aW8pKQo+PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmb2xpb19tYXJrX2RpcnR5KG5vZGVfZm9s
aW8pOwo+PiArwqDCoMKgIGlmICghZm9saW9fY2xlYXJfZGlydHlfZm9yX2lvKG5vZGVfZm9saW8p
KSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIgPSAtRUFHQUlOOwo+PiArwqDCoMKgwqDCoMKgwqAg
Z290byBvdXRfZm9saW87Cj4+IMKgwqDCoMKgwqAgfQo+PiAtb3V0X3BhZ2U6Cj4+ICsKPj4gK8Kg
wqDCoCBpZiAoIV9fd3JpdGVfbm9kZV9mb2xpbyhub2RlX2ZvbGlvLCBmYWxzZSwgTlVMTCwKPj4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAmd2JjLCBmYWxzZSwgRlNfR0NfTk9ERV9J
TywgTlVMTCkpCj4+ICvCoMKgwqDCoMKgwqDCoCBlcnIgPSAtRUFHQUlOOwo+PiArwqDCoMKgIGdv
dG8gcmVsZWFzZV9mb2xpbzsKPj4gK291dF9mb2xpbzoKPj4gwqDCoMKgwqDCoCBmb2xpb191bmxv
Y2sobm9kZV9mb2xpbyk7Cj4+IC1yZWxlYXNlX3BhZ2U6Cj4+ICtyZWxlYXNlX2ZvbGlvOgo+PiDC
oMKgwqDCoMKgIGYyZnNfZm9saW9fcHV0KG5vZGVfZm9saW8sIGZhbHNlKTsKPj4gwqDCoMKgwqDC
oCByZXR1cm4gZXJyOwo+PiDCoCB9Cj4+IMKgICtpbnQgZjJmc19tb3ZlX25vZGVfZm9saW8oc3Ry
dWN0IGZvbGlvICpub2RlX2ZvbGlvLCBpbnQgZ2NfdHlwZSkKPj4gK3sKPj4gK8KgwqDCoCByZXR1
cm4gZjJmc193cml0ZV9zaW5nbGVfbm9kZV9mb2xpbyhub2RlX2ZvbGlvLCBnY190eXBlID09IEZH
X0dDLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnY190eXBlID09IEZHX0dDLCBGU19HQ19O
T0RFX0lPKTsKPiAKPiBtYXJrX2RpcnR5IHNob3VsZCBhbHdheXMgYmUgdHJ1ZSBmb3IgYm90eSBG
R0dDIGFuZCBCR0dDPwoKU29ycnksIEkgbWFkZSBhIG1pc3Rha2UsIGFuZCBlcnJvciBjb2RlIGNo
ZWNrIG9mIGYyZnNfZ2V0X2lub2RlX2ZvbGlvKCkKaW4gW1BBVENIIHYzIDMvM10uIEknbGwgZml4
IHRob3NlIGluIHY0IHBhdGNoLgoKVGhhbmtzCllvbmdwZW5nLAoKPiAKPiBUaGFua3MsCj4gCj4+
ICt9Cj4+ICsKPj4gwqAgaW50IGYyZnNfZnN5bmNfbm9kZV9wYWdlcyhzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksIHN0cnVjdCBpbm9kZQo+PiAqaW5vZGUsCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHN0cnVjdCB3cml0ZWJhY2tfY29udHJvbCAqd2JjLCBib29sIGF0b21pYywKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50ICpzZXFfaWQpCj4gCj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
