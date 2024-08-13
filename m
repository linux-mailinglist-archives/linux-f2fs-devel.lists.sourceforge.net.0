Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CBD950B85
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 19:36:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdvRk-0007cQ-4u;
	Tue, 13 Aug 2024 17:36:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sdvRf-0007cI-Ro
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 17:36:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVfOf0vPreV9M8LsZiHikIIolX9rrZeYYMj/gfCwxHA=; b=gDcVG9yqJVVLV6UyF6/ZUvvO7S
 8XYEmfPWt7A+/ris8FWBC2rCUpuQewnoDXREOeDiF+Lo1hR66NlUhar+ey/oeOe91EqS3Xtd0I+kZ
 zxk1ZNUM0T+cInexfw7C+wSQgwwQhNAbyduewe5FnVZ8t4eK8qSFQ1cUNaOS6+LVrFC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVfOf0vPreV9M8LsZiHikIIolX9rrZeYYMj/gfCwxHA=; b=QN95qOnMpYaHRqDAy+TiiibxaY
 KWAS5X2ujYYkjtEFXah9p4gPjl0kSYlfnF3P7gGzEjV7GhqzVyLkrA21iAod9sVecZCfzZFS2ARjU
 onPr3upt0nU6z4cFASNTi3Id6w1mBCZeIxdxZUkIxF7qBXsKQOquFEV8QZUFtsvhb3ec=;
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sdvRf-0004AS-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 17:36:32 +0000
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-49299adf8adso2164305137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Aug 2024 10:36:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723570585; x=1724175385; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVfOf0vPreV9M8LsZiHikIIolX9rrZeYYMj/gfCwxHA=;
 b=BGp/7Z7f+kpuxrMfYbQQzmZY1UPX7BKd7qy6nqAht8+cgnLDKtIG/58GC2uQgLOtUE
 4OlwUCHoIHjvsyF0j/fVywy+KKzRMXJNu5mbPbpKjVRv+C4UGdtAvVdpe9HJqvGdjcG+
 5r58IrFhYNURUTu8pC4iX8EDx2m7KoNm+yXqZdy5HKAR2SCGN44JoQDSQNbjmZwXF2/7
 Srx4wGvKJEkV4PniZMaD8XQLOwjOOLC+QUanUar5uTofmGElYyCmrd5ixC50BxIb4EJL
 XrjhPlbQnZ3XYGXxTeh5IN+apc+rlWyrRF3ep8e1BrBmdFd3A50mvy++nSRu1S2zacOY
 B9Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723570585; x=1724175385;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DVfOf0vPreV9M8LsZiHikIIolX9rrZeYYMj/gfCwxHA=;
 b=ciKIPoLoP+SY7JCR1S6U73LUJ7rhSH2Wqpn68SpXZ1fzN1rIQv/2PIdFM7I/JKSEEV
 +13eSwu9PbvyPrm4Yzf0nqhYigvf75+I1ZtWED0xHfat2buICyXLWGgoVP8CwgHuUVja
 B9tnHtBe2sVmFcYVxwmMvY/vHT1slTs9dZkJOdNmylJNFnHp0Io4eUBRkSMqczfGIOtw
 6SNWseAhciglkTsQwZIsIpCnQaxQ3OUpfWEJn43R0Lq0Tqlcl0Uv0UE/92xbrdP15zGz
 bS7OQ/FCkIdKmeRP1jveo1e31zoMztQpVljfEoHtN4hGQcC4YLeXm8dZfN7totjkUMyz
 eTCg==
X-Gm-Message-State: AOJu0YwnbqarM8LxRuNoeXzwemQZavDI8Iss0BSIPa/so8/CzMJbXiOs
 kyf4FJQ8q/Abts9yODagmNnsD1VTunTiWhFXV64a/XxvaPfHQD4WhYgv+w3Laa8AbhSEv5uyxXf
 53dwuMqptuRsBc/xmjRk43N2Izkg=
