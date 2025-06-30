Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AE0EAEEAA9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 00:57:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JvSQK7JSFHfITt9KSC7wyBdSn3p01czNw0olvzIevQ=; b=h08zg7tjW11SyXAL9bGWxYEqEc
	LtpHod+vZRGL4doKrTyK8b61UvEKpic1WJLsSHGl3Ul2t0EAKyz5Qow8eYVrcMtb8GjxszH2ngi2X
	BXsxBN7pjwEY/R2Q4TcWXKSUGz4DGAX9ynRj1YivrM2sLnr/YOdeSSmbQkh0Q0zIdk3k=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWNQi-0007H4-Sy;
	Mon, 30 Jun 2025 22:56:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chullee@google.com>) id 1uWNQh-0007Gx-BQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 22:56:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M7R5ktcV401kDH/d+qwKCQlLBLAeHgEGNUeVhuIZukw=; b=XhTfk8zdJhUoqYYT2GCJ1d96h0
 TGpH7pOTIGCKWlj/E5ncPp/UZSG0sU02qGQv+rN/9q6uRAKYYZompH+EJXiBVJC4EAj7Ejp8eUBt8
 mlkvnjvEjSfSQlnnOkFNEnt1h7r3sDurZoMKT6B+9VYEsMNwYyFbkOgn+MNnC1GpS+2E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M7R5ktcV401kDH/d+qwKCQlLBLAeHgEGNUeVhuIZukw=; b=Fs3RCRPqeFNCo61TMDENTwzoJr
 y3vzSXLoON07Fn8JRTGzxWIGceOVXrttxL3lt7wGhF4GoImp0V1XzaygbZK0/QQaDqBdMnNRfYdz+
 w9+eCWx9EzAZb963+4Hq7sVaDPuhyJB96HuFY6E/fXbaRwQQ97E6Po0FIo7Tdj2ZdIoE=;
