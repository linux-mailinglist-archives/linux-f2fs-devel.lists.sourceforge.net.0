Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE139B8A08
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Nov 2024 04:40:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t6iWk-0001w3-1z;
	Fri, 01 Nov 2024 03:40:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunyibuaa@gmail.com>) id 1t6iWf-0001vu-M7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 03:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sjP5noAEjvh49PYu7apfAl5L6lvVGL9qp8DQoKZSGuM=; b=boLgeJckZ89qOw4fOfZika4qr6
 lejSgP/RUE7WiEVnv5Qf22rsqU9z2tVwZDysw4vTkC5GjZv+31tuarGSmbVzvKt7fv5MEGu1D/INH
 V76/LInqWmBkvK0x42ecpDLoQliRq/D/lr6JBJkDBrUl8neMdzh3arPa2SnKLvYK/XMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sjP5noAEjvh49PYu7apfAl5L6lvVGL9qp8DQoKZSGuM=; b=GKkOiEsIgpEh+bAnIXzG3Qe2dI
 gbT/ktPzLgGKZqnyGG1E1Rk6nsP9gyvagXsEwOo+LXLVwZFtpFRoLKcPupgM0OxgD0WPcbmuigT0f
 SUAMin++bNinx0m/0Jmqe/+xZkUZwDvdoHO7xYhskJVeWDExA7cTIGAVx8N5ajtKf+r0=;
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t6iWe-00061k-49 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Nov 2024 03:40:41 +0000
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2fb388e64b0so15771391fa.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 31 Oct 2024 20:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730432428; x=1731037228; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sjP5noAEjvh49PYu7apfAl5L6lvVGL9qp8DQoKZSGuM=;
 b=GVmb2bG3HVtrXBNoN6IpvQkVuAyfF1ZuwT4drRuwF3Qn/6UgY6t6m80VSu8xb+Frn4
 AJAf3MguGUqGdKk1bK/z7LBsiLlV9iAiDcHCmEgrQLGFZC4MkBbBLQEoSjvfOFzd5hER
 PO3851ooHhZQY8LzYmwVq8ccpSmvA1taLAI80y6uSXDFNjshejvCQh9c/nFjhnq7t7Ty
 YpTmsUdW/4cR81pQYeovigFifKRa8kkv/CIqloP/qGtysNSwQj4pByDlGnKPghjClKaR
 27rSOgfgwalfEH3bQTbAV23EjEOHjke4TGETaTot7hCskPWuhzShXq5gGTw+Ow/lkzOP
 fyyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730432428; x=1731037228;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sjP5noAEjvh49PYu7apfAl5L6lvVGL9qp8DQoKZSGuM=;
 b=j3rL8kuIIpD8JhTVE1FcOlGC1T7rZ7pV2G3V3nz1iB67SV18YkOVJqsBf0HA3Qpcsd
 icx2OQJv3oYhR7/ZP66nfrE3dh4wfcl0d7U9gCCR8JpM4Yq4cieESsGAQ8gCdj3dtqye
 Qyv5dzbnAXnBb5DpWUDK1vcGbT5SWwH0DliNuy6KeEnTv+szLmJWHrT1tN+HtqVVy1fp
 g8LRHl2HAKOkKZ7CAniNzc+jWWL12p0U6ODrY9uWNqiHUF2HON22D1Uqkk3eJKj1+Cjy
 rhc5lcIR9BcMDUtJQNDupzC862Y2HbIUzvzxjwDO4z6LstHTsDv7Vpyeg9xl609PNWnm
 pnCA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfQFwWyC3oGUbTtVNg108Lsoq2NmJV5f2qV35KrzZYKXDdG0gRT0Ac6dRmoym7YifIAOPEFA7SdUZoWau3+0Hg@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy+dEwKuL+S//mK7/H0JyCzl6Bi6KNw/uY1RKaUpXqLyQRqnzrw
 4VH7Pl+fNt/SduH64Hr29yf3UvUgH0UvT1q9rKMiD+/2VXAnRIFcT/px9epOf4xOb0PAISkO6mW
 JPUk6JtGosRBm3wQyD5xsRbHNeVY=
