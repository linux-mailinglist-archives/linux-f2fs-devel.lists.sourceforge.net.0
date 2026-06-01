Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMRpC/nlHGrKTwkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Jun 2026 03:52:57 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3A1618AF3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Jun 2026 03:52:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iNt7ha/WRdaTygAV5drSud0KXkP6unv8PCxh1MGlqd8=; b=TWpgAALAHH0EQDgezakd+REOq6
	x3Pkqe98r0Q27EEyryLe2RRl+A8KVvDW8gxjcsWKyf3Nd7X11t8aWRn87uhASj2fa5qGcizi19bvX
	RerzK+0xuhpQoCXwCu385x+PRyb4jZGoHw9c7Yuxj3UCPOgmqdTBLhLkdPYRrYIST1Dc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wTrpY-0006h7-AN;
	Mon, 01 Jun 2026 01:52:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wTrpW-0006h0-Bf
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jun 2026 01:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vZcu83wQUzh29/MUzPMLQS8Iv0nVsOwsxAWqxDDGj50=; b=N45FgXN95HZWFxRptvgF1WF0fW
 ROaQkusRZlgBtnRtsyskM38RLAyIW3nza7KWr9xRBtjnu5P89gjqzLSIGsdGltq16vmyvalaNn/h8
 supYHgOgabqlKKk0EQz/GDU+hGJBgUxOC57/QW4+E6dn6/l3QMRVJqgTCq2IpTVSpZ6Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vZcu83wQUzh29/MUzPMLQS8Iv0nVsOwsxAWqxDDGj50=; b=RkdkMEAtrHNXr78YoV7/okLHaH
 NkGx2BJZFnWHhIEbubP6mVx39ZfDlF6TBQFSkRIFrAJ0Ui78aTlfQkInlR05K8aviQhxIACuZZie8
 KqIMpYmkvIkcvv4PummZvvUmJykAs7+iSub4qd7Hfio2bXg180z6bS1bkLvYkfx4Iu2E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wTrpV-0006Jc-47 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Jun 2026 01:52:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 074F7402EA;
 Mon,  1 Jun 2026 01:52:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F8DC1F00893;
 Mon,  1 Jun 2026 01:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1780278746;
 bh=vZcu83wQUzh29/MUzPMLQS8Iv0nVsOwsxAWqxDDGj50=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=KYRH/paMfV8BeCgbYfsHMCWqDOtr++JkRKX25dlTAVmIboEGh885kBK9CuL9tV7tr
 8pqNVZlKj2Z5eqkBjCOdCp0sLKsojv97UUmTic4Gw9ws96ZOStR0P5qLHeNR5VBGoj
 3LqQJbi8ZclVXzUncbIJ1wqdlIzloAzt9PJuFY5D6+UiIWk8GmIvoBVVeICbzTfjsC
 Pd4h54Ftu3TrtIx88YUPUiS7ncpHA0KUeMphtpkxg9lh+Ru7ktMSIfDkYD33de5fyM
 gU8LQy89ioRQGwY5FsyGgbwGBRpqJv7qJ25cTr4qdLpzf66OxtRMqTcc+ABTwEWkQp
 AbzOUsuArFnkA==