Received: from mail-ed1-f42.google.com ([209.85.208.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uWNQg-0000tt-Rm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 22:56:51 +0000
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-5f438523d6fso2001a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 30 Jun 2025 15:56:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1751324199; x=1751928999;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M7R5ktcV401kDH/d+qwKCQlLBLAeHgEGNUeVhuIZukw=;
 b=wzwZbpZuWbGaoaDZ9oAkwHqCHIoTseMBEaWrrMwZuhSkJ+OYDugi5+JK2X02mJV2Ip
 wwxvPdRYU6qy7mfJluGVdAH9JR7ZbKP/itepR1ADhHGmO0vQSnhgyIeAkj4S7+IQqXT8
 /IrbISjFiy/8OlKfODqN2Kf1esWIZ4yrcjeXWqlFmWtDUpsbTbDsjEvRqwBxfeltgiP/
 qxdwugvBNUk/LJdeR6Q+Qmr4w0DRPAxzIXa81cm7If6rYapcg1BlOOJUz4P0a7p8c94c
 NWtiseGqyCnjO7N0syvAaEQmH4AUK0+6BaTF+d/LnsGP3pbCwosS7bXCLzEoXFHQ3P+k
 UFdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751324199; x=1751928999;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7R5ktcV401kDH/d+qwKCQlLBLAeHgEGNUeVhuIZukw=;
 b=w1xCpWYSeIxU2aRS3LbKu9Y/ybEcZxfpIyW/bEHaSJZYwnveRGqa8y4zF0tRJfNQGd
 0uYrrfMyWMqJsOhMvgZvjNl4wc5xxX+N2LBIWtCwDJswbrDGeK33PPPdTuJjW0m6PiiO
 h/HiC1D+bDYOUAc1Uzs5Z24sG+wYMxwi+nyBDTboJ1CYpYQnn7RL+HEd78bYB9xyJI3b
 fXsQQugF8VYM7wVMFH22K6ikUMx5Pf28OAGRzab8x9dPGcsjVdYPBJCInG9vvivu5CkR
 x8zauoCyb8akKL3CPsNmJAx20f5N8/EvPYMZD260JEP7/sJMXFJN2N1vMmMMW8psWCN6
 1WCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0lk3Htci0zh2fjfcHp6QKTbqLX36Y05MG8T8ynLWaVQMCOG1/f6oHFX+dk3+zuATzvpKQoLimPsU6iT13033z@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwFtuKqQ1uplWh5fxXS4nBhNmdBynYhuhdWpYyba4q6jklY7Kwi
 +TLGSBPI/oIJ8amR1kzzMgHKadFCm+jSs2zN2Dr1gPUsMPjVe53RNpC7ZHwBwuH/hmjMtaaU5j+
 hM+gEXNFAvIRKCboD4z9Ly79LEpN/ToBRaEozcuCr
X-Gm-Gg: ASbGncur0LgNTJYYe318t1w0FPKZSD9nbQ5gBRZ319YHN4mfE5Uuc3ACt2Yj8lu9PWN
 e8guVTDwby/r+D8QWPJGKlR7MYY7nHgFyGnJ5zrExGhLy1PjoIIYBFULSO15MPDP1Ga/rPiVcec
 tI2g4OkGFCqxyrk601HI2FySdAuYZ4EGIcwHkRNUKkH0SGZ4uoEPS6LSR/9nBSIW/LKRZygXWsa
 g==
X-Google-Smtp-Source: AGHT+IHN4Q5qVv7STN2zkQigTwd6ckNtyug0GjwCzMak6D3eFupekwm7Mzvsg61LwR7bzp8dNQGph0F51sdiQBVIGzM=
X-Received: by 2002:aa7:d887:0:b0:60b:9d04:2cec with SMTP id
 4fb4d7f45d1cf-60e38a923f8mr2580a12.5.1751324199107; Mon, 30 Jun 2025 15:56:39
 -0700 (PDT)
MIME-Version: 1.0
References: <20250615144235.1836469-1-chullee@google.com>
 <20250615144235.1836469-3-chullee@google.com>
 <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
In-Reply-To: <c8389c1a-16d2-4de4-bc3f-7a5e4ccdbc34@kernel.org>
Date: Mon, 30 Jun 2025 15:56:28 -0700
X-Gm-Features: Ac12FXxzXkzy0qePDKtuBAjgWeWGzgYc_s5Wj4IDCSbA2BAhcYaaMIv-ITP6RRU
Message-ID: <CALBjLoB6+FgWJMqKPN1o1bpeYWB-d-7BWtGbYPo18fcFWZqEkw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -7.8 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 16, 2025 at 5:50 AM Chao Yu <chao@kernel.org>
 wrote: > > On 6/15/25 22:42, Daniel Lee wrote: > > Apply the `ioprio_hint`
 to set `F2FS_IOPRIO_WRITE` priority > > on files identified as "hot [...]
 Content analysis details:   (-7.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.42 listed in wl.mailspike.net]
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uWNQg-0000tt-Rm
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: use ioprio hint for hot and
 pinned files
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
From: Daniel Lee via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Lee <chullee@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBKdW4gMTYsIDIwMjUgYXQgNTo1MOKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiA2LzE1LzI1IDIyOjQyLCBEYW5pZWwgTGVlIHdyb3RlOgo+ID4gQXBw
bHkgdGhlIGBpb3ByaW9faGludGAgdG8gc2V0IGBGMkZTX0lPUFJJT19XUklURWAgcHJpb3JpdHkK
PiA+IG9uIGZpbGVzIGlkZW50aWZpZWQgYXMgImhvdCIgYXQgY3JlYXRpb24gYW5kIG9uIGZpbGVz
IHRoYXQgYXJlCj4gPiBwaW5uZWQgdmlhIGlvY3RsLgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IERh
bmllbCBMZWUgPGNodWxsZWVAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4gIGZzL2YyZnMvZjJmcy5o
ICB8IDE5ICsrKysrKysrKysrKysrKysrKysKPiA+ICBmcy9mMmZzL2ZpbGUuYyAgfCAgMyArKysK
PiA+ICBmcy9mMmZzL25hbWVpLmMgfCAxMSArKysrKysrLS0tLQo+ID4gIDMgZmlsZXMgY2hhbmdl
ZCwgMjkgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9mMmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4gaW5kZXggM2UwMjY4N2MxYjU4Li4w
YzRmNTI4OTJmZjcgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gKysrIGIvZnMv
ZjJmcy9mMmZzLmgKPiA+IEBAIC0zNDQwLDYgKzM0NDAsMjUgQEAgc3RhdGljIGlubGluZSB2b2lk
IHNldF9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCB0eXBlKQo+ID4gICAgICAgZjJmc19t
YXJrX2lub2RlX2RpcnR5X3N5bmMoaW5vZGUsIHRydWUpOwo+ID4gIH0KPiA+Cj4gPiArc3RhdGlj
IGlubGluZSBpbnQgZ2V0X2lvcHJpbyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gK3sKPiA+ICsg
ICAgIHJldHVybiBGMkZTX0koaW5vZGUpLT5pb3ByaW9faGludDsKPiA+ICt9Cj4gPiArCj4gPiAr
c3RhdGljIGlubGluZSB2b2lkIHNldF9pb3ByaW8oc3RydWN0IGlub2RlICppbm9kZSwgaW50IGxl
dmVsKQo+ID4gK3sKPiA+ICsgICAgIGlmIChnZXRfaW9wcmlvKGlub2RlKSA9PSBsZXZlbCkKPiA+
ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgRjJGU19JKGlub2RlKS0+aW9wcmlvX2hp
bnQgPSBsZXZlbDsKPiA+ICt9Cj4gPiArCj4gPiArc3RhdGljIGlubGluZSB2b2lkIGNsZWFyX2lv
cHJpbyhzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gK3sKPiA+ICsgICAgIGlmIChnZXRfaW9wcmlv
KGlub2RlKSA9PSAwKQo+ID4gKyAgICAgICAgICAgICByZXR1cm47Cj4gPiArICAgICBGMkZTX0ko
aW5vZGUpLT5pb3ByaW9faGludCA9IDA7Cj4gPiArfQo+ID4gKwo+ID4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBjbGVhcl9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGludCB0eXBlKQo+ID4gIHsKPiA+
ICAgICAgIGlmICghaXNfZmlsZShpbm9kZSwgdHlwZSkpCj4gPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4gaW5kZXggM2ViNDBkN2JmNjAyLi5hMThmYjdm
M2QwMTkgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gKysrIGIvZnMvZjJmcy9m
aWxlLmMKPiA+IEBAIC0zNDk2LDYgKzM0OTYsNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NldF9w
aW5fZmlsZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4gPgo+ID4gICAg
ICAgaWYgKCFwaW4pIHsKPiA+ICAgICAgICAgICAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwg
RklfUElOX0ZJTEUpOwo+ID4gKyAgICAgICAgICAgICBjbGVhcl9pb3ByaW8oaW5vZGUpOwo+Cj4g
SSBndWVzcyB0aGVyZSBhcmUgbW9yZSBwbGFjZXMgY2xlYXJpbmcgRklfUElOX0ZJTEU/IHdlIG5l
ZWQgdG8gY292ZXIKPiB0aGVtIGFsbD8KClllcywgeW91J3JlIHJpZ2h0LiBGSV9QSU5fRklMRSBp
cyB0b2dnbGVkIGluIHNldmVyYWwgcGxhY2VzLiBIb3dldmVyLAp0aGlzIGNoYW5nZSBpcyBpbnRl
bmRlZCB0byBzZXQgdGhlIEhPVCBhbmQgSU9QUklPIG9uIHRoZSBmaWxlcyB0aGF0CnVzZXJzIGV4
cGxpY2l0bHkgcGluIHRocm91Z2ggSU9DVEwuIFRoZSBvdGhlciBrZXJuZWwgaW50ZXJuYWwKbWVj
aGFuaXNtcyAoZS5nLiwgc3dhcCBvciBnY19mYWlsdXJlcykgcmVtYWluIHRoZSBzYW1lLiBBcmUg
dGhlcmUgYW55CnBvdGVudGlhbCBpc3N1ZXMgdGhhdCBJIHNob3VsZCBjb25zaWRlcj8KCiA+Cj4g
PiAgICAgICAgICAgICAgIGYyZnNfaV9nY19mYWlsdXJlc193cml0ZShpbm9kZSwgMCk7Cj4gPiAg
ICAgICAgICAgICAgIGdvdG8gZG9uZTsKPiA+ICAgICAgIH0gZWxzZSBpZiAoZjJmc19pc19waW5u
ZWRfZmlsZShpbm9kZSkpIHsKPiA+IEBAIC0zNTI5LDYgKzM1MzAsOCBAQCBzdGF0aWMgaW50IGYy
ZnNfaW9jX3NldF9waW5fZmlsZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcp
Cj4gPiAgICAgICB9Cj4gPgo+ID4gICAgICAgc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX1BJTl9G
SUxFKTsKPiA+ICsgICAgIGZpbGVfc2V0X2hvdChpbm9kZSk7Cj4KPiBVbm5lY2Vzc2FyeSBmaWxl
X3NldF9ob3QoKSBpbnZva2luZz8gT3IgYW0gSSBtaXNzaW5nIGFueXRoaW5nPwo+Cj4gVGhhbmtz
LAoKU2V0dGluZyBIT1QgYW5kIElPUFJJTyBieSBkZWZhdWx0IGlzIGFsc28gaW50ZW50aW9uYWwu
IFdlIHNldCBib3RoCmZsYWdzIGJ5IGRlZmF1bHQgYmVjYXVzZSB0aGUgbWFpbiB1c2UgY2FzZSBm
b3IgcGlubmVkIGZpbGVzIGludm9sdmVzCmZyZXF1ZW50bHkgdXBkYXRlZCBvciBzaG9ydC1saXZl
ZCBkYXRhIHRoYXQgbmVlZHMgZmFzdCB3cml0ZSBzcGVlZHMuCgo+Cj4gPiArICAgICBzZXRfaW9w
cmlvKGlub2RlLCBGMkZTX0lPUFJJT19XUklURSk7Cj4gPiAgICAgICByZXQgPSBGMkZTX0koaW5v
ZGUpLT5pX2djX2ZhaWx1cmVzOwo+ID4gIGRvbmU6Cj4gPiAgICAgICBmMmZzX3VwZGF0ZV90aW1l
KHNiaSwgUkVRX1RJTUUpOwo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbmFtZWkuYyBiL2ZzL2Yy
ZnMvbmFtZWkuYwo+ID4gaW5kZXggMDdlMzMzZWUyMWI3Li4wZjk2YTBiODZjNDAgMTAwNjQ0Cj4g
PiAtLS0gYS9mcy9mMmZzL25hbWVpLmMKPiA+ICsrKyBiL2ZzL2YyZnMvbmFtZWkuYwo+ID4gQEAg
LTE5MSw5ICsxOTEsMTAgQEAgc3RhdGljIHZvaWQgc2V0X2NvbXByZXNzX25ld19pbm9kZShzdHJ1
Y3QgZjJmc19zYl9pbmZvICpzYmksIHN0cnVjdCBpbm9kZSAqZGlyLAo+ID4gIH0KPiA+Cj4gPiAg
LyoKPiA+IC0gKiBTZXQgZmlsZSdzIHRlbXBlcmF0dXJlIGZvciBob3QvY29sZCBkYXRhIHNlcGFy
YXRpb24KPiA+ICsgKiBTZXQgZmlsZSdzIHRlbXBlcmF0dXJlIChmb3IgaG90L2NvbGQgZGF0YSBz
ZXBhcmF0aW9uKSBhbmQKPiA+ICsgKiBJL08gcHJpb3JpdHksIGJhc2VkIG9uIGZpbGVuYW1lIGV4
dGVuc2lvbgo+ID4gICAqLwo+ID4gLXN0YXRpYyB2b2lkIHNldF9maWxlX3RlbXBlcmF0dXJlKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGlub2RlICppbm9kZSwKPiA+ICtzdGF0aWMg
dm9pZCBzZXRfZmlsZV90ZW1wX3ByaW8oc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3Qg
aW5vZGUgKmlub2RlLAo+ID4gICAgICAgICAgICAgICBjb25zdCB1bnNpZ25lZCBjaGFyICpuYW1l
KQo+ID4gIHsKPiA+ICAgICAgIF9fdTggKCpleHRsaXN0KVtGMkZTX0VYVEVOU0lPTl9MRU5dID0g
c2JpLT5yYXdfc3VwZXItPmV4dGVuc2lvbl9saXN0Owo+ID4gQEAgLTIxMiw4ICsyMTMsMTAgQEAg
c3RhdGljIHZvaWQgc2V0X2ZpbGVfdGVtcGVyYXR1cmUoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2Jp
LCBzdHJ1Y3QgaW5vZGUgKmlub2RlLAo+ID4KPiA+ICAgICAgIGlmIChpIDwgY29sZF9jb3VudCkK
PiA+ICAgICAgICAgICAgICAgZmlsZV9zZXRfY29sZChpbm9kZSk7Cj4gPiAtICAgICBlbHNlCj4g
PiArICAgICBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgZmlsZV9zZXRfaG90KGlub2RlKTsKPiA+
ICsgICAgICAgICAgICAgc2V0X2lvcHJpbyhpbm9kZSwgRjJGU19JT1BSSU9fV1JJVEUpOwo+ID4g
KyAgICAgfQo+ID4gIH0KPiA+Cj4gPiAgc3RhdGljIHN0cnVjdCBpbm9kZSAqZjJmc19uZXdfaW5v
ZGUoc3RydWN0IG1udF9pZG1hcCAqaWRtYXAsCj4gPiBAQCAtMzE3LDcgKzMyMCw3IEBAIHN0YXRp
YyBzdHJ1Y3QgaW5vZGUgKmYyZnNfbmV3X2lub2RlKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLAo+
ID4gICAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklfSU5MSU5FX0RBVEEpOwo+
ID4KPiA+ICAgICAgIGlmIChuYW1lICYmICF0ZXN0X29wdChzYmksIERJU0FCTEVfRVhUX0lERU5U
SUZZKSkKPiA+IC0gICAgICAgICAgICAgc2V0X2ZpbGVfdGVtcGVyYXR1cmUoc2JpLCBpbm9kZSwg
bmFtZSk7Cj4gPiArICAgICAgICAgICAgIHNldF9maWxlX3RlbXBfcHJpbyhzYmksIGlub2RlLCBu
YW1lKTsKPiA+Cj4gPiAgICAgICBzdGF0X2luY19pbmxpbmVfeGF0dHIoaW5vZGUpOwo+ID4gICAg
ICAgc3RhdF9pbmNfaW5saW5lX2lub2RlKGlub2RlKTsKPgoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0
CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291
cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
