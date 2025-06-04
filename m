Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AFC9ACDC58
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jun 2025 13:15:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iOzysu0uKiSK9FLEhrUiXz2mqK6P1Sk012bKv/7VJMI=; b=L+gVd3jYDG57cp94b4fSJ3QBQ6
	HGgq6COAzrb7x1cWb/h210yJ1EjPp9h2NMQt+vlJOtKMVZsbq9a5b5V3akHMs7Bi424YoYzl8sRY1
	Rv6AZ7lh4iqXUNh2IPHaf6NSQmXIFXW+cDybMSWec5RhApEfOX+At2ndBNg5GTSPTh+0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMm5F-0006NB-QI;
	Wed, 04 Jun 2025 11:15:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uMm59-0006My-Ur
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 11:14:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/W3SslCIkybQ8nlaw9YaSUzaYWq8vA0m3x6Q+lRAvHA=; b=Q+072hq/e+RgC/oX9F2EaI61qB
 MQ9VVJoUQsZ8WPH0Txgq8xTFx8ztOqhViFApWQswG7b2KpVODR63AJha3zgrYqbDkGyG7tNsFmYIH
 jlLB+90ZYlWA45ADJIMppBRnHHAkcBL3TApGxqZvaFj/DFGEumRg1eBnuKKkTUFYd9As=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/W3SslCIkybQ8nlaw9YaSUzaYWq8vA0m3x6Q+lRAvHA=; b=YX4iuW9+hMJ9i1uFxrb9sDuZSA
 TUPQsiLhSt9c3g4AinuLeJ99Ma3wV6lfyzXfWh2Jwk76i+PQyzf7ySwKKzw4Tg/DXJW4OpMKz6ADJ
 dcNpL8pBkESEsA/fnZ7yz5JSeuSt+TC6BVk39MeqL5U5wcI9HbTaLYCxUvBsMp5BQtok=;
Received: from mail-wr1-f47.google.com ([209.85.221.47])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMm59-0005yB-6L for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jun 2025 11:14:55 +0000
Received: by mail-wr1-f47.google.com with SMTP id
 ffacd0b85a97d-3a4e749d7b2so880251f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 04:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749035684; x=1749640484; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/W3SslCIkybQ8nlaw9YaSUzaYWq8vA0m3x6Q+lRAvHA=;
 b=bQ8vvreiYPAfLQeb6g7ruUrw0bojwSFnaixnxU0DM6sVPXhthY4tqBewWXLE9cqp2l
 cIJssjQWv7DF4dLcJ56lwWTxksYs3EeKDME5ip1+I8ItvTohMNtDUXLzkM3hJnzX9aOz
 0bAPu4uMvxFWO2yZAY3bRjjXK+lGdq0ITagkF2KnuURHCWXsUMwbNN8w3m0NCZ2nkM8a
 GJy8Z6w57UVoTuiZTqsZUQLZEIUJETQbsHw83vGS/4t3YjHw8pgNwWOt41Y7fQGRTSBO
 afPumjbw394YpAxuHuyKEYDvMngpaY+X4r8YmFVb8EW6GQDCyQSInXCrkxkD4cj8S0FK
 LKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749035684; x=1749640484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/W3SslCIkybQ8nlaw9YaSUzaYWq8vA0m3x6Q+lRAvHA=;
 b=NE/psjiL2haZEX0bqBbeO3oufT/xOq18KjZU6RwRHI3lY+HNzSJJb082sknqprS5Dy
 /SRmCGJ64TQgFG6X4rBmjRK6A40WrVH7JUX9SDL3NX4U9hlZqcigHpgx/3SpnIRGpXWr
 2keBn+nvTnYiVD2iI1ENLQ4NajDk8jJpIqlgIo120xuLfA8XlOHeYp2Jm4DCFwsJRryp
 rvQ5X04jDMlhmjmepVxXr7qTc2Nv7y357cyh3x44GYvPMPl0jtI0eVmXuYMqkU7PrSIp
 8zRkRJbxwtu4D5cewXhAiiC3DymLoKHZnGMW9efJsqjRurBYQVt0dXlRW8Vl8DBwjAxt
 uy6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrNZ6+vuwE2F2aLMO8w7CyEvPMw/eVQI0KoBMvEq91+mZ1EA72YPICG+AUl2nCJl1WIOKN66jM3Q+BMIJ3XL0n@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyEfGVZVG9mtJYoYx0anJctVzV+i9p5grDGxelY9pjCa9ni6cou
 2Spsqhj3ROATdLwsXEXicBw1w1DRdyyNg3g8GVMcKsrMEyViolB2IYJPqo1aKl2sn8hytTnmhB6
 7am9fsguSc0Tz2W1rZgRjX+PKNoHVsec=
