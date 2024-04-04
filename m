Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71AD8898F48
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Apr 2024 21:56:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rsTBo-0004S5-IO;
	Thu, 04 Apr 2024 19:56:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rsTBm-0004Rz-KL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 19:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cEXMXmfHQZnzFlOGBBuh61Bcm1qVtzQ+kjaGR7HPgTc=; b=IjqbhgCSeThUsd2X8yhOUCbIyY
 fo0F5lmfOm7xqnaEL4Sp2vqYMHblxdGtbeEolmC92ufdniRwEJnaJZuE11SF1rTdhuWaUwGYqpQ4u
 wHI9dK2l4q7b9q310HAZUR5pRBeeQeFWliKYvuA/yPb/GJ8taPbftlFmOCSXSVvY1wMg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cEXMXmfHQZnzFlOGBBuh61Bcm1qVtzQ+kjaGR7HPgTc=; b=NjFnnpQneCEkwwwzEbtSQYLS9x
 CynJJyqGQlsa/Xugu64f3vQu3dvT07oyPTiCY89qItv07VzG6ASh+TLHhDsK2xTyhsmsFCXwqDwUV
 VVLawUBenjlhPpMZ6FxdzIL3xQi0xNxAf5/cF3/EBqmkiOLlqiGJ8z7of1HZXem167n0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rsTBk-0003zD-E3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Apr 2024 19:55:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0569CE2086;
 Thu,  4 Apr 2024 19:55:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0600BC433F1;
 Thu,  4 Apr 2024 19:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712260544;
 bh=EpILh+wb4KCEI3yEhXzuXtGDiLSGEDMU1ojOng1rrks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pr/AKpWwpMNMG2eBSfzUc5T11uNTSkOUuUP7xwsV78y4+DgBKF+Or8iPbyYWJAGSt
 9y75mzD3jPQTGeWgX88sHDcfifz66ixCQC0JgpBc7CZ2fB4VD4Z4HcMR3fYQVofABl
 28wNvA1B0vMrbNQJyGxQCJ6RStbZCjskxxOPrUwza+V62wnqsj1hel8tI/GjdKQ1rQ
 5+i93e1HCqXFFf+9MHONUqkYlVWotmypVZonEO+B5+I9KRtfxYilne/Z3ilAD7k7hD
 xtsfXowoxPfdM739dGjnUfpzkL7z2bLkmgGDSZqga05yFdped1aCeQTLNENrGkpJh6
 hbBxtgiyBrBvw==
