Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2662976E36
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 17:53:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1som8L-0001U9-1x;
	Thu, 12 Sep 2024 15:53:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1som8I-0001U1-Uh
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 15:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mxnpoyeenCvXuA2nqNEXl2ArMBmJRvgYP93f5UbGcnE=; b=krx4fuzvZ10l4K+29A/R2y0eoS
 l8Q6T0mjJsCEb/sOyY+G8ROHYThjLp5I2ifU5mXBimdjJ3pvHM1Swc4ldtIgNDV3ROMblhIyepSON
 RZDLXew5GbxQRZzsR9JrvulMOz3Ufw7pbGwqTs+qR0w7xW4MRR3zNI+3QknkpxZCqT/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mxnpoyeenCvXuA2nqNEXl2ArMBmJRvgYP93f5UbGcnE=; b=UKQ9/Q8yHDk7ZkChj27lBtgMxN
 tibde3B7UqfgEF/LTWQAmx2adgJP6h2cYuDe8JXKI3BQXAbK4YnfEl3PdZIK3PIuZDr4JhMjt1prs
 oXLEgTLtbUJVfnR8kCNxGv1nXuxpQ18GYBIssV0ni/yC7mxGYxUOsb0oLsH0w7sSjvNQ=;
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1som8J-0007iL-0T for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 15:53:23 +0000
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-3e0379a8d96so483332b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Sep 2024 08:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726156392; x=1726761192; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxnpoyeenCvXuA2nqNEXl2ArMBmJRvgYP93f5UbGcnE=;
 b=Bze7vmKKrSLGf24LEnR2Q0ebWHybJ0mH5WD+Vu4NmvECrZ13vcz4/0EIzgoHyGDpVN
 YgQ7QQvmvkeex7N2Qi/9WbAEqUfWB+UhiPNNd1waNAgOLUucDXz8icVH/ks8dKHM6eMx
 BPV1JtO+lZfTN+FvCU4BNebN45MVPDIJZMDtewovoyHvjGYNlBwWNdWoZ0LYs5dAV2dj
 4FxCLwbBtP5re1WrslAxcFUGlBAItlVem1tlBJTh6YRcP/ROdZfPNv1zUIwkyvCZ+HDk
 3G4+B5w20nIqfN5umcf7cWYGVot7pkiw9hft7R2XVQlkiRb9BJ5x2NtsyYl4TyrKyJdM
 yGxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726156392; x=1726761192;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxnpoyeenCvXuA2nqNEXl2ArMBmJRvgYP93f5UbGcnE=;
 b=WGwjLXagB3s2Gd5JiJV9xJOBVTvJpEdw8YiihoqzZHVGBKzIL9wv+vkITgd1WEDFT+
 yWidCI2gxPsw1EbrH2cNOlJ/D70NBSV4o9vdMskrQDO1LpyEnDCXYZWF19j66hCsdTKM
 GZqD73np+SFV2yqrMYq+vBUIym10Y2nezx/Zf8CPfzu19Q1dTEmC+L0Qdd9GYIj6Fz4V
 f8yJXh5mBuXkWPzPlDc4DPIPNd6PMgHwbYEyGNl9rHoPg69SBbSYahgEVNJPo9hXW8Qo
 skDFFAXSG0THMLFtLXFBNq2l3uxqWQ4I4pmSAtEmv3GX+hJ6Od87VIfpDNRrTOjWFygg
 JpdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXw8L6jfvaq0RZQeERN5aVdDtfk9aC187hlZdZWdHln3j8tbTgaBlbEuDKiuDIvUS4UvglWtL+tD5CMXAFbFdKX@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxL2jgROjnSbjuTOnYk5tjzKvlI/B4eTh+NYBMwnx4Z+zRSNn9R
 g/g2ZVoDzp7N97Bh0P5b+KLBZlUk6+xm3+fix/sPpRFJCUvlfkivEbHC/ZVti/hNfql8Vta1Mp/
 PN7jfyI+32o4u3JU1ipOy5zoa4S0=
X-Google-Smtp-Source: AGHT+IF4prtzYunAHi7fsTonLppA1SK/JmSOLrzIP03Np1jPT2i5TwY1kRUtM7ACvRgIn6nTyJ2HO8yoi1aO+MMA0+E=
X-Received: by 2002:a05:6808:f93:b0:3e0:5167:248b with SMTP id
 5614622812f47-3e071aa63fdmr2138011b6e.20.1726156391815; Thu, 12 Sep 2024
 08:53:11 -0700 (PDT)
