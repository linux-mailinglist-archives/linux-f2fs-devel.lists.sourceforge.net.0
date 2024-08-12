Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D094F7BF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Aug 2024 21:56:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdb9w-00084H-3O;
	Mon, 12 Aug 2024 19:56:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sdb9u-00084B-O0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 19:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5JSFeB4cNTeTLmlDwLdjtWnfSnHp/85XUmAmtHaUf8I=; b=My9wH46msxO4Hsmexs67k7mGpc
 KUo7d6Yc6Hyv86Ls/yh/F4nOf67o6jP33tGn4KW6Uiwr89Wk+XvtY8PZNnU6heKPK/fKkflZo32P0
 3pNyVysli/pizG+Plni+WbKNRwMviDj3Kt5b0CHmzOGaoqRG9XOczyv2wZv1Y9bTfwDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5JSFeB4cNTeTLmlDwLdjtWnfSnHp/85XUmAmtHaUf8I=; b=iMf2Y1KO9QHhNm6NpQdaFBrWRn
 LuN3D+7awTz+Jg6OxJgLPVKblTsfcRgEYxveP9V1i0cLDErUZgvu7mMXMfxjlIGoCvrwwmJ+A29Ih
 ZUGGoB4Tm+F1SLOwYvyDEy3PfCpP6clBCXpAOIxbV4xLUSdobUkZsWcyNyaTJuBYGgjw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdb9t-0000Mr-3I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Aug 2024 19:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 2F06DCE0E08;
 Mon, 12 Aug 2024 19:56:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43310C32782;
 Mon, 12 Aug 2024 19:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723492601;
 bh=zrhofMqFz2wBhIstuv9qi73hFVLsbVSYYDxvgKis3RY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fwJBGl4Mw+Ev0/NLkeN3dIQbVXkrFNxUUCnipCEZFHW/P7FeQtD2YJHbXCrv07Sv2
 t7qMH42Cr8FJTLmDQbpPtiaJmOqaGz9GvooqKgA8gSGKYriydVXEELkwO6paTt6hd0
 kJUqlHkwnI2hOs1RTPFNNulZSxqip0Ty8bvGE/ZFjyHkwdPjltlNBqSO8/ayY+KVDK
 isj50BjX9MdsueGlsTMQBnlxzUAaTaI3ucGNoHmaPvTgEWFvsaDnWDdubw8gsOXWAV
 u97b37NVIcXq1BfOgsI38mJi8n2uy9Fv6O3t5WmeU5uxJbjlgN9ZCxpgZzQRC/3DP5
 yPx+oDsEyWyLw==
