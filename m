Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC6C9BE132
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 09:41:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8bba-0001Gc-9p;
	Wed, 06 Nov 2024 08:41:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8bbX-0001GU-Ud
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 08:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYlK0RZ1uJdzqEWsrTNzfbcKQBFCx0AhJcbWF91rojs=; b=LgwWSInGKC6an8/dpcsiIAddqo
 7woEW8CWq5a9TYPDr6HnYUK7gsVZn+OnMi5PTAF/mXjkwdhKDhm1D/KCX9Ve2NEIK/qZ3VDDWKetc
 F91TX602ncHnTPBiMvCrbIyWO8HZcSvYq/4EmWu9TnGZyBZayVQrscOQ0XMoxbdDkwjs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UYlK0RZ1uJdzqEWsrTNzfbcKQBFCx0AhJcbWF91rojs=; b=Msf7coIQ9uQHCx8yktqBz++iTH
 T/Q707tfZrmK0Fs/y8gxblY20zx+3VuceAjyz2PFqI8y3BDga01C/U/OjCsy2ur7IRrM6pDFTBBm+
 IpV829A1y7VP5Z9j909pfia40LNz0aEVcB25zSQs8y8VZet3mKmsqIgserLuxl4w6Xw4=;
Received: from mail-wr1-f42.google.com ([209.85.221.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8bbW-0003sL-Fd for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 08:41:31 +0000
Received: by mail-wr1-f42.google.com with SMTP id
 ffacd0b85a97d-37ece998fe6so638260f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 06 Nov 2024 00:41:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730882479; x=1731487279; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UYlK0RZ1uJdzqEWsrTNzfbcKQBFCx0AhJcbWF91rojs=;
 b=B0SLINdzSw2kCDbWFxm0EIX1hxOaF0hwjV7hY/sPvyl/HWHWAQa8uVdEDJ9qBMvEQe
 jF0KVnH4Hvqlv9ISOuY3Bo1t1cqFwRno3rJ+s83yJroqAfCalknGY8VKkZLplxtIwhMK
 3BSgSwm2MadvYrUXd41zkMhZHWUjvPsqPu2Wkcgs2hn1A0zlYVGlpMXC6iYz3ihDPIvE
 paERIwoBeudoBe4Vqz9sWWEQYPZ2PSply449mmsauJlr1h011oEAl/2gdOPqw1B+XNqu
 HzlA/FqEKRkzFT5WQl1pRjnmF4S/eWgzmJVElji+hNFyjY9aS1iM+UAc1K7xnYO4lfZA
 3Pog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730882479; x=1731487279;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UYlK0RZ1uJdzqEWsrTNzfbcKQBFCx0AhJcbWF91rojs=;
 b=S+xgNTy9bjz8AwDOKbZVRvtiewbtOCNaeudM5IDRxtZbvnEgAoe+07JhN2yHqcUZ1h
 mxRcWgDv+LCqSzTTsq0YMQ9PTJLF9J5658SWW3gVKgT1wSDHNL2HWqaXlk+ynJpvNQH7
 J05khRM7TlLyfdFDkTBwDiO3yzpYiSephXpwYTsh2Dets3ChqOI9J/IfmCJdrTqINQal
 FLxlHrR0n/xV1OvnDY+XNcpLwSll6P+3ybzN0Z3NPo5ol2Rv+mc+6BRkvA2X1M5M/4nZ
 KnPeeqdKj/bMXEfHl0nB4bS9uofLdxmxfzKHG+0VD9UYCcp+7XFblt5+CioAvSgJW2bq
 yr+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHMEsA8UF/u0Sxp9xW3xKK7Fz7xgdZuLvyCUlayGRdGYgzOsh54ENMWb/+/kxv/N+2Oev0f35C+ofeAn8xuQqu@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxGMpej43C35Q8D+3S39NpxQZTbqur16JkaU8vGuWovr4Fr6Fea
 l4Li806yzRFX3MjCYVl1ryPs8+2RqYARG7+f3WPboxj0bDMsxti2zwJLO0X6Yy6Sy2LuZvTgDXo
 BtImHqCg8b3fdVCc6SYwZS2LPKqjxR0M1
X-Google-Smtp-Source: AGHT+IEGnvPPfpSYq+4dl4Y821vZGW4XVJU3ACpC06ThTPljGDT5X7HM/YmdUYuSN1/uEe6duCdlktHw6ZMxVA/L52M=
X-Received: by 2002:a05:6000:1fab:b0:37d:47a4:ec2b with SMTP id
 ffacd0b85a97d-3806121a2b6mr12687338f8f.11.1730882478538; Wed, 06 Nov 2024
 00:41:18 -0800 (PST)
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
In-Reply-To: <0a8f96da-302d-4d6c-9ab6-0b66a05cbcfd@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Wed, 6 Nov 2024 16:41:07 +0800
Message-ID: <CAHJ8P3JTY=DFQRMd0zNGy6a3Hdq1y045ri9QKM8NGn8bNhHJfA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu 于2024年11月6日周三 15:40写道： > > On 2024/11/6
    14:08, Zhiguo Niu wrote: > > Chao Yu 于2024年11月6日周三 10:40写道：
    > >> > >> On 2024/11/6 10:26, Zhiguo Niu wrote: > >> [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.42 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.42 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1t8bbW-0003sL-Fd
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

Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJIDE1OjQw
5YaZ6YGT77yaCj4KPiBPbiAyMDI0LzExLzYgMTQ6MDgsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPiBD
aGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+IOS6jjIwMjTlubQxMeaciDbml6XlkajkuIkgMTA6NDDl
hpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMTEvNiAxMDoyNiwgWmhpZ3VvIE5pdSB3cm90ZToK
PiA+Pj4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MTHmnIg25pel5ZGo5LiJ
IDEwOjE25YaZ6YGT77yaCj4gPj4+Pgo+ID4+Pj4gT24gMjAyNC8xMS81IDE5OjAyLCBaaGlndW8g
Tml1IHdyb3RlOgo+ID4+Pj4+IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g5LqOMjAyNOW5tDEx
5pyINeaXpeWRqOS6jCAxODozOeWGmemBk++8mgo+ID4+Pj4+Pgo+ID4+Pj4+PiBPbiAyMDI0LzEx
LzUgMTU6MjgsIFpoaWd1byBOaXUgd3JvdGU6Cj4gPj4+Pj4+PiBDaGFvIFl1IDxjaGFvQGtlcm5l
bC5vcmc+IOS6jjIwMjTlubQxMeaciDXml6XlkajkuowgMTU6MDTlhpnpgZPvvJoKPiA+Pj4+Pj4+
Pgo+ID4+Pj4+Pj4+IE9uIDIwMjQvMTEvNCA5OjU2LCBaaGlndW8gTml1IHdyb3RlOgo+ID4+Pj4+
Pj4+PiBJZiB1c2VyIGdpdmUgYSBmaWxlIHNpemUgYXMgImxlbmd0aCIgcGFyYW1ldGVyIGZvciBm
aWVtYXAKPiA+Pj4+Pj4+Pj4gb3BlcmF0aW9ucywgYnV0IGlmIHRoaXMgc2l6ZSBpcyBub24tYmxv
Y2sgc2l6ZSBhbGlnbmVkLAo+ID4+Pj4+Pj4+PiBpdCB3aWxsIHNob3cgMiBzZWdtZW50cyBmaWVt
YXAgcmVzdWx0cyBldmVuIHRoaXMgd2hvbGUgZmlsZQo+ID4+Pj4+Pj4+PiBpcyBjb250aWd1b3Vz
IG9uIGRpc2ssIHN1Y2ggYXMgdGhlIGZvbGxvd2luZyByZXN1bHRzOgo+ID4+Pj4+Pj4+Pgo+ID4+
Pj4+Pj4+PiAgICAgICAuL2YyZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+
ID4+Pj4+Pj4+PiBGaWVtYXA6IG9mZnNldCA9IDAgbGVuID0gMTkwMzQKPiA+Pj4+Pj4+Pj4gICAg
ICAgICAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4gICBsZW5ndGggICAgICAg
ICAgIGZsYWdzCj4gPj4+Pj4+Pj4+IDAgICAgICAgMDAwMDAwMDAwMDAwMDAwMCAwMDAwMDAwMDIw
YmFhMDAwIDAwMDAwMDAwMDAwMDQwMDAgMDAwMDEwMDAKPiA+Pj4+Pj4+Pj4gMSAgICAgICAwMDAw
MDAwMDAwMDA0MDAwIDAwMDAwMDAwMjBiYWUwMDAgMDAwMDAwMDAwMDAwMTAwMCAwMDAwMTAwMQo+
ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiBhZnRlciB0aGlzIHBhdGNoOgo+ID4+Pj4+Pj4+PiAuL2Yy
ZnNfaW8gZmllbWFwIDAgMTkwMzQgeWxvZy9hbmFseXplci5weQo+ID4+Pj4+Pj4+PiBGaWVtYXA6
IG9mZnNldCA9IDAgbGVuID0gMTkwMzQKPiA+Pj4+Pj4+Pj4gICAgICAgICAgbG9naWNhbCBhZGRy
LiAgICBwaHlzaWNhbCBhZGRyLiAgIGxlbmd0aCAgICAgICAgICAgZmxhZ3MKPiA+Pj4+Pj4+Pj4g
MCAgICAwMDAwMDAwMDAwMDAwMDAwIDAwMDAwMDAwMzE1ZjMwMDAgMDAwMDAwMDAwMDAwNTAwMCAw
MDAwMTAwMQo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBaaGlndW8gTml1
IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gPj4+Pj4+Pj4+IC0tLQo+ID4+Pj4+Pj4+PiBWMjog
Y29ycmVjdCBjb21taXQgbXNnIGFjY29yZGluZyB0byBDaGFvJ3MgcXVlc3Rpb25zCj4gPj4+Pj4+
Pj4+IGYyZnNfaW8gaGFzIGJlZW4gbW9kaWZpZWQgZm9yIHRlc3RpbmcsIHRoZSBsZW5ndGggZm9y
IGZpZW1hcCBpcwo+ID4+Pj4+Pj4+PiByZWFsIGZpbGUgc2l6ZSwgbm90IGJsb2NrIG51bWJlcgo+
ID4+Pj4+Pj4+PiAtLS0KPiA+Pj4+Pj4+Pj4gICAgICAgZnMvZjJmcy9kYXRhLmMgfCA0ICsrLS0K
PiA+Pj4+Pj4+Pj4gICAgICAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0
YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+Pj4+Pj4+Pj4gaW5kZXggMzA2Yjg2YjAuLjlmYzIyOWQg
MTAwNjQ0Cj4gPj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4gPj4+Pj4+Pj4+ICsrKyBi
L2ZzL2YyZnMvZGF0YS5jCj4gPj4+Pj4+Pj4+IEBAIC0xOTY2LDggKzE5NjYsOCBAQCBpbnQgZjJm
c19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRfaW5mbyAq
ZmllaW5mbywKPiA+Pj4+Pj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsK
PiA+Pj4+Pj4+Pj4gICAgICAgICAgIH0KPiA+Pj4+Pj4+Pj4KPiA+Pj4+Pj4+Pj4gLSAgICAgaWYg
KGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPiA+Pj4+Pj4+Pj4gLSAgICAgICAgICAg
ICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pj4+Pj4gKyAgICAgaWYgKGxl
biAmIChibGtzX3RvX2J5dGVzKGlub2RlLCAxKSAtIDEpKQo+ID4+Pj4+Pj4+PiArICAgICAgICAg
ICAgIGxlbiA9IHJvdW5kX3VwKGxlbiwgYmxrc190b19ieXRlcyhpbm9kZSwgMSkpOwo+ID4+Pj4+
Pj4+Cj4gPj4+Pj4+Pj4gSG93IGRvIHlvdSB0aGluayBvZiBnZXR0aW5nIHJpZCBvZiBhYm92ZSBh
bGlnbm1lbnQgZm9yIGxlbj8KPiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+PiAgICAg
ICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+ID4+Pj4+Pj4+
PiAgICAgICAgICAgbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAt
IDEpOwo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gQW5kIHJvdW5kIHVwIGVuZCBwb3NpdGlvbiB3LzoK
PiA+Pj4+Pj4+Pgo+ID4+Pj4+Pj4+IGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgcm91
bmRfdXAoc3RhcnQgKyBsZW4gLSAxLCBGMkZTX0JMS1NJWkUpKTsKPiA+Pj4+Pj4+IEhpIENoYW8s
Cj4gPj4+Pj4+PiBJIHRoaW5rIHRoaXMgd2lsbCBjaGFuZ2UgdGhlIGN1cnJlbnQgY29kZSBsb2dp
Ywo+ID4+Pj4+Pj4gLS0tLS0tLS0tLS0tLQo+ID4+Pj4+Pj4gaWYgKHN0YXJ0X2JsayA+IGxhc3Rf
YmxrKQo+ID4+Pj4+Pj4gICAgICAgICBnb3RvIG91dDsKPiA+Pj4+Pj4+IC0tLS0tLS0tLS0tLS0K
PiA+Pj4+Pj4+IGZvciBleGFtcGxlLCBhIGZpbGUgd2l0aCBzaXplIDE5MDA2LCBidXQgdGhlIGxl
bmd0aCBmcm9tIHRoZSB1c2VyIGlzIDE2Mzg0Lgo+ID4+Pj4+Pj4gYmVmb3JlIHRoaXMgbW9kaWZp
Y2F0aW9uLCAgbGFzdF9ibGsgPSAgYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQgKwo+ID4+Pj4+
Pj4gbGVuIC0gMSkgPSAoaW5vZGUsIDE2MzgzKSA9IDMKPiA+Pj4+Pj4+IGFmdGVyIHRoZSBmaXJz
dCBmMmZzX21hcF9ibG9ja3MoKS4gc3RhcnRfYmxrIGNoYW5nZSB0byBiZSA0LAo+ID4+Pj4+Pj4g
YWZ0ZXIgdGhlIHNlY29uZCBmMmZzX21hcF9ibG9ja3MoKSwgZmllbWFwX2ZpbGxfbmV4X2V4dGVu
IHdpbGwgYmUKPiA+Pj4+Pj4+IGNhbGxlZCB0byBmaWxsIHVzZXIgcGFyYW1ldGVyIGFuZCB0aGVu
Cj4gPj4+Pj4+PiB3aWxsIGdvdG8gb3V0IGJlY2F1c2Ugc3RhcnRfYmxrID4gbGFzdF9ibGssIHRo
ZW4gZmllbWFwIGZsb3cgZmluaXNoZXMuCj4gPj4+Pj4+PiBidXQgYWZ0ZXIgdGhpcyBtb2RpZmlj
YXRpb24sIGxhc3RfYmxrIHdpbGwgYmUgNAo+ID4+Pj4+Pj4gd2lsbCBkbyBmMmZzX21hcF9ibG9j
a3MoKSB1bnRpbCByZWFjaCB0aGUgbWF4X2ZpbGVfYmxvY2tzKGlub2RlKQo+ID4+Pj4+Pgo+ID4+
Pj4+PiBZZXMsIHlvdSdyZSByaWdodCwgaG93ZXZlciwgdy8gdGhpcyBwYXRjaCwgaXQgbWF5IGNo
YW5nZSBsYXN0X2JsaywgZS5nLgo+ID4+Pj4+Pgo+ID4+Pj4+PiB4ZnNfaW8gZmlsZSAtYyAiZmll
bWFwIC12IDAgMTkwMDYiIHZzIHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMiAxOTAwNiIKPiA+
Pj4+Pj4gc3RhcnRfYmxrIGFuZCBsYXN0X2JsayB3aWxsIGJlOiAwLCA0IGFuZCAwLCA1Lgo+ID4+
Pj4+IEhpIENoYW8sCj4gPj4+Pj4geWVzLCBidXQgdy9vIHRoaXMgcGF0Y2ggLCB0aGUgb3JpZ2lu
YWwgY29kZSBzdGlsbCBoYXMgdGhlIHNhbWUgc2l0dWF0aW9uPz8KPiA+Pj4+PiBmb3IgZXhhbXBs
ZQo+ID4+Pj4+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIgdnMgeGZzX2lvIGZp
bGUgLWMgImZpZW1hcCAtdiAyIDE2Mzg0Igo+ID4+Pj4+IHN0YXJ0X2JsayBhbmQgbGFzdF9ibGsg
d2lsbCBiZTogMCwgMyBhbmQgMCwgNC4KPiA+Pj4+Cj4gPj4+PiBGb3IgdGhlIGNhc2UgImZpZW1h
cCAtdiAyIDE5MDA2Iiwgb2Zmc2V0IGlzIDIsIGFuZCBsZW5ndGggaXMgMTkwMDYsIHNvIGxhc3Rf
b2Zmc2V0Cj4gPj4+PiBpcyAxOTAwOCwgYW5kIGxhc3RfYmxrIHNob3VsZCBiZSA0IHJhdGhlciB0
aGFuIDUsIHJpZ2h0Pwo+ID4+PiBoaSBDaGFvLAo+ID4+PiBpdCBpcyByaWdodCB3L28gbXkgcGF0
Y2guCj4gPj4+Pgo+ID4+Pj4gQW5kIGZvciB5b3UgY2FzZSwgaXQgY2FsY3VsYXRlcyBsYXN0X2Js
ayBjb3JyZWN0bHkuCj4gPj4+IFNvIHlvdSBzdWdnZXN0IHRoYXQgIlNob3VsZCB3ZSByb3VuZF91
cCBsZW4gYWZ0ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsKPiA+Pj4gY2FsY3VsYXRpb24/Igo+ID4+
Cj4gPj4gWmhpZ3VvLAo+ID4+Cj4gPj4gWWVzLCBJIHRoaW5rIGFsaWdubWVudCBvZiBsZW4gc2hv
dWxkIG5vdCBhZmZlY3QgY2FsY3VsYXRpb24gb2YgbGFzdF9ibGsuCj4gPj4KPiA+PiBJIG1lYW4g
dGhpcywKPiA+Pgo+ID4+IC0tLQo+ID4+ICAgIGZzL2YyZnMvZGF0YS5jICAgICAgICAgIHwgNiAr
KystLS0KPiA+PiAgICBpbmNsdWRlL2xpbnV4L2YyZnNfZnMuaCB8IDMgKystCj4gPj4gICAgMiBm
aWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBk
aWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+ID4+IGluZGV4IDdk
MWJiOTUxOGE0MC4uY2JiYjk1NmY0MjBkIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5j
Cj4gPj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiA+PiBAQCAtMTk2NywxMiArMTk2NywxMiBAQCBp
bnQgZjJmc19maWVtYXAoc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpZW1hcF9leHRlbnRf
aW5mbyAqZmllaW5mbywKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBvdXQ7Cj4g
Pj4gICAgICAgICAgfQo+ID4+Cj4gPj4gLSAgICAgICBpZiAoYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
bGVuKSA9PSAwKQo+ID4+IC0gICAgICAgICAgICAgICBsZW4gPSBibGtzX3RvX2J5dGVzKGlub2Rl
LCAxKTsKPiA+PiAtCj4gPj4gICAgICAgICAgc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9k
ZSwgc3RhcnQpOwo+ID4+ICAgICAgICAgIGxhc3RfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwg
c3RhcnQgKyBsZW4gLSAxKTsKPiA+Pgo+ID4+ICsgICAgICAgaWYgKGxlbiAmIEYyRlNfQkxLU0la
RV9NQVNLKQo+ID4+ICsgICAgICAgICAgICAgICBsZW4gPSByb3VuZF91cChsZW4sIEYyRlNfQkxL
U0laRSk7Cj4gPj4gKwo+ID4gSGkgQ2hhbywKPiA+IHRoaXMgdmVyaW9uIHZlcmlmeSBwYXNzIHdp
dGggbXkgdGVzdCBjYXNlLgo+ID4KPiA+IGJ1dCB0aGVyZSBpcyBzdGlsbCBhbm90aGVyIGlzc3Vl
IGluIG9yZ2luYWwgY29kZToKPiA+IHlsb2cvYW5hbHl6ZXIucHkgIHNpemUgPSAxOTAzNAo+ID4g
aWYgSSBpbnB1dCB0aGUgZm9sbG93aW5nIGNtZChzdGFydC9sZW5ndGggYXJlIGJvdGggcmVhbCBz
aXplLCBub3QgYmxvY2sgbnVtYmVyKQo+ID4gL2YyZnNfaW8gZmllbWFwIDIgMTYzODQgeWxvZy9h
bmFseXplci5weQo+ID4gYW5kIHRoZSByZXN1bHRzIHNob3dzOgo+ID4gRmllbWFwOiBvZmZzZXQg
PSAyIGxlbiA9IDE2Mzg0Cj4gPiAgICAgIGxvZ2ljYWwgYWRkci4gICAgcGh5c2ljYWwgYWRkci4g
ICBsZW5ndGggICAgICAgICAgIGZsYWdzCj4gPiAwICAgIDAwMDAwMDAwMDAwMDAwMDAgMDAwMDAw
MGUyZWJjYTAwMCAwMDAwMDAwMDAwMDA0MDAwIDAwMDAxMDAwCj4gPiAxICAgIDAwMDAwMDAwMDAw
MDQwMDAgMDAwMDAwMGUyZWJjZTAwMCAwMDAwMDAwMDAwMDAxMDAwIDAwMDAxMDAxCj4gPiBzbyBz
dGFydF9ibGsvbGFzdF9ibGsgc2hvdWxkIGJlIGNhbGN1bGF0ZSBpdCBpbiB0aGUgZm9sbG93aW5n
IHdheT8KPgo+IElJVUMsIHRoZSByb290IGNhdXNlIGlzIGYyZnNfbWFwX2Jsb2NrcygpIHdpbGwg
dHJ1bmNhdGUgc2l6ZSBvZgo+IHJldHVybmVkIGV4dGVudCB0byBGMkZTX0JZVEVTX1RPX0JMSyhs
ZW4pLCBzbyB3aGVuZXZlciBwYXJhbWV0ZXIKPiBAbGVuIGRvZXNuJ3QgY292ZXIgbGFzdCBleHRl
bnQsIGl0IHRyaWdnZXJzIHRoaXMgYnVnLgo+Cj4gbmV4dDoKPiAgICAgICAgIG1lbXNldCgmbWFw
LCAwLCBzaXplb2YobWFwKSk7Cj4gICAgICAgICBtYXAubV9sYmxrID0gc3RhcnRfYmxrOwo+ICAg
ICAgICAgbWFwLm1fbGVuID0gRjJGU19CWVRFU19UT19CTEsobGVuKTsgIC0tLSBsaW1pdCBtYXgg
c2l6ZSBvZiBleHRlbnQgaXQgZm91bmRzCnllcywgSSB0aGluayBzbyB0b28uCj4gICAgICAgICBt
YXAubV9uZXh0X3Bnb2ZzID0gJm5leHRfcGdvZnM7Cj4gICAgICAgICBtYXAubV9zZWdfdHlwZSA9
IE5PX0NIRUNLX1RZUEU7Cj4gLi4uCj4gICAgICAgICByZXQgPSBmMmZzX21hcF9ibG9ja3MoaW5v
ZGUsICZtYXAsIEYyRlNfR0VUX0JMT0NLX0ZJRU1BUCk7Cj4KPiB4ZnNfaW8gZmlsZSAtYyAiZmll
bWFwIC12IDIgMTYzODQiCj4gZmlsZToKPiAgIEVYVDogRklMRS1PRkZTRVQgICAgICBCTE9DSy1S
QU5HRSAgICAgIFRPVEFMIEZMQUdTCj4gICAgIDA6IFswLi4zMV06ICAgICAgICAgMTM5MjcyLi4x
MzkzMDMgICAgICAzMiAweDEwMDAKPiAgICAgMTogWzMyLi4zOV06ICAgICAgICAxMzkzMDQuLjEz
OTMxMSAgICAgICA4IDB4MTAwMQo+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NCIK
PiBmaWxlOgo+ICAgRVhUOiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwg
RkxBR1MKPiAgICAgMDogWzAuLjMxXTogICAgICAgICAxMzkyNzIuLjEzOTMwMyAgICAgIDMyIDB4
MTAwMAo+IHhmc19pbyBmaWxlIC1jICJmaWVtYXAgLXYgMCAxNjM4NSIKPiBmaWxlOgo+ICAgRVhU
OiBGSUxFLU9GRlNFVCAgICAgIEJMT0NLLVJBTkdFICAgICAgVE9UQUwgRkxBR1MKPiAgICAgMDog
WzAuLjM5XTogICAgICAgICAxMzkyNzIuLjEzOTMxMSAgICAgIDQwIDB4MTAwMQoKQnV0ICBJZiB0
aGUgY29ycmVjdCBsYXN0X2JsayBpcyBjYWxjdWxhdGVkIGNvcnJlY3RseSwgZmllbWFwIGNhbiBi
ZQplbmRlZCBhcyBzb29uIGFzIHBvc3NpYmxlPyAgc28gdGhlIHJlc3VsdHMgc2hvd24gaXMgYWxz
byByaWdodD8Kc3VjaCBhcyB0aGlzIHNwZWNpYWwgY2FzZSAieGZzX2lvIGZpbGUgLWMgImZpZW1h
cCAtdiAyIDE2Mzg0IiB3ZSBkaXNjdXNzZWQuCmJ1dCBpdCBpcyBmaW5lIGZvciBtZSB0byBrZWVw
IHRoZSBjdXJyZW50IGNvZGVzLgp0aGFua3MhCj4KPiBUaG91Z2h0cz8KPgo+IFRoYW5rcywKPgo+
ID4gYmVmb3JlOgo+ID4gc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+
ID4gbGFzdF9ibGsgPSBieXRlc190b19ibGtzKGlub2RlLCBzdGFydCArIGxlbiAtIDEpOwo+ID4g
YWZ0ZXI6Cj4gPgo+ID4gc3RhcnRfYmxrID0gYnl0ZXNfdG9fYmxrcyhpbm9kZSwgc3RhcnQpOwo+
ID4gbGFzdF9ibGsgPSBzdGFydF9ibGsgKyBieXRlc190b19ibGtzKGlub2RlLCBsZW4gLSAxKTsK
PiA+IHRoYW5rcyEKPiA+PiAgICBuZXh0Ogo+ID4+ICAgICAgICAgIG1lbXNldCgmbWFwLCAwLCBz
aXplb2YobWFwKSk7Cj4gPj4gICAgICAgICAgbWFwLm1fbGJsayA9IHN0YXJ0X2JsazsKPiA+PiBk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmggYi9pbmNsdWRlL2xpbnV4L2YyZnNf
ZnMuaAo+ID4+IGluZGV4IGIwYjgyMWVkZmQ5Ny4uOTU0ZThlODM0NGI3IDEwMDY0NAo+ID4+IC0t
LSBhL2luY2x1ZGUvbGludXgvZjJmc19mcy5oCj4gPj4gKysrIGIvaW5jbHVkZS9saW51eC9mMmZz
X2ZzLmgKPiA+PiBAQCAtMjQsMTAgKzI0LDExIEBACj4gPj4gICAgI2RlZmluZSBORVdfQUREUiAg
ICAgICAgICAgICAgKChibG9ja190KS0xKSAgIC8qIHVzZWQgYXMgYmxvY2tfdCBhZGRyZXNzZXMg
Ki8KPiA+PiAgICAjZGVmaW5lIENPTVBSRVNTX0FERFIgICAgICAgICAoKGJsb2NrX3QpLTIpICAg
LyogdXNlZCBhcyBjb21wcmVzc2VkIGRhdGEgZmxhZyAqLwo+ID4+Cj4gPj4gKyNkZWZpbmUgRjJG
U19CTEtTSVpFX01BU0sgICAgICAgICAgICAgIChGMkZTX0JMS1NJWkUgLSAxKQo+ID4+ICAgICNk
ZWZpbmUgRjJGU19CWVRFU19UT19CTEsoYnl0ZXMpICAgICAgKChieXRlcykgPj4gRjJGU19CTEtT
SVpFX0JJVFMpCj4gPj4gICAgI2RlZmluZSBGMkZTX0JMS19UT19CWVRFUyhibGspICAgICAgICAg
ICAgICAgICgoYmxrKSA8PCBGMkZTX0JMS1NJWkVfQklUUykKPiA+PiAgICAjZGVmaW5lIEYyRlNf
QkxLX0VORF9CWVRFUyhibGspICAgICAgICAgICAgICAgKEYyRlNfQkxLX1RPX0JZVEVTKGJsayAr
IDEpIC0gMSkKPiA+PiAtI2RlZmluZSBGMkZTX0JMS19BTElHTih4KSAgICAgICAgICAgICAgICAg
ICAgICAoRjJGU19CWVRFU19UT19CTEsoKHgpICsgRjJGU19CTEtTSVpFIC0gMSkpCj4gPj4gKyNk
ZWZpbmUgRjJGU19CTEtfQUxJR04oeCkgICAgICAgICAgICAgIChGMkZTX0JZVEVTX1RPX0JMSygo
eCkgKyBGMkZTX0JMS1NJWkUgLSAxKSkKPiA+Pgo+ID4+ICAgIC8qIDAsIDEobm9kZSBuaWQpLCAy
KG1ldGEgbmlkKSBhcmUgcmVzZXJ2ZWQgbm9kZSBpZCAqLwo+ID4+ICAgICNkZWZpbmUgRjJGU19S
RVNFUlZFRF9OT0RFX05VTSAgICAgICAgICAgICAgICAzCj4gPj4gLS0KPiA+PiAyLjQwLjEKPiA+
Pgo+ID4+Cj4gPj4KPiA+Pj4gVGhhbmtzCj4gPj4+Pgo+ID4+Pj4gVGhhbmtzLAo+ID4+Pj4KPiA+
Pj4+PiBidXQgb3ZlcmFsbCBsYXN0X2JsayB3aWxsIGNoYW5nZSBsb29wIGNvdW50cyBidXQgaGFz
IG5vdCBhZmZlY3Qgb24gdGhlIHJlc3VsdHMuCj4gPj4+Pj4+Cj4gPj4+Pj4+IFNob3VsZCB3ZSBy
b3VuZF91cCBsZW4gYWZ0ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsgY2FsY3VsYXRpb24/Cj4gPj4+
Pj4gSSB0aGlua3MgaXQgaXMgb2sgLGJ1dCBqdXN0IGEgbGl0dGxlIGJpdCByZWR1bmRhbnQgd2l0
aCB0aGUgZm9sbG93aW5nCj4gPj4+Pj4gaGFuZGxpbmcgYWJvdXQgbGVuLgo+ID4+Pj4+Cj4gPj4+
Pj4gaWYgKGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIGxlbikgPT0gMCkKPiA+Pj4+PiAgICAgICBsZW4g
PSBibGtzX3RvX2J5dGVzKGlub2RlLCAxKTsKPiA+Pj4+Pgo+ID4+Pj4+IEJhc2VkIG9uIHRoZSBh
Ym92ZSBzaXR1YXRpb24sCj4gPj4+Pj4gZG8geW91IGhhdmUgYW55IG90aGVyIGdvb2Qgc3VnZ2Vz
dGlvbnM/IF5eCj4gPj4+Pj4gdGhhbmtzIQo+ID4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pj4+IFRoYW5r
cywKPiA+Pj4+Pj4KPiA+Pj4+Pj4+IHRoYW5rc++8gQo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Pj4gVGhh
bmtzLAo+ID4+Pj4+Pj4+Cj4gPj4+Pj4+Cj4gPj4+Pgo+ID4+Cj4KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
