Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB16088645A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 01:30:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnSnj-000067-8f;
	Fri, 22 Mar 2024 00:30:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rnSnh-00005q-S9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 00:30:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P6cEpJDtO0wxLDIKQ4vPJKsAoswjkpDV/hIdCUeIaVU=; b=lYgmwDmrN2M2tzv6yY2ScOQavB
 1EPDVLtIITgW5mwWhe6nAsFPjMJUULzzjUc0HCxWAc6zCTqQLhb7XFIz+Vt06yQLdSHiWKRB+/L0i
 vLn98Ng3Bal6Ov7NdQcYZNy6gxvfD9VRvae2Uw2Nfjp1EGkzVftpU/DWUQzoYJnHBXoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=P6cEpJDtO0wxLDIKQ4vPJKsAoswjkpDV/hIdCUeIaVU=; b=a8PfBTpCEaHDyyfWtZEdrKk1bY
 QqPLwjhEC2GFsaoH2BotN563MmkYpvzW5GOF0/7rTs5YyqREEcnolAxzCiGk2Qh3F+eFX06Bcsd0r
 R3ziCvyGvSXnOmfFlmoj7FGiXCEQmiAlKOYItxVo1C3hYJRlJOhAizRl5R5fgVTY66H8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rnSnh-0004BH-V6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 00:30:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 91AAE61326;
 Fri, 22 Mar 2024 00:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10E89C433C7;
 Fri, 22 Mar 2024 00:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711067415;
 bh=2oS5/+OU7q2OVdHinwRnMsJrZA2/4MZ9QA2WdIlydEA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ux/nyWo9nNAkSf12AXlufQGQjR6V7ttQc9xl9gx/p5iTArqdmZXMBGtPgW8LmpqcJ
 QIWqdxP1xrH5fRJExj42Go19TsNTxsKnB9AIRR5PCqlNICsGBz6jCu3cd2Bf7hRV9k
 ERf8kU4Nx3BFNcHF8u94UrUcAyD4ZNebUcWKdJxCd0lwA6fQMObMjvneicaGrv25an
 oY44zmBPfcHaeAFUGHdH1NsNQqbQboZKYdm6HaRvR6wVuQ+kid18nZzsf4QbJvJsMS
 Z+ObLWcyu25o5ufHXi32nlxr9HqVemAB26AE+MdcJvdQVvMUfBxLGwiHhZDIFHc2qr
 UsDG6VlfVFZeQ==
