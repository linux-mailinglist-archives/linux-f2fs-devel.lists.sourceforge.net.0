Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 554878A3749
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Apr 2024 22:51:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rvNrQ-00049a-2x;
	Fri, 12 Apr 2024 20:51:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rvNrM-00049R-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Apr 2024 20:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uyk+rfBSO8msG9obwHtp+JkQxZ4RGBDDH5IwxEOEoK4=; b=my7k1vCsd7MCalwd4KzfKJbeFg
 Bl9iC7a+2EYDkZ/0BYwkFMzkE60vjvUfBKomwnGCoydHlb3wxtIfRmYsKyVUrhVh9f9P6t5daEWtu
 L2wRa0oMSa0IKdj+q4KHtBDrrXI6trHbciNVBQOTRIlBErXYlWwunpoKgmYZw588+alE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uyk+rfBSO8msG9obwHtp+JkQxZ4RGBDDH5IwxEOEoK4=; b=OgZVuBKQgGWEuIjEmccXx/LHUX
 5IsZf1uH5y8PR2WzF4V3RcAO2iFdGZHCS6SaSYBwrAkCIDT61UUN7j05m7Zlm9cGElvaCDQZqNVq4
 dWhRub4TKo9u4CwBWuEMgEVPnwfMk5bfL9fY77OhKz8MuY6hdW8wH0DC96rKNxiZf+QQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rvNrL-0004Fo-OI for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Apr 2024 20:50:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 46B44CE3AC5;
 Fri, 12 Apr 2024 20:50:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5316CC113CC;
 Fri, 12 Apr 2024 20:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1712955048;
 bh=WPp/FYbWeS5ARJQ5SiuyphwKd3azVVv/gYSg+Jdoo4k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bCGYBt/2Lmp82WPEchbqOXPja/snqRGuVh1aVTGJ/nRYXPr2RRWcWuEZUY55rpsB+
 gfUcqNBFOsBODjlBNsD+DjVUXhVWdUfw4DajU21n3PDNEBrwAlZ01fphb9Ik119qzc
 iopYfiNu3gaHXtwUX5mp+fzPk4g9r3WpItojB6tJ4IxH/i3Sni0P2Qt88XmO1+xizF
 pmf3Gog6BYV7omMr6z8SEsujqWpor6s31/0tefk3Tls0ukVr/pDYMsIexrwMFOvW5j
 2p0Uv+xU+Xi6MayW0GWOHRd+XxArWawSzoeORCaE6PcoyJ+1hNHU6gcS8draPMXRXb
 0sWAlLbKaxrDQ==
