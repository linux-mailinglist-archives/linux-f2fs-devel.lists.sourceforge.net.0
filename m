Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C854C9C2D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Mar 2022 04:32:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPFjG-0004Wc-BB; Wed, 02 Mar 2022 03:32:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nPFjE-0004WV-OX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 03:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5ZsmwPmVly2Iw/MIDcVTsM5XFmYyhdBXWuGIAcyfWzY=; b=BWEtlWLunV5VpdbShdbq1+0Wcr
 Ca844HnCIyK78VaBKK2QXCbMZBjJK925vIembHFYoOSdDSStIC1k+vY+JKDN272OsKgI9wNi2Sd/V
 e9ojBLZ1htB9vBJGci2zXpL9JxAf2Nj+8TAFfXo+fnKfqTqiWHVdSfuxTB9TfzKyXBEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5ZsmwPmVly2Iw/MIDcVTsM5XFmYyhdBXWuGIAcyfWzY=; b=a3oLLiYctVbWEkJ0UObi8JvGS5
 ZM5sLTWLrreo3adEHLoNZoYQAPCtUZ46g4dBGjcRxQFJXz20FVwA6wXwrU0OYx02o4RL64b5K4SNx
 OfC2FCTkcGIhnzPfsze7DEJ6eW0szVKqmTy9qUiVrRL1pgdidhAgfyzkFWgs/b1fbbJs=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPFjC-0020YN-Da
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 03:32:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 27554B81D71;
 Wed,  2 Mar 2022 03:32:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 744ACC340EE;
 Wed,  2 Mar 2022 03:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646191950;
 bh=tw2FLwUKv/LJosyP7l26hDKZUXqpREWG4hH9qMm6hVQ=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=HekcxkIT5USwEq4gDBMDMEHvLjLfpBwrolf7gAibCI46vKz0PpqfZOHrUcLfARs8c
 q5z1nFCueunfJa2qs2TFVeff/FFiRQm970lTHm5oaOl1p+GdNA2YVBPkyRAv7Jx6gS
 nYPRnPrkZQzr7YTaxIcyj3Vdo6EmPr5q8Kp5eKWG6ULadFpGX9G7z4M/e0uBsXEoHI
 W2PwNFe9eeREdY8oV/d4ujh54DpjXYa+GBZiXGpsWlImQ2vNU6L9E6qg7Yp2AhUkz2
 ltF0xoSQZssaAt2ztY4vBI/2hlzHDDeNKSdANoi/3PDStXpibyjRZFsU5/p4ZxU/bs
 fw4kh31K0RhJg==
Message-ID: <51826b5f-e480-994a-4a72-39ff4572bb3f@kernel.org>
Date: Wed, 2 Mar 2022 11:32:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.1
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220127054449.24711-1-chao@kernel.org>
 <YfMVxzdhat01ca7m@google.com>
 <e434b0a4-a66a-eebc-cafc-f0bad03c3fa5@kernel.org>
 <YfSMMpj2GrYXAJK2@google.com>
 <51be77f1-6e85-d46d-d0d3-c06d2055a190@kernel.org>
 <Yfs1KRgwgzSOvocR@google.com>
 <86a175d3-c438-505b-1dbc-4ef6e8b5adcb@kernel.org>
 <5b5e20d1-877f-b321-b341-c0f233ee976c@kernel.org>
