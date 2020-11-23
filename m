Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFD42C1918
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Nov 2020 00:04:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1khKsW-0002Fd-Op; Mon, 23 Nov 2020 23:04:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1khKsV-0002FP-Ef
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 23:04:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WJDR7q4xZx9dSoLzieIGiWyC6I1HarpZQYL3DEjKNzY=; b=HUZ8sxVpc2fSrGkAs6yoK3k6Kp
 V0JiERaVGcpmlEJW5vyQZCDBPg6OXOojWSnutXXRteBFKJPga63xuhIb5QEKjc+jkGNnBvVrScaiz
 nCy3hFyvJsMAf68n0imLuuP6sshKNzX3xzt/I37mo0K1AwJGcZa4ueDP8RibBGwHCXRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WJDR7q4xZx9dSoLzieIGiWyC6I1HarpZQYL3DEjKNzY=; b=Pfay5KZLcaQRc0XDDYo+XMU9hX
 l57+37TI8kHb0ZdfhaE0FvBvzD6k4UPIjgvsHcj5emnXPxmR6G2LaocXew0uCZvfhCk/11JPp74CN
 gE0564zE2LUALXfjZQnvzhA2RAgT+IdAsX0RAhGPeZjPX1mohHrEZlIsx1uKrom5G/jI=;