Date: Mon, 1 Jun 2026 01:52:24 +0000
To: Barry Song <baohua@kernel.org>
Message-ID: <ahzl2GM1OGsBz9mV@google.com>
References: <ahCNmWbcd_2lAJyk@google.com>
 <20260522224108.GA18663@macsyma-wired.lan>
 <ahTzHyHBL8t0iNBR@google.com>
 <ybmbjekuvzmaw4hmlxd7nxs546dqtwmxqxwyali74d6m3u7tat@b4q3japqnhrl>
 <f4e521ac-2381-49ca-8dcc-3cb3cf3ffaea@acm.org>
 <ahaPDHiXcJoVShPv@infradead.org> <ahcU5xbVy7xjps02@google.com>
 <ahkl52N3RDcusCNd@infradead.org> <aht812OhSPFqIBPK@google.com>
 <CAGsJ_4yJihngSY0GNcc+MwPHJjpF1qCnS8-UE1GwYoNDtEm9mQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAGsJ_4yJihngSY0GNcc+MwPHJjpF1qCnS8-UE1GwYoNDtEm9mQ@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/31, Barry Song via Linux-f2fs-devel wrote: > On Sun,
 May 31, 2026 at 8:12 AM Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > On
 05/28, Christoph Hellwig wrote: > > > On Wed, May 27, 2026 at 03:5 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wTrpV-0006Jc-47
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: another way to set large folio by
 remembering inode number
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Theodore Tso <tytso@mit.edu>, Bart Van Assche <bvanassche@acm.org>,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 linux-fsdevel@vger.kernel.org, Akilesh Kailash <akailash@google.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:baohua@kernel.org,m:tytso@mit.edu,m:bvanassche@acm.org,m:linux-api@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:hch@infradead.org,m:linux-mm@kvack.org,m:linux-fsdevel@vger.kernel.org,m:akailash@google.com,m:christian@brauner.io,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[12];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 4E3A1618AF3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gMDUvMzEsIEJhcnJ5IFNvbmcgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4gT24gU3Vu
LCBNYXkgMzEsIDIwMjYgYXQgODoxMuKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5v
cmc+IHdyb3RlOgo+ID4KPiA+IE9uIDA1LzI4LCBDaHJpc3RvcGggSGVsbHdpZyB3cm90ZToKPiA+
ID4gT24gV2VkLCBNYXkgMjcsIDIwMjYgYXQgMDM6NTk6MzVQTSArMDAwMCwgSmFlZ2V1ayBLaW0g
d3JvdGU6Cj4gPiA+ID4gRjJGUyBtZXJnZXMgYmlvcyBiZWZvcmUgc3VibWl0X2JpbywgcmVnYXJk
bGVzcyBvZiBzbWFsbCBvciBsYXJnZSBmb2xpb3MsCj4gPiA+ID4gc2luY2UgdGhlIGJsb2NrIGFk
ZHJlc3NlcyBhcmUgY29uc2VjdXRpdmUuIFNvLCBJIHRoaW5rIElPIHN1YnN5c3RlbSB3YXMKPiA+
ID4gPiB3b3JraW5nIGluIGZ1bGwgc3BlZWQuCj4gPiA+Cj4gPiA+IEFzIGRvZXMgZXZlcnkgb3Ro
ZXIgcmVtb3RlbHkgbW9kZXJuIGZpbGUgc3lzdGVtLiAgQnV0IHRoYXQgbWVyZ2luZyBpcwo+ID4g
PiBzdXJwcmlzaW5nbHkgZXhwZW5zaXZlLCB3aGljaCBpcyB3aHkgdXNpbmcgZm9saW9zIGdldHMg
cmVhbGx5IG1ham9yCj4gPiA+IHBlcmZvcm1hbmNlIGltcHJvdmVtZW50cy4KPiA+ID4KPiA+ID4g
Rm9yIG9uZSBkb2luZyB0aGVzZSBjaGVja3MgdG8gbWVyZ2UgdG91Y2ggcXVpdGUgYSBmZXcgY2Fj
aGUgbGluZXMuCj4gPiA+IFNlY29uZCwgZGV2aWNlcyBhcmUgb2Z0ZW4gYSBsb3QgbW9yZSBlZmZp
Y2llbnQgaWYgdGhleSBzZWUgZmV3ZXIgU0dMCj4gPiA+IGVudHJpZXMuICBJLmUuIGhhdmluZyBh
IDFNQiBiaW8gYSBzaW5nbGUgU0dMIHRlbmRzIHRvIHdvcmsgYmV0dGVyIHRoYW4KPiA+ID4gaGF2
aW5nIDI1NiBvZiB0aGVtLgo+ID4gPiBUaGUgc2FtZSBpcyB0cnVlIGluIHRoZSBrZXJuZWwgY29k
ZSBpdHNlbGYsIGJvdGggaW4gdGhlIHN1Ym1pc3Npb24gcGF0aAo+ID4gPiAoZG1hIG1hcHBpbmcg
YW5kIGNvKSwgYW5kIGV2ZW4gbW9yZSBzbyBpbiB0aGUgcGFnZSBjYWNoZSBoYW5kbGluZwo+ID4g
PiBib3RoIGJlZm9yZSBzdWJtaXR0aW5nIGFuZCBpbiB0aGUgY29tcGxldGlvbiBwYXRoLgo+ID4g
Pgo+ID4gPiBTZWUgQmFydCdzIHBhdGNoIGFib3V0IGhvdyBsb25nIHRoZSB3YWxrIG9mIHRoZSBi
aW9fdmVjcyBpbiB0aGUgZjJmcwo+ID4gPiBjb21wbGV0aW9uIHBhdGggY2FuIHRha2UuICBXZSBo
YWQgc2ltaWxhciBpc3N1ZXMgaW4gWEZTIGV2ZW4gaW4gdGhlCj4gPiA+IHdvcmtxdWV1ZSBjb21w
bGV0aW9uIHBhdGggZHVlIHRvIGxhY2sgb2YgcmVzY2hlZHVsaW5nLCBhbmQgdGhlc2Ugc2ltcGx5
Cj4gPiA+IGdvIGF3YXkgd2hlbiB5b3UgZG8gdGhlIGZvbGlvIG1hbmlwdWxhdGlvbiBpbiBsYXJn
ZXIgY2h1bmtzIChMQVpZX1BSRUVNUFQKPiA+ID4gd291bGQgYXZvaWQgdGhlIG5lZWQgdG8gZXhw
bGljaXQgcmVzY2hlZHVsaW5nIHRoZXNlIGRheXMsIGJ1dCB0aGF0IGp1c3QKPiA+ID4gcGFwZXJz
IG92ZXIgdGhlIHN5bXB0b21zIGluIHRoaXMgY2FzZSkuCj4gPiA+Cj4gPgo+ID4gSSBzZWUuIFRo
YXQncyBhbHNvIHN1cGVyIGhlbHBmdWwuIExldCBtZSBraWNrIG9mZiB0aGUgbGFyZ2UgZm9saW8g
c3VwcG9ydCBhc2FwLgo+ID4gVGhhbmtzLgo+IAo+IEhpIEphZWdldWssCgpIaSBCYXJyeSwKCj4g
Cj4gTmFuemhlIGhhcyBwdXQgc2lnbmlmaWNhbnQgZWZmb3J0IGludG8gdGhpcyB3b3JrIGF0IFhp
YW9taSBvdmVyCj4gdGhlIHBhc3Qgc2V2ZXJhbCBtb250aHMuIExhcmdlIGZvbGlvcyBjYW4gbm93
IGJlIHN1cHBvcnRlZCBvbgo+IG5vbi1pbW11dGFibGUgZmlsZXMuCj4gCj4gSGUgaGFzIGNvbmR1
Y3RlZCBleHRlbnNpdmUgdGVzdGluZyBvbiB0aGUgUGl4ZWwgNiBhbmQgZml4ZWQgYQo+IG51bWJl
ciBvZiBoYW5ncyBkaXNjb3ZlcmVkIGR1cmluZyBkZXZlbG9wbWVudC4gSGUgaXMgc3RpbGwKPiBi
ZW5jaG1hcmtpbmcgcGVyZm9ybWFuY2UsIGJ1dCB0aGUgaW1wbGVtZW50YXRpb24gYXBwZWFycyB0
byBiZQo+IHJlYXNvbmFibHkgc3RhYmxlIGF0IHRoaXMgcG9pbnQuIFdlIGNhbiBydW4gQW5kcm9p
ZCBNb25rZXkgZm9yCj4gbWFueSBob3VycyB3aXRob3V0IG9ic2VydmluZyBhbnkgaGFuZ3MuCj4g
Cj4gSWYgeW91IHdvdWxkIGxpa2UgdG8gc2VlIGFuIFJGQywgSSBjYW4gYXNrIE5hbnpoZSB0byBz
ZW5kIG9uZQo+IGFzIHNvb24gYXMgcG9zc2libGUgYWZ0ZXIgc29tZSBjbGVhbnVwIGFuZCBwb2xp
c2hpbmcuCgpZZWFoLCBJIHdhcyBhYm91dCB0byByZWFjaCBvdXQgdG8geW91LiBMZXQncyBkbyBz
b21lIGRpc2N1c3Npb24Kb2ZmbGluZS4KClRoYW5rcywKCj4gCj4gQmVzdCByZWdhcmRzLAo+IEJh
cnJ5Cj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMv
bGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