In-Reply-To: <5b5e20d1-877f-b321-b341-c0f233ee976c@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  ping, On 2022/2/25 11:02, Chao Yu wrote: > On 2022/2/3 22:57,
 Chao Yu wrote: >> On 2022/2/3 9:51, Jaegeuk Kim wrote: >>> On 01/29, Chao
 Yu wrote: >>>> On 2022/1/29 8:37, Jaegeuk Kim wrote: >>>>> On 01/28, C [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPFjC-0020YN-Da
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: linux-kernel@vger.kernel.org, Jing Xia <jing.xia@unisoc.com>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

cGluZywKCk9uIDIwMjIvMi8yNSAxMTowMiwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIyLzIvMyAy
Mjo1NywgQ2hhbyBZdSB3cm90ZToKPj4gT24gMjAyMi8yLzMgOTo1MSwgSmFlZ2V1ayBLaW0gd3Jv
dGU6Cj4+PiBPbiAwMS8yOSwgQ2hhbyBZdSB3cm90ZToKPj4+PiBPbiAyMDIyLzEvMjkgODozNywg
SmFlZ2V1ayBLaW0gd3JvdGU6Cj4+Pj4+IE9uIDAxLzI4LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4g
T24gMjAyMi8xLzI4IDU6NTksIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+Pj4+IE9uIDAxLzI3LCBD
aGFvIFl1IHdyb3RlOgo+Pj4+Pj4+PiBRdW90ZWQgZnJvbSBKaW5nIFhpYSdzIHJlcG9ydCwgdGhl
cmUgaXMgYSBwb3RlbnRpYWwgZGVhZGxvY2sgbWF5IGhhcHBlbgo+Pj4+Pj4+PiBiZXR3ZWVuIGt3
b3JrZXIgYW5kIGNoZWNrcG9pbnQgYXMgYmVsb3c6Cj4+Pj4+Pj4+Cj4+Pj4+Pj4+IFtUOndyaXRl
YmFja13CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgW1Q6Y2hlY2twb2ludF0KPj4+Pj4+
Pj4gLSB3Yl93cml0ZWJhY2sKPj4+Pj4+Pj4gwqDCoMKgIC0gYmxrX3N0YXJ0X3BsdWcKPj4+Pj4+
Pj4gYmlvIGNvbnRhaW5zIE5vZGVBIHdhcyBwbHVnZ2VkIGluIHdyaXRlYmFjayB0aHJlYWRzCj4+
Pj4+Pj4KPj4+Pj4+PiBJJ20gc3RpbGwgdHJ5aW5nIHRvIHVuZGVyc3RhbmQgbW9yZSBwcmVjaXNl
bHkuIFNvLCBob3cgaXMgaXQgcG9zc2libGUgdG8KPj4+Pj4+PiBoYXZlIGJpbyBoYXZpbmcgbm9k
ZSB3cml0ZSBpbiB0aGlzIGN1cnJlbnQgY29udGV4dD8KPj4+Pj4+Cj4+Pj4+PiBJTU8sIGFmdGVy
IGFib3ZlIGJsa19zdGFydF9wbHVnKCksIGl0IG1heSBwbHVnIHNvbWUgaW5vZGUncyBub2RlIHBh
Z2UgaW4ga3dvcmtlcgo+Pj4+Pj4gZHVyaW5nIHdyaXRlYmFja2luZyBub2RlX2lub2RlJ3MgZGF0
YSBwYWdlICh3aGljaCBzaG91bGQgYmUgbm9kZSBwYWdlKT8KPj4+Pj4KPj4+Pj4gV2Fzbid0IHRo
YXQgYWRkZWQgaW50byBhIGRpZmZlcmVudCB0YXNrLT5wbHVnPwo+Pj4+Cj4+Pj4gSSdtIG5vdCBz
dXJlIEkndmUgZ290IHlvdXIgY29uY2VybiBjb3JyZWN0bHkuLi4KPj4+Pgo+Pj4+IERvIHlvdSBt
ZWFuIE5vZGVBIGFuZCBvdGhlciBJT3MgZnJvbSBkb193cml0ZXBhZ2VzKCkgd2VyZSBwbHVnZ2Vk
IGluCj4+Pj4gZGlmZmVyZW50IGxvY2FsIHBsdWcgdmFyaWFibGVzPwo+Pj4KPj4+IEkgdGhpbmsg
c28uCj4+Cj4+IEkgZ3Vlc3MgYmxvY2sgcGx1ZyBoZWxwZXIgc2F5cyBpdCBkb2Vzbid0IGFsbG93
IHRvIHVzZSBuZXN0ZWQgcGx1Zywgc28gdGhlcmUKPj4gaXMgb25seSBvbmUgcGx1ZyBpbiBrd29y
a2VyIHRocmVhZD8KPj4KPj4gdm9pZCBibGtfc3RhcnRfcGx1Z19ucl9pb3Moc3RydWN0IGJsa19w
bHVnICpwbHVnLCB1bnNpZ25lZCBzaG9ydCBucl9pb3MpCj4+IHsKPj4gwqDCoMKgwqDCoHN0cnVj
dCB0YXNrX3N0cnVjdCAqdHNrID0gY3VycmVudDsKPj4KPj4gwqDCoMKgwqDCoC8qCj4+IMKgwqDC
oMKgwqAgKiBJZiB0aGlzIGlzIGEgbmVzdGVkIHBsdWcsIGRvbid0IGFjdHVhbGx5IGFzc2lnbiBp
dC4KPj4gwqDCoMKgwqDCoCAqLwo+PiDCoMKgwqDCoMKgaWYgKHRzay0+cGx1ZykKPj4gwqDCoMKg
wqDCoMKgwqDCoCByZXR1cm47Cj4+IC4uLgo+PiB9Cj4gCj4gQW55IGZ1cnRoZXIgY29tbWVudHM/
Cj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+
Pj4+Cj4+Pj4+Cj4+Pj4+Pgo+Pj4+Pj4gVGhhbmtzLAo+Pj4+Pj4KPj4+Pj4+Pgo+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGRvX3dyaXRlcGFnZXPCoCAt
LSBzeW5jIHdyaXRlIGlub2RlQiwgaW5jIHdiX3N5bmNfcmVxW0RBVEFdCj4+Pj4+Pj4+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLSBmMmZzX3dyaXRlX2RhdGFfcGFn
ZXMKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0g
ZjJmc193cml0ZV9zaW5nbGVfZGF0YV9wYWdlIC0tIHdyaXRlIGxhc3QgZGlydHkgcGFnZQo+Pj4+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNf
ZG9fd3JpdGVfZGF0YV9wYWdlCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLSBzZXRfcGFnZV93cml0ZWJhY2vCoCAtLSBjbGVhciBwYWdlIGRp
cnR5IGZsYWcgYW5kCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAgUEFHRUNBQ0hFX1RBR19ESVJUWSB0YWcgaW4gcmFkaXggdHJlZQo+Pj4+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gZjJmc19v
dXRwbGFjZV93cml0ZV9kYXRhCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNfdXBkYXRlX2RhdGFfYmxrYWRkcgo+Pj4+Pj4+PiDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAtIGYyZnNf
d2FpdF9vbl9wYWdlX3dyaXRlYmFjayAtLSB3YWl0IE5vZGVBIHRvIHdyaXRlYmFjayBoZXJlCj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC0gaW5v
ZGVfZGVjX2RpcnR5X3BhZ2VzCj4+Pj4+Pj4+IMKgwqDCoCAtIHdyaXRlYmFja19zYl9pbm9kZXMK
Pj4+Pj4+Pj4gwqDCoMKgwqAgLSB3cml0ZWJhY2tfc2luZ2xlX2lub2RlCj4+Pj4+Pj4+IMKgwqDC
oMKgwqAgLSBkb193cml0ZXBhZ2VzCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoCAtIGYyZnNfd3JpdGVf
ZGF0YV9wYWdlcyAtLSBza2lwIHdyaXRlcGFnZXMgZHVlIHRvIHdiX3N5bmNfcmVxW0RBVEFdCj4+
Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgIC0gd2JjLT5wYWdlc19za2lwcGVkICs9IGdldF9kaXJ0eV9w
YWdlcygpIC0tIFBBR0VDQUNIRV9UQUdfRElSVFkgaXMgbm90IHNldCBidXQgZ2V0X2RpcnR5X3Bh
Z2VzKCkgcmV0dXJucyBvbmUKPj4+Pj4+Pj4gwqDCoMKgwqAgLSByZXF1ZXVlX2lub2RlIC0tIHJl
cXVldWUgaW5vZGUgdG8gd2ItPmJfZGlydHkgcXVldWUgZHVlIHRvIG5vbi16ZXJvLnBhZ2VzX3Nr
aXBwZWQKPj4+Pj4+Pj4gwqDCoMKgIC0gYmxrX2ZpbmlzaF9wbHVnCj4+Pj4+Pj4+Cj4+Pj4+Pj4+
IExldCdzIHRyeSB0byBhdm9pZCBkZWFkbG9jayBjb25kaXRpb24gYnkgZm9yY2luZyB1bnBsdWdn
aW5nIHByZXZpb3VzIGJpbyB2aWEKPj4+Pj4+Pj4gYmxrX2ZpbmlzaF9wbHVnKGN1cnJlbnQtPnBs
dWcpIG9uY2Ugd2UndiBza2lwcGVkIHdyaXRlYmFjayBpbiB3cml0ZXBhZ2VzKCkKPj4+Pj4+Pj4g
ZHVlIHRvIHZhbGlkIHNiaS0+d2Jfc3luY19yZXFbREFUQS9OT0RFXS4KPj4+Pj4+Pj4KPj4+Pj4+
Pj4gRml4ZXM6IDY4N2RlN2YxMDEwYyAoImYyZnM6IGF2b2lkIElPIHNwbGl0IGR1ZSB0byBtaXhl
ZCBXQl9TWU5DX0FMTCBhbmQgV0JfU1lOQ19OT05FIikKPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
WmhpZ3VvIE5pdSA8emhpZ3VvLm5pdUB1bmlzb2MuY29tPgo+Pj4+Pj4+PiBTaWduZWQtb2ZmLWJ5
OiBKaW5nIFhpYSA8amluZy54aWFAdW5pc29jLmNvbT4KPj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pj4+Pj4+PiAtLS0KPj4+Pj4+Pj4gwqDCoMKgIGZz
L2YyZnMvZGF0YS5jIHwgNiArKysrKy0KPj4+Pj4+Pj4gwqDCoMKgIGZzL2YyZnMvbm9kZS5jIHwg
NiArKysrKy0KPj4+Pj4+Pj4gwqDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygr
KSwgMiBkZWxldGlvbnMoLSkKPj4+Pj4+Pj4KPj4+Pj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
ZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+Pj4gaW5kZXggNzZkNmZlN2IwYzhmLi45MzJh
NGM4MWFjYWYgMTAwNjQ0Cj4+Pj4+Pj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+ICsr
KyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+Pj4+IEBAIC0zMTc0LDggKzMxNzQsMTIgQEAgc3RhdGlj
IGludCBfX2YyZnNfd3JpdGVfZGF0YV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGlu
ZywKPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgLyogdG8gYXZvaWQgc3BsaXRpbmcgSU9zIGR1ZSB0
byBtaXhlZCBXQl9TWU5DX0FMTCBhbmQgV0JfU1lOQ19OT05FICovCj4+Pj4+Pj4+IMKgwqDCoMKg
wqDCoMKgIGlmICh3YmMtPnN5bmNfbW9kZSA9PSBXQl9TWU5DX0FMTCkKPj4+Pj4+Pj4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBhdG9taWNfaW5jKCZzYmktPndiX3N5bmNfcmVxW0RBVEFdKTsKPj4+
Pj4+Pj4gLcKgwqDCoCBlbHNlIGlmIChhdG9taWNfcmVhZCgmc2JpLT53Yl9zeW5jX3JlcVtEQVRB
XSkpCj4+Pj4+Pj4+ICvCoMKgwqAgZWxzZSBpZiAoYXRvbWljX3JlYWQoJnNiaS0+d2Jfc3luY19y
ZXFbREFUQV0pKSB7Cj4+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCAvKiB0byBhdm9pZCBwb3RlbnRp
YWwgZGVhZGxvY2sgKi8KPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChjdXJyZW50LT5wbHVn
KQo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBibGtfZmluaXNoX3BsdWcoY3VycmVu
dC0+cGx1Zyk7Cj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBza2lwX3dyaXRl
Owo+Pj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+Pj4gwqDCoMKgwqDCoMKgwqAgaWYgKF9fc2hvdWxk
X3NlcmlhbGl6ZV9pbyhpbm9kZSwgd2JjKSkgewo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIG11dGV4X2xvY2soJnNiaS0+d3JpdGVwYWdlcyk7Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9m
cy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4+Pj4+Pj4+IGluZGV4IDU1NmZjZDg0NTdm
My4uNjljNmJjYWY1YWFlIDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9mcy9mMmZzL25vZGUuYwo+Pj4+
Pj4+PiArKysgYi9mcy9mMmZzL25vZGUuYwo+Pj4+Pj4+PiBAQCAtMjEwNiw4ICsyMTA2LDEyIEBA
IHN0YXRpYyBpbnQgZjJmc193cml0ZV9ub2RlX3BhZ2VzKHN0cnVjdCBhZGRyZXNzX3NwYWNlICpt
YXBwaW5nLAo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDCoCBpZiAod2JjLT5zeW5jX21vZGUgPT0gV0Jf
U1lOQ19BTEwpCj4+Pj4+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgYXRvbWljX2luYygmc2Jp
LT53Yl9zeW5jX3JlcVtOT0RFXSk7Cj4+Pj4+Pj4+IC3CoMKgwqAgZWxzZSBpZiAoYXRvbWljX3Jl
YWQoJnNiaS0+d2Jfc3luY19yZXFbTk9ERV0pKQo+Pj4+Pj4+PiArwqDCoMKgIGVsc2UgaWYgKGF0
b21pY19yZWFkKCZzYmktPndiX3N5bmNfcmVxW05PREVdKSkgewo+Pj4+Pj4+PiArwqDCoMKgwqDC
oMKgwqAgLyogdG8gYXZvaWQgcG90ZW50aWFsIGRlYWRsb2NrICovCj4+Pj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBpZiAoY3VycmVudC0+cGx1ZykKPj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYmxrX2ZpbmlzaF9wbHVnKGN1cnJlbnQtPnBsdWcpOwo+Pj4+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGdvdG8gc2tpcF93cml0ZTsKPj4+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+Pj4+IMKg
wqDCoMKgwqDCoMKgIHRyYWNlX2YyZnNfd3JpdGVwYWdlcyhtYXBwaW5nLT5ob3N0LCB3YmMsIE5P
REUpOwo+Pj4+Pj4+PiAtLSAKPj4+Pj4+Pj4gMi4zMi4wCj4+Cj4+Cj4+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0
dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2
ZWwKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Xwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
