Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA2F79BDD52
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 03:55:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8WCY-0002r2-48;
	Wed, 06 Nov 2024 02:55:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1t8WCW-0002qv-V4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:55:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NQes59cEa49vmeV0NTcJ/qoTjjiI386Lhz/kOgrslMk=; b=gGPVrZUemtwvwp1qbka6TQsFH2
 SshiYUsMUlKhW2is7b0YfwtEhVB8nHQV7s4s8PGiOb7uYiayA4lB1cR/pSIF76xaUErdea0ZjA+Qc
 WxEEkMMGOsDEeLEQwLMMn4ufHyyGtj6FNjSww3MBIedkMiJXVZZtaD8cTB4XuWT7Zta0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQes59cEa49vmeV0NTcJ/qoTjjiI386Lhz/kOgrslMk=; b=U0oEMAL7uW+mUUoY7DamBZeKg5
 Kzv552Og4cg7ChDUC1XSBKT61RrqP5HYMNLOOV00uly5qJt7ljP5ITiqz4Xss+iktLNZnN4vlK3qW
 O1OH+LRnX985JUXPO7U2tpGMJ0LUOMMh2w/rS4w2GPkAkh+gtq2xIBNvzWZ+1d1q/PMY=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8WCS-000335-6s for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:55:17 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-37d4eac48d8so501235f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Nov 2024 18:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730861705; x=1731466505; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NQes59cEa49vmeV0NTcJ/qoTjjiI386Lhz/kOgrslMk=;
 b=fu5CJruIHg/uSODVhe4ezh5Isj7sZ3ykk+RjOO4fO5mdxaFna5ePN4cEEKKC1h1tCI
 DkE99CyPAkSZD1f4Ji3UWOfKkSmZj7SLk6iZWzhWjE18hcpudZsjqSiqYvmmHh5OXfqn
 3sP/AnqPFm+YmZfAttK3DjyRcZ2FQbt0RSPBW9Pjs3t+RPwSF2gDFF5yvu+ilmcBBgvg
 u7ZhVcsLn0xqPu2KpzvQcTvA+MYcZFPBKn9zDExghoSBshu1ORpOoCpJJU8AxRe4GaiQ
 d8KVM7ZcALkB7iXS5zApulj+DxyHqzmqU+M9Xy28QwfrnStZJK/NzfFd3S8PBWFyLyUO
 bFpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730861705; x=1731466505;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NQes59cEa49vmeV0NTcJ/qoTjjiI386Lhz/kOgrslMk=;
 b=BEP3WX0msuCkjq13i16oqqTWq8bQEo7DCr9YFfg3op8UjectZOBiqkh6N6t9Nx92W8
 gk42NzPnx2an930B97gpw4qV+47RaBavuQ9ATy6JMscDGByuPevzuvcw9tQBNIYt1vbF
 2J2YN52BFk79h+W3CL1Ew96QTkESs/xJfiTA6PR6/1HDzl6bno96ZkvIWjMhtewke2jN
 T6PB+kj2WL418r2xwklJmItBAdJJKX5UGohz8G5f8J9ncursgFUJhheaOLluSNzEyVIP
 H/T/M6isG4JGHBDa+K8BJv5aWaEnPcnbMoGQv/jlgb4gjkN5UAq+QDY0JaZdOV7Hl+yI
 BA5g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+DeC6RkCW6uVHpjA5LwK5u1B2nCqnxaImlXS80YnQwZl9LWYkuOwrnOYQpmbTlp9iwJeNV5BT5P058qkPUaX/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxZL3BAXYVlXzaKHECN6it0HEIkLRxCnCSJfCoHT8+4twRyuY7Q
 0JNob1jVho0VeelcAewxbwtUW1x9hkmy3P4qbiIq8DV0ppWeZsBYHFH9S4zCQBeElf/SazKN1Xs
 mOWI5YvLa6U+h6jc0k7HJin7KAIs=
