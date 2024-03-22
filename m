Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8962B8874D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 23:24:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnnJf-0005WV-Ks;
	Fri, 22 Mar 2024 22:24:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rnnJe-0005WP-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 22:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HGu1L3B3T+MqcUesktNMmqd2EjogD+U3RkUvnUZjqzc=; b=hiCfxN+wL0o8Np+JheRCnr1raa
 DYjLMsqamxy6ZNy5zDj0D9RJf77jrbiJAVmELrLgvyPHsjamF4jt5TQGC7Qfsb/VesdtvIlC52X3l
 4tzurg08aLddND4ll9yhJE/p6HIL3wLBFrZNvaF8NUh5oN6Yfzmguc75JBAveK2DjyrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HGu1L3B3T+MqcUesktNMmqd2EjogD+U3RkUvnUZjqzc=; b=T+eZ2ggwQOvOANB6/MsfZxwqy2
 mEPAj4K9cVLdQ+zSkt+rjUXN4SjaqN8xni8z2zp00Bh6tcSBZW0NtDbvk669x+oEanmg1w7Uf0k0H
 kPZdXuevJPVZGZz5P60LIinIctMd6pT18v0iB9pL3ynT5aW1FJRgZJ4EFNWVjOogPzSo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnnJZ-00072A-Sp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 22:24:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2AB2CCE18C0;
 Fri, 22 Mar 2024 22:24:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37C51C433F1;
 Fri, 22 Mar 2024 22:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711146274;
 bh=u9hLQq6AbccTuvOfTFuQN65uvQDoNtfDPvG6xM7TeA4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=THGcJ4YzFy+bIbZ5yw6EferzhNPNLNAFaPtsewBMPNNW+5dyCef7pSpzLtVSH1KFQ
 NxIkOcDhIhDOck+jrsDOzlf0tO1vDyN1grFlvCVLZo5gaNR6U1F7YRF51w/1CQL9BC
 TYhaFcARm1WIhHQp1XgJEkdR/MwaQp/I++cR6O895VhE8YVxViT/bK0IOIX8ThpMVU
 LEwinwAeVZerafNzdxgTCP49aJca7dmC5vqNULFc3p5eI9IonrJh/WzVHckBvPsqrV
 TZlfvZRTornG7hn3WTCbEyRYjhlZZNxg0ePBqY8hd1wNMAyG/sKqUDClekThul1Q5k
 lw3revJJdR8KQ==