X-Google-Smtp-Source: AGHT+IGudIUGIYeB61rm43A6ZK8thWSDtzCj9rsUxO/oc76R/lZwco7HgvZRKUEEAZewNLIU9Be4pFmsH5rs+ydcMHU=
X-Received: by 2002:a05:6102:26ce:b0:492:aaae:835d with SMTP id
 ada2fe7eead31-4975979c91bmr536793137.0.1723570585500; Tue, 13 Aug 2024
 10:36:25 -0700 (PDT)
MIME-Version: 1.0
References: <20240808233248.323318-1-jaegeuk@kernel.org>
 <CACOAw_zBs-K_6y45yUeuXwrrzzP1YXcMiuuR7OpoYRGrRJcz7w@mail.gmail.com>
 <Zrpo9ylEc6_ivUQ0@google.com>
In-Reply-To: <Zrpo9ylEc6_ivUQ0@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Aug 2024 10:36:14 -0700
Message-ID: <CACOAw_yTYtiRW5cKD8G4npfyu1FK3__NhRhWo02Kp98jRzDgkg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 12, 2024 at 12:56 PM Jaegeuk Kim wrote: > >
   On 08/12, Daeho Jeong wrote: > > On Thu, Aug 8, 2024 at 4:34 PM Jaegeuk
   Kim wrote: > > > > > > It'll crach fsck.f2fs. Even, let's keep t [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.217.49 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdvRf-0004AS-Eu
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

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMTI6NTbigK9QTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDA4LzEyLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IE9u
IFRodSwgQXVnIDgsIDIwMjQgYXQgNDozNOKAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBJdCdsbCBjcmFjaCBmc2NrLmYyZnMuIEV2ZW4sIGxl
dCdzIGtlZXAgdGhlIHdyaXRlIHBvaW50ZXJzIGFuZCBqdXN0IGZpbmlzaCBpdC4KPiA+ID4KPiA+
ID4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiA+ID4g
LS0tCj4gPiA+ICBmc2NrL2ZzY2suYyB8IDIwICsrKysrKysrLS0tLS0tLS0tLS0tCj4gPiA+ICAx
IGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+
ID4gZGlmZiAtLWdpdCBhL2ZzY2svZnNjay5jIGIvZnNjay9mc2NrLmMKPiA+ID4gaW5kZXggYTE4
YmVlOWQwYzNiLi41ZmU4YWQ0ZWYzMjcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzY2svZnNjay5jCj4g
PiA+ICsrKyBiL2ZzY2svZnNjay5jCj4gPiA+IEBAIC0zMjk5LDggKzMyOTksOSBAQCBzdGF0aWMg
aW50IGNoa19hbmRfZml4X3dwX3dpdGhfc2l0KGludCBVTlVTRUQoaSksIHZvaWQgKmJsa3pvbmUs
IHZvaWQgKm9wYXF1ZSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICJzZWdtZW50IDB4JXgiLCB6b25lX3NlZ25vKTsKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICByZXQgPSBmMmZzX3Jlc2V0X3pvbmUod3BkLT5kZXZfaW5kZXgsIGJsa3op
Owo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlmIChyZXQpIHsKPiA+ID4g
LSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiW0ZTQ0tdIFdy
aXRlIHBvaW50ZXIgcmVzZXQgIgo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJmYWlsZWQ6ICVzXG4iLCBkZXYtPnBhdGgpOwo+ID4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQVNTRVJUX01TRygiV3JpdGUgcG9pbnRl
ciByZXNldCAiCj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgImZhaWxlZDogJXMsIGVycj0lZFxuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBkZXYtPnBhdGgsIHJldCk7Cj4gPiA+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+ID4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmc2NrLT5jaGsud3BfZml4ZWQgPSAxOwo+ID4gPiBAQCAtMzMyNiwxOCArMzMyNywx
MyBAQCBzdGF0aWMgaW50IGNoa19hbmRfZml4X3dwX3dpdGhfc2l0KGludCBVTlVTRUQoaSksIHZv
aWQgKmJsa3pvbmUsIHZvaWQgKm9wYXF1ZSkKPiA+ID4KPiA+ID4gICAgICAgICByZXQgPSBmMmZz
X2ZpbmlzaF96b25lKHdwZC0+ZGV2X2luZGV4LCBibGt6KTsKPiA+ID4gICAgICAgICBpZiAocmV0
KSB7Cj4gPiA+IC0gICAgICAgICAgICAgICB1NjQgZmlsbF9zZWN0cyA9IGJsa196b25lX2xlbmd0
aChibGt6KSAtCj4gPiA+IC0gICAgICAgICAgICAgICAgICAgICAgIChibGtfem9uZV93cF9zZWN0
b3IoYmxreikgLSBibGtfem9uZV9zZWN0b3IoYmxreikpOwo+ID4gPiAtICAgICAgICAgICAgICAg
cHJpbnRmKCJbRlNDS10gRmluaXNoaW5nIHpvbmUgZmFpbGVkOiAlc1xuIiwgZGV2LT5wYXRoKTsK
PiA+ID4gLSAgICAgICAgICAgICAgIHJldCA9IGRldl9maWxsKE5VTEwsIHdwX2Jsb2NrICogRjJG
U19CTEtTSVpFLAo+ID4gPiAtICAgICAgICAgICAgICAgICAgICAgICAoZmlsbF9zZWN0cyA+PiBs
b2dfc2VjdG9yc19wZXJfYmxvY2spICogRjJGU19CTEtTSVpFKTsKPiA+Cj4gPiBUaGlzIHdhcyBm
b3Igem9uZWQgZGV2aWNlcyB0aGF0IGRvbid0IHN1cHBvcnQgdGhlIEZJTklTSCBjb21tYW5kLiBJ
Zgo+ID4gTlVMTCBidWYgaXMgdGhlIHByb2JsZW0sIGhvdyBhYm91dCB1c2luZyB6ZXJvIHZhbHVl
IGZpbGxlZCBidWZmZXI/Cj4KPiBEbyB3ZSByZWFsbHkgbmVlZCB0byBmaWxsIHRoZW0sIGlmIGl0
J2xsIGJlIHJlc2V0IGxhdGVyIGJlZm9yZSB1c2U/CgpUaGF0J3MgZm9yIGRldmljZXMgbm90IHN1
cHBvcnRpbmcgdGhlIEZJTklTSCBjb21tYW5kLiBMZXQgbWUgbWFrZQphbm90aGVyIHBhdGNoIGZv
ciBpdC4KCj4KPiA+Cj4gPiA+IC0gICAgICAgICAgICAgICBpZiAocmV0KQo+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICBwcmludGYoIltGU0NLXSBGaWxsIHVwIHpvbmUgZmFpbGVkOiAlc1xu
IiwgZGV2LT5wYXRoKTsKPiA+ID4gKyAgICAgICAgICAgICAgIEFTU0VSVF9NU0coIkZpbmlzaGlu
ZyB6b25lIGZhaWxlZDogJXMsIGVycj0lZFxuIiwKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgZGV2LT5wYXRoLCByZXQpOwo+ID4gPiArICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiA+
ID4gICAgICAgICB9Cj4gPiA+Cj4gPiA+IC0gICAgICAgaWYgKCFyZXQpCj4gPiA+IC0gICAgICAg
ICAgICAgICBmc2NrLT5jaGsud3BfZml4ZWQgPSAxOwo+ID4gPiAtICAgICAgIHJldHVybiByZXQ7
Cj4gPiA+ICsgICAgICAgZnNjay0+Y2hrLndwX2ZpeGVkID0gMTsKPiA+ID4gKyAgICAgICByZXR1
cm4gMDsKPiA+ID4gIH0KPiA+ID4KPiA+ID4gIHN0YXRpYyB2b2lkIGZpeF93cF9zaXRfYWxpZ25t
ZW50KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ID4gLS0KPiA+ID4gMi40Ni4wLjc2Lmdl
NTU5YzRiZjFhLWdvb2cKPiA+ID4KPiA+ID4KPiA+ID4KPiA+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+ID4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+
ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291
cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwK
