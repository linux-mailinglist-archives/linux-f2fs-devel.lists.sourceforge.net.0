Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E3AB848A8C
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 03:18:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWS5e-0005mV-5f;
	Sun, 04 Feb 2024 02:18:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rWS5c-0005mP-2l
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 02:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tGsXDZjqFHawsjoYr3JCHIL/fKcB3IoHbX6tslRW6HA=; b=H51WmgIdWKBriDcbXFCjB2pLSW
 2HpgYCG4jCcq6wo3jn7ydIxrZZb4GexRjvPJaxkexvuYBjALgrYpRR+dish1+PMV2uZQv1vSAqWLh
 yccIqPAlw3fhEY3T4krflKkp0ymu0SWLleGIfBZ+Uu5od0D4ghdQW6mubyK+mPcMYP1Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tGsXDZjqFHawsjoYr3JCHIL/fKcB3IoHbX6tslRW6HA=; b=nHtPhqoGZH7BVcpkTViG35ugys
 lHtPthbBrFuWgsJ+CuIvseopoHDgyAJpzKOfxObQpexLHjtaB+j8JoLwF+n6Sm9If1F84fGaCX90O
 F2aggAru31LBtpvajsdyKphInEVJBxZ4GJ/lDqQhXkskKOZmmf8TzOv6zFHngoRv2OWg=;