Date: Thu, 21 Mar 2024 17:30:13 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Message-ID: <ZfzRFU_cXkToBoQ0@google.com>
References: <0000000000000b4e27060ef8694c@google.com>
 <20240115120535.850-1-hdanton@sina.com>
 <4bbab168407600a07e1a0921a1569c96e4a1df31.camel@mediatek.com>
 <SI2PR03MB52600BD4AFAD1E324FD0430584332@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <ZftBxmBFmGCFg35I@google.com>
 <SI2PR03MB526094D44AB0A536BD0D1F5B84332@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <ZfuBt1QbfFfJ-IKz@google.com>
 <SI2PR03MB52605816252C9ABA3D8550F084322@SI2PR03MB5260.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SI2PR03MB52605816252C9ABA3D8550F084322@SI2PR03MB5260.apcprd03.prod.outlook.com>
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 03/21, Light Hsieh (謝明燈) wrote: > Do you mean: >
   > +           /* Avoid the deadlock from F2FS_GOING_DOWN_NOSYNC.
    */ > +           if (!sb_start_in [...] 
 
 Content analysis details:   (-5.6 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rnSnh-0004BH-V6
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue6KaGOiDlm57opoY6IGYyZnMgRjJGU19JT0Nf?=
 =?utf-8?q?SHUTDOWN_hang_issue?=
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
Cc: "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDMvMjEsIExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIHdyb3RlOgo+IERvIHlvdSBtZWFuOgo+
IAo+ICvigILigILigILigILigILigILigILigILigILigILigIIvKiBBdm9pZCB0aGUgZGVhZGxv
Y2sgZnJvbSBGMkZTX0dPSU5HX0RPV05fTk9TWU5DLiAqLwo+ICvigILigILigILigILigILigILi
gILigILigILigILigIJpZiAoIXNiX3N0YXJ0X2ludHdyaXRlX3RyeWxvY2soc2JpLT5zYikpCj4g
K+KAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgmNvbnRp
bnVlOwo+IAo+IEFmdGVyIGZhaWx1cmUgb2YgdHJ5bG9jaywgIHRoZSAnY29udGludWUnICBtYWtl
IGNvZGUgZmxvdyBnb3RvIHRoZSBsaW5lOgo+IOKAguKAguKAguKAguKAguKAgn0gd2hpbGUgKCFr
dGhyZWFkX3Nob3VsZF9zdG9wKCkpOwo+IFNpbmNlICBrdGhyYWRfc2hvdWxkX3N0b3AoKSBpcyB0
cnVlIG5vdywgc28gdGhlIGlzc3VlX2Rpc2NhcmRfdGhyZWFkIHdpbGwgZW5kPwoKWWVzLCBidXQg
bm93IEknbSBjb25mdXNlZCB3aG8gaXMgdGFraW5nIHdyaXRlX3NlbS4gOigKCj4gCj4gTGlnaHQK
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IOWvhOS7tuiAhTogSmFlZ2V1ayBL
aW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiDlr4Tku7bml6XmnJ86IDIwMjTlubQz5pyIMjHml6Ug
5LiK5Y2IIDA4OjM5Cj4g5pS25Lu26ICFOiBMaWdodCBIc2llaCAo6Kyd5piO54eIKSA8TGlnaHQu
SHNpZWhAbWVkaWF0ZWsuY29tPgo+IOWJr+acrDogRWQgVHNhaSAo6JSh5a6X6LuSKSA8RWQuVHNh
aUBtZWRpYXRlay5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPjsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PjsgbGludXgtZnNkZXZl
bEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWZzZGV2ZWxAdmdlci5rZXJuZWwub3JnPjsgQ2h1bi1I
dW5nIFd1ICjlt6vpp7/lro8pIDxDaHVuLWh1bmcuV3VAbWVkaWF0ZWsuY29tPgo+IOS4u+aXqDog
UmU6IOWbnuimhjogZjJmcyBGMkZTX0lPQ19TSFVURE9XTiBoYW5nIGlzc3VlCj4gCj4gCj4gRXh0
ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVu
dHMgdW50aWwgeW91IGhhdmUgdmVyaWZpZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4KPiAK
PiAKPiBPbiAwMy8yMCwgTGlnaHQgSHNpZWggKOisneaYjueHiCkgd3JvdGU6Cj4gPiBPbiAyMDI0
LzMvMjAgODoxNCwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gPiA+IGYyZnNfaW9jX3NodXRkb3duKEYy
RlNfR09JTkdfRE9XTl9OT1NZTkMpICBpc3N1ZV9kaXNjYXJkX3RocmVhZAo+ID4gPiAgIC0gbW50
X3dhbnRfd3JpdGVfZmlsZSgpCj4gPiA+ICAgICAtIHNiX3N0YXJ0X3dyaXRlKFNCX0ZSRUVaRV9X
UklURSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IC0gc2Jfc3RhcnRfaW50d3JpdGUoU0JfRlJFRVpFX0ZTKTsKPiA+ID4gICAtIGYyZnNfc3RvcF9j
aGVja3BvaW50KHNiaSwgZmFsc2UsICAgICAgICAgICAgOiB3YWl0aW5nCj4gPiA+ICAgICAgU1RP
UF9DUF9SRUFTT05fU0hVVERPV04pOwo+ID4gPiAgIC0gZjJmc19zdG9wX2Rpc2NhcmRfdGhyZWFk
KHNiaSk7Cj4gPiA+ICAgICAtIGt0aHJlYWRfc3RvcCgpCj4gPiA+ICAgICAgIDogd2FpdGluZwo+
ID4gPgo+ID4gPiAgIC0gbW50X2Ryb3Bfd3JpdGVfZmlsZShmaWxwKTsKPiA+ID4KPiA+ID4gU2ln
bmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiA+Cj4gPiBUaGUg
Y2FzZSBJIGVuY291bnRlciBpcyBmMmZzX2ljX3NodXRkb3duIHdpdGggYXJnICBGMkZTX0dPSU5H
X0RPV05fRlVMTFNZTkMsIG5vdCAgRjJGU19HT0lOR19ET1dOX05PU1lOQy4KPiA+Cj4gPiBPciB5
b3UgYXJlIG1lYW5pbmcgdGhhdDogYmVzaWRlcyB0aGUga2VybmVsIHBhdGNoLCBJIG5lZWQgdG8g
Y2hhbmdlIHRoZSBpbnZva2VkIEYyRlNfSU9DX1NIVVRET1dOIHRvIHVzZSBhcmcgRjJGU19HT0lO
R19ET1dOX05PU1lOQz8KPiAKPiBJIHRoaW5rIHRoaXMgcGF0Y2ggYWxzbyBhZGRyZXNzZXMgeW91
ciBjYXNlIGJ5IHVzaW5nIHRyeWxvY2suCj4gCj4gPgo+ID4KPiA+Cj4gCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