X-Gm-Gg: ASbGncs9Pmn041igG+h1GDp7avnba6awe0nRJz1iQN5a7Nyy2qDcK7w/zy7ZTW/z/55
 88sJTWmyInCcLCzmU18ljyBoZKfstgozd5at/4eXMwuP3PTMkLcJxA/13WwvzeP0SESlPA9pzzC
 9+0S6/vrITLHoBqlWap7EhgjV2yRNZXDopwPp4sVCPIuNq
X-Google-Smtp-Source: AGHT+IE0Qn6gOQ8QGmAs8CrGPJdavUw2eWZCGOUk8VhczlRhK7Yu7ysdfiEIEcTehO1ISuGC68kBYW8rIShTXFmyYbE=
X-Received: by 2002:a05:6000:2305:b0:3a3:584b:f5d7 with SMTP id
 ffacd0b85a97d-3a51d91f8a4mr726947f8f.5.1749035683391; Wed, 04 Jun 2025
 04:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <1749016492-31835-1-git-send-email-zhiguo.niu@unisoc.com>
 <061c94ab-ff57-42e3-ad7c-592dfb2a822e@kernel.org>
 <CAHJ8P3J4Q-0ckCuZhV-r_O_Hct4yqqtC0uboLjxZP1bnfBJOEg@mail.gmail.com>
 <1791cead-c598-41dc-8c6c-811787df14b7@kernel.org>