Date: Thu, 4 Apr 2024 19:55:42 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Message-ID: <Zg8Fvu1X_4uqQl9A@google.com>
References: <20240320001442.497813-1-jaegeuk@kernel.org>
 <20240321224233.2541-1-hdanton@sina.com>
 <ZfzQz5hwECOEGYVL@google.com>
 <SI2PR03MB52607606AB0D29C8AB123C1484312@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <Zf4FIAkI83GbQYLB@google.com> <ZgL9NLLiSdDeIMg_@google.com>
 <SI2PR03MB526041E42B6BD9C9DA9FBAC184352@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <SI2PR03MB5260819B5B1719063EFF458A843D2@SI2PR03MB5260.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SI2PR03MB5260819B5B1719063EFF458A843D2@SI2PR03MB5260.apcprd03.prod.outlook.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 04/03, Light Hsieh (謝明燈) wrote: > Our log shows that
    thaw_super_locked() find that sb is readonly, so sb_freeze_unlock() is not
    invoked. > > static int thaw_super_locked(struct super_block * [...] 
 
 Content analysis details:   (-2.5 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rsTBk-0003zD-E3
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue6KaGOiDlm57opoY6IFtQQVRDSF0gZjJmczog?=
 =?utf-8?q?avoid_the_deadlock_case_when_stopping_discard_thread?=
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
Cc: Hillf Danton <hdanton@sina.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDQvMDMsIExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIHdyb3RlOgo+IE91ciBsb2cgc2hvd3Mg
dGhhdCB0aGF3X3N1cGVyX2xvY2tlZCgpIGZpbmQgdGhhdCBzYiBpcyByZWFkb25seSzCoHNvIHNi
X2ZyZWV6ZV91bmxvY2soKSBpcyBub3QgaW52b2tlZC4KPiAKPiBzdGF0aWMgaW50IHRoYXdfc3Vw
ZXJfbG9ja2VkKHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGVudW0gZnJlZXplX2hvbGRlciB3aG8p
Cj4gewo+IOKAguKAguKAguKAguKAguKAgi4uLgo+IOKAguKAguKAguKAguKAguKAgmlmIChzYl9y
ZG9ubHkoc2IpKSB7Cj4g4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCc2ItPnNf
d3JpdGVycy5mcmVlemVfaG9sZGVycyAmPSB+d2hvOwo+IOKAguKAguKAguKAguKAguKAguKAguKA
guKAguKAguKAguKAgnNiLT5zX3dyaXRlcnMuZnJvemVuID0gU0JfVU5GUk9aRU47Cj4g4oCC4oCC
4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCd2FrZV91cF92YXIoJnNiLT5zX3dyaXRlcnMu
ZnJvemVuKTsKPiDigILigILigILigILigILigILigILigILigILigILigILigIJnb3RvIG91dDsK
PiDigILigILigILigILigILigIJ9Cj4gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAuLi4KPiDigILi
gILigILigILigILigIJzYl9mcmVlemVfdW5sb2NrKHNiLCBTQl9GUkVFWkVfRlMpOwo+IG91dDoK
PiDigILigILigILigILigILigIJkZWFjdGl2YXRlX2xvY2tlZF9zdXBlcihzYik7Cj4g4oCC4oCC
4oCC4oCC4oCC4oCCcmV0dXJuIDA7Cj4gfQoKVGhhbmsgeW91LiBDb3VsZCB5b3UgcGxlYXNlIHRh
a2UgYSBsb29rIGF0IHRoaXMgcGF0Y2g/CgpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51eC1m
MmZzLWRldmVsLzIwMjQwNDA0MTk1MjU0LjU1Njg5Ni0xLWphZWdldWtAa2VybmVsLm9yZy9ULyN1
Cgo+IAo+IOWvhOS7tuiAhTrCoEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4g5a+E
5Lu25pel5pyfOsKgMjAyNOW5tDPmnIgyN+aXpSDkuIrljYggMTI6NTIKPiDmlLbku7bogIU6wqBM
aWdodCBIc2llaCAo6Kyd5piO54eIKSA8TGlnaHQuSHNpZWhAbWVkaWF0ZWsuY29tPgo+IOWJr+ac
rDrCoEhpbGxmIERhbnRvbiA8aGRhbnRvbkBzaW5hLmNvbT47IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBsaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQ+Cj4g5Li75peoOsKgUmU6IOWbnuimhjogW1BBVENIXSBmMmZzOiBhdm9pZCB0aGUgZGVh
ZGxvY2sgY2FzZSB3aGVuIHN0b3BwaW5nIGRpc2NhcmQgdGhyZWFkCj4gwqAKPiAKPiBFeHRlcm5h
bCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lgo+IE9uIDAz
LzIyLCBKYWVnZXVrIEtpbSB3cm90ZToKPiA+IE9uIDAzLzIyLCBMaWdodCBIc2llaCAo6Kyd5piO
54eIKSB3cm90ZToKPiA+ID4gSSBkb24ndCBzZWUgbXkgYWRkZWQgbG9nIGluIHNiX2ZyZWVfdW5s
b2NrKCkgd2hpY2ggd2lsbCBpbnZva2UgcGVyY3B1X3VwX3dyaXRlIHRvIHJlbGVhc2UgdGhlIHdy
aXRlIHNlbWFwaG9yZS4KPiA+IAo+ID4gTWF5IEkgYXNrIG1vcmUgZGV0YWlscyB3aGV0aGVyIHRo
YXdfc3VwZXIoKSB3YXMgY2FsbGVkIG9yIG5vdD8KPiAKPiBQaW5nPwo+IAo+ID4gCj4gPiA+IAo+
ID4gPiAKPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4g5a+E5Lu2
6ICFOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gPiDlr4Tku7bml6XmnJ86
IDIwMjTlubQz5pyIMjLml6Ug5LiK5Y2IIDA4OjI5Cj4gPiA+IOaUtuS7tuiAhTogSGlsbGYgRGFu
dG9uIDxoZGFudG9uQHNpbmEuY29tPgo+ID4gPiDlia/mnKw6IGxpbnV4LWtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBMaWdodCBIc2llaCAo6Kyd
5piO54eIKSA8TGlnaHQuSHNpZWhAbWVkaWF0ZWsuY29tPjsgbGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Pgo+ID4gPiDkuLvml6g6IFJlOiBbUEFUQ0hdIGYyZnM6IGF2b2lkIHRoZSBkZWFkbG9jayBjYXNl
IHdoZW4gc3RvcHBpbmcgZGlzY2FyZCB0aHJlYWQKPiA+ID4gCj4gPiA+IAo+ID4gPiBFeHRlcm5h
bCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1
bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250ZW50Lgo+ID4gPiAK
PiA+ID4gT24gMDMvMjIsIEhpbGxmIERhbnRvbiB3cm90ZToKPiA+ID4gPiBPbiBUdWUsIDE5IE1h
ciAyMDI0IDE3OjE0OjQyIC0wNzAwIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4g
PiA+ID4gPiBmMmZzX2lvY19zaHV0ZG93bihGMkZTX0dPSU5HX0RPV05fTk9TWU5DKSAgaXNzdWVf
ZGlzY2FyZF90aHJlYWQKPiA+ID4gPiA+ICAtIG1udF93YW50X3dyaXRlX2ZpbGUoKQo+ID4gPiA+
ID4gICAgLSBzYl9zdGFydF93cml0ZShTQl9GUkVFWkVfV1JJVEUpCj4gPiA+ID4gIF9fc2Jfc3Rh
cnRfd3JpdGUoKQo+ID4gPiA+ICAgIHBlcmNwdV9kb3duX3JlYWQoKQo+ID4gPiA+ID4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBzYl9zdGFydF9pbnR3cml0
ZShTQl9GUkVFWkVfRlMpOwo+ID4gPiA+ICAgIF9fc2Jfc3RhcnRfd3JpdGUoKQo+ID4gPiA+ICAg
ICAgcGVyY3B1X2Rvd25fcmVhZCgpCj4gPiA+ID4KPiA+ID4gPiBHaXZlbiBsb2NrIGFjcXVpcmVy
cyBmb3IgcmVhZCBvbiBib3RoIHNpZGVzLCB3dGYgZGVhZGxvY2sgYXJlIHlvdSBmaXhpbmc/Cj4g
PiA+IAo+ID4gPiBEYW1uLiBJIGNvdWxkbid0IHRoaW5rIF93cml0ZSB1c2VzIF9yZWFkIHNlbS4K
PiA+ID4gCj4gPiA+ID4KPiA+ID4gPiA+ICAtIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFs
c2UsICAgICAgICAgICAgOiB3YWl0aW5nCj4gPiA+ID4gPiAgICAgU1RPUF9DUF9SRUFTT05fU0hV
VERPV04pOwo+ID4gPiA+ID4gIC0gZjJmc19zdG9wX2Rpc2NhcmRfdGhyZWFkKHNiaSk7Cj4gPiA+
ID4gPiAgICAtIGt0aHJlYWRfc3RvcCgpCj4gPiA+ID4gPiAgICAgIDogd2FpdGluZwo+ID4gPiA+
ID4KPiA+ID4gPiA+ICAtIG1udF9kcm9wX3dyaXRlX2ZpbGUoZmlscCk7Cj4gPiA+ID4KPiA+ID4g
PiBNb3JlIGltcG9ydGFudCwgZmVlbCBmcmVlIHRvIGFkZCBpbiBzcGluLgo+ID4gPiAKPiA+ID4g
SSBwb3N0ZWQgdGhpcyBwYXRjaCBiZWZvcmUgTGlnaHQgcmVwb3J0ZWQuCj4gPiA+IAo+ID4gPiBB
bmQsIGluIHRoZSByZXBvcnQsIEkgZGlkbid0IGdldCB0aGlzOgo+ID4gPiAKPiA+ID4gZjJmc19p
b2Nfc2h1dGRvd24oKSAtLT4gZnJlZXplX2JkZXYoKSAtLT4gZnJlZXplX3N1cGVyKCkgLS0+IHNi
X3dhaXRfd3JpdGUoc2IsIFNCX0ZSRUVaRV9GUykgLS0+IC4uLiAtPnBlcmNwdV9kb3duX3dyaXRl
KCkuCj4gPiA+IAo+ID4gPiBiZWNhdXNlIGYyZnNfaW9jX3NodXRkb3duKCkgY2FsbHMgZjJmc19z
dG9wX2Rpc2NhcmRfdGhyZWFkKCkgYWZ0ZXIgdGhhd19iZGV2KCkKPiA+ID4gbGlrZSB0aGlzIG9y
ZGVyLgo+ID4gPiAKPiA+ID4gIC0+IGZyZWV6ZV9iZGV2KCkKPiA+ID4gIC0+IHRoYXdfYmRldigp
Cj4gPiA+ICAtPiBmMmZzX3N0b3BfZGlzY2FyZF90aHJlYWQoKQo+ID4gPiAKPiA+ID4gQW0gSSBt
aXNzaW5nIHNvbWV0aGluZz8KPiA+ID4gCj4gPiA+ID4KPiA+ID4gPiBSZXBvcnRlZC1ieTogIkxp
Z2h0IEhzaWVoICjorJ3mmI7nh4gpIiA8TGlnaHQuSHNpZWhAbWVkaWF0ZWsuY29tPgo+ID4gPiAK
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
