Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9995A9B40B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 04:03:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5cVT-00014w-PC;
	Tue, 29 Oct 2024 03:02:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunyibuaa@gmail.com>) id 1t5cVS-00014q-EJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 03:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nO1wdwkfivit0ZHGVS9Vj4jzAP6hvc4ojwt1tVAYzWg=; b=ImIMnsuiD53dI6dOYZ+balaJbV
 P4+x7YbOQ4qoN77jTr8ZwTaNQGEmFUDDZI7x+HvB85Z01769jS7H0v6EORBNlldJZy5s71DFbDx3T
 vU0KdMdKqI227egVG1s2nOoKj2ynWY0AkUWE7zpnZBYtKa+SOTa94DNM1c+eDH+Gt2uo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nO1wdwkfivit0ZHGVS9Vj4jzAP6hvc4ojwt1tVAYzWg=; b=WBjmOnn4ODeRw+Y1EKgyzCtvtz
 GF22CFMYMjtNeJI0pDOTyWev3T/Veh5OlA8JsX5wT/3WvZtUYfJFiGqO7iUyB5o5tOMZ6TTpRnldY
 Zk+E4KredRrlUtkeBAOzF0x5MJK/xSvVpJZjP7mWxf0NzM9bF9i8MWF7LlOC7RwJtfQ8=;