MIME-Version: 1.0
References: <20240911213031.183299-1-daeho43@gmail.com>
 <ZuL-pAo6A0VVBwYG@google.com>
In-Reply-To: <ZuL-pAo6A0VVBwYG@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 12 Sep 2024 08:53:00 -0700
Message-ID: <CACOAw_wXis4oF=TYSyf7PR0YPre6qip5VWH+OWXJh-POwopAMg@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Sep 12, 2024 at 7:45 AM Jaegeuk Kim wrote: > > On
    09/11, Daeho Jeong wrote: > > From: Daeho Jeong > > > > We need to migrate
    data blocks even though it is full to secure space > > for zo [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.180 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.180 listed in list.dnswl.org]
X-Headers-End: 1som8J-0007iL-0T
Subject: Re: [f2fs-dev] [PATCH] f2fs: forcibly migrate to secure space for
 zoned device file pinning
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBTZXAgMTIsIDIwMjQgYXQgNzo0NeKAr0FNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMDkvMTEsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gRnJv
bTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBXZSBuZWVkIHRv
IG1pZ3JhdGUgZGF0YSBibG9ja3MgZXZlbiB0aG91Z2ggaXQgaXMgZnVsbCB0byBzZWN1cmUgc3Bh
Y2UKPiA+IGZvciB6b25lZCBkZXZpY2UgZmlsZSBwaW5uaW5nLgo+ID4KPiA+IFNpZ25lZC1vZmYt
Ynk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiBGaXhlczogOTcwM2Q2
OWQ5ZDE1ICgiZjJmczogc3VwcG9ydCBmaWxlIHBpbm5pbmcgZm9yIHpvbmVkIGRldmljZXMiKQo+
ID4gLS0tCj4gPiAgZnMvZjJmcy9nYy5jIHwgMyArLS0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
Z2MuYyBiL2ZzL2YyZnMvZ2MuYwo+ID4gaW5kZXggNzI0YmJjYjQ0N2QzLi5hYWFlMTM0OTNhNzAg
MTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2djLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+ID4g
QEAgLTIwMTAsOCArMjAxMCw3IEBAIGludCBmMmZzX2djX3JhbmdlKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPiA+ICAgICAgICAgICAgICAgICAgICAgICAuaXJvb3QgPSBSQURJWF9UUkVFX0lO
SVQoZ2NfbGlzdC5pcm9vdCwgR0ZQX05PRlMpLAo+ID4gICAgICAgICAgICAgICB9Owo+ID4KPiA+
IC0gICAgICAgICAgICAgZG9fZ2FyYmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBG
R19HQywKPiA+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
cnlfcnVuX3NlY3Rpb25zID09IDApOwo+ID4gKyAgICAgICAgICAgICBkb19nYXJiYWdlX2NvbGxl
Y3Qoc2JpLCBzZWdubywgJmdjX2xpc3QsIEZHX0dDLCB0cnVlKTsKPgo+IERvIHlvdSBtZWFuIHRo
aXMsIHJpZ2h0Pwo+Cj4gZG9fZ2FyYmFnZV9jb2xsZWN0KHNiaSwgc2Vnbm8sICZnY19saXN0LCBG
R19HQywgdHJ1ZSwgZmFsc2UpOwoKT2gsIGFmdGVyIFpVRlMgR0MgcGF0Y2hlcywgd2UgaGF2ZSBz
aXggcGFyYW1ldGVycyBvbiB0aGF0LiBZb3UncmUgcmlnaHQuCgpzdGF0aWMgaW50IGRvX2dhcmJh
Z2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IHN0YXJ0X3NlZ25vLAogICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCBnY19pbm9kZV9saXN0ICpnY19saXN0LCBpbnQgZ2NfdHlwZSwK
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBib29sIGZvcmNlX21pZ3JhdGUpCj4KPiA+
ICAgICAgICAgICAgICAgcHV0X2djX2lub2RlKCZnY19saXN0KTsKPiA+Cj4gPiAgICAgICAgICAg
ICAgIGlmICghZHJ5X3J1biAmJiBnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIHRydWUpKQo+
ID4gLS0KPiA+IDIuNDYuMC41OTguZzZmMjA5OWY2NWMtZ29vZwo+ID4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