Date: Fri, 12 Apr 2024 20:50:46 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Light Hsieh =?utf-8?B?KOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>
Message-ID: <Zhmepjudrjw0RRhn@google.com>
References: <20240320001442.497813-1-jaegeuk@kernel.org>
 <20240321224233.2541-1-hdanton@sina.com>
 <ZfzQz5hwECOEGYVL@google.com>
 <SI2PR03MB52607606AB0D29C8AB123C1484312@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <Zf4FIAkI83GbQYLB@google.com> <ZgL9NLLiSdDeIMg_@google.com>
 <SI2PR03MB526041E42B6BD9C9DA9FBAC184352@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <SI2PR03MB5260819B5B1719063EFF458A843D2@SI2PR03MB5260.apcprd03.prod.outlook.com>
 <Zg8Fvu1X_4uqQl9A@google.com>
 <SI2PR03MB52608626CE591F850F5F815384042@SI2PR03MB5260.apcprd03.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SI2PR03MB52608626CE591F850F5F815384042@SI2PR03MB5260.apcprd03.prod.outlook.com>
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 04/12, Light Hsieh (謝明燈) wrote: > I think 'readon'
    in this line may be typo of 'reason' Was fixed as well. Thanks. > > + f2fs_warn(sbi,
    "Stopped filesystem due to readon: %d", reason); > > > > 寄件者: Jaegeuk
    Kim <jaegeuk@kernel.org> > 寄件日期: 2024年4月5日 上午 03:55 >
   收件者: Light Hsieh (謝� [...] 
 
 Content analysis details:   (-7.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rvNrL-0004Fo-OI
Subject: Re: [f2fs-dev] =?utf-8?b?5Zue6KaGOiDlm57opoY6IOWbnuimhjogW1BBVENI?=
 =?utf-8?q?=5D_f2fs=3A_avoid_the_deadlock_case_when_stopping_discard_threa?=
 =?utf-8?q?d?=
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

T24gMDQvMTIsIExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIHdyb3RlOgo+IEkgdGhpbmsgJ3JlYWRv
bicgaW4gdGhpcyBsaW5lIG1heSBiZSB0eXBvIG9mICAncmVhc29uJwoKV2FzIGZpeGVkIGFzIHdl
bGwuIFRoYW5rcy4KCj4gCj4gKwkJZjJmc193YXJuKHNiaSwgIlN0b3BwZWQgZmlsZXN5c3RlbSBk
dWUgdG8gcmVhZG9uOiAlZCIsIHJlYXNvbik7Cj4gCj4gCj4gCj4g5a+E5Lu26ICFOsKgSmFlZ2V1
ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiDlr4Tku7bml6XmnJ86wqAyMDI05bm0NOaciDXm
l6Ug5LiK5Y2IIDAzOjU1Cj4g5pS25Lu26ICFOsKgTGlnaHQgSHNpZWggKOisneaYjueHiCkgPExp
Z2h0LkhzaWVoQG1lZGlhdGVrLmNvbT4KPiDlia/mnKw6wqBIaWxsZiBEYW50b24gPGhkYW50b25A
c2luYS5jb20+OyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnIDxsaW51eC1rZXJuZWxAdmdl
ci5rZXJuZWwub3JnPjsgbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQgPGxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Pgo+IOS4u+aXqDrCoFJlOiDlm57o
poY6IOWbnuimhjogW1BBVENIXSBmMmZzOiBhdm9pZCB0aGUgZGVhZGxvY2sgY2FzZSB3aGVuIHN0
b3BwaW5nIGRpc2NhcmQgdGhyZWFkCj4gwqAKPiAKPiBPbiAwNC8wMywgTGlnaHQgSHNpZWggKOis
neaYjueHiCkgd3JvdGU6Cj4gPiBPdXIgbG9nIHNob3dzIHRoYXQgdGhhd19zdXBlcl9sb2NrZWQo
KSBmaW5kIHRoYXQgc2IgaXMgcmVhZG9ubHkswqBzbyBzYl9mcmVlemVfdW5sb2NrKCkgaXMgbm90
IGludm9rZWQuCj4gPiAKPiA+IHN0YXRpYyBpbnQgdGhhd19zdXBlcl9sb2NrZWQoc3RydWN0IHN1
cGVyX2Jsb2NrICpzYiwgZW51bSBmcmVlemVfaG9sZGVyIHdobykKPiA+IHsKPiA+IOKAguKAguKA
guKAguKAguKAgi4uLgo+ID4g4oCC4oCC4oCC4oCC4oCC4oCCaWYgKHNiX3Jkb25seShzYikpIHsK
PiA+IOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKAgnNiLT5zX3dyaXRlcnMuZnJl
ZXplX2hvbGRlcnMgJj0gfndobzsKPiA+IOKAguKAguKAguKAguKAguKAguKAguKAguKAguKAguKA
guKAgnNiLT5zX3dyaXRlcnMuZnJvemVuID0gU0JfVU5GUk9aRU47Cj4gPiDigILigILigILigILi
gILigILigILigILigILigILigILigIJ3YWtlX3VwX3Zhcigmc2ItPnNfd3JpdGVycy5mcm96ZW4p
Owo+ID4g4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCC4oCCZ290byBvdXQ7Cj4gPiDi
gILigILigILigILigILigIJ9Cj4gPiDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoC4uLgo+ID4g4oCC
4oCC4oCC4oCC4oCC4oCCc2JfZnJlZXplX3VubG9jayhzYiwgU0JfRlJFRVpFX0ZTKTsKPiA+IG91
dDoKPiA+IOKAguKAguKAguKAguKAguKAgmRlYWN0aXZhdGVfbG9ja2VkX3N1cGVyKHNiKTsKPiA+
IOKAguKAguKAguKAguKAguKAgnJldHVybiAwOwo+ID4gfQo+IAo+IFRoYW5rIHlvdS4gQ291bGQg
eW91IHBsZWFzZSB0YWtlIGEgbG9vayBhdCB0aGlzIHBhdGNoPwo+IAo+IGh0dHBzOi8vbG9yZS5r
ZXJuZWwub3JnL2xpbnV4LWYyZnMtZGV2ZWwvMjAyNDA0MDQxOTUyNTQuNTU2ODk2LTEtamFlZ2V1
a0BrZXJuZWwub3JnL1QvI3UKPiAKPiA+IAo+ID4g5a+E5Lu26ICFOsKgSmFlZ2V1ayBLaW0gPGph
ZWdldWtAa2VybmVsLm9yZz4KPiA+IOWvhOS7tuaXpeacnzrCoDIwMjTlubQz5pyIMjfml6Ug5LiK
5Y2IIDEyOjUyCj4gPiDmlLbku7bogIU6wqBMaWdodCBIc2llaCAo6Kyd5piO54eIKSA8TGlnaHQu
SHNpZWhAbWVkaWF0ZWsuY29tPgo+ID4g5Ymv5pysOsKgSGlsbGYgRGFudG9uIDxoZGFudG9uQHNp
bmEuY29tPjsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZyA8bGludXgta2VybmVsQHZnZXIu
a2VybmVsLm9yZz47IGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0IDxsaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldD4KPiA+IOS4u+aXqDrCoFJlOiDlm57o
poY6IFtQQVRDSF0gZjJmczogYXZvaWQgdGhlIGRlYWRsb2NrIGNhc2Ugd2hlbiBzdG9wcGluZyBk
aXNjYXJkIHRocmVhZAo+ID4gwqAKPiA+IAo+ID4gRXh0ZXJuYWwgZW1haWwgOiBQbGVhc2UgZG8g
bm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW50aWwgeW91IGhhdmUgdmVyaWZp
ZWQgdGhlIHNlbmRlciBvciB0aGUgY29udGVudC4KPiA+IE9uIDAzLzIyLCBKYWVnZXVrIEtpbSB3
cm90ZToKPiA+ID4gT24gMDMvMjIsIExpZ2h0IEhzaWVoICjorJ3mmI7nh4gpIHdyb3RlOgo+ID4g
PiA+IEkgZG9uJ3Qgc2VlIG15IGFkZGVkIGxvZyBpbiBzYl9mcmVlX3VubG9jaygpIHdoaWNoIHdp
bGwgaW52b2tlIHBlcmNwdV91cF93cml0ZSB0byByZWxlYXNlIHRoZSB3cml0ZSBzZW1hcGhvcmUu
Cj4gPiA+IAo+ID4gPiBNYXkgSSBhc2sgbW9yZSBkZXRhaWxzIHdoZXRoZXIgdGhhd19zdXBlcigp
IHdhcyBjYWxsZWQgb3Igbm90Pwo+ID4gCj4gPiBQaW5nPwo+ID4gCj4gPiA+IAo+ID4gPiA+IAo+
ID4gPiA+IAo+ID4gPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+ID4g
5a+E5Lu26ICFOiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gPiA+IOWvhOS7
tuaXpeacnzogMjAyNOW5tDPmnIgyMuaXpSDkuIrljYggMDg6MjkKPiA+ID4gPiDmlLbku7bogIU6
IEhpbGxmIERhbnRvbiA8aGRhbnRvbkBzaW5hLmNvbT4KPiA+ID4gPiDlia/mnKw6IGxpbnV4LWtl
cm5lbEB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+OyBMaWdo
dCBIc2llaCAo6Kyd5piO54eIKSA8TGlnaHQuSHNpZWhAbWVkaWF0ZWsuY29tPjsgbGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQgPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Pgo+ID4gPiA+IOS4u+aXqDogUmU6IFtQQVRDSF0gZjJmczogYXZvaWQgdGhl
IGRlYWRsb2NrIGNhc2Ugd2hlbiBzdG9wcGluZyBkaXNjYXJkIHRocmVhZAo+ID4gPiA+IAo+ID4g
PiA+IAo+ID4gPiA+IEV4dGVybmFsIGVtYWlsIDogUGxlYXNlIGRvIG5vdCBjbGljayBsaW5rcyBv
ciBvcGVuIGF0dGFjaG1lbnRzIHVudGlsIHlvdSBoYXZlIHZlcmlmaWVkIHRoZSBzZW5kZXIgb3Ig
dGhlIGNvbnRlbnQuCj4gPiA+ID4gCj4gPiA+ID4gT24gMDMvMjIsIEhpbGxmIERhbnRvbiB3cm90
ZToKPiA+ID4gPiA+IE9uIFR1ZSwgMTkgTWFyIDIwMjQgMTc6MTQ6NDIgLTA3MDAgSmFlZ2V1ayBL
aW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiA+ID4gPiA+ID4gZjJmc19pb2Nfc2h1dGRvd24oRjJG
U19HT0lOR19ET1dOX05PU1lOQykgwqBpc3N1ZV9kaXNjYXJkX3RocmVhZAo+ID4gPiA+ID4gPiDC
oC0gbW50X3dhbnRfd3JpdGVfZmlsZSgpCj4gPiA+ID4gPiA+IMKgIMKgLSBzYl9zdGFydF93cml0
ZShTQl9GUkVFWkVfV1JJVEUpCj4gPiA+ID4gPiDCoF9fc2Jfc3RhcnRfd3JpdGUoKQo+ID4gPiA+
ID4gwqAgwqBwZXJjcHVfZG93bl9yZWFkKCkKPiA+ID4gPiA+ID4gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtIHNiX3N0
YXJ0X2ludHdyaXRlKFNCX0ZSRUVaRV9GUyk7Cj4gPiA+ID4gPiDCoCDCoF9fc2Jfc3RhcnRfd3Jp
dGUoKQo+ID4gPiA+ID4gwqAgwqAgwqBwZXJjcHVfZG93bl9yZWFkKCkKPiA+ID4gPiA+Cj4gPiA+
ID4gPiBHaXZlbiBsb2NrIGFjcXVpcmVycyBmb3IgcmVhZCBvbiBib3RoIHNpZGVzLCB3dGYgZGVh
ZGxvY2sgYXJlIHlvdSBmaXhpbmc/Cj4gPiA+ID4gCj4gPiA+ID4gRGFtbi4gSSBjb3VsZG4ndCB0
aGluayBfd3JpdGUgdXNlcyBfcmVhZCBzZW0uCj4gPiA+ID4gCj4gPiA+ID4gPgo+ID4gPiA+ID4g
PiDCoC0gZjJmc19zdG9wX2NoZWNrcG9pbnQoc2JpLCBmYWxzZSwgwqAgwqAgwqAgwqAgwqAgwqA6
IHdhaXRpbmcKPiA+ID4gPiA+ID4gwqAgwqAgU1RPUF9DUF9SRUFTT05fU0hVVERPV04pOwo+ID4g
PiA+ID4gPiDCoC0gZjJmc19zdG9wX2Rpc2NhcmRfdGhyZWFkKHNiaSk7Cj4gPiA+ID4gPiA+IMKg
IMKgLSBrdGhyZWFkX3N0b3AoKQo+ID4gPiA+ID4gPiDCoCDCoCDCoDogd2FpdGluZwo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiDCoC0gbW50X2Ryb3Bfd3JpdGVfZmlsZShmaWxwKTsKPiA+ID4gPiA+
Cj4gPiA+ID4gPiBNb3JlIGltcG9ydGFudCwgZmVlbCBmcmVlIHRvIGFkZCBpbiBzcGluLgo+ID4g
PiA+IAo+ID4gPiA+IEkgcG9zdGVkIHRoaXMgcGF0Y2ggYmVmb3JlIExpZ2h0IHJlcG9ydGVkLgo+
ID4gPiA+IAo+ID4gPiA+IEFuZCwgaW4gdGhlIHJlcG9ydCwgSSBkaWRuJ3QgZ2V0IHRoaXM6Cj4g
PiA+ID4gCj4gPiA+ID4gZjJmc19pb2Nfc2h1dGRvd24oKSAtLT4gZnJlZXplX2JkZXYoKSAtLT4g
ZnJlZXplX3N1cGVyKCkgLS0+IHNiX3dhaXRfd3JpdGUoc2IsIFNCX0ZSRUVaRV9GUykgLS0+IC4u
LiAtPnBlcmNwdV9kb3duX3dyaXRlKCkuCj4gPiA+ID4gCj4gPiA+ID4gYmVjYXVzZSBmMmZzX2lv
Y19zaHV0ZG93bigpIGNhbGxzIGYyZnNfc3RvcF9kaXNjYXJkX3RocmVhZCgpIGFmdGVyIHRoYXdf
YmRldigpCj4gPiA+ID4gbGlrZSB0aGlzIG9yZGVyLgo+ID4gPiA+IAo+ID4gPiA+IMKgLT4gZnJl
ZXplX2JkZXYoKQo+ID4gPiA+IMKgLT4gdGhhd19iZGV2KCkKPiA+ID4gPiDCoC0+IGYyZnNfc3Rv
cF9kaXNjYXJkX3RocmVhZCgpCj4gPiA+ID4gCj4gPiA+ID4gQW0gSSBtaXNzaW5nIHNvbWV0aGlu
Zz8KPiA+ID4gPiAKPiA+ID4gPiA+Cj4gPiA+ID4gPiBSZXBvcnRlZC1ieTogIkxpZ2h0IEhzaWVo
ICjorJ3mmI7nh4gpIiA8TGlnaHQuSHNpZWhAbWVkaWF0ZWsuY29tPgo+ID4gPiA+IAoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