Received: from mail-qt1-f172.google.com ([209.85.160.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rWS5X-0004Bl-I8 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 02:18:36 +0000
Received: by mail-qt1-f172.google.com with SMTP id
 d75a77b69052e-42a4516ec46so20222761cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Feb 2024 18:18:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707013101; x=1707617901; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGsXDZjqFHawsjoYr3JCHIL/fKcB3IoHbX6tslRW6HA=;
 b=mE7k9jmwo0NHTxLTqWjVj38yHZT9ppjs5OhVVL17wPIeVamF/PT1bRb469eXHP/P11
 33Xd4HS/I8EDfmSnm9meKYDvvnIzzwbm5mkdXkIhF9YH81zC5aJNwlWPFxHTA12d2JGd
 tPKzVTvjCTyPdg4wgZ/pNBRNj19+gvxz0wn6pB16RV2/9pvQXGAJ0ERmo0XvyXsBqjeI
 nkjUHW7JfDA0t8rbsjHLR8pwyEc8I/RuFKqJLDuk42wZ5YP7IBms7tBbAkdabT3p4ntx
 XxmHEP4vn+sNwxYSk7dGNwVlddX8etI7e76/b7J8+9quxd9egSDWEK2mtpT2/lcvYspb
 nDaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707013101; x=1707617901;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tGsXDZjqFHawsjoYr3JCHIL/fKcB3IoHbX6tslRW6HA=;
 b=o/zL/8TiqN6PSVOEipIei8mSY/3FljLf1ltcKZWapz03JQZjvN9Npa9kR/Mxs6d3Rf
 +CbwxmrmYw8HfaxtHhsUHfEK0AexrZpGWFxhq+Glz6g9r0Lwe+oxw4nTeGIfhKNbPjr+
 BJmg9bU8/PUhm8LB8H/ip/8thkYbhSOc8xRh61975zGO51lrbwmqCj5s/U8HwkY4jng+
 mlvvTNN2QUPd5Nc8aYeWXRQmKrS004BkOZZEcSwZ/iUb9YjtKXzrw7O37VCygrp+4EU6
 w5V7WsFmphXh/KExGfn5VkP6+rE1Ny2YxVhQnDyUO47fgYJuqpJ3JIIs5GGXHV+057d/
 utTg==
X-Gm-Message-State: AOJu0YyQRKvv0IB76HVTloDR/QfBhknEhtjisWHP0dfQUpxQMhPl9qlx
 DjcgdYAOGfKjBgHS8l95ShJyDPEseGY4zoQmcUlHTv696YtRaiUNAYOmF9LsaW3L61Iw7gOOW2h
 tg8WG798dUkqzX7Ws9Bl5jCIe+fQ=
X-Google-Smtp-Source: AGHT+IFc9Pmi5ImlvuBMdyt5nssr3BB70eTeqYP47Nq3ns0PasmwejUoo/JqgOwNjwNSwlRzg8UaHkOZgVovnKyLfW0=
X-Received: by 2002:ac8:5d89:0:b0:42c:768:7b12 with SMTP id
 d9-20020ac85d89000000b0042c07687b12mr4382614qtx.22.1707013101231; Sat, 03 Feb
 2024 18:18:21 -0800 (PST)
MIME-Version: 1.0
References: <20240203152436.1352-1-qwjhust@gmail.com>
 <8eaf59a4-1aaa-460e-a3cc-b798ed5e0f63@kernel.org>
In-Reply-To: <8eaf59a4-1aaa-460e-a3cc-b798ed5e0f63@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Sun, 4 Feb 2024 10:18:10 +0800
Message-ID: <CAGFpFsTz_9Zaj0PuptjBxOJwxF68geAUfd1qtx9--Tczh+jZww@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, It seems to me that when mounting multiple zoned
 devices, if their max_open_zones are all 0, then sbi->max_open_zones is 0.
 This suggests that all of the mounted devices can open an unlimited number
 o [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.160.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rWS5X-0004Bl-I8
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix zoned block device information
 initialization
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgQ2hhbywKCkl0IHNlZW1zIHRvIG1lIHRoYXQgd2hlbiBtb3VudGluZyBtdWx0aXBsZSB6b25l
ZCBkZXZpY2VzLAppZiB0aGVpciBtYXhfb3Blbl96b25lcyBhcmUgYWxsIDAsIHRoZW4gc2JpLT5t
YXhfb3Blbl96b25lcyBpcyAwLgpUaGlzIHN1Z2dlc3RzIHRoYXQgYWxsIG9mIHRoZSBtb3VudGVk
IGRldmljZXMgY2FuIG9wZW4gYW4gdW5saW1pdGVkCm51bWJlciBvZiB6b25lcywKYW5kIHRoYXQg
d2UgZG9uJ3QgbmVlZCB0byBjb21wYXJlIHNiaS0+bWF4X29wZW5fem9uZXMgd2l0aApGMkZTX09Q
VElPTiggc2JpKS5hY3RpdmVfbG9ncy4KClRoYW5rcywKCkNoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4g5LqOMjAyNOW5tDLmnIg05pel5ZGo5pelIDA5OjQ35YaZ6YGT77yaCj4KPiBPbiAyMDI0LzIv
MyAyMzoyNCwgV2VuamllIFFpIHdyb3RlOgo+ID4gSWYgdGhlIG1heCBvcGVuIHpvbmVzIG9mIHpv
bmVkIGRldmljZXMgYXJlIGxlc3MgdGhhbgo+ID4gdGhlIGFjdGl2ZSBsb2dzIG9mIEYyRlMsIHRo
ZSBkZXZpY2UgbWF5IGVycm9yIGR1ZSB0bwo+ID4gaW5zdWZmaWNpZW50IHpvbmUgcmVzb3VyY2Vz
IHdoZW4gbXVsdGlwbGUgYWN0aXZlIGxvZ3MgYXJlCj4gPiBiZWluZyB3cml0dGVuIGF0IHRoZSBz
YW1lIHRpbWUuIElmIHRoaXMgdmFsdWUgaXMgMCwKPiA+IHRoZXJlIGlzIG5vIGxpbWl0Lgo+ID4K
PiA+IFNpZ25lZC1vZmYtYnk6IFdlbmppZSBRaSA8cXdqaHVzdEBnbWFpbC5jb20+Cj4gPiAtLS0K
PiA+ICAgZnMvZjJmcy9mMmZzLmggIHwgIDEgKwo+ID4gICBmcy9mMmZzL3N1cGVyLmMgfCAyMSAr
KysrKysrKysrKysrKysrKysrKysKPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRpb25z
KCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgK
PiA+IGluZGV4IDU0Mzg5ODQ4MmY4Yi4uMTYxMTA3ZjJkM2JkIDEwMDY0NAo+ID4gLS0tIGEvZnMv
ZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtMTU1OCw2ICsxNTU4
LDcgQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4gPgo+ID4gICAjaWZkZWYgQ09ORklHX0JMS19E
RVZfWk9ORUQKPiA+ICAgICAgIHVuc2lnbmVkIGludCBibG9ja3NfcGVyX2Jsa3o7ICAgICAgICAg
ICAvKiBGMkZTIGJsb2NrcyBwZXIgem9uZSAqLwo+ID4gKyAgICAgdW5zaWduZWQgaW50IG1heF9v
cGVuX3pvbmVzOyAgICAgICAgICAgIC8qIG1heCBvcGVuIHpvbmUgcmVzb3VyY2VzIG9mIHRoZSB6
b25lZCBkZXZpY2UgKi8KPiA+ICAgI2VuZGlmCj4gPgo+ID4gICAgICAgLyogZm9yIG5vZGUtcmVs
YXRlZCBvcGVyYXRpb25zICovCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMv
ZjJmcy9zdXBlci5jCj4gPiBpbmRleCAxYjcxOGJlYmZhYTEuLjQ1ZTgyZDYwMTZmYyAxMDA2NDQK
PiA+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ID4gKysrIGIvZnMvZjJmcy9zdXBlci5jCj4gPiBA
QCAtMjM4OCw2ICsyMzg4LDE2IEBAIHN0YXRpYyBpbnQgZjJmc19yZW1vdW50KHN0cnVjdCBzdXBl
cl9ibG9jayAqc2IsIGludCAqZmxhZ3MsIGNoYXIgKmRhdGEpCj4gPiAgICAgICBpZiAoZXJyKQo+
ID4gICAgICAgICAgICAgICBnb3RvIHJlc3RvcmVfb3B0czsKPiA+Cj4gPiArI2lmZGVmIENPTkZJ
R19CTEtfREVWX1pPTkVECj4gPiArICAgICBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyAmJiBzYmkt
Pm1heF9vcGVuX3pvbmVzIDwgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewo+ID4gKyAg
ICAgICAgICAgICBmMmZzX2VycihzYmksCj4gPiArICAgICAgICAgICAgICAgICAgICAgInpvbmVk
OiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21hbGwsIG5lZWQgYXQgbGVhc3QgJXUgb3BlbiB6
b25lcyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5tYXhfb3Blbl96
b25lcywgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4gPiArICAgICAgICAgICAgIGVy
ciA9IC1FSU5WQUw7Cj4gPiArICAgICAgICAgICAgIGdvdG8gcmVzdG9yZV9vcHRzOwo+ID4gKyAg
ICAgfQo+ID4gKyNlbmRpZgo+ID4gKwo+ID4gICAgICAgLyogZmx1c2ggb3V0c3RhbmRpbmcgZXJy
b3JzIGJlZm9yZSBjaGFuZ2luZyBmcyBzdGF0ZSAqLwo+ID4gICAgICAgZmx1c2hfd29yaygmc2Jp
LT5zX2Vycm9yX3dvcmspOwo+ID4KPiA+IEBAIC0zOTMwLDExICszOTQwLDIyIEBAIHN0YXRpYyBp
bnQgaW5pdF9ibGt6X2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZGV2aSkKPiA+
ICAgICAgIHNlY3Rvcl90IG5yX3NlY3RvcnMgPSBiZGV2X25yX3NlY3RvcnMoYmRldik7Cj4gPiAg
ICAgICBzdHJ1Y3QgZjJmc19yZXBvcnRfem9uZXNfYXJncyByZXBfem9uZV9hcmc7Cj4gPiAgICAg
ICB1NjQgem9uZV9zZWN0b3JzOwo+ID4gKyAgICAgdW5zaWduZWQgaW50IG1heF9vcGVuX3pvbmVz
Owo+ID4gICAgICAgaW50IHJldDsKPiA+Cj4gPiAgICAgICBpZiAoIWYyZnNfc2JfaGFzX2Jsa3pv
bmVkKHNiaSkpCj4gPiAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4KPiA+ICsgICAgIG1heF9v
cGVuX3pvbmVzID0gYmRldl9tYXhfb3Blbl96b25lcyhiZGV2KTsKPgo+IFdlbmppZSwKPgo+IG1h
eF9vcGVuX3pvbmVzIGNhbiBhbHdheXMgYmUgemVybz8gdGhlbiBzYmktPm1heF9vcGVuX3pvbmVz
IHdpbGwgYmUgemVybywKPiBpcyB0aGlzIGEgdmFsaWQgY2FzZT8KPgo+IFRoYW5rcywKPgo+ID4g
KyAgICAgaWYgKG1heF9vcGVuX3pvbmVzICYmIChtYXhfb3Blbl96b25lcyA8IHNiaS0+bWF4X29w
ZW5fem9uZXMgfHwgIXNiaS0+bWF4X29wZW5fem9uZXMpKQo+ID4gKyAgICAgICAgICAgICBzYmkt
Pm1heF9vcGVuX3pvbmVzID0gbWF4X29wZW5fem9uZXM7Cj4gPiArICAgICBpZiAoc2JpLT5tYXhf
b3Blbl96b25lcyAmJiBzYmktPm1heF9vcGVuX3pvbmVzIDwgRjJGU19PUFRJT04oc2JpKS5hY3Rp
dmVfbG9ncykgewo+ID4gKyAgICAgICAgICAgICBmMmZzX2VycihzYmksCj4gPiArICAgICAgICAg
ICAgICAgICAgICAgInpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21hbGwsIG5lZWQg
YXQgbGVhc3QgJXUgb3BlbiB6b25lcyIsCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgc2JpLT5tYXhfb3Blbl96b25lcywgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4g
PiArICAgICAgICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4gKyAgICAgfQo+ID4gKwo+ID4gICAg
ICAgem9uZV9zZWN0b3JzID0gYmRldl96b25lX3NlY3RvcnMoYmRldik7Cj4gPiAgICAgICBpZiAo
IWlzX3Bvd2VyX29mXzIoem9uZV9zZWN0b3JzKSkgewo+ID4gICAgICAgICAgICAgICBmMmZzX2Vy
cihzYmksICJGMkZTIGRvZXMgbm90IHN1cHBvcnQgbm9uIHBvd2VyIG9mIDIgem9uZSBzaXplc1xu
Iik7CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vm
b3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAo=
