Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DF7614705
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Nov 2022 10:42:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opnn0-0002KR-Ol;
	Tue, 01 Nov 2022 09:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <fengnanchang@gmail.com>) id 1opnmY-0002HA-0c
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 09:42:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GY87cDFLhEAAwP64KhRZRpuX4njjnL49z1EVx0MS7wE=; b=eeWJvlC1aIYOpoF1XzPsIeAy3h
 /yRFwzVVWO1I8Cpnh4SNY+of1MSC63NQogHcEvVxWvDHNrnwf05r50SJuMB8i1uY5lZv/elcdklZq
 thkICPq41sCLMwjrJuTsBjkcQhl2vJv7ssKOhvDALD7NswSZl8pENq3sAsbpEJ+6u1wk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GY87cDFLhEAAwP64KhRZRpuX4njjnL49z1EVx0MS7wE=; b=K9qyWD2Mdb4qyz4zaacMPTKyFE
 fsX4/NA55PP9ooOqnnjpsBz8zHfMgbRRd3jgizaxKiEhAV9dwgJ9vIB00AP0FERDEyUhMeqxA/cKh
 ngwhxYn1WzjlnVe6q5MwmJYxnl1lsf8xyXLodVjUWgi04LoGlD640EnQF77WfCar4d5o=;
Received: from mail-ot1-f50.google.com ([209.85.210.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1opnmW-007o0T-A9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 09:42:05 +0000
Received: by mail-ot1-f50.google.com with SMTP id
 a13-20020a9d6e8d000000b00668d65fc44fso8170409otr.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Nov 2022 02:42:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GY87cDFLhEAAwP64KhRZRpuX4njjnL49z1EVx0MS7wE=;
 b=DKkL7LsIAHmGO2bOutNkfIq2MvJuxySI4lzZAJJRwLoGb96auP1Av/4C65uAfhkqsp
 FICcWUoYVRUgxnOE7R9R9pL10GWa3Gv9T6sZ7DYNj3Bmt1hsWGjK43ojgmkFSqhyqfhk
 +XwpA4j0ZqBxT17LfmO9gAHqpGAIZirlZIRdggW7+UOk3C0x9i06Yw11e4u4NtnTpE+b
 nW8QXa+Td7/AiRIOyZOYpIq+qNfLOsUjGqn0dwJYbmWvR0oIZUVFRG0mCUzo3syq4C5K
 clGGnRu22gSLNk8DXUD5Uv8zun4BB6GkAB9KPDZwLzvk35KI7ZTEhnSKCwoPbF6O3oGq
 altQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GY87cDFLhEAAwP64KhRZRpuX4njjnL49z1EVx0MS7wE=;
 b=cIBNG5XUpkbOy0AfKIOH/nx6X7VEyvSbVMlvKKOpH4bkc8A5u+v+oLD0GWWZn+njnl
 oVszYFkagfn5DNQRgsdH4UmD8wUVsVr0w06L24E26++sGYy6kMxcdQ2larOm5nMqXwga
 zgzCLYXkOzT7/K6VuNPPkhBq7TLbnmKXqvNb/8IsvLDf/bmIMT2desQmLJERIb5z95xg
 XB/Kbr4I+D3qR55k94AsFsPxPj0QPnZzruaDwFjU//c6Pk22v8e17s2QetOWELAC6RLm
 LVf8nZWBjGx6BgqilrYrkqeYL/EWEz2G1LluaTKptiNvzD7QcIzWJWtY6++JG9XtCAXs
 3zWg==
X-Gm-Message-State: ACrzQf2hAU50bS4DUO1WrAGjCzH5WY2ZewPDpOlQFE5Ql4rPwyqBVo7L
 ikrG/tyJbCzTY1+5h94i5Cr2R4CUgsh/nsmldlAx1gw1t7MMcw==
X-Google-Smtp-Source: AMsMyM4kYDr9Zry6VbGBK/kbLaMbKxYeXGaJDRlBseGyZkLVjBVA3mUnQ8Mhvg9TeNVBXs94ethQIuE3FtsgO3ijOXI=
X-Received: by 2002:a05:6830:1406:b0:661:e00e:8a23 with SMTP id
 v6-20020a056830140600b00661e00e8a23mr8868435otp.31.1667295718666; Tue, 01 Nov
 2022 02:41:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220608134852.476876-1-fengnanchang@gmail.com>
 <96CE38DF-C3E7-4284-8C36-6F51D355343E@gmail.com>
In-Reply-To: <96CE38DF-C3E7-4284-8C36-6F51D355343E@gmail.com>
From: fengnan chang <fengnanchang@gmail.com>
Date: Tue, 1 Nov 2022 17:41:47 +0800
Message-ID: <CALWNXx9F+pZa9b7Bui=A9L66pO=64H6kwzNUtSfJsbLsvPBLMQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  friendly ping... fengnan chang 于2022年10月14日周五
   16:46写道： > > ping, it seems this had been forgotten. > > > 2022年6月8日
    21:48，Fengnan Chang 写道： > > > > When decompressed failed, f2fs_pre
    [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [fengnanchang[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.50 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1opnmW-007o0T-A9
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix hungtask when decompressed fail
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

ZnJpZW5kbHkgcGluZy4uLgoKZmVuZ25hbiBjaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4g
5LqOMjAyMuW5tDEw5pyIMTTml6XlkajkupQgMTY6NDblhpnpgZPvvJoKPgo+IHBpbmcsICBpdCBz
ZWVtcyB0aGlzIGhhZCBiZWVuIGZvcmdvdHRlbi4KPgo+ID4gMjAyMuW5tDbmnIg45pelIDIxOjQ4
77yMRmVuZ25hbiBDaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4g5YaZ6YGT77yaCj4gPgo+
ID4gV2hlbiBkZWNvbXByZXNzZWQgZmFpbGVkLCBmMmZzX3ByZXBhcmVfY29tcHJlc3Nfb3Zlcndy
aXRlIHdpbGwgZW50ZXIKPiA+IGVuZGxlc3MgbG9vcCwgbWF5IGNhc3VlIGh1bmd0YXNrLgo+ID4K
PiA+IFsgICAxNC4wODg2NjVdIEYyRlMtZnMgKG52bWUwbjEpOiBsejQgZGVjb21wcmVzcyBmYWls
ZWQsIHJldDotNDE1NQo+ID4gWyAgIDE0LjA4OTg1MV0gRjJGUy1mcyAobnZtZTBuMSk6IGx6NCBk
ZWNvbXByZXNzIGZhaWxlZCwgcmV0Oi00MTU1Cj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogRmVuZ25h
biBDaGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gZnMvZjJmcy9jb21w
cmVzcy5jIHwgMjEgKysrKysrKysrKysrKysrKy0tLS0tCj4gPiAxIGZpbGUgY2hhbmdlZCwgMTYg
aW5zZXJ0aW9ucygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9jb21wcmVzcy5jIGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gPiBpbmRleCAyNDgyNGNkOTZmMzYu
LjE3NjRlMzg1OTI2MiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4gKysr
IGIvZnMvZjJmcy9jb21wcmVzcy5jCj4gPiBAQCAtMTA2MCw3ICsxMDYwLDcgQEAgc3RhdGljIGlu
dCBwcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZShzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywKPiA+
ICAgICAgIHNlY3Rvcl90IGxhc3RfYmxvY2tfaW5fYmlvOwo+ID4gICAgICAgdW5zaWduZWQgZmdw
X2ZsYWcgPSBGR1BfTE9DSyB8IEZHUF9XUklURSB8IEZHUF9DUkVBVDsKPiA+ICAgICAgIHBnb2Zm
X3Qgc3RhcnRfaWR4ID0gc3RhcnRfaWR4X29mX2NsdXN0ZXIoY2MpOwo+ID4gLSAgICAgaW50IGks
IHJldDsKPiA+ICsgICAgIGludCBpLCByZXQsIHJldHJ5X2NvdW50ID0gMzsKPiA+Cj4gPiByZXRy
eToKPiA+ICAgICAgIHJldCA9IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKGNjLT5pbm9kZSwg
c3RhcnRfaWR4KTsKPiA+IEBAIC0xMTIwLDcgKzExMjAsMTIgQEAgc3RhdGljIGludCBwcmVwYXJl
X2NvbXByZXNzX292ZXJ3cml0ZShzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywKPiA+ICAgICAgICAg
ICAgICAgICAgICAgICBmMmZzX3B1dF9ycGFnZXMoY2MpOwo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGYyZnNfdW5sb2NrX3JwYWdlcyhjYywgaSArIDEpOwo+ID4gICAgICAgICAgICAgICAgICAg
ICAgIGYyZnNfZGVzdHJveV9jb21wcmVzc19jdHgoY2MsIHRydWUpOwo+ID4gLSAgICAgICAgICAg
ICAgICAgICAgIGdvdG8gcmV0cnk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgcmV0cnlfY291
bnQtLTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoUGFnZUVycm9yKHBhZ2UpICYmICFy
ZXRyeV9jb3VudCkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0gLUVJ
TzsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIH0gZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z290byByZXRyeTsKPiA+ICAgICAgICAgICAgICAgfQo+ID4gICAgICAgfQo+ID4KPiA+IEBAIC0x
NjU3LDEwICsxNjYyLDE2IEBAIHN0YXRpYyB2b2lkIF9fZjJmc19kZWNvbXByZXNzX2VuZF9pbyhz
dHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywgYm9vbCBmYWlsZWQpCj4gPiAgICAgICAgICAg
ICAgIGlmICghcnBhZ2UpCj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gPgo+
ID4gLSAgICAgICAgICAgICAvKiBQR19lcnJvciB3YXMgc2V0IGlmIHZlcml0eSBmYWlsZWQuICov
Cj4gPiAtICAgICAgICAgICAgIGlmIChmYWlsZWQgfHwgUGFnZUVycm9yKHJwYWdlKSkgewo+ID4g
KyAgICAgICAgICAgICBpZiAoZmFpbGVkKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgLyog
ZGVjb21wcmVzcyBwYWdlIGZhaWxlZCAqLwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIENsZWFy
UGFnZVVwdG9kYXRlKHJwYWdlKTsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBTZXRQYWdlRXJy
b3IocnBhZ2UpOwo+ID4gKyAgICAgICAgICAgICB9IGVsc2UgaWYgKFBhZ2VFcnJvcihycGFnZSkp
IHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAvKgo+ID4gKyAgICAgICAgICAgICAgICAgICAg
ICAqIFBHX2Vycm9yIHdhcyBzZXQgaWYgdmVyaXR5IGZhaWxlZC4KPiA+ICsgICAgICAgICAgICAg
ICAgICAgICAgKiB3aWxsIHJlLXJlYWQgYWdhaW4gbGF0ZXIuCj4gPiArICAgICAgICAgICAgICAg
ICAgICAgICovCj4gPiAgICAgICAgICAgICAgICAgICAgICAgQ2xlYXJQYWdlVXB0b2RhdGUocnBh
Z2UpOwo+ID4gLSAgICAgICAgICAgICAgICAgICAgIC8qIHdpbGwgcmUtcmVhZCBhZ2FpbiBsYXRl
ciAqLwo+ID4gICAgICAgICAgICAgICAgICAgICAgIENsZWFyUGFnZUVycm9yKHJwYWdlKTsKPiA+
ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICBTZXRQYWdl
VXB0b2RhdGUocnBhZ2UpOwo+ID4gLS0KPiA+IDIuMjUuMQo+ID4KPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
