Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id KPA+AhDiLmrs5gQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Jun 2026 19:17:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2452F681C29
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 14 Jun 2026 19:17:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=J7J7xsJz;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=gH6CB99K;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="fKMiF/Lc";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=Z4XAkkZ4;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3EgynXXylWdG6iUuKpy8J6nltCk0aTODOFWerGsSUw=; b=J7J7xsJzAwQ17+zz0T9DQQ28pP
	kPhIk0tVBH1peTAwgUIhw1RrHWaOmtF2u2u98MdW7ZQk6oFIQk7B/Q4J+yNUa46KXnNu/WnGuAeDu
	gy37BluDIdcc2F+cATWXOJqg6iRW1suHTXhQrMQl26RxtNOOTiw/c+uuuC78fAsnR2dg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wYoS1-0000Th-OO;
	Sun, 14 Jun 2026 17:16:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1wYoRz-0000TY-7m
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jun 2026 17:16:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RZAnhAitdy9O9O9fVyXz8ikfzogvQdFrgRNB/T3l5pA=; b=gH6CB99K+plYxGeGyPRstgmfZd
 SWEK7Snt+vIUUmBWUEp1tB6vQy4klc5hBLR4jqVy5NYAjtP7cwdlnrrDomur5b2HvjBNiH0sRu9Ca
 e8PmhK+ZaueqZepgx+Fz/5SP//UbbCg5XlWy1BNxB5QousrSeS4V/0LZKniM3ZNRouW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RZAnhAitdy9O9O9fVyXz8ikfzogvQdFrgRNB/T3l5pA=; b=fKMiF/LckbfP27xOR1UiuIPuTu
 5Ze2C/2ppQwV2Nwh4sZpMeSIFku4r5vNF4DyRoLLg6h07/KX1pkCcgyagiYWeQm5T3KRk9oQmEPC+
 1dMwxDBjpfbI1DSPI9UC5bkFBuEiBAQItqy7DQD/jAFnqsZHq60V6zVs9MCBJEMlmzs0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wYoRx-0002Cb-8X for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 14 Jun 2026 17:16:47 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 17ABE6008A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 14 Jun 2026 17:16:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873F11F000E9;
 Sun, 14 Jun 2026 17:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781457394;
 bh=RZAnhAitdy9O9O9fVyXz8ikfzogvQdFrgRNB/T3l5pA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=Z4XAkkZ4brnHI0Tn2DfbUoXO/PBddllmCBj+B1kXGdLgiPbG8PbeXcPIAoduX8uVW
 nLQb0fGcFxPV5MpwB4vrS905MEnJu1PapuNs68xvHknPF04RBnOwh/lTjjTTxharSI
 hfdpTSc7UUomhdbursv1go3P9xrt6LHVJbBgi3QgP7IScfCMiMdpOgxxQMYIrXRe15
 QNKEG6MfBtEcSTaYX31wkrXAAXFJInwMTgYBm8HN+Rs64gpTzk1tEIx+fRv3y5lkaq
 g+t0b8U9d44nJPtZyKI0RDFWk+bYZKHPG8i1oSh/UMmuJxsVhvtE9I7ttHyG7iWT9h
 ibEdf6crVRSXg==
