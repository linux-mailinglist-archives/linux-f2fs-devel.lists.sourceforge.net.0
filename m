Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QNf4F/wjumk3SAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:03:08 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2262B59EE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 05:03:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WhPxLYAxJBq3AYCKnYcVwURqMEMPX+nHiKBxBZCm/w0=; b=ioqkpWmEKGq31+aUrCViZ4dVr8
	ZJ8cDniiLJce/GzEPGZ3MN/gFepLfXk9CY8usGqKpIe1C8TQP26p5nPptz9nZOSzFsD9AObNtR5PV
	u5wL74tNrRsIN+GU+rgDyKoyoGYRhxI3uAEKf3rqCEKb1EkfOGC0rc/s6NhxvOBoq9KE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2i7U-00033k-LH;
	Wed, 18 Mar 2026 04:02:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1w2i7T-00033Q-06
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:02:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ujNF3onNI7jpcYLHEW1PhkSvpVUTbZM3rZoYoKE6eKw=; b=PKce/4kGSJfIGAbMgJpDm7kjyY
 rYenfzRtfczG5jZmZyzKEAp2XBMVw6ZKl6ltuERQnvpOngM9ork6dN+hXqLlGNqaezGBz+3w541MU
 PWHSaIhHtoQtkz0I4YxqQi0c6GaH4YJk+7ca3G/C9qpgj2azCFaQDJceqzR4/gtYNZM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ujNF3onNI7jpcYLHEW1PhkSvpVUTbZM3rZoYoKE6eKw=; b=kv2OrzazTQ8g4IbB7dh4a1d9V/
 ZEN9gWf0h0bNGMFN5WEa/dtnty1kcnLBfUOFhY2UenyLZXlB+MMkKP5ECJGkI2a/zB3uYEqLGH6AH
 /m34EtOqASjyiyXKkLLETHndG+34QBSW26tgD8rp7xj7K0sfXoYiGp0F++TA5MYnTe3g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2i7T-00063P-6Y for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 04:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C53DC42B82;
 Wed, 18 Mar 2026 04:02:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A665CC19421;
 Wed, 18 Mar 2026 04:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1773806564;
 bh=BKatsPyY3aKXXSeiP3h6+vMW0sNigVveIkwKUJixiiI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=tUCJ5U4NJVAdVk/VQVqmwet6RpWNn8ZywfspFGVyO4omYYlSBqHThoTRFEPJdsFBl
 8LIjaHYGUCjnv46fePGxpp6MDJMqZYRv5vp244a1mA3poy+yivsopc/HgfSSXL2aO5
 6EZEmzJnPdHZLpS3ngPbqCySsl/o0rcohXia0zMUMy0qvQhn8+NO8q0eR/Nu3Dr1zm
 zQ3iM/cCOjEqiQK/rZwueiLm27Oikaw6WEDHZ37XBnnKLkbZGOw/JSJCrHTV+9c8oM
 hz4/fOrz5Wd+2LL9u66JlIzfjoFrPnd1NZsAKINPO6VaVvInxwNc4LaulshRUIjCrX
 UGyBmDo2W0iMA==