X-Google-Smtp-Source: AGHT+IF5iR3fBAtxKCM9mgA2N+0sTTGwrkNA6FBz/Fcg8Vby7Oqb1shJKFDArEzhVjogGckl7GAW/eTPglpLrsBMJg8=
X-Received: by 2002:a05:600c:4f0c:b0:431:4983:e8fe with SMTP id
 5b1f17b1804b1-4319ad41c64mr146298255e9.9.1730861704400; Tue, 05 Nov 2024
 18:55:04 -0800 (PST)
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
Date: Wed, 6 Nov 2024 10:54:53 +0800
Message-ID: <CAHJ8P3Jm1+BdGsHNB03tDug8JgEtxkM9A3BE9wectE_khGgDhQ@mail.gmail.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.46 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1t8WCS-000335-6s
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
RSk7Cj4gKwpIaSBDaGFvLApJdCBsb29rcyB3ZWxsIGFuZCBjbGVhciwgTGV0IG1lIHZlcmlmeSB0
aGlzLgphbm90aGVyIHVuaW1wb3J0YW50IHF1ZXN0aW9ucywgZG8gd2UgbmVlZCB0byB1c2UgbWFj
b3IKRjJGU19CTEtTSVpFX3h4eCBmb3Igcm91bmRfdXA/CmJlY2F1c2UgaW4gZmllbWFwLCBpdCBh
bGwgdXNlIGJ5dGVzX3RvX2Jsa3MoaW5vZGUsIHh4eCkgLwpibGtzX3RvX2J5dGVzKGlub2RlLCB4
eHgpCnRoYW5rcyEKPiAgIG5leHQ6Cj4gICAgICAgICBtZW1zZXQoJm1hcCwgMCwgc2l6ZW9mKG1h
cCkpOwo+ICAgICAgICAgbWFwLm1fbGJsayA9IHN0YXJ0X2JsazsKPiBkaWZmIC0tZ2l0IGEvaW5j
bHVkZS9saW51eC9mMmZzX2ZzLmggYi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+IGluZGV4IGIw
YjgyMWVkZmQ5Ny4uOTU0ZThlODM0NGI3IDEwMDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvZjJm
c19mcy5oCj4gKysrIGIvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiBAQCAtMjQsMTAgKzI0LDEx
IEBACj4gICAjZGVmaW5lIE5FV19BRERSICAgICAgICAgICAgICAoKGJsb2NrX3QpLTEpICAgLyog
dXNlZCBhcyBibG9ja190IGFkZHJlc3NlcyAqLwo+ICAgI2RlZmluZSBDT01QUkVTU19BRERSICAg
ICAgICAgKChibG9ja190KS0yKSAgIC8qIHVzZWQgYXMgY29tcHJlc3NlZCBkYXRhIGZsYWcgKi8K
Pgo+ICsjZGVmaW5lIEYyRlNfQkxLU0laRV9NQVNLICAgICAgICAgICAgICAoRjJGU19CTEtTSVpF
IC0gMSkKPiAgICNkZWZpbmUgRjJGU19CWVRFU19UT19CTEsoYnl0ZXMpICAgICAgKChieXRlcykg
Pj4gRjJGU19CTEtTSVpFX0JJVFMpCj4gICAjZGVmaW5lIEYyRlNfQkxLX1RPX0JZVEVTKGJsaykg
ICAgICAgICAgICAgICAgKChibGspIDw8IEYyRlNfQkxLU0laRV9CSVRTKQo+ICAgI2RlZmluZSBG
MkZTX0JMS19FTkRfQllURVMoYmxrKSAgICAgICAgICAgICAgIChGMkZTX0JMS19UT19CWVRFUyhi
bGsgKyAxKSAtIDEpCj4gLSNkZWZpbmUgRjJGU19CTEtfQUxJR04oeCkgICAgICAgICAgICAgICAg
ICAgICAgKEYyRlNfQllURVNfVE9fQkxLKCh4KSArIEYyRlNfQkxLU0laRSAtIDEpKQo+ICsjZGVm
aW5lIEYyRlNfQkxLX0FMSUdOKHgpICAgICAgICAgICAgICAoRjJGU19CWVRFU19UT19CTEsoKHgp
ICsgRjJGU19CTEtTSVpFIC0gMSkpCj4KPiAgIC8qIDAsIDEobm9kZSBuaWQpLCAyKG1ldGEgbmlk
KSBhcmUgcmVzZXJ2ZWQgbm9kZSBpZCAqLwo+ICAgI2RlZmluZSBGMkZTX1JFU0VSVkVEX05PREVf
TlVNICAgICAgICAgICAgICAgIDMKPiAtLQo+IDIuNDAuMQo+Cj4KPgo+ID4gVGhhbmtzCj4gPj4K
PiA+PiBUaGFua3MsCj4gPj4KPiA+Pj4gYnV0IG92ZXJhbGwgbGFzdF9ibGsgd2lsbCBjaGFuZ2Ug
bG9vcCBjb3VudHMgYnV0IGhhcyBub3QgYWZmZWN0IG9uIHRoZSByZXN1bHRzLgo+ID4+Pj4KPiA+
Pj4+IFNob3VsZCB3ZSByb3VuZF91cCBsZW4gYWZ0ZXIgc3RhcnRfYmxrICYgbGFzdF9ibGsgY2Fs
Y3VsYXRpb24/Cj4gPj4+IEkgdGhpbmtzIGl0IGlzIG9rICxidXQganVzdCBhIGxpdHRsZSBiaXQg
cmVkdW5kYW50IHdpdGggdGhlIGZvbGxvd2luZwo+ID4+PiBoYW5kbGluZyBhYm91dCBsZW4uCj4g
Pj4+Cj4gPj4+IGlmIChieXRlc190b19ibGtzKGlub2RlLCBsZW4pID09IDApCj4gPj4+ICAgICAg
bGVuID0gYmxrc190b19ieXRlcyhpbm9kZSwgMSk7Cj4gPj4+Cj4gPj4+IEJhc2VkIG9uIHRoZSBh
Ym92ZSBzaXR1YXRpb24sCj4gPj4+IGRvIHlvdSBoYXZlIGFueSBvdGhlciBnb29kIHN1Z2dlc3Rp
b25zPyBeXgo+ID4+PiB0aGFua3MhCj4gPj4+Cj4gPj4+Pgo+ID4+Pj4gVGhhbmtzLAo+ID4+Pj4K
PiA+Pj4+PiB0aGFua3PvvIEKPiA+Pj4+Pj4KPiA+Pj4+Pj4gVGhhbmtzLAo+ID4+Pj4+Pgo+ID4+
Pj4KPiA+Pgo+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
