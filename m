Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 22P/AtU7Nmo88wYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 09:05:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 203676A87A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 09:05:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=F2u8oIMc;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=jzgBQZwO;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=U9jsV7CG;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=kEayUQnr;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WaZoMv1xoCKsuPUVC6XcQ8HI8577fJszc3EJwvPdR8U=; b=F2u8oIMcBjaRVW50vmaN7cXGA4
	Uj4kxUBOE25DyfW5uQc9L+izOj+0pTdtaH+XAJkh6IPGtIJctNLVJr2dgcTFrfd06Wwe2CPNRLz00
	oWbq+RordOHmEkVAkhUBux4gGiopM1wNiffcZb0Alish/y/0T+WMI/UjpbtjpOtZK0Tg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wapm0-0002R2-Lf;
	Sat, 20 Jun 2026 07:05:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1waplo-0002Qq-0d
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 07:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=521JmSpWYpjjHoSus7/TzkyQ/yc1FtpRr74VOAxf/Mc=; b=jzgBQZwO1d3139pr63PVC8MHX9
 LAYYU50C4Rm47EdzMedEEgH6hbrdAkpolZ05SP4PpK7gQ5L8UfwoHp/RkZqGnwLEMa47irSiBsh0z
 0AFHjGno4ydSQxEklIXZgc0c5+24DMWtUQ747no78TzQosAnZSYbEstjD4dsyQ7X9418=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=521JmSpWYpjjHoSus7/TzkyQ/yc1FtpRr74VOAxf/Mc=; b=U9jsV7CGZwkl2z6x9UE7FCqx4C
 pfmQdI855SYITIV/79wuhLfH7NbTXLtjZ9AEOF9xa+iLA6S3GZwG2TPHg4nGrlkRItpbBGeJohNKy
 onmkZymxH8azwbdGswh1I443NDkKdkrEwflrY6ClLM1Pi4CVKTKbrRCgER6isgdoxRpA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waplm-0005tv-Ow for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 07:05:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 8B8DB601E1;
 Sat, 20 Jun 2026 07:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FB7E1F000E9;
 Sat, 20 Jun 2026 07:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781939124;
 bh=521JmSpWYpjjHoSus7/TzkyQ/yc1FtpRr74VOAxf/Mc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=kEayUQnr+Gv42+OcNlacArNzUEaV0dr/y+wbTclfh8Bs4Ok5ayPXPjV3YZ2Mpk5AS
 sxGk7H0vutA6JPoWmH3Rh8FocLCGMwIWmIitxiiip37fECN/f5ZR4npNiZhwhLupSh
 Pp3UhO8F/9UIIbAjkxcvTWpqMJcIGOwgEf+1ofzaQirL+eP9wm2AyXw45oHud/V4dJ
 fMSTKTmr0cBdV2nonBYvJc3gL16s0yzCg/xvaXW/Vbzq/30JvKfnWa4fWZmtm1qPJE
 OoYrphXYm7V58VWqixJXVP/IXPsfLwpAEpPxoPkbK4BWBzObxV0+Y6oy5/un+ueXyF
 AxnLfLYyjrMzQ==
Message-ID: <f1be7e7e-7cd1-4ab0-ad91-9228ddda0553@kernel.org>
Date: Sat, 20 Jun 2026 15:05:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-6-yangyongpeng.storage@gmail.com>
 <8738e84f-6fef-479d-a100-7df0e130f75a@kernel.org>
 <ajAfmEHCgHAh1E0I@google.com>
 <SEZPR02MB56627B7C417379E9209FF87799E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB56627B7C417379E9209FF87799E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/19/26 22:56, Yongpeng Yang wrote: > > On 6/15/26 11:51
 PM, Jaegeuk Kim via Linux-f2fs-devel wrote: >> On 06/15,
 Chao Yu via Linux-f2fs-devel
 wrote: >>> On 6/12/26 19:58, Yongpeng Yang wrote: >>>> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1waplm-0005tv-Ow
