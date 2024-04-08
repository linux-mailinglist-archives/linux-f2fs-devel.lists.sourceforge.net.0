Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 604BB89CB4B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Apr 2024 19:56:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rttEX-0005a8-Il;
	Mon, 08 Apr 2024 17:56:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rttEV-0005Zn-8l
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 17:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2/dc4+cjV1nRvMlJvOrHmfnnqBQu1vw9EU5dHurwIFw=; b=J4GVzt6kdfvi55wEDa8NITztDm
 r+4XSmlL4rg2JQD995ExsFK/T5Vgf5aCxkjqPX9P4JUgBhz35TaxWV9M1Ib/uI8DZ1rfcJXqByuOg
 q+n7H1nSKMamFUqU8oDGIBJmGMUl0uEK/7YiBmnwvIBRuo/krQQBMD+jhcXZ5UO4J2ZM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2/dc4+cjV1nRvMlJvOrHmfnnqBQu1vw9EU5dHurwIFw=; b=Iekp4XqMZsIOFymQmTtG/6Nb6K
 cHn5eSTBNCZO7OrSFPySXJJysoek8hMLz1L7uJVx0RM3pCaRi9wFDNkfy7ZpiKvOCRwvUq9MGIQpa
 RlExt14CKFXeBc2++K2fDAr5kT/yHBExMZ4o1XqqXFRMB7ny6pxm/obeEnacs4sCJcSc=;
