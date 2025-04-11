Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 01EFAA85A52
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:42:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3Bpq-0001Cy-G5;
	Fri, 11 Apr 2025 10:42:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qkrwngud825@gmail.com>) id 1u3Bpm-0001Cf-L2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ugyixZh6yxVCOAD2/p5Nywt/IpbBZf8HVBuDpx9/vn0=; b=TfrvHOiuOshtJ4XKLKgAQyRgVc
 JC5O4D4HEBuXTkOiwg4mp4KqKpJaseZNeorVLlUNd3Ihhbu4MlPjOEJExhJHCsMifBaDGEVX8LIoQ
 /O5mM0fs1l+rslc7OG545XnmQHnrxrKxku1PrUtXZ3lN2MvXW1RXQMvfPBTGLtmS7+1I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ugyixZh6yxVCOAD2/p5Nywt/IpbBZf8HVBuDpx9/vn0=; b=BM1V3+9EqXYEZYxSHGyahSVO1u
 azOQlCTeDoJN7XhpuEc4NJcRR60eoZLk8AKonyyPngdKGIcyQGrYZwuMyfyB6QtDg+sEAiWcT7c6k
 /xh61ALcamDOe14l1zImukmoN1oFxFwMU8R86zjd/U28QrTdMN6DhkmUrcwm8W5wuzVg=;
