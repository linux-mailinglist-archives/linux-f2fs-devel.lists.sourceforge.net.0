Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 2e6iHpHjMGqHYQUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 07:48:01 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC9468C419
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Jun 2026 07:48:00 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=DQMFfvbo;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=dupI8anL;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=j6Mfi6Tt;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=o2KvQiVZ;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=um5BGrHyn4nVWFv6z5UoQtoenbRKtFFT7qYtwQcosYg=; b=DQMFfvbozEQT5oDrU4QSkArRrQ
	5RN14kkuxbD5h660chRe0hWXUuBNL6J/ZLUWA6/gpaCCNQE3CIwvUvhzf4G/l+aOiFZrCma3rkuB3
	D0vC/R+673XYnNJRDhEGV+QZ3Sz7DHa247j1c284kTLQDq/pAlW1KXQdjDekMxb+I8sg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZMeH-0007iA-NU;
	Tue, 16 Jun 2026 05:47:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zlang@kernel.org>) id 1wZMeG-0007i2-2w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 05:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G/SIH5c/f+2pTisr+DrzV9BHZE3y+hfPFAwnl/lvf4A=; b=dupI8anLIFR6rJCc/bfjKlvKIK
 S2PSbyUDzBTafQVqn0IdtxIblds81owJ520m57QbbeqKugox3ztnLxlTFlVmyxzQtSwvsdWhLHThd
 oSm2vppK0pqY+kEBjEWXKPShsXycN9gGdFHcm6n/IUWjriz7xdim3yHudS7tegL7Dxps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G/SIH5c/f+2pTisr+DrzV9BHZE3y+hfPFAwnl/lvf4A=; b=j6Mfi6Ttf6FShAI/rKlXr4AVIs
 NmlLRV5PPf/KBS77xWYRN/S12WrPg2ZHAsu5bNfuBV/RbwGgsx+wRRmVJDYfQGwixja9ARD+hOR65
 VPfz2ROzUEr9S/Wswdkj1fEvbpbJ9I95aYNQPkMXQdSbkcmlp8fDvRpZwXOA/7m4ahS4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZMeF-0004P6-Ex for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Jun 2026 05:47:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 6171043D19
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jun 2026 05:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F62A1F00A3A;
 Tue, 16 Jun 2026 05:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781588858;
 bh=G/SIH5c/f+2pTisr+DrzV9BHZE3y+hfPFAwnl/lvf4A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=o2KvQiVZog+utZnc4fAXLH9eFhnUEzFhW5EFMdLtnXyuYHD3tsFh68kvzCSSQwgbQ
 nSA8hrZCWJVqp+mjoNymHlGD2dmAxf7uCpNnTX9FUbWiQtA8SrHzM9ou0TvLUY2TZq
 6sK97LMW30o/VCj+a+04dufnIxwo8kHOwZSWt2TsqS+e9m39LMPBA87W+z3MKWg4mJ
 Wp4k2RNALkMNyZtNNN/be5I4hNgViWNwQUJWuaBEa4Yhdq9eY6PdOFShJDzi2XgNtX
 RnQ31LvQ789zxy0UdFz80o7L9P+wrZxKiHkUAEQGo8NrNEo7Lm7xxVxe6Gnlnn1nzT
 P+MEhenkvNOPQ==
