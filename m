Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DR1O32zwGm5KAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 04:29:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 332B02EC364
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2026 04:29:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtHIsTk5lATJfxgO+nf4mhtOaUl21W/TmzbZ1vJC7hw=; b=ESWmhLDzo7jp9I6dQovX5CEw5V
	l5cVIYRHV6ZTXswgn3Gc7cgxWrfovSU/Us3S1wnNaYaIarW8UlIPCKtcZjvzoNWMvNl0QQpU6U/hH
	6eF3IFnDaOIZ86sqawhwpWVSuR+iJnIlwN9436sTaH4/9CnpwJENtPhWh4Ye88xREDNU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w4VyH-0007Nz-1T;
	Mon, 23 Mar 2026 03:28:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w4VyF-0007Nt-4L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 03:28:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zAZyMs1JGtFDvJEFz7e/ZYlUoi2KkpAlNJi5W9Lsxa4=; b=h01LIJL7apC6hiH06eCE1FK43N
 x63UZcN+yHqwCNFBFdQoWUKoDpXh63NukRuKNsqQGSegl7zmuJxQqgnMzK402MNfzLH9RriLHlpo9
 WSCMlM/X2e10EYIBLnqcO5OBu9bkrx3nr3egJb6I7GFsKsw5FDFH8KbvQ4k1u74/PlxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zAZyMs1JGtFDvJEFz7e/ZYlUoi2KkpAlNJi5W9Lsxa4=; b=BY10/FTHeFOXu9z69nlmdZhvl4
 PLEGS36/7o+PoDDQvEZCb5dCJC5DdQyR5hRNxPZlRslx/DFQPJQmO6vuDgJ+gQLb4AkR8Yn72YxVz
 i0eqlHASlQm6+D1pZ1rOPDNOeqjeTxxthKdIZtz4DtyrPna9zwOmSUjUjX01+YpynduU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w4VyE-0000sI-Fo for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Mar 2026 03:28:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D0742600C4;
 Mon, 23 Mar 2026 03:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAD4C4CEF7;
 Mon, 23 Mar 2026 03:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1774236519;
 bh=RrIGdrtzJueHvP0og2e+mm63ND53iRinvYDZ8zyJ20k=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=UOnp+qoY0HBOdwO/WBay43fNAYFXvdrEfIw0NERoSSXACOCUMWuT5a/QFpEEiQL5O
 4jJgORON9ndMlUm8jSX2JKQ5x/rAluDyHaHp3tVPYdDskKLGOn/U2pwA270uWPrRG2
 4aoFPhJSNiwf2twc6vECPsdVa5X/f5bfHN5op/mcF1qRaIsvt2z+At0ETEYNVL3h4x
 KCVJhUmueh+qIzi42qcPEKjTIjUtHw0DaPqkBKPFyh761tiBoMasbBJDhPrUktBji9
 OYnr+9khBWxef4wsyStNPRYng/BamHXn7A4BhMnYy7cRQFP4yDHGIJfK3EBJxpciJC
 XsJV29hLdCxXw==
Message-ID: <03e452c8-b68e-4132-a5d2-aa1300673231@kernel.org>
Date: Mon, 23 Mar 2026 11:28:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <monty_pavel@sina.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260319132607.686096-2-monty_pavel@sina.com>
 <20260319132607.686096-4-monty_pavel@sina.com>