In-Reply-To: <1791cead-c598-41dc-8c6c-811787df14b7@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 4 Jun 2025 19:14:31 +0800
X-Gm-Features: AX0GCFuDkB7CamZfWdlKurMulJGXKDq3kb6xULMz2Ze7rFIYjcGWXjRFGaXSkz0
Message-ID: <CAHJ8P3JCV9wjRXC530WgPjZx-_XEhVRoG3B9Mcn4XG_Y-x1nGQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2025年6月4日周三 19:09写道： > > On 6/4/25
    18:49, Zhiguo Niu wrote: > > Chao Yu 于2025年6月4日周三 17:48写道：
    > >> > >> On 6/4/25 13:54, Zhiguo Niu wrote: > >>> The de [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.47 listed in list.dnswl.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.47 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.47 listed in sa-accredit.habeas.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.47 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1uMm59-0005yB-6L
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix UAF of f2fs_inode_info
 in f2fs_free_dic
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
 jaegeuk@kernel.org, baocong.liu@unisoc.com, Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI15bm0NuaciDTml6XlkajkuIkgMTk6MDnl
hpnpgZPvvJoKPgo+IE9uIDYvNC8yNSAxODo0OSwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+IENoYW8g
WXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNeW5tDbmnIg05pel5ZGo5LiJIDE3OjQ45YaZ6YGT
77yaCj4gPj4KPiA+PiBPbiA2LzQvMjUgMTM6NTQsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+IFRo
ZSBkZWNvbXByZXNzX2lvX2N0eCBtYXkgYmUgcmVsZWFzZWQgYXN5bmNocm9ub3VzbHkgYWZ0ZXIK
PiA+Pj4gSS9PIGNvbXBsZXRpb24uIElmIHRoaXMgZmlsZSBpcyBkZWxldGVkIGltbWVkaWF0ZWx5
IGFmdGVyIHJlYWQsCj4gPj4+IGFuZCB0aGUga3dvcmtlciBvZiBwcm9jZXNzaW5nIHBvc3RfcmVh
ZF93cSBoYXMgbm90IGJlZW4gZXhlY3V0ZWQgeWV0Cj4gPj4+IGR1ZSB0byBoaWdoIHdvcmtsb2Fk
cywgSXQgaXMgcG9zc2libGUgdGhhdCB0aGUgaW5vZGUoZjJmc19pbm9kZV9pbmZvKQo+ID4+PiBp
cyBldmljdGVkIGFuZCBmcmVlZCBiZWZvcmUgaXQgaXMgdXNlZCBmMmZzX2ZyZWVfZGljLgo+ID4+
Pgo+ID4+PiAgICAgVGhlIFVBRiBjYXNlIGFzIGJlbG93Ogo+ID4+PiAgICAgVGhyZWFkIEEgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFRocmVhZCBCCj4gPj4+ICAgICAtIGYy
ZnNfZGVjb21wcmVzc19lbmRfaW8KPiA+Pj4gICAgICAtIGYyZnNfcHV0X2RpYwo+ID4+PiAgICAg
ICAtIHF1ZXVlX3dvcmsKPiA+Pj4gICAgICAgICBhZGQgZnJlZV9kaWMgd29yayB0byBwb3N0X3Jl
YWRfd3EKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgLSBkb191bmxpbmsKPiA+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIC0gaXB1dAo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZXZpY3QKPiA+Pj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLSBjYWxsX3JjdQo+ID4+PiAg
ICAgVGhpcyBmaWxlIGlzIGRlbGV0ZWQgYWZ0ZXIgcmVhZC4KPiA+Pj4KPiA+Pj4gICAgIFRocmVh
ZCBDICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAga3dvcmtlciB0byBwcm9jZXNzIHBv
c3RfcmVhZF93cQo+ID4+PiAgICAgLSByY3VfZG9fYmF0Y2gKPiA+Pj4gICAgICAtIGYyZnNfZnJl
ZV9pbm9kZQo+ID4+PiAgICAgICAtIGttZW1fY2FjaGVfZnJlZQo+ID4+PiAgICAgIGlub2RlIGlz
IGZyZWVkIGJ5IHJjdQo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAtIHByb2Nlc3Nfc2NoZWR1bGVkX3dvcmtzCj4gPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtIGYyZnNfbGF0ZV9mcmVlX2RpYwo+ID4+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gZjJmc19mcmVl
X2RpYwo+ID4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAtIGYyZnNfcmVsZWFzZV9kZWNvbXBfbWVtCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmVhZCAoZGljLT5pbm9kZSktPmlfY29tcHJlc3NfYWxnb3JpdGhtCj4g
Pj4+Cj4gPj4+IFRoaXMgcGF0Y2ggaW5jcmVhc2UgaW5vZGUtPmlfY291bnQgYmVmb3JlIGYyZnNf
ZnJlZV9kaWMgYW5kIGRlY3JlYXNlIGl0Cj4gPj4+IGFmdGVyIGZyZWUgdGhlIGRpYy4KPiA+Pj4K
PiA+Pj4gQ2M6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+IEZpeGVz
OiBiZmYxMzliNDlkOWYgKCJmMmZzOiBoYW5kbGUgZGVjb21wcmVzcyBvbmx5IHBvc3QgcHJvY2Vz
c2luZyBpbiBzb2Z0aXJxIikKPiA+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhpZ3Vv
Lm5pdUB1bmlzb2MuY29tPgo+ID4+PiBTaWduZWQtb2ZmLWJ5OiBCYW9jb25nIExpdSA8YmFvY29u
Zy5saXVAdW5pc29jLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICBmcy9mMmZzL2NvbXByZXNzLmMgfCAx
OSArKysrKysrKysrKysrKy0tLS0tCj4gPj4+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9u
cygrKSwgNSBkZWxldGlvbnMoLSkKPiA+Pj4KPiA+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29t
cHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4+PiBpbmRleCBiM2MxZGY5Li42YjNiM2E3
IDEwMDY0NAo+ID4+PiAtLS0gYS9mcy9mMmZzL2NvbXByZXNzLmMKPiA+Pj4gKysrIGIvZnMvZjJm
cy9jb21wcmVzcy5jCj4gPj4+IEBAIC0xNjg3LDcgKzE2ODcsNyBAQCBzdGF0aWMgdm9pZCBmMmZz
X3JlbGVhc2VfZGVjb21wX21lbShzdHJ1Y3QgZGVjb21wcmVzc19pb19jdHggKmRpYywKPiA+Pj4g
IH0KPiA+Pj4KPiA+Pj4gIHN0YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0IGRlY29tcHJl
c3NfaW9fY3R4ICpkaWMsCj4gPj4+IC0gICAgICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJveV9j
YWxsYmFjayk7Cj4gPj4+ICsgICAgICAgICAgICAgYm9vbCBieXBhc3NfZGVzdHJveV9jYWxsYmFj
aywgYm9vbCBsYXRlX2ZyZWUpOwo+ID4+Pgo+ID4+PiAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4
ICpmMmZzX2FsbG9jX2RpYyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPiA+Pj4gIHsKPiA+Pj4g
QEAgLTE3NDMsMTIgKzE3NDMsMTIgQEAgc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpmMmZzX2Fs
bG9jX2RpYyhzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYykKPiA+Pj4gICAgICAgcmV0dXJuIGRpYzsK
PiA+Pj4KPiA+Pj4gIG91dF9mcmVlOgo+ID4+PiAtICAgICBmMmZzX2ZyZWVfZGljKGRpYywgdHJ1
ZSk7Cj4gPj4+ICsgICAgIGYyZnNfZnJlZV9kaWMoZGljLCB0cnVlLCBmYWxzZSk7Cj4gPj4+ICAg
ICAgIHJldHVybiBFUlJfUFRSKHJldCk7Cj4gPj4+ICB9Cj4gPj4+Cj4gPj4+ICBzdGF0aWMgdm9p
ZCBmMmZzX2ZyZWVfZGljKHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAqZGljLAo+ID4+PiAtICAg
ICAgICAgICAgIGJvb2wgYnlwYXNzX2Rlc3Ryb3lfY2FsbGJhY2spCj4gPj4+ICsgICAgICAgICAg
ICAgYm9vbCBieXBhc3NfZGVzdHJveV9jYWxsYmFjaywgYm9vbCBsYXRlX2ZyZWUpCj4gPj4+ICB7
Cj4gPj4+ICAgICAgIGludCBpOwo+ID4+Pgo+ID4+PiBAQCAtMTc3NSw2ICsxNzc1LDExIEBAIHN0
YXRpYyB2b2lkIGYyZnNfZnJlZV9kaWMoc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpkaWMsCj4g
Pj4+ICAgICAgIH0KPiA+Pj4KPiA+Pj4gICAgICAgcGFnZV9hcnJheV9mcmVlKGRpYy0+aW5vZGUs
IGRpYy0+cnBhZ2VzLCBkaWMtPm5yX3JwYWdlcyk7Cj4gPj4+ICsgICAgIGlmIChsYXRlX2ZyZWUp
IHsKPiA+Pj4gKyAgICAgICAgICAgICBzcGluX2xvY2soJmRpYy0+aW5vZGUtPmlfbG9jayk7Cj4g
Pj4+ICsgICAgICAgICAgICAgYXRvbWljX2RlYygmZGljLT5pbm9kZS0+aV9jb3VudCk7Cj4gPj4+
ICsgICAgICAgICAgICAgc3Bpbl91bmxvY2soJmRpYy0+aW5vZGUtPmlfbG9jayk7Cj4gPj4KPiA+
PiBJZiBpdCBpcyB0aGUgbGFzdCBvbmUgcmVsZWFzZSBpX2NvdW50LCBpdCBuZWVkcyB0byBjYWxs
IGlwdXRfZmluYWwgdG8gZXZpY3QgaW5vZGUKPiA+PiBsaWtlIHdoYXQgaXB1dCBkaWQsIHNvIHdl
J2QgYmV0dGVyIHRvIGNhbGwgaXB1dCgpIGhlcmU/Cj4gPiBIaSBDaGFvLAo+ID4gWWVzLCB3ZSBo
YXZlIGFsc28gdGVzdGVkIHRoaXMgbWV0aG9kKGlwdXQvX19pZ2V0KSwgYW5kIGl0IHdvcmtlZC4K
PiA+IEp1c3QgdGhpbmsgSXQgaXMgc2ltcGxlciBhbmQgZWFzaWVyIHRvIHJlYWQgdG8gZGlyZWN0
bHkgb3BlcmF0ZQo+ID4gaV9jb3VudCwgYW5kIHRoZW4gZnJlZSBpdAo+ID4gYnkgcmVseWluZyBv
biB0aGUgbWVtb3J5IG1vZHVsZSB3aGVuIGlfY291bnQ9MC4KPiA+IEJ1dCBJdCBzZWVtcyBpcHV0
L19faWdldCBpcyBiZXR0ZXIuCj4gPj4KPiA+Pj4gKyAgICAgfQo+ID4+PiAgICAgICBrbWVtX2Nh
Y2hlX2ZyZWUoZGljX2VudHJ5X3NsYWIsIGRpYyk7Cj4gPj4+ICB9Cj4gPj4+Cj4gPj4+IEBAIC0x
NzgzLDE2ICsxNzg4LDIwIEBAIHN0YXRpYyB2b2lkIGYyZnNfbGF0ZV9mcmVlX2RpYyhzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspCj4gPj4+ICAgICAgIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCAq
ZGljID0KPiA+Pj4gICAgICAgICAgICAgICBjb250YWluZXJfb2Yod29yaywgc3RydWN0IGRlY29t
cHJlc3NfaW9fY3R4LCBmcmVlX3dvcmspOwo+ID4+Pgo+ID4+PiAtICAgICBmMmZzX2ZyZWVfZGlj
KGRpYywgZmFsc2UpOwo+ID4+PiArICAgICBmMmZzX2ZyZWVfZGljKGRpYywgZmFsc2UsIHRydWUp
Owo+ID4+PiAgfQo+ID4+Pgo+ID4+PiAgc3RhdGljIHZvaWQgZjJmc19wdXRfZGljKHN0cnVjdCBk
ZWNvbXByZXNzX2lvX2N0eCAqZGljLCBib29sIGluX3Rhc2spCj4gPj4+ICB7Cj4gPj4+ICAgICAg
IGlmIChyZWZjb3VudF9kZWNfYW5kX3Rlc3QoJmRpYy0+cmVmY250KSkgewo+ID4+PiAgICAgICAg
ICAgICAgIGlmIChpbl90YXNrKSB7Cj4gPj4+IC0gICAgICAgICAgICAgICAgICAgICBmMmZzX2Zy
ZWVfZGljKGRpYywgZmFsc2UpOwo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgZjJmc19mcmVl
X2RpYyhkaWMsIGZhbHNlLCBmYWxzZSk7Cj4gPj4+ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgIElOSVRfV09SSygmZGljLT5mcmVlX3dvcmssIGYyZnNf
bGF0ZV9mcmVlX2RpYyk7Cj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAvKiB0byBhdm9pZCBp
bm9kZSBpcyBldmljdGVkIHNpbXVsdGFuZW91c2x5ICovCj4gPj4+ICsgICAgICAgICAgICAgICAg
ICAgICBzcGluX2xvY2soJmRpYy0+aW5vZGUtPmlfbG9jayk7Cj4gPj4+ICsgICAgICAgICAgICAg
ICAgICAgICBhdG9taWNfaW5jKCZkaWMtPmlub2RlLT5pX2NvdW50KTsKPiA+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgIHNwaW5fdW5sb2NrKCZkaWMtPmlub2RlLT5pX2xvY2spOwo+ID4+Cj4gPj4g
aWdldCgpPwo+ID4+Cj4gPj4gQlRXLCBjYW4gd2Ugc3RvcmUgaV9jb21wcmVzc19hbGdvcml0aG0g
aW4gZGljIHRvIGF2b2lkIGlub2RlIGFjY2Vzcz8KPiA+Cj4gPiBBbHNvIHRob3VnaHQgb2YgdGhp
cyBtZXRob2QsIGJ1dCBpdCB3b3VsZCByZXF1aXJlIG1vcmUgY2hhbmdlcy4KPiA+IGRpYy0+aW5v
ZGUgdXNlZCBpbiBmMmZzX2ZyZWVfZGljIGFyZSBhbGwgbmVlZGVkIHRvIG1vZGlmeSBleGNlcHQK
PiA+IGlfY29tcHJlc3NfYWxnb3JpdGhtLgo+ID4gc3VjaCBhcyAgcGFnZV9hcnJheV9mcmVlKGRp
Yy0+aW5vZGUpLAo+Cj4gWmhpZ3VvLAo+Cj4gcGFnZV9hcnJheV9mcmVlKCkgcGFyc2VzIGRpYy0+
aW5vZGUgdG8gZ2V0IHNiaSBvbmx5LCBzbyB3ZSBjYW4gcGFzcyBzYmkgdG8KPiBwYWdlX2FycmF5
X2ZyZWUoKSBkaXJlY3RseSB0byBhdm9pZCB1c2luZyBkaWMtPmlub2RlLgpIaSBDaGFvLApidXQg
bm93IHNiaSBpcyBub3QgaW4gZGljIHN0cnVjdHVyZSwgc28gd2UgYWxzbyBuZWVkIHRvIGFkZCBp
dCA/Cj4KPiA+IGFsbG93X21lbWFsbG9jX2Zvcl9kZWNvbXAoRjJGU19JX1NCKGRpYy0+aW5vZGUp
KS4KPiA+Cj4gPiBEbyB5b3UgaGF2ZSBhbnkgb3RoZXIgc3VnZ2VzdGlvbnM/Cj4KPiBVc2luZyBp
Z2V0L2lwdXQgbG9va3MgZmluZSB0byBtZSwgcGxlYXNlIGdvIGFoZWFkLgpPS34KdGhhbmtzIQo+
Cj4gVGhhbmtzLAo+Cj4gPiB0aGFua3PvvIEKPiA+Cj4gPj4KPiA+PiBUaGFua3MsCj4gPj4KPiA+
Pj4gICAgICAgICAgICAgICAgICAgICAgIHF1ZXVlX3dvcmsoRjJGU19JX1NCKGRpYy0+aW5vZGUp
LT5wb3N0X3JlYWRfd3EsCj4gPj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgJmRpYy0+ZnJlZV93b3JrKTsKPiA+Pj4gICAgICAgICAgICAgICB9Cj4gPj4KPgoKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2
ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwK
