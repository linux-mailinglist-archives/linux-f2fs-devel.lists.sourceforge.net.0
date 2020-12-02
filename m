Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE1CF2CCA94
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 00:41:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkbkt-0002Du-Ls; Wed, 02 Dec 2020 23:41:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kkbkm-0002DZ-6r
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 23:41:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2MZg9rwwzJqNY4vBuoQ7E1AsQz9WoyH5LlwbJiuxBCA=; b=Ww0UZQmcZwTJKbh+SFwAd9CJPy
 plbrBjp7Y1JzHfTxEE95HHKE3yYRVjkm27ynZvgvXBavpcqHkTVdHDAlEej0VCb1/hlH8WXlXLfUO
 q2gLUP5V7jY186du+i7SqET0iwjcwTCO3/7y44iYIWJaZ/PHmSsswG3j6Ya94x6ppbAQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2MZg9rwwzJqNY4vBuoQ7E1AsQz9WoyH5LlwbJiuxBCA=; b=O3yVXFTZodVGjOu9udcXooUr3q
 GcECGSDjSh1drkrYmCqkvyOMNAms7MliL6hQHYIXAy1AbVSvWMPI8j1Dp9dSJMQCK/p3ue7qPi0Vm
 3soi1+lNC8jwu1gGKI5Gh9f83W2NvWGEaBj0pURcxkDnhX9/g19we8Bva5Pm54WITiA8=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kkbkh-00GkeJ-KF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Dec 2020 23:41:44 +0000
Received: by mail-lj1-f194.google.com with SMTP id y7so413313lji.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Dec 2020 15:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2MZg9rwwzJqNY4vBuoQ7E1AsQz9WoyH5LlwbJiuxBCA=;
 b=Q2ygaJphONvB/x14kgSi1ChW9g/F+y7v2UycX9NJeSAARM3a6pHtM0VLL2sfsAC7rV
 UaNU8spKQvdGXVGjBIYcLtuSjmcgAu4LsN57NjcUPuGIEEHgJ/44FMtPHKvhXEmfxdbn
 ByRXSMpxQP8wdEC6++bHv1yN5ID5K2EStMvN90hUsDTj65TNjuCvo5J0QvEEIHpv8Ej9
 zv6hh+ER5NYdBF9zsoMxQIZkaKCJtoLECx/3uE32MDqZ1MqlPWtPritJLcHbVne6QEFH
 OJKjRmCT8FpkS/Xsl/0nelalvKed4hnJUnTsKOla2KMsB24NSp4NwI/5VwUzf0P415l3
 CJFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2MZg9rwwzJqNY4vBuoQ7E1AsQz9WoyH5LlwbJiuxBCA=;
 b=kbl4iTJTVtFl8HPl7TUJAngo1oWrUCI8Qb71NvzrkozRpVgi5nNL0fJDfU2iCMJ9RH
 GspfBYOmK7ahJaENXydJOc2bVSdit+dTVXXzdHW/12qqZRonVqmQGoiHajaM4lhFHA1g
 5xQgcgzSYGwgQ/oiBfmHXQBZtFsVqjm4/IZiwfkUNziC1/pHSeAQ1hUbYphGumu816KI
 St3Cev4Bjk8NMMfStRajnBHUWbcBl2JOAgAkfvUs4jfPpGM5yKwVh2vRuusD25Ifoa4A
 1zyShh4S4zJp9HnrqKtM9u5z8miuUonTdSuBs6l6I7BG5w3OQ2gUkfXvxr0F+elwAzNJ
 MYgg==
X-Gm-Message-State: AOAM533iB342b4z7Gk/H8PL6rc4wpsIm0D77egZSrQ45eKFIuLWROyXe
 yDdZ96cFchhU50y8BzbpCsN+AlaAjMBHq2TBrYaItOHX6xQ=
X-Google-Smtp-Source: ABdhPJybUrOkWFfz6JTScpYJBX13PXWNRCXb4DuLoJbsXpOPsu/iXirTFLgX/q5/PYgZlUCvu0CO25d+JkmxNRxDPAs=
X-Received: by 2002:a05:651c:2c8:: with SMTP id
 f8mr116621ljo.262.1606952485795; 
 Wed, 02 Dec 2020 15:41:25 -0800 (PST)
