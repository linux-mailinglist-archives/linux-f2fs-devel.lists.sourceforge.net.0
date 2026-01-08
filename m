Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD59FD0671B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 08 Jan 2026 23:36:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xORMiMEFZqnZnvdece7dMUxFpLyqr8JD/XYRcwal0Rk=; b=Td9tYoJxlx8Jmdt78qqm8WxIab
	aEchM4aMxm1r/XJbbCdAbM37b9uyozgtqo4c4wUHK1Uv72XxDhHkFQJ322s/Ft4bbCVJIbmGXn/Sj
	y2Kefm2Q57EENbMaqxEcAwxksiFbi46ju3Xrg2GKeIH7l3j1m7asUNE5xqMU0/ZhdRp8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdybq-0003cB-5O;
	Thu, 08 Jan 2026 22:36:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <21cnbao@gmail.com>) id 1vdybn-0003bp-S3
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 22:36:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ev9qJpmrlELfTWb+vJg2DrJUm4rUbkMuo7sXN5zRlWM=; b=YB4BV0/UvYkLBsz7fJXYRvVgjK
 Ci508y1Tx1xTi/00u+0FpSy0ei1Maa7Jg6mPdF7s0e3aGGYcnZTh5kPZXQDpi4E3PT4S4IBvtbXTV
 aiAwSGCNKX4KAlN6awriCYFwLf60briRM66deSK568sZBN1ojns40EYw7Ah6GYlp++B4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ev9qJpmrlELfTWb+vJg2DrJUm4rUbkMuo7sXN5zRlWM=; b=UogINp9cOzVZM/PgFQQeGRAa13
 ISa0+UPSvULX7eL4R5+7RidAqW5VdzbdtWit+CBc3OTAOTufTbVjwJh6hm/tm5rgqIGgQZ7JcfLPc
 EpcB453xbxaClehn6Iph2TnPvV7OlJPpI8DHZ9jnBPc7dJaeIucPy97eM6IXKQZnwxQo=;
