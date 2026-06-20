Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4c10GhswNmq88QYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 08:15:55 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ACCB6A866B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Jun 2026 08:15:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b="iRZ/Tudw";
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=HyInr6va;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=KcRJMD0+;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=VsL6mzAK;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NejvVrBmZ0MBM5JiO+g6XLW6YKdPUhk0ER/otJWuFu0=; b=iRZ/Tudwe69HrP2K/S8st+FYPy
	I0pCoT3aKP7BC4VFydwkqbvBDXJGG5Y+wmcGSRNRHKswhnpoTIs9W8fbcrdc0XMIRWy5qsMS1e0nZ
	Y5qScPtwGevTRqf5c+q1KgNPht28bwN0C0A4GI2MiirvdsjIGTgKysGM5wjmSHV2YU3Y=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1waozW-0004zU-RQ;
	Sat, 20 Jun 2026 06:15:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1waozV-0004zN-R0
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 06:15:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5mbKQMUS5RHoDZ+e9FdlwOzRUNcs85j+ZAvh2PsTiC0=; b=HyInr6vauiAKGjohjeHn2I3s83
 YHp6dj3pWD0xURur4BufU0JLQgPZ2zTkvCqnJIFp0Dzym5utcFt4Ef/JgQ2xDncu3P8NRBa1VvT2e
 DPgl4PLnfeKnbTQCL8hB/Kk5jAeYitXo+ZvnJC2NeM1ukPtnGpRWn3sm6qQg4dl7aYYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5mbKQMUS5RHoDZ+e9FdlwOzRUNcs85j+ZAvh2PsTiC0=; b=KcRJMD0+ItchBfmtZi17vr8jKZ
 Ckdz+2n1B1EbD1eMzTRQOOOpEMav+udzNFR0VXHf2flb9CfZuK6f98TMwwzQah9J8FNfjKPLXiIwo
 SkbfgONCVrOSyaskQfCVSBUVy4IDbB4mvZX85vT24pVUKqQrrbe/XyPqPiP6PfI3sl2I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1waozS-0007Re-0W for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Jun 2026 06:15:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 29001418DC;
 Sat, 20 Jun 2026 06:15:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E880F1F000E9;
 Sat, 20 Jun 2026 06:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1781936133;
 bh=5mbKQMUS5RHoDZ+e9FdlwOzRUNcs85j+ZAvh2PsTiC0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To;
 b=VsL6mzAK6O5NNaMLhaUpPkOMozfT0mkELmfkNNKXkDMFL5TmJH+lpo0L77JEivcyE
 ipfHkFxFE24/pbzbxfvBiyObOq1SJM+FnAABwe/o3HGH05dOqjNaT6XEnHHNKDb/NE
 8OU0kZEYOBk/G4KJnmEWXVUFBegMvXg9/b/13YC7BNEJ7VwDT0G3xy3fhvON+EdGnl
 ATieDfhNlI7s0PmVC09jCosGP8Cff7RVsWQYUEj9bvjKf4PBouqe8DBsuoiATQz/Yx
 DF4ErcY6cDs5vtNX8Lx86yOnpsh2KJFVvgpz05vglDnH2iTni+v+JW8VfEI09zASTv
 YQP+ZuWrsQrDg==
Message-ID: <462ef62b-d83c-463f-8f44-4843ac179c2f@kernel.org>
Date: Sat, 20 Jun 2026 14:15:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20260612115839.2065903-2-yangyongpeng.storage@gmail.com>
 <20260612115839.2065903-4-yangyongpeng.storage@gmail.com>
 <b380cd69-66db-4ef1-8d33-92ed6c34d263@kernel.org>
 <SEZPR02MB566231EECF99FCD70B8E410F99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
Content-Language: en-US
In-Reply-To: <SEZPR02MB566231EECF99FCD70B8E410F99E22@SEZPR02MB5662.apcprd02.prod.outlook.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/19/26 22:38, Yongpeng Yang wrote: > > On 6/15/26 8:05
 PM, Chao Yu via Linux-f2fs-devel wrote: >> On 6/12/26 19:58, Yongpeng Yang
 wrote: >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> >>> >>> P [...] 
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
X-Headers-End: 1waozS-0007Re-0W
Subject: Re: [f2fs-dev] [PATCH RESEND 3/5] f2fs: punch largest extent
 instead of dropping it entirely on overlap
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:email,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp];
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
X-Rspamd-Queue-Id: 7ACCB6A866B

