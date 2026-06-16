Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id d8eRDxbEMGrKXAUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:33:42 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B868BB59
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 05:33:41 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=lHF9LCdT;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Evv7fzGx;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=CgzOttY9;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Of68jNtw;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gD6UekMhCMWuTZbJ6UBieTVY/io3jS82dlWITvROM4s=; b=lHF9LCdT86t5hrDbOlxtjPMefk
	XB9GDQVqAXsQsCShCvHPX2xVwGYSxyBJwf10GclwSxMaYRo9P2Uou/T4UbvtEagmsexsqTUDGpekt
	1A/HgbluA1K2uP8jpF8OVKW+wREc06SDbZ/f3oyxsJu8vz0CBZMAWPJCnSJl1EYXgNGY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZKYT-0005ZH-E4;
	Tue, 16 Jun 2026 03:33:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wZKYR-0005ZB-N0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:33:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rXV1AfD2VPtL1VYvZN3tbd31ULGRpvq9A/rjFnaZQCk=; b=Evv7fzGx8psGk2jOoDjKf0sTPE
 Dmh0Uprm8nl39pGY3oJUV5RP48im0vITHHQtP0GZ5STf/E/tVYnorXJlWOox5mAHvdv6fFz22QG1Z
 pXJHI9T9C7bVUUZHPOjyzfkWqrWF2h730rrhAQtbFx/A1J+eWNkc742h4bpT+rBUfTNY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rXV1AfD2VPtL1VYvZN3tbd31ULGRpvq9A/rjFnaZQCk=; b=CgzOttY9IAfTnNDu/CKOvHlq+d
 1nURqEm0iaZ1j/arP4So5eVLZaqOIBIg/B2ZcTvgkySP+Daq5ndhs3Q5z5/LsdLWv7D6x+uIHeywg
 Ar4vWsZDTUUdLhdNWZB/nzAx77YWoz5CXhhHP2tds0Y2Nz5/y94x7mm7V2JlhGbqTzSA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZKYQ-0005cT-9z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 03:33:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 355B9600AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 03:33:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158421F000E9;
 Tue, 16 Jun 2026 03:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781580803;
 bh=rXV1AfD2VPtL1VYvZN3tbd31ULGRpvq9A/rjFnaZQCk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=Of68jNtw+7/IOaFSkEtAcCT57lPE6wFWl/ekIjgOiXi5k55ooZCfxeFLIvMCOUax/
 8Z6TqidXKr8+QkxuBOTHLZlqwQVJnHE3qznhttqL2eM2lfBeTTqahaNziUwtNonyVx
 Myin48MF6HvBT2t9tgmMpUNsYUh+mEghRBFk1dEkx6i4TEwblOQ7tF2dxOfCbKN3ug
 EYi3nUd4y5MnuGLY02afgv1ZkVBwZd0etMmQYWLJ5qZrEAGxuTqESaxZkYv/k9ED6y
 9ZarG87VRZ7+cZXQ42+cW9HXXNT+7oaeh1QtBaqWZGG6ZDCwsy3FKucmI3HKIRwoPK
 RSRhzttVli0xA==
Message-ID: <e4a31590-e173-4f43-8d70-16e83bd52bed@kernel.org>
Date: Tue, 16 Jun 2026 11:33:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: fstests@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20260612005802.3017709-1-chao@kernel.org>
 <ai7YFkAK8sBL4jXm@zlang-mailbox>
 <b32998c0-17e3-4b81-a474-4a408aa7fa32@kernel.org>
 <ajBZEtrLmRZt0AA1@zlang-mailbox>
Content-Language: en-US
In-Reply-To: <ajBZEtrLmRZt0AA1@zlang-mailbox>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/16/26 04:05, Zorro Lang wrote: > On Mon, Jun 15, 2026
 at 04:22:34PM +0800, Chao Yu wrote: >> On 6/15/26 01:16, Zorro Lang wrote:
 >>> On Fri, Jun 12, 2026 at 12:58:02AM +0000, Chao Yu wrote: >>>> [...] 
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
X-Headers-End: 1wZKYQ-0005cT-9z
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:fstests@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 5F9B868BB59