Received: from mail-qk1-f180.google.com ([209.85.222.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vdybo-00049w-6y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jan 2026 22:36:00 +0000
Received: by mail-qk1-f180.google.com with SMTP id
 af79cd13be357-8bb6a27d407so342281985a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 08 Jan 2026 14:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767911749; x=1768516549; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ev9qJpmrlELfTWb+vJg2DrJUm4rUbkMuo7sXN5zRlWM=;
 b=mVzuEYOBxCpypwuokspAqapmEUWF/na7G4DTqyB3xAaFGe1Hx3gs44+f7T5d6zHug6
 MdqSfeVmJR8OTUhGYvllaLWOLmPSv3eFKqAuHfLa91dv6weQCkBhGsN/x8lzjvd3dlRV
 nqIzWCrM4ZWylTsW+aKWjS5clMK6X2hjUvlfTKL/nIaua+njVsSwEkVwdcBBBhWzrLwj
 LOIstaRfEtUygwcapNIsywoO1VUFYAkbmYJAYTHXd7S2xURyLMDijinX6tyt6ghOyQam
 GPFI5ei1qtQJI6pGZW2jIz/wsmamGygZesDTVqk66vuUAfdr6TKGWiRIFwrqUVZQVk/J
 psUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767911749; x=1768516549;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ev9qJpmrlELfTWb+vJg2DrJUm4rUbkMuo7sXN5zRlWM=;
 b=Z1UlkFTM96IJv5CWNT8h+iIbH1KUUm7t7oLT7T/ktclmvMAgISVrh1b2N0hYIBkjpv
 Y2On3lFa4ssjlioFhBp8I3hx2Kt+dQNOPLVzWvXuj0jtcInmjq07q/Zub1TRnwfbukrA
 5WzvIA+PuXC8jXtg1V7KpkYECk1WnPI5r4Pj2KSP7P9+4Q6h1LL2PCsOgMUT1/8vA2pl
 E9puN43TwojYd7uQPvm5ygJMnJRwLXYnPV2s3ndBAhUjOMIQaZXb8SqdADMkv8un2ftR
 Mqz0Wy9rSfPXPahvyDOw69/sWjzpopZS151e5gBvVtduO6POk70iQvhGEoJASasW5i4z
 u5PQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXB5LkI3EYOWB+Hg9+QsfnwlUCgnqCFkOOilFb6hZy0+CXwSvAIRrJ8dBOqYrA4YBNFFckrhYT0tf9qn+5T53jx@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw3Y36a83LbYhMFT4Rn3AOvlvN2T+TVv/i9yJbwI8CjaOOEavPT
 scdD/wwHWmSZC/sYyUxn76l4hRr9mknCxJszexF4jwSRJhQjoT0IX+nGOAOUwbjXSST/2f9jUhK
 Fax+v8iVJ1O+MJYsHGOq/ES4o8cmVZtxqSxVa
X-Gm-Gg: AY/fxX7hgNwJiQEa8leVXKNZEiEKGJvWYoU+WnFjdMN1PtTcmZtI2X6xWD1rsJVwQTm
 CZ2LNwsDBLs7zkmj8hghsU34N1SkKJUSokbMkhNkN7XSBE9eP1Ok9//+JggiQwwhjXdXCLNryPi
 w57YpHMVLyZBAQ2CH4/v5hYA1XZfe0R5L7W5V8qRDRwhFwq+7XYUYTHEpgU5e9Tjf1czAwsLuMq
 O5BdMAAHZ36GDHAGeejcrXBjeg+7RoV1JBpfvzFdQJL9TKD/1pnw/Nrk632ugPVnQ/RwA==
X-Google-Smtp-Source: AGHT+IEeu+/y2Uez1a78NUVwAXcxa0IaIqJjYfS+u5sGICmwYpiAnw8CqbHXSG/sbr7NLSuTrGZiFwGIN4nYPMthCDI=
X-Received: by 2002:a05:620a:31a5:b0:8b2:ec00:7840 with SMTP id
 af79cd13be357-8c389384d24mr1184197285a.27.1767911749109; Thu, 08 Jan 2026
 14:35:49 -0800 (PST)
MIME-Version: 1.0
References: <20260105153101.152892-1-nzzhao@126.com>
 <20260105153101.152892-2-nzzhao@126.com>
 <CAGsJ_4yrspqjbEK8vj8Fd9FCDAasQ7mp5nBsE0Zg9XX265PXgA@mail.gmail.com>
 <1a779a14.3453.19b968e6f2d.Coremail.nzzhao@126.com>
In-Reply-To: <1a779a14.3453.19b968e6f2d.Coremail.nzzhao@126.com>
From: Barry Song <21cnbao@gmail.com>
Date: Fri, 9 Jan 2026 11:35:37 +1300
X-Gm-Features: AQt7F2qZodfQeHNKnln_wrIEQHeTV_cP1Xh_mEEyBRK3Tp6F7F9SYCXgu1bQBWM
Message-ID: <CAGsJ_4w8+av0kPrSnGApTcJ9HGV6_Yhc+XeQLgUkAapMvAzEdQ@mail.gmail.com>
To: Nanzhe Zhao <nzzhao@126.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 7,
 2026 at 4:45 PM Nanzhe Zhao wrote: > > Hi Barry:
 > > >At 2026-01-06 11:38:49, "Barry Song" wrote: > >>On Tue, Jan 6, 2026
 at 12:12 AM Nanzhe Zhao wrote: > >>> > >>> f2fs_folio_sta [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [21cnbao(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.180 listed in wl.mailspike.net]
X-Headers-End: 1vdybo-00049w-6y
Subject: Re: [f2fs-dev] [PATCH v1 1/5] f2fs: Zero f2fs_folio_state on
 allocation
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBKYW4gNywgMjAyNiBhdCA0OjQ14oCvUE0gTmFuemhlIFpoYW8gPG56emhhb0AxMjYu
Y29tPiB3cm90ZToKPgo+IEhpIEJhcnJ5Ogo+Cj4gPkF0IDIwMjYtMDEtMDYgMTE6Mzg6NDksICJC
YXJyeSBTb25nIiA8MjFjbmJhb0BnbWFpbC5jb20+IHdyb3RlOgo+ID4+T24gVHVlLCBKYW4gNiwg
MjAyNiBhdCAxMjoxMuKAr0FNIE5hbnpoZSBaaGFvIDxuenpoYW9AMTI2LmNvbT4gd3JvdGU6Cj4g
Pj4+Cj4gPj4+IGYyZnNfZm9saW9fc3RhdGUgaXMgYXR0YWNoZWQgdG8gZm9saW8tPnByaXZhdGUg
YW5kIGlzIGV4cGVjdGVkIHRvIHN0YXJ0Cj4gPj4+IHdpdGggcmVhZF9wYWdlc19wZW5kaW5nID09
IDAuICBIb3dldmVyLCB0aGUgc3RydWN0dXJlIHdhcyBhbGxvY2F0ZWQgZnJvbQo+ID4+PiBmZnNf
ZW50cnlfc2xhYiB3aXRob3V0IGJlaW5nIGZ1bGx5IGluaXRpYWxpemVkLCB3aGljaCBjYW4gbGVh
dmUKPiA+Pj4gcmVhZF9wYWdlc19wZW5kaW5nIHdpdGggc3RhbGUgdmFsdWVzLgo+ID4+Pgo+ID4+
PiBBbGxvY2F0ZSB0aGUgb2JqZWN0IHdpdGggX19HRlBfWkVSTyBzbyBhbGwgZmllbGRzIGFyZSBy
ZWxpYWJseSB6ZXJvZWQgYXQKPiA+Pj4gY3JlYXRpb24gdGltZS4KPiA+Pj4KPiA+Pj4gU2lnbmVk
LW9mZi1ieTogTmFuemhlIFpoYW8gPG56emhhb0AxMjYuY29tPgo+ID4+Cj4gPj4KPiA+PldlIGFs
cmVhZHkgaGF2ZSBHRlBfRjJGU19aRVJPLCBidXQgaXQgaW5jbHVkZXMgR0ZQX0lPLiBTaG91bGQg
d2UKPiA+PmludHJvZHVjZSBhbm90aGVyIHZhcmlhbnQsIHN1Y2ggYXMgR0ZQX0YyRlNfTk9JT19a
RVJPIChvciBzaW1pbGFyKT8KPiA+Pk92ZXJhbGwsIExHVE0uCj4gPj4KPgo+IEknbSBzdGlsbCBu
b3QgZnVsbHkgdW5kZXJzdGFuZCBhYm91dCB0aGUgZXhhY3Qgc2VtYW50aWNzIG9mIEdGUF9OT0lP
IHZzIEdGUF9OT0ZTLgo+IEkgZGlkIGEgYml0IG9mIGRpZ2dpbmcgYW5kLCBpbiB0aGUgY3VycmVu
dCBidWZmZXJlZCByZWFkIC8gcmVhZGFoZWFkIGNvbnRleHQsIGl0IHNlZW1zCj4gbGlrZSB0aGVy
ZSBtYXkgYmUgbm8gbWVhbmluZ2Z1bCBkaWZmZXJlbmNlIGZvciB0aGUgcHVycG9zZSBvZiBhdm9p
ZGluZyBkaXJlY3QtcmVjbGFpbQo+IHJlY3Vyc2lvbiBkZWFkbG9ja3M/CgpXaXRoIEdGUF9OT0lP
LCB3ZSB3aWxsIG5vdCBzd2FwIG91dCBwYWdlcywgaW5jbHVkaW5nIGFub255bW91cyBmb2xpb3Mu
CgogICAgICAgICAgICAgICAgaWYgKGZvbGlvX3Rlc3RfYW5vbihmb2xpbykgJiYgZm9saW9fdGVz
dF9zd2FwYmFja2VkKGZvbGlvKSkgewogICAgICAgICAgICAgICAgICAgICAgICBpZiAoIWZvbGlv
X3Rlc3Rfc3dhcGNhY2hlKGZvbGlvKSkgewogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGlmICghKHNjLT5nZnBfbWFzayAmIF9fR0ZQX0lPKSkKICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGdvdG8ga2VlcF9sb2NrZWQ7CgpXaGVuIHVzaW5nIEdGUF9OT0ZTLCBy
ZWNsYWltIGNhbiBzdGlsbCBzd2FwIG91dCBhbiBhbm9uIGZvbGlvLApwcm92aWRlZCBpdHMgc3dh
cCBlbnRyeSBpcyBub3QgZmlsZXN5c3RlbS1iYWNrZWQKKHNlZSBmb2xpb19zd2FwX2ZsYWdzKGZv
bGlvKSkuCgpzdGF0aWMgYm9vbCBtYXlfZW50ZXJfZnMoc3RydWN0IGZvbGlvICpmb2xpbywgZ2Zw
X3QgZ2ZwX21hc2spCnsKICAgICAgICBpZiAoZ2ZwX21hc2sgJiBfX0dGUF9GUykKICAgICAgICAg
ICAgICAgIHJldHVybiB0cnVlOwogICAgICAgIGlmICghZm9saW9fdGVzdF9zd2FwY2FjaGUoZm9s
aW8pIHx8ICEoZ2ZwX21hc2sgJiBfX0dGUF9JTykpCiAgICAgICAgICAgICAgICByZXR1cm4gZmFs
c2U7CiAgICAgICAgLyoKICAgICAgICAgKiBXZSBjYW4gImVudGVyX2ZzIiBmb3Igc3dhcC1jYWNo
ZSB3aXRoIG9ubHkgX19HRlBfSU8KICAgICAgICAgKiBwcm92aWRpbmcgdGhpcyBpc24ndCBTV1Bf
RlNfT1BTLgogICAgICAgICAqIC0+ZmxhZ3MgY2FuIGJlIHVwZGF0ZWQgbm9uLWF0b21pY2lhbGx5
IChzY2FuX3N3YXBfbWFwX3Nsb3RzKSwKICAgICAgICAgKiBidXQgdGhhdCB3aWxsIG5ldmVyIGFm
ZmVjdCBTV1BfRlNfT1BTLCBzbyB0aGUgZGF0YV9yYWNlCiAgICAgICAgICogaXMgc2FmZS4KICAg
ICAgICAgKi8KICAgICAgICByZXR1cm4gIWRhdGFfcmFjZShmb2xpb19zd2FwX2ZsYWdzKGZvbGlv
KSAmIFNXUF9GU19PUFMpOwp9CgpOb3RlIHRoYXQgc3dhcCBtYXkgYmUgYmFja2VkIGVpdGhlciBi
eSBhIGZpbGVzeXN0ZW0gc3dhcGZpbGUgb3IKZGlyZWN0bHkgYnkgYSBibG9jayBkZXZpY2UuCgpJ
biBzaG9ydCwgR0ZQX05PSU8gaXMgc3RyaWN0ZXIgdGhhbiBHRlBfTk9GUzogaXQgZGlzYWxsb3dz
IGFueSBJL08sCmV2ZW4gaWYgdGhlIEkvTyBkb2VzIG5vdCBpbnZvbHZlIGEgZmlsZXN5c3RlbSwg
d2hlcmVhcyBHRlBfTk9GUwpzdGlsbCBwZXJtaXRzIEkvTyB0aGF0IGlzIG5vdCBmaWxlc3lzdGVt
LXJlbGF0ZWQuCgo+Cj4gTXkgY3VycmVudCAocG9zc2libHkgaW5jb21wbGV0ZSkgdW5kZXJzdGFu
ZGluZyBpcyB0aGF0IGluIG1heV9lbnRlcl9mcygpLCBHRlBfTk9JTwo+IG9ubHkgY2hhbmdlcyBi
ZWhhdmlvciBmb3Igc3dhcGNhY2hlIGZvbGlvcywgcmF0aGVyIHRoYW4gZmlsZS1iYWNrZWQgZm9s
aW9zIHRoYXQgYXJlCj4gY3VycmVudGx5IGluIHRoZSByZWFkIElPIHBhdGgsYW5kIHRoZSBzd2Fw
IHdyaXRlYmFjayBwYXRoIHdvbid0IHJlY3Vyc2UgYmFjayBpbnRvIGYyZnMncwo+IG93biB3cml0
ZWJhY2sgZnVuY3Rpb24gYW55d2F5LiAoT24gcGhvbmVzIHRoZXJlIHVzdWFsbHkgaXNuJ3QgIGEg
c3dhcCBwYXJ0aXRpb247IGZvciB6cmFtCj4gIEkgZ3Vlc3Mgc3dhcCB3cml0ZWJhY2sgaXMgZWZm
ZWN0aXZlbHkgd3JpdGluZyB0byBSQU0gdmlhIHRoZSB6cmFtIGJsb2NrIGRldmljZSA/Cj4gU29y
cnkgZm9yICBub3QgYmVpbmcgdmVyeSBmYW1pbGlhciB3aXRoIHRoZSBkZXRhaWxzIHRoZXJlLikK
ClRoaXMgY2FuIGJlIHRoZSBjYXNlIGZvciBhIHN3YXBmaWxlIG9uIEYyRlMuIE5vdGUgdGhhdCB0
aGUgY2hlY2sgaXMKcGVyZm9ybWVkIHBlciBmb2xpby4gT24gYSBzeXN0ZW0gd2l0aCBib3RoIHpS
QU0gYW5kIGEgZmlsZXN5c3RlbS0KYmFja2VkIHN3YXBmaWxlLCBzb21lIGZvbGlvcyBtYXkgYmUg
c3dhcHBlZCBvdXQgd2hpbGUgb3RoZXJzIG1heQpub3QsIGRlcGVuZGluZyBvbiB3aGVyZSB0aGVp
ciBzd2FwIHNsb3RzIGFyZSBhbGxvY2F0ZWQuCgo+Cj4gSSBub3RpY2VkIGlvbWFwJ3MgaWZzX2Fs
bG9jIHVzZXMgR0ZQX05PRlMgfCBfX0dGUF9OT0ZBSUwuIFNvIGlmIEdGUF9OT0ZTIGlzIGFjY2Vw
dGFibGUgaGVyZSwKPiB3ZSBjb3VsZCBzaW1wbHkgdXNlIEdGUF9GMkZTX1pFUk8gYW5kIGF2b2lk
IGludHJvZHVjaW5nIGEgbmV3IEdGUF9GMkZTX05PSU9fWkVSTyB2YXJpYW50Pwo+Cj4gSnVzdCBj
dXJpb3VzLkkgd2lsbCB2b3RlICBmb3IgR0ZQX05PSU8gIGZyb20gc2VtYW50aWMgY2xhcml0eSBw
ZXJzcGVjdGl2ZSBoZXJlLgoKSW4gZ2VuZXJhbCwgR0ZQX05PSU8gaXMgdXNlZCB3aGVuIGhhbmRs
aW5nIGJpb3Mgb3IgcmVxdWVzdHMuCgpUaGFua3MKQmFycnkKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
