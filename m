Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB43A9BDE85
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 07:08:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8ZDc-0006XA-FE;
	Wed, 06 Nov 2024 06:08:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8ZDZ-0006X3-E0
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 06:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=azHHUl4nqqf7Fe+wXQiRFszybd+J/B98aFc7sI65jX0=; b=IQVCA8iDWm9Dh4aRb9EuY1u3aO
 P12yuKZK2bhP2j82ask84L4jLEXZtEm2gX38cH7tPLSXHxmgvRWedRj7rHGG8QHRdkBVLvDErSEyi
 LQwp1Sg/THaymYnTH1YHh5q4NSShBQh2U0CVovd/yQ140B23PmukenHd6FaeSqB+eG44=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=azHHUl4nqqf7Fe+wXQiRFszybd+J/B98aFc7sI65jX0=; b=J06WJx6vqcBaoPu4t/5qZW8ZcQ
 oL6J8Q3logs+xGR1q3+3RMq8sOAVsEH5dWkOYkFsi7ktXT/JqFz2eX4Gj4IRg+MNyMEUPrk2jnQPU
 0jmHbIstysSYEVMNpCHMzEqNGtOVpInyavvASWH2/kuQXuBjTCGPnNHgJcnDxS1NU2wc=;
Received: from mail-wr1-f43.google.com ([209.85.221.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8ZDX-0003CD-Pz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 06:08:36 +0000
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-37d5045987dso557499f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Nov 2024 22:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730873304; x=1731478104; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=azHHUl4nqqf7Fe+wXQiRFszybd+J/B98aFc7sI65jX0=;
 b=a67x2BOMyetQGYAFBoBQw01Ok0V7vABJW+EPIG08dsb66Ic2BCZTuYLm47kS+ws9ok
 2AlJBJcsD93njTNe3sBVstdm5B10nQd1r/iVml27KE7zaWDi05/7Q5W0n+lgxfOBlzCA
 Uxox9g7Mtf5U/Lae1zuU4WUEOluR5hD2Lqm5p1GzFeadD/3CSIvmjdN1ipDW4JxABol8
 ziNsARZfYVkAAYXALPnfMEe3n0MFbvi0MaWgfVUchsyjX2kc3du4bYHz23c3geVlxP5C
 1oh8tFAFQ0N/W4M60loGRXE8EaCxsVUc/JhlsvleWihyWn68hHQzjJPXXmy468c2KiZl
 cTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730873304; x=1731478104;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=azHHUl4nqqf7Fe+wXQiRFszybd+J/B98aFc7sI65jX0=;
 b=D/8QFqTamcj6Me5rYrDk6UjLsLr02mLedzHTfcY3WY3qKiuIBEAlnf0hhsj+ecrKtH
 ATihVbr73RGrlKsMD7LnhymqoTbTw1GaxuLMehT63uq3Lgb9HnBFjzkDWNjwYJIVMFtl
 T/rJhnBbVP16nEaC2NaXizMWTCRs3zH/vbCIpzblRM/KfpEjBF6DJiUDH/Y0+K2nncGT
 CPLK3zlJHpgAzKPUlvXkdCVyfwJYCt4wolWdJWPe9neCjGRXUKKMvnPU9b9sai2yoGNg
 TrVMXL4fDUdvFYKizDQPBpIB4OIbbA5oKo4D0aYzyug68Hv0iXDyAFG0dDd1iIc+XkOI
 qqJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXTrCZGSnOPkuaNT49QytRb2YR3R5ZyCBVFA9JBNlWJlszAHh9qViyAJLiLfSBvBK5IfayKL3gU7brkJeKyqG7@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxUgpH5dXmOy3z/7pDoitK5vrD8qxTZozxtweKMdJ8hgHRIK9NY
 NSmHqQIL6ZUr8qVTPzS+6vtaoMLCpCPXYw/AL+dLcpzFm+fR7u2V4gNZfFv/0gciODTTGaUDTkF
 5P68YhO2dPhSD6IE9CaOK78rqdDs=
X-Google-Smtp-Source: AGHT+IEjwIRX1UxVuVYlPr2qH0yTmMcek5+7LydrTDbQhaWFRr8nsAdyjXrzZXYmEQzkyaExSR7Sc+nWMWB9fx4mju4=
X-Received: by 2002:a05:6000:1549:b0:378:955f:d47d with SMTP id
 ffacd0b85a97d-380611fe5e7mr13784511f8f.11.1730873303960; Tue, 05 Nov 2024
 22:08:23 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
 <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
 <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
 <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
In-Reply-To: <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 6 Nov 2024 14:08:12 +0800
Message-ID: <CAHJ8P3L4Q4Pia66o1RQGw5NnUOVxzNgFXUPO33jtqfQ-Oc=G_g@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月6日周三 10:40写道： > > On 2024/11/6
    10:26, Zhiguo Niu wrote: > > Chao Yu 于2024年11月6日周三 10:16写道：
    > >> > >> On 2024/11/5 19:02, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.43 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t8ZDX-0003CD-Pz
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix to adjust appropriate length
 for fiemap
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJIDEwOjQw
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzYgMTA6MjYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTA6MTbl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvNSAxOTowMiwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqM
IDE4OjM55YaZ6YGT77yaCj4gPj4+Pgo+ID4+Pj4gT24gMjAyNC8xMS81IDE1OjI4LCBaaGlndW8g
Tml1IHdyb3RlOgo+ID4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx
5pyINeaXpeWRqOS6jCAxNTowNOWGmemBk++8mgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAyMDI0LzEx
LzQgOTo1NiwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+Pj4+Pj4+IElmIHVzZXIgZ2l2ZSBhIGZpbGUg
c2l6ZSBhcyAibGVuZ3RoIiBwYXJhbWV0ZXIgZm9yIGZpZW1hcAo+ID4+Pj4+Pj4gb3BlcmF0aW9u
cywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+ID4+Pj4+Pj4g
aXQgd2lsbCBzaG93IDIgc2VnbWVudHMgZmllbWFwIHJlc3VsdHMgZXZlbiB0aGlzIHdob2xlIGZp
bGUKPiA+Pj4+Pj4+IGlzIGNvbnRpZ3VvdXMgb24gZGlzaywgc3VjaCBhcyB0aGUgZm9sbG93aW5n
IHJlc3VsdHM6Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gICAgICAuL2YyZnNfaW8gZmllbWFwIDAgMTkw
MzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4gRmllbWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5
MDM0Cj4gPj4+Pj4+PiAgICAgICAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBoeXNpY2FsIGFkZHIu
ICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4+Pj4+Pj4gMCAgICAgICAwMDAwMDAwMDAwMDAw
MDAwIDAwMDAwMDAwMjBiYWEwMDAgMDAwMDAwMDAwMDAwNDAwMCAwMDAwMTAwMAo+ID4+Pj4+Pj4g
MSAgICAgICAwMDAwMDAwMDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAgMDAwMDAwMDAwMDAwMTAw
MCAwMDAwMTAwMQo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IGFmdGVyIHRoaXMgcGF0Y2g6Cj4gPj4+Pj4+
PiAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4gRmll
bWFwOiBvZmZzZXQgPSAwIGxlbiA9IDE5MDM0Cj4gPj4+Pj4+PiAgICAgICAgIGxvZ2ljYWwgYWRk
ci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4gPj4+Pj4+PiAw
ICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAzMTVmMzAwMCAwMDAwMDAwMDAwMDA1MDAwIDAw
MDAxMDAxCj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogWmhpZ3VvIE5pdSA8emhp
Z3VvLm5pdUB1bmlzb2MuY29tPgo+ID4+Pj4+Pj4gLS0tCj4gPj4+Pj4+PiBWMjogY29ycmVjdCBj
b21taXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4gPj4+Pj4+PiBmMmZzX2lv
IGhhcyBiZWVuIG1vZGlmaWVkIGZvciB0ZXN0aW5nLCB0aGUgbGVuZ3RoIGZvciBmaWVtYXAgaXMK
PiA+Pj4+Pj4+IHJlYWwgZmlsZSBzaXplLCBub3QgYmxvY2sgbnVtYmVyCj4gPj4+Pj4+PiAtLS0K
PiA+Pj4+Pj4+ICAgICAgZnMvZjJmcy9kYXRhLmMgfCA0ICsrLS0KPiA+Pj4+Pj4+ICAgICAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Pj4+Cj4g
Pj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4+
Pj4+Pj4gaW5kZXggMzA2Yjg2YjAuLjlmYzIyOWQgMTAwNjQ0Cj4gPj4+Pj4+PiAtLS0gYS9mcy9m
MmZzL2RhdGEuYwo+ID4+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+Pj4+IEBAIC0x
OTY2LDggKzE5NjYsOCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3Ry
dWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+Pj4+Pj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4+Pj4+ICAgICAgICAgIH0KPiA+Pj4+Pj4+Cj4gPj4+
Pj4+PiAtICAgICBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwgbGVuKSA9PSAwKQo+ID4+Pj4+Pj4g
LSAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pj4+ICsg
ICAgIGlmIChsZW4gJiAoYmxrc190b19ieXRlcyhpbm9kZSwgMSkgLSAxKSkKPiA+Pj4+Pj4+ICsg
ICAgICAgICAgICAgbGVuID0gcm91bmRfdXAobGVuLCBibGtzX3RvX2J5dGVzKGlub2RlLCAxKSk7
Cj4gPj4+Pj4+Cj4gPj4+Pj4+IEhvdyBkbyB5b3UgdGhpbmsgb2YgZ2V0dGluZyByaWQgb2YgYWJv
dmUgYWxpZ25tZW50IGZvciBsZW4/Cj4gPj4+Pj4+Cj4gPj4+Pj4+Pgo+ID4+Pj4+Pj4gICAgICAg
ICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+ID4+Pj4+Pj4gICAg
ICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+
ID4+Pj4+Pgo+ID4+Pj4+PiBBbmQgcm91bmQgdXAgZW5kIHBvc2l0aW9uIHcvOgo+ID4+Pj4+Pgo+
ID4+Pj4+PiBsYXN0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHJvdW5kX3VwKHN0YXJ0ICsg
bGVuIC0gMSwgRjJGU19CTEtTSVpFKSk7Cj4gPj4+Pj4gSGkgQ2hhbywKPiA+Pj4+PiBJIHRoaW5r
IHRoaXMgd2lsbCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+ID4+Pj4+IC0tLS0tLS0t
LS0tLS0KPiA+Pj4+PiBpZiAoc3RhcnRfYmxrID4gbGFzdF9ibGspCj4gPj4+Pj4gICAgICAgIGdv
dG8gb3V0Owo+ID4+Pj4+IC0tLS0tLS0tLS0tLS0KPiA+Pj4+PiBmb3IgZXhhbXBsZSwgYSBmaWxl
IHdpdGggc2l6ZSAxOTAwNiwgYnV0IHRoZSBsZW5ndGggZnJvbSB0aGUgdXNlciBpcyAxNjM4NC4K
PiA+Pj4+PiBiZWZvcmUgdGhpcyBtb2RpZmljYXRpb24sICBsYXN0X2JsayA9ICBieXRlc190b19i
bGtzKGlub2RlLCBzdGFydCArCj4gPj4+Pj4gbGVuIC0gMSkgPSAoaW5vZGUsIDE2MzgzKSA9IDMK
PiA+Pj4+PiBhZnRlciB0aGUgZmlyc3QgZjJmc19tYXBfYmxvY2tzKCkuIHN0YXJ0X2JsayBjaGFu
Z2UgdG8gYmUgNCwKPiA+Pj4+PiBhZnRlciB0aGUgc2Vjb25kIGYyZnNfbWFwX2Jsb2NrcygpLCBm
aWVtYXBfZmlsbF9uZXhfZXh0ZW4gd2lsbCBiZQo+ID4+Pj4+IGNhbGxlZCB0byBmaWxsIHVzZXIg
cGFyYW1ldGVyIGFuZCB0aGVuCj4gPj4+Pj4gd2lsbCBnb3RvIG91dCBiZWNhdXNlIHN0YXJ0X2Js
ayA+IGxhc3RfYmxrLCB0aGVuIGZpZW1hcCBmbG93IGZpbmlzaGVzLgo+ID4+Pj4+IGJ1dCBhZnRl
ciB0aGlzIG1vZGlmaWNhdGlvbiwgbGFzdF9ibGsgd2lsbCBiZSA0Cj4gPj4+Pj4gd2lsbCBkbyBm
MmZzX21hcF9ibG9ja3MoKSB1bnRpbCByZWFjaCB0aGUgbWF4X2ZpbGVfYmxvY2tzKGlub2RlKQo+
ID4+Pj4KPiA+Pj4+IFllcywgeW91J3JlIHJpZ2h0LCBob3dldmVyLCB3LyB0aGlzIHBhdGNoLCBp
dCBtYXkgY2hhbmdlIGxhc3RfYmxrLCBlLmcuCj4gPj4+Pgo+ID4+Pj4geGZzX2lvIGZpbGUgLWMg
ImZpZW1hcCAtdiAwIDE5MDA2IiB2cyB4ZnNfaW8gZmlsZSAtYyAiZmllbWFwIC12IDIgMTkwMDYi
Cj4gPj4+PiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwgYmU6IDAsIDQgYW5kIDAsIDUuCj4g
Pj4+IEhpIENoYW8sCj4gPj4+IHllcywgYnV0IHcvbyB0aGlzIHBhdGNoICwgdGhlIG9yaWdpbmFs
IGNvZGUgc3RpbGwgaGFzIHRoZSBzYW1lIHNpdHVhdGlvbj8/Cj4gPj4+IGZvciBleGFtcGxlCj4g
Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIgdnMgeGZzX2lvIGZpbGUgLWMg
ImZpZW1hcCAtdiAyIDE2Mzg0Igo+ID4+PiBzdGFydF9ibGsgYW5kIGxhc3RfYmxrIHdpbGwgYmU6
IDAsIDMgYW5kIDAsIDQuCj4gPj4KPiA+PiBGb3IgdGhlIGNhc2UgImZpZW1hcCAtdiAyIDE5MDA2
Iiwgb2Zmc2V0IGlzIDIsIGFuZCBsZW5ndGggaXMgMTkwMDYsIHNvIGxhc3Rfb2Zmc2V0Cj4gPj4g
aXMgMTkwMDgsIGFuZCBsYXN0X2JsayBzaG91bGQgYmUgNCByYXRoZXIgdGhhbiA1LCByaWdodD8K
PiA+IGhpIENoYW8sCj4gPiBpdCBpcyByaWdodCB3L28gbXkgcGF0Y2guCj4gPj4KPiA+PiBBbmQg
Zm9yIHlvdSBjYXNlLCBpdCBjYWxjdWxhdGVzIGxhc3RfYmxrIGNvcnJlY3RseS4KPiA+IFNvIHlv
dSBzdWdnZXN0IHRoYXQgIlNob3VsZCB3ZSByb3VuZF91cCBsZW4gYWZ0ZXIgc3RhcnRfYmxrICYg
bGFzdF9ibGsKPiA+IGNhbGN1bGF0aW9uPyIKPgo+IFpoaWd1bywKPgo+IFllcywgSSB0aGluayBh
bGlnbm1lbnQgb2YgbGVuIHNob3VsZCBub3QgYWZmZWN0IGNhbGN1bGF0aW9uIG9mIGxhc3RfYmxr
Lgo+Cj4gSSBtZWFuIHRoaXMsCj4KPiAtLS0KPiAgIGZzL2YyZnMvZGF0YS5jICAgICAgICAgIHwg
NiArKystLS0KPiAgIGluY2x1ZGUvbGludXgvZjJmc19mcy5oIHwgMyArKy0KPiAgIDIgZmlsZXMg
Y2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiBpbmRleCA3ZDFiYjk1MThhNDAuLmNi
YmI5NTZmNDIwZCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ICsrKyBiL2ZzL2YyZnMv
ZGF0YS5jCj4gQEAgLTE5NjcsMTIgKzE5NjcsMTIgQEAgaW50IGYyZnNfZmllbWFwKHN0cnVjdCBp
bm9kZSAqaW5vZGUsIHN0cnVjdCBmaWVtYXBfZXh0ZW50X2luZm8gKmZpZWluZm8sCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4gICAgICAgICB9Cj4KPiAtICAgICAgIGlmIChi
eXRlc190b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4gLSAgICAgICAgICAgICAgIGxlbiA9IGJs
a3NfdG9fYnl0ZXMoaW5vZGUsIDEpOwo+IC0KPiAgICAgICAgIHN0YXJ0X2JsayA9IGJ5dGVzX3Rv
X2Jsa3MoaW5vZGUsIHN0YXJ0KTsKPiAgICAgICAgIGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhp
bm9kZSwgc3RhcnQgKyBsZW4gLSAxKTsKPgo+ICsgICAgICAgaWYgKGxlbiAmIEYyRlNfQkxLU0la
RV9NQVNLKQo+ICsgICAgICAgICAgICAgICBsZW4gPSByb3VuZF91cChsZW4sIEYyRlNfQkxLU0la
RSk7Cj4gKwpIaSBDaGFvLAp0aGlzIHZlcmlvbiB2ZXJpZnkgcGFzcyB3aXRoIG15IHRlc3QgY2Fz
ZS4KCmJ1dCB0aGVyZSBpcyBzdGlsbCBhbm90aGVyIGlzc3VlIGluIG9yZ2luYWwgY29kZToKeWxv
Zy9hbmFseXplci5weSAgc2l6ZSA9IDE5MDM0CmlmIEkgaW5wdXQgdGhlIGZvbGxvd2luZyBjbWQo
c3RhcnQvbGVuZ3RoIGFyZSBib3RoIHJlYWwgc2l6ZSwgbm90IGJsb2NrIG51bWJlcikKL2YyZnNf
aW8gZmllbWFwIDIgMTYzODQgeWxvZy9hbmFseXplci5weQphbmQgdGhlIHJlc3VsdHMgc2hvd3M6
CkZpZW1hcDogb2Zmc2V0ID0gMiBsZW4gPSAxNjM4NAogICAgbG9naWNhbCBhZGRyLiAgICBwaHlz
aWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKMCAgICAwMDAwMDAwMDAwMDAwMDAw
IDAwMDAwMDBlMmViY2EwMDAgMDAwMDAwMDAwMDAwNDAwMCAwMDAwMTAwMAoxICAgIDAwMDAwMDAw
MDAwMDQwMDAgMDAwMDAwMGUyZWJjZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCnNvIHN0
YXJ0X2Jsay9sYXN0X2JsayBzaG91bGQgYmUgY2FsY3VsYXRlIGl0IGluIHRoZSBmb2xsb3dpbmcg
d2F5PwpiZWZvcmU6CnN0YXJ0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKbGFz
dF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwphZnRlcjoKCnN0
YXJ0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0KTsKbGFzdF9ibGsgPSBzdGFydF9i
bGsgKyBieXRlc190b19ibGtzKGlub2RlLCBsZW4gLSAxKTsKdGhhbmtzIQo+ICAgbmV4dDoKPiAg
ICAgICAgIG1lbXNldCgmbWFwLCAwLCBzaXplb2YobWFwKSk7Cj4gICAgICAgICBtYXAubV9sYmxr
ID0gc3RhcnRfYmxrOwo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCBiL2lu
Y2x1ZGUvbGludXgvZjJmc19mcy5oCj4gaW5kZXggYjBiODIxZWRmZDk3Li45NTRlOGU4MzQ0Yjcg
MTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiArKysgYi9pbmNsdWRlL2xp
bnV4L2YyZnNfZnMuaAo+IEBAIC0yNCwxMCArMjQsMTEgQEAKPiAgICNkZWZpbmUgTkVXX0FERFIg
ICAgICAgICAgICAgICgoYmxvY2tfdCktMSkgICAvKiB1c2VkIGFzIGJsb2NrX3QgYWRkcmVzc2Vz
ICovCj4gICAjZGVmaW5lIENPTVBSRVNTX0FERFIgICAgICAgICAoKGJsb2NrX3QpLTIpICAgLyog
dXNlZCBhcyBjb21wcmVzc2VkIGRhdGEgZmxhZyAqLwo+Cj4gKyNkZWZpbmUgRjJGU19CTEtTSVpF
X01BU0sgICAgICAgICAgICAgIChGMkZTX0JMS1NJWkUgLSAxKQo+ICAgI2RlZmluZSBGMkZTX0JZ
VEVTX1RPX0JMSyhieXRlcykgICAgICAoKGJ5dGVzKSA+PiBGMkZTX0JMS1NJWkVfQklUUykKPiAg
ICNkZWZpbmUgRjJGU19CTEtfVE9fQllURVMoYmxrKSAgICAgICAgICAgICAgICAoKGJsaykgPDwg
RjJGU19CTEtTSVpFX0JJVFMpCj4gICAjZGVmaW5lIEYyRlNfQkxLX0VORF9CWVRFUyhibGspICAg
ICAgICAgICAgICAgKEYyRlNfQkxLX1RPX0JZVEVTKGJsayArIDEpIC0gMSkKPiAtI2RlZmluZSBG
MkZTX0JMS19BTElHTih4KSAgICAgICAgICAgICAgICAgICAgICAoRjJGU19CWVRFU19UT19CTEso
KHgpICsgRjJGU19CTEtTSVpFIC0gMSkpCj4gKyNkZWZpbmUgRjJGU19CTEtfQUxJR04oeCkgICAg
ICAgICAgICAgIChGMkZTX0JZVEVTX1RPX0JMSygoeCkgKyBGMkZTX0JMS1NJWkUgLSAxKSkKPgo+
ICAgLyogMCwgMShub2RlIG5pZCksIDIobWV0YSBuaWQpIGFyZSByZXNlcnZlZCBub2RlIGlkICov
Cj4gICAjZGVmaW5lIEYyRlNfUkVTRVJWRURfTk9ERV9OVU0gICAgICAgICAgICAgICAgMwo+IC0t
Cj4gMi40MC4xCj4KPgo+Cj4gPiBUaGFua3MKPiA+Pgo+ID4+IFRoYW5rcywKPiA+Pgo+ID4+PiBi
dXQgb3ZlcmFsbCBsYXN0X2JsayB3aWxsIGNoYW5nZSBsb29wIGNvdW50cyBidXQgaGFzIG5vdCBh
ZmZlY3Qgb24gdGhlIHJlc3VsdHMuCj4gPj4+Pgo+ID4+Pj4gU2hvdWxkIHdlIHJvdW5kX3VwIGxl
biBhZnRlciBzdGFydF9ibGsgJiBsYXN0X2JsayBjYWxjdWxhdGlvbj8KPiA+Pj4gSSB0aGlua3Mg
aXQgaXMgb2sgLGJ1dCBqdXN0IGEgbGl0dGxlIGJpdCByZWR1bmRhbnQgd2l0aCB0aGUgZm9sbG93
aW5nCj4gPj4+IGhhbmRsaW5nIGFib3V0IGxlbi4KPiA+Pj4KPiA+Pj4gaWYgKGJ5dGVzX3RvX2Js
a3MoaW5vZGUsIGxlbikgPT0gMCkKPiA+Pj4gICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2Rl
LCAxKTsKPiA+Pj4KPiA+Pj4gQmFzZWQgb24gdGhlIGFib3ZlIHNpdHVhdGlvbiwKPiA+Pj4gZG8g
eW91IGhhdmUgYW55IG90aGVyIGdvb2Qgc3VnZ2VzdGlvbnM/IF5eCj4gPj4+IHRoYW5rcyEKPiA+
Pj4KPiA+Pj4+Cj4gPj4+PiBUaGFua3MsCj4gPj4+Pgo+ID4+Pj4+IHRoYW5rc++8gQo+ID4+Pj4+
Pgo+ID4+Pj4+PiBUaGFua3MsCj4gPj4+Pj4+Cj4gPj4+Pgo+ID4+Cj4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