Content-Language: en-US
In-Reply-To: <20260319132607.686096-4-monty_pavel@sina.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/19/26 21:26, Yongpeng Yang wrote: > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > f2fs_fiemap() calls f2fs_map_blocks() to obtain
 the block mapping a > file, and then merges contiguous mappin [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w4VyE-0000sI-Fo
Subject: Re: [f2fs-dev] [PATCH v3 2/2] f2fs: fix fiemap boundary handling
 when read extent cache is incomplete
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
Cc: linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, stable@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:monty_pavel@sina.com,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpeng@xiaomi.com,m:stable@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[sina.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,xiaomi.com:email];
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
X-Rspamd-Queue-Id: 332B02EC364
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMy8xOS8yNiAyMToyNiwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiBGcm9tOiBZb25ncGVuZyBZ
YW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPiAKPiBmMmZzX2ZpZW1hcCgpIGNhbGxzIGYy
ZnNfbWFwX2Jsb2NrcygpIHRvIG9idGFpbiB0aGUgYmxvY2sgbWFwcGluZyBhCj4gZmlsZSwgYW5k
IHRoZW4gbWVyZ2VzIGNvbnRpZ3VvdXMgbWFwcGluZ3MgaW50byBleHRlbnRzLiBJZiB0aGUgbWFw
cGluZwo+IGlzIGZvdW5kIGluIHRoZSByZWFkIGV4dGVudCBjYWNoZSwgbm9kZSBibG9ja3MgZG8g
bm90IG5lZWQgdG8gYmUgcmVhZC4KPiBIb3dldmVyLCBpbiB0aGUgZm9sbG93aW5nIHNjZW5hcmlv
LCBhIGNvbnRpZ3VvdXMgZXh0ZW50IGNhbiBiZSBzcGxpdAo+IGludG8gdHdvIGV4dGVudHM6Cj4g
Cj4gcm9vdEB2bTovbW50L2YyZnMjIGRkIGlmPS9kZXYvemVybyBvZj1kYXRhLjRNIGJzPTFNIGNv
dW50PTQgJiYgc3luYwo+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0
YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MiBjb252PW5vdHJ1bmMgJiYgc3luYwo+IHJvb3RAdm06
L21udC9mMmZzIyBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMgIyBkcm9wIDJNfjRN
IGV4dGVudCBjYWNoZQo+IHJvb3RAdm06L21udC9mMmZzIyBkZCBpZj0vZGV2L3plcm8gb2Y9ZGF0
YS40TSBicz0xTSBjb3VudD0yIHNlZWs9MCBjb252PW5vdHJ1bmMgJiYgc3luYwo+IHJvb3RAdm06
L21udC9mMmZzIyBmMmZzX2lvIGZpZW1hcCAwIDEwMjQgZGF0YS40TQo+IEZpZW1hcDogb2Zmc2V0
ID0gMCBsZW4gPSAxMDI0Cj4gbG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0
aCAgICAgICAgICAgZmxhZ3MKPiAwCTAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAwNjQwMDAwMCAw
MDAwMDAwMDAwMjAwMDAwIDAwMDAxMDAwCj4gMQkwMDAwMDAwMDAwMjAwMDAwIDAwMDAwMDAwMDY2
MDAwMDAgMDAwMDAwMDAwMDIwMDAwMCAwMDAwMTAwMQoKV2VsbCwgSSBjYW4gbm90IHJlcHJvZHVj
ZSB0aGlzIHcvIGFib3ZlIHNjcmlwdHMsIGNhbiB5b3UgcGxlYXNlIGNoZWNrCnRoYXQ/IGFueXdh
eSwgdGhlIGNvZGUgcGFydCBsb29rcyBmaW5lIHRvIG1lLgoKVGhhbmtzLAoKPiAKPiBBbHRob3Vn
aCB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIG9mIHRoZSByYW5nZXMgMO+9njJNQiBhbmQgMk3vvZ40
TUIgYXJlCj4gY29udGlndW91cywgdGhlIG1hcHBpbmcgZm9yIHRoZSAyTe+9njRNQiByYW5nZSBp
cyBub3QgcHJlc2VudCBpbiBtZW1vcnkuCj4gV2hlbiB0aGUgcGh5c2ljYWwgYWRkcmVzc2VzIGZv
ciB0aGUgMO+9njJNQiByYW5nZSBhcmUgdXBkYXRlZCwgbm8gbWVyZ2UKPiBoYXBwZW5zIGJlY2F1
c2UgdGhlIGFkamFjZW50IG1hcHBpbmcgaXMgbWlzc2luZyBmcm9tIHRoZSBpbi1tZW1vcnkKPiBj
YWNoZS4gQXMgYSByZXN1bHQsIGZpZW1hcCByZXBvcnRzIHR3byBzZXBhcmF0ZSBleHRlbnRzIGlu
c3RlYWQgb2YgYQo+IHNpbmdsZSBjb250aWd1b3VzIG9uZS4KPiAKPiBUaGUgcm9vdCBjYXVzZSBp
cyB0aGF0IHRoZSByZWFkIGV4dGVudCBjYWNoZSBkb2VzIG5vdCBndWFyYW50ZWUgdGhhdCBhbGwK
PiBibG9ja3Mgb2YgYW4gZXh0ZW50IGFyZSBwcmVzZW50IGluIG1lbW9yeS4gVGhlcmVmb3JlLCB3
aGVuIHRoZSBleHRlbnQKPiBsZW5ndGggcmV0dXJuZWQgYnkgZjJmc19tYXBfYmxvY2tzX2NhY2hl
ZCgpIGlzIHNtYWxsZXIgdGhhbiBtYXhibG9ja3MsCj4gdGhlIHJlbWFpbmluZyBtYXBwaW5ncyBh
cmUgcmV0cmlldmVkIHZpYSBmMmZzX2dldF9kbm9kZV9vZl9kYXRhKCkgdG8KPiBlbnN1cmUgY29y
cmVjdCBmaWVtYXAgZXh0ZW50IGJvdW5kYXJ5IGhhbmRsaW5nLgo+IAo+IENjOiBzdGFibGVAa2Vy
bmVsLm9yZwo+IEZpeGVzOiBjZDhmYzUyMjZiZWYgKCJmMmZzOiByZW1vdmUgdGhlIGNyZWF0ZSBh
cmd1bWVudCB0byBmMmZzX21hcF9ibG9ja3MiKQo+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlh
bmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+IC0tLQo+IHYzOgo+IC0gQ2MgdG8gc3RhYmxl
IGtlcm5lbC4KPiB2MjoKPiAtIEZpeCBOVUxMIHBvaW50ZXIgZGVyZWZlcmVuY2UgY2F1c2VkIGJ5
IG1hcC0+bV9tdWx0aWRldl9kaW8uCj4gLSBSZWR1Y2UgY2FsbHMgdG8gZjJmc19nZXRfZG5vZGVf
b2ZfZGF0YSgpLgo+IC0tLQo+ICBmcy9mMmZzL2RhdGEuYyB8IDI1ICsrKysrKysrKysrKysrKysr
KysrKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiBp
bmRleCA5ZTRkYjZmMDUwOGEuLmEyMTBhN2E2MjdjNiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2Rh
dGEuYwo+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gQEAgLTE2MzcsOCArMTYzNywyNiBAQCBpbnQg
ZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9ibG9j
a3MgKm1hcCwgaW50IGZsYWcpCj4gIAlsZnNfZGlvX3dyaXRlID0gKGZsYWcgPT0gRjJGU19HRVRf
QkxPQ0tfRElPICYmIGYyZnNfbGZzX21vZGUoc2JpKSAmJgo+ICAJCQkJbWFwLT5tX21heV9jcmVh
dGUpOwo+ICAKPiAtCWlmICghbWFwLT5tX21heV9jcmVhdGUgJiYgZjJmc19tYXBfYmxvY2tzX2Nh
Y2hlZChpbm9kZSwgbWFwLCBmbGFnKSkKPiAtCQlnb3RvIG91dDsKPiArCWlmICghbWFwLT5tX21h
eV9jcmVhdGUgJiYgZjJmc19tYXBfYmxvY2tzX2NhY2hlZChpbm9kZSwgbWFwLCBmbGFnKSkgewo+
ICsJCXN0cnVjdCBleHRlbnRfaW5mbyBlaTsKPiArCj4gKwkJLyoKPiArCQkgKiAxLiBJZiBtYXAt
Pm1fbXVsdGlkZXZfZGlvIGlzIHRydWUsIG1hcC0+bV9wYmxrIGNhbm5vdCBiZQo+ICsJCSAqIHdh
aXR0ZWQgYnkgZjJmc193YWl0X29uX2Jsb2NrX3dyaXRlYmFja19yYW5nZSgpIGFuZCBhcmUgbm90
Cj4gKwkJICogbWVyZ2VhYmxlLgo+ICsJCSAqIDIuIElmIHBnb2ZzIGhpdHMgdGhlIHJlYWQgZXh0
ZW50IGNhY2hlLCBpdCBtZWFucyB0aGUgbWFwcGluZwo+ICsJCSAqIGlzIGFscmVhZHkgY2FjaGVk
IGluIHRoZSBleHRlbnQgY2FjaGUsIGJ1dCBpdCBpcyBub3QKPiArCQkgKiBtZXJnZWFibGUsIGFu
ZCB0aGVyZSBpcyBubyBuZWVkIHRvIHF1ZXJ5IHRoZSBtYXBwaW5nIGFnYWluCj4gKwkJICogdmlh
IGYyZnNfZ2V0X2Rub2RlX29mX2RhdGEoKS4KPiArCQkgKi8KPiArCQlwZ29mcyA9CShwZ29mZl90
KW1hcC0+bV9sYmxrICsgbWFwLT5tX2xlbjsKPiArCQlpZiAobWFwLT5tX2xlbiA9PSBtYXhibG9j
a3MgfHwKPiArCQkJbWFwLT5tX211bHRpZGV2X2RpbyB8fAo+ICsJCQlmMmZzX2xvb2t1cF9yZWFk
X2V4dGVudF9jYWNoZShpbm9kZSwgcGdvZnMsICZlaSkpCj4gKwkJCWdvdG8gb3V0Owo+ICsJCW9m
cyA9IG1hcC0+bV9sZW47Cj4gKwkJZ290byBtYXBfbW9yZTsKPiArCX0KPiAgCj4gIAltYXAtPm1f
YmRldiA9IGlub2RlLT5pX3NiLT5zX2JkZXY7Cj4gIAltYXAtPm1fbXVsdGlkZXZfZGlvID0KPiBA
QCAtMTY0OSw3ICsxNjY3LDggQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlu
b2RlLCBzdHJ1Y3QgZjJmc19tYXBfYmxvY2tzICptYXAsIGludCBmbGFnKQo+ICAKPiAgCS8qIGl0
IG9ubHkgc3VwcG9ydHMgYmxvY2sgc2l6ZSA9PSBwYWdlIHNpemUgKi8KPiAgCXBnb2ZzID0JKHBn
b2ZmX3QpbWFwLT5tX2xibGs7Cj4gLQllbmQgPSBwZ29mcyArIG1heGJsb2NrczsKPiArbWFwX21v
cmU6Cj4gKwllbmQgPSAocGdvZmZfdCltYXAtPm1fbGJsayArIG1heGJsb2NrczsKPiAgCj4gIAlp
ZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19QUkVDQUNIRSkKPiAgCQltb2RlID0gTE9PS1VQX05P
REVfUkE7CgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