Date: Fri, 22 Mar 2024 22:24:32 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Message-ID: <Zf4FIAkI83GbQYLB@google.com>
References: <20240320001442.497813-1-jaegeuk@kernel.org>
 <20240321224233.2541-1-hdanton@sina.com>
 <ZfzQz5hwECOEGYVL@google.com>
 <SI2PR03MB52607606AB0D29C8AB123C1484312@SI2PR03MB5260.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SI2PR03MB52607606AB0D29C8AB123C1484312@SI2PR03MB5260.apcprd03.prod.outlook.com>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 03/22, Light Hsieh (謝明燈) wrote: > I don't see my
   added log in sb_free_unlock() which will invoke percpu_up_write to release
    the write semaphore. May I ask more details whether thaw_super() was called
    or not? 
 
 Content analysis details:   (-2.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rnnJZ-00072A-Sp
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue6KaGOiBbUEFUQ0hdIGYyZnM6IGF2b2lkIHRo?=
 =?utf-8?q?e_deadlock_case_when_stopping_discard_thread?=
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

T24gMDMvMjIsIExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIHdyb3RlOgo+IEkgZG9uJ3Qgc2VlIG15
IGFkZGVkIGxvZyBpbiBzYl9mcmVlX3VubG9jaygpIHdoaWNoIHdpbGwgaW52b2tlIHBlcmNwdV91
cF93cml0ZSB0byByZWxlYXNlIHRoZSB3cml0ZSBzZW1hcGhvcmUuCgpNYXkgSSBhc2sgbW9yZSBk
ZXRhaWxzIHdoZXRoZXIgdGhhd19zdXBlcigpIHdhcyBjYWxsZWQgb3Igbm90PwoKPiAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IOWvhOS7tuiAhTogSmFlZ2V1ayBLaW0g
PGphZWdldWtAa2VybmVsLm9yZz4KPiDlr4Tku7bml6XmnJ86IDIwMjTlubQz5pyIMjLml6Ug5LiK
5Y2IIDA4OjI5Cj4g5pS25Lu26ICFOiBIaWxsZiBEYW50b24gPGhkYW50b25Ac2luYS5jb20+Cj4g
5Ymv5pysOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnPjsgTGlnaHQgSHNpZWggKOisneaYjueHiCkgPExpZ2h0LkhzaWVoQG1lZGlhdGVr
LmNvbT47IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0IDxsaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4KPiDkuLvml6g6IFJlOiBbUEFUQ0hdIGYyZnM6
IGF2b2lkIHRoZSBkZWFkbG9jayBjYXNlIHdoZW4gc3RvcHBpbmcgZGlzY2FyZCB0aHJlYWQKPiAK
PiAKPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBh
dHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVyIG9yIHRoZSBjb250
ZW50Lgo+IAo+IE9uIDAzLzIyLCBIaWxsZiBEYW50b24gd3JvdGU6Cj4gPiBPbiBUdWUsIDE5IE1h
ciAyMDI0IDE3OjE0OjQyIC0wNzAwIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+Cj4g
PiA+IGYyZnNfaW9jX3NodXRkb3duKEYyRlNfR09JTkdfRE9XTl9OT1NZTkMpICBpc3N1ZV9kaXNj
YXJkX3RocmVhZAo+ID4gPiAgLSBtbnRfd2FudF93cml0ZV9maWxlKCkKPiA+ID4gICAgLSBzYl9z
dGFydF93cml0ZShTQl9GUkVFWkVfV1JJVEUpCj4gPiAgX19zYl9zdGFydF93cml0ZSgpCj4gPiAg
ICBwZXJjcHVfZG93bl9yZWFkKCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgLSBzYl9zdGFydF9pbnR3cml0ZShTQl9GUkVFWkVfRlMpOwo+ID4gICAg
X19zYl9zdGFydF93cml0ZSgpCj4gPiAgICAgIHBlcmNwdV9kb3duX3JlYWQoKQo+ID4KPiA+IEdp
dmVuIGxvY2sgYWNxdWlyZXJzIGZvciByZWFkIG9uIGJvdGggc2lkZXMsIHd0ZiBkZWFkbG9jayBh
cmUgeW91IGZpeGluZz8KPiAKPiBEYW1uLiBJIGNvdWxkbid0IHRoaW5rIF93cml0ZSB1c2VzIF9y
ZWFkIHNlbS4KPiAKPiA+Cj4gPiA+ICAtIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2Us
ICAgICAgICAgICAgOiB3YWl0aW5nCj4gPiA+ICAgICBTVE9QX0NQX1JFQVNPTl9TSFVURE9XTik7
Cj4gPiA+ICAtIGYyZnNfc3RvcF9kaXNjYXJkX3RocmVhZChzYmkpOwo+ID4gPiAgICAtIGt0aHJl
YWRfc3RvcCgpCj4gPiA+ICAgICAgOiB3YWl0aW5nCj4gPiA+Cj4gPiA+ICAtIG1udF9kcm9wX3dy
aXRlX2ZpbGUoZmlscCk7Cj4gPgo+ID4gTW9yZSBpbXBvcnRhbnQsIGZlZWwgZnJlZSB0byBhZGQg
aW4gc3Bpbi4KPiAKPiBJIHBvc3RlZCB0aGlzIHBhdGNoIGJlZm9yZSBMaWdodCByZXBvcnRlZC4K
PiAKPiBBbmQsIGluIHRoZSByZXBvcnQsIEkgZGlkbid0IGdldCB0aGlzOgo+IAo+IGYyZnNfaW9j
X3NodXRkb3duKCkgLS0+IGZyZWV6ZV9iZGV2KCkgLS0+IGZyZWV6ZV9zdXBlcigpIC0tPiBzYl93
YWl0X3dyaXRlKHNiLCBTQl9GUkVFWkVfRlMpIC0tPiAuLi4gLT5wZXJjcHVfZG93bl93cml0ZSgp
Lgo+IAo+IGJlY2F1c2UgZjJmc19pb2Nfc2h1dGRvd24oKSBjYWxscyBmMmZzX3N0b3BfZGlzY2Fy
ZF90aHJlYWQoKSBhZnRlciB0aGF3X2JkZXYoKQo+IGxpa2UgdGhpcyBvcmRlci4KPiAKPiAgLT4g
ZnJlZXplX2JkZXYoKQo+ICAtPiB0aGF3X2JkZXYoKQo+ICAtPiBmMmZzX3N0b3BfZGlzY2FyZF90
aHJlYWQoKQo+IAo+IEFtIEkgbWlzc2luZyBzb21ldGhpbmc/Cj4gCj4gPgo+ID4gUmVwb3J0ZWQt
Ynk6ICJMaWdodCBIc2llaCAo6Kyd5piO54eIKSIgPExpZ2h0LkhzaWVoQG1lZGlhdGVrLmNvbT4K
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