Date: Mon, 12 Aug 2024 19:56:39 +0000
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Daeho Jeong <daeho43@gmail.com>
Message-ID: <Zrpo9ylEc6_ivUQ0@google.com>
References: <20240808233248.323318-1-jaegeuk@kernel.org>
 <CACOAw_zBs-K_6y45yUeuXwrrzzP1YXcMiuuR7OpoYRGrRJcz7w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACOAw_zBs-K_6y45yUeuXwrrzzP1YXcMiuuR7OpoYRGrRJcz7w@mail.gmail.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 08/12, Daeho Jeong wrote: > On Thu, Aug 8, 2024 at 4:34 PM
    Jaegeuk Kim <jaegeuk@kernel.org> wrote: > > > > It'll crach fsck.f2fs. Even,
    let's keep the write pointers and just finish it. > > > > S [...] 
 
 Content analysis details:   (-5.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [145.40.73.55 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdb9t-0000Mr-3I
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: don't call dev_fill w/ null buffer
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDgvMTIsIERhZWhvIEplb25nIHdyb3RlOgo+IE9uIFRodSwgQXVnIDgsIDIwMjQgYXQgNDoz
NOKAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEl0
J2xsIGNyYWNoIGZzY2suZjJmcy4gRXZlbiwgbGV0J3Mga2VlcCB0aGUgd3JpdGUgcG9pbnRlcnMg
YW5kIGp1c3QgZmluaXNoIGl0Lgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxq
YWVnZXVrQGtlcm5lbC5vcmc+Cj4gPiAtLS0KPiA+ICBmc2NrL2ZzY2suYyB8IDIwICsrKysrKysr
LS0tLS0tLS0tLS0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTIgZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5jIGIvZnNjay9mc2NrLmMK
PiA+IGluZGV4IGExOGJlZTlkMGMzYi4uNWZlOGFkNGVmMzI3IDEwMDY0NAo+ID4gLS0tIGEvZnNj
ay9mc2NrLmMKPiA+ICsrKyBiL2ZzY2svZnNjay5jCj4gPiBAQCAtMzI5OSw4ICszMjk5LDkgQEAg
c3RhdGljIGludCBjaGtfYW5kX2ZpeF93cF93aXRoX3NpdChpbnQgVU5VU0VEKGkpLCB2b2lkICpi
bGt6b25lLCB2b2lkICpvcGFxdWUpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgInNlZ21lbnQgMHgleCIsIHpvbmVfc2Vnbm8pOwo+ID4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICByZXQgPSBmMmZzX3Jlc2V0X3pvbmUod3BkLT5kZXZfaW5kZXgsIGJs
a3opOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAocmV0KSB7Cj4gPiAt
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRmKCJbRlNDS10gV3Jp
dGUgcG9pbnRlciByZXNldCAiCj4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICJmYWlsZWQ6ICVzXG4iLCBkZXYtPnBhdGgpOwo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIEFTU0VSVF9NU0coIldyaXRlIHBvaW50ZXIgcmVz
ZXQgIgo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAi
ZmFpbGVkOiAlcywgZXJyPSVkXG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBkZXYtPnBhdGgsIHJldCk7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgfQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmc2NrLT5j
aGsud3BfZml4ZWQgPSAxOwo+ID4gQEAgLTMzMjYsMTggKzMzMjcsMTMgQEAgc3RhdGljIGludCBj
aGtfYW5kX2ZpeF93cF93aXRoX3NpdChpbnQgVU5VU0VEKGkpLCB2b2lkICpibGt6b25lLCB2b2lk
ICpvcGFxdWUpCj4gPgo+ID4gICAgICAgICByZXQgPSBmMmZzX2ZpbmlzaF96b25lKHdwZC0+ZGV2
X2luZGV4LCBibGt6KTsKPiA+ICAgICAgICAgaWYgKHJldCkgewo+ID4gLSAgICAgICAgICAgICAg
IHU2NCBmaWxsX3NlY3RzID0gYmxrX3pvbmVfbGVuZ3RoKGJsa3opIC0KPiA+IC0gICAgICAgICAg
ICAgICAgICAgICAgIChibGtfem9uZV93cF9zZWN0b3IoYmxreikgLSBibGtfem9uZV9zZWN0b3Io
YmxreikpOwo+ID4gLSAgICAgICAgICAgICAgIHByaW50ZigiW0ZTQ0tdIEZpbmlzaGluZyB6b25l
IGZhaWxlZDogJXNcbiIsIGRldi0+cGF0aCk7Cj4gPiAtICAgICAgICAgICAgICAgcmV0ID0gZGV2
X2ZpbGwoTlVMTCwgd3BfYmxvY2sgKiBGMkZTX0JMS1NJWkUsCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAoZmlsbF9zZWN0cyA+PiBsb2dfc2VjdG9yc19wZXJfYmxvY2spICogRjJGU19CTEtT
SVpFKTsKPiAKPiBUaGlzIHdhcyBmb3Igem9uZWQgZGV2aWNlcyB0aGF0IGRvbid0IHN1cHBvcnQg
dGhlIEZJTklTSCBjb21tYW5kLiBJZgo+IE5VTEwgYnVmIGlzIHRoZSBwcm9ibGVtLCBob3cgYWJv
dXQgdXNpbmcgemVybyB2YWx1ZSBmaWxsZWQgYnVmZmVyPwoKRG8gd2UgcmVhbGx5IG5lZWQgdG8g
ZmlsbCB0aGVtLCBpZiBpdCdsbCBiZSByZXNldCBsYXRlciBiZWZvcmUgdXNlPwoKPiAKPiA+IC0g
ICAgICAgICAgICAgICBpZiAocmV0KQo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgcHJpbnRm
KCJbRlNDS10gRmlsbCB1cCB6b25lIGZhaWxlZDogJXNcbiIsIGRldi0+cGF0aCk7Cj4gPiArICAg
ICAgICAgICAgICAgQVNTRVJUX01TRygiRmluaXNoaW5nIHpvbmUgZmFpbGVkOiAlcywgZXJyPSVk
XG4iLAo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgZGV2LT5wYXRoLCByZXQpOwo+ID4gKyAg
ICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gPiAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgIGlm
ICghcmV0KQo+ID4gLSAgICAgICAgICAgICAgIGZzY2stPmNoay53cF9maXhlZCA9IDE7Cj4gPiAt
ICAgICAgIHJldHVybiByZXQ7Cj4gPiArICAgICAgIGZzY2stPmNoay53cF9maXhlZCA9IDE7Cj4g
PiArICAgICAgIHJldHVybiAwOwo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIHZvaWQgZml4X3dwX3Np
dF9hbGlnbm1lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gLS0KPiA+IDIuNDYuMC43
Ni5nZTU1OWM0YmYxYS1nb29nCj4gPgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