Received: from mail-vs1-f49.google.com ([209.85.217.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rttER-0002OY-7m for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 17:56:39 +0000
Received: by mail-vs1-f49.google.com with SMTP id
 ada2fe7eead31-479f2922db0so500150137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 08 Apr 2024 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712598989; x=1713203789; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2/dc4+cjV1nRvMlJvOrHmfnnqBQu1vw9EU5dHurwIFw=;
 b=kEoEDR9IjOpdija9nCOOCNS6lMlnzlwk6KehRxp8Ou8XLQ3hrVxhgGRM9ahIelbcON
 kb0tjVPiWfS4V5hfhXf2NKLBr9SHhWYxzzJJ1mJGMsJKPESSXn+26j1uE2cH46y/WZv3
 wLC4Jfl+LJ2JwNIJjBoQX38qMFw+jYQEGDI1dEV1gUtAK5yrBWF/98eFn2x+ZyuRwlEO
 KQNo6P91FNg/anpnKxIDtn8Z/Our8SA04rh5DKsTb5JoKE6KgHD4xAM0aqkk463QgkYw
 lImlbt+oaXnVOZ4+SaSHo0nAa0GX2QiqkxMguf5l6uceJ8r/2S9+aBGaa4sNnTczpfQG
 kXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712598989; x=1713203789;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2/dc4+cjV1nRvMlJvOrHmfnnqBQu1vw9EU5dHurwIFw=;
 b=sa5OFg8QYcyHXvFlVePkkRc3boRg/yNsXxXIVuEZs8+GP7cqyJfh7UsTL7xB76w8sd
 lsCCmgTvNpR3C+ekmjdVM7QT26k43Vpa+7Og4oMDe23hDyyQUExqQ/xPLkip4zYGrmZ7
 92gM+QpMNGRiRuUaQZeCudMdhRNhklkbIFiThjtxtqC6FV0HVEDJchjNOUwGrLLjXpef
 v9o2lWLN12K9GJqKx+CFYVUU7U8TrBaj1/YnW8GQHAQakODyP/gT0uMUlMmwkwuNDpXD
 q2JrEX/2uMdRY/HZofVVBW74Xeu5QjXX6XcU4DMcFITOc2Z8DVDN/YezoENhZigUKDuv
 18zw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUnFMEFnRVrL1QEXJHhzKTrA4o/hoVuVOHI+oKdba7kJERlkBUBpULmJE7JEbN5a2cBCN3b0eD0QCVEQwOgO05ZAaFy2953xVFGokUq8vpjcaDzaY4bw==
X-Gm-Message-State: AOJu0YyXQDhYW6sLaRCtIwUtEk268UjG6dBT8RxLPgjIqXRkUdTqKWiB
 eVCiXlnFaoRrQMVMBr6hGYAYpwWt/FnUMuIQPNolLivxr02+kKidJy7j6u88/b0/+mgTAqSw6pF
 MzjzYs0DGvTHrMMwqY+G/vY5EgIfaPDJm0Qc=
X-Google-Smtp-Source: AGHT+IHVRMa1nTTtQPmvzVkbDq9045lHxqXTp1ABAB/zCyvK7s/lmgHi/WgP4n6yFdh9wtZ6d/RkmRWNaMwa5rwXVec=
X-Received: by 2002:a05:6102:c51:b0:47a:a6c:9e61 with SMTP id
 y17-20020a0561020c5100b0047a0a6c9e61mr2424671vss.16.1712598989527; Mon, 08
 Apr 2024 10:56:29 -0700 (PDT)
MIME-Version: 1.0
References: <20240407072123.3484300-1-chao@kernel.org>
In-Reply-To: <20240407072123.3484300-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 8 Apr 2024 10:56:18 -0700
Message-ID: <CACOAw_w2LnR4uE+psU_eq5M+PQVyOaC1iDLzGVq8Mbvx0x=ZSg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Apr 7, 2024 at 12:23 AM Chao Yu wrote: > > From:
    Wenjie Qi > > If the max open zones of zoned devices are less than > the
   active logs of F2FS, the device may error due to > insufficient [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.217.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1rttER-0002OY-7m
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: fix zoned block device information
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
Cc: Wenjie Qi <qwjhust@gmail.com>, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBBcHIgNywgMjAyNCBhdCAxMjoyM+KAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBGcm9tOiBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPgo+Cj4gSWYg
dGhlIG1heCBvcGVuIHpvbmVzIG9mIHpvbmVkIGRldmljZXMgYXJlIGxlc3MgdGhhbgo+IHRoZSBh
Y3RpdmUgbG9ncyBvZiBGMkZTLCB0aGUgZGV2aWNlIG1heSBlcnJvciBkdWUgdG8KPiBpbnN1ZmZp
Y2llbnQgem9uZSByZXNvdXJjZXMgd2hlbiBtdWx0aXBsZSBhY3RpdmUgbG9ncwo+IGFyZSBiZWlu
ZyB3cml0dGVuIGF0IHRoZSBzYW1lIHRpbWUuCj4KPiBTaWduZWQtb2ZmLWJ5OiBXZW5qaWUgUWkg
PHF3amh1c3RAZ21haWwuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVs
Lm9yZz4KPiAtLS0KPiB2NzoKPiAtIGNoZWNrIGYyZnNfc2JfaGFzX2Jsa3pvbmVkKCkgaW5zdGVh
ZCBvZiBtdWx0aXBsZS1kZXZpY2UgY29uZGl0aW9uCj4gaW4gZjJmc19yZW1vdW50KCkuCj4gIGZz
L2YyZnMvZjJmcy5oICB8ICAxICsKPiAgZnMvZjJmcy9zdXBlci5jIHwgMjcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrCj4gIDIgZmlsZXMgY2hhbmdlZCwgMjggaW5zZXJ0aW9ucygrKQo+Cj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPiBpbmRleCAwNTUw
OTI5ZGM2ZTUuLjY5NGY4YTUyY2I4NCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ICsr
KyBiL2ZzL2YyZnMvZjJmcy5oCj4gQEAgLTE1NTksNiArMTU1OSw3IEBAIHN0cnVjdCBmMmZzX3Ni
X2luZm8gewo+Cj4gICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ICAgICAgICAgdW5zaWdu
ZWQgaW50IGJsb2Nrc19wZXJfYmxrejsgICAgICAgICAgIC8qIEYyRlMgYmxvY2tzIHBlciB6b25l
ICovCj4gKyAgICAgICB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7ICAgICAgICAgICAgLyog
bWF4IG9wZW4gem9uZSByZXNvdXJjZXMgb2YgdGhlIHpvbmVkIGRldmljZSAqLwo+ICAjZW5kaWYK
Pgo+ICAgICAgICAgLyogZm9yIG5vZGUtcmVsYXRlZCBvcGVyYXRpb25zICovCj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGluZGV4IGJhNjI4OGU4NzBj
NS4uZmRmMzU4YzdmODA4IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ICsrKyBiL2Zz
L2YyZnMvc3VwZXIuYwo+IEBAIC0yMzI0LDYgKzIzMjQsMTcgQEAgc3RhdGljIGludCBmMmZzX3Jl
bW91bnQoc3RydWN0IHN1cGVyX2Jsb2NrICpzYiwgaW50ICpmbGFncywgY2hhciAqZGF0YSkKPiAg
ICAgICAgIGlmIChlcnIpCj4gICAgICAgICAgICAgICAgIGdvdG8gcmVzdG9yZV9vcHRzOwo+Cj4g
KyNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ICsgICAgICAgaWYgKGYyZnNfc2JfaGFzX2Js
a3pvbmVkKHNiaSkgJiYKPiArICAgICAgICAgICAgICAgc2JpLT5tYXhfb3Blbl96b25lcyA8IEYy
RlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpIHsKPiArICAgICAgICAgICAgICAgZjJmc19lcnIo
c2JpLAo+ICsgICAgICAgICAgICAgICAgICAgICAgICJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUg
aXMgdG9vIHNtYWxsLCBuZWVkIGF0IGxlYXN0ICV1IG9wZW4gem9uZXMiLAo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X29wZW5fem9uZXMsIEYyRlNfT1BUSU9OKHNi
aSkuYWN0aXZlX2xvZ3MpOwo+ICsgICAgICAgICAgICAgICBlcnIgPSAtRUlOVkFMOwo+ICsgICAg
ICAgICAgICAgICBnb3RvIHJlc3RvcmVfb3B0czsKPiArICAgICAgIH0KPiArI2VuZGlmCj4gKwo+
ICAgICAgICAgLyogZmx1c2ggb3V0c3RhbmRpbmcgZXJyb3JzIGJlZm9yZSBjaGFuZ2luZyBmcyBz
dGF0ZSAqLwo+ICAgICAgICAgZmx1c2hfd29yaygmc2JpLT5zX2Vycm9yX3dvcmspOwo+Cj4gQEAg
LTM4NjYsMTEgKzM4NzcsMjQgQEAgc3RhdGljIGludCBpbml0X2Jsa3pfaW5mbyhzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksIGludCBkZXZpKQo+ICAgICAgICAgc2VjdG9yX3QgbnJfc2VjdG9ycyA9
IGJkZXZfbnJfc2VjdG9ycyhiZGV2KTsKPiAgICAgICAgIHN0cnVjdCBmMmZzX3JlcG9ydF96b25l
c19hcmdzIHJlcF96b25lX2FyZzsKPiAgICAgICAgIHU2NCB6b25lX3NlY3RvcnM7Cj4gKyAgICAg
ICB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4gICAgICAgICBpbnQgcmV0Owo+Cj4gICAg
ICAgICBpZiAoIWYyZnNfc2JfaGFzX2Jsa3pvbmVkKHNiaSkpCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAwOwo+Cj4gKyAgICAgICBpZiAoYmRldl9pc196b25lZChGREVWKGRldmkpLmJkZXYpKSB7
Cj4gKyAgICAgICAgICAgICAgIG1heF9vcGVuX3pvbmVzID0gYmRldl9tYXhfb3Blbl96b25lcyhi
ZGV2KTsKPiArICAgICAgICAgICAgICAgaWYgKG1heF9vcGVuX3pvbmVzICYmIChtYXhfb3Blbl96
b25lcyA8IHNiaS0+bWF4X29wZW5fem9uZXMpKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIHNi
aS0+bWF4X29wZW5fem9uZXMgPSBtYXhfb3Blbl96b25lczsKPiArICAgICAgICAgICAgICAgaWYg
KHNiaS0+bWF4X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7Cj4g
KyAgICAgICAgICAgICAgICAgICAgICAgZjJmc19lcnIoc2JpLAo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgInpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21hbGwsIG5l
ZWQgYXQgbGVhc3QgJXUgb3BlbiB6b25lcyIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBzYmktPm1heF9vcGVuX3pvbmVzLCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsK
PiArICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiArICAgICAgICAgICAg
ICAgfQo+ICsgICAgICAgfQo+ICsKPiAgICAgICAgIHpvbmVfc2VjdG9ycyA9IGJkZXZfem9uZV9z
ZWN0b3JzKGJkZXYpOwo+ICAgICAgICAgaWYgKHNiaS0+YmxvY2tzX3Blcl9ibGt6ICYmIHNiaS0+
YmxvY2tzX3Blcl9ibGt6ICE9Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTRUNU
T1JfVE9fQkxPQ0soem9uZV9zZWN0b3JzKSkKPiBAQCAtNDE5MSw2ICs0MjE1LDkgQEAgc3RhdGlj
IGludCBmMmZzX3NjYW5fZGV2aWNlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4KPiAgICAg
ICAgIGxvZ2ljYWxfYmxrc2l6ZSA9IGJkZXZfbG9naWNhbF9ibG9ja19zaXplKHNiaS0+c2ItPnNf
YmRldik7Cj4gICAgICAgICBzYmktPmFsaWduZWRfYmxrc2l6ZSA9IHRydWU7Cj4gKyNpZmRlZiBD
T05GSUdfQkxLX0RFVl9aT05FRAo+ICsgICAgICAgc2JpLT5tYXhfb3Blbl96b25lcyA9IFVJTlRf
TUFYOwo+ICsjZW5kaWYKPgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IG1heF9kZXZpY2VzOyBp
KyspIHsKPiAgICAgICAgICAgICAgICAgaWYgKGkgPT0gMCkKPiAtLQo+IDIuNDAuMQo+Cj4KClJl
dmlld2VkLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