Received: from mail-lj1-f176.google.com ([209.85.208.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5cVR-0001zM-CG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 03:02:54 +0000
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2fb4af0b6beso74584431fa.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 20:02:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730170967; x=1730775767; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nO1wdwkfivit0ZHGVS9Vj4jzAP6hvc4ojwt1tVAYzWg=;
 b=K2c22l107O1y6KIRxw/3mHTVA77+XyHfh6ZRehBgx7moQZcWeQ3lFdv/tN8Idu85MB
 sr1zbSznKNejj0oTsfHjt6H+w79RliOlKvUIWDtu8/6nNu6jQnPguzwqDkEuSAmBo6k1
 3sf3zAk2Hkkc1YCnf4tBWlgU8tY80KOIKv0hN+BgoII5aQnRlA9dlz84B90nw2e9Sef1
 /otxDJ7SnGMbIKZ7Hi0g/v61/vNzM4SzKkTN+/TK1Wdw3mzcv7Y2mFA2dw9IDAcw72E3
 r9GPlxWo2fRodzPMZb6xw7Gb9CAbk31g36w7RFJ1jrdymzt5s396lHdu41IWEFmV31zF
 EYZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730170967; x=1730775767;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nO1wdwkfivit0ZHGVS9Vj4jzAP6hvc4ojwt1tVAYzWg=;
 b=jvDQxehFBW4nLHQXWS2NLt0iMgWVoxrBfEEVjm7VNbCVBNQWKg9NtvjkalQlkT0St9
 af3m9dPc97WldXxCLdjonsB0py6USfhRgf2akq+nNJMl+rSPjujql3AhB85uouGQi6z/
 Cksucp77aIZab7fiuCBX3kwHhzZWNiZg8opmO61hEx9tACqvb50lTBY4/JArFQR6P3tH
 e1UKxrFzxlIa56jpb4HToZ4yMutcIZLw87TxXB2YLhs5o1dB0Jm4wnavcrfFmb5r5skN
 kK3DfkLQFgiGd9RNdgVSGJOfSZI0E3Q/Ym08B6NKQO1NPtVTA/l3hB+nH8y+FGvAc3ii
 /Nlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfkzWAxt+0UNj7yEhp8UYlDdLAYWW67gseiF1xCEhXtadus4xcDwotW8f/6ZOy/kmuLntaNtf6hoOCoCNJjWI0@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxWSYZpSUbaChs/r7zWP7T0a9BgUqiaLgNwIz9FUn1dLMXBdBA+
 Q8rvtFyZS3Dmw9bklCkJUZPkVVe+UKyGkwv4fRHaZ23yAHYZW9fKLDjNuhdqDjHiDQzFkYjLxBD
 nHpPODSztmhC8wipPpxCtr+yh0BI=
X-Google-Smtp-Source: AGHT+IF+D5RdYReRiYH0oHODlB4S3zTeBnCkuu1HjNLTv1fkArWmGcxICLujd078fJS/XrIfe+pqHPv8YNJfd/qds3U=
X-Received: by 2002:a05:651c:211c:b0:2fb:63b5:c0bc with SMTP id
 38308e7fff4ca-2fcbdf60dfdmr67322531fa.3.1730170966375; Mon, 28 Oct 2024
 20:02:46 -0700 (PDT)
MIME-Version: 1.0
References: <20241016052758.3400359-1-yi.sun@unisoc.com>
 <20241016052758.3400359-3-yi.sun@unisoc.com>
 <52de7b11-e118-433d-b187-0642e81428ef@kernel.org>
 <CALpufv3fCZXM4aD9cUkOQVk6Er-GxjVXhu-ceFnPAC4Mvnnbzw@mail.gmail.com>
 <9f6a6a5a-45e4-4008-97d5-fb38b220f516@kernel.org>
In-Reply-To: <9f6a6a5a-45e4-4008-97d5-fb38b220f516@kernel.org>
From: yi sun <sunyibuaa@gmail.com>
Date: Tue, 29 Oct 2024 11:02:09 +0800
Message-ID: <CALpufv29B=W-M9wztXJHwF=KWLKSeGgrEHQA56Z=z=FoDDpH0w@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Oct 24, 2024 at 6:26 PM Chao Yu wrote: > > On 2024/10/24
    17:54, yi sun wrote: > > On Thu, Oct 17, 2024 at 9:40 AM Chao Yu wrote:
    > >> > >> On 2024/10/16 13:27, Yi Sun wrote: > >>> When [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [sunyibuaa[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.176 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t5cVR-0001zM-CG
Subject: Re: [f2fs-dev] [RFC PATCH 2/2] f2fs: introduce
 f2fs_invalidate_consecutive_blocks()
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
Cc: ke.wang@unisoc.com, Yi Sun <yi.sun@unisoc.com>,
 linux-kernel@vger.kernel.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hao_hao.wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBPY3QgMjQsIDIwMjQgYXQgNjoyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEwLzI0IDE3OjU0LCB5aSBzdW4gd3JvdGU6Cj4gPiBPbiBU
aHUsIE9jdCAxNywgMjAyNCBhdCA5OjQw4oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3
cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjQvMTAvMTYgMTM6MjcsIFlpIFN1biB3cm90ZToKPiA+Pj4g
V2hlbiBkb2luZyB0cnVuY2F0ZSwgY29uc2VjdXRpdmUgYmxvY2tzIGluIHRoZSBzYW1lIHNlZ21l
bnQKPiA+Pj4gY2FuIGJlIHByb2Nlc3NlZCBhdCB0aGUgc2FtZSB0aW1lLiBTbyB0aGF0IHRoZSBl
ZmZpY2llbmN5IG9mCj4gPj4+IGRvaW5nIHRydW5jYXRlIGNhbiBiZSBpbXByb3ZlZC4KPiA+Pj4K
PiA+Pj4gQWRkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlc19yYW5nZSgpIG9ubHkgZm9y
IGRvaW5nIHRydW5jYXRlLgo+ID4+PiBBZGQgY2hlY2tfZjJmc19pbnZhbGlkYXRlX2NvbnNlY3V0
aXZlX2Jsb2NrcygpIG9ubHkgZm9yIGRvaW5nCj4gPj4+IHRydW5jYXRlIGFuZCB0byBkZXRlcm1p
bmUgd2hldGhlciB0aGUgYmxvY2tzIGFyZSBjb250aW51b3VzIGFuZAo+ID4+PiBiZWxvbmcgdG8g
dGhlIHNhbWUgc2VnbWVudC4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogWWkgU3VuIDx5aS5z
dW5AdW5pc29jLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIGZzL2YyZnMvY29tcHJlc3MuYyB8IDE0
ICsrKysrKysrKysrKysrCj4gPj4+ICAgIGZzL2YyZnMvZjJmcy5oICAgICB8ICA1ICsrKysrCj4g
Pj4+ICAgIGZzL2YyZnMvZmlsZS5jICAgICB8IDM0ICsrKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKy0KPiA+Pj4gICAgZnMvZjJmcy9zZWdtZW50LmMgIHwgMjUgKysrKysrKysrKysrKysr
KysrKysrKysrKwo+ID4+PiAgICA0IGZpbGVzIGNoYW5nZWQsIDc3IGluc2VydGlvbnMoKyksIDEg
ZGVsZXRpb24oLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBi
L2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4+PiBpbmRleCA3ZjI2NDQwZTg1OTUuLjcwOTI5YTg3ZTli
ZiAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9jb21wcmVzcy5jCj4gPj4+ICsrKyBiL2ZzL2Yy
ZnMvY29tcHJlc3MuYwo+ID4+PiBAQCAtMjAxNCw2ICsyMDE0LDIwIEBAIHZvaWQgZjJmc19pbnZh
bGlkYXRlX2NvbXByZXNzX3BhZ2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3QgaW5v
KQo+ID4+PiAgICAgICAgfSB3aGlsZSAoaW5kZXggPCBlbmQpOwo+ID4+PiAgICB9Cj4gPj4+Cj4g
Pj4+ICt2b2lkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlc19yYW5nZShzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmxvY2tfdCBibGthZGRyLCBpbnQgY250KQo+ID4+PiArewo+ID4+PiArICAgICBpZiAoIXNi
aS0+Y29tcHJlc3NfaW5vZGUpCj4gPj4+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4+PiArCj4g
Pj4+ICsgICAgIGlmIChjbnQgPCAxKSB7Cj4gPj4+ICsgICAgICAgICAgICAgZjJmc19idWdfb24o
c2JpLCAxKTsKPiA+Pj4gKyAgICAgICAgICAgICBjbnQgPSAxOwo+ID4+PiArICAgICB9Cj4gPj4+
ICsKPiA+Pj4gKyAgICAgaW52YWxpZGF0ZV9tYXBwaW5nX3BhZ2VzKENPTVBSRVNTX01BUFBJTkco
c2JpKSwgYmxrYWRkciwgYmxrYWRkciArIGNudCAtIDEpOwo+ID4+PiArfQo+ID4+PiArCj4gPj4+
ICAgIGludCBmMmZzX2luaXRfY29tcHJlc3NfaW5vZGUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
KQo+ID4+PiAgICB7Cj4gPj4+ICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2RlOwo+ID4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4+PiBpbmRleCBjZTAw
Y2I1NDZmNGEuLjk5NzY3ZjM1Njc4ZiAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgK
PiA+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiA+Pj4gQEAgLTM3MTYsNiArMzcxNiw3IEBAIGlu
dCBmMmZzX2NyZWF0ZV9mbHVzaF9jbWRfY29udHJvbChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Owo+ID4+PiAgICBpbnQgZjJmc19mbHVzaF9kZXZpY2VfY2FjaGUoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKTsKPiA+Pj4gICAgdm9pZCBmMmZzX2Rlc3Ryb3lfZmx1c2hfY21kX2NvbnRyb2woc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBib29sIGZyZWUpOwo+ID4+PiAgICB2b2lkIGYyZnNfaW52
YWxpZGF0ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGFkZHIpOwo+
ID4+PiArdm9pZCBmMmZzX2ludmFsaWRhdGVfY29uc2VjdXRpdmVfYmxvY2tzKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgYmxvY2tfdCBhZGRyLCBpbnQgY250KTsKPiA+Pj4gICAgYm9vbCBmMmZz
X2lzX2NoZWNrcG9pbnRlZF9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBi
bGthZGRyKTsKPiA+Pj4gICAgaW50IGYyZnNfc3RhcnRfZGlzY2FyZF90aHJlYWQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKTsKPiA+Pj4gICAgdm9pZCBmMmZzX2Ryb3BfZGlzY2FyZF9jbWQoc3Ry
dWN0IGYyZnNfc2JfaW5mbyAqc2JpKTsKPiA+Pj4gQEAgLTQzNzUsNiArNDM3Niw4IEBAIHZvaWQg
ZjJmc19jYWNoZV9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1
Y3QgcGFnZSAqcGFnZSwKPiA+Pj4gICAgYm9vbCBmMmZzX2xvYWRfY29tcHJlc3NlZF9wYWdlKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IHBhZ2UgKnBhZ2UsCj4gPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJs
b2NrX3QgYmxrYWRkcik7Cj4gPj4+ICAgIHZvaWQgZjJmc19pbnZhbGlkYXRlX2NvbXByZXNzX3Bh
Z2VzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3QgaW5vKTsKPiA+Pj4gK3ZvaWQgZjJm
c19pbnZhbGlkYXRlX2NvbXByZXNzX3BhZ2VzX3JhbmdlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBibG9ja190IGJs
a2FkZHIsIGludCBjbnQpOwo+ID4+PiAgICAjZGVmaW5lIGluY19jb21wcl9pbm9kZV9zdGF0KGlu
b2RlKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKPiA+Pj4gICAgICAgIGRvIHsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBcCj4gPj4+ICAgICAgICAgICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNf
SV9TQihpbm9kZSk7ICAgICAgICAgICAgXAo+ID4+PiBAQCAtNDQzMiw2ICs0NDM1LDggQEAgc3Rh
dGljIGlubGluZSBib29sIGYyZnNfbG9hZF9jb21wcmVzc2VkX3BhZ2Uoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IHBh
Z2UgKnBhZ2UsIGJsb2NrX3QgYmxrYWRkcikgeyByZXR1cm4gZmFsc2U7IH0KPiA+Pj4gICAgc3Rh
dGljIGlubGluZSB2b2lkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlcyhzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBuaWRfdCBpbm8pIHsgfQo+ID4+PiArc3RhdGljIGlubGluZSB2
b2lkIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19wYWdlc19yYW5nZShzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBibG9ja190IGJsa2FkZHIsIGludCBjbnQpIHsgfQo+ID4+PiAgICAjZGVmaW5lIGluY19j
b21wcl9pbm9kZV9zdGF0KGlub2RlKSAgICAgICAgIGRvIHsgfSB3aGlsZSAoMCkKPiA+Pj4gICAg
c3RhdGljIGlubGluZSBpbnQgZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoCj4gPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+PiBpbmRleCA3MDU3
ZWZhOGVjMTcuLjYzNDY5MWUzYjVmMSAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMK
PiA+Pj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiA+Pj4gQEAgLTYxMiw2ICs2MTIsMTggQEAgc3Rh
dGljIGludCBmMmZzX2ZpbGVfb3BlbihzdHJ1Y3QgaW5vZGUgKmlub2RlLCBzdHJ1Y3QgZmlsZSAq
ZmlscCkKPiA+Pj4gICAgICAgIHJldHVybiBmaW5pc2hfcHJlYWxsb2NhdGVfYmxvY2tzKGlub2Rl
KTsKPiA+Pj4gICAgfQo+ID4+Pgo+ID4+PiArc3RhdGljIGJvb2wgY2hlY2tfZjJmc19pbnZhbGlk
YXRlX2NvbnNlY3V0aXZlX2Jsb2NrcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxvY2tfdCBibGthZGRyMSwgYmxv
Y2tfdCBibGthZGRyMikKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgaWYgKGJsa2FkZHIyIC0gYmxrYWRk
cjEgIT0gMSkKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPj4+ICsKPiA+Pj4g
KyAgICAgaWYgKEdFVF9TRUdOTyhzYmksIGJsa2FkZHIxKSAhPSBHRVRfU0VHTk8oc2JpLCBibGth
ZGRyMikpCj4gPj4+ICsgICAgICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ID4+PiArCj4gPj4+ICsg
ICAgIHJldHVybiB0cnVlOwo+ID4+PiArfQo+ID4+PiArCj4gPj4+ICAgIHZvaWQgZjJmc190cnVu
Y2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIGludCBjb3Vu
dCkKPiA+Pj4gICAgewo+ID4+PiAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJG
U19JX1NCKGRuLT5pbm9kZSk7Cj4gPj4+IEBAIC02MjEsNiArNjMzLDkgQEAgdm9pZCBmMmZzX3Ry
dW5jYXRlX2RhdGFfYmxvY2tzX3JhbmdlKHN0cnVjdCBkbm9kZV9vZl9kYXRhICpkbiwgaW50IGNv
dW50KQo+ID4+PiAgICAgICAgaW50IGNsdXN0ZXJfaW5kZXggPSAwLCB2YWxpZF9ibG9ja3MgPSAw
Owo+ID4+PiAgICAgICAgaW50IGNsdXN0ZXJfc2l6ZSA9IEYyRlNfSShkbi0+aW5vZGUpLT5pX2Ns
dXN0ZXJfc2l6ZTsKPiA+Pj4gICAgICAgIGJvb2wgcmVsZWFzZWQgPSAhYXRvbWljX3JlYWQoJkYy
RlNfSShkbi0+aW5vZGUpLT5pX2NvbXByX2Jsb2Nrcyk7Cj4gPj4+ICsgICAgIGJsb2NrX3QgY29u
X3N0YXJ0Owo+ID4+PiArICAgICBib29sIHJ1bl9pbnZhbGlkID0gdHJ1ZTsKPiA+Pj4gKyAgICAg
aW50IGNvbl9jbnQgPSAxOwo+ID4+Pgo+ID4+PiAgICAgICAgYWRkciA9IGdldF9kbm9kZV9hZGRy
KGRuLT5pbm9kZSwgZG4tPm5vZGVfcGFnZSkgKyBvZnM7Cj4gPj4+Cj4gPj4+IEBAIC02NTIsNyAr
NjY3LDI0IEBAIHZvaWQgZjJmc190cnVuY2F0ZV9kYXRhX2Jsb2Nrc19yYW5nZShzdHJ1Y3QgZG5v
ZGVfb2ZfZGF0YSAqZG4sIGludCBjb3VudCkKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIHZhbGlkX2Jsb2NrcysrOwo+ID4+PiAgICAgICAgICAgICAgICB9Cj4gPj4+Cj4gPj4+
IC0gICAgICAgICAgICAgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzYmksIGJsa2FkZHIpOwo+ID4+
PiArICAgICAgICAgICAgIGlmIChydW5faW52YWxpZCkKPiA+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgIGNvbl9zdGFydCA9IGJsa2FkZHI7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgICAgICAgICBpZiAo
Y291bnQgPiAxICYmCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBjaGVja19mMmZzX2ludmFs
aWRhdGVfY29uc2VjdXRpdmVfYmxvY2tzKHNiaSwgYmxrYWRkciwKPiA+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgbGUzMl90b19jcHUoKihhZGRyICsgMSkpKSkgewo+ID4+PiArICAg
ICAgICAgICAgICAgICAgICAgcnVuX2ludmFsaWQgPSBmYWxzZTsKPiA+Pj4gKwo+ID4+PiArICAg
ICAgICAgICAgICAgICAgICAgaWYgKGNvbl9jbnQrKyA9PSAxKQo+ID4+PiArICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICBjb25fc3RhcnQgPSBibGthZGRyOwo+ID4+PiArICAgICAgICAgICAg
IH0gZWxzZSB7Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBydW5faW52YWxpZCA9IHRydWU7
Cj4gPj4+ICsgICAgICAgICAgICAgfQo+ID4+PiArCj4gPj4+ICsgICAgICAgICAgICAgaWYgKHJ1
bl9pbnZhbGlkKSB7Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICBmMmZzX2ludmFsaWRhdGVf
Y29uc2VjdXRpdmVfYmxvY2tzKHNiaSwgY29uX3N0YXJ0LCBjb25fY250KTsKPiA+Pj4gKyAgICAg
ICAgICAgICAgICAgICAgIGNvbl9jbnQgPSAxOwo+ID4+PiArICAgICAgICAgICAgIH0KPiA+Pj4K
PiA+Pj4gICAgICAgICAgICAgICAgaWYgKCFyZWxlYXNlZCB8fCBibGthZGRyICE9IENPTVBSRVNT
X0FERFIpCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgbnJfZnJlZSsrOwo+ID4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4+PiBpbmRl
eCBmMTE4ZmFmMzZkMzUuLmVkYjhhNzg5ODViYSAxMDA2NDQKPiA+Pj4gLS0tIGEvZnMvZjJmcy9z
ZWdtZW50LmMKPiA+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiA+Pj4gQEAgLTI1NzAsNiAr
MjU3MCwzMSBAQCB2b2lkIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Moc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBibG9ja190IGFkZHIpCj4gPj4+ICAgICAgICB1cF93cml0ZSgmc2l0X2ktPnNlbnRy
eV9sb2NrKTsKPiA+Pj4gICAgfQo+ID4+Pgo+ID4+PiArdm9pZCBmMmZzX2ludmFsaWRhdGVfY29u
c2VjdXRpdmVfYmxvY2tzKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBhZGRyLCBp
bnQgY250KQo+ID4+PiArewo+ID4+PiArICAgICB1bnNpZ25lZCBpbnQgc2Vnbm8gPSBHRVRfU0VH
Tk8oc2JpLCBhZGRyKTsKPiA+Pj4gKyAgICAgdW5zaWduZWQgaW50IHNlZ25vMiA9IEdFVF9TRUdO
TyhzYmksIGFkZHIgKyBjbnQgLSAxKTsKPiA+Pj4gKyAgICAgc3RydWN0IHNpdF9pbmZvICpzaXRf
aSA9IFNJVF9JKHNiaSk7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgZjJmc19idWdfb24oc2JpLCBhZGRy
ID09IE5VTExfQUREUiB8fCBzZWdubyAhPSBzZWdubzIpOwo+ID4+PiArICAgICBpZiAoYWRkciA9
PSBORVdfQUREUiB8fCBhZGRyID09IENPTVBSRVNTX0FERFIpCj4gPj4+ICsgICAgICAgICAgICAg
cmV0dXJuOwo+ID4+PiArCj4gPj4+ICsgICAgIGYyZnNfdHJ1bmNhdGVfbWV0YV9pbm9kZV9wYWdl
cyhzYmksIGFkZHIsIGNudCk7Cj4gPj4+ICsgICAgIGYyZnNfaW52YWxpZGF0ZV9jb21wcmVzc19w
YWdlc19yYW5nZShzYmksIGFkZHIsIGNudCk7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgLyogYWRkIGl0
IGludG8gc2l0IG1haW4gYnVmZmVyICovCj4gPj4+ICsgICAgIGRvd25fd3JpdGUoJnNpdF9pLT5z
ZW50cnlfbG9jayk7Cj4gPj4+ICsKPiA+Pj4gKyAgICAgdXBkYXRlX3NlZ21lbnRfbXRpbWUoc2Jp
LCBhZGRyLCAwKTsKPiA+Pj4gKyAgICAgdXBkYXRlX3NpdF9lbnRyeShzYmksIGFkZHIsIC1jbnQp
Owo+ID4+PiArCj4gPj4+ICsgICAgIC8qIGFkZCBpdCBpbnRvIGRpcnR5IHNlZ2xpc3QgKi8KPiA+
Pj4gKyAgICAgbG9jYXRlX2RpcnR5X3NlZ21lbnQoc2JpLCBzZWdubyk7Cj4gPj4+ICsKPiA+Pj4g
KyAgICAgdXBfd3JpdGUoJnNpdF9pLT5zZW50cnlfbG9jayk7Cj4gPj4KPiA+PiBJIHRoaW5rIGl0
IG5lZWRzIHRvIGNsZWFuIHVwIHRoaXMgcGF0Y2hzZXQsIHdoYXQgYWJvdXQgZXhwYW5kaW5nCj4g
Pj4gZjJmc19pbnZhbGlkYXRlX2Jsb2NrcygpIHRvIHN1cHBvcnQgaW52YWxpZGF0aW5nIGJsb2Nr
IGFkZHJlc3MgZXh0ZW50Pwo+ID4+Cj4gPj4gU29tZXRoaW5nIGxpa2UgdGhpczoKPiA+Pgo+ID4+
IHZvaWQgZjJmc19pbnZhbGlkYXRlX2Jsb2NrcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJs
b2NrX3QgYmxrYWRkciwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgdW5zaWduZWQgaW50IGxlbikKPiA+PiB7Cj4gPj4gICAgICAgICAgc3RydWN0
IHNpdF9pbmZvICpzaXRfaSA9IFNJVF9JKHNiaSk7Cj4gPj4gICAgICAgICAgaW50IGk7Cj4gPj4K
PiA+PiAgICAgICAgICAvKiBUT0RPOiBkbyBzYW5pdHkgY2hlY2sgb24gYmxrYWRkciBleHRlbnQg
Ki8KPiA+Pgo+ID4+ICAgICAgICAgIGRvd25fd3JpdGUoJnNpdF9pLT5zZW50cnlfbG9jayk7Cj4g
Pj4KPiA+PiAgICAgICAgICAvKiBUT0RPOiBleHBhbmQgZjJmc19pbnZhbGlkYXRlX2ludGVybmFs
X2NhY2hlKCkgdG8gaW52YWxpZGF0ZSBibGthZGRyIGV4dGVudCAqLwo+ID4+ICAgICAgICAgIGYy
ZnNfaW52YWxpZGF0ZV9pbnRlcm5hbF9jYWNoZShzYmksIGJsa2FkZHIsIGxlbik7Cj4gPj4KPiA+
PiAgICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbGVuOyBpKyspIHsKPiA+PiAgICAgICAgICAgICAg
ICAgIHVwZGF0ZV9zZWdtZW50X210aW1lKHNiaSwgYmxrYWRkciwgMCk7Cj4gPj4gICAgICAgICAg
ICAgICAgICB1cGRhdGVfc2l0X2VudHJ5KHNiaSwgYmxrYWRkciwgLTEpOwo+ID4+Cj4gPj4gICAg
ICAgICAgICAgICAgICAvKiBhZGQgaXQgaW50byBkaXJ0eSBzZWdsaXN0ICovCj4gPj4gICAgICAg
ICAgICAgICAgICBsb2NhdGVfZGlydHlfc2VnbWVudChzYmksIEdFVF9TRUdOTyhzYmksIGJsa2Fk
ZHIpKTsKPiA+PiAgICAgICAgICB9Cj4gPj4KPiA+PiAgICAgICAgICB1cF93cml0ZSgmc2l0X2kt
PnNlbnRyeV9sb2NrKTsKPiA+PiB9Cj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+Cj4KPiBIaSBZ
aSwKPgo+ID4gSGkgQ2hhbywKPiA+IFRoZSBjb2RlIHN0cnVjdHVyZSB5b3UgcHJvcG9zZWQgaXMg
dmVyeSBnb29kIGFuZCB2ZXJ5IGNsZWFyLgo+ID4gSSByZXRlc3RlZCB1c2luZyB0aGlzIGNvZGUg
c3RydWN0dXJlIGFuZCBmb3VuZCB0aGF0IHRoZSBzcGVlZAo+ID4gb2YgZG9pbmcgdHJ1bmNhdGUg
YWxzbyBpbXByb3ZlZCwgYnV0IHRoZSBpbXByb3ZlbWVudCB3YXMgc21hbGxlci4KPiA+Cj4gPiBT
byBpdCBtaWdodCBiZSBiZXR0ZXIgdG8gdXNlIHRoZSBmb2xsb3dpbmcgY29kZSBzdHJ1Y3R1cmUu
Cj4gPiB2b2lkIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3MoLi4uICwgbGVuKQo+ID4gewo+ID4gICAg
ICBkb3duX3dyaXRlKCk7Cj4gPiAgICAgIC8vIFByb2Nlc3MgaW4gc2VnbWVudHMgaW5zdGVhZCBv
ZiBibG9ja3MuCj4gPiAgICAgIGZvciAoaSA9IDA7IGkgPCBzZWdtZW50X251bTsgaSsrKSB7Cj4g
PiAgICAgICAgICB1cGRhdGVfc2VnbWVudF9tdGltZSgpOwo+ID4gICAgICAgICAgdXBkYXRlX3Np
dF9lbnRyeSgpOwo+Cj4gQWgsIHllcywgaXQgY2FuIG1lcmdlIG1vcmUgb3BlcmF0aW9ucyBhbmQg
ZG8gaXQgdy8gc2VnbWVudCBncmFudWxhcml0eS4KPgo+IENhbiB5b3UgcGxlYXNlIHRyeToKPgo+
ICAgICAgICAgICAgICAgICBmb3IgKGogPSBzdGFydDsgaiA8IGVuZDsgaisrKQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIHVwZGF0ZV9zaXRfZW50cnkoKTsKPgo+IE1heWJlIGl0IGNhbiBlbGlt
aW5hdGUgY2hhbmdlIGluIHVwZGF0ZV9zaXRfZW50cnkoKS4KPgo+ID4KPiA+ICAgICAgICAgICAv
KiBhZGQgaXQgaW50byBkaXJ0eSBzZWdsaXN0ICovCj4gPiAgICAgICAgICBsb2NhdGVfZGlydHlf
c2VnbWVudCgpOwo+ID4gICAgICAgfQo+ID4gICAgICB1cF93cml0ZSgpOwo+ID4gfQo+ID4KPiA+
IFRpbWUgQ29tcGFyaXNvbiBvZiBybToKPiA+IG9yaWdpbmFsICAgIG9wdGltaXphdGlvbihzZWdt
ZW50IHVuaXQpICAgIHJhdGlvKHNlZ21lbnQgdW5pdCkKPiA+IDcuMTdzICAgICAgICAgICAzLjI3
cyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA1NC4zOSUKPiA+ICAgICAgICAgICAg
ICAgICBvcHRpbWl6YXRpb24oYmxvY2sgdW5pdCkgICAgICAgICAgcmF0aW8oYmxvY2sgdW5pdCkK
PiA+ICAgICAgICAgICAgICAgICAgICAgIDUuMTJzICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIDI4LjYlCj4KPiBUaGFua3MgZm9yIHRoZSB0ZXN0IGFuZCBmZWVkYmFjay4KPgo+IFRo
YW5rcywKPgoKSGkgQ2hhbywKCkkgcmV0ZXN0ZWQgbGlrZSB0aGlzOgoKVGVzdDEobm8gY2hhbmdl
IGZ1bmN0aW9uIHVwZGF0ZV9zaXRfZW50cnkpOgp2b2lkIGYyZnNfaW52YWxpZGF0ZV9ibG9ja3Mo
Li4uICwgbGVuKSB7CiAgICBkb3duX3dyaXRlKCk7CiAgICB0aW1lMSA9IGt0aW1lX2dldCgpOwog
ICAgZm9yIChpID0gMDsgaSA8IHNlZ21lbnRfbnVtOyBpKyspIHsKICAgICAgICB1cGRhdGVfc2Vn
bWVudF9tdGltZSgpOwogICAgICAgIGZvcigpIHsKICAgICAgICAgICAgdXBkYXRlX3NpdF9lbnRy
eSguLi4sLTEpOwogICAgICAgIH0KICAgICAgICBsb2NhdGVfZGlydHlfc2VnbWVudCgpOwogICAg
fQogICAgdGltZTIgPSBrdGltZV9nZXQoKTsKICAgIHVwX3dyaXRlKCk7Cn0KClRlc3QyKGNoYW5n
ZSBmdW5jdGlvbiB1cGRhdGVfc2l0X2VudHJ5KToKdm9pZCBmMmZzX2ludmFsaWRhdGVfYmxvY2tz
KC4uLiAsIGxlbikgewogICAgZG93bl93cml0ZSgpOwogICAgdGltZTEgPSBrdGltZV9nZXQoKTsK
ICAgIGZvciAoaSA9IDA7IGkgPCBzZWdtZW50X251bTsgaSsrKSB7CiAgICAgICAgdXBkYXRlX3Nl
Z21lbnRfbXRpbWUoKTsKICAgICAgICB1cGRhdGVfc2l0X2VudHJ5KCk7CiAgICAgICAgbG9jYXRl
X2RpcnR5X3NlZ21lbnQoKTsKICAgIH0KICAgIHRpbWUyID0ga3RpbWVfZ2V0KCk7CiAgICB1cF93
cml0ZSgpOwp9CgpSZXN1bHQodGhlIHN1bSBvZiAodGltZTIgLSB0aW1lMSkpOgp0ZXN0MSAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgdGVzdDIgICAgICAgICAgICAgICAgICAgICAgICAgICBy
YXRpbwo5NjM4MDc0MzMgbnMgICAgICAgICAgICAgIDIwOTMxNjkwMyBucyAgICAgICAgICAgIDc4
LjMlCgpQZXJoYXBzIGl0IHdvdWxkIGJlIG1vcmUgYmVuZWZpY2lhbCB0byBhbGxvdyB0aGUgdXBk
YXRlX3NpdF9lbnRyeSgpIGZ1bmN0aW9uCnRvIGhhbmRsZSBtdWx0aXBsZSBjb25zZWN1dGl2ZSBi
bG9ja3MuCgo+ID4KPiA+IE5ldyBwYXRjaGVzIHdpbGwgYmUgc2VudCBvdXQgYnkgZW1haWwgYWZ0
ZXIgdGhleSBhcmUgc29ydGVkIG91dC4KPiA+IFRoYW5rIHlvdSBmb3IgeW91ciB2YWx1YWJsZSBz
dWdnZXN0aW9ucy4KPiA+Cj4gPj4+ICt9Cj4gPj4+ICsKPiA+Pj4gICAgYm9vbCBmMmZzX2lzX2No
ZWNrcG9pbnRlZF9kYXRhKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgYmxvY2tfdCBibGthZGRy
KQo+ID4+PiAgICB7Cj4gPj4+ICAgICAgICBzdHJ1Y3Qgc2l0X2luZm8gKnNpdF9pID0gU0lUX0ko
c2JpKTsKPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