Message-ID: <97fbb139-55a8-493d-b804-c8234d86e677@kernel.org>
Date: Wed, 18 Mar 2026 12:02:39 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>
References: <20260316185954.2185806-1-daeho43@gmail.com>
 <db5de842-0833-4041-9263-2496da738567@kernel.org>
 <CACOAw_xXUqdrYt10PBJPj7JofHCkRobevnDhwW80puDnXiTW4Q@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CACOAw_xXUqdrYt10PBJPj7JofHCkRobevnDhwW80puDnXiTW4Q@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026/3/18 00:15, Daeho Jeong wrote: > On Mon, Mar 16, 2026
 at 6:56 PM Chao Yu <chao@kernel.org> wrote: >> >> On 2026/3/17 02:59, Daeho
 Jeong wrote: >>> From: Daeho Jeong <daehojeong@google.com> >>> [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w2i7T-00063P-6Y
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to freeze GC and discard
 threads quickly
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
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
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:daeho43@gmail.com,m:daehojeong@google.com,m:kernel-team@android.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
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
X-Rspamd-Queue-Id: 9F2262B59EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMjAyNi8zLzE4IDAwOjE1LCBEYWVobyBKZW9uZyB3cm90ZToKPiBPbiBNb24sIE1hciAxNiwg
MjAyNiBhdCA2OjU24oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToKPj4KPj4g
T24gMjAyNi8zLzE3IDAyOjU5LCBEYWVobyBKZW9uZyB3cm90ZToKPj4+IEZyb206IERhZWhvIEpl
b25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4+Pgo+Pj4gU3VzcGVuZCBjYW4gZmFpbCBpZiBr
ZXJuZWwgdGhyZWFkcyBkbyBub3QgZnJlZXplIGZvciBhIHdoaWxlLgo+Pj4gZjJmc19nYyBhbmQg
ZjJmc19kaXNjYXJkIHRocmVhZHMgY2FuIHBlcmZvcm0gbG9uZy1ydW5uaW5nIG9wZXJhdGlvbnMK
Pj4+IHRoYXQgcHJldmVudCB0aGVtIGZyb20gcmVhY2hpbmcgYSBmcmVlemUgcG9pbnQgaW4gYSB0
aW1lbHkgbWFubmVyLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggYWRkcyBleHBsaWNpdCBmcmVlemluZyBj
aGVja3MgaW4gdGhlIGZvbGxvd2luZyBsb2NhdGlvbnM6Cj4+PiAxLiBmMmZzX2djOiBBZGRlZCBh
IGNoZWNrIGF0IHRoZSAncmV0cnknIGxhYmVsIHRvIGV4aXQgdGhlIGxvb3AgcXVpY2tseQo+Pj4g
ICAgICBpZiBmcmVlemluZyBpcyByZXF1ZXN0ZWQsIGVzcGVjaWFsbHkgZHVyaW5nIGhlYXZ5IEdD
IHJvdW5kcy4KPj4+IDIuIF9faXNzdWVfZGlzY2FyZF9jbWQ6IEFkZGVkIGEgJ3N1c3BlbmRlZCcg
ZmxhZyB0byBicmVhayBib3RoIGlubmVyIGFuZAo+Pj4gICAgICBvdXRlciBsb29wcyBkdXJpbmcg
ZGlzY2FyZCBjb21tYW5kIGlzc3VhbmNlIGlmIGZyZWV6aW5nIGlzIGRldGVjdGVkCj4+PiAgICAg
IGFmdGVyIGF0IGxlYXN0IG9uZSBjb21tYW5kIGhhcyBiZWVuIGlzc3VlZC4KPj4+IDMuIF9faXNz
dWVfZGlzY2FyZF9jbWRfb3JkZXJseTogQWRkZWQgYSBzaW1pbGFyIGNoZWNrIGZvciBvcmRlcmx5
IGRpc2NhcmQKPj4+ICAgICAgdG8gZW5zdXJlIHJlc3BvbnNpdmVuZXNzLgo+Pj4KPj4+IFRoZXNl
IGNoZWNrcyBlbnN1cmUgdGhhdCB0aGUgdGhyZWFkcyByZWxlYXNlIGxvY2tzIHNhZmVseSBhbmQg
ZW50ZXIgdGhlCj4+PiBmcm96ZW4gc3RhdGUuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8g
SmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPj4+IC0tLQo+Pj4gdjM6IHJlbW92ZWQgdW5u
ZWNlc3Nhcnkgc3VzcGVuZGVkIGNoZWNrCj4+PiB2MjogYWRkIGZyZWV6aW5nIGNoZWNrIGluIGRv
X2dhcmJhZ2VfY29sbGVjdCgpCj4+PiAtLS0KPj4+ICAgIGZzL2YyZnMvZ2MuYyAgICAgIHwgMTAg
KysrKysrKysrKwo+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgfCAxMiArKysrKysrKysrKy0KPj4+
ICAgIDIgZmlsZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPj4+IGluZGV4IDI0
NjQ5NmZiZTVlNS4uMjMwNWYxNmNiYWJiIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9nYy5jCj4+
PiArKysgYi9mcy9mMmZzL2djLmMKPj4+IEBAIC0xODg5LDEyICsxODg5LDE4IEBAIHN0YXRpYyBp
bnQgZG9fZ2FyYmFnZV9jb2xsZWN0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tnY190eXBlXSA9
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAoY3VyX3NlZ25vICsg
MSA8IHNlY19lbmRfc2Vnbm8pID8KPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGN1cl9zZWdubyArIDEgOiBOVUxMX1NFR05POwo+Pj4gKwo+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgIGlmICh1bmxpa2VseShmcmVlemluZyhjdXJyZW50KSkpIHsKPj4+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGZvbGlvX3B1dF9yZWZzKHN1bV9mb2xpbywgMik7Cj4+PiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHN0b3A7Cj4+Cj4+IERvIHdlIG5lZWQg
dG8gcmV0dXJuIEVCVVNZIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQgdG8gaW5kaWNhdGUgR0Mgd2Fz
Cj4+IGludGVycnVwdGVkPwo+IAo+IEluIHRoZSBjYXNlIG9mIGRvX2dhcmJhZ2VfY29sbGVjdCgp
LCBpdCBpcyBvcmlnaW5hbGx5IGRlc2lnbmVkIHRvIHN0b3AgYmVmb3JlCj4gY2xlYW5pbmcgdGhl
IGVudGlyZSBzZWN0aW9uIGRlcGVuZGluZyBvbiB0aGUgbWlncmF0aW9uX3dpbmRvdyBzaXplIG9y
Cj4gem9uZWQgR0Mgb3BlcmF0aW9ucywgYW5kIGl0IHJldHVybnMgdGhlIGNvdW50IG9mIHNlZ21l
bnRzIHJlY2xhaW1lZCB1bnRpbAo+IHRoYXQgcG9pbnQuIFRoZXJlZm9yZSwgcmV0dXJuaW5nIHRo
ZSBzZWdtZW50IGNvdW50IHJlY2xhaW1lZCB1cCB0byB0aGUKPiBtb21lbnQgb2Ygc3VzcGVuc2lv
biBzZWVtcyBtb3JlIGNvbnNpc3RlbnQgd2l0aCB0aGUgZXhpc3RpbmcgYmVoYXZpb3IuCj4gSWYg
d2UgcmV0dXJuIGFuIGVycm9yIGluc3RlYWQsIHRoZSBjYWxsZXIgbWlnaHQgbWlzcyB0aGUgY291
bnQgb2Ygc2VnbWVudHMKPiB0aGF0IHdlcmUgYWN0dWFsbHkgcmVjbGFpbWVkLgoKSXQgbWFrZXMg
c2Vuc2UuCgpJbiBhZGRpdGlvbiwgSSB0aGluayBmcmVlemluZyhjdXJyZW50KSB3aWxsIG9ubHkg
YmUgdHJ1ZSBpbiBjb250ZXh0IG9mIGdjIHRocmVhZCwKZm9yIHN1Y2ggYmFja2dyb3VuZCBtaWdy
YXRpb24gY29uZGl0aW9uLCB3ZSBkb24ndCBjYXJlIHRoZSBlcnJvciBudW1iZXIuCgpUaGFua3Ms
Cgo+IAo+Pgo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIH0KPj4+ICAgICAgICAgICAgICAgIH0K
Pj4+ICAgIG5leHRfYmxvY2s6Cj4+PiAgICAgICAgICAgICAgICBmb2xpb19wdXRfcmVmcyhzdW1f
Zm9saW8sIDIpOwo+Pj4gICAgICAgICAgICAgICAgc2Vnbm8gPSBibG9ja19lbmRfc2Vnbm87Cj4+
PiAgICAgICAgfQo+Pj4KPj4+ICtzdG9wOgo+Pj4gICAgICAgIGlmIChzdWJtaXR0ZWQpCj4+PiAg
ICAgICAgICAgICAgICBmMmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGUoc2JpLCBkYXRhX3R5cGUpOwo+
Pj4KPj4+IEBAIC0xOTY4LDYgKzE5NzQsMTAgQEAgaW50IGYyZnNfZ2Moc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBzdHJ1Y3QgZjJmc19nY19jb250cm9sICpnY19jb250cm9sKQo+Pj4gICAgICAg
ICAgICAgICAgZ290byBzdG9wOwo+Pj4gICAgICAgIH0KPj4+ICAgIHJldHJ5Ogo+Pj4gKyAgICAg
aWYgKHVubGlrZWx5KGZyZWV6aW5nKGN1cnJlbnQpKSkgewo+Pj4gKyAgICAgICAgICAgICByZXQg
PSAwOwo+Pgo+PiBEaXR0by4KPiAKPiBGb3IgZjJmc19nYygpLCBpZiB3ZSByZXR1cm4gLUVCVVNZ
LCB0aGUgY2FsbGVyIG1pZ2h0IHBlcmNlaXZlIGl0IGFzIGEKPiBzaXR1YXRpb24gd2hlcmUgbm8g
bW9yZSB2aWN0aW1zCj4gY2FuIGJlIHNlbGVjdGVkLiBUaGlzIGNvdWxkIGxlYWQgdG8gYW4gaXNz
dWUgd2hlcmUgdGhlIGlkbGUgdGltZSBpcwo+IGluY29ycmVjdGx5IGV4dGVuZGVkIHVuZGVyIHRo
ZQo+ICJubyBHQyIgY29uZGl0aW9uLgo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+PiArICAgICAgICAg
ICAgIGdvdG8gc3RvcDsKPj4+ICsgICAgIH0KPj4+ICAgICAgICByZXQgPSBfX2dldF92aWN0aW0o
c2JpLCAmc2Vnbm8sIGdjX3R5cGUsIGdjX2NvbnRyb2wtPm9uZV90aW1lKTsKPj4+ICAgICAgICBp
ZiAocmV0KSB7Cj4+PiAgICAgICAgICAgICAgICAvKiBhbGxvdyB0byBzZWFyY2ggdmljdGltIGZy
b20gc2VjdGlvbnMgaGFzIHBpbm5lZCBkYXRhICovCj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9z
ZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4gaW5kZXggZTliNmQ3NzRiOTg1Li4wYzRm
YjQyNzAxODUgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4gKysrIGIvZnMv
ZjJmcy9zZWdtZW50LmMKPj4+IEBAIC0xNjA2LDYgKzE2MDYsOSBAQCBzdGF0aWMgdm9pZCBfX2lz
c3VlX2Rpc2NhcmRfY21kX29yZGVybHkoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gICAg
ICAgICAgICAgICAgaWYgKGRjLT5zdGF0ZSAhPSBEX1BSRVApCj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gbmV4dDsKPj4+Cj4+PiArICAgICAgICAgICAgIGlmICgqaXNzdWVkID4gMCAm
JiB1bmxpa2VseShmcmVlemluZyhjdXJyZW50KSkpCj4+PiArICAgICAgICAgICAgICAgICAgICAg
YnJlYWs7Cj4+PiArCj4+PiAgICAgICAgICAgICAgICBpZiAoZHBvbGljeS0+aW9fYXdhcmUgJiYg
IWlzX2lkbGUoc2JpLCBESVNDQVJEX1RJTUUpKSB7Cj4+PiAgICAgICAgICAgICAgICAgICAgICAg
IGlvX2ludGVycnVwdGVkID0gdHJ1ZTsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7
Cj4+PiBAQCAtMTY0NSw2ICsxNjQ4LDcgQEAgc3RhdGljIGludCBfX2lzc3VlX2Rpc2NhcmRfY21k
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+ICAgICAgICBzdHJ1Y3QgYmxrX3BsdWcgcGx1
ZzsKPj4+ICAgICAgICBpbnQgaSwgaXNzdWVkOwo+Pj4gICAgICAgIGJvb2wgaW9faW50ZXJydXB0
ZWQgPSBmYWxzZTsKPj4+ICsgICAgIGJvb2wgc3VzcGVuZGVkID0gZmFsc2U7Cj4+Pgo+Pj4gICAg
ICAgIGlmIChkcG9saWN5LT50aW1lb3V0KQo+Pj4gICAgICAgICAgICAgICAgZjJmc191cGRhdGVf
dGltZShzYmksIFVNT1VOVF9ESVNDQVJEX1RJTUVPVVQpOwo+Pj4gQEAgLTE2NzUsNiArMTY3OSwx
MSBAQCBzdGF0aWMgaW50IF9faXNzdWVfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLAo+Pj4gICAgICAgICAgICAgICAgbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKGRjLCB0bXAs
IHBlbmRfbGlzdCwgbGlzdCkgewo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2J1Z19v
bihzYmksIGRjLT5zdGF0ZSAhPSBEX1BSRVApOwo+Pj4KPj4+ICsgICAgICAgICAgICAgICAgICAg
ICBpZiAoaXNzdWVkID4gMCAmJiB1bmxpa2VseShmcmVlemluZyhjdXJyZW50KSkpIHsKPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN1c3BlbmRlZCA9IHRydWU7Cj4+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4+ICsgICAgICAgICAgICAgICAgICAgICB9
Cj4+PiArCj4+PiAgICAgICAgICAgICAgICAgICAgICAgIGlmIChkcG9saWN5LT50aW1lb3V0ICYm
Cj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc190aW1lX292ZXIoc2JpLCBV
TU9VTlRfRElTQ0FSRF9USU1FT1VUKSkKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBicmVhazsKPj4+IEBAIC0xNjk0LDcgKzE3MDMsOCBAQCBzdGF0aWMgaW50IF9faXNzdWVfZGlz
Y2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gICAgbmV4dDoKPj4+ICAgICAg
ICAgICAgICAgIG11dGV4X3VubG9jaygmZGNjLT5jbWRfbG9jayk7Cj4+Pgo+Pj4gLSAgICAgICAg
ICAgICBpZiAoaXNzdWVkID49IGRwb2xpY3ktPm1heF9yZXF1ZXN0cyB8fCBpb19pbnRlcnJ1cHRl
ZCkKPj4+ICsgICAgICAgICAgICAgaWYgKGlzc3VlZCA+PSBkcG9saWN5LT5tYXhfcmVxdWVzdHMg
fHwgaW9faW50ZXJydXB0ZWQgfHwKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgc3VzcGVuZGVkKQo+Pj4gICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPj4+ICAg
ICAgICB9Cj4+Pgo+PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
