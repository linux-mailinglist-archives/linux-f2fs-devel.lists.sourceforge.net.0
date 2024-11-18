Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DF9AA9D09FF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Nov 2024 08:04:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tCvnj-0007kf-OR;
	Mon, 18 Nov 2024 07:03:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <danielyangkang@gmail.com>) id 1tCvni-0007kS-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 07:03:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VLPV6VvTQgCuByNHMKVl9QG7CmMBn7jYkbg8c2F0yrQ=; b=UBEHkBzJ/9Pp92WFaSkU4cpnzO
 H4rX5Qsd831sy3MqouRv2Pjstzt+69KbKXg7keogEnglONuwqjsRbvj6fMVLLW6hEz2IZFZaAW5sf
 X9rk4pb4OLuFnWxULFFuqQTI2gSUdCMTVUd2AhMYLIebn/IH5OZKyIWz0isQ0Yy+dPug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VLPV6VvTQgCuByNHMKVl9QG7CmMBn7jYkbg8c2F0yrQ=; b=dOXSLz/bNvsvO8dv6FuAmoPPgh
 moGW20J6Xdi1fvGPm29A3Cj4SPHY+R+TMFAkWxVnioXE8C8/CLOp201pD56VaRQSjZGsq2WXGqCgz
 tx172GfxOgicz60YfQrbDZ9dtgpq7pNvBt2fWQOo/VrksR0/GpGdUCSrZmTKXnwlR4a4=;