T24gNi8xNi8yNiAwNDowNSwgWm9ycm8gTGFuZyB3cm90ZToKPiBPbiBNb24sIEp1biAxNSwgMjAy
NiBhdCAwNDoyMjozNFBNICswODAwLCBDaGFvIFl1IHdyb3RlOgo+PiBPbiA2LzE1LzI2IDAxOjE2
LCBab3JybyBMYW5nIHdyb3RlOgo+Pj4gT24gRnJpLCBKdW4gMTIsIDIwMjYgYXQgMTI6NTg6MDJB
TSArMDAwMCwgQ2hhbyBZdSB3cm90ZToKPj4+PiBXaXRob3V0IGNvbW1pdCA1MjA3NjBiOWY5MTUg
KCJmMmZzOiBvcHRpbWl6ZSByZXByZXNlbnRhdGl2ZSB0eXBlIGRldGVybWluYXRpb24KPj4+PiBp
biBHQyIpLCBmMmZzIEdDIHdpbGwgcmVwb3J0IGluY29uc2lzdGVudCBzZWdtZW50IHR5cGUgaW4g
bGFyZ2Ugc2VjdGlvbiBpc3N1ZSwKPj4+PiBhbmQgdGhlbiBpdCB3aWxsIGZvcmNlIHRvIHNodXRk
b3duIGZpbGVzeXN0ZW0uCj4+Pj4KPj4+PiBbICA3NjguMTkwOTAzXSBGMkZTLWZzIChsb29wNTEp
OiBJbmNvbnNpc3RlbnQgc2VnbWVudCAoMykgdHlwZSBbMSwgMF0gaW4gU0lUIGFuZCBTU0EKPj4+
Pgo+Pj4+IFRoZSByZWFzb24gaXMgZjJmcyBrZXJuZWwgd2lsbCBhc3N1bWUgYWxsIHNlZ21lbnQg
dHlwZSBpbnNpZGUgbGFyZ2Ugc2VjdGlvbiBpcwo+Pj4+IHRoZSBzYW1lLCBkdXJpbmcgR0MgaXQg
bG9hZHMgdHlwZSBmcm9tIG9uZSBzZWdtZW50IGFuZCBjb21wYXJlIGl0IHRvIG90aGVyCj4+Pj4g
c2VnbWVudHMnIHR5cGUsIGhvd2V2ZXIgZHVlIHRvIHJlY292ZXJ5IGZsb3csIHRoZSBjaG9zZW4g
c2VnbWVudCBtYXkgaGFzIHplcm8KPj4+PiB2YWxpZCBibG9ja3Mgdy8gZGlmZmVyZW50IHNlZ21l
bnQgdHlwZSwgc2luY2UgdGhlIHNlZ21lbnQgaXMgaW52YWxpZChmcmVlKSBvbmUsCj4+Pj4gaXQg
d2lsbCBuZXZlciBiZSBtaWdyYXRlZCwgc28gdGhhdCB3ZSBzaG91bGQgbm90IHRyZWF0IHN1Y2gg
c3RhdGUgYXMgYWJub3JtYWwKPj4+PiBjb25kaXRpb24uCj4+Pj4KPj4+PiBUaGlzIHRlc3RjYXNl
IGlzIGNyZWF0ZWQgdG8gc2ltdWxhdGUgYWJvdmUgY29uZGl0aW9uIHRvIHNlZSB3aGV0aGVyIGYy
ZnMga2VybmVsCj4+Pj4gbW9kdWxlIGNhbiBoYW5kbGUgaXQgY29ycmVjdGx5Cj4+Pj4KPj4+PiBT
aWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4gLS0tCj4+Pj4gdjI6
Cj4+Pj4gLSBjbGVhciBNS0ZTX09QVElPTlMgYW5kIE1PVU5UX09QVElPTlMgdG8gZ3VhcmFudGVl
IGJsb2NrIGFsbG9jYXRpb24gaXMgYXMgZXhwZWN0ZWQuCj4+Pgo+Pj4gSGkgQ2hhbywKPj4+Cj4+
PiBTb3JyeSwgSSBqdXN0IG5vdGljZWQgeW91ciByZXBseSB0byBteSByZXZpZXcgb24gdGhlIHBy
ZXZpb3VzIHBhdGNoIHZlcnNpb24uCj4+PiBEdWUgdG8gc29tZSB1bmV4cGVjdGVkIHNoYWtlLXVw
cyByZWNlbnRseSwgSeKAmXZlIGJlZW4gYm9nZ2VkIGRvd24gd2l0aCBzZXR0aW5nCj4+PiB1cCBh
bmQgbW9kaWZ5aW5nIHZhcmlvdXMgbmV3IHN5c3RlbSBlbnZpcm9ubWVudHMsIGFuZCBJIGFjY2lk
ZW50YWxseSBtYXJrZWQKPj4+IHNvbWUgdW5yZWFkIGVtYWlscyBhcyByZWFkLgo+Pgo+PiBObyB3
b3JyaWVzLiA6KQo+Pgo+Pj4KPj4+IFRoZSBwYXRjaCBsb29rcyBnb29kIHRvIG1lLCB3aXRoIGp1
c3QgYSBmZXcgcGlja3kgcmV2aWV3IHBvaW50cyBiZWxvdzoKPj4KPj4gVGhhbmtzIFpvcnJvIGZv
ciB0YWtpbmcgYSBsb29rLgo+Pgo+Pj4KPj4+PiAgdGVzdHMvZjJmcy8wMjUgICAgIHwgOTIgKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Pj4+ICB0ZXN0cy9m
MmZzLzAyNS5vdXQgfCAgMiArCj4+Pj4gIDIgZmlsZXMgY2hhbmdlZCwgOTQgaW5zZXJ0aW9ucygr
KQo+Pj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZjJmcy8wMjUKPj4+PiAgY3JlYXRlIG1v
ZGUgMTAwNjQ0IHRlc3RzL2YyZnMvMDI1Lm91dAo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL3Rlc3Rz
L2YyZnMvMDI1IGIvdGVzdHMvZjJmcy8wMjUKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+
IGluZGV4IDAwMDAwMDAwMC4uMzk3ZTU0MzlhCj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBi
L3Rlc3RzL2YyZnMvMDI1Cj4+Pj4gQEAgLTAsMCArMSw5MiBAQAo+Pj4+ICsjISAvYmluL2Jhc2gK
Pj4+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+Pj4+ICsjIENvcHlyaWdo
dCAoYykgMjAyNiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4gKyMKPj4+PiArIyBGUyBR
QSBUZXN0IE5vLiBmMmZzLzAyNQo+Pj4+ICsjCj4+Pj4gKyMgQ2hlY2sgd2hldGhlciBmMmZzIHdp
bGwgZW5jb3VudGVyIGNwX2Vycm9yIChJbmNvbnNpc3RlbnQgc2VnbWVudCB0eXBlKQo+Pj4+ICsj
IHdoZW4gZG9pbmcgc2FuaXR5IGNoZWNrIG9uIHR5cGUgb2Ygc2VnbWVudHMgaW5zaWRlIGxhcmdl
IHNlY3Rpb24gZHVyaW5nCj4+Pj4gKyMgZ2FyYmFnZSBjb2xsZWN0aW9uLgo+Pj4+ICsjCj4+Pj4g
Ky4gLi9jb21tb24vcHJlYW1ibGUKPj4+PiArX2JlZ2luX2ZzdGVzdCBhdXRvIHF1aWNrCj4+Pj4g
Kwo+Pj4+ICtfZml4ZWRfYnlfa2VybmVsX2NvbW1pdCA1MjA3NjBiOWY5MTUgXAo+Pj4+ICsJImYy
ZnM6IG9wdGltaXplIHJlcHJlc2VudGF0aXZlIHR5cGUgZGV0ZXJtaW5hdGlvbiBpbiBHQyIKPj4+
PiArCj4+Pj4gKy4gLi9jb21tb24vZmlsdGVyCj4+Pj4gKwo+Pj4+ICtfY2xlYW51cCgpCj4+Pj4g
K3sKPj4+PiArCWNkIC8KPj4+PiArCXJtIC1yIC1mICR0bXAuKgo+Pj4+ICt9Cj4+Pgo+Pj4gVGhp
cyBfY2xlYW51cCgpIGZ1bmN0aW9uIGlzIHNhbWUgYXMgZGVmYXVsdC4gSXQgY2FuIGJlIHJlbW92
ZWQuCj4+Cj4+IFdpbGwgcmVtb3ZlLgo+Pgo+Pj4KPj4+PiArCj4+Pj4gK19yZXF1aXJlX3NjcmF0
Y2gKPj4+PiArX3JlcXVpcmVfeGZzX2lvX2NvbW1hbmQgInB3cml0ZSIKPj4+PiArX3JlcXVpcmVf
eGZzX2lvX2NvbW1hbmQgInRydW5jYXRlIgo+Pj4+ICtfcmVxdWlyZV9jb21tYW5kICIkRjJGU19J
T19QUk9HIiBmMmZzX2lvCj4+Pj4gK19yZXF1aXJlX2NoZWNrX2RtZXNnCj4+Pj4gKwo+Pj4+ICsj
IENsZWFyIG9wdGlvbnMgdG8gYXZvaWQgaW50ZXJmZXJlbmNlIGZyb20gZXh0ZXJuYWwgY29uZmln
dXJhdGlvbnMKPj4+PiArZXhwb3J0IE1LRlNfT1BUSU9OUz0iIgo+Pj4+ICtleHBvcnQgTU9VTlRf
T1BUSU9OUz0iIgo+Pj4+ICsKPj4+PiArIyBGb3JtYXQgd2l0aCA5Nk1CIHNpemUgYW5kIDIgc2Vn
bWVudHMgcGVyIHNlY3Rpb24KPj4+PiArX3NjcmF0Y2hfbWtmc19zaXplZCAkKCg5NiAqIDEwMjQg
KiAxMDI0KSkgIiIgIi1zIDIiID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4+Pj4gKwo+Pj4+ICsjIE1v
dW50IHdpdGggbW9kZT1sZnMKPj4+PiArX3NjcmF0Y2hfbW91bnQgLW8gbW9kZT1sZnMgPj4gJHNl
cXJlcy5mdWxsIDI+JjEKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5e
Xl5eXl5eXl5eXl5eCj4+PiBJdCdzIGhlbHBsZXNzLCBkdWUgdG8gaWYgX3NjcmF0Y2hfbW91bnQg
ZmFpbHMsIGl0IGV4aXQoKSBkaXJlY3RseS4KPj4KPj4gUmlnaHQsIHdpbGwgZml4Lgo+Pgo+Pj4K
Pj4+PiArCj4+Pj4gKyMgQ3JlYXRlIGZpbGVzIHRvIGZpbGwgd2hvbGUgZmlsZXN5c3RlbSwgdGhl
biBzZWdtZW50IHR5cGUgd2lsbCBiZSBjaGFuZ2VkIHRvIG5vZGUgdHlwZQo+Pj4+ICtmb3IgKChp
PTA7aTw1MTIwO2krKykpIGRvCj4+Pj4gKwl0b3VjaCAkU0NSQVRDSF9NTlQvJGkgPj4gJHNlcXJl
cy5mdWxsIDI+JjEKPj4+PiArZG9uZQo+Pj4+ICtzeW5jCj4+Pj4gKwo+Pj4+ICsjIFJlbW92ZSBh
bGwgZmlsZXMgdG8gY3JlYXRlIGZyZWUoZW1wdHkpIG5vZGUgc2VnbWVudHMKPj4+PiArcm0gLWYg
JFNDUkFUQ0hfTU5ULyoKPj4+PiArc3luYwo+Pj4+ICsKPj4+PiArIyBBbGxvY2F0ZSBmcmVlIHNw
YWNlIHNvIHRoYXQgd2UgaGF2ZSBjaGFuY2UgdG8gcmV1c2UgZnJlZShlbXB0eSkgbm9kZSBzZWdt
ZW50cwo+Pj4+ICskWEZTX0lPX1BST0cgLWYgLWMgInB3cml0ZSAtYiA0ayAwIDE5MjhrIiAkU0NS
QVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+Pj4+ICtzeW5jCj4+Pj4gKwo+Pj4+
ICskWEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFy
ZXMuZnVsbCAyPiYxCj4+Pj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1iIDRrIDAgMTZN
IiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+Pj4+ICskWEZTX0lPX1BS
T0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYx
Cj4+Pj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1iIDRrIDAgMTZNIiAkU0NSQVRDSF9N
TlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+Pj4+ICskWEZTX0lPX1BST0cgLWMgInRydW5j
YXRlIDAiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4+Pj4gK3N5bmMK
Pj4+PiArCj4+Pj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1iIDRrIDAgOE0iICRTQ1JB
VENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4+Pj4gKyRYRlNfSU9fUFJPRyAtYyAi
dHJ1bmNhdGUgMCIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPj4+PiAr
JFhGU19JT19QUk9HIC1kIC1jICJwd3JpdGUgLWIgNGsgMCAzMksiICRTQ1JBVENIX01OVC9maWxl
ID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4+Pj4gKyRYRlNfSU9fUFJPRyAtYyAidHJ1bmNhdGUgMCIg
JFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPj4+PiArJFhGU19JT19QUk9H
IC1kIC1jICJwd3JpdGUgLWIgNGsgMCAyTSIgLWMgImZzeW5jIiAkU0NSQVRDSF9NTlQvZmlsZSA+
PiAkc2VxcmVzLmZ1bGwgMj4mMQo+Pj4+ICsKPj4+PiArIyBTaHV0ZG93biB0aGUgZmlsZXN5c3Rl
bSB3aXRob3V0IGNoZWNrcG9pbnQKPj4+PiArJEYyRlNfSU9fUFJPRyBzaHV0ZG93biAyICRTQ1JB
VENIX01OVCA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+Pj4KPj4+IEknbSB3b25kZXJpbmcgaWYgd2Ug
Y2FuIGhhdmUgZjJmcyBzdXBwb3J0aW5nIGluIGNvbW1vbiBfc2NyYXRjaF9zaHV0ZG93bgo+Pj4g
aGVscGVyIDopCj4+Cj4+IEkgdGhpbmsgd2UgY2FuIGNoYW5nZSBmMmZzIHRlc3RjYXNlIHRvIHVz
ZSBfc2NyYXRjaF9zaHV0ZG93biBiZWNhdXNlIHRoZSBkZWZpbml0aW9uIG9mCj4+IG5vbG9nZmx1
c2ggc2h1dGRvd24gaW50ZXJmYWNlIGlzIHRoZSBzYW1lIGFzIHhmcyc6Cj4+Cj4+IC8qCj4+ICAq
IHNob3VsZCBiZSBzYW1lIGFzIFhGU19JT0NfR09JTkdET1dOLgo+PiAgKiBGbGFncyBmb3IgZ29p
bmcgZG93biBvcGVyYXRpb24gdXNlZCBieSBGU19JT0NfR09JTkdET1dOCj4+ICAqLwo+PiAjZGVm
aW5lIEYyRlNfSU9DX1NIVVRET1dOCV9JT1IoJ1gnLCAxMjUsIF9fdTMyKQkvKiBTaHV0ZG93biAq
Lwo+PiAjZGVmaW5lIEYyRlNfR09JTkdfRE9XTl9OT1NZTkMJCTB4MgkvKiBnb2luZyBkb3duICov
Cj4+Cj4+ICNkZWZpbmUgWEZTX0lPQ19HT0lOR0RPV04JICAgICBfSU9SICgnWCcsIDEyNSwgdWlu
dDMyX3QpCj4+ICNkZWZpbmUgWEZTX0ZTT1BfR09JTkdfRkxBR1NfTk9MT0dGTFVTSAkJMHgyCS8q
IGRvbid0IGZsdXNoIGxvZyBub3IgZGF0YSAqLwo+Pgo+Pj4KPj4+PiArCj4+Pj4gK19zY3JhdGNo
X3VubW91bnQgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPj4+ICAgICAgICAgICAgICAgICAgICAgXl5e
Xl5eXl5eXl5eXl5eXl5eXl4KPj4+Cj4+PiBJZiB1bm1vdW50IGZhaWxzLCBob3cgYWJvdXQgbGV0
IGl0IG91dHB1dCB0aGUgZXJyb3JzLCB0byBicmVhayB0aGUgZ29sZGVuIGltYWdlPwo+Pgo+PiBZ
ZXMsIGl0J3MgYmV0dGVyLgo+Pgo+Pj4KPj4+PiArCj4+Pj4gK19zY3JhdGNoX21vdW50IC1vIG1v
ZGU9bGZzID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXgo+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgaGVscGxlc3MKPj4KPj4gV2lsbCBmaXguCj4+Cj4+Pgo+Pj4+ICsKPj4+PiArIyBSdW4gdXJn
ZW50X2djIG1vZGUgdG8gdHJpZ2dlciBnYXJiYWdlIGNvbGxlY3Rpb24KPj4+PiArZGV2X25hbWU9
JChfc2hvcnRfZGV2ICRTQ1JBVENIX0RFVikKPj4+PiAraWYgWyAtZiAvc3lzL2ZzL2YyZnMvJGRl
dl9uYW1lL2djX3VyZ2VudCBdOyB0aGVuCj4+Pj4gKwllY2hvIDEgPiAvc3lzL2ZzL2YyZnMvJGRl
dl9uYW1lL2djX3VyZ2VudAo+Pj4+ICtmaQo+Pj4KPj4+IEhtbS4uLiB3aGF0IGlmIHRoZXJlJ3Mg
bm90IC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50PyBEb2VzIGl0Cj4+PiBhZmZlY3Qg
dGhlIHRlc3QgcmVzdWx0Pwo+Pj4KPj4+IElmIGl0IGRvZXMsIHRoaXMncyBhIG5lY2Vzc2FyeSBy
ZXF1aXJlbWVudCBmb3IgdGhpcyB0ZXN0LCB3ZSBzaG91bGRuJ3QKPj4+IGlnbm9yZSBpdCBhbmQg
a2VlcCBydW5uaW5nLiBEb2VzICRGMkZTX0lPX1BST0cgcHJvdmlkZSBhIGNvbW1hbmQgdG8KPj4+
IG1ha2UgYSBmb3JjZSBHQz8gT3Igd2UgbmVlZCB0byBjaGVjayB0aGlzIGZpbGUgYW5kIF9ub3Ry
dW4gaWYgaXQncwo+Pj4gbm90IGV4aXN0ZWQuCj4+Cj4+IEFoLCByaWdodCwgdGhhdCdzIGdvb2Qg
cG9pbnQhCj4+Cj4+IFdlIGNhbiB1c2UgIiRGMkZTX0lPX1BST0cgZ2NfdXJnZW50IDxkZXZfbmFt
ZT4gcnVuIDUiIGluc3RlYWQsIGl0IHdpbGwgZG8gYmVsb3cgY29tbWFuZHM6Cj4gCj4gR3JlYXQs
IEkganVzdCBob3BlIHRoZSAqZ2NfdXJnZW50KiBpc24ndCBhIG5ldyBmZWF0dXJlIHdoaWNoIG5l
ZWRzIHNvbWV0aGluZyBsaWtlczoKCkkgZ3Vlc3MgaXQncyBub3QgYSBuZXcgc3ViY29tbWFuZCBm
b3IgZjJmc19pbywKCmNvbW1pdCAyMmQ3NThlMmU2YWYyMTBkYzllNmNkZjk5NDM4ZjA2MzM4M2Jh
NzJmCkF1dGhvcjogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KRGF0ZTogICBUdWUg
RmViIDE5IDE5OjA3OjIxIDIwMTkgLTA4MDAKCiAgICBmMmZzX2lvOiBhZGQgZ2NfdXJnZW50Cgog
ICAgZS5nLiwKICAgIGYyZnNfaW8gZ2NfdXJnZW50IGRtLTQgW3N0YXJ0L2VuZC9ydW5dIFt0aW1l
IGluIHNlY10KCiAgICBUaGlzIGNvbnRyb2xzIHN5c2ZzL2djX3VyZ2VudCB0byBydW4gZjJmc19n
YyB1cmdlbnRseS4KCiAgICBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJu
ZWwub3JnPgoKPiBgX3JlcXVpcmVfZjJmc19pbyBnY191cmdlbnRgICh0aGVyZSdzIG5vdCBfcmVx
dWlyZV9mMmZzX2lvOikKCkFncmVlZCwgd2UgbmVlZCB0byBpbnRyb2R1Y2UgX3JlcXVpcmVfZjJm
c19pbygpLCBsZXQgbWUgd29yayBvbiB0aGlzLgoKPiAKPj4gMS4gZWNobyAxID4gL3N5cy9mcy9m
MmZzLyRkZXZfbmFtZS9nY191cmdlbnQKPj4gMi4gc2xlZXAgNSBzZWNvbmRzCj4+IDMuIGVjaG8g
MCA+IC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50Cj4gCj4gSXQgYWxzbyBkZXBlbmRz
IG9uIHRoZSAvc3lzL2ZzL2YyZnMvJGRldl9uYW1lL2djX3VyZ2VudCB0b28uIFNvIHdlIGhhdmUg
dG8gZmFjZQo+IHRoZSBzYW1lIHF1ZXN0aW9uOgo+ICAgSWYgdGhpcyBmaWxlIGRvZXNuJ3QgZXhp
c3QsIHNob3VsZCB0aGlzIHRlc3QgY2FzZSBfbm90cnVuPwoKT2gsIHJpZ2h0LCBtYXliZSB3ZSBj
YW4gaW50cm9kdWNlIF9yZXF1aXJlX2YyZnNfc3lzZnMoKSB0byBjaGVjayB3aGV0aGVyIGYyZnMg
a2VybmVsCm1vZHVsZSBoYXMgc3VwcG9ydGVkIHRhcmdldCBzeXNmcyBub2RlPwoKVGhhbmtzLAoK
PiAKPiBUaGFua3MsCj4gWm9ycm8KPiAKPj4KPj4+Cj4+Pj4gKwo+Pj4+ICsjIFdhaXQgYmFja2dy
b3VuZCBHQyB0aHJlYWQgdG8gd2FrZSB1cCB0byBydW4gYW5kIHBvdGVudGlhbGx5IGVuY291bnRl
ciB0aGUgaW5jb25zaXN0ZW5jeQo+Pj4+ICtzbGVlcCA1Cj4+Pgo+Pj4gRG9lcyB0aGlzIHNsZWVw
IHRyeSB0byB3YWl0IGFib3ZlICJlY2hvIDEgPiAvc3lzL2ZzL2YyZnMvJGRldl9uYW1lL2djX3Vy
Z2VudCI/Cj4+PiBJZiBzbywgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBtb3ZlIGl0IGludG8gdGhl
ICJpZi10aGVuIiBsb2dpYy4KPj4+Cj4+Pj4gKwo+Pj4+ICtfc2NyYXRjaF91bm1vdW50ID4+ICRz
ZXFyZXMuZnVsbCAyPiYxCj4+PiAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5e
Xl5eCj4+PiBTYW1lIGFzIGFib3ZlLgo+Pgo+PiBXaWxsIGZpeC4KPj4KPj4+Cj4+Pj4gKwo+Pj4+
ICsjIENoZWNrIHdoZXRoZXIgdGhlIGRtZXNnIGhhcyB0aGUgd2FybmluZyBpbmRpY2F0aW5nIHRo
ZSBidWcKPj4+PiArX2NoZWNrX2RtZXNnX2ZvciAiRjJGUy1mcyBcKCRkZXZfbmFtZVwpOiBJbmNv
bnNpc3RlbnQgc2VnbWVudCIgJiYgXAo+Pj4+ICsJX2ZhaWwgIkYyRlMtZnMgKCRkZXZfbmFtZSk6
IEluY29uc2lzdGVudCBzZWdtZW50IHR5cGUgZGV0ZWN0ZWQgaW4gZG1lc2chIgo+Pj4+ICsKPj4+
PiArZWNobyAiU2lsZW5jZSBpcyBnb2xkZW4iCj4+Pj4gK3N0YXR1cz0wCj4+Pj4gK2V4aXQKPj4+
Cj4+PiBXZSd2ZSByZXBsYWNlZCAic3RhdHVzPTA7ZXhpdDsiIHdpdGggIl9leGl0IDAiLgo+Pgo+
PiBXaWxsIGZpeC4KPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+IFpvcnJvCj4+
Pgo+Pj4+IGRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAyNS5vdXQgYi90ZXN0cy9mMmZzLzAyNS5v
dXQKPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+Pj4+IGluZGV4IDAwMDAwMDAwMC4uM2Q3MDk1
MWVmCj4+Pj4gLS0tIC9kZXYvbnVsbAo+Pj4+ICsrKyBiL3Rlc3RzL2YyZnMvMDI1Lm91dAo+Pj4+
IEBAIC0wLDAgKzEsMiBAQAo+Pj4+ICtRQSBvdXRwdXQgY3JlYXRlZCBieSAwMjUKPj4+PiArU2ls
ZW5jZSBpcyBnb2xkZW4KPj4+PiAtLSAKPj4+PiAyLjQ5LjAKPj4+Pgo+Pgo+PgoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
