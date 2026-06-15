Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id SVvuIwtbMGo0SAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 22:05:31 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFAA8689A9F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 22:05:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Tt+10D7f;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=bDwFnT5B;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=HtHBg49f;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=hNaQbMSI;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MlqW/y2UONZ+JyB2T1NvZpub+xmb3FNXsCgZteRjfMQ=; b=Tt+10D7fGd0FjponFG0gY3k5cT
	qMrzNZyG2mMcFtO82qL3kYsDsy5TsXgssha33frga8KQpe1poVNAQN1lZGacZ868XIoVdSFpSvvK9
	H0OrTLM6t3gHsCwR0S7/wWYxn3Vhb8OP+D1QSKWwdeZFo7GhHsPaTBDhqOI1Bvq5zV9Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZDYh-0007Nf-05;
	Mon, 15 Jun 2026 20:05:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1wZDYV-0007MW-QT
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 20:05:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=flt5OZVzqvECwhJj1n8rD2o3bmiyuee+0PRxFjcuIa8=; b=bDwFnT5BRgYZD6UvTNUTXlALgM
 SqkOTu733byP/KsAxU3iQAPrK0/Ac40IBN/zuUXT+9IVHf6T8th7KkV+ezRsC1HlC4nruU0uulEF4
 vkXPQ4LMIQdqIVvxr6ECT3vjxOFIp3lmpGfbmaT9Nt9ZBFSei6PHez8oNPefisAppKms=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=flt5OZVzqvECwhJj1n8rD2o3bmiyuee+0PRxFjcuIa8=; b=HtHBg49fAw7SgxXA5Yin9jjl4R
 0vvQtvO7MP48tqASfhQXeWEL2BuQVov3PoIa4Rd8Wu66lUmtXoba0O6pVLunOX6saLXhInFrF4HKz
 wpnxPHrVj5MS19zJID2npeC60BE4R6zsdwdXuv/ekUWVSF8/eGbvlwH7Du1eUi2AHPKc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZDYU-0005cB-TS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 20:05:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 889B26008A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2026 20:05:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B3071F000E9;
 Mon, 15 Jun 2026 20:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781553905;
 bh=flt5OZVzqvECwhJj1n8rD2o3bmiyuee+0PRxFjcuIa8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=hNaQbMSISh5yqrwMO0XQR6hWxcdnO0pAiWgYO5Pkw7r4azv/BTKKomMAEEh0U/a4F
 mNVDg0LtngBfQjBHYLZtowcY7GNeJMuZI00E08ihKKNvJ6LyYr9ZZTyqT8iRZb4riA
 SnkW9OGLcnajVZdJ9A2YrOlMCAf5p1JD12BkDJ633efwvc7E8/oveQXmDEee4sbegD
 PF4tsG74+8Rwbsrrzjz/ET8qqe4aGB6g5x5vSKaY+zr+5my0bFQDqC78qzi+A65SUV
 vQcQLNFut+TyQp4Ns/nbec6cjYmM3iVhQ9RAv5whvzAZpZWG+Odav2yv6069/RobR0
 rZpuSSK0YenTg==