T24gNi8xOS8yNiAyMjozOCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiAKPiBPbiA2LzE1LzI2IDg6
MDUgUE0sIENoYW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+IE9uIDYvMTIvMjYg
MTk6NTgsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+PiBGcm9tOiBZb25ncGVuZyBZYW5nIDx5YW5n
eW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Cj4+PiBQcmV2aW91c2x5LCB3aGVuIGFuIGV4dGVudCBi
ZWluZyBpbnNlcnRlZCBvdmVybGFwcyB3aXRoIHRoZSBsYXJnZXN0Cj4+PiBleHRlbnQsIHRoZSBs
YXJnZXN0IGV4dGVudCBpcyBkcm9wcGVkIGVudGlyZWx5LiBUaGlzIHdhcyBkb25lIHRvIGhhbmRs
ZQo+Pgo+PiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIG1pc3NlZCBhbnl0aGluZywgSSByZW1lbWJl
ciB0aGF0IHdlIHdpbGwgYWRkIGxhcmdlc3QKPj4gZXh0ZW50IGluIGJlbG93IHBhdGg/Cj4+Cj4+
IC0gX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UKPj4gwqAgLSBfX2luc2VydF9leHRlbnRfdHJl
ZQo+PiDCoMKgIC0gX190cnlfdXBkYXRlX2xhcmdlc3RfZXh0ZW50IDogdXBkYXRlIGxhcmdlc3Qg
dy8gcmlnaHQgZXh0ZW50Cj4+IMKgIC0gX190cnlfdXBkYXRlX2xhcmdlc3RfZXh0ZW50IDogdXBk
YXRlIGxhcmdlc3Qgdy8gbGVmdCBleHRlbnQKPiAKPiBUaGUgbGFyZ2VzdCBleHRlbnQgbWlnaHQg
bm90IHJlc2lkZSBpbiB0aGUgZXh0ZW50IHRyZWUuIElmCj4gX191cGRhdGVfZXh0ZW50X3RyZWVf
cmFuZ2UgaW52b2tlcyBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQsIHRoZSBsZW5ndGggb2YKCkkgbWVh
bnQgX191cGRhdGVfZXh0ZW50X3RyZWVfcmFuZ2UgaW52b2tlcyBfX2Ryb3BfbGFyZ2VzdF9leHRl
bnQgdG8gZHJvcApsYXJnZXN0IGZpcnN0LCBhbmQgdGhlbiwgaXQgdHJpZXMgdG8gdXBkYXRlIGxh
cmdlc3QgZXh0ZW50IHcvIGxhcmdlci1zaXplCm9uZSBvZiBzZXBhcmF0ZWQgdHdvIGV4dGVudHMu
Cgo+IHRoZSBsYXJnZXN0IGV4dGVudCB3aWxsIGhhdmUgYmVlbiBzZXQgdG8gemVyby4gQXMgYSBy
ZXN1bHQsIHRoZSBsYXJnZXN0Cj4gZXh0ZW50IHVwZGF0ZWQgaW5zaWRlIF9fdHJ5X3VwZGF0ZV9s
YXJnZXN0X2V4dGVudCBjYW4gZW5kIHVwIHNtYWxsZXIKPiB0aGFuIHRoZSBsYXJnZXN0IGV4dGVu
dCBvYnRhaW5lZCBhZnRlciBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50IGNvbXBsZXRlcwo+IGl0cyBw
dW5jaCBvcGVyYXRpb24uCgpJIGRpZG4ndCBnZXQgaXQsIGNhbiB5b3UgZ2l2ZSBhbiBleGFtcGxl
IGZvciB0aGlzPwoKVGhhbmtzLAoKPiAKPiBUaGFua3MKPiBZb25ncGVuZywKPiAKPj4KPj4gVGhh
bmtzLAo+Pgo+Pj4gdGhlIGNhc2Ugd2hlcmUgdGhlIGxhcmdlc3QgZXh0ZW50IGlzIG5vdCBpbiBt
ZW1vcnksIGF2b2lkaW5nCj4+PiBpbmNvbnNpc3RlbmN5IGJldHdlZW4gdGhlIGxhcmdlc3QgZXh0
ZW50IGFuZCB0aGUgZXh0ZW50IHRyZWUuCj4+Pgo+Pj4gVGhpcyBwYXRjaCBjaGFuZ2VzIHRoZSBz
ZW1hbnRpY3Mgb2YgX19kcm9wX2xhcmdlc3RfZXh0ZW50IChyZW5hbWVkIHRvCj4+PiBfX3B1bmNo
X2xhcmdlc3RfZXh0ZW50KTogaW5zdGVhZCBvZiBkaXNjYXJkaW5nIHRoZSBlbnRpcmUgbGFyZ2Vz
dAo+Pj4gZXh0ZW50IHdoZW4gYW55IG92ZXJsYXAgaXMgZGV0ZWN0ZWQsIGtlZXAgdGhlIGxhcmdl
ciByZW1haW5pbmcgcG9ydGlvbgo+Pj4gKGxlZnQgb3IgcmlnaHQpIGFmdGVyIHRoZSBwdW5jaC4g
VGhpcyBwcmVzZXJ2ZXMgZXh0ZW50IGNhY2hlIGNvdmVyYWdlCj4+PiBmb3IgdHJ1bmNhdGUgYW5k
IG92ZXJ3cml0ZSBvcGVyYXRpb25zIHRoYXQgb25seSBwYXJ0aWFsbHkgb3ZlcmxhcCB0aGUKPj4+
IGxhcmdlc3QgZXh0ZW50Lgo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFlvbmdwZW5nIFlhbmcgPHlh
bmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4gLS0tCj4+PiDCoCBmcy9mMmZzL2V4dGVudF9jYWNo
ZS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLQo+Pj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDI0IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMgYi9mcy9mMmZzL2V4dGVudF9jYWNoZS5jCj4+PiBp
bmRleCBmOGQ5NGRiNjBkYzYuLjgyZDg0YzRlOThiMiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMv
ZXh0ZW50X2NhY2hlLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZXh0ZW50X2NhY2hlLmMKPj4+IEBAIC0z
OTcsMTQgKzM5NywzMSBAQCBzdGF0aWMgdW5zaWduZWQgaW50IF9fZnJlZV9leHRlbnRfdHJlZShz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4+PiDCoMKgwqDCoMKgIHJldHVybiBjb3VudDsKPj4+
IMKgIH0KPj4+IC1zdGF0aWMgdm9pZCBfX2Ryb3BfbGFyZ2VzdF9leHRlbnQoc3RydWN0IGV4dGVu
dF90cmVlICpldCwKPj4+ICtzdGF0aWMgdm9pZCBfX3B1bmNoX2xhcmdlc3RfZXh0ZW50KHN0cnVj
dCBleHRlbnRfdHJlZSAqZXQsCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcGdvZmZfdCBmb2ZzLCB1bnNpZ25lZCBpbnQgbGVuKQo+Pj4gwqAgewo+Pj4gLcKg
wqDCoCBpZiAoZm9mcyA8IChwZ29mZl90KWV0LT5sYXJnZXN0LmZvZnMgKyBldC0+bGFyZ2VzdC5s
ZW4gJiYKPj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZvZnMgKyBsZW4gPiBldC0+bGFyZ2Vz
dC5mb2ZzKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVuID0gMDsKPj4+IC3C
oMKgwqDCoMKgwqDCoCBldC0+bGFyZ2VzdF91cGRhdGVkID0gdHJ1ZTsKPj4+ICvCoMKgwqAgdW5z
aWduZWQgaW50IGxhcmdlc3RfZW5kLCBwdW5jaF9lbmQ7Cj4+PiArwqDCoMKgIHVuc2lnbmVkIGlu
dCBsZWZ0X2xlbiwgcmlnaHRfbGVuOwo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoZm9mcyA+PSAocGdv
ZmZfdClldC0+bGFyZ2VzdC5mb2ZzICsgZXQtPmxhcmdlc3QubGVuIHx8Cj4+PiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBmb2ZzICsgbGVuIDw9IGV0LT5sYXJnZXN0LmZvZnMpCj4+PiArwqDCoMKg
wqDCoMKgwqAgcmV0dXJuOwo+Pj4gKwo+Pj4gK8KgwqDCoCAvKiBQdW5jaCBbZm9mcywgZm9mcyAr
IGxlbikgZnJvbSBsYXJnZXN0IGV4dGVudC4gKi8KPj4+ICvCoMKgwqAgbGFyZ2VzdF9lbmQgPSBl
dC0+bGFyZ2VzdC5mb2ZzICsgZXQtPmxhcmdlc3QubGVuOwo+Pj4gK8KgwqDCoCBwdW5jaF9lbmQg
PSBmb2ZzICsgbGVuOwo+Pj4gKwo+Pj4gK8KgwqDCoCBsZWZ0X2xlbiA9IGZvZnMgPiBldC0+bGFy
Z2VzdC5mb2ZzID8gZm9mcyAtIGV0LT5sYXJnZXN0LmZvZnMgOiAwOwo+Pj4gK8KgwqDCoCByaWdo
dF9sZW4gPSBsYXJnZXN0X2VuZCA+IHB1bmNoX2VuZCA/IGxhcmdlc3RfZW5kIC0gcHVuY2hfZW5k
IDogMDsKPj4+ICsKPj4+ICvCoMKgwqAgaWYgKGxlZnRfbGVuID49IHJpZ2h0X2xlbikgewo+Pj4g
K8KgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0LmxlbiA9IGxlZnRfbGVuOwo+Pj4gK8KgwqDCoCB9
IGVsc2Ugewo+Pj4gK8KgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0LmJsayArPSBwdW5jaF9lbmQg
LSBldC0+bGFyZ2VzdC5mb2ZzOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGV0LT5sYXJnZXN0LmZvZnMg
PSBwdW5jaF9lbmQ7Cj4+PiArwqDCoMKgwqDCoMKgwqAgZXQtPmxhcmdlc3QubGVuID0gcmlnaHRf
bGVuOwo+Pj4gwqDCoMKgwqDCoCB9Cj4+PiArwqDCoMKgIGV0LT5sYXJnZXN0X3VwZGF0ZWQgPSB0
cnVlOwo+Pj4gwqAgfQo+Pj4gwqAgdm9pZCBmMmZzX2luaXRfcmVhZF9leHRlbnRfdHJlZShzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZm9saW8gKmlmb2xpbykKPj4+IEBAIC02ODAsMTAgKzY5
NywxMCBAQCBzdGF0aWMgdm9pZCBfX3VwZGF0ZV9leHRlbnRfdHJlZV9yYW5nZShzdHJ1Y3QgaW5v
ZGUgKmlub2RlLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRlaS5sZW4gPSAwOwo+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgIC8qCj4+PiAtwqDCoMKgwqDCoMKgwqDCoCAqIGRyb3AgbGFyZ2VzdCBleHRl
bnQgYmVmb3JlIGxvb2t1cCwgaW4gY2FzZSBpdCdzIGFscmVhZHkKPj4+ICvCoMKgwqDCoMKgwqDC
oMKgICogcHVuY2ggbGFyZ2VzdCBleHRlbnQgYmVmb3JlIGxvb2t1cCwgaW4gY2FzZSBpdCdzIGFs
cmVhZHkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICogYmVlbiBzaHJ1bmsgZnJvbSBleHRlbnQg
dHJlZQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKi8KPj4+IC3CoMKgwqDCoMKgwqDCoCBfX2Ry
b3BfbGFyZ2VzdF9leHRlbnQoZXQsIGZvZnMsIGxlbik7Cj4+PiArwqDCoMKgwqDCoMKgwqAgX19w
dW5jaF9sYXJnZXN0X2V4dGVudChldCwgZm9mcywgbGVuKTsKPj4+IMKgwqDCoMKgwqAgfQo+Pj4g
wqDCoMKgwqDCoCBpZiAoZXQtPmxhcmdlc3QubGVuICE9IDAgJiYKPj4KPj4KPj4KPj4gX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
