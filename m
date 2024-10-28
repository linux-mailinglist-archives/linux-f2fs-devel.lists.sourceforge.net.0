Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 444EA9B2CE8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Oct 2024 11:29:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5N06-00068r-79;
	Mon, 28 Oct 2024 10:29:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t5N04-00068W-VJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 10:29:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e66hzpUkXwh1+UAivXnQMAmUZZGDpRptxtP/9uQ4ZKk=; b=aJIYcH1J1OfeAE494Evxo/Yq4w
 D99avAjxVGCi4q90HdHh1cPd+Lz60UgmcSRz1UUpz6e0IuEQZbLzm59ETbSne42oMV/LMU29uDXYe
 hscXbPb2Fg0jM7evWAzsulSXodbaRdoXWhRRJdGa13Gi/zbGU1taAp5tYYh1cBrgqE9o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e66hzpUkXwh1+UAivXnQMAmUZZGDpRptxtP/9uQ4ZKk=; b=bSGWdcj05xeZ5t41V2iU75VNEg
 L0wXfboN5ke8u4MLFrEmutRWVtc1HmnbdAJZrE85LuAuj8fYanFc/dX28w5QmSjA3tk4/vi352aPL
 PRG2OC7wNZ3TVdqFTnjcFLMKK1RAKQfasXjcgKuMt+u1jpIuOEwRcKSgZ3wxIV5Iaeiw=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t5N04-0002Vj-UX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Oct 2024 10:29:29 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37d4fa7d3baso441048f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Oct 2024 03:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730111357; x=1730716157; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=e66hzpUkXwh1+UAivXnQMAmUZZGDpRptxtP/9uQ4ZKk=;
 b=TdG7lTO8gd9uxYYAmoKUdywTiRWNvmMq5OFwZAV1fyMbIc2am0eP39BAB+8PHR0m9l
 WGTOASD0UH4gdUr4G4ZGE1r8fXkIv6c/XP28NfUeLHPEuEjltZUQ/xAzUwNR0Zc6tOUS
 wk/vg1zEs0M6sna11KuRjd6ZM+C3+q5ThJBb0y6Pa5ugLmvad0geNJKBumhbYlez9/JG
 2cyi89gJAm1zw7udb/8iz6aDHpZLTAnOeHQQPUG04or2aWb2Fev5ohbPa3IHPHLf6989
 O7XtYLm3vvLAnAJ+GfBi+j6dSOivcv0DUoY3zG0lDaIKkSAHORyzQpxVT4mmWTlTcmI1
 apbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730111357; x=1730716157;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=e66hzpUkXwh1+UAivXnQMAmUZZGDpRptxtP/9uQ4ZKk=;
 b=wzQxvRD5OaZVym1dugDzeBG9JLP4Esmxvb1VHqfIH8KWfajgcrwZ3b2NqerK7KJcPH
 XcCpkxowMlKaHGGBLnQD3DLBh2Jv6j81oamnV1Gq9g2V+X1BCh2YR+41Ou63UdX1m3OA
 LXhWkdhLb6F6cEfcuRztFB+y9vJbbCS3aBHhuP3di1SBxfrhPISvmJlC4ocRBsKXiZso
 L4+yqAVTtyXgmMl4Zpt0lcNW8RD2+/mgZRaorRKRndReLBAubUF/XShIA/yUed44yTkY
 hYA/Mh6d1vbzHeFxfiLbKUA6lGlQcvi8PmtVvhT6wNmHO5t3PRvKxSESV/G4lyOuOdYa
 hSkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXhXsUzcg950to1Q+rRTrehGKG9zUK0yK7XwQSFBm7y9xm8ky9sAHYgZZLFNmfBqL/SlssMX40zAnm4o9dykpgi@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxsvatq5ZFZI7J90Zw+Owl3qYRLbGFYtwxfSHi4S2V9xqnEtkpO
 cL8qNdQXD2f/3SQlmLwRI/dat8+8F+vphvO5h0NtTM8YtXdUQ4clJs1MoEH+76UAbLGoE6l/ezI
 3iaIi7PEuVj6EM1KyUnsoMw9BoHSvEg==
X-Google-Smtp-Source: AGHT+IE1YBr0eKkaIlb+X8Y2dq45JaRERXIEnKMFMLPIGlhK2fYf1knJjHF6p2ekvt/howswXmhyYrH3666kcgnJWAs=
X-Received: by 2002:a5d:6c6d:0:b0:37d:47f6:6fda with SMTP id
 ffacd0b85a97d-3806117dde8mr2587347f8f.7.1730111357196; Mon, 28 Oct 2024
 03:29:17 -0700 (PDT)
MIME-Version: 1.0
References: <1729652883-12202-1-git-send-email-zhiguo.niu@unisoc.com>
 <7d68560a-19ea-455c-ba23-1dda32ed4d15@kernel.org>