Received: from mail-yw1-f175.google.com ([209.85.128.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tCvnh-0006ME-HV for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 18 Nov 2024 07:03:58 +0000
Received: by mail-yw1-f175.google.com with SMTP id
 00721157ae682-6e34339d41bso30994007b3.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Nov 2024 23:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731913427; x=1732518227; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VLPV6VvTQgCuByNHMKVl9QG7CmMBn7jYkbg8c2F0yrQ=;
 b=krxvtI+duL8+cyDt/QE8SmMTyCuiPzSvp2DXiASTO62uXzEjVjEFP+rOQ4Gz4HYAlb
 tMNqO04jkaCZX51XGcBWZB3zCas2/VgLmkyvfbeVLFlw1og5gdqz/kF7EnkbBD+boN2Z
 4ZxaRsKcPDPcq5Enb+9hzYiLHR/7qltqeymARD3xBgYx+att9ksdYk++3IwBD0YsY+ke
 HUVjP8E2/mdRIci4xAqqUnMQcQJoHiUfpdbSCbiHi6ATK4D+qvX72+hY8SixCTWNLuV7
 MWJqEoDZXyPlq51CPeKQJ9ARwkPeceqaI9+agMm4Q1dyjIxkynpwZB8L62so24CFJ11F
 F2mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731913427; x=1732518227;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VLPV6VvTQgCuByNHMKVl9QG7CmMBn7jYkbg8c2F0yrQ=;
 b=YBLG0TX84cNgGFbliRxfA6X0UJdyJS+KH6qCX3eRryqszx6yq3aYsIHcgowAV3LrJm
 XpArFhcNdVuzAOQDDldpEpcfFY2dOyG/+RZ5kkcMdj3NMUNZ/m7Fhv65Vd3vz60vx7qc
 d03BWvhH8JQu6YZozKFG0qGnmemQdg1d5v4lw8gEfP+soy1zALsWiFLQPxMhY+Pr/zI5
 zadZiPPlG/rf6rRU1jPqWrhaLi4cv8Lf6gG8H/TIPX10d6gFc0QkG2Qbs03tOs0d1bQt
 qKTsBfr10HJWKAchD9cHlkRchjufEUk1qIEEwFX9LpoYGLMuYwOnG95yzPRzJ97uAjiH
 Kz5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU/CYxyu2jBnT9xo0wBI77uhBsKh+/+l7Bht3jiGslb7PnfsqmcTDvVhVzSHi2TG+IJpNeNh7K/Pk/olAheCBY4@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxcCyLeftlf9z4rUcMfh4Sh4DaPqajcS5VTjeNu96/zvfwQTY26
 6O21vPwUHRbkJvTHlcmrcLkwqN3Jeo3V4OAVYKNbuxTd5CZJNxe/ZAqkqWBuKATIIScTYCvuPuX
 jPQFRnD4A+Ba7UIevnoNgllNM+mM=
X-Google-Smtp-Source: AGHT+IGl7r9eTTY6DbGjkT8AzG4rZwLNXHhz58BMG08MWeCm1Ep0CHhz/nibBtdCGAr6NSzhNQ9l56WyOwchQRHJKWs=
X-Received: by 2002:a05:690c:f06:b0:6eb:3f6:bc20 with SMTP id
 00721157ae682-6ee55cf4bcbmr117127367b3.41.1731913426798; Sun, 17 Nov 2024
 23:03:46 -0800 (PST)
MIME-Version: 1.0
References: <20241109013819.5952-1-danielyangkang@gmail.com>
 <065b2dea-0c0a-4961-ac18-2ddd62f0b808@kernel.org>
In-Reply-To: <065b2dea-0c0a-4961-ac18-2ddd62f0b808@kernel.org>
From: Daniel Yang <danielyangkang@gmail.com>
Date: Sun, 17 Nov 2024 23:03:10 -0800
Message-ID: <CAGiJo8TbZPpOBqrGRf3ofXk-TxKQD88Z1YDjM4L8VXV5ccv0Og@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Nov 17, 2024 at 5:24 PM Chao Yu wrote: > > On 2024/11/9
    9:38, Daniel Yang wrote: > > strcpy is deprecated. Kernel docs recommend
   replacing strcpy with > > strscpy. The function strcpy() re [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.128.175 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.128.175 listed in bl.score.senderscore.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [danielyangkang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.175 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.175 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1tCvnh-0006ME-HV
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: replace deprecated strcpy with
 strscpy
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "open list:F2FS FILE SYSTEM" <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBOb3YgMTcsIDIwMjQgYXQgNToyNOKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzExLzkgOTozOCwgRGFuaWVsIFlhbmcgd3JvdGU6Cj4gPiBz
dHJjcHkgaXMgZGVwcmVjYXRlZC4gS2VybmVsIGRvY3MgcmVjb21tZW5kIHJlcGxhY2luZyBzdHJj
cHkgd2l0aAo+ID4gc3Ryc2NweS4gVGhlIGZ1bmN0aW9uIHN0cmNweSgpIHJldHVybiB2YWx1ZSBp
c24ndCB1c2VkIHNvIHRoZXJlCj4gPiBzaG91bGRuJ3QgYmUgYW4gaXNzdWUgcmVwbGFjaW5nIHdp
dGggdGhlIHNhZmVyIGFsdGVybmF0aXZlIHN0cnNjcHkuCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTog
RGFuaWVsIFlhbmcgPGRhbmllbHlhbmdrYW5nQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gVjEgLT4g
VjI6IGhhbmRsZSBzdHJzY3B5IGVycm9ycywgY2hhbmdlZCBwcmVmaXggdG8gZjJmcwo+ID4KPiA+
ICAgZnMvZjJmcy9zdXBlci5jIHwgMTEgKysrKysrKysrLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQs
IDkgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMv
ZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4gPiBpbmRleCA4N2FiNTY5NmIuLjQ3MjFh
OGE4ZiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ID4gKysrIGIvZnMvZjJmcy9z
dXBlci5jCj4gPiBAQCAtNSw2ICs1LDcgQEAKPiA+ICAgICogQ29weXJpZ2h0IChjKSAyMDEyIFNh
bXN1bmcgRWxlY3Ryb25pY3MgQ28uLCBMdGQuCj4gPiAgICAqICAgICAgICAgICAgIGh0dHA6Ly93
d3cuc2Ftc3VuZy5jb20vCj4gPiAgICAqLwo+ID4gICAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9pbml0Lmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC9mcy5o
Pgo+ID4gQEAgLTExNTgsNyArMTE1OSwxMCBAQCBzdGF0aWMgaW50IHBhcnNlX29wdGlvbnMoc3Ry
dWN0IHN1cGVyX2Jsb2NrICpzYiwgY2hhciAqb3B0aW9ucywgYm9vbCBpc19yZW1vdW50KQo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAgICAgICAgICAgICAgICAg
ICAgICAgfQo+ID4KPiA+IC0gICAgICAgICAgICAgICAgICAgICBzdHJjcHkoZXh0W2V4dF9jbnRd
LCBuYW1lKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoc3Ryc2NweShleHRbZXh0X2Nu
dF0sIG5hbWUpID09IC1FMkJJRykgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
a2ZyZWUobmFtZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPgo+IEhvdyBhYm91dD8KPgo+IHJldCA9IHN0cnNjcHkoZXh0W2V4dF9jbnRdLCBuYW1l
KTsKPiBpZiAocmV0IDwgMCkgewo+ICAgICAgICAga2ZyZWUobmFtZSk7Cj4gICAgICAgICByZXR1
cm4gcmV0Owo+IH0KPgo+ID4gKyAgICAgICAgICAgICAgICAgICAgIH0KPiA+ICAgICAgICAgICAg
ICAgICAgICAgICBGMkZTX09QVElPTihzYmkpLmNvbXByZXNzX2V4dF9jbnQrKzsKPiA+ICAgICAg
ICAgICAgICAgICAgICAgICBrZnJlZShuYW1lKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBi
cmVhazsKPiA+IEBAIC0xMTg3LDcgKzExOTEsMTAgQEAgc3RhdGljIGludCBwYXJzZV9vcHRpb25z
KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IsIGNoYXIgKm9wdGlvbnMsIGJvb2wgaXNfcmVtb3VudCkK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ID4gICAgICAgICAgICAg
ICAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgc3RyY3B5KG5vZXh0W25v
ZXh0X2NudF0sIG5hbWUpOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChzdHJzY3B5KG5v
ZXh0W25vZXh0X2NudF0sIG5hbWUpID09IC1FMkJJRykgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAga2ZyZWUobmFtZSk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICByZXR1cm4gLUVJTlZBTDsKPiA+ICsgICAgICAgICAgICAgICAgICAgICB9Cj4KPiBEaXR0bwo+
Cj4gVGhhbmtzLAo+Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgRjJGU19PUFRJT04oc2JpKS5u
b2NvbXByZXNzX2V4dF9jbnQrKzsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBrZnJlZShuYW1l
KTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPgoKVGhhbmtzIGZvciB0aGUgZmVl
ZGJhY2suIFRoYXQgZG9lcyBsb29rIG11Y2ggY2xlYW5lci4gSSd2ZSBhcHBsaWVkIHRoZQpjaGFu
Z2VzIGFuZCBzZW50IHYzLgoKLSBEYW5pZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