Date: Tue, 16 Jun 2026 13:47:32 +0800
To: Chao Yu <chao@kernel.org>
Message-ID: <ajDbxFzRu9v-WBPC@zlang-mailbox>
Mail-Followup-To: Chao Yu <chao@kernel.org>, fstests@vger.kernel.org, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
References: <20260612005802.3017709-1-chao@kernel.org>
 <ai7YFkAK8sBL4jXm@zlang-mailbox>
 <b32998c0-17e3-4b81-a474-4a408aa7fa32@kernel.org>
 <ajBZEtrLmRZt0AA1@zlang-mailbox>
 <e4a31590-e173-4f43-8d70-16e83bd52bed@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e4a31590-e173-4f43-8d70-16e83bd52bed@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jun 16, 2026 at 11:33:20AM +0800, Chao Yu wrote: >
 On 6/16/26 04:05, Zorro Lang wrote: > > On Mon, Jun 15, 2026 at 04:22:34PM
 +0800, Chao Yu wrote: > >> On 6/15/26 01:16, Zorro Lang wrote: > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wZMeF-0004P6-Ex
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[zlang-mailbox:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AC9468C419

T24gVHVlLCBKdW4gMTYsIDIwMjYgYXQgMTE6MzM6MjBBTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiBPbiA2LzE2LzI2IDA0OjA1LCBab3JybyBMYW5nIHdyb3RlOgo+ID4gT24gTW9uLCBKdW4gMTUs
IDIwMjYgYXQgMDQ6MjI6MzRQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToKPiA+PiBPbiA2LzE1LzI2
IDAxOjE2LCBab3JybyBMYW5nIHdyb3RlOgo+ID4+PiBPbiBGcmksIEp1biAxMiwgMjAyNiBhdCAx
Mjo1ODowMkFNICswMDAwLCBDaGFvIFl1IHdyb3RlOgo+ID4+Pj4gV2l0aG91dCBjb21taXQgNTIw
NzYwYjlmOTE1ICgiZjJmczogb3B0aW1pemUgcmVwcmVzZW50YXRpdmUgdHlwZSBkZXRlcm1pbmF0
aW9uCj4gPj4+PiBpbiBHQyIpLCBmMmZzIEdDIHdpbGwgcmVwb3J0IGluY29uc2lzdGVudCBzZWdt
ZW50IHR5cGUgaW4gbGFyZ2Ugc2VjdGlvbiBpc3N1ZSwKPiA+Pj4+IGFuZCB0aGVuIGl0IHdpbGwg
Zm9yY2UgdG8gc2h1dGRvd24gZmlsZXN5c3RlbS4KPiA+Pj4+Cj4gPj4+PiBbICA3NjguMTkwOTAz
XSBGMkZTLWZzIChsb29wNTEpOiBJbmNvbnNpc3RlbnQgc2VnbWVudCAoMykgdHlwZSBbMSwgMF0g
aW4gU0lUIGFuZCBTU0EKPiA+Pj4+Cj4gPj4+PiBUaGUgcmVhc29uIGlzIGYyZnMga2VybmVsIHdp
bGwgYXNzdW1lIGFsbCBzZWdtZW50IHR5cGUgaW5zaWRlIGxhcmdlIHNlY3Rpb24gaXMKPiA+Pj4+
IHRoZSBzYW1lLCBkdXJpbmcgR0MgaXQgbG9hZHMgdHlwZSBmcm9tIG9uZSBzZWdtZW50IGFuZCBj
b21wYXJlIGl0IHRvIG90aGVyCj4gPj4+PiBzZWdtZW50cycgdHlwZSwgaG93ZXZlciBkdWUgdG8g
cmVjb3ZlcnkgZmxvdywgdGhlIGNob3NlbiBzZWdtZW50IG1heSBoYXMgemVybwo+ID4+Pj4gdmFs
aWQgYmxvY2tzIHcvIGRpZmZlcmVudCBzZWdtZW50IHR5cGUsIHNpbmNlIHRoZSBzZWdtZW50IGlz
IGludmFsaWQoZnJlZSkgb25lLAo+ID4+Pj4gaXQgd2lsbCBuZXZlciBiZSBtaWdyYXRlZCwgc28g
dGhhdCB3ZSBzaG91bGQgbm90IHRyZWF0IHN1Y2ggc3RhdGUgYXMgYWJub3JtYWwKPiA+Pj4+IGNv
bmRpdGlvbi4KPiA+Pj4+Cj4gPj4+PiBUaGlzIHRlc3RjYXNlIGlzIGNyZWF0ZWQgdG8gc2ltdWxh
dGUgYWJvdmUgY29uZGl0aW9uIHRvIHNlZSB3aGV0aGVyIGYyZnMga2VybmVsCj4gPj4+PiBtb2R1
bGUgY2FuIGhhbmRsZSBpdCBjb3JyZWN0bHkKPiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4gPj4+PiAtLS0KPiA+Pj4+IHYyOgo+ID4+Pj4gLSBj
bGVhciBNS0ZTX09QVElPTlMgYW5kIE1PVU5UX09QVElPTlMgdG8gZ3VhcmFudGVlIGJsb2NrIGFs
bG9jYXRpb24gaXMgYXMgZXhwZWN0ZWQuCj4gPj4+Cj4gPj4+IEhpIENoYW8sCj4gPj4+Cj4gPj4+
IFNvcnJ5LCBJIGp1c3Qgbm90aWNlZCB5b3VyIHJlcGx5IHRvIG15IHJldmlldyBvbiB0aGUgcHJl
dmlvdXMgcGF0Y2ggdmVyc2lvbi4KPiA+Pj4gRHVlIHRvIHNvbWUgdW5leHBlY3RlZCBzaGFrZS11
cHMgcmVjZW50bHksIEnigJl2ZSBiZWVuIGJvZ2dlZCBkb3duIHdpdGggc2V0dGluZwo+ID4+PiB1
cCBhbmQgbW9kaWZ5aW5nIHZhcmlvdXMgbmV3IHN5c3RlbSBlbnZpcm9ubWVudHMsIGFuZCBJIGFj
Y2lkZW50YWxseSBtYXJrZWQKPiA+Pj4gc29tZSB1bnJlYWQgZW1haWxzIGFzIHJlYWQuCj4gPj4K
PiA+PiBObyB3b3JyaWVzLiA6KQo+ID4+Cj4gPj4+Cj4gPj4+IFRoZSBwYXRjaCBsb29rcyBnb29k
IHRvIG1lLCB3aXRoIGp1c3QgYSBmZXcgcGlja3kgcmV2aWV3IHBvaW50cyBiZWxvdzoKPiA+Pgo+
ID4+IFRoYW5rcyBab3JybyBmb3IgdGFraW5nIGEgbG9vay4KPiA+Pgo+ID4+Pgo+ID4+Pj4gIHRl
c3RzL2YyZnMvMDI1ICAgICB8IDkyICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysKPiA+Pj4+ICB0ZXN0cy9mMmZzLzAyNS5vdXQgfCAgMiArCj4gPj4+PiAgMiBm
aWxlcyBjaGFuZ2VkLCA5NCBpbnNlcnRpb25zKCspCj4gPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0
IHRlc3RzL2YyZnMvMDI1Cj4gPj4+PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IHRlc3RzL2YyZnMvMDI1
Lm91dAo+ID4+Pj4KPiA+Pj4+IGRpZmYgLS1naXQgYS90ZXN0cy9mMmZzLzAyNSBiL3Rlc3RzL2Yy
ZnMvMDI1Cj4gPj4+PiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+ID4+Pj4gaW5kZXggMDAwMDAwMDAw
Li4zOTdlNTQzOWEKPiA+Pj4+IC0tLSAvZGV2L251bGwKPiA+Pj4+ICsrKyBiL3Rlc3RzL2YyZnMv
MDI1Cj4gPj4+PiBAQCAtMCwwICsxLDkyIEBACj4gPj4+PiArIyEgL2Jpbi9iYXNoCj4gPj4+PiAr
IyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMAo+ID4+Pj4gKyMgQ29weXJpZ2h0IChj
KSAyMDI2IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiA+Pj4+ICsjCj4gPj4+PiArIyBGUyBR
QSBUZXN0IE5vLiBmMmZzLzAyNQo+ID4+Pj4gKyMKPiA+Pj4+ICsjIENoZWNrIHdoZXRoZXIgZjJm
cyB3aWxsIGVuY291bnRlciBjcF9lcnJvciAoSW5jb25zaXN0ZW50IHNlZ21lbnQgdHlwZSkKPiA+
Pj4+ICsjIHdoZW4gZG9pbmcgc2FuaXR5IGNoZWNrIG9uIHR5cGUgb2Ygc2VnbWVudHMgaW5zaWRl
IGxhcmdlIHNlY3Rpb24gZHVyaW5nCj4gPj4+PiArIyBnYXJiYWdlIGNvbGxlY3Rpb24uCj4gPj4+
PiArIwo+ID4+Pj4gKy4gLi9jb21tb24vcHJlYW1ibGUKPiA+Pj4+ICtfYmVnaW5fZnN0ZXN0IGF1
dG8gcXVpY2sKPiA+Pj4+ICsKPiA+Pj4+ICtfZml4ZWRfYnlfa2VybmVsX2NvbW1pdCA1MjA3NjBi
OWY5MTUgXAo+ID4+Pj4gKwkiZjJmczogb3B0aW1pemUgcmVwcmVzZW50YXRpdmUgdHlwZSBkZXRl
cm1pbmF0aW9uIGluIEdDIgo+ID4+Pj4gKwo+ID4+Pj4gKy4gLi9jb21tb24vZmlsdGVyCj4gPj4+
PiArCj4gPj4+PiArX2NsZWFudXAoKQo+ID4+Pj4gK3sKPiA+Pj4+ICsJY2QgLwo+ID4+Pj4gKwly
bSAtciAtZiAkdG1wLioKPiA+Pj4+ICt9Cj4gPj4+Cj4gPj4+IFRoaXMgX2NsZWFudXAoKSBmdW5j
dGlvbiBpcyBzYW1lIGFzIGRlZmF1bHQuIEl0IGNhbiBiZSByZW1vdmVkLgo+ID4+Cj4gPj4gV2ls
bCByZW1vdmUuCj4gPj4KPiA+Pj4KPiA+Pj4+ICsKPiA+Pj4+ICtfcmVxdWlyZV9zY3JhdGNoCj4g
Pj4+PiArX3JlcXVpcmVfeGZzX2lvX2NvbW1hbmQgInB3cml0ZSIKPiA+Pj4+ICtfcmVxdWlyZV94
ZnNfaW9fY29tbWFuZCAidHJ1bmNhdGUiCj4gPj4+PiArX3JlcXVpcmVfY29tbWFuZCAiJEYyRlNf
SU9fUFJPRyIgZjJmc19pbwo+ID4+Pj4gK19yZXF1aXJlX2NoZWNrX2RtZXNnCj4gPj4+PiArCj4g
Pj4+PiArIyBDbGVhciBvcHRpb25zIHRvIGF2b2lkIGludGVyZmVyZW5jZSBmcm9tIGV4dGVybmFs
IGNvbmZpZ3VyYXRpb25zCj4gPj4+PiArZXhwb3J0IE1LRlNfT1BUSU9OUz0iIgo+ID4+Pj4gK2V4
cG9ydCBNT1VOVF9PUFRJT05TPSIiCj4gPj4+PiArCj4gPj4+PiArIyBGb3JtYXQgd2l0aCA5Nk1C
IHNpemUgYW5kIDIgc2VnbWVudHMgcGVyIHNlY3Rpb24KPiA+Pj4+ICtfc2NyYXRjaF9ta2ZzX3Np
emVkICQoKDk2ICogMTAyNCAqIDEwMjQpKSAiIiAiLXMgMiIgPj4gJHNlcXJlcy5mdWxsIDI+JjEK
PiA+Pj4+ICsKPiA+Pj4+ICsjIE1vdW50IHdpdGggbW9kZT1sZnMKPiA+Pj4+ICtfc2NyYXRjaF9t
b3VudCAtbyBtb2RlPWxmcyA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXgo+ID4+PiBJdCdzIGhlbHBsZXNz
LCBkdWUgdG8gaWYgX3NjcmF0Y2hfbW91bnQgZmFpbHMsIGl0IGV4aXQoKSBkaXJlY3RseS4KPiA+
Pgo+ID4+IFJpZ2h0LCB3aWxsIGZpeC4KPiA+Pgo+ID4+Pgo+ID4+Pj4gKwo+ID4+Pj4gKyMgQ3Jl
YXRlIGZpbGVzIHRvIGZpbGwgd2hvbGUgZmlsZXN5c3RlbSwgdGhlbiBzZWdtZW50IHR5cGUgd2ls
bCBiZSBjaGFuZ2VkIHRvIG5vZGUgdHlwZQo+ID4+Pj4gK2ZvciAoKGk9MDtpPDUxMjA7aSsrKSkg
ZG8KPiA+Pj4+ICsJdG91Y2ggJFNDUkFUQ0hfTU5ULyRpID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4g
Pj4+PiArZG9uZQo+ID4+Pj4gK3N5bmMKPiA+Pj4+ICsKPiA+Pj4+ICsjIFJlbW92ZSBhbGwgZmls
ZXMgdG8gY3JlYXRlIGZyZWUoZW1wdHkpIG5vZGUgc2VnbWVudHMKPiA+Pj4+ICtybSAtZiAkU0NS
QVRDSF9NTlQvKgo+ID4+Pj4gK3N5bmMKPiA+Pj4+ICsKPiA+Pj4+ICsjIEFsbG9jYXRlIGZyZWUg
c3BhY2Ugc28gdGhhdCB3ZSBoYXZlIGNoYW5jZSB0byByZXVzZSBmcmVlKGVtcHR5KSBub2RlIHNl
Z21lbnRzCj4gPj4+PiArJFhGU19JT19QUk9HIC1mIC1jICJwd3JpdGUgLWIgNGsgMCAxOTI4ayIg
JFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiA+Pj4+ICtzeW5jCj4gPj4+
PiArCj4gPj4+PiArJFhGU19JT19QUk9HIC1jICJ0cnVuY2F0ZSAwIiAkU0NSQVRDSF9NTlQvZmls
ZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+Pj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRl
IC1iIDRrIDAgMTZNIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+
Pj4gKyRYRlNfSU9fUFJPRyAtYyAidHJ1bmNhdGUgMCIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNl
cXJlcy5mdWxsIDI+JjEKPiA+Pj4+ICskWEZTX0lPX1BST0cgLWQgLWMgInB3cml0ZSAtYiA0ayAw
IDE2TSIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiA+Pj4+ICskWEZT
X0lPX1BST0cgLWMgInRydW5jYXRlIDAiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVs
bCAyPiYxCj4gPj4+PiArc3luYwo+ID4+Pj4gKwo+ID4+Pj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAi
cHdyaXRlIC1iIDRrIDAgOE0iICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYx
Cj4gPj4+PiArJFhGU19JT19QUk9HIC1jICJ0cnVuY2F0ZSAwIiAkU0NSQVRDSF9NTlQvZmlsZSA+
PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+Pj4gKyRYRlNfSU9fUFJPRyAtZCAtYyAicHdyaXRlIC1i
IDRrIDAgMzJLIiAkU0NSQVRDSF9NTlQvZmlsZSA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+Pj4g
KyRYRlNfSU9fUFJPRyAtYyAidHJ1bmNhdGUgMCIgJFNDUkFUQ0hfTU5UL2ZpbGUgPj4gJHNlcXJl
cy5mdWxsIDI+JjEKPiA+Pj4+ICskWEZTX0lPX1BST0cgLWQgLWMgInB3cml0ZSAtYiA0ayAwIDJN
IiAtYyAiZnN5bmMiICRTQ1JBVENIX01OVC9maWxlID4+ICRzZXFyZXMuZnVsbCAyPiYxCj4gPj4+
PiArCj4gPj4+PiArIyBTaHV0ZG93biB0aGUgZmlsZXN5c3RlbSB3aXRob3V0IGNoZWNrcG9pbnQK
PiA+Pj4+ICskRjJGU19JT19QUk9HIHNodXRkb3duIDIgJFNDUkFUQ0hfTU5UID4+ICRzZXFyZXMu
ZnVsbCAyPiYxCj4gPj4+Cj4gPj4+IEknbSB3b25kZXJpbmcgaWYgd2UgY2FuIGhhdmUgZjJmcyBz
dXBwb3J0aW5nIGluIGNvbW1vbiBfc2NyYXRjaF9zaHV0ZG93bgo+ID4+PiBoZWxwZXIgOikKPiA+
Pgo+ID4+IEkgdGhpbmsgd2UgY2FuIGNoYW5nZSBmMmZzIHRlc3RjYXNlIHRvIHVzZSBfc2NyYXRj
aF9zaHV0ZG93biBiZWNhdXNlIHRoZSBkZWZpbml0aW9uIG9mCj4gPj4gbm9sb2dmbHVzaCBzaHV0
ZG93biBpbnRlcmZhY2UgaXMgdGhlIHNhbWUgYXMgeGZzJzoKPiA+Pgo+ID4+IC8qCj4gPj4gICog
c2hvdWxkIGJlIHNhbWUgYXMgWEZTX0lPQ19HT0lOR0RPV04uCj4gPj4gICogRmxhZ3MgZm9yIGdv
aW5nIGRvd24gb3BlcmF0aW9uIHVzZWQgYnkgRlNfSU9DX0dPSU5HRE9XTgo+ID4+ICAqLwo+ID4+
ICNkZWZpbmUgRjJGU19JT0NfU0hVVERPV04JX0lPUignWCcsIDEyNSwgX191MzIpCS8qIFNodXRk
b3duICovCj4gPj4gI2RlZmluZSBGMkZTX0dPSU5HX0RPV05fTk9TWU5DCQkweDIJLyogZ29pbmcg
ZG93biAqLwo+ID4+Cj4gPj4gI2RlZmluZSBYRlNfSU9DX0dPSU5HRE9XTgkgICAgIF9JT1IgKCdY
JywgMTI1LCB1aW50MzJfdCkKPiA+PiAjZGVmaW5lIFhGU19GU09QX0dPSU5HX0ZMQUdTX05PTE9H
RkxVU0gJCTB4MgkvKiBkb24ndCBmbHVzaCBsb2cgbm9yIGRhdGEgKi8KPiA+Pgo+ID4+Pgo+ID4+
Pj4gKwo+ID4+Pj4gK19zY3JhdGNoX3VubW91bnQgPj4gJHNlcXJlcy5mdWxsIDI+JjEKPiA+Pj4g
ICAgICAgICAgICAgICAgICAgICBeXl5eXl5eXl5eXl5eXl5eXl5eXgo+ID4+Pgo+ID4+PiBJZiB1
bm1vdW50IGZhaWxzLCBob3cgYWJvdXQgbGV0IGl0IG91dHB1dCB0aGUgZXJyb3JzLCB0byBicmVh
ayB0aGUgZ29sZGVuIGltYWdlPwo+ID4+Cj4gPj4gWWVzLCBpdCdzIGJldHRlci4KPiA+Pgo+ID4+
Pgo+ID4+Pj4gKwo+ID4+Pj4gK19zY3JhdGNoX21vdW50IC1vIG1vZGU9bGZzID4+ICRzZXFyZXMu
ZnVsbCAyPiYxCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5e
Xl5eXl5eXl5eCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGhlbHBsZXNzCj4g
Pj4KPiA+PiBXaWxsIGZpeC4KPiA+Pgo+ID4+Pgo+ID4+Pj4gKwo+ID4+Pj4gKyMgUnVuIHVyZ2Vu
dF9nYyBtb2RlIHRvIHRyaWdnZXIgZ2FyYmFnZSBjb2xsZWN0aW9uCj4gPj4+PiArZGV2X25hbWU9
JChfc2hvcnRfZGV2ICRTQ1JBVENIX0RFVikKPiA+Pj4+ICtpZiBbIC1mIC9zeXMvZnMvZjJmcy8k
ZGV2X25hbWUvZ2NfdXJnZW50IF07IHRoZW4KPiA+Pj4+ICsJZWNobyAxID4gL3N5cy9mcy9mMmZz
LyRkZXZfbmFtZS9nY191cmdlbnQKPiA+Pj4+ICtmaQo+ID4+Pgo+ID4+PiBIbW0uLi4gd2hhdCBp
ZiB0aGVyZSdzIG5vdCAvc3lzL2ZzL2YyZnMvJGRldl9uYW1lL2djX3VyZ2VudD8gRG9lcyBpdAo+
ID4+PiBhZmZlY3QgdGhlIHRlc3QgcmVzdWx0Pwo+ID4+Pgo+ID4+PiBJZiBpdCBkb2VzLCB0aGlz
J3MgYSBuZWNlc3NhcnkgcmVxdWlyZW1lbnQgZm9yIHRoaXMgdGVzdCwgd2Ugc2hvdWxkbid0Cj4g
Pj4+IGlnbm9yZSBpdCBhbmQga2VlcCBydW5uaW5nLiBEb2VzICRGMkZTX0lPX1BST0cgcHJvdmlk
ZSBhIGNvbW1hbmQgdG8KPiA+Pj4gbWFrZSBhIGZvcmNlIEdDPyBPciB3ZSBuZWVkIHRvIGNoZWNr
IHRoaXMgZmlsZSBhbmQgX25vdHJ1biBpZiBpdCdzCj4gPj4+IG5vdCBleGlzdGVkLgo+ID4+Cj4g
Pj4gQWgsIHJpZ2h0LCB0aGF0J3MgZ29vZCBwb2ludCEKPiA+Pgo+ID4+IFdlIGNhbiB1c2UgIiRG
MkZTX0lPX1BST0cgZ2NfdXJnZW50IDxkZXZfbmFtZT4gcnVuIDUiIGluc3RlYWQsIGl0IHdpbGwg
ZG8gYmVsb3cgY29tbWFuZHM6Cj4gPiAKPiA+IEdyZWF0LCBJIGp1c3QgaG9wZSB0aGUgKmdjX3Vy
Z2VudCogaXNuJ3QgYSBuZXcgZmVhdHVyZSB3aGljaCBuZWVkcyBzb21ldGhpbmcgbGlrZXM6Cj4g
Cj4gSSBndWVzcyBpdCdzIG5vdCBhIG5ldyBzdWJjb21tYW5kIGZvciBmMmZzX2lvLAo+IAo+IGNv
bW1pdCAyMmQ3NThlMmU2YWYyMTBkYzllNmNkZjk5NDM4ZjA2MzM4M2JhNzJmCj4gQXV0aG9yOiBK
YWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+IERhdGU6ICAgVHVlIEZlYiAxOSAxOTow
NzoyMSAyMDE5IC0wODAwCj4gCj4gICAgIGYyZnNfaW86IGFkZCBnY191cmdlbnQKPiAKPiAgICAg
ZS5nLiwKPiAgICAgZjJmc19pbyBnY191cmdlbnQgZG0tNCBbc3RhcnQvZW5kL3J1bl0gW3RpbWUg
aW4gc2VjXQo+IAo+ICAgICBUaGlzIGNvbnRyb2xzIHN5c2ZzL2djX3VyZ2VudCB0byBydW4gZjJm
c19nYyB1cmdlbnRseS4KPiAKPiAgICAgU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdl
dWtAa2VybmVsLm9yZz4KPiAKPiA+IGBfcmVxdWlyZV9mMmZzX2lvIGdjX3VyZ2VudGAgKHRoZXJl
J3Mgbm90IF9yZXF1aXJlX2YyZnNfaW86KQo+IAo+IEFncmVlZCwgd2UgbmVlZCB0byBpbnRyb2R1
Y2UgX3JlcXVpcmVfZjJmc19pbygpLCBsZXQgbWUgd29yayBvbiB0aGlzLgoKT2gsIDIwMTkgd2Fz
IDcgeWVhcnMgYWdvLiBObyBvbmUgc2hvdWxkIGJlIGNvbXBsYWluaW5nIGFib3V0IHRoaXMgdW5s
ZXNzCnRoZXkncmUgb24gYSBzdXBlciBvbGQgZG93bnN0cmVhbSBmMmZzLXRvb2xzLiBCdXQgYW55
d2F5LCBoYXZpbmcKX3JlcXVpcmVfZjJmc19pbyBpcyBkZWZpbml0ZWx5IGdvb2QgZm9yIGZ1dHVy
ZSBmMmZzIHRlc3RpbmcgOikKClRoZXJlZm9yZSwgX3JlcXVpcmVfZjJmc19pbyBpcyBub3Qgc3Ry
aWN0bHkgdXJnZW50IGZvciB0aGlzIHBhdGNoLiBJdCdzIHVwIHRvCnlvdSB3aGV0aGVyIHRvIGlu
Y2x1ZGUgaXQgbm93IG9yIGhhbmRsZSBpdCBpbiBhIGxhdGVyIHVwZGF0ZS4KCj4gCj4gPiAKPiA+
PiAxLiBlY2hvIDEgPiAvc3lzL2ZzL2YyZnMvJGRldl9uYW1lL2djX3VyZ2VudAo+ID4+IDIuIHNs
ZWVwIDUgc2Vjb25kcwo+ID4+IDMuIGVjaG8gMCA+IC9zeXMvZnMvZjJmcy8kZGV2X25hbWUvZ2Nf
dXJnZW50Cj4gPiAKPiA+IEl0IGFsc28gZGVwZW5kcyBvbiB0aGUgL3N5cy9mcy9mMmZzLyRkZXZf
bmFtZS9nY191cmdlbnQgdG9vLiBTbyB3ZSBoYXZlIHRvIGZhY2UKPiA+IHRoZSBzYW1lIHF1ZXN0
aW9uOgo+ID4gICBJZiB0aGlzIGZpbGUgZG9lc24ndCBleGlzdCwgc2hvdWxkIHRoaXMgdGVzdCBj
YXNlIF9ub3RydW4/Cj4gCj4gT2gsIHJpZ2h0LCBtYXliZSB3ZSBjYW4gaW50cm9kdWNlIF9yZXF1
aXJlX2YyZnNfc3lzZnMoKSB0byBjaGVjayB3aGV0aGVyIGYyZnMga2VybmVsCj4gbW9kdWxlIGhh
cyBzdXBwb3J0ZWQgdGFyZ2V0IHN5c2ZzIG5vZGU/CgpUaGVyZSdzIGEgX3JlcXVpcmVfZnNfc3lz
ZnNfYXR0ciwgc28uLi4KCmlmIHlvdSBkb24ndCBjYXJlIGFib3V0ICRTQ1JBVENIX0RFViBpcyBt
b3VudGVkIG9yIG5vdCwgeW91IGNhbjoKICBfcmVxdWlyZV9mc19zeXNmc19hdHRyICRURVNUX0RF
ViBnY191cmdlbnQKCm9yIGFmdGVyIF9zY3JhdGNoX21vdW50OgogIF9yZXF1aXJlX2ZzX3N5c2Zz
X2F0dHIgJFNDUkFUQ0hfREVWIGdjX3VyZ2VudAoKVGhlbiBJIHRoaW5rIHlvdSBjYW4gZWl0aGVy
IHVzZSBgJEYyRlNfSU9fUFJPRyBnY191cmdlbnRgLCBvciBpZiB5b3UncmUgd29ycmllZAphYm91
dCBpdHMgY29tcGF0aWJpbGl0eSwgeW91IGNhbjoKICBfc2V0X2ZzX3N5c2ZzX2F0dHIgJFNDUkFU
Q0hfREVWIGdjX3VyZ2VudCAxCiAgc2xlZXAgNQoKVGhhbmtzLApab3JybwoKPiAKPiBUaGFua3Ms
Cj4gCj4gPiAKPiA+IFRoYW5rcywKPiA+IFpvcnJvCj4gPiAKPiA+Pgo+ID4+Pgo+ID4+Pj4gKwo+
ID4+Pj4gKyMgV2FpdCBiYWNrZ3JvdW5kIEdDIHRocmVhZCB0byB3YWtlIHVwIHRvIHJ1biBhbmQg
cG90ZW50aWFsbHkgZW5jb3VudGVyIHRoZSBpbmNvbnNpc3RlbmN5Cj4gPj4+PiArc2xlZXAgNQo+
ID4+Pgo+ID4+PiBEb2VzIHRoaXMgc2xlZXAgdHJ5IHRvIHdhaXQgYWJvdmUgImVjaG8gMSA+IC9z
eXMvZnMvZjJmcy8kZGV2X25hbWUvZ2NfdXJnZW50Ij8KPiA+Pj4gSWYgc28sIGl0IG1ha2VzIG1v
cmUgc2Vuc2UgdG8gbW92ZSBpdCBpbnRvIHRoZSAiaWYtdGhlbiIgbG9naWMuCj4gPj4+Cj4gPj4+
PiArCj4gPj4+PiArX3NjcmF0Y2hfdW5tb3VudCA+PiAkc2VxcmVzLmZ1bGwgMj4mMQo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgIF5eXl5eXl5eXl5eXl5eXl5eXl5eCj4gPj4+IFNhbWUgYXMgYWJv
dmUuCj4gPj4KPiA+PiBXaWxsIGZpeC4KPiA+Pgo+ID4+Pgo+ID4+Pj4gKwo+ID4+Pj4gKyMgQ2hl
Y2sgd2hldGhlciB0aGUgZG1lc2cgaGFzIHRoZSB3YXJuaW5nIGluZGljYXRpbmcgdGhlIGJ1Zwo+
ID4+Pj4gK19jaGVja19kbWVzZ19mb3IgIkYyRlMtZnMgXCgkZGV2X25hbWVcKTogSW5jb25zaXN0
ZW50IHNlZ21lbnQiICYmIFwKPiA+Pj4+ICsJX2ZhaWwgIkYyRlMtZnMgKCRkZXZfbmFtZSk6IElu
Y29uc2lzdGVudCBzZWdtZW50IHR5cGUgZGV0ZWN0ZWQgaW4gZG1lc2chIgo+ID4+Pj4gKwo+ID4+
Pj4gK2VjaG8gIlNpbGVuY2UgaXMgZ29sZGVuIgo+ID4+Pj4gK3N0YXR1cz0wCj4gPj4+PiArZXhp
dAo+ID4+Pgo+ID4+PiBXZSd2ZSByZXBsYWNlZCAic3RhdHVzPTA7ZXhpdDsiIHdpdGggIl9leGl0
IDAiLgo+ID4+Cj4gPj4gV2lsbCBmaXguCj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4KPiA+
Pj4gVGhhbmtzLAo+ID4+PiBab3Jybwo+ID4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2Yy
ZnMvMDI1Lm91dCBiL3Rlc3RzL2YyZnMvMDI1Lm91dAo+ID4+Pj4gbmV3IGZpbGUgbW9kZSAxMDA2
NDQKPiA+Pj4+IGluZGV4IDAwMDAwMDAwMC4uM2Q3MDk1MWVmCj4gPj4+PiAtLS0gL2Rldi9udWxs
Cj4gPj4+PiArKysgYi90ZXN0cy9mMmZzLzAyNS5vdXQKPiA+Pj4+IEBAIC0wLDAgKzEsMiBAQAo+
ID4+Pj4gK1FBIG91dHB1dCBjcmVhdGVkIGJ5IDAyNQo+ID4+Pj4gK1NpbGVuY2UgaXMgZ29sZGVu
Cj4gPj4+PiAtLSAKPiA+Pj4+IDIuNDkuMAo+ID4+Pj4KPiA+Pgo+ID4+Cj4gCj4gCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