X-Google-Smtp-Source: AGHT+IGkTqq3CbIBYVliNiAvSfnYWEfQCTsfLvdQxe+IQdlr1FOBZ2/rC1dTSK0luVPuuYpHs1FEspEm0uMOwHXeupk=
X-Received: by 2002:a05:651c:b20:b0:2fa:c0fc:e3d8 with SMTP id
 38308e7fff4ca-2fd059ea07cmr53410801fa.38.1730432427926; Thu, 31 Oct 2024
 20:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241030103136.2874140-1-yi.sun@unisoc.com>
 <20241030103136.2874140-5-yi.sun@unisoc.com>
 <CACOAw_zn0ov0b2h9+zHn2gYVCDVGYPkXFNcx-j7OkhU0Y=i94g@mail.gmail.com>
In-Reply-To: <CACOAw_zn0ov0b2h9+zHn2gYVCDVGYPkXFNcx-j7OkhU0Y=i94g@mail.gmail.com>
From: yi sun <sunyibuaa@gmail.com>
Date: Fri, 1 Nov 2024 11:39:51 +0800
Message-ID: <CALpufv0U1FKSXCZJzLD5dhWpNeWqjzg3nf74NX=zXfb+O5Y0qg@mail.gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Oct 31, 2024 at 1:00 AM Daeho Jeong wrote: > > On
    Wed, Oct 30, 2024 at 3:35 AM Yi Sun wrote: > > > > New function can process
    some consecutive blocks at a time. > > > > Function f2fs_i [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [sunyibuaa[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.171 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.171 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1t6iWe-00061k-49
Subject: Re: [f2fs-dev] [PATCH v2 4/5] f2fs: add parameter @len to
 f2fs_invalidate_blocks()
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
Cc: linux-kernel@vger.kernel.org, Yi Sun <yi.sun@unisoc.com>,
 linux-f2fs-devel@lists.sourceforge.net, ke.wang@unisoc.com, jaegeuk@kernel.org,
 hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBPY3QgMzEsIDIwMjQgYXQgMTowMOKAr0FNIERhZWhvIEplb25nIDxkYWVobzQzQGdt
YWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBXZWQsIE9jdCAzMCwgMjAyNCBhdCAzOjM14oCvQU0gWWkg
U3VuIDx5aS5zdW5AdW5pc29jLmNvbT4gd3JvdGU6Cj4gPgo+ID4gTmV3IGZ1bmN0aW9uIGNhbiBw
cm9jZXNzIHNvbWUgY29uc2VjdXRpdmUgYmxvY2tzIGF0IGEgdGltZS4KPiA+Cj4gPiBGdW5jdGlv
biBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKCktPmRvd25fd3JpdGUoKSBhbmQgdXBfd3JpdGUoKQo+
ID4gYXJlIHZlcnkgdGltZS1jb25zdW1pbmcsIHNvIGlmIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Mo
KSBjYW4KPiA+IHByb2Nlc3MgY29uc2VjdXRpdmUgYmxvY2tzIGF0IG9uZSB0aW1lLCBpdCB3aWxs
IHNhdmUgYSBsb3Qgb2YgdGltZS4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBZaSBTdW4gPHlpLnN1
bkB1bmlzb2MuY29tPgo+ID4gLS0tCj4gPiAgZnMvZjJmcy9jb21wcmVzcy5jIHwgIDQgKy0tCj4g
PiAgZnMvZjJmcy9mMmZzLmggICAgIHwgIDMgKy0KPiA+ICBmcy9mMmZzL2ZpbGUuYyAgICAgfCAg
OCArKystLS0KPiA+ICBmcy9mMmZzL25vZGUuYyAgICAgfCAgNCArLS0KPiA+ICBmcy9mMmZzL3Nl
Z21lbnQuYyAgfCA2OSArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0t
LS0tCj4gPiAgNSBmaWxlcyBjaGFuZ2VkLCA2OCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMo
LSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21w
cmVzcy5jCj4gPiBpbmRleCBlNjA3YTc4ODViNTcuLjAyYWQwZmYyOWNmMiAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gKysrIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gPiBA
QCAtMTM3NCw3ICsxMzc0LDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXByZXNzZWRfcGFn
ZXMoc3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoYmxrYWRkciA9PSBDT01QUkVTU19BRERSKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBmaW8uY29tcHJfYmxvY2tzKys7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBp
ZiAoX19pc192YWxpZF9kYXRhX2Jsa2FkZHIoYmxrYWRkcikpCj4gPiAtICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGthZGRyKTsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2Nrcyhz
YmksIGJsa2FkZHIsIDEpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZjJmc191cGRhdGVf
ZGF0YV9ibGthZGRyKCZkbiwgQ09NUFJFU1NfQUREUik7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICBnb3RvIHVubG9ja19jb250aW51ZTsKPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiBAQCAt
MTM4NCw3ICsxMzg0LDcgQEAgc3RhdGljIGludCBmMmZzX3dyaXRlX2NvbXByZXNzZWRfcGFnZXMo
c3RydWN0IGNvbXByZXNzX2N0eCAqY2MsCj4gPgo+ID4gICAgICAgICAgICAgICAgIGlmIChpID4g
Y2MtPnZhbGlkX25yX2NwYWdlcykgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYgKF9f
aXNfdmFsaWRfZGF0YV9ibGthZGRyKGJsa2FkZHIpKSB7Cj4gPiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGthZGRyKTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmks
IGJsa2FkZHIsIDEpOwo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3Vw
ZGF0ZV9kYXRhX2Jsa2FkZHIoJmRuLCBORVdfQUREUik7Cj4gPiAgICAgICAgICAgICAgICAgICAg
ICAgICB9Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIHVubG9ja19jb250aW51ZTsK
PiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRl
eCBhZGRkNDlhZjU3ZWMuLjRiYjQ1OTE1N2FkZiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJm
cy5oCj4gPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+ID4gQEAgLTM3MTYsNyArMzcxNiw4IEBAIGlu
dCBmMmZzX2lzc3VlX2ZsdXNoKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3QgaW5vKTsK
PiA+ICBpbnQgZjJmc19jcmVhdGVfZmx1c2hfY21kX2NvbnRyb2woc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKTsKPiA+ICBpbnQgZjJmc19mbHVzaF9kZXZpY2VfY2FjaGUoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpKTsKPiA+ICB2b2lkIGYyZnNfZGVzdHJveV9mbHVzaF9jbWRfY29udHJvbChzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIGJvb2wgZnJlZSk7Cj4gPiAtdm9pZCBmMmZzX2ludmFsaWRh
dGVfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBhZGRyKTsKPiA+ICt2
b2lkIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9j
a190IGFkZHIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICB1bnNpZ25lZCBpbnQgbGVuKTsKPiA+ICBib29sIGYyZnNfaXNfY2hlY2twb2ludGVkX2Rh
dGEoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIpOwo+ID4gIGludCBm
MmZzX3N0YXJ0X2Rpc2NhcmRfdGhyZWFkKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSk7Cj4gPiAg
dm9pZCBmMmZzX2Ryb3BfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiBpbmRleCA3
NWE4YjIyZGE2NjQuLjEzNTk0YmI1MDJkMSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZmlsZS5j
Cj4gPiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gQEAgLTY1Miw3ICs2NTIsNyBAQCB2b2lkIGYy
ZnNfdHJ1bmNhdGVfZGF0YV9ibG9ja3NfcmFuZ2Uoc3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBp
bnQgY291bnQpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHZhbGlkX2Jsb2Nr
cysrOwo+ID4gICAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAtICAgICAgICAgICAgICAgZjJmc19p
bnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIpOwo+ID4gKyAgICAgICAgICAgICAgIGYyZnNf
aW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBibGthZGRyLCAxKTsKPiA+Cj4gPiAgICAgICAgICAgICAg
ICAgaWYgKCFyZWxlYXNlZCB8fCBibGthZGRyICE9IENPTVBSRVNTX0FERFIpCj4gPiAgICAgICAg
ICAgICAgICAgICAgICAgICBucl9mcmVlKys7Cj4gPiBAQCAtNzUwLDcgKzc1MCw3IEBAIGludCBm
MmZzX2RvX3RydW5jYXRlX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCB1NjQgZnJvbSwgYm9v
bCBsb2NrKQo+ID4gICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBpOwo+ID4KPiA+ICAgICAg
ICAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgZWkubGVuOyBpKyspCj4gPiAtICAgICAgICAgICAg
ICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgZWkuYmxrICsgaSk7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgZWkuYmxr
ICsgaSwgMSk7Cj4gPgo+ID4gICAgICAgICAgICAgICAgIGRlY192YWxpZF9ibG9ja19jb3VudChz
YmksIGlub2RlLCBlaS5sZW4pOwo+ID4gICAgICAgICAgICAgICAgIGYyZnNfdXBkYXRlX3RpbWUo
c2JpLCBSRVFfVElNRSk7Cj4gPiBAQCAtMTMxOSw3ICsxMzE5LDcgQEAgc3RhdGljIGludCBfX3Jv
bGxfYmFja19ibGthZGRycyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBibG9ja190ICpibGthZGRyLAo+
ID4gICAgICAgICAgICAgICAgIHJldCA9IGYyZnNfZ2V0X2Rub2RlX29mX2RhdGEoJmRuLCBvZmYg
KyBpLCBMT09LVVBfTk9ERV9SQSk7Cj4gPiAgICAgICAgICAgICAgICAgaWYgKHJldCkgewo+ID4g
ICAgICAgICAgICAgICAgICAgICAgICAgZGVjX3ZhbGlkX2Jsb2NrX2NvdW50KHNiaSwgaW5vZGUs
IDEpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2Nrcyhz
YmksICpibGthZGRyKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfaW52YWxpZGF0
ZV9ibG9ja3Moc2JpLCAqYmxrYWRkciwgMSk7Cj4gPiAgICAgICAgICAgICAgICAgfSBlbHNlIHsK
PiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXBkYXRlX2RhdGFfYmxrYWRkcigmZG4s
ICpibGthZGRyKTsKPiA+ICAgICAgICAgICAgICAgICB9Cj4gPiBAQCAtMTU3MSw3ICsxNTcxLDcg
QEAgc3RhdGljIGludCBmMmZzX2RvX3plcm9fcmFuZ2Uoc3RydWN0IGRub2RlX29mX2RhdGEgKmRu
LCBwZ29mZl90IHN0YXJ0LAo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7Cj4gPiAg
ICAgICAgICAgICAgICAgfQo+ID4KPiA+IC0gICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVf
YmxvY2tzKHNiaSwgZG4tPmRhdGFfYmxrYWRkcik7Cj4gPiArICAgICAgICAgICAgICAgZjJmc19p
bnZhbGlkYXRlX2Jsb2NrcyhzYmksIGRuLT5kYXRhX2Jsa2FkZHIsIDEpOwo+ID4gICAgICAgICAg
ICAgICAgIGYyZnNfc2V0X2RhdGFfYmxrYWRkcihkbiwgTkVXX0FERFIpOwo+ID4gICAgICAgICB9
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMKPiA+
IGluZGV4IGFmMzZjNmQ2NTQyYi4uZGIxNWQ2YTkwZjY3IDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJm
cy9ub2RlLmMKPiA+ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4gPiBAQCAtOTE2LDcgKzkxNiw3IEBA
IHN0YXRpYyBpbnQgdHJ1bmNhdGVfbm9kZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4pCj4gPiAg
ICAgICAgIH0KPiA+Cj4gPiAgICAgICAgIC8qIERlYWxsb2NhdGUgbm9kZSBhZGRyZXNzICovCj4g
PiAtICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBuaS5ibGtfYWRkcik7Cj4gPiAr
ICAgICAgIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc2JpLCBuaS5ibGtfYWRkciwgMSk7Cj4gPiAg
ICAgICAgIGRlY192YWxpZF9ub2RlX2NvdW50KHNiaSwgZG4tPmlub2RlLCBkbi0+bmlkID09IGRu
LT5pbm9kZS0+aV9pbm8pOwo+ID4gICAgICAgICBzZXRfbm9kZV9hZGRyKHNiaSwgJm5pLCBOVUxM
X0FERFIsIGZhbHNlKTsKPiA+Cj4gPiBAQCAtMjc2MSw3ICsyNzYxLDcgQEAgaW50IGYyZnNfcmVj
b3Zlcl94YXR0cl9kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBwYWdlICpwYWdlKQo+
ID4gICAgICAgICBpZiAoZXJyKQo+ID4gICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gPgo+
ID4gLSAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgbmkuYmxrX2FkZHIpOwo+ID4g
KyAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgbmkuYmxrX2FkZHIsIDEpOwo+ID4g
ICAgICAgICBkZWNfdmFsaWRfbm9kZV9jb3VudChzYmksIGlub2RlLCBmYWxzZSk7Cj4gPiAgICAg
ICAgIHNldF9ub2RlX2FkZHIoc2JpLCAmbmksIE5VTExfQUREUiwgZmFsc2UpOwo+ID4KPiA+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiBpbmRl
eCA5MmRkZmYyODVhNjUuLjY3ZjJiZmRlYjZlYyAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gQEAgLTI0NSw3ICsyNDUsNyBA
QCBzdGF0aWMgaW50IF9fcmVwbGFjZV9hdG9taWNfd3JpdGVfYmxvY2soc3RydWN0IGlub2RlICpp
bm9kZSwgcGdvZmZfdCBpbmRleCwKPiA+ICAgICAgICAgICAgICAgICBpZiAoIV9faXNfdmFsaWRf
ZGF0YV9ibGthZGRyKG5ld19hZGRyKSkgewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgaWYg
KG5ld19hZGRyID09IE5VTExfQUREUikKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZGVjX3ZhbGlkX2Jsb2NrX2NvdW50KHNiaSwgaW5vZGUsIDEpOwo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGRuLmRhdGFfYmxrYWRkcik7
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwg
ZG4uZGF0YV9ibGthZGRyLCAxKTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXBk
YXRlX2RhdGFfYmxrYWRkcigmZG4sIG5ld19hZGRyKTsKPiA+ICAgICAgICAgICAgICAgICB9IGVs
c2Ugewo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19yZXBsYWNlX2Jsb2NrKHNiaSwg
JmRuLCBkbi5kYXRhX2Jsa2FkZHIsCj4gPiBAQCAtMjU1OCwyOSArMjU1OCw3NiBAQCBzdGF0aWMg
dm9pZCB1cGRhdGVfc2l0X2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBi
bGthZGRyLCBpbnQgZGVsKQo+ID4gICAgICAgICAgICAgICAgIGdldF9zZWNfZW50cnkoc2JpLCBz
ZWdubyktPnZhbGlkX2Jsb2NrcyArPSBkZWw7Cj4gPiAgfQo+ID4KPiA+IC12b2lkIGYyZnNfaW52
YWxpZGF0ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGFkZHIpCj4g
PiArc3RhdGljIHZvaWQgX19mMmZzX2ludmFsaWRhdGVfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9j
a190IGFkZHIsIGJsb2NrX3QgZW5kKQo+ID4gIHsKPiA+ICAgICAgICAgdW5zaWduZWQgaW50IHNl
Z25vID0gR0VUX1NFR05PKHNiaSwgYWRkcik7Cj4gPiAgICAgICAgIHN0cnVjdCBzaXRfaW5mbyAq
c2l0X2kgPSBTSVRfSShzYmkpOwo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgc2VnX251bSA9IEdF
VF9TRUdOTyhzYmksIGVuZCkgLSBzZWdubyArIDE7Cj4gPiArICAgICAgIHVuc2lnbmVkIGludCBp
ID0gMSwgbWF4X2Jsb2NrcyA9IHNiaS0+YmxvY2tzX3Blcl9zZWcsIGxlbjsKPiA+ICsgICAgICAg
YmxvY2tfdCBhZGRyX3N0YXJ0ID0gYWRkcjsKPiA+Cj4gPiAtICAgICAgIGYyZnNfYnVnX29uKHNi
aSwgYWRkciA9PSBOVUxMX0FERFIpOwo+ID4gLSAgICAgICBpZiAoYWRkciA9PSBORVdfQUREUiB8
fCBhZGRyID09IENPTVBSRVNTX0FERFIpCj4gPiAtICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4g
LQo+ID4gLSAgICAgICBmMmZzX2ludmFsaWRhdGVfaW50ZXJuYWxfY2FjaGUoc2JpLCBhZGRyLCAx
KTsKPiA+ICsgICAgICAgZjJmc19pbnZhbGlkYXRlX2ludGVybmFsX2NhY2hlKHNiaSwgYWRkciwg
ZW5kIC0gYWRkciArIDEpOwo+ID4KPiA+ICAgICAgICAgLyogYWRkIGl0IGludG8gc2l0IG1haW4g
YnVmZmVyICovCj4gPiAgICAgICAgIGRvd25fd3JpdGUoJnNpdF9pLT5zZW50cnlfbG9jayk7Cj4g
Pgo+ID4gLSAgICAgICB1cGRhdGVfc2VnbWVudF9tdGltZShzYmksIGFkZHIsIDApOwo+ID4gLSAg
ICAgICB1cGRhdGVfc2l0X2VudHJ5KHNiaSwgYWRkciwgLTEpOwo+ID4gKyAgICAgICBpZiAoc2Vn
X251bSA9PSAxKQo+ID4gKyAgICAgICAgICAgICAgIGxlbiA9IGVuZCAtIGFkZHIgKyAxOwo+ID4g
KyAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgbGVuID0gbWF4X2Jsb2NrcyAtIEdFVF9C
TEtPRkZfRlJPTV9TRUcwKHNiaSwgYWRkcik7Cj4gPgo+ID4gLSAgICAgICAvKiBhZGQgaXQgaW50
byBkaXJ0eSBzZWdsaXN0ICovCj4gPiAtICAgICAgIGxvY2F0ZV9kaXJ0eV9zZWdtZW50KHNiaSwg
c2Vnbm8pOwo+ID4gKyAgICAgICBkbyB7Cj4gPiArICAgICAgICAgICAgICAgdXBkYXRlX3NlZ21l
bnRfbXRpbWUoc2JpLCBhZGRyX3N0YXJ0LCAwKTsKPiA+ICsgICAgICAgICAgICAgICB1cGRhdGVf
c2l0X2VudHJ5KHNiaSwgYWRkcl9zdGFydCwgLWxlbik7Cj4gPiArCj4gPiArICAgICAgICAgICAg
ICAgLyogYWRkIGl0IGludG8gZGlydHkgc2VnbGlzdCAqLwo+ID4gKyAgICAgICAgICAgICAgIGxv
Y2F0ZV9kaXJ0eV9zZWdtZW50KHNiaSwgc2Vnbm8pOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAg
IC8qIHVwZGF0ZSBAYWRkcl9zdGFydCBhbmQgQGxlbiBhbmQgQHNlZ25vICovCj4gPiArICAgICAg
ICAgICAgICAgYWRkcl9zdGFydCA9IFNUQVJUX0JMT0NLKHNiaSwgKytzZWdubyk7Cj4gPiArICAg
ICAgICAgICAgICAgaWYgKCsraSA9PSBzZWdfbnVtKQo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAgbGVuID0gR0VUX0JMS09GRl9GUk9NX1NFRzAoc2JpLCBlbmQpICsgMTsKPiA+ICsgICAgICAg
ICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgICAgICAgICBsZW4gPSBtYXhfYmxvY2tz
Owo+ID4gKyAgICAgICB9IHdoaWxlIChpIDw9IHNlZ19udW0pOwo+ID4KPiA+ICAgICAgICAgdXBf
d3JpdGUoJnNpdF9pLT5zZW50cnlfbG9jayk7Cj4gPiAgfQo+ID4KPiA+ICt2b2lkIGYyZnNfaW52
YWxpZGF0ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBibG9ja190IGFkZHIsIHVuc2lnbmVkIGludCBsZW4pCj4gPiAr
ewo+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgaTsKPiA+ICsgICAgICAgLyogVGVtcG9yYXJ5IHJl
Y29yZCBsb2NhdGlvbiAqLwo+ID4gKyAgICAgICBibG9ja190IGFkZHJfc3RhcnQgPSBhZGRyLCBh
ZGRyX2VuZDsKPiA+ICsKPiA+ICsgICAgICAgaWYgKGxlbiA9PSAwKQo+ID4gKyAgICAgICAgICAg
ICAgIHJldHVybjsKPiA+ICsKPiA+ICsgICAgICAgZm9yIChpID0gMDsgaSA8IGxlbjsgaSsrKSB7
Cj4gPiArICAgICAgICAgICAgICAgYWRkcl9lbmQgPSBhZGRyICsgaTsKPiA+ICsKPiA+ICsgICAg
ICAgICAgICAgICBmMmZzX2J1Z19vbihzYmksIGFkZHJfZW5kID09IE5VTExfQUREUik7Cj4KPiBM
b29rcyBsaWtlIHRoaXMgbGluZSBzaG91bGQgYmUgb3V0IG9mIHRoaXMgbG9vcCwgcmlnaHQ/Cj4K
PiA+ICsKPiA+ICsgICAgICAgICAgICAgICBpZiAoYWRkcl9lbmQgPT0gTkVXX0FERFIgfHwgYWRk
cl9lbmQgPT0gQ09NUFJFU1NfQUREUikgewo+Cj4gZGl0dG8/Cj4gQ291bGQgeW91IGhlbHAgd2l0
aCBlbmhhbmNpbmcgdGhlIHJlYWRhYmlsaXR5IGhlcmU/IGEgbGl0dGxlIGJpdAo+IGNvbmZ1c2Vk
IHdpdGggdXNpbmcgYWRkcl9zdGFydCwgYWRkcl9lbmQgYW5kIE5FV19BRERSLCBDT01QUkVTU19B
RERSLAo+IGhlcmUuCj4KCkhpIERhZWhvLApUaGFua3MgZm9yIHlvdXIgZmVlZGJhY2ssIEkgdGhp
bmsgeW91IGFyZSByaWdodC4gSSB3aWxsIGNvcnJlY3QgdGhpcyBwcm9ibGVtLgoKCj4gPiArICAg
ICAgICAgICAgICAgICAgICAgICBpZiAoYWRkcl9zdGFydCA9PSBhZGRyX2VuZCkgewo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhZGRyX2VuZCA9IGFkZHJfc3RhcnQgPSBhZGRy
X2VuZCArIDE7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGNvbnRpbnVlOwo+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgX19mMmZzX2ludmFsaWRhdGVfYmxvY2tzKHNiaSwgYWRkcl9zdGFydCwgYWRkcl9lbmQg
LSAxKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGFkZHJfZW5kID0gYWRkcl9zdGFydCA9
IGFkZHJfZW5kICsgMTsKPiA+ICsgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgIH0KPiA+ICsK
PiA+ICsgICAgICAgaWYgKGFkZHJfZW5kID49IChhZGRyICsgbGVuKSkKPiA+ICsgICAgICAgICAg
ICAgICByZXR1cm47Cj4gPiArCj4gPiArICAgICAgIF9fZjJmc19pbnZhbGlkYXRlX2Jsb2Nrcyhz
YmksIGFkZHJfc3RhcnQsIGFkZHJfZW5kKTsKPiA+ICsKPiA+ICt9Cj4gPiArCj4gPiAgYm9vbCBm
MmZzX2lzX2NoZWNrcG9pbnRlZF9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tf
dCBibGthZGRyKQo+ID4gIHsKPiA+ICAgICAgICAgc3RydWN0IHNpdF9pbmZvICpzaXRfaSA9IFNJ
VF9JKHNiaSk7Cj4gPiAtLQo+ID4gMi4yNS4xCj4gPgo+ID4KPiA+Cj4gPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4g
PiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
