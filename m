Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD67D9BFEB4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Nov 2024 07:54:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8wPa-0007di-Ol;
	Thu, 07 Nov 2024 06:54:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8wPZ-0007dX-0c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 06:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VyxLhBQWjzlLqMsUsjx2AG4ZJO4tKIV9372UqntirLo=; b=P62phwwCFAIioGNJqS5tQo/Pa1
 tM2W6HUtXg46sHCbNQ5KMpaHp7bS7YKvYsrn9vSNe+9J5O5KeZxb/OY1g24lsuoAwd45NF97ARsc0
 q9pTCTaUfMfX+qE1nlkRSDnMoR5kUVdQVJ/p4DgxHeC4wUQDFAUvLntqVltUj5Fxx7go=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VyxLhBQWjzlLqMsUsjx2AG4ZJO4tKIV9372UqntirLo=; b=X5iTUivJqp40b0945oroWXupT/
 54FUNUQNhJAO3Bs6rge2jGmA9xH3zrxwo2+eBQqiIzgHO5I98neNXjBd6Pkl77JgQMGC72EcoDYu4
 oG3l9lTnRmr78XGlX4jG2YazKAUkEFlPczP78VIlT/Au9N/DmWydFZNPdaY8zjfK+n6w=;
Received: from mail-wm1-f53.google.com ([209.85.128.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8wPY-00010o-M7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Nov 2024 06:54:33 +0000
Received: by mail-wm1-f53.google.com with SMTP id
 5b1f17b1804b1-4314ff68358so968505e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Nov 2024 22:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730962466; x=1731567266; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VyxLhBQWjzlLqMsUsjx2AG4ZJO4tKIV9372UqntirLo=;
 b=hngxIsDo7EHCJUWsodBLcA4uZoa4+HSPPq4CZxKtFFRCv9whtKL4vZbH4ib4jY3EjD
 gRTsyTDFNaNCjIM/exV6IsXlldEMUhNZ4SM4DCqUdCz9NLHivrcohI/4eDhmTChVAkAu
 hu8fjPe1GA57oy66JDmj45T1sCegIyp9WOr1lJ3hAWWqEpn5tAs5/Yo3/8SRgIHnMjHw
 tzYzjmj+FsOsoFKjlSMjV7FWYV4Neg2jtJWlqFEu2vDOVrxpN/WYS513vbUh1lLIboTA
 Sev6kpluDXoyR8xPQIXkMoVB1sMxoAl9G98NCnu2wQu1uHBQEv5WXaG8TMjqDe46tKYr
 AMPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730962466; x=1731567266;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VyxLhBQWjzlLqMsUsjx2AG4ZJO4tKIV9372UqntirLo=;
 b=jkB6/FVCsmlVnB8W4aLAUO5XIGFWiNBa/gpOtVrSfIBO/9G/TTWIJGpdIs4Lj8YO2r
 MgljVB+oyLkb5mFvPknSjLOkZQ22FACixGjwLM5LGWUXj0D/szptpXI54zW2NmyKK7lt
 Oav/ar0vH6mIHBBuDWlrbNMAen9Z/Xr2f+Zqn8667nfpCtjTM8gArcmoPaUOUZBj1mIC
 MmCGcp/jRKyCIOGaYULSUt7wDMLbaG3BKy2beuuWuaspXozxryqpBZtAAwREvcLPJd8q
 ctI5T+Fu55L6rN0UCdjBY9sbC7eWKPKf/N7995OOFLYBLsCgangJEagqgwvJJd4WHUKF
 UCmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdyDKSK3w7Zv8uY8zdL4cHZ0G4fhdVNfqgUfzP9skBNEjwwL3J+JWn18FF1KlH1vug1MA0B2NzNGzDP4nfYZXs@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwodlCEs9Ov2L6TLPyag9n/Y/YpQt0qdiTLImVU9TD4MajYGNIB
 iMBasApSRvUGJvnaJo7lJify6qff+ArmrElULMzviQOn4dLnY67W/fL9A3uObMk4DohoodN7jRP
 mbxR73jwY9acEl9Qj1xGhEior9pg=
X-Google-Smtp-Source: AGHT+IFxkWp0+ajRnKoDn6ec/DJOLyHh4BtzKlrtLTRvciUZK6q3TH2qalx4yZMDhl79+gg7wt+99SudHnprpWIfytA=
X-Received: by 2002:a05:6000:4028:b0:37d:4f25:816d with SMTP id
 ffacd0b85a97d-381ef6ba2f8mr6650f8f.4.1730962465814; Wed, 06 Nov 2024 22:54:25
 -0800 (PST)
MIME-Version: 1.0
References: <1730685372-2995-1-git-send-email-zhiguo.niu@unisoc.com>
 <ab9f63b2-8d02-411b-8d2f-bc1b5b748ffe@kernel.org>
 <CAHJ8P3L9o2RJgV=TtUf_MPj36wasgPn7bn9FnGPXu=TgpE7ATQ@mail.gmail.com>
 <22873055-370b-4240-83ff-96bcfa91413a@kernel.org>
 <CAHJ8P3LddwapGLV5nKmw1ULTm7qp5OMk-kFBK3s_UptPPeph7w@mail.gmail.com>
 <9199e9fc-7b5b-4069-b79b-65ba5ae1b0f6@kernel.org>
 <CAHJ8P3L68mKAcSdrgk-5VZQh4cW+BBroh+50ymvuzO0f5x5kMw@mail.gmail.com>
 <c070fd2d-6480-4833-b03c-ec032ee37a28@kernel.org>
 <CAHJ8P3L4Q4Pia66o1RQGw5NnUOVxzNgFXUPO33jtqfQ-Oc=G_g@mail.gmail.com>
 <0a8f96da-302d-4d6c-9ab6-0b66a05cbcfd@kernel.org>
 <CAHJ8P3JTY=DFQRMd0zNGy6a3Hdq1y045ri9QKM8NGn8bNhHJfA@mail.gmail.com>
 <d5ef36a3-1bcb-40a0-a963-c6d1887c4e4e@kernel.org>
In-Reply-To: <d5ef36a3-1bcb-40a0-a963-c6d1887c4e4e@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 7 Nov 2024 14:54:14 +0800
Message-ID: <CAHJ8P3JARkFxkyz-FLWN2PSZb2AL3=dSqF1v-SR-oU9z6tm+Rg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月7日周四 14:18写道： > > On 2024/11/6
    16:41, Zhiguo Niu wrote: > > Chao Yu 于2024年11月6日周三 15:40写道：
    > >> > >> On 2024/11/6 14:08, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.128.53 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t8wPY-00010o-M7
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg35pel5ZGo5ZubIDE0OjE4
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzYgMTY6NDEsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTU6NDDl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvNiAxNDowOCwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJ
IDEwOjQw5YaZ6YGT77yaCj4gPj4+Pgo+ID4+Pj4gT24gMjAyNC8xMS82IDEwOjI2LCBaaGlndW8g
Tml1IHdyb3RlOgo+ID4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx
5pyINuaXpeWRqOS4iSAxMDoxNuWGmemBk++8mgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAyMDI0LzEx
LzUgMTk6MDIsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IOS6jjIwMjTlubQxMeaciDXml6XlkajkuowgMTg6MznlhpnpgZPvvJoKPiA+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+IE9uIDIwMjQvMTEvNSAxNToyOCwgWmhpZ3VvIE5pdSB3cm90ZToKPiA+Pj4+
Pj4+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg15pel5ZGo5LqM
IDE1OjA05YaZ6YGT77yaCj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gT24gMjAyNC8xMS80IDk6
NTYsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+Pj4+Pj4+Pj4gSWYgdXNlciBnaXZlIGEgZmlsZSBz
aXplIGFzICJsZW5ndGgiIHBhcmFtZXRlciBmb3IgZmllbWFwCj4gPj4+Pj4+Pj4+Pj4gb3BlcmF0
aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxvY2sgc2l6ZSBhbGlnbmVkLAo+ID4+Pj4+
Pj4+Pj4+IGl0IHdpbGwgc2hvdyAyIHNlZ21lbnRzIGZpZW1hcCByZXN1bHRzIGV2ZW4gdGhpcyB3
aG9sZSBmaWxlCj4gPj4+Pj4+Pj4+Pj4gaXMgY29udGlndW91cyBvbiBkaXNrLCBzdWNoIGFzIHRo
ZSBmb2xsb3dpbmcgcmVzdWx0czoKPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+ICAgICAgICAu
L2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4+Pj4+IEZp
ZW1hcDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+ID4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgICAg
bG9naWNhbCBhZGRyLiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MK
PiA+Pj4+Pj4+Pj4+PiAwICAgICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAwMDAyMGJhYTAwMCAw
MDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4gPj4+Pj4+Pj4+Pj4gMSAgICAgICAwMDAwMDAwMDAw
MDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+ID4+Pj4+
Pj4+Pj4+Cj4gPj4+Pj4+Pj4+Pj4gYWZ0ZXIgdGhpcyBwYXRjaDoKPiA+Pj4+Pj4+Pj4+PiAuL2Yy
ZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4+Pj4+IEZpZW1h
cDogb2Zmc2V0ID0gMCBsZW4gPSAxOTAzNAo+ID4+Pj4+Pj4+Pj4+ICAgICAgICAgICBsb2dpY2Fs
IGFkZHIuICAgIHBoeXNpY2FsIGFkZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4+Pj4+
Pj4+Pj4+IDAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDMxNWYzMDAwIDAwMDAwMDAwMDAw
MDUwMDAgMDAwMDEwMDEKPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+IFNpZ25lZC1vZmYtYnk6
IFpoaWd1byBOaXUgPHpoaWd1by5uaXVAdW5pc29jLmNvbT4KPiA+Pj4+Pj4+Pj4+PiAtLS0KPiA+
Pj4+Pj4+Pj4+PiBWMjogY29ycmVjdCBjb21taXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVl
c3Rpb25zCj4gPj4+Pj4+Pj4+Pj4gZjJmc19pbyBoYXMgYmVlbiBtb2RpZmllZCBmb3IgdGVzdGlu
ZywgdGhlIGxlbmd0aCBmb3IgZmllbWFwIGlzCj4gPj4+Pj4+Pj4+Pj4gcmVhbCBmaWxlIHNpemUs
IG5vdCBibG9jayBudW1iZXIKPiA+Pj4+Pj4+Pj4+PiAtLS0KPiA+Pj4+Pj4+Pj4+PiAgICAgICAg
ZnMvZjJmcy9kYXRhLmMgfCA0ICsrLS0KPiA+Pj4+Pj4+Pj4+PiAgICAgICAgMSBmaWxlIGNoYW5n
ZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4gPj4+
Pj4+Pj4+Pj4gaW5kZXggMzA2Yjg2YjAuLjlmYzIyOWQgMTAwNjQ0Cj4gPj4+Pj4+Pj4+Pj4gLS0t
IGEvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+Pj4+Pj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+ID4+
Pj4+Pj4+Pj4+IEBAIC0xOTY2LDggKzE5NjYsOCBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlu
b2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+Pj4+Pj4+
Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+Pj4+Pj4+Pj4+PiAg
ICAgICAgICAgIH0KPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4+IC0gICAgIGlmIChieXRlc190
b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4gPj4+Pj4+Pj4+Pj4gLSAgICAgICAgICAgICBsZW4g
PSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pj4+Pj4+PiArICAgICBpZiAobGVuICYg
KGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpIC0gMSkpCj4gPj4+Pj4+Pj4+Pj4gKyAgICAgICAgICAg
ICBsZW4gPSByb3VuZF91cChsZW4sIGJsa3NfdG9fYnl0ZXMoaW5vZGUsIDEpKTsKPiA+Pj4+Pj4+
Pj4+Cj4gPj4+Pj4+Pj4+PiBIb3cgZG8geW91IHRoaW5rIG9mIGdldHRpbmcgcmlkIG9mIGFib3Zl
IGFsaWdubWVudCBmb3IgbGVuPwo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+
Pj4+ICAgICAgICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+
ID4+Pj4+Pj4+Pj4+ICAgICAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBz
dGFydCArIGxlbiAtIDEpOwo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4+IEFuZCByb3VuZCB1cCBl
bmQgcG9zaXRpb24gdy86Cj4gPj4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pj4gbGFzdF9ibGsgPSBieXRl
c190b19ibGtzKGlub2RlLCByb3VuZF91cChzdGFydCArIGxlbiAtIDEsIEYyRlNfQkxLU0laRSkp
Owo+ID4+Pj4+Pj4+PiBIaSBDaGFvLAo+ID4+Pj4+Pj4+PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFu
Z2UgdGhlIGN1cnJlbnQgY29kZSBsb2dpYwo+ID4+Pj4+Pj4+PiAtLS0tLS0tLS0tLS0tCj4gPj4+
Pj4+Pj4+IGlmIChzdGFydF9ibGsgPiBsYXN0X2JsaykKPiA+Pj4+Pj4+Pj4gICAgICAgICAgZ290
byBvdXQ7Cj4gPj4+Pj4+Pj4+IC0tLS0tLS0tLS0tLS0KPiA+Pj4+Pj4+Pj4gZm9yIGV4YW1wbGUs
IGEgZmlsZSB3aXRoIHNpemUgMTkwMDYsIGJ1dCB0aGUgbGVuZ3RoIGZyb20gdGhlIHVzZXIgaXMg
MTYzODQuCj4gPj4+Pj4+Pj4+IGJlZm9yZSB0aGlzIG1vZGlmaWNhdGlvbiwgIGxhc3RfYmxrID0g
IGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHN0YXJ0ICsKPiA+Pj4+Pj4+Pj4gbGVuIC0gMSkgPSAoaW5v
ZGUsIDE2MzgzKSA9IDMKPiA+Pj4+Pj4+Pj4gYWZ0ZXIgdGhlIGZpcnN0IGYyZnNfbWFwX2Jsb2Nr
cygpLiBzdGFydF9ibGsgY2hhbmdlIHRvIGJlIDQsCj4gPj4+Pj4+Pj4+IGFmdGVyIHRoZSBzZWNv
bmQgZjJmc19tYXBfYmxvY2tzKCksIGZpZW1hcF9maWxsX25leF9leHRlbiB3aWxsIGJlCj4gPj4+
Pj4+Pj4+IGNhbGxlZCB0byBmaWxsIHVzZXIgcGFyYW1ldGVyIGFuZCB0aGVuCj4gPj4+Pj4+Pj4+
IHdpbGwgZ290byBvdXQgYmVjYXVzZSBzdGFydF9ibGsgPiBsYXN0X2JsaywgdGhlbiBmaWVtYXAg
ZmxvdyBmaW5pc2hlcy4KPiA+Pj4+Pj4+Pj4gYnV0IGFmdGVyIHRoaXMgbW9kaWZpY2F0aW9uLCBs
YXN0X2JsayB3aWxsIGJlIDQKPiA+Pj4+Pj4+Pj4gd2lsbCBkbyBmMmZzX21hcF9ibG9ja3MoKSB1
bnRpbCByZWFjaCB0aGUgbWF4X2ZpbGVfYmxvY2tzKGlub2RlKQo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+
Pj4gWWVzLCB5b3UncmUgcmlnaHQsIGhvd2V2ZXIsIHcvIHRoaXMgcGF0Y2gsIGl0IG1heSBjaGFu
Z2UgbGFzdF9ibGssIGUuZy4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IHhmc19pbyBmaWxlIC1jICJm
aWVtYXAgLXYgMCAxOTAwNiIgdnMgeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAyIDE5MDA2Igo+
ID4+Pj4+Pj4+IHN0YXJ0X2JsayBhbmQgbGFzdF9ibGsgd2lsbCBiZTogMCwgNCBhbmQgMCwgNS4K
PiA+Pj4+Pj4+IEhpIENoYW8sCj4gPj4+Pj4+PiB5ZXMsIGJ1dCB3L28gdGhpcyBwYXRjaCAsIHRo
ZSBvcmlnaW5hbCBjb2RlIHN0aWxsIGhhcyB0aGUgc2FtZSBzaXR1YXRpb24/Pwo+ID4+Pj4+Pj4g
Zm9yIGV4YW1wbGUKPiA+Pj4+Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIg
dnMgeGZzX2lvIGZpbGUgLWMgImZpZW1hcCAtdiAyIDE2Mzg0Igo+ID4+Pj4+Pj4gc3RhcnRfYmxr
IGFuZCBsYXN0X2JsayB3aWxsIGJlOiAwLCAzIGFuZCAwLCA0Lgo+ID4+Pj4+Pgo+ID4+Pj4+PiBG
b3IgdGhlIGNhc2UgImZpZW1hcCAtdiAyIDE5MDA2Iiwgb2Zmc2V0IGlzIDIsIGFuZCBsZW5ndGgg
aXMgMTkwMDYsIHNvIGxhc3Rfb2Zmc2V0Cj4gPj4+Pj4+IGlzIDE5MDA4LCBhbmQgbGFzdF9ibGsg
c2hvdWxkIGJlIDQgcmF0aGVyIHRoYW4gNSwgcmlnaHQ/Cj4gPj4+Pj4gaGkgQ2hhbywKPiA+Pj4+
PiBpdCBpcyByaWdodCB3L28gbXkgcGF0Y2guCj4gPj4+Pj4+Cj4gPj4+Pj4+IEFuZCBmb3IgeW91
IGNhc2UsIGl0IGNhbGN1bGF0ZXMgbGFzdF9ibGsgY29ycmVjdGx5Lgo+ID4+Pj4+IFNvIHlvdSBz
dWdnZXN0IHRoYXQgIlNob3VsZCB3ZSByb3VuZF91cCBsZW4gYWZ0ZXIgc3RhcnRfYmxrICYgbGFz
dF9ibGsKPiA+Pj4+PiBjYWxjdWxhdGlvbj8iCj4gPj4+Pgo+ID4+Pj4gWmhpZ3VvLAo+ID4+Pj4K
PiA+Pj4+IFllcywgSSB0aGluayBhbGlnbm1lbnQgb2YgbGVuIHNob3VsZCBub3QgYWZmZWN0IGNh
bGN1bGF0aW9uIG9mIGxhc3RfYmxrLgo+ID4+Pj4KPiA+Pj4+IEkgbWVhbiB0aGlzLAo+ID4+Pj4K
PiA+Pj4+IC0tLQo+ID4+Pj4gICAgIGZzL2YyZnMvZGF0YS5jICAgICAgICAgIHwgNiArKystLS0K
PiA+Pj4+ICAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4gPj4+PiAgICAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4+Pgo+ID4+
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+IGlu
ZGV4IDdkMWJiOTUxOGE0MC4uY2JiYjk1NmY0MjBkIDEwMDY0NAo+ID4+Pj4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMKPiA+Pj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPj4+PiBAQCAtMTk2NywxMiAr
MTk2NywxMiBAQCBpbnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZp
ZW1hcF9leHRlbnRfaW5mbyAqZmllaW5mbywKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byBvdXQ7Cj4gPj4+PiAgICAgICAgICAgfQo+ID4+Pj4KPiA+Pj4+IC0gICAgICAgaWYg
KGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPiA+Pj4+IC0gICAgICAgICAgICAgICBs
ZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+IC0KPiA+Pj4+ICAgICAgICAgICBz
dGFydF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCk7Cj4gPj4+PiAgICAgICAgICAg
bGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+ID4+Pj4K
PiA+Pj4+ICsgICAgICAgaWYgKGxlbiAmIEYyRlNfQkxLU0laRV9NQVNLKQo+ID4+Pj4gKyAgICAg
ICAgICAgICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgRjJGU19CTEtTSVpFKTsKPiA+Pj4+ICsKPiA+
Pj4gSGkgQ2hhbywKPiA+Pj4gdGhpcyB2ZXJpb24gdmVyaWZ5IHBhc3Mgd2l0aCBteSB0ZXN0IGNh
c2UuCj4gPj4+Cj4gPj4+IGJ1dCB0aGVyZSBpcyBzdGlsbCBhbm90aGVyIGlzc3VlIGluIG9yZ2lu
YWwgY29kZToKPiA+Pj4geWxvZy9hbmFseXplci5weSAgc2l6ZSA9IDE5MDM0Cj4gPj4+IGlmIEkg
aW5wdXQgdGhlIGZvbGxvd2luZyBjbWQoc3RhcnQvbGVuZ3RoIGFyZSBib3RoIHJlYWwgc2l6ZSwg
bm90IGJsb2NrIG51bWJlcikKPiA+Pj4gL2YyZnNfaW8gZmllbWFwIDIgMTYzODQgeWxvZy9hbmFs
eXplci5weQo+ID4+PiBhbmQgdGhlIHJlc3VsdHMgc2hvd3M6Cj4gPj4+IEZpZW1hcDogb2Zmc2V0
ID0gMiBsZW4gPSAxNjM4NAo+ID4+PiAgICAgICBsb2dpY2FsIGFkZHIuICAgIHBoeXNpY2FsIGFk
ZHIuICAgbGVuZ3RoICAgICAgICAgICBmbGFncwo+ID4+PiAwICAgIDAwMDAwMDAwMDAwMDAwMDAg
MDAwMDAwMGUyZWJjYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4gPj4+IDEgICAgMDAw
MDAwMDAwMDAwNDAwMCAwMDAwMDAwZTJlYmNlMDAwIDAwMDAwMDAwMDAwMDEwMDAgMDAwMDEwMDEK
PiA+Pj4gc28gc3RhcnRfYmxrL2xhc3RfYmxrIHNob3VsZCBiZSBjYWxjdWxhdGUgaXQgaW4gdGhl
IGZvbGxvd2luZyB3YXk/Cj4gPj4KPiA+PiBJSVVDLCB0aGUgcm9vdCBjYXVzZSBpcyBmMmZzX21h
cF9ibG9ja3MoKSB3aWxsIHRydW5jYXRlIHNpemUgb2YKPiA+PiByZXR1cm5lZCBleHRlbnQgdG8g
RjJGU19CWVRFU19UT19CTEsobGVuKSwgc28gd2hlbmV2ZXIgcGFyYW1ldGVyCj4gPj4gQGxlbiBk
b2Vzbid0IGNvdmVyIGxhc3QgZXh0ZW50LCBpdCB0cmlnZ2VycyB0aGlzIGJ1Zy4KPiA+Pgo+ID4+
IG5leHQ6Cj4gPj4gICAgICAgICAgbWVtc2V0KCZtYXAsIDAsIHNpemVvZihtYXApKTsKPiA+PiAg
ICAgICAgICBtYXAubV9sYmxrID0gc3RhcnRfYmxrOwo+ID4+ICAgICAgICAgIG1hcC5tX2xlbiA9
IEYyRlNfQllURVNfVE9fQkxLKGxlbik7ICAtLS0gbGltaXQgbWF4IHNpemUgb2YgZXh0ZW50IGl0
IGZvdW5kcwo+ID4geWVzLCBJIHRoaW5rIHNvIHRvby4KPiA+PiAgICAgICAgICBtYXAubV9uZXh0
X3Bnb2ZzID0gJm5leHRfcGdvZnM7Cj4gPj4gICAgICAgICAgbWFwLm1fc2VnX3R5cGUgPSBOT19D
SEVDS19UWVBFOwo+ID4+IC4uLgo+ID4+ICAgICAgICAgIHJldCA9IGYyZnNfbWFwX2Jsb2Nrcyhp
bm9kZSwgJm1hcCwgRjJGU19HRVRfQkxPQ0tfRklFTUFQKTsKPiA+Pgo+ID4+IHhmc19pbyBmaWxl
IC1jICJmaWVtYXAgLXYgMiAxNjM4NCIKPiA+PiBmaWxlOgo+ID4+ICAgIEVYVDogRklMRS1PRkZT
RVQgICAgICBCTE9DSy1SQU5HRSAgICAgIFRPVEFMIEZMQUdTCj4gPj4gICAgICAwOiBbMC4uMzFd
OiAgICAgICAgIDEzOTI3Mi4uMTM5MzAzICAgICAgMzIgMHgxMDAwCj4gPj4gICAgICAxOiBbMzIu
LjM5XTogICAgICAgIDEzOTMwNC4uMTM5MzExICAgICAgIDggMHgxMDAxCj4gPj4geGZzX2lvIGZp
bGUgLWMgImZpZW1hcCAtdiAwIDE2Mzg0Igo+ID4+IGZpbGU6Cj4gPj4gICAgRVhUOiBGSUxFLU9G
RlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKPiA+PiAgICAgIDA6IFswLi4z
MV06ICAgICAgICAgMTM5MjcyLi4xMzkzMDMgICAgICAzMiAweDEwMDAKPiA+PiB4ZnNfaW8gZmls
ZSAtYyAiZmllbWFwIC12IDAgMTYzODUiCj4gPj4gZmlsZToKPiA+PiAgICBFWFQ6IEZJTEUtT0ZG
U0VUICAgICAgQkxPQ0stUkFOR0UgICAgICBUT1RBTCBGTEFHUwo+ID4+ICAgICAgMDogWzAuLjM5
XTogICAgICAgICAxMzkyNzIuLjEzOTMxMSAgICAgIDQwIDB4MTAwMQo+ID4KPiA+IEJ1dCAgSWYg
dGhlIGNvcnJlY3QgbGFzdF9ibGsgaXMgY2FsY3VsYXRlZCBjb3JyZWN0bHksIGZpZW1hcCBjYW4g
YmUKPiA+IGVuZGVkIGFzIHNvb24gYXMgcG9zc2libGU/ICBzbyB0aGUgcmVzdWx0cyBzaG93biBp
cyBhbHNvIHJpZ2h0Pwo+Cj4gWmhpZ3VvLAo+Cj4gSU1PLCBpdCdzIG5vdCwgZHVlIHRvIDEpIGlm
IHRoZSBleHRlbnQgaXMgbGFzdCBvbmUsIEZJRU1BUF9FWFRFTlRfTEFTVAo+IG11c3QgYmUgdGFn
Z2VkIHRvIG5vdGljZSB1c2VyIHRoYXQgaXQgZG9lc24ndCBuZWVkIGZ1cnRoZXIgZmllbWFwIG9u
Cj4gbGF0dGVyIExCQSwgMikgb25lIGNvbnRpbnVvdXMgZXh0ZW50IHNob3VsZCBub3QgYmUgc3Bs
aXQgdG8gdHdvLgo+Cj4gTGV0IG1lIGZpZ3VyZSBvdXQgYSBmaXggZm9yIHRoYXQuCkhpIENoYW8s
Ck9LLCB0aGFua3MgZm9yIHlvdXIgZXhwbGFpbmF0aW9uLgpidHcsIERvIEkgbmVlZCB0byB1cGRh
dGUgYSBwYXRjaCBhYm91dCB0aGUgb3JpZ2luYWwgaXNzdWUgd2UgZGlzc2N1c3NlZD8Kb3IgeW91
IHdpbGwgbW9kaWZ5IGl0IHRvZ2V0aGVyPwp0aGFua3MhCj4KPiBUaGFua3MsCj4KPiA+IHN1Y2gg
YXMgdGhpcyBzcGVjaWFsIGNhc2UgInhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxNjM4NCIg
d2UgZGlzY3Vzc2VkLgo+ID4gYnV0IGl0IGlzIGZpbmUgZm9yIG1lIHRvIGtlZXAgdGhlIGN1cnJl
bnQgY29kZXMuCj4gPiB0aGFua3MhCj4gPj4KPiA+PiBUaG91Z2h0cz8KPiA+Pgo+ID4+IFRoYW5r
cywKPiA+Pgo+ID4+PiBiZWZvcmU6Cj4gPj4+IHN0YXJ0X2JsayA9IGJ5dGVzX3RvX2Jsa3MoaW5v
ZGUsIHN0YXJ0KTsKPiA+Pj4gbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCAr
IGxlbiAtIDEpOwo+ID4+PiBhZnRlcjoKPiA+Pj4KPiA+Pj4gc3RhcnRfYmxrID0gYnl0ZXNfdG9f
Ymxrcyhpbm9kZSwgc3RhcnQpOwo+ID4+PiBsYXN0X2JsayA9IHN0YXJ0X2JsayArIGJ5dGVzX3Rv
X2Jsa3MoaW5vZGUsIGxlbiAtIDEpOwo+ID4+PiB0aGFua3MhCj4gPj4+PiAgICAgbmV4dDoKPiA+
Pj4+ICAgICAgICAgICBtZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1hcCkpOwo+ID4+Pj4gICAgICAg
ICAgIG1hcC5tX2xibGsgPSBzdGFydF9ibGs7Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9mMmZzX2ZzLmggYi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+ID4+Pj4gaW5kZXggYjBi
ODIxZWRmZDk3Li45NTRlOGU4MzQ0YjcgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9pbmNsdWRlL2xpbnV4
L2YyZnNfZnMuaAo+ID4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiA+Pj4+IEBA
IC0yNCwxMCArMjQsMTEgQEAKPiA+Pj4+ICAgICAjZGVmaW5lIE5FV19BRERSICAgICAgICAgICAg
ICAoKGJsb2NrX3QpLTEpICAgLyogdXNlZCBhcyBibG9ja190IGFkZHJlc3NlcyAqLwo+ID4+Pj4g
ICAgICNkZWZpbmUgQ09NUFJFU1NfQUREUiAgICAgICAgICgoYmxvY2tfdCktMikgICAvKiB1c2Vk
IGFzIGNvbXByZXNzZWQgZGF0YSBmbGFnICovCj4gPj4+Pgo+ID4+Pj4gKyNkZWZpbmUgRjJGU19C
TEtTSVpFX01BU0sgICAgICAgICAgICAgIChGMkZTX0JMS1NJWkUgLSAxKQo+ID4+Pj4gICAgICNk
ZWZpbmUgRjJGU19CWVRFU19UT19CTEsoYnl0ZXMpICAgICAgKChieXRlcykgPj4gRjJGU19CTEtT
SVpFX0JJVFMpCj4gPj4+PiAgICAgI2RlZmluZSBGMkZTX0JMS19UT19CWVRFUyhibGspICAgICAg
ICAgICAgICAgICgoYmxrKSA8PCBGMkZTX0JMS1NJWkVfQklUUykKPiA+Pj4+ICAgICAjZGVmaW5l
IEYyRlNfQkxLX0VORF9CWVRFUyhibGspICAgICAgICAgICAgICAgKEYyRlNfQkxLX1RPX0JZVEVT
KGJsayArIDEpIC0gMSkKPiA+Pj4+IC0jZGVmaW5lIEYyRlNfQkxLX0FMSUdOKHgpICAgICAgICAg
ICAgICAgICAgICAgIChGMkZTX0JZVEVTX1RPX0JMSygoeCkgKyBGMkZTX0JMS1NJWkUgLSAxKSkK
PiA+Pj4+ICsjZGVmaW5lIEYyRlNfQkxLX0FMSUdOKHgpICAgICAgICAgICAgICAoRjJGU19CWVRF
U19UT19CTEsoKHgpICsgRjJGU19CTEtTSVpFIC0gMSkpCj4gPj4+Pgo+ID4+Pj4gICAgIC8qIDAs
IDEobm9kZSBuaWQpLCAyKG1ldGEgbmlkKSBhcmUgcmVzZXJ2ZWQgbm9kZSBpZCAqLwo+ID4+Pj4g
ICAgICNkZWZpbmUgRjJGU19SRVNFUlZFRF9OT0RFX05VTSAgICAgICAgICAgICAgICAzCj4gPj4+
PiAtLQo+ID4+Pj4gMi40MC4xCj4gPj4+Pgo+ID4+Pj4KPiA+Pj4+Cj4gPj4+Pj4gVGhhbmtzCj4g
Pj4+Pj4+Cj4gPj4+Pj4+IFRoYW5rcywKPiA+Pj4+Pj4KPiA+Pj4+Pj4+IGJ1dCBvdmVyYWxsIGxh
c3RfYmxrIHdpbGwgY2hhbmdlIGxvb3AgY291bnRzIGJ1dCBoYXMgbm90IGFmZmVjdCBvbiB0aGUg
cmVzdWx0cy4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IFNob3VsZCB3ZSByb3VuZF91cCBsZW4gYWZ0
ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsgY2FsY3VsYXRpb24/Cj4gPj4+Pj4+PiBJIHRoaW5rcyBp
dCBpcyBvayAsYnV0IGp1c3QgYSBsaXR0bGUgYml0IHJlZHVuZGFudCB3aXRoIHRoZSBmb2xsb3dp
bmcKPiA+Pj4+Pj4+IGhhbmRsaW5nIGFib3V0IGxlbi4KPiA+Pj4+Pj4+Cj4gPj4+Pj4+PiBpZiAo
Ynl0ZXNfdG9fYmxrcyhpbm9kZSwgbGVuKSA9PSAwKQo+ID4+Pj4+Pj4gICAgICAgIGxlbiA9IGJs
a3NfdG9fYnl0ZXMoaW5vZGUsIDEpOwo+ID4+Pj4+Pj4KPiA+Pj4+Pj4+IEJhc2VkIG9uIHRoZSBh
Ym92ZSBzaXR1YXRpb24sCj4gPj4+Pj4+PiBkbyB5b3UgaGF2ZSBhbnkgb3RoZXIgZ29vZCBzdWdn
ZXN0aW9ucz8gXl4KPiA+Pj4+Pj4+IHRoYW5rcyEKPiA+Pj4+Pj4+Cj4gPj4+Pj4+Pj4KPiA+Pj4+
Pj4+PiBUaGFua3MsCj4gPj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gdGhhbmtz77yBCj4gPj4+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+Pj4gVGhhbmtzLAo+ID4+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pgo+
ID4+Pj4KPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlz
dGluZm8vbGludXgtZjJmcy1kZXZlbAo=