Received: from mail-io1-f65.google.com ([209.85.166.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1khKsN-001DTc-Ns
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Nov 2020 23:04:11 +0000
Received: by mail-io1-f65.google.com with SMTP id r1so19893771iob.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Nov 2020 15:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WJDR7q4xZx9dSoLzieIGiWyC6I1HarpZQYL3DEjKNzY=;
 b=X9fPdSLiQwi3gnTRdk9SYUai8we5jG1eFdz6ooUJOj1os3Vv1+e82I21OisQ1flfLV
 /PSC0QnyL9vQMBlXEzXhI+ecs4zHHrjihBBp0n7Im3BebTkW3MEnYO0BS6perBRHHlcX
 zzpfHpwwC+QOYx4/3x5krzY1rA9yAJJt+I1fwx/fu0igbCk0TO8srvBfmIsJ1TnLGp0d
 vvT+v3np4CTh02gUfgHe1lmR/GNa3dUSD8o1VD0oregn6S2IS7YCtC6WSxxHDAql/Go2
 dD9N4HzvROaYPi6s0nppjGknGrnGH37Ok+9lBAXY2RdJlozPYOy0CAmHqCv7W1horwsc
 RIGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WJDR7q4xZx9dSoLzieIGiWyC6I1HarpZQYL3DEjKNzY=;
 b=khHoDj+HGesjxe9LDX6vYqOo+1o+kf0Cb/NA3TKXerjqGMO7NLjgRB9Qr/xqBm4+nu
 UZ/cZuI0QZPQsHISXvmswE5mdpBmCm+Iz/dZEE6Q4/CRPDb7WmWCw8tyMBxyg3xBfkv6
 IIbtqxiAPGQOk2lH5fFiCQ2DikMs8KcNhyfYGzWv/YLFvDczJDUDLfU+1PdX7AizmNL0
 WgZS429bNYPHPla1ZQcCzfoXjRdodJYT9jM0Y9Tg3ZFy4aqLE6rlL1DuctnYUsipJb9w
 Vt2uXxO6ulUgn3qzLsoYqmRlkfpgF7ItFIbYlLELUJvZH+skhFRsg2UUUq3pKDNt9IJ/
 85WA==
X-Gm-Message-State: AOAM532R+bZ3N+7BkbaZ83jzmAyBbJuneVPSWlzbsIDA+XUgHAZyOCyj
 RK/3mtTNw1lYxxtIw96vp4hSWzDCLbySAVGRA4M=
X-Google-Smtp-Source: ABdhPJzgcswkbY0gMNO8Q2hi6FpyLEqKmba7x60uymw9kr1D5eTLIDYdt/+//qV+YctOJWoHdTjNy1QiuyMvTnFyZjM=
X-Received: by 2002:a5d:8ad6:: with SMTP id e22mr1757787iot.154.1606172638121; 
 Mon, 23 Nov 2020 15:03:58 -0800 (PST)
MIME-Version: 1.0
References: <20201123031751.36811-1-daeho43@gmail.com>
 <20201123184647.GA3694916@gmail.com>
In-Reply-To: <20201123184647.GA3694916@gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 24 Nov 2020 08:03:47 +0900
Message-ID: <CACOAw_yCXj6UAgkAaggaDhPQ0B=y_6pKG54CFL4W8eWhjZA9+A@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.65 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1khKsN-001DTc-Ns
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: add compress_mode mount option
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SmFlZ2V1aywKCkdvdCBpdC4KCkVyaWMsCgpZZXAuCgoyMDIw64WEIDEx7JuUIDI07J28ICjtmZQp
IOyYpOyghCAzOjQ2LCBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+64uY7J20IOye
keyEsToKPgo+IE9uIE1vbiwgTm92IDIzLCAyMDIwIGF0IDEyOjE3OjUwUE0gKzA5MDAsIERhZWhv
IEplb25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNv
bT4KPiA+Cj4gPiBXZSB3aWxsIGFkZCBhIG5ldyAiY29tcHJlc3NfbW9kZSIgbW91bnQgb3B0aW9u
IHRvIGNvbnRyb2wgZmlsZQo+ID4gY29tcHJlc3Npb24gbW9kZS4gVGhpcyBzdXBwb3J0cyAiZnMt
YmFzZWQiIGFuZCAidXNlci1iYXNlZCIuCj4gPiBJbiAiZnMtYmFzZWQiIG1vZGUgKGRlZmF1bHQp
LCBmMmZzIGRvZXMgYXV0b21hdGljIGNvbXByZXNzaW9uIG9uCj4gPiB0aGUgY29tcHJlc3Npb24g
ZW5hYmxlZCBmaWxlcy4gSW4gInVzZXItYmFzZWQiIG1vZGUsIGYyZnMgZGlzYWJsZXMKPiA+IHRo
ZSBhdXRvbWFpYyBjb21wcmVzc2lvbiBhbmQgZ2l2ZXMgdGhlIHVzZXIgZGlzY3JldGlvbiBvZiBj
aG9vc2luZwo+ID4gdGhlIHRhcmdldCBmaWxlIGFuZCB0aGUgdGltaW5nLiBJdCBtZWFucyB0aGUg
dXNlciBjYW4gZG8gbWFudWFsCj4gPiBjb21wcmVzc2lvbi9kZWNvbXByZXNzaW9uIG9uIHRoZSBj
b21wcmVzc2lvbiBlbmFibGVkIGZpbGVzIHVzaW5nIGlvY3Rscy4KPiA+Cj4gPiBTaWduZWQtb2Zm
LWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgRG9j
dW1lbnRhdGlvbi9maWxlc3lzdGVtcy9mMmZzLnJzdCB8ICA3ICsrKysrKysKPiA+ICBmcy9mMmZz
L2RhdGEuYyAgICAgICAgICAgICAgICAgICAgIHwgMTAgKysrKystLS0tLQo+ID4gIGZzL2YyZnMv
ZjJmcy5oICAgICAgICAgICAgICAgICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysKPiA+ICBmcy9mMmZzL3NlZ21lbnQuYyAgICAgICAgICAgICAgICAgIHwgIDIgKy0KPiA+
ICBmcy9mMmZzL3N1cGVyLmMgICAgICAgICAgICAgICAgICAgIHwgMjMgKysrKysrKysrKysrKysr
KysrKysrKysKPiA+ICA1IGZpbGVzIGNoYW5nZWQsIDY2IGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJm
cy5yc3QgYi9Eb2N1bWVudGF0aW9uL2ZpbGVzeXN0ZW1zL2YyZnMucnN0Cj4gPiBpbmRleCBiOGVl
NzYxYzk5MjIuLjA2NzljNTNkNTAxMiAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50YXRpb24vZmls
ZXN5c3RlbXMvZjJmcy5yc3QKPiA+ICsrKyBiL0RvY3VtZW50YXRpb24vZmlsZXN5c3RlbXMvZjJm
cy5yc3QKPiA+IEBAIC0yNjAsNiArMjYwLDEzIEBAIGNvbXByZXNzX2V4dGVuc2lvbj0lcyAgICAg
U3VwcG9ydCBhZGRpbmcgc3BlY2lmaWVkIGV4dGVuc2lvbiwgc28gdGhhdCBmMmZzIGNhbiBlbmFi
Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgIEZvciBvdGhlciBmaWxlcywgd2UgY2FuIHN0aWxs
IGVuYWJsZSBjb21wcmVzc2lvbiB2aWEgaW9jdGwuCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
IE5vdGUgdGhhdCwgdGhlcmUgaXMgb25lIHJlc2VydmVkIHNwZWNpYWwgZXh0ZW5zaW9uICcqJywg
aXQKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgY2FuIGJlIHNldCB0byBlbmFibGUgY29tcHJl
c3Npb24gZm9yIGFsbCBmaWxlcy4KPiA+ICtjb21wcmVzc19tb2RlPSVzICAgICAgQ29udHJvbCBm
aWxlIGNvbXByZXNzaW9uIG1vZGUuIFRoaXMgc3VwcG9ydHMgImZzLWJhc2VkIiBhbmQKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgInVzZXItYmFzZWQiLiBJbiAiZnMtYmFzZWQiIG1vZGUgKGRl
ZmF1bHQpLCBmMmZzIGRvZXMKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgYXV0b21hdGljIGNv
bXByZXNzaW9uIG9uIHRoZSBjb21wcmVzc2lvbiBlbmFibGVkIGZpbGVzLgo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICBJbiAidXNlci1iYXNlZCIgbW9kZSwgZjJmcyBkaXNhYmxlcyB0aGUgYXV0
b21haWMgY29tcHJlc3Npb24KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgYW5kIGdpdmVzIHRo
ZSB1c2VyIGRpc2NyZXRpb24gb2YgY2hvb3NpbmcgdGhlIHRhcmdldCBmaWxlIGFuZAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICB0aGUgdGltaW5nLiBUaGUgdXNlciBjYW4gZG8gbWFudWFsIGNv
bXByZXNzaW9uL2RlY29tcHJlc3Npb24KPiA+ICsgICAgICAgICAgICAgICAgICAgICAgb24gdGhl
IGNvbXByZXNzaW9uIGVuYWJsZWQgZmlsZXMgdXNpbmcgaW9jdGxzLgo+Cj4gUGxlYXNlIGNsYXJp
ZnkgaW4gdGhlIGRvY3VtZW50YXRpb24gd2hhdCBpdCBtZWFucyBmb3IgY29tcHJlc3Npb24tZW5h
YmxlZCBmaWxlcwo+IHRvIG5vdCBiZSBjb21wcmVzc2VkLiAgSXQgaXMgbm90IG9idmlvdXMuCj4K
PiAtIEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