Date: Tue, 16 Jun 2026 04:05:00 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <ajBZEtrLmRZt0AA1@zlang-mailbox>
Mail-Followup-To: Chao Yu <chao@kernel.org>, fstests@vger.kernel.org, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20260612005802.3017709-1-chao@kernel.org>
 <ai7YFkAK8sBL4jXm@zlang-mailbox>
 <b32998c0-17e3-4b81-a474-4a408aa7fa32@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b32998c0-17e3-4b81-a474-4a408aa7fa32@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 15, 2026 at 04:22:34PM +0800, Chao Yu wrote: >
 On 6/15/26 01:16, Zorro Lang wrote: > > On Fri, Jun 12, 2026 at 12:58:02AM
 +0000, Chao Yu wrote: > >> Without commit 520760b9f915 ("f2fs: opt [...] 
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
X-Headers-End: 1wZDYU-0005cB-TS
Subject: Re: [f2fs-dev] [PATCH] f2fs/025: test to do sanity check section
 type correctly in f2fs GC
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
From: Zorro Lang via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zorro Lang <zlang@kernel.org>
Cc: jaegeuk@kernel.org, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.01 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:fstests@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[zlang@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,zlang-mailbox:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BFAA8689A9F

T24gTW9uLCBKdW4gMTUsIDIwMjYgYXQgMDQ6MjI6MzRQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiBPbiA2LzE1LzI2IDAxOjE2LCBab3JybyBMYW5nIHdyb3RlOgo+ID4gT24gRnJpLCBKdW4gMTIs
IDIwMjYgYXQgMTI6NTg6MDJBTSArMDAwMCwgQ2hhbyBZdSB3cm90ZToKPiA+PiBXaXRob3V0IGNv
bW1pdCA1MjA3NjBiOWY5MTUgKCJmMmZzOiBvcHRpbWl6ZSByZXByZXNlbnRhdGl2ZSB0eXBlIGRl
dGVybWluYXRpb24KPiA+PiBpbiBHQyIpLCBmMmZzIEdDIHdpbGwgcmVwb3J0IGluY29uc2lzdGVu
dCBzZWdtZW50IHR5cGUgaW4gbGFyZ2Ugc2VjdGlvbiBpc3N1ZSwKPiA+PiBhbmQgdGhlbiBpdCB3
aWxsIGZvcmNlIHRvIHNodXRkb3duIGZpbGVzeXN0ZW0uCj4gPj4KPiA+PiBbICA3NjguMTkwOTAz
XSBGMkZTLWZzIChsb29wNTEpOiBJbmNvbnNpc3RlbnQgc2VnbWVudCAoMykgdHlwZSBbMSwgMF0g
aW4gU0lUIGFuZCBTU0EKPiA+Pgo+ID4+IFRoZSByZWFzb24gaXMgZjJmcyBrZXJuZWwgd2lsbCBh
c3N1bWUgYWxsIHNlZ21lbnQgdHlwZSBpbnNpZGUgbGFyZ2Ugc2VjdGlvbiBpcwo+ID4+IHRoZSBz
YW1lLCBkdXJpbmcgR0MgaXQgbG9hZHMgdHlwZSBmcm9tIG9uZSBzZWdtZW50IGFuZCBjb21wYXJl
IGl0IHRvIG90aGVyCj4gPj4gc2VnbWVudHMnIHR5cGUsIGhvd2V2ZXIgZHVlIHRvIHJlY292ZXJ5
IGZsb3csIHRoZSBjaG9zZW4gc2VnbWVudCBtYXkgaGFzIHplcm8KPiA+PiB2YWxpZCBibG9ja3Mg
dy8gZGlmZmVyZW50IHNlZ21lbnQgdHlwZSwgc2luY2UgdGhlIHNlZ21lbnQgaXMgaW52YWxpZChm
cmVlKSBvbmUsCj4gPj4gaXQgd2lsbCBuZXZlciBiZSBtaWdyYXRlZCwgc28gdGhhdCB3ZSBzaG91
bGQgbm90IHRyZWF0IHN1Y2ggc3RhdGUgYXMgYWJub3JtYWwKPiA+PiBjb25kaXRpb24uCj4gPj4K
PiA+PiBUaGlzIHRlc3RjYXNlIGlzIGNyZWF0ZWQgdG8gc2ltdWxhdGUgYWJvdmUgY29uZGl0aW9u
IHRvIHNlZSB3aGV0aGVyIGYyZnMga2VybmVsCj4gPj4gbW9kdWxlIGNhbiBoYW5kbGUgaXQgY29y
cmVjdGx5Cj4gPj4KPiA+PiBTaWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+
Cj4gPj4gLS0tCj4gPj4gdjI6Cj4gPj4gLSBjbGVhciBNS0ZTX09QVElPTlMgYW5kIE1PVU5UX09Q
VElPTlMgdG8gZ3VhcmFudGVlIGJsb2NrIGFsbG9jYXRpb24gaXMgYXMgZXhwZWN0ZWQuCj4gPiAK
PiA+IEhpIENoYW8sCj4gPiAKPiA+IFNvcnJ5LCBJIGp1c3Qgbm90aWNlZCB5b3VyIHJlcGx5IHRv
IG15IHJldmlldyBvbiB0aGUgcHJldmlvdXMgcGF0Y2ggdmVyc2lvbi4KPiA+IER1ZSB0byBzb21l
IHVuZXhwZWN0ZWQgc2hha2UtdXBzIHJlY2VudGx5LCBJ4oCZdmUgYmVlbiBib2dnZWQgZG93biB3
aXRoIHNldHRpbmcKPiA+IHVwIGFuZCBtb2RpZnlpbmcgdmFyaW91cyBuZXcgc3lzdGVtIGVudmly
b25tZW50cywgYW5kIEkgYWNjaWRlbnRhbGx5IG1hcmtlZAo+ID4gc29tZSB1bnJlYWQgZW1haWxz
IGFzIHJlYWQuCj4gCj4gTm8gd29ycmllcy4gOikKPiAKPiA+IAo+ID4gVGhlIHBhdGNoIGxvb2tz
IGdvb2QgdG8gbWUsIHdpdGgganVzdCBhIGZldyBwaWNreSByZXZpZXcgcG9pbnRzIGJlbG93Ogo+
IAo+IFRoYW5rcyBab3JybyBmb3IgdGFraW5nIGEgbG9vay4KPiAKPiA+IAo+ID4+ICB0ZXN0cy9m
MmZzLzAyNSAgICAgfCA5MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrCj4gPj4gIHRlc3RzL2YyZnMvMDI1Lm91dCB8ICAyICsKPiA+PiAgMiBmaWxlcyBjaGFu
Z2VkLCA5NCBpbnNlcnRpb25zKCspCj4gPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0cy9mMmZz
LzAyNQo+ID4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZjJmcy8wMjUub3V0Cj4gPj4KPiA+
PiBkaWZmIC0tZ2l0IGEvdGVzdHMvZjJmcy8wMjUgYi90ZXN0cy9mMmZzLzAyNQo+ID4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gPj4gaW5kZXggMDAwMDAwMDAwLi4zOTdlNTQzOWEKPiA+PiAtLS0g
L2Rldi9udWxsCj4gPj4gKysrIGIvdGVzdHMvZjJmcy8wMjUKPiA+PiBAQCAtMCwwICsxLDkyIEBA
Cj4gPj4gKyMhIC9iaW4vYmFzaAo+ID4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwt
Mi4wCj4gPj4gKyMgQ29weXJpZ2h0IChjKSAyMDI2IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4K
PiA+PiArIwo+ID4+ICsjIEZTIFFBIFRlc3QgTm8uIGYyZnMvMDI1Cj4gPj4gKyMKPiA+PiArIyBD
aGVjayB3aGV0aGVyIGYyZnMgd2lsbCBlbmNvdW50ZXIgY3BfZXJyb3IgKEluY29uc2lzdGVudCBz
ZWdtZW50IHR5cGUpCj4gPj4gKyMgd2hlbiBkb2luZyBzYW5pdHkgY2hlY2sgb24gdHlwZSBvZiBz
ZWdtZW50cyBpbnNpZGUgbGFyZ2Ugc2VjdGlvbiBkdXJpbmcKPiA+PiArIyBnYXJiYWdlIGNvbGxl
Y3Rpb24uCj4gPj4gKyMKPiA+PiArLiAuL2NvbW1vbi9wcmVhbWJsZQo+ID4+ICtfYmVnaW5fZnN0
ZXN0IGF1dG8gcXVpY2sKPiA+PiArCj4gPj4gK19maXhlZF9ieV9rZXJuZWxfY29tbWl0IDUyMDc2
MGI5ZjkxNSBcCj4gPj4gKwkiZjJmczogb3B0aW1pemUgcmVwcmVzZW50YXRpdmUgdHlwZSBkZXRl
cm1pbmF0aW9uIGluIEdDIgo+ID4+ICsKPiA+PiArLiAuL2NvbW1vbi9maWx0ZXIKPiA+PiArCj4g
Pj4gK19jbGVhbnVwKCkKPiA+PiArewo+ID4+ICsJY2QgLwo+ID4+ICsJcm0gLXIgLWYgJHRtcC4q
Cj4gPj4gK30KPiA+IAo+ID4gVGhpcyBfY2xlYW51cCgpIGZ1bmN0aW9uIGlzIHNhbWUgYXMgZGVm
YXVsdC4gSXQgY2FuIGJlIHJlbW92ZWQuCj4gCj4gV2lsbCByZW1vdmUuCj4gCj4gPiAKPiA+PiAr
Cj4gPj4gK19yZXF1aXJlX3NjcmF0Y2gKPiA+PiArX3JlcXVpcmVfeGZzX2lvX2NvbW1hbmQgInB3
cml0ZSIKPiA+PiArX3JlcXVpcmVfeGZzX2lvX2NvbW1hbmQgInRydW5jYXRlIgo+ID4+ICtfcmVx
dWlyZV9jb21tYW5kICIkRjJGU19JT19QUk9HIiBmMmZzX2lvCj4gPj4gK19yZXF1aXJlX2NoZWNr
X2RtZXNnCj4gPj4gKwo+ID4+ICsjIENsZWFyIG9wdGlvbnMgdG8gYXZvaWQgaW50ZXJmZXJlbmNl
IGZyb20gZXh0ZXJuYWwgY29uZmlndXJhdGlvbnMKPiA+PiArZXhwb3J0IE1LRlNfT1BUSU9OUz0i
Igo+ID4+ICtleHBvcnQgTU9VTlRfT1BUSU9OUz0iIgo+ID4+ICsKPiA+PiArIyBGb3JtYXQgd2l0
aCA5Nk1CIHNpemUgYW5kIDIgc2VnbWVudHMgcGVyIHNlY3Rpb24KPiA+PiArX3NjcmF0Y2hfbWtm
c19zaXplZCAkKCg5NiAqIDEwMjQgKiAxMDI0KSkgIiIgIi1zIDIiID4+ICRzZXFyZXMuZnVsbCAy
PiYxCj4gPj4gKwo+ID4+ICsjIE1vdW50IHdpdGggbW9kZT1sZnMKPiA+PiArX3NjcmF0Y2hfbW91
bnQgLW8gbW9kZT1sZnMgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiA+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eCj4gPiBJdCdzIGhlbHBsZXNzLCBkdWUg
dG8gaWYgX3NjcmF0Y2hfbW91bnQgZmFpbHMsIGl0IGV4aXQoKSBkaXJlY3RseS4KPiAKPiBSaWdo
dCwgd2lsbCBmaXguCj4gCj4gPiAKPiA+PiArCj4gPj4gKyMgQ3JlYXRlIGZpbGVzIHRvIGZpbGwg
d2hvbGUgZmlsZXN5c3RlbSwgdGhlbiBzZWdtZW50IHR5cGUgd2lsbCBiZSBjaGFuZ2VkIHRvIG5v
ZGUgdHlwZQo+ID4+ICtmb3IgKChpPTA7aTw1MTIwO2krKykpIGRvCj4gPj4gKwl0b3VjaCAkU0NS
QVRDSF9NTlQvJGkgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiA+PiArZG9uZQo+ID4+ICtzeW5jCj4g
Pj4gKwo+ID4+ICsjIFJlbW92ZSBhbGwgZmlsZXMgdG8gY3JlYXRlIGZyZWUoZW1wdHkpIG5vZGUg
c2VnbWVudHMKPiA+PiArcm0gLWYgJFNDUkFUQ0hfTU5ULyoKPiA+PiArc3luYwo+ID4+ICsKPiA+
PiArIyBBbGxvY2F0ZSBmcmVlIHNwYWNlIHNvIHRoYXQgd2UgaGF2ZSBjaGFuY2UgdG8gcmV1c2Ug
ZnJlZShlbXB0eSkgbm9kZSBzZWdtZW50cwo+ID4+ICskWEZTX0lPX1BST0cgLWYgLWMgInB3cml0
ZSAtYiA0ayAwIDE5MjhrIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+
ID4+ICtzeW5jCj4gPj4gKwo+ID4+ICskWEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JB
VENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4gPj4gKyRYRlNfSU9fUFJPRyAtZCAt
YyAicHdyaXRlIC1iIDRrIDAgMTZNIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwg
Mj4mMQo+ID4+ICskWEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01OVC9maWxl
ID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4gPj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1i
IDRrIDAgMTZNIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+ICsk
WEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMu
ZnVsbCAyPiYxCj4gPj4gK3N5bmMKPiA+PiArCj4gPj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdy
aXRlIC1iIDRrIDAgOE0iICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4g
Pj4gKyRYRlNfSU9fUFJPRyAtYyAidHJ1bmNhdGUgMCIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNl
cXJlcy5mdWxsIDI+JjEKPiA+PiArJFhGU19JT19QUk9HIC1kIC1jICJwd3JpdGUgLWIgNGsgMCAz
MksiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4gPj4gKyRYRlNfSU9f
UFJPRyAtYyAidHJ1bmNhdGUgMCIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJlcy5mdWxsIDI+
JjEKPiA+PiArJFhGU19JT19QUk9HIC1kIC1jICJwd3JpdGUgLWIgNGsgMCAyTSIgLWMgImZzeW5j
IiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+ICsKPiA+PiArIyBT
aHV0ZG93biB0aGUgZmlsZXN5c3RlbSB3aXRob3V0IGNoZWNrcG9pbnQKPiA+PiArJEYyRlNfSU9f
UFJPRyBzaHV0ZG93biAyICRTQ1JBVENIX01OVCA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4gCj4g
PiBJJ20gd29uZGVyaW5nIGlmIHdlIGNhbiBoYXZlIGYyZnMgc3VwcG9ydGluZyBpbiBjb21tb24g
X3NjcmF0Y2hfc2h1dGRvd24KPiA+IGhlbHBlciA6KQo+IAo+IEkgdGhpbmsgd2UgY2FuIGNoYW5n
ZSBmMmZzIHRlc3RjYXNlIHRvIHVzZSBfc2NyYXRjaF9zaHV0ZG93biBiZWNhdXNlIHRoZSBkZWZp
bml0aW9uIG9mCj4gbm9sb2dmbHVzaCBzaHV0ZG93biBpbnRlcmZhY2UgaXMgdGhlIHNhbWUgYXMg
eGZzJzoKPiAKPiAvKgo+ICAqIHNob3VsZCBiZSBzYW1lIGFzIFhGU19JT0NfR09JTkdET1dOLgo+
ICAqIEZsYWdzIGZvciBnb2luZyBkb3duIG9wZXJhdGlvbiB1c2VkIGJ5IEZTX0lPQ19HT0lOR0RP
V04KPiAgKi8KPiAjZGVmaW5lIEYyRlNfSU9DX1NIVVRET1dOCV9JT1IoJ1gnLCAxMjUsIF9fdTMy
KQkvKiBTaHV0ZG93biAqLwo+ICNkZWZpbmUgRjJGU19HT0lOR19ET1dOX05PU1lOQwkJMHgyCS8q
IGdvaW5nIGRvd24gKi8KPiAKPiAjZGVmaW5lIFhGU19JT0NfR09JTkdET1dOCSAgICAgX0lPUiAo
J1gnLCAxMjUsIHVpbnQzMl90KQo+ICNkZWZpbmUgWEZTX0ZTT1BfR09JTkdfRkxBR1NfTk9MT0dG
TFVTSAkJMHgyCS8qIGRvbid0IGZsdXNoIGxvZyBub3IgZGF0YSAqLwo+IAo+ID4gCj4gPj4gKwo+
ID4+ICtfc2NyYXRjaF91bm1vdW50ID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4gPiAgICAgICAgICAg
ICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eCj4gPiAKPiA+IElmIHVubW91bnQgZmFpbHMs
IGhvdyBhYm91dCBsZXQgaXQgb3V0cHV0IHRoZSBlcnJvcnMsIHRvIGJyZWFrIHRoZSBnb2xkZW4g
aW1hZ2U/Cj4gCj4gWWVzLCBpdCdzIGJldHRlci4KPiAKPiA+IAo+ID4+ICsKPiA+PiArX3NjcmF0
Y2hfbW91bnQgLW8gbW9kZT1sZnMgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eCj4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBoZWxwbGVzcwo+IAo+IFdpbGwgZml4Lgo+IAo+ID4gCj4gPj4gKwo+
ID4+ICsjIFJ1biB1cmdlbnRfZ2MgbW9kZSB0byB0cmlnZ2VyIGdhcmJhZ2UgY29sbGVjdGlvbgo+
ID4+ICtkZXZfbmFtZT0kKF9zaG9ydF9kZXYgJFNDUkFUQ0hfREVWKQo+ID4+ICtpZiBbIC1mIC9z
eXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50IF07IHRoZW4KPiA+PiArCWVjaG8gMSA+IC9z
eXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50Cj4gPj4gK2ZpCj4gPiAKPiA+IEhtbS4uLiB3
aGF0IGlmIHRoZXJlJ3Mgbm90IC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50PyBEb2Vz
IGl0Cj4gPiBhZmZlY3QgdGhlIHRlc3QgcmVzdWx0Pwo+ID4gCj4gPiBJZiBpdCBkb2VzLCB0aGlz
J3MgYSBuZWNlc3NhcnkgcmVxdWlyZW1lbnQgZm9yIHRoaXMgdGVzdCwgd2Ugc2hvdWxkbid0Cj4g
PiBpZ25vcmUgaXQgYW5kIGtlZXAgcnVubmluZy4gRG9lcyAkRjJGU19JT19QUk9HIHByb3ZpZGUg
YSBjb21tYW5kIHRvCj4gPiBtYWtlIGEgZm9yY2UgR0M/IE9yIHdlIG5lZWQgdG8gY2hlY2sgdGhp
cyBmaWxlIGFuZCBfbm90cnVuIGlmIGl0J3MKPiA+IG5vdCBleGlzdGVkLgo+IAo+IEFoLCByaWdo
dCwgdGhhdCdzIGdvb2QgcG9pbnQhCj4gCj4gV2UgY2FuIHVzZSAiJEYyRlNfSU9fUFJPRyBnY191
cmdlbnQgPGRldl9uYW1lPiBydW4gNSIgaW5zdGVhZCwgaXQgd2lsbCBkbyBiZWxvdyBjb21tYW5k
czoKCkdyZWF0LCBJIGp1c3QgaG9wZSB0aGUgKmdjX3VyZ2VudCogaXNuJ3QgYSBuZXcgZmVhdHVy
ZSB3aGljaCBuZWVkcyBzb21ldGhpbmcgbGlrZXM6CmBfcmVxdWlyZV9mMmZzX2lvIGdjX3VyZ2Vu
dGAgKHRoZXJlJ3Mgbm90IF9yZXF1aXJlX2YyZnNfaW86KQoKPiAxLiBlY2hvIDEgPiAvc3lzL2Zz
L2YyZnMvJGRldl9uYW1lL2djX3VyZ2VudAo+IDIuIHNsZWVwIDUgc2Vjb25kcwo+IDMuIGVjaG8g
MCA+IC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50CgpJdCBhbHNvIGRlcGVuZHMgb24g
dGhlIC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50IHRvby4gU28gd2UgaGF2ZSB0byBm
YWNlCnRoZSBzYW1lIHF1ZXN0aW9uOgogIElmIHRoaXMgZmlsZSBkb2Vzbid0IGV4aXN0LCBzaG91
bGQgdGhpcyB0ZXN0IGNhc2UgX25vdHJ1bj8KClRoYW5rcywKWm9ycm8KCj4gCj4gPiAKPiA+PiAr
Cj4gPj4gKyMgV2FpdCBiYWNrZ3JvdW5kIEdDIHRocmVhZCB0byB3YWtlIHVwIHRvIHJ1biBhbmQg
cG90ZW50aWFsbHkgZW5jb3VudGVyIHRoZSBpbmNvbnNpc3RlbmN5Cj4gPj4gK3NsZWVwIDUKPiA+
IAo+ID4gRG9lcyB0aGlzIHNsZWVwIHRyeSB0byB3YWl0IGFib3ZlICJlY2hvIDEgPiAvc3lzL2Zz
L2YyZnMvJGRldl9uYW1lL2djX3VyZ2VudCI/Cj4gPiBJZiBzbywgaXQgbWFrZXMgbW9yZSBzZW5z
ZSB0byBtb3ZlIGl0IGludG8gdGhlICJpZi10aGVuIiBsb2dpYy4KPiA+IAo+ID4+ICsKPiA+PiAr
X3NjcmF0Y2hfdW5tb3VudCA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4gICAgICAgICAgICAgICAg
ICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXgo+ID4gU2FtZSBhcyBhYm92ZS4KPiAKPiBXaWxsIGZp
eC4KPiAKPiA+IAo+ID4+ICsKPiA+PiArIyBDaGVjayB3aGV0aGVyIHRoZSBkbWVzZyBoYXMgdGhl
IHdhcm5pbmcgaW5kaWNhdGluZyB0aGUgYnVnCj4gPj4gK19jaGVja19kbWVzZ19mb3IgIkYyRlMt
ZnMgXCgkZGV2X25hbWVcKTogSW5jb25zaXN0ZW50IHNlZ21lbnQiICYmIFwKPiA+PiArCV9mYWls
ICJGMkZTLWZzICgkZGV2X25hbWUpOiBJbmNvbnNpc3RlbnQgc2VnbWVudCB0eXBlIGRldGVjdGVk
IGluIGRtZXNnISIKPiA+PiArCj4gPj4gK2VjaG8gIlNpbGVuY2UgaXMgZ29sZGVuIgo+ID4+ICtz
dGF0dXM9MAo+ID4+ICtleGl0Cj4gPiAKPiA+IFdlJ3ZlIHJlcGxhY2VkICJzdGF0dXM9MDtleGl0
OyIgd2l0aCAiX2V4aXQgMCIuCj4gCj4gV2lsbCBmaXguCj4gCj4gVGhhbmtzLAo+IAo+ID4gCj4g
PiBUaGFua3MsCj4gPiBab3Jybwo+ID4gCj4gPj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2YyZnMvMDI1
Lm91dCBiL3Rlc3RzL2YyZnMvMDI1Lm91dAo+ID4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0Cj4gPj4g
aW5kZXggMDAwMDAwMDAwLi4zZDcwOTUxZWYKPiA+PiAtLS0gL2Rldi9udWxsCj4gPj4gKysrIGIv
dGVzdHMvZjJmcy8wMjUub3V0Cj4gPj4gQEAgLTAsMCArMSwyIEBACj4gPj4gK1FBIG91dHB1dCBj
cmVhdGVkIGJ5IDAyNQo+ID4+ICtTaWxlbmNlIGlzIGdvbGRlbgo+ID4+IC0tIAo+ID4+IDIuNDku
MAo+ID4+Cj4gCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