Subject: Re: [f2fs-dev] [PATCH RESEND 5/5] f2fs: add ioctl to export read
 extent cache to userspace for debug
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:yangyongpeng.storage@outlook.com,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[outlook.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 203676A87A5

T24gNi8xOS8yNiAyMjo1NiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiA2LzE1LzI2IDEx
OjUxIFBNLCBKYWVnZXVrIEtpbSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gT24gMDYv
MTUsIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBPbiA2LzEyLzI2IDE5
OjU4LCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5
b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+Cj4+Pj4gQWRkIEYyRlNfSU9DX0dFVF9SRUFEX0NBQ0hF
X0VYVEVOVFMgaW9jdGwgdGhhdCBhbGxvd3MgdXNlcnNwYWNlIHRvCj4+Pj4gcmV0cmlldmUgYWxs
IGNhY2hlZCByZWFkIGV4dGVudHMgZm9yIGEgZ2l2ZW4gZmlsZS4gVGhpcyB1c2VzIGEgdHdvLWNh
bGwKPj4+PiBwYXR0ZXJuIHNpbWlsYXIgdG8gZmllbWFwOiB0aGUgZmlyc3QgY2FsbCB3aXRoIGV4
dF9jb3VudD0wIHF1ZXJpZXMgdGhlCj4+Pj4gbm9kZV9jb3VudCwgYW5kIHRoZSBzZWNvbmQgY2Fs
bCBmZXRjaGVzIHRoZSBhY3R1YWwgZXh0ZW50IGVudHJpZXMuCj4+Pgo+Pj4gSXQgbG9va3MgYSBs
aXR0bGUgYml0IGhlYXZ5IHRvIG1haW50YWluIGEgZGVidWcgcHVycG9zZSBpb2N0bCBpbnRlcmZh
Y2UuCj4+Pgo+Pj4gTWF5YmUgc2V0IGlubyB2aWEgc3lzZnMgYW5kIGR1bXAgZXh0ZW50IGNhY2hl
IHZpYSBwcm9jZnM/IG9ubHkgZW5hYmxlZAo+Pj4gaWYgRjJGU19DSEVDS19GUz15Pwo+Pj4KPj4+
IEphZWdldWssIGRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uPwo+Pgo+PiBBZ3JlZWQsIGFuZCBl
dmVuIG5vdCBzdXJlIHdlIG5lZWQgc3lzZnMgb3IgcHJvY2ZzLiBDYW4gd2UgZHVtcCB0aGUgZXh0
ZW50cwo+PiB2aWEgZnNjaz8KPiAKPiBJdCBpcyBpbmRlZWQgcXVpdGUgaGVhdnkuIE91ciBwcmlt
YXJ5IGdvYWwgaGVyZSBpcyBkZWJ1Z2dpbmcgaW5vZGUKPiBleHRlbnQgdHJlZXMsIGFuZCBmc2Nr
IGNhbm5vdCBtZWV0IHRoaXMgcmVxdWlyZW1lbnQuIElmIHdlIHJlbHkgb24KPiBwcm9jZnMgb3Ig
c3lzZnMgaW50ZXJmYWNlcywgd2Ugd291bGQgaGF2ZSB0byBvcGVuIGRlZGljYXRlZCBmaWxlcyB3
aXRoaW4KPiBzeXNmcy5jLCB3aGljaCBmZWVscyBsaWtlIGFuIGluYXBwcm9wcmlhdGUgYXBwcm9h
Y2guCgpjYWxsIGFjY2VzcygpIGluIHVzZXJzcGFjZSBhcHBsaWNhdGlvbiBvciB0b3VjaCBpbiBz
Y3JpcHQgdG8gbG9hZCBpbm9kZSB2aWEKbG9va3VwKCkgZmlyc3QsIHRoZW4gYWNjZXNzIHN5c2Zz
IGFuZCBwcm9jZnMgbm9kZT8KClRoYW5rcywKCj4gCj4gVGhhbmtzCj4gWW9uZ3BlbmcsCj4gCj4+
Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlh
bmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+IC0tLQo+Pj4+IMKgIGZzL2YyZnMvZXh0
ZW50X2NhY2hlLmPCoMKgwqAgfCA3MCArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPj4+PiDCoCBmcy9mMmZzL2YyZnMuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgIDMg
KysKPj4+PiDCoCBmcy9mMmZzL2ZpbGUuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCAxMSArKysr
KysKPj4+PiDCoCBpbmNsdWRlL3VhcGkvbGludXgvZjJmcy5oIHwgMjEgKysrKysrKysrKysrCj4+
Pj4gwqAgNCBmaWxlcyBjaGFuZ2VkLCAxMDUgaW5zZXJ0aW9ucygrKQo+Pj4+Cj4+Pj4gZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+
Pj4gaW5kZXggZTE0MWZmYjY0ZTVmLi4wYzEwZDU2MzlkNjggMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMv
ZjJmcy9leHRlbnRfY2FjaGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+
PiBAQCAtMTQsNiArMTQsNyBAQAo+Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9mcy5oPgo+Pj4+IMKg
ICNpbmNsdWRlIDxsaW51eC9mMmZzX2ZzLmg+Cj4+Pj4gKyNpbmNsdWRlIDx1YXBpL2xpbnV4L2Yy
ZnMuaD4KPj4+PiDCoCAjaW5jbHVkZSAiZjJmcy5oIgo+Pj4+IMKgICNpbmNsdWRlICJub2RlLmgi
Cj4+Pj4gQEAgLTEyNjcsNiArMTI2OCw3NSBAQCBzdGF0aWMgdm9pZCBfX2luaXRfZXh0ZW50X3Ry
ZWVfaW5mbyhzdHJ1Y3QgZXh0ZW50X3RyZWVfaW5mbyAqZXRpKQo+Pj4+IMKgwqDCoMKgwqAgYXRv
bWljX3NldCgmZXRpLT50b3RhbF9leHRfbm9kZSwgMCk7Cj4+Pj4gwqAgfQo+Pj4+ICtpbnQgZjJm
c19nZXRfcmVhZF9jYWNoZV9leHRlbnRzKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfcmVhZF9jYWNoZV9leHRlbnQgX191c2VyICp1
YXJnKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV0ID0gRjJGU19J
KGlub2RlKS0+ZXh0ZW50X3RyZWVbRVhfUkVBRF07Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19j
YWNoZV9leHRlbnRfaW5mbyAqa2J1ZiA9IE5VTEw7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19j
YWNoZV9leHRlbnRfaW5mbyBsYXJnZXN0ID0ge307Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgcmJfbm9k
ZSAqbm9kZTsKPj4+PiArwqDCoMKgIHN0cnVjdCBleHRlbnRfbm9kZSAqZW47Cj4+Pj4gK8KgwqDC
oCB1bnNpZ25lZCBpbnQgY2FwYWNpdHksIGNvdW50ID0gMDsKPj4+PiArwqDCoMKgIF9fdTMyIGZs
YWdzID0gMDsKPj4+PiArwqDCoMKgIGludCByZXQgPSAwOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlm
IChnZXRfdXNlcihjYXBhY2l0eSwgJnVhcmctPmV4dF9jb3VudCkpCj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIHJldHVybiAtRUZBVUxUOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChpc19pbm9kZV9mbGFn
X3NldChpbm9kZSwgRklfTk9fRVhURU5UKSkKPj4+PiArwqDCoMKgwqDCoMKgwqAgZmxhZ3MgfD0g
RjJGU19FWFRfRkxfTk9fRVhURU5UOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmICghZXQgfHwgKGZs
YWdzICYgRjJGU19FWFRfRkxfTk9fRVhURU5UKSkgewo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAo
cHV0X3VzZXIoMFUsICZ1YXJnLT5leHRfY291bnQpIHx8Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcHV0X3VzZXIoZmxhZ3MsICZ1YXJnLT5mbGFncykgfHwKPj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBwdXRfdXNlcigwVSwgJnVhcmctPm5vZGVfY291bnQpKQo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUZBVUxUOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1
cm4gMDsKPj4+PiArwqDCoMKgIH0KPj4+PiArCj4+Pj4gK8KgwqDCoCBpZiAoY2FwYWNpdHkpIHsK
Pj4+PiArwqDCoMKgwqDCoMKgwqAga2J1ZiA9IGYyZnNfa3ZtYWxsb2MoRjJGU19JX1NCKGlub2Rl
KSwgY2FwYWNpdHkgKiBzaXplb2YoKmtidWYpLCBHRlBfS0VSTkVMKTsKPj4+PiArwqDCoMKgwqDC
oMKgwqAgaWYgKCFrYnVmKQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5P
TUVNOwo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKgIHJlYWRfbG9jaygmZXQtPmxv
Y2spOwo+Pj4+ICsKPj4+PiArwqDCoMKgIGxhcmdlc3QuZm9mcyA9IGV0LT5sYXJnZXN0LmZvZnM7
Cj4+Pj4gK8KgwqDCoCBsYXJnZXN0LmJsayA9IGV0LT5sYXJnZXN0LmJsazsKPj4+PiArwqDCoMKg
IGxhcmdlc3QubGVuID0gZXQtPmxhcmdlc3QubGVuOwo+Pj4+ICvCoMKgwqAgbGFyZ2VzdC5sYXN0
X2FjY2Vzc19tb2RlID0gZXQtPmxhcmdlc3QubGFzdF9hY2Nlc3NfbW9kZTsKPj4+PiArCj4+Pj4g
K8KgwqDCoCBmb3IgKG5vZGUgPSByYl9maXJzdF9jYWNoZWQoJmV0LT5yb290KTsgbm9kZTsgbm9k
ZSA9IHJiX25leHQobm9kZSkpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgaWYgKGNvdW50ID49IGNh
cGFjaXR5KQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBlbiA9IHJiX2VudHJ5KG5vZGUsIHN0cnVjdCBleHRlbnRfbm9kZSwgcmJfbm9kZSk7
Cj4+Pj4gKwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBrYnVmW2NvdW50XS5mb2ZzID0gZW4tPmVpLmZv
ZnM7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGtidWZbY291bnRdLmJsayA9IGVuLT5laS5ibGs7Cj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIGtidWZbY291bnRdLmxlbiA9IGVuLT5laS5sZW47Cj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIGtidWZbY291bnRdLmxhc3RfYWNjZXNzX21vZGUgPSBlbi0+ZWkubGFzdF9h
Y2Nlc3NfbW9kZTsKPj4+PiArwqDCoMKgwqDCoMKgwqAgY291bnQrKzsKPj4+PiArwqDCoMKgIH0K
Pj4+PiArCj4+Pj4gK8KgwqDCoCByZWFkX3VubG9jaygmZXQtPmxvY2spOwo+Pj4+ICsKPj4+PiAr
wqDCoMKgIGlmIChjb3VudCAmJiBjb3B5X3RvX3VzZXIodWFyZy0+ZXh0ZW50cywga2J1ZiwKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb3VudCAqIHNpemVvZigqa2J1
ZikpKSB7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FRkFVTFQ7Cj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGdvdG8gb3V0Owo+Pj4+ICvCoMKgwqAgfQo+Pj4+ICsKPj4+PiArwqDCoMKgIGlmIChw
dXRfdXNlcihjb3VudCwgJnVhcmctPmV4dF9jb3VudCkgfHwKPj4+PiArwqDCoMKgwqDCoMKgwqAg
cHV0X3VzZXIoZmxhZ3MsICZ1YXJnLT5mbGFncykgfHwKPj4+PiArwqDCoMKgwqDCoMKgwqAgcHV0
X3VzZXIoKHUzMilhdG9taWNfcmVhZCgmZXQtPm5vZGVfY250KSwgJnVhcmctPm5vZGVfY291bnQp
IHx8Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGNvcHlfdG9fdXNlcigmdWFyZy0+bGFyZ2VzdCwgJmxh
cmdlc3QsIHNpemVvZihsYXJnZXN0KSkpCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FRkFV
TFQ7Cj4+Pj4gK291dDoKPj4+PiArwqDCoMKgIGt2ZnJlZShrYnVmKTsKPj4+PiArwqDCoMKgIHJl
dHVybiByZXQ7Cj4+Pj4gK30KPj4+PiArCj4+Pj4gwqAgdm9pZCBmMmZzX2luaXRfZXh0ZW50X2Nh
Y2hlX2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4+IMKgIHsKPj4+PiDCoMKgwqDC
oMKgIF9faW5pdF9leHRlbnRfdHJlZV9pbmZvKCZzYmktPmV4dGVudF90cmVlW0VYX1JFQURdKTsK
Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+Pj4+IGlu
ZGV4IDE1ODhiNjRkMDRhMy4uNjk2NDFmYzMxYzUxIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMv
ZjJmcy5oCj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBAQCAtMjYsNiArMjYsNyBAQAo+
Pj4+IMKgICNpbmNsdWRlIDxsaW51eC9wYXJ0X3N0YXQuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGlu
dXgvcndfaGludC5oPgo+Pj4+ICsjaW5jbHVkZSA8dWFwaS9saW51eC9mMmZzLmg+Cj4+Pj4gwqAg
I2luY2x1ZGUgPGxpbnV4L2ZzY3J5cHQuaD4KPj4+PiDCoCAjaW5jbHVkZSA8bGludXgvZnN2ZXJp
dHkuaD4KPj4+PiBAQCAtNDU5MCw2ICs0NTkxLDggQEAgdm9pZCBmMmZzX3VwZGF0ZV9yZWFkX2V4
dGVudF9jYWNoZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4pOwo+Pj4+IMKgIHZvaWQgZjJmc191
cGRhdGVfcmVhZF9leHRlbnRfY2FjaGVfcmFuZ2Uoc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLAo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGdvZmZfdCBmb2ZzLCBibG9j
a190IGJsa2FkZHIsIHVuc2lnbmVkIGludCBsZW4sCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBlbnVtIGV4dGVudF9hY2Nlc3NfbW9kZSBhY2Nlc3NfbW9kZSk7Cj4+Pj4g
K2ludCBmMmZzX2dldF9yZWFkX2NhY2hlX2V4dGVudHMoc3RydWN0IGlub2RlICppbm9kZSwKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19yZWFkX2NhY2hlX2V4dGVudCBf
X3VzZXIgKnVhcmcpOwo+Pj4+IMKgIHVuc2lnbmVkIGludCBmMmZzX3Nocmlua19yZWFkX2V4dGVu
dF90cmVlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpbnQgbnJfc2hyaW5rKTsKPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMg
Yi9mcy9mMmZzL2ZpbGUuYwo+Pj4+IGluZGV4IGEzYTVkNDk5ZWFkZi4uNjZlYzk5MjdkNjY3IDEw
MDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMK
Pj4+PiBAQCAtMzY3Miw2ICszNjcyLDE0IEBAIHN0YXRpYyBpbnQgZjJmc19pb2NfcHJlY2FjaGVf
ZXh0ZW50cyhzdHJ1Y3QgZmlsZSAqZmlscCkKPj4+PiDCoMKgwqDCoMKgIHJldHVybiBmMmZzX3By
ZWNhY2hlX2V4dGVudHMoZmlsZV9pbm9kZShmaWxwKSk7Cj4+Pj4gwqAgfQo+Pj4+ICtzdGF0aWMg
aW50IGYyZnNfaW9jX2dldF9yZWFkX2NhY2hlX2V4dGVudHMoc3RydWN0IGZpbGUgKmZpbHAsIHVu
c2lnbmVkIGxvbmcgYXJnKQo+Pj4+ICt7Cj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgaW5vZGUgKmlub2Rl
ID0gZmlsZV9pbm9kZShmaWxwKTsKPj4+PiArCj4+Pj4gK8KgwqDCoCByZXR1cm4gZjJmc19nZXRf
cmVhZF9jYWNoZV9leHRlbnRzKGlub2RlLAo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIChz
dHJ1Y3QgZjJmc19yZWFkX2NhY2hlX2V4dGVudCBfX3VzZXIgKilhcmcpOwo+Pj4+ICt9Cj4+Pj4g
Kwo+Pj4+IMKgIHN0YXRpYyBpbnQgZjJmc19pb2NfcmVzaXplX2ZzKHN0cnVjdCBmaWxlICpmaWxw
LCB1bnNpZ25lZCBsb25nIGFyZykKPj4+PiDCoCB7Cj4+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmkgPSBGMkZTX0lfU0IoZmlsZV9pbm9kZShmaWxwKSk7Cj4+Pj4gQEAgLTQ3
NDQsNiArNDc1Miw4IEBAIHN0YXRpYyBsb25nIF9fZjJmc19pb2N0bChzdHJ1Y3QgZmlsZSAqZmls
cCwgdW5zaWduZWQgaW50IGNtZCwgdW5zaWduZWQgbG9uZyBhcmcpCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiBmMmZzX2lvY19nZXRfZGV2X2FsaWFzX2ZpbGUoZmlscCwgYXJnKTsKPj4+
PiDCoMKgwqDCoMKgIGNhc2UgRjJGU19JT0NfSU9fUFJJTzoKPj4+PiDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0dXJuIGYyZnNfaW9jX2lvX3ByaW8oZmlscCwgYXJnKTsKPj4+PiArwqDCoMKgIGNhc2Ug
RjJGU19JT0NfR0VUX1JFQURfQ0FDSEVfRVhURU5UUzoKPj4+PiArwqDCoMKgwqDCoMKgwqAgcmV0
dXJuIGYyZnNfaW9jX2dldF9yZWFkX2NhY2hlX2V4dGVudHMoZmlscCwgYXJnKTsKPj4+PiDCoMKg
wqDCoMKgIGRlZmF1bHQ6Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PVFRZOwo+
Pj4+IMKgwqDCoMKgwqAgfQo+Pj4+IEBAIC01NTA2LDYgKzU1MTYsNyBAQCBsb25nIGYyZnNfY29t
cGF0X2lvY3RsKHN0cnVjdCBmaWxlICpmaWxlLCB1bnNpZ25lZCBpbnQgY21kLCB1bnNpZ25lZCBs
b25nIGFyZykKPj4+PiDCoMKgwqDCoMKgIGNhc2UgRjJGU19JT0NfQ09NUFJFU1NfRklMRToKPj4+
PiDCoMKgwqDCoMKgIGNhc2UgRjJGU19JT0NfR0VUX0RFVl9BTElBU19GSUxFOgo+Pj4+IMKgwqDC
oMKgwqAgY2FzZSBGMkZTX0lPQ19JT19QUklPOgo+Pj4+ICvCoMKgwqAgY2FzZSBGMkZTX0lPQ19H
RVRfUkVBRF9DQUNIRV9FWFRFTlRTOgo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+
PiDCoMKgwqDCoMKgIGRlZmF1bHQ6Cj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5P
SU9DVExDTUQ7Cj4+Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC9mMmZzLmggYi9p
bmNsdWRlL3VhcGkvbGludXgvZjJmcy5oCj4+Pj4gaW5kZXggNzk1ZTI2MjU4MzU1Li42ZmY5MDAz
YmMwMzAgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L2YyZnMuaAo+Pj4+ICsr
KyBiL2luY2x1ZGUvdWFwaS9saW51eC9mMmZzLmgKPj4+PiBAQCAtNDUsNiArNDUsOCBAQAo+Pj4+
IMKgICNkZWZpbmUgRjJGU19JT0NfU1RBUlRfQVRPTUlDX1JFUExBQ0XCoMKgwqAgX0lPKEYyRlNf
SU9DVExfTUFHSUMsIDI1KQo+Pj4+IMKgICNkZWZpbmUgRjJGU19JT0NfR0VUX0RFVl9BTElBU19G
SUxFwqDCoMKgIF9JT1IoRjJGU19JT0NUTF9NQUdJQywgMjYsIF9fdTMyKQo+Pj4+IMKgICNkZWZp
bmUgRjJGU19JT0NfSU9fUFJJT8KgwqDCoMKgwqDCoMKgIF9JT1coRjJGU19JT0NUTF9NQUdJQywg
MjcsIF9fdTMyKQo+Pj4+ICsjZGVmaW5lIEYyRlNfSU9DX0dFVF9SRUFEX0NBQ0hFX0VYVEVOVFPC
oMKgwqAgX0lPV1IoRjJGU19JT0NUTF9NQUdJQywgMjgswqDCoMKgIFwKPj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19yZWFkX2Nh
Y2hlX2V4dGVudCkKPj4+PiDCoCAvKgo+Pj4+IMKgwqAgKiBzaG91bGQgYmUgc2FtZSBhcyBYRlNf
SU9DX0dPSU5HRE9XTi4KPj4+PiBAQCAtMTA0LDQgKzEwNiwyMyBAQCBzdHJ1Y3QgZjJmc19jb21w
X29wdGlvbiB7Cj4+Pj4gwqDCoMKgwqDCoCBfX3U4IGxvZ19jbHVzdGVyX3NpemU7Cj4+Pj4gwqAg
fTsKPj4+PiArc3RydWN0IGYyZnNfY2FjaGVfZXh0ZW50X2luZm8gewo+Pj4+ICvCoMKgwqAgX191
MzIgZm9mczvCoMKgwqDCoMKgwqDCoCAvKiBzdGFydCBmaWxlIG9mZnNldCBpbiBibG9ja3MgKi8K
Pj4+PiArwqDCoMKgIF9fdTMyIGJsazvCoMKgwqDCoMKgwqDCoCAvKiBzdGFydCBibG9jayBhZGRy
ZXNzICovCj4+Pj4gK8KgwqDCoCBfX3UzMiBsZW47wqDCoMKgwqDCoMKgwqAgLyogbGVuZ3RoIGlu
IGJsb2NrcyAqLwo+Pj4+ICvCoMKgwqAgX191MzIgbGFzdF9hY2Nlc3NfbW9kZTsgLyogbGFzdCBh
Y2Nlc3MgbW9kZSBvZiBleHRlbnRfbm9kZSAqLwo+Pj4+ICt9Owo+Pj4+ICsKPj4+PiArLyogZmxh
Z3MgZm9yIGYyZnNfcmVhZF9jYWNoZV9leHRlbnQgKi8KPj4+PiArI2RlZmluZSBGMkZTX0VYVF9G
TF9OT19FWFRFTlTCoMKgwqAgMHgxwqDCoMKgIC8qIGV4dGVudCBjYWNoZSBkaXNhYmxlZCBmb3Ig
dGhpcyBpbm9kZSAqLwo+Pj4+ICsKPj4+PiArc3RydWN0IGYyZnNfcmVhZF9jYWNoZV9leHRlbnQg
ewo+Pj4+ICvCoMKgwqAgX191MzIgZXh0X2NvdW50O8KgwqDCoCAvKiBpbjogYXJyYXkgY2FwYWNp
dHk7IG91dDogbWFwcGVkIGV4dGVudCBjb3VudCAqLwo+Pj4+ICvCoMKgwqAgX191MzIgZmxhZ3M7
wqDCoMKgwqDCoMKgwqAgLyogb3V0OiBzdGF0dXMgZmxhZ3MgKi8KPj4+PiArwqDCoMKgIF9fdTMy
IG5vZGVfY291bnQ7wqDCoMKgIC8qIG91dDogdG90YWwgZXh0ZW50IG5vZGVzIGluIHRyZWUgKi8K
Pj4+PiArwqDCoMKgIF9fdTMyIHJlc2VydmVkOwo+Pj4+ICvCoMKgwqAgc3RydWN0IGYyZnNfY2Fj
aGVfZXh0ZW50X2luZm8gbGFyZ2VzdDvCoMKgwqDCoMKgwqDCoCAvKiBvdXQ6IGxhcmdlc3QgZXh0
ZW50ICovCj4+Pj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19jYWNoZV9leHRlbnRfaW5mbyBleHRlbnRz
W107wqDCoMKgIC8qIG91dDogZXh0ZW50IGFycmF5ICovCj4+Pj4gK307Cj4+Pj4gKwo+Pj4+IMKg
ICNlbmRpZiAvKiBfVUFQSV9MSU5VWF9GMkZTX0ggKi8KPj4+Cj4+Pgo+Pj4KPj4+IF9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+PiBMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdAo+Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwKPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
