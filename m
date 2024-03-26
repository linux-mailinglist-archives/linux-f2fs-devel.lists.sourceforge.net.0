Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 028BC88C9DB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 17:52:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rpA27-000452-Gg;
	Tue, 26 Mar 2024 16:52:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rpA26-00044t-2q
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 16:52:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RL9rFuWBkn2MZGF1KDNQPapwJ7g1enFTqTh7wIAc0ys=; b=VXfUTMPyJcoOlW0mozQUZpi8v4
 f66f+fIhzPDHp4k4sO49jHDwXNqC9kok1CZ3/To1V6YVGoeNr8rjBfFmkZsqMs3P6pOWR9tLvVmt5
 usgbhV+bxs+YNbMVEN+N7OcE2st7ollxmR/kNVFsLT4ZzkCbefJofsTkFzobbeHaRWeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RL9rFuWBkn2MZGF1KDNQPapwJ7g1enFTqTh7wIAc0ys=; b=OzAHJvMKyUkLi33SjhrnplfYLX
 VBrDoVhxKehR5WCH1JtLfG8sLsq2BGqE9a4cNsfVmF6KsovbiK9S331CjzF0CJ/wMyXbxHrG4O4K6
 aE2hs4rVrxBJVVbylnpUSbM0XMtfPmzjQUmXfsyxv6LzTwLr9y3ucshvgWi+h1XG6CVI=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rpA21-0000dr-45 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 16:52:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A5857CE2266;
 Tue, 26 Mar 2024 16:52:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B63ACC433C7;
 Tue, 26 Mar 2024 16:52:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711471925;
 bh=VGvzPDcwbNrB7wKDzQn4uUId9Ig5vPtwkz+8ZQqrXYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=i0DTX3OfeIm6YD6OdHw6XMb8uCR9Z76AcPa8PWbQnad9qf6RLepfxF5YX3K7SAAdp
 VKZ2d8+V8DBmfmlItdFCTflf0a8NYFgs3S8RAC5KvB11pQu6aue3IWw9v7pHGUFWgh
 5ggMKUhHt7sdv1j3FgdmPpfdVqlrtnpFk9egkskBzHkJoaT2zsMkICjzSe0czmW4k5
 EMGJCFKKg6KeDtAlw6ejWsCyDbLDkML0y0gLc0THsloZKj65kMw8h6DgDyuBo8Fxv3
 tRbb/xR9unKwIEfyHn8lzHIjvQoexEDLMyTpGY9AILPOz+PHBWqdD0WmxxQKu1KbDN
 oeu/NE0C0lh9Q==