MIME-Version: 1.0
References: <6ab5fbf4-5c78-8edc-14f0-f280a330d23d@rosalinux.ru>
 <371efcfc-581b-2dcf-c2d7-ca7801fdb273@rosalinux.ru>
In-Reply-To: <371efcfc-581b-2dcf-c2d7-ca7801fdb273@rosalinux.ru>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 3 Dec 2020 08:41:14 +0900
Message-ID: <CACOAw_yTGNWS0Jnxs5btSGPqWdYK-J0n394=-MAH6UbcNXWYDw@mail.gmail.com>
To: Mikhail Novosyolov <m.novosyolov@rosalinux.ru>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kkbkh-00GkeJ-KF
Subject: Re: [f2fs-dev] Using secure erase in f2fs
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgTWlraGFpbCwKCkFzIHlvdSBub3RpY2VkLCBmMmZzIGFscmVhZHkgc2VuZHMgZGlzY2FyZCBj
b21tYW5kcyBvbiByZWxlYXNlZCBibG9ja3MuCkRvIHlvdSB3YW50IHRvIGZpbGwgdGhlIGJsb2Nr
cyB3aXRoIHplcm8gZGF0YSwgaW5zdGVhZCBvZiBzZW5kaW5nCmRpc2NhcmQgY29tbWFuZHM/Cgoy
MDIw64WEIDEy7JuUIDPsnbwgKOuqqSkg7Jik7KCEIDQ6MjQsIE1pa2hhaWwgTm92b3N5b2xvdiB2
aWEgTGludXgtZjJmcy1kZXZlbAo8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQ+64uY7J20IOyekeyEsToKPgo+IDAyLjEyLjIwMjAgMjE6MjQsIE1pa2hhaWwgTm92b3N5b2xv
diDQv9C40YjQtdGCOgo+ID4gSGVsbG8sIGYyZnMgZGV2ZWxvcGVycyEKPiA+Cj4gPiBJIHNhdyBj
b21taXQgOWFmODQ2NDg2ZDc4MWE2MyAiZjJmczogYWRkIEYyRlNfSU9DX1NFQ19UUklNX0ZJTEUg
aW9jdGwiIGluIExpbnV4IGtlcm5lbAo+ID4gaHR0cHM6Ly9naXRodWIuY29tL3RvcnZhbGRzL2xp
bnV4L2NvbW1pdC85YWY4NDY0ODZkNzgxYTYzZGUwMjVhNWY1MDJjNTE1MjY4ZTQ4NzkwIwo+ID4K
PiA+IEkgc2F3IHVzYWdlIG9mIGl0IGluIEFuZHJvaWQgb25seQo+ID4gaHR0cHM6Ly9hbmRyb2lk
Lmdvb2dsZXNvdXJjZS5jb20vcGxhdGZvcm0vc3lzdGVtL3ZvbGQvKy9tYXN0ZXIvc2VjZGlzY2Fy
ZC5jcHAKPiA+Cj4gPiBEbyBJIHVuZGVyc3RhbmQgY29ycmVjdGx5IHRoYXQgdXNlcnNwYWNlIGNv
ZGUgZGVjaWRlcyBoaW1zZWxmIHdoZXJlIHRoZSByZWdpb24gdG8gZXJhc2Ugc3RhcnRzIGFuZCB3
aGVuIHRvIGNhbGwgdGhhdCBpb2N0bD8KPiA+Cj4gPiBJIGFtIGludGVyZXN0ZWQgaW4gaXQgdG8g
aW1wbGVtZW50IHJlYWx0aW1lIHNlY3VyZSBlcmFzZSAtIG92ZXJ3cml0aW5nIGZpbGVzIHdpdGgg
emVyb3Mgb3IgcmFuZG9tIGRhdGEgKEkgYW0gbm90IGludGVyZXN0aWVkIGluIHNlbmRpbmcgYSBk
aXNjYXJkL3RyaW0gY29tbWFuZCkgLSB3aGVuIGZpbGVzIGFyZSBkZWxldGVkIG9yIGFyZSByZW1v
dmVkIGNvbXBsZXRlbHkuCj4gPiBUaGlzIGNvZGUgc2VlbXMgdG8gYmUgYSBnb29kIHNvbHV0aW9u
IG9mIHRoaXMgcHJvYmxlbSwgYnV0IHRoZSBwcm9ibGVtIGlzIHRoYXQga2VybmVsIGNhbm5vdCB0
cmlnZ2VyIGl0IGJ5IGl0c2VsZi4KPiBXaGF0IGlmIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM/Cj4K
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IGlu
ZGV4IDdkODU3ODQwMTI2Ny4uMWU3MmFjMjdiZmRmIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBAQCAtMTE2Niw2ICsxMTY2LDEwIEBA
IHN0YXRpYyBpbnQgX19zdWJtaXRfZGlzY2FyZF9jbWQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LAo+ICAgICAgICAgICAgICAgICAgICAgIFNFQ1RPUl9GUk9NX0JMT0NLKHN0YXJ0KSwKPiAgICAg
ICAgICAgICAgICAgICAgICBTRUNUT1JfRlJPTV9CTE9DSyhsZW4pLAo+ICAgICAgICAgICAgICAg
ICAgICAgIEdGUF9OT0ZTLCAwLCAmYmlvKTsKPiArICAgICAgICBfX2Jsa2Rldl9pc3N1ZV93cml0
ZV96ZXJvZXMoYmRldiwKPiArICAgICAgICAgICAgICAgICAgICBTRUNUT1JfRlJPTV9CTE9DSyhz
dGFydCksCj4gKyAgICAgICAgICAgICAgICAgICAgU0VDVE9SX0ZST01fQkxPQ0sobGVuKSwKPiAr
ICAgICAgICAgICAgICAgICAgICBHRlBfTk9GUywgMCwgJmJpbyk7Cj4gIHN1Ym1pdDoKPiAgICAg
ICAgICBpZiAoZXJyKSB7Cj4gICAgICAgICAgICAgIHNwaW5fbG9ja19pcnFzYXZlKCZkYy0+bG9j
aywgZmxhZ3MpOwo+Cj4gYWZ0ZXIgb2YgYmVmb3JlIF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQoKT8K
Pgo+IElzIGl0IHNhZmUgdG8gZmlsbCB0aGUgcmVnaW9uIHdoaWNoIGlzIGJlaW5nIGRpc2NhcmRl
ZCB3aXRoIHplcm9lcz8KPgo+IFdpbGwgaXQgd29yayBhbmQgd2lsbCBpdCBmaXQgd2l0aCBiYWNr
Z3JvdW5kIGhvdXNla2VlcGluZyBhbmQgZGlzY2FyZCBxdWV1ZT8KPgo+ID4KPiA+IEkgdGhpbmsg
aXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGNhbGwgdGhpcyBmcm9tIGFub3RoZXIgcGFydCBvZiBm
MmZzIHdoZW4gYSBmaWxlIGlzIGJlaW5nIGVkaXRlZCBvciB1bmxpbmtlZCwgYnV0IEkgYW0gbm90
IHN1cmUgZnJvbSB3aGVyZSBleGFjdGx5Lgo+ID4KPiA+IEYyRlMgaGFzIGJhY2tncm91bmQgaG91
c2VrZWVwaW5nLCBpdCB3b3VsZCBiZSBuaWNlIGlmIGl0IGNvdWxkIGlzc3VlIHNlY3VyZSB0cmlt
IGluIHRoZSBiYWNrZ3JvdW5kLgo+ID4KPiA+IEFsc28sIEkgYW0gbm90IHN1cmUgdGhhdCBpdCB3
aWxsIHdvcmsgd2l0aCBzeW1saW5rcyBjb3JyZWN0bHksIGZvciBleGFtcGxlLgo+ID4KPiA+IFBs
ZWFzZSBnaXZlIGEgZGlyZWN0aW9uLgo+ID4KPgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