Received: from mail-ed1-f50.google.com ([209.85.208.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u3BpX-0008Hw-Hh for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:42:07 +0000
Received: by mail-ed1-f50.google.com with SMTP id
 4fb4d7f45d1cf-5e5e34f4e89so3722973a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Apr 2025 03:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744368105; x=1744972905; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ugyixZh6yxVCOAD2/p5Nywt/IpbBZf8HVBuDpx9/vn0=;
 b=aQVyvDA5p9TXANl8gYyZW41CnOviju+IyIML0JeC2Q34GsVCs2J+SYhan5r5GL+TQ0
 Pp+z93mcWybQh3wErn2y3OYjF3a4p6ogx/5+O6P60qhRTaE02Mzov2D71lhAHSmdSNU8
 BVffp6dFu2ABBhBY66F2Xe8fmibGSKKdSqD/ImkQbiYp1LsnKuoj9omi1C2M5MGJyo5P
 TSQjKNB7PL2TxKf7XVH76OyR1TZU1isGn8hISISb58+uEwO8AfoQ3j9gfEqklsSMNmdP
 TnH6lbN5FFBzfYetpLtP7lAsSP/FmRvkrzejJojGVXh+aCOHMpO2TGNbHG4mGwVMhNDC
 nzfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744368105; x=1744972905;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ugyixZh6yxVCOAD2/p5Nywt/IpbBZf8HVBuDpx9/vn0=;
 b=npRd4U/nebRE0bH/iUMvzpgh9fbCb9jAx0FrQggk7psF+8QCZOCDc9u3HBu3YzD+xW
 c++d4t2EfCCElwpCl8nOvfcj+Hshmk8W8sanJHP5luU+oZBElxDYoIu9l2mz9+HIYYcH
 GvjBRKVs3VH+t6y3w2PVJ6d73BFB89Mix3iWs/yuaTgD6wQX7agMP8d8/an21Ob/3oz0
 9Ua5taw3Kep+zZR8X6EqMKZGEil4cP77B90FsLWiuyChWpz/l0cKI5jWhxfQOGMgeLHQ
 Xp1Ua4bRoqoNaaHSBJupJk0hnvXx5vwWerspVtqhcoZ/u7EAOVBchDBxj5ilaQwfv0Wh
 hRJg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPmQdj2wQcCTnhFEvsnSn7Xr7+Teiw+kyL6YYmfeZIwTb/6kXRMNQqo65jzAf2k2alYo4jUAOA791Apw2RugcP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzpLepoVTwGSn/0r8dP5BhyeGJYhow7SKmg4uh4I+Zcnbk9qPTO
 apEkm6ZxLMtz9C/fZA9/OZHF/41bxUmFAaBzPyK9p5Z29YlGLZCU9bVRZ11EdSrKO56dckfym5y
 h1R54gouwPFYfZMOLXLF3ollLMI+ay6psLGg=
X-Gm-Gg: ASbGncsaFBz/72eIyYMtKURfP3bJkJxf2nmKw/lCkItqnP10gobej8lNT70fwY+FJxK
 tvJ5No5dYZu6NbSvZfhFaZrAyeuEYd8K2JTHYD9AlZApocM4k0bHLvxmhTZNkZPzhRIQOeinbG+
 VDfU5yWVuPUrxD5LnIt4uwKDgdEsvgAUJSow==
X-Google-Smtp-Source: AGHT+IEF5CbzkR6auDf1C6hcPw2AFxR08uSp2rtsr6fgSNUTz2Mfjbu9GmcEwZWw5FLv0XtwnD0i/My54iNeeDkvKlI=
X-Received: by 2002:a17:907:72ca:b0:abf:7453:1f1a with SMTP id
 a640c23a62f3a-acad34fcb7fmr156452666b.36.1744368104741; Fri, 11 Apr 2025
 03:41:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250411103710.8282-1-chao@kernel.org>
 <20250411103710.8282-2-chao@kernel.org>
In-Reply-To: <20250411103710.8282-2-chao@kernel.org>
From: Juhyung Park <qkrwngud825@gmail.com>
Date: Fri, 11 Apr 2025 03:41:33 -0700
X-Gm-Features: ATxdqUHTxxUEp425L0ZBOSO-reMWVtFk4UMLfSqkJPDZLeaKRMoaVKT9MPh8RH0
Message-ID: <CAD14+f2MuZMuB8F0NiyQ0eqPtcrWd_V9d+=o9t1D2cZZUESaqg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Chao, My name wasn't the only thing I picked up on the
   v2 patch, just a friendly ping in case you missed it :) On Fri, Apr 11, 2025
    at 3:37 AM Chao Yu wrote: > > resize.f2fs doesn't guarantee atomically
   resizing f2fs image, > so that potential suddent power cut, IO error, out
   of memory, > SIGKILL received [...] 
 
 Content analysis details:   (1.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 HK_RANDOM_FROM         From username looks random
  0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qkrwngud825[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.208.50 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.208.50 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [qkrwngud825[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.50 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1u3BpX-0008Hw-Hh
Subject: Re: [f2fs-dev] [PATCH v3 2/2] resize.f2fs: add caution message for
 resize
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCk15IG5hbWUgd2Fzbid0IHRoZSBvbmx5IHRoaW5nIEkgcGlja2VkIHVwIG9uIHRo
ZSB2MiBwYXRjaCwganVzdCBhCmZyaWVuZGx5IHBpbmcgaW4gY2FzZSB5b3UgbWlzc2VkIGl0IDop
CgpPbiBGcmksIEFwciAxMSwgMjAyNSBhdCAzOjM34oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IHJlc2l6ZS5mMmZzIGRvZXNuJ3QgZ3VhcmFudGVlIGF0b21pY2FsbHkg
cmVzaXppbmcgZjJmcyBpbWFnZSwKPiBzbyB0aGF0IHBvdGVudGlhbCBzdWRkZW50IHBvd2VyIGN1
dCwgSU8gZXJyb3IsIG91dCBvZiBtZW1vcnksCj4gU0lHS0lMTCByZWNlaXZlZCBvciBwcm9ncmFt
IGV4aXRzIGR1ZSB0byBvdGhlciByZWFzb25zIG1heSBjYXVzZQo+IGRhdGEgY29ycnVwdGlvbi4K
Pgo+IFRoaXMgcGF0Y2ggYWRkcyBjYXV0aW9uIG1lc3NhZ2UgZm9yIHJlc2l6ZSB1c2VycyB0byBu
b3RpY2UKPiBwb3RlbnRpYWwgcmlzayBvZiB1c2luZyByZXNpemluZyB0b29sLCBhbmQgcmVtaW5k
IHRoZW0gdG8gYmFja3VwCj4gZGF0YSBiZWZvcmUgcmVzaXplLgo+Cj4gcmVzaXplLmYyZnMgPHBh
cnRpdGlvbj4KPgo+ICJQbGVhc2Ugbm90aWNlIHRoZXJlIGlzIGhpZ2ggcmlzayBvZiBkYXRhIGxv
c3QgZHVyaW5nIHJlc2l6ZSwgcGxlYXNlIGJhY2t1cCB5b3VyIGRhdGEgYmVmb3JlIHJlc2l6ZS4K
PiBEbyB5b3Ugd2FudCB0byByZXNpemUgdGhpcyBwYXJ0aXRpb24/IFt5L25dIHkKPiBwcm9jZXNz
IHJlc2l6ZSIKPgo+IElmIHdlIHdhbnQgdG8gZm9yY2UgdG8gdXNlIHJlc2l6ZS5mMmZzLCB3ZSBj
YW4gdXNlIC1GIG9wdGlvbiwKPiBsZXQncyBlbmFibGUgLUYgb3B0aW9uIGluIEFuZHJvaWQgYnkg
ZGVmYXVsdCB0byBub3QgYnJlYWsgYW55Cj4gdXNhZ2UuCj4KPiBDYzogSnVoeXVuZyBQYXJrIDxx
a3J3bmd1ZDgyNUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJu
ZWwub3JnPgo+IC0tLQo+IHYzOgo+IC0gdXBkYXRlIEp1aHl1bmcncyBlbWFpbCBuYW1lCj4gIGZz
Y2svbWFpbi5jICAgICAgIHwgMjcgKysrKysrKysrKysrKysrKysrKysrKysrKy0tCj4gIGZzY2sv
cmVzaXplLmMgICAgIHwgIDIgKy0KPiAgaW5jbHVkZS9mMmZzX2ZzLmggfCAgMSArCj4gIG1hbi9y
ZXNpemUuZjJmcy44IHwgMTIgKysrKysrKysrKysrCj4gIDQgZmlsZXMgY2hhbmdlZCwgMzkgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mc2NrL21haW4uYyBi
L2ZzY2svbWFpbi5jCj4gaW5kZXggYWY0MDYxMy4uZWY2YjE3ZCAxMDA2NDQKPiAtLS0gYS9mc2Nr
L21haW4uYwo+ICsrKyBiL2ZzY2svbWFpbi5jCj4gQEAgLTIyMiw2ICsyMjIsOCBAQCBzdGF0aWMg
dm9pZCBhZGRfZGVmYXVsdF9vcHRpb25zKHZvaWQpCj4gICAgICAgICAgICAgICAgIGlmIChjLmZ1
bmMgPT0gRlNDSykgewo+ICAgICAgICAgICAgICAgICAgICAgICAgIC8qIC1hICovCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgYy5hdXRvX2ZpeCA9IDE7Cj4gKyAgICAgICAgICAgICAgIH0gZWxz
ZSBpZiAoYy5mdW5jID09IFJFU0laRSkgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIGMuZm9y
Y2UgPSAxOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAgICAgICAgLyoKPiBAQCAt
NjAxLDcgKzYwMyw3IEBAIHZvaWQgZjJmc19wYXJzZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICph
cmd2W10pCj4gICNlbmRpZgo+ICAgICAgICAgfSBlbHNlIGlmICghc3RyY21wKCJyZXNpemUuZjJm
cyIsIHByb2cpKSB7Cj4gICNpZmRlZiBXSVRIX1JFU0laRQo+IC0gICAgICAgICAgICAgICBjb25z
dCBjaGFyICpvcHRpb25fc3RyaW5nID0gImQ6ZkhzdDpvOlYiOwo+ICsgICAgICAgICAgICAgICBj
b25zdCBjaGFyICpvcHRpb25fc3RyaW5nID0gImQ6ZkZIc3Q6bzpWIjsKPgo+ICAgICAgICAgICAg
ICAgICBjLmZ1bmMgPSBSRVNJWkU7Cj4gICAgICAgICAgICAgICAgIHdoaWxlICgob3B0aW9uID0g
Z2V0b3B0KGFyZ2MsIGFyZ3YsIG9wdGlvbl9zdHJpbmcpKSAhPSBFT0YpIHsKPiBAQCAtNjE4LDkg
KzYyMCwxMiBAQCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltd
KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYy5kYmdfbHYpOwo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4g
ICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAnZic6Cj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBjLmlnbm9yZV9lcnJvciA9IDE7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBNU0coMCwgIkluZm86IEluZ29yZSBlcnJvciBkdXJpbmcgcmVzaXplXG4iKTsKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIGNhc2UgJ0YnOgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYy5mb3Jj
ZSA9IDE7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IEZv
cmNlIHRvIHJlc2l6ZVxuIik7Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBicmVh
azsKPiAgICAgICAgICAgICAgICAgICAgICAgICBjYXNlICdIJzoKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMubmVlZF93aGludCA9IHRydWU7Cj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBjLndoaW50ID0gV1JJVEVfTElGRV9OT1RfU0VUOwo+IEBAIC0xMTA0LDYg
KzExMDksMjQgQEAgb3V0X3JhbmdlOgo+ICAjaWZkZWYgV0lUSF9SRVNJWkUKPiAgc3RhdGljIGlu
dCBkb19yZXNpemUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICB7Cj4gKyAgICAgICBjaGFy
IGFuc3dlclsyNTVdID0gezB9Owo+ICsgICAgICAgaW50IHJldDsKPiArCj4gKyAgICAgICBpZiAo
IWMuZm9yY2UpIHsKPiArcmV0cnk6Cj4gKyAgICAgICAgICAgICAgIHByaW50ZigiXG5QbGVhc2Ug
bm90aWNlIHRoZXJlIGlzIGhpZ2ggcmlzayBvZiBkYXRhIGxvc3QgZHVyaW5nIHJlc2l6ZSwgIgo+
ICsgICAgICAgICAgICAgICAgICAgICAgICJwbGVhc2UgYmFja3VwIHlvdXIgZGF0YSBiZWZvcmUg
cmVzaXplLlxuIgo+ICsgICAgICAgICAgICAgICAgICAgICAgICJEbyB5b3Ugd2FudCB0byByZXNp
emUgdGhpcyBwYXJ0aXRpb24/IFt5L25dICIpOwo+ICsgICAgICAgICAgICAgICByZXQgPSBzY2Fu
ZigiJXMiLCBhbnN3ZXIpOwo+ICsgICAgICAgICAgICAgICBBU1NFUlQocmV0ID49IDApOwo+ICsg
ICAgICAgICAgICAgICBpZiAoIXN0cmNhc2VjbXAoYW5zd2VyLCAieSIpKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIHByaW50ZigicHJvY2VzcyByZXNpemVcbiIpOwo+ICsgICAgICAgICAgICAg
ICBlbHNlIGlmICghc3RyY2FzZWNtcChhbnN3ZXIsICJuIikpCj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIDA7Cj4gKyAgICAgICAgICAgICAgIGVsc2UKPiArICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIHJldHJ5Owo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIGlmICghYy50YXJn
ZXRfc2VjdG9ycykKPiAgICAgICAgICAgICAgICAgYy50YXJnZXRfc2VjdG9ycyA9IGMudG90YWxf
c2VjdG9yczsKPgo+IGRpZmYgLS1naXQgYS9mc2NrL3Jlc2l6ZS5jIGIvZnNjay9yZXNpemUuYwo+
IGluZGV4IDI2ODFiOWYuLjFhYjdkNzUgMTAwNjQ0Cj4gLS0tIGEvZnNjay9yZXNpemUuYwo+ICsr
KyBiL2ZzY2svcmVzaXplLmMKPiBAQCAtNzY1LDcgKzc2NSw3IEBAIGludCBmMmZzX3Jlc2l6ZShz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gICAgICAgICAgICAgICAgIH0KPiAgICAgICAgIGVs
c2UgaWYgKCgoYy50YXJnZXRfc2VjdG9ycyAqIGMuc2VjdG9yX3NpemUgPj4KPiAgICAgICAgICAg
ICAgICAgICAgICAgICBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkpID4gZ2V0X3NiKGJsb2NrX2NvdW50
KSkgfHwKPiAtICAgICAgICAgICAgICAgICAgICAgICBjLmZvcmNlKQo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGMuaWdub3JlX2Vycm9yKQo+ICAgICAgICAgICAgICAgICByZXR1cm4gZjJmc19y
ZXNpemVfZ3JvdyhzYmkpOwo+ICAgICAgICAgZWxzZSB7Cj4gICAgICAgICAgICAgICAgIE1TRygw
LCAiTm90aGluZyB0byByZXNpemUuXG4iKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9mMmZzX2Zz
LmggYi9pbmNsdWRlL2YyZnNfZnMuaAo+IGluZGV4IDdlM2YyNWIuLjkyOGY5NjMgMTAwNjQ0Cj4g
LS0tIGEvaW5jbHVkZS9mMmZzX2ZzLmgKPiArKysgYi9pbmNsdWRlL2YyZnNfZnMuaAo+IEBAIC0x
NTI4LDYgKzE1MjgsNyBAQCBzdHJ1Y3QgZjJmc19jb25maWd1cmF0aW9uIHsKPiAgICAgICAgIGlu
dCBub19rZXJuZWxfY2hlY2s7Cj4gICAgICAgICBpbnQgZml4X29uOwo+ICAgICAgICAgaW50IGZv
cmNlOwo+ICsgICAgICAgaW50IGlnbm9yZV9lcnJvcjsKPiAgICAgICAgIGludCBkZWZzZXQ7Cj4g
ICAgICAgICBpbnQgYnVnX29uOwo+ICAgICAgICAgdW5zaWduZWQgaW50IGludmFsaWRfc2I7Cj4g
ZGlmZiAtLWdpdCBhL21hbi9yZXNpemUuZjJmcy44IGIvbWFuL3Jlc2l6ZS5mMmZzLjgKPiBpbmRl
eCAwMmZmMjQ1Li5iZGRhNGZkIDEwMDY0NAo+IC0tLSBhL21hbi9yZXNpemUuZjJmcy44Cj4gKysr
IGIvbWFuL3Jlc2l6ZS5mMmZzLjgKPiBAQCAtMTgsNiArMTgsMTIgQEAgcmVzaXplLmYyZnMgXC0g
cmVzaXplIGZpbGVzeXN0ZW0gc2l6ZQo+ICAuSSBvdmVycHJvdmlzaW9uLXJhdGlvLXBlcmNlbnRh
Z2UKPiAgXQo+ICBbCj4gKy5CIFwtZgo+ICtdCj4gK1sKPiArLkIgXC1GCj4gK10KPiArWwo+ICAu
QiBcLUgKPiAgXQo+ICBbCj4gQEAgLTUzLDYgKzU5LDEyIEBAIFNwZWNpZnkgdGhlIHBlcmNlbnRh
Z2Ugb2YgdGhlIHZvbHVtZSB0aGF0IHdpbGwgYmUgdXNlZCBhcyBvdmVycHJvdmlzaW9uIGFyZWEu
Cj4gIFRoaXMgYXJlYSBpcyBoaWRkZW4gdG8gdXNlcnMsIGFuZCB1dGlsaXplZCBieSBGMkZTIGNs
ZWFuZXIuIElmIG5vdCBzcGVjaWZpZWQsIHRoZQo+ICBiZXN0IG51bWJlciB3aWxsIGJlIGFzc2ln
bmVkIGF1dG9tYXRpY2FsbHkgYWNjb3JkaW5nIHRvIHRoZSBwYXJ0aXRpb24gc2l6ZS4KPiAgLlRQ
Cj4gKy5CSSBcLWYKPiArRm9yY2UgdG8gZml4IGFueSBpbmNvbnNpc3RlbnQgZGF0YSBkdXJpbmcg
cmVzaXplLgo+ICsuVFAKPiArLkJJIFwtRgo+ICtTa2lwIGNhdXRpb24gZGlhbG9ndWUgYW5kIHJl
c2l6ZSBwYXJ0aXRpb24gZGlyZWN0bHkuCj4gKy5UUAo+ICAuQkkgXC1ICj4gIFNwZWNpZnkgc3Vw
cG9ydCB3cml0ZSBoaW50Lgo+ICAuVFAKPiAtLQo+IDIuNDAuMQo+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