Date: Mon, 15 Jun 2026 01:16:28 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <ai7YFkAK8sBL4jXm@zlang-mailbox>
Mail-Followup-To: Chao Yu <chao@kernel.org>, fstests@vger.kernel.org, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20260612005802.3017709-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260612005802.3017709-1-chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jun 12, 2026 at 12:58:02AM +0000, Chao Yu wrote: >
 Without commit 520760b9f915 ("f2fs: optimize representative type determination
 > in GC"), f2fs GC will report inconsistent segment type in la [...] 
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
X-Headers-End: 1wYoRx-0002Cb-8X
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2452F681C29

T24gRnJpLCBKdW4gMTIsIDIwMjYgYXQgMTI6NTg6MDJBTSArMDAwMCwgQ2hhbyBZdSB3cm90ZToK
PiBXaXRob3V0IGNvbW1pdCA1MjA3NjBiOWY5MTUgKCJmMmZzOiBvcHRpbWl6ZSByZXByZXNlbnRh
dGl2ZSB0eXBlIGRldGVybWluYXRpb24KPiBpbiBHQyIpLCBmMmZzIEdDIHdpbGwgcmVwb3J0IGlu
Y29uc2lzdGVudCBzZWdtZW50IHR5cGUgaW4gbGFyZ2Ugc2VjdGlvbiBpc3N1ZSwKPiBhbmQgdGhl
biBpdCB3aWxsIGZvcmNlIHRvIHNodXRkb3duIGZpbGVzeXN0ZW0uCj4gCj4gWyAgNzY4LjE5MDkw
M10gRjJGUy1mcyAobG9vcDUxKTogSW5jb25zaXN0ZW50IHNlZ21lbnQgKDMpIHR5cGUgWzEsIDBd
IGluIFNJVCBhbmQgU1NBCj4gCj4gVGhlIHJlYXNvbiBpcyBmMmZzIGtlcm5lbCB3aWxsIGFzc3Vt
ZSBhbGwgc2VnbWVudCB0eXBlIGluc2lkZSBsYXJnZSBzZWN0aW9uIGlzCj4gdGhlIHNhbWUsIGR1
cmluZyBHQyBpdCBsb2FkcyB0eXBlIGZyb20gb25lIHNlZ21lbnQgYW5kIGNvbXBhcmUgaXQgdG8g
b3RoZXIKPiBzZWdtZW50cycgdHlwZSwgaG93ZXZlciBkdWUgdG8gcmVjb3ZlcnkgZmxvdywgdGhl
IGNob3NlbiBzZWdtZW50IG1heSBoYXMgemVybwo+IHZhbGlkIGJsb2NrcyB3LyBkaWZmZXJlbnQg
c2VnbWVudCB0eXBlLCBzaW5jZSB0aGUgc2VnbWVudCBpcyBpbnZhbGlkKGZyZWUpIG9uZSwKPiBp
dCB3aWxsIG5ldmVyIGJlIG1pZ3JhdGVkLCBzbyB0aGF0IHdlIHNob3VsZCBub3QgdHJlYXQgc3Vj
aCBzdGF0ZSBhcyBhYm5vcm1hbAo+IGNvbmRpdGlvbi4KPiAKPiBUaGlzIHRlc3RjYXNlIGlzIGNy
ZWF0ZWQgdG8gc2ltdWxhdGUgYWJvdmUgY29uZGl0aW9uIHRvIHNlZSB3aGV0aGVyIGYyZnMga2Vy
bmVsCj4gbW9kdWxlIGNhbiBoYW5kbGUgaXQgY29ycmVjdGx5Cj4gCj4gU2lnbmVkLW9mZi1ieTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+IHYyOgo+IC0gY2xlYXIgTUtGU19PUFRJ
T05TIGFuZCBNT1VOVF9PUFRJT05TIHRvIGd1YXJhbnRlZSBibG9jayBhbGxvY2F0aW9uIGlzIGFz
IGV4cGVjdGVkLgoKSGkgQ2hhbywKClNvcnJ5LCBJIGp1c3Qgbm90aWNlZCB5b3VyIHJlcGx5IHRv
IG15IHJldmlldyBvbiB0aGUgcHJldmlvdXMgcGF0Y2ggdmVyc2lvbi4KRHVlIHRvIHNvbWUgdW5l
eHBlY3RlZCBzaGFrZS11cHMgcmVjZW50bHksIEnigJl2ZSBiZWVuIGJvZ2dlZCBkb3duIHdpdGgg
c2V0dGluZwp1cCBhbmQgbW9kaWZ5aW5nIHZhcmlvdXMgbmV3IHN5c3RlbSBlbnZpcm9ubWVudHMs
IGFuZCBJIGFjY2lkZW50YWxseSBtYXJrZWQKc29tZSB1bnJlYWQgZW1haWxzIGFzIHJlYWQuCgpU
aGUgcGF0Y2ggbG9va3MgZ29vZCB0byBtZSwgd2l0aCBqdXN0IGEgZmV3IHBpY2t5IHJldmlldyBw
b2ludHMgYmVsb3c6Cgo+ICB0ZXN0cy9mMmZzLzAyNSAgICAgfCA5MiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIHRlc3RzL2YyZnMvMDI1Lm91dCB8ICAy
ICsKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCB0ZXN0cy9mMmZzLzAyNQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdHMvZjJmcy8wMjUu
b3V0Cj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2YyZnMvMDI1IGIvdGVzdHMvZjJmcy8wMjUKPiBu
ZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uMzk3ZTU0MzlhCj4gLS0tIC9k
ZXYvbnVsbAo+ICsrKyBiL3Rlc3RzL2YyZnMvMDI1Cj4gQEAgLTAsMCArMSw5MiBAQAo+ICsjISAv
YmluL2Jhc2gKPiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ICsjIENvcHly
aWdodCAoYykgMjAyNiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gKyMKPiArIyBGUyBRQSBU
ZXN0IE5vLiBmMmZzLzAyNQo+ICsjCj4gKyMgQ2hlY2sgd2hldGhlciBmMmZzIHdpbGwgZW5jb3Vu
dGVyIGNwX2Vycm9yIChJbmNvbnNpc3RlbnQgc2VnbWVudCB0eXBlKQo+ICsjIHdoZW4gZG9pbmcg
c2FuaXR5IGNoZWNrIG9uIHR5cGUgb2Ygc2VnbWVudHMgaW5zaWRlIGxhcmdlIHNlY3Rpb24gZHVy
aW5nCj4gKyMgZ2FyYmFnZSBjb2xsZWN0aW9uLgo+ICsjCj4gKy4gLi9jb21tb24vcHJlYW1ibGUK
PiArX2JlZ2luX2ZzdGVzdCBhdXRvIHF1aWNrCj4gKwo+ICtfZml4ZWRfYnlfa2VybmVsX2NvbW1p
dCA1MjA3NjBiOWY5MTUgXAo+ICsJImYyZnM6IG9wdGltaXplIHJlcHJlc2VudGF0aXZlIHR5cGUg
ZGV0ZXJtaW5hdGlvbiBpbiBHQyIKPiArCj4gKy4gLi9jb21tb24vZmlsdGVyCj4gKwo+ICtfY2xl
YW51cCgpCj4gK3sKPiArCWNkIC8KPiArCXJtIC1yIC1mICR0bXAuKgo+ICt9CgpUaGlzIF9jbGVh
bnVwKCkgZnVuY3Rpb24gaXMgc2FtZSBhcyBkZWZhdWx0LiBJdCBjYW4gYmUgcmVtb3ZlZC4KCj4g
Kwo+ICtfcmVxdWlyZV9zY3JhdGNoCj4gK19yZXF1aXJlX3hmc19pb19jb21tYW5kICJwd3JpdGUi
Cj4gK19yZXF1aXJlX3hmc19pb19jb21tYW5kICJ0cnVuY2F0ZSIKPiArX3JlcXVpcmVfY29tbWFu
ZCAiJEYyRlNfSU9fUFJPRyIgZjJmc19pbwo+ICtfcmVxdWlyZV9jaGVja19kbWVzZwo+ICsKPiAr
IyBDbGVhciBvcHRpb25zIHRvIGF2b2lkIGludGVyZmVyZW5jZSBmcm9tIGV4dGVybmFsIGNvbmZp
Z3VyYXRpb25zCj4gK2V4cG9ydCBNS0ZTX09QVElPTlM9IiIKPiArZXhwb3J0IE1PVU5UX09QVElP
TlM9IiIKPiArCj4gKyMgRm9ybWF0IHdpdGggOTZNQiBzaXplIGFuZCAyIHNlZ21lbnRzIHBlciBz
ZWN0aW9uCj4gK19zY3JhdGNoX21rZnNfc2l6ZWQgJCgoOTYgKiAxMDI0ICogMTAyNCkpICIiICIt
cyAyIiA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ICsKPiArIyBNb3VudCB3aXRoIG1vZGU9bGZzCj4g
K19zY3JhdGNoX21vdW50IC1vIG1vZGU9bGZzID4+ICRzZXFyZXMuZnVsbCAyPiYxCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eCkl0J3MgaGVscGxlc3Ms
IGR1ZSB0byBpZiBfc2NyYXRjaF9tb3VudCBmYWlscywgaXQgZXhpdCgpIGRpcmVjdGx5LgoKPiAr
Cj4gKyMgQ3JlYXRlIGZpbGVzIHRvIGZpbGwgd2hvbGUgZmlsZXN5c3RlbSwgdGhlbiBzZWdtZW50
IHR5cGUgd2lsbCBiZSBjaGFuZ2VkIHRvIG5vZGUgdHlwZQo+ICtmb3IgKChpPTA7aTw1MTIwO2kr
KykpIGRvCj4gKwl0b3VjaCAkU0NSQVRDSF9NTlQvJGkgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiAr
ZG9uZQo+ICtzeW5jCj4gKwo+ICsjIFJlbW92ZSBhbGwgZmlsZXMgdG8gY3JlYXRlIGZyZWUoZW1w
dHkpIG5vZGUgc2VnbWVudHMKPiArcm0gLWYgJFNDUkFUQ0hfTU5ULyoKPiArc3luYwo+ICsKPiAr
IyBBbGxvY2F0ZSBmcmVlIHNwYWNlIHNvIHRoYXQgd2UgaGF2ZSBjaGFuY2UgdG8gcmV1c2UgZnJl
ZShlbXB0eSkgbm9kZSBzZWdtZW50cwo+ICskWEZTX0lPX1BST0cgLWYgLWMgInB3cml0ZSAtYiA0
ayAwIDE5MjhrIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ICtzeW5j
Cj4gKwo+ICskWEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01OVC9maWxlID4+
ICRzZXFyZXMuZnVsbCAyPiYxCj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1iIDRrIDAg
MTZNIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ICskWEZTX0lPX1BS
T0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYx
Cj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1iIDRrIDAgMTZNIiAkU0NSQVRDSF9NTlQv
ZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ICskWEZTX0lPX1BST0cgLWMgInRydW5jYXRlIDAi
ICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4gK3N5bmMKPiArCj4gKyRY
RlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1iIDRrIDAgOE0iICRTQ1JBVENIX01OVC9maWxlID4+
ICRzZXFyZXMuZnVsbCAyPiYxCj4gKyRYRlNfSU9fUFJPRyAtYyAidHJ1bmNhdGUgMCIgJFNDUkFU
Q0hfTU5UL2ZpbGUgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiArJFhGU19JT19QUk9HIC1kIC1jICJw
d3JpdGUgLWIgNGsgMCAzMksiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYx
Cj4gKyRYRlNfSU9fUFJPRyAtYyAidHJ1bmNhdGUgMCIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNl
cXJlcy5mdWxsIDI+JjEKPiArJFhGU19JT19QUk9HIC1kIC1jICJwd3JpdGUgLWIgNGsgMCAyTSIg
LWMgImZzeW5jIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ICsKPiAr
IyBTaHV0ZG93biB0aGUgZmlsZXN5c3RlbSB3aXRob3V0IGNoZWNrcG9pbnQKPiArJEYyRlNfSU9f
UFJPRyBzaHV0ZG93biAyICRTQ1JBVENIX01OVCA+PiAkc2VxcmVzLmZ1bGwgMj4mMQoKSSdtIHdv
bmRlcmluZyBpZiB3ZSBjYW4gaGF2ZSBmMmZzIHN1cHBvcnRpbmcgaW4gY29tbW9uIF9zY3JhdGNo
X3NodXRkb3duCmhlbHBlciA6KQoKPiArCj4gK19zY3JhdGNoX3VubW91bnQgPj4gJHNlcXJlcy5m
dWxsIDI+JjEKICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXgoKSWYgdW5t
b3VudCBmYWlscywgaG93IGFib3V0IGxldCBpdCBvdXRwdXQgdGhlIGVycm9ycywgdG8gYnJlYWsg
dGhlIGdvbGRlbiBpbWFnZT8KCj4gKwo+ICtfc2NyYXRjaF9tb3VudCAtbyBtb2RlPWxmcyA+PiAk
c2VxcmVzLmZ1bGwgMj4mMQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5e
Xl5eXl5eXl5eXgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICBoZWxwbGVzcwoKPiArCj4g
KyMgUnVuIHVyZ2VudF9nYyBtb2RlIHRvIHRyaWdnZXIgZ2FyYmFnZSBjb2xsZWN0aW9uCj4gK2Rl
dl9uYW1lPSQoX3Nob3J0X2RldiAkU0NSQVRDSF9ERVYpCj4gK2lmIFsgLWYgL3N5cy9mcy9mMmZz
LyRkZXZfbmFtZS9nY191cmdlbnQgXTsgdGhlbgo+ICsJZWNobyAxID4gL3N5cy9mcy9mMmZzLyRk
ZXZfbmFtZS9nY191cmdlbnQKPiArZmkKCkhtbS4uLiB3aGF0IGlmIHRoZXJlJ3Mgbm90IC9zeXMv
ZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50PyBEb2VzIGl0CmFmZmVjdCB0aGUgdGVzdCByZXN1
bHQ/CgpJZiBpdCBkb2VzLCB0aGlzJ3MgYSBuZWNlc3NhcnkgcmVxdWlyZW1lbnQgZm9yIHRoaXMg
dGVzdCwgd2Ugc2hvdWxkbid0Cmlnbm9yZSBpdCBhbmQga2VlcCBydW5uaW5nLiBEb2VzICRGMkZT
X0lPX1BST0cgcHJvdmlkZSBhIGNvbW1hbmQgdG8KbWFrZSBhIGZvcmNlIEdDPyBPciB3ZSBuZWVk
IHRvIGNoZWNrIHRoaXMgZmlsZSBhbmQgX25vdHJ1biBpZiBpdCdzCm5vdCBleGlzdGVkLgoKPiAr
Cj4gKyMgV2FpdCBiYWNrZ3JvdW5kIEdDIHRocmVhZCB0byB3YWtlIHVwIHRvIHJ1biBhbmQgcG90
ZW50aWFsbHkgZW5jb3VudGVyIHRoZSBpbmNvbnNpc3RlbmN5Cj4gK3NsZWVwIDUKCkRvZXMgdGhp
cyBzbGVlcCB0cnkgdG8gd2FpdCBhYm92ZSAiZWNobyAxID4gL3N5cy9mcy9mMmZzLyRkZXZfbmFt
ZS9nY191cmdlbnQiPwpJZiBzbywgaXQgbWFrZXMgbW9yZSBzZW5zZSB0byBtb3ZlIGl0IGludG8g
dGhlICJpZi10aGVuIiBsb2dpYy4KCj4gKwo+ICtfc2NyYXRjaF91bm1vdW50ID4+ICRzZXFyZXMu
ZnVsbCAyPiYxCiAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl4KU2FtZSBh
cyBhYm92ZS4KCj4gKwo+ICsjIENoZWNrIHdoZXRoZXIgdGhlIGRtZXNnIGhhcyB0aGUgd2Fybmlu
ZyBpbmRpY2F0aW5nIHRoZSBidWcKPiArX2NoZWNrX2RtZXNnX2ZvciAiRjJGUy1mcyBcKCRkZXZf
bmFtZVwpOiBJbmNvbnNpc3RlbnQgc2VnbWVudCIgJiYgXAo+ICsJX2ZhaWwgIkYyRlMtZnMgKCRk
ZXZfbmFtZSk6IEluY29uc2lzdGVudCBzZWdtZW50IHR5cGUgZGV0ZWN0ZWQgaW4gZG1lc2chIgo+
ICsKPiArZWNobyAiU2lsZW5jZSBpcyBnb2xkZW4iCj4gK3N0YXR1cz0wCj4gK2V4aXQKCldlJ3Zl
IHJlcGxhY2VkICJzdGF0dXM9MDtleGl0OyIgd2l0aCAiX2V4aXQgMCIuCgpUaGFua3MsClpvcnJv
Cgo+IGRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAyNS5vdXQgYi90ZXN0cy9mMmZzLzAyNS5vdXQK
PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMC4uM2Q3MDk1MWVmCj4gLS0t
IC9kZXYvbnVsbAo+ICsrKyBiL3Rlc3RzL2YyZnMvMDI1Lm91dAo+IEBAIC0wLDAgKzEsMiBAQAo+
ICtRQSBvdXRwdXQgY3JlYXRlZCBieSAwMjUKPiArU2lsZW5jZSBpcyBnb2xkZW4KPiAtLSAKPiAy
LjQ5LjAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