Date: Tue, 26 Mar 2024 16:52:04 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Message-ID: <ZgL9NLLiSdDeIMg_@google.com>
References: <20240320001442.497813-1-jaegeuk@kernel.org>
 <20240321224233.2541-1-hdanton@sina.com>
 <ZfzQz5hwECOEGYVL@google.com>
 <SI2PR03MB52607606AB0D29C8AB123C1484312@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <Zf4FIAkI83GbQYLB@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Zf4FIAkI83GbQYLB@google.com>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 03/22, Jaegeuk Kim wrote: > On 03/22, Light Hsieh (謝明燈)
    wrote: > > I don't see my added log in sb_free_unlock() which will invoke
    percpu_up_write to release the write semaphore. > > May I ask [...] 
 
 Content analysis details:   (-2.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
                             medium trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rpA21-0000dr-45
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

T24gMDMvMjIsIEphZWdldWsgS2ltIHdyb3RlOgo+IE9uIDAzLzIyLCBMaWdodCBIc2llaCAo6Kyd
5piO54eIKSB3cm90ZToKPiA+IEkgZG9uJ3Qgc2VlIG15IGFkZGVkIGxvZyBpbiBzYl9mcmVlX3Vu
bG9jaygpIHdoaWNoIHdpbGwgaW52b2tlIHBlcmNwdV91cF93cml0ZSB0byByZWxlYXNlIHRoZSB3
cml0ZSBzZW1hcGhvcmUuCj4gCj4gTWF5IEkgYXNrIG1vcmUgZGV0YWlscyB3aGV0aGVyIHRoYXdf
c3VwZXIoKSB3YXMgY2FsbGVkIG9yIG5vdD8KClBpbmc/Cgo+IAo+ID4gCj4gPiAKPiA+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiDlr4Tku7bogIU6IEphZWdldWsgS2ltIDxq
YWVnZXVrQGtlcm5lbC5vcmc+Cj4gPiDlr4Tku7bml6XmnJ86IDIwMjTlubQz5pyIMjLml6Ug5LiK
5Y2IIDA4OjI5Cj4gPiDmlLbku7bogIU6IEhpbGxmIERhbnRvbiA8aGRhbnRvbkBzaW5hLmNvbT4K
PiA+IOWJr+acrDogbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZn
ZXIua2VybmVsLm9yZz47IExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIDxMaWdodC5Ic2llaEBtZWRp
YXRlay5jb20+OyBsaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldCA8bGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+Cj4gPiDkuLvml6g6IFJlOiBbUEFUQ0hd
IGYyZnM6IGF2b2lkIHRoZSBkZWFkbG9jayBjYXNlIHdoZW4gc3RvcHBpbmcgZGlzY2FyZCB0aHJl
YWQKPiA+IAo+ID4gCj4gPiBFeHRlcm5hbCBlbWFpbCA6IFBsZWFzZSBkbyBub3QgY2xpY2sgbGlu
a3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bnRpbCB5b3UgaGF2ZSB2ZXJpZmllZCB0aGUgc2VuZGVy
IG9yIHRoZSBjb250ZW50Lgo+ID4gCj4gPiBPbiAwMy8yMiwgSGlsbGYgRGFudG9uIHdyb3RlOgo+
ID4gPiBPbiBUdWUsIDE5IE1hciAyMDI0IDE3OjE0OjQyIC0wNzAwIEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+Cj4gPiA+ID4gZjJmc19pb2Nfc2h1dGRvd24oRjJGU19HT0lOR19ET1dO
X05PU1lOQykgIGlzc3VlX2Rpc2NhcmRfdGhyZWFkCj4gPiA+ID4gIC0gbW50X3dhbnRfd3JpdGVf
ZmlsZSgpCj4gPiA+ID4gICAgLSBzYl9zdGFydF93cml0ZShTQl9GUkVFWkVfV1JJVEUpCj4gPiA+
ICBfX3NiX3N0YXJ0X3dyaXRlKCkKPiA+ID4gICAgcGVyY3B1X2Rvd25fcmVhZCgpCj4gPiA+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBzYl9zdGFydF9p
bnR3cml0ZShTQl9GUkVFWkVfRlMpOwo+ID4gPiAgICBfX3NiX3N0YXJ0X3dyaXRlKCkKPiA+ID4g
ICAgICBwZXJjcHVfZG93bl9yZWFkKCkKPiA+ID4KPiA+ID4gR2l2ZW4gbG9jayBhY3F1aXJlcnMg
Zm9yIHJlYWQgb24gYm90aCBzaWRlcywgd3RmIGRlYWRsb2NrIGFyZSB5b3UgZml4aW5nPwo+ID4g
Cj4gPiBEYW1uLiBJIGNvdWxkbid0IHRoaW5rIF93cml0ZSB1c2VzIF9yZWFkIHNlbS4KPiA+IAo+
ID4gPgo+ID4gPiA+ICAtIGYyZnNfc3RvcF9jaGVja3BvaW50KHNiaSwgZmFsc2UsICAgICAgICAg
ICAgOiB3YWl0aW5nCj4gPiA+ID4gICAgIFNUT1BfQ1BfUkVBU09OX1NIVVRET1dOKTsKPiA+ID4g
PiAgLSBmMmZzX3N0b3BfZGlzY2FyZF90aHJlYWQoc2JpKTsKPiA+ID4gPiAgICAtIGt0aHJlYWRf
c3RvcCgpCj4gPiA+ID4gICAgICA6IHdhaXRpbmcKPiA+ID4gPgo+ID4gPiA+ICAtIG1udF9kcm9w
X3dyaXRlX2ZpbGUoZmlscCk7Cj4gPiA+Cj4gPiA+IE1vcmUgaW1wb3J0YW50LCBmZWVsIGZyZWUg
dG8gYWRkIGluIHNwaW4uCj4gPiAKPiA+IEkgcG9zdGVkIHRoaXMgcGF0Y2ggYmVmb3JlIExpZ2h0
IHJlcG9ydGVkLgo+ID4gCj4gPiBBbmQsIGluIHRoZSByZXBvcnQsIEkgZGlkbid0IGdldCB0aGlz
Ogo+ID4gCj4gPiBmMmZzX2lvY19zaHV0ZG93bigpIC0tPiBmcmVlemVfYmRldigpIC0tPiBmcmVl
emVfc3VwZXIoKSAtLT4gc2Jfd2FpdF93cml0ZShzYiwgU0JfRlJFRVpFX0ZTKSAtLT4gLi4uIC0+
cGVyY3B1X2Rvd25fd3JpdGUoKS4KPiA+IAo+ID4gYmVjYXVzZSBmMmZzX2lvY19zaHV0ZG93bigp
IGNhbGxzIGYyZnNfc3RvcF9kaXNjYXJkX3RocmVhZCgpIGFmdGVyIHRoYXdfYmRldigpCj4gPiBs
aWtlIHRoaXMgb3JkZXIuCj4gPiAKPiA+ICAtPiBmcmVlemVfYmRldigpCj4gPiAgLT4gdGhhd19i
ZGV2KCkKPiA+ICAtPiBmMmZzX3N0b3BfZGlzY2FyZF90aHJlYWQoKQo+ID4gCj4gPiBBbSBJIG1p
c3Npbmcgc29tZXRoaW5nPwo+ID4gCj4gPiA+Cj4gPiA+IFJlcG9ydGVkLWJ5OiAiTGlnaHQgSHNp
ZWggKOisneaYjueHiCkiIDxMaWdodC5Ic2llaEBtZWRpYXRlay5jb20+Cj4gPiAKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