In-Reply-To: <7d68560a-19ea-455c-ba23-1dda32ed4d15@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Mon, 28 Oct 2024 18:29:05 +0800
Message-ID: <CAHJ8P3LrnCYo_ETa7XPty_keAmPd_z8V9A2Bp6gDaxBMCxpPSA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年10月28日周一 17:34写道： > > On 2024/10/23
    11:08, Zhiguo Niu wrote: > > If gc_mode is set to GC_URGENT_LOW or GC_URGENT_MID,
    cost benefit GC > > approach should be used, but [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.42 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.42 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t5N04-0002Vj-UX
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to avoid use GC_AT when setting
 gc_mode as GC_URGENT_LOW or GC_URGENT_MID
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 jaegeuk@kernel.org, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTDmnIgyOOaXpeWRqOS4gCAxNzoz
NOWGmemBk++8mgo+Cj4gT24gMjAyNC8xMC8yMyAxMTowOCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+
IElmIGdjX21vZGUgaXMgc2V0IHRvIEdDX1VSR0VOVF9MT1cgb3IgR0NfVVJHRU5UX01JRCwgY29z
dCBiZW5lZml0IEdDCj4gPiBhcHByb2FjaCBzaG91bGQgYmUgdXNlZCwgYnV0IGlmIEFUR0MgaXMg
ZW5hYmxlZCBhdCB0aGUgc2FtZSB0aW1lLAo+ID4gQWdlLXRocmVzaG9sZCBhcHByb2FjaCB3aWxs
IGJlIHNlbGVjdGVkLCB3aGljaCBjYW4gb25seSBkbyBhbW91bnQgb2YKPiA+IEdDIGFuZCBpdCBp
cyBtdWNoIGxlc3MgdGhhbiB0aGUgbnVtYmVycyBvZiBDQiBhcHByb2FjaC4KPgo+IFRoZSBjb2Rl
IGxvb2tzIGZpbmUgdG8gbWUsIHRoZXJlIGlzIG9uZSBtb3JlIHRoaW5nLCBjYW4geW91IHBsZWFz
ZSB1cGRhdGUKPiBkZXNjcmlwdGlvbiBvZiBnY191cmdlbnQgaW4gc3lzZnMtZnMtZjJmcz8gc28g
aXQgY2FuIGRlc2NyaWJlIGV4cGxpY2l0bHkKPiB0aGF0IGNvbmZpZ3VyaW5nIGdjX3VyZ2VudCB0
byBsb3cgb3IgbWlkIHdpbGwgc2V0dXAgR0NfQ0IgR0MgcG9saWN5IHdoaWNoCj4gd2lsbCBvdmVy
cmlkZSBHQ19BVC4KRGVhciBDaGFvLApPSywgdGhhbmtzIGZvciB5b3Ugc3VnZ2VzdGlvbnMuCgo+
Cj4gVGhhbmtzLAo+Cj4gPgo+ID4gc29tZSB0cmFjZXM6Cj4gPiAgICBmMmZzX2djLTI1NDo0OC0z
OTYgICAgIFswMDddIC4uLi4uIDIzMTE2MDAuNjg0MDI4OiBmMmZzX2djX2JlZ2luOiBkZXYgPSAo
MjU0LDQ4KSwgZ2NfdHlwZSA9IEJhY2tncm91bmQgR0MsIG5vX2JhY2tncm91bmRfR0MgPSAwLCBu
cl9mcmVlX3NlY3MgPSAwLCBub2RlcyA9IDEwNTMsIGRlbnRzID0gMiwgaW1ldGEgPSAxOCwgZnJl
ZV9zZWM6NDQ4OTgsIGZyZWVfc2VnOjQ0ODk4LCByc3Zfc2VnOjIzOSwgcHJlZnJlZV9zZWc6MAo+
ID4gICAgZjJmc19nYy0yNTQ6NDgtMzk2ICAgICBbMDA3XSAuLi4uLiAyMzExNjAwLjY4NDUyNzog
ZjJmc19nZXRfdmljdGltOiBkZXYgPSAoMjU0LDQ4KSwgdHlwZSA9IE5vIFRZUEUsIHBvbGljeSA9
IChCYWNrZ3JvdW5kIEdDLCBMRlMtbW9kZSwgQWdlLXRocmVzaG9sZCksIHZpY3RpbSA9IDEwLCBj
b3N0ID0gNDI5NDM2NDk3NSwgb2ZzX3VuaXQgPSAxLCBwcmVfdmljdGltX3NlY25vID0gLTEsIHBy
ZWZyZWUgPSAwLCBmcmVlID0gNDQ4OTgKPiA+ICAgIGYyZnNfZ2MtMjU0OjQ4LTM5NiAgICAgWzAw
N10gLi4uLi4gMjMxMTYwMC43MTQ4MzU6IGYyZnNfZ2NfZW5kOiBkZXYgPSAoMjU0LDQ4KSwgcmV0
ID0gMCwgc2VnX2ZyZWVkID0gMCwgc2VjX2ZyZWVkID0gMCwgbm9kZXMgPSAxNTYyLCBkZW50cyA9
IDIsIGltZXRhID0gMTgsIGZyZWVfc2VjOjQ0ODk4LCBmcmVlX3NlZzo0NDg5OCwgcnN2X3NlZzoy
MzksIHByZWZyZWVfc2VnOjAKPiA+ICAgIGYyZnNfZ2MtMjU0OjQ4LTM5NiAgICAgWzAwN10gLi4u
Li4gMjMxMTYwMC43MTQ4NDM6IGYyZnNfYmFja2dyb3VuZF9nYzogZGV2ID0gKDI1NCw0OCksIHdh
aXRfbXMgPSA1MCwgcHJlZnJlZSA9IDAsIGZyZWUgPSA0NDg5OAo+ID4gICAgZjJmc19nYy0yNTQ6
NDgtMzk2ICAgICBbMDA3XSAuLi4uLiAyMzExNjAwLjc3MTc4NTogZjJmc19nY19iZWdpbjogZGV2
ID0gKDI1NCw0OCksIGdjX3R5cGUgPSBCYWNrZ3JvdW5kIEdDLCBub19iYWNrZ3JvdW5kX0dDID0g
MCwgbnJfZnJlZV9zZWNzID0gMCwgbm9kZXMgPSAxNTYyLCBkZW50cyA9IDIsIGltZXRhID0gMTgs
IGZyZWVfc2VjOjQ0ODk4LCBmcmVlX3NlZzo0NDg5OCwgcnN2X3NlZzoyMzksIHByZWZyZWVfc2Vn
Ogo+ID4gICAgZjJmc19nYy0yNTQ6NDgtMzk2ICAgICBbMDA3XSAuLi4uLiAyMzExNjAwLjc3MjI3
NTogZjJmc19nY19lbmQ6IGRldiA9ICgyNTQsNDgpLCByZXQgPSAtNjEsIHNlZ19mcmVlZCA9IDAs
IHNlY19mcmVlZCA9IDAsIG5vZGVzID0gMTU2MiwgZGVudHMgPSAyLCBpbWV0YSA9IDE4LCBmcmVl
X3NlYzo0NDg5OCwgZnJlZV9zZWc6NDQ4OTgsIHJzdl9zZWc6MjM5LCBwcmVmcmVlX3NlZzowCj4g
Pgo+ID4gRml4ZXM6IDBlNWU4MTExNGRlMSAoImYyZnM6IGFkZCBHQ19VUkdFTlRfTE9XIG1vZGUg
aW4gZ2NfdXJnZW50IikKPiA+IEZpeGVzOiBkOThhZjVmNDU1MjAgKCJmMmZzOiBpbnRyb2R1Y2Ug
Z2NfdXJnZW50X21pZCBtb2RlIikKPiA+IFNpZ25lZC1vZmYtYnk6IFpoaWd1byBOaXUgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KPiA+IC0tLQo+ID4gdjI6IG1ha2UgR0NfVVJHRU5UX0xPVyBhbHNv
IHVzZSBDQiBhcHByb2FjaAo+ID4gLS0tCj4gPiAgIGZzL2YyZnMvZ2MuYyB8IDIgKysKPiA+ICAg
MSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9m
MmZzL2djLmMgYi9mcy9mMmZzL2djLmMKPiA+IGluZGV4IGU0MGJkZDEuLjNlMWI2ZDIgMTAwNjQ0
Cj4gPiAtLS0gYS9mcy9mMmZzL2djLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+ID4gQEAgLTI1
Nyw2ICsyNTcsOCBAQCBzdGF0aWMgaW50IHNlbGVjdF9nY190eXBlKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgaW50IGdjX3R5cGUpCj4gPgo+ID4gICAgICAgc3dpdGNoIChzYmktPmdjX21vZGUp
IHsKPiA+ICAgICAgIGNhc2UgR0NfSURMRV9DQjoKPiA+ICsgICAgIGNhc2UgR0NfVVJHRU5UX0xP
VzoKPiA+ICsgICAgIGNhc2UgR0NfVVJHRU5UX01JRDoKPiA+ICAgICAgICAgICAgICAgZ2NfbW9k
ZSA9IEdDX0NCOwo+ID4gICAgICAgICAgICAgICBicmVhazsKPiA+ICAgICAgIGNhc2UgR0NfSURM
RV9HUkVFRFk6Cj4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
