Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC05241A47
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 13:21:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5SLh-00007G-9q; Tue, 11 Aug 2020 11:21:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k5SLf-00006z-MY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 11:21:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8Ct58qMIg0pwE2hoQADteqtstqL+kB4e2gL5OWh/wsI=; b=moENT5RGfRA9xABs+3nfG8NyoX
 4sYtP5PMdlGtd5QNY57k/fnT0FFuymS/4jRvyAUWkTIX501VtElABl+zXk354ZO4k8i4p3TOY2V39
 wGDbZUm0PCQ3qBSwBWFN2OT45iq/alqUjCGXXrkB4KM7WWSNCIzxfJj/UNCRXceM5kw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8Ct58qMIg0pwE2hoQADteqtstqL+kB4e2gL5OWh/wsI=; b=m+NcFj73dzzmgQad8GqptMIKeV
 E1XpztPYA22WyRLrQ+5oS+jS0TgVanz18ElLXAgUfdoRZudc0blYFzKnY6ew727t7gnDXT/MYkPN9
 dJYQLQNg7uIu+/GwJ/ASYk01uVBg4oESy7zj5V/XSblKrltVftPqZUn864aVtSMmjEho=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5SLd-005OSx-Ak
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 11:21:43 +0000
Received: by mail-lj1-f195.google.com with SMTP id w14so13085383ljj.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 04:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8Ct58qMIg0pwE2hoQADteqtstqL+kB4e2gL5OWh/wsI=;
 b=HCwAvJxed5Br6kXQie/OgvDJ2NQ/z31CpHC6x5m8dKFidNdgyIKv6dZnn6b9zN09or
 A2TQ1BI+EzXiJesGfcKPEDyjobKuOSd7nR04Ar1ric1IW5rcvSXXlpxIcIdlv1sgeKIV
 XHjwhjziuEyxoTHwCMIXjSIH2PTVXKVc1EVz52PodX0WMS53G4DtsltjGpbxxw8SNim7
 F9z8MyWNiV/EWU/EnnNzB0u4UmXai5Pjv+fDsIcMiWVA9KiJ12b5r32shpoivo+vMqD1
 el9FZcy9q60ICpNPe+TQs/fB87ug5izH9ocybaYmKdwHlR+hPkoj9ywz1lj/VnC8Epaz
 xluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Ct58qMIg0pwE2hoQADteqtstqL+kB4e2gL5OWh/wsI=;
 b=lo28rozdbZOJ+CBHmLMYr+GMSm5mK1OZ6/WrxAu7JR/jao5kod5Ac5cVhVHkS7QxwP
 YQ/XDg++zE6ja9il76Fwlq+EYDN0AsDdRbuN6QPqr9wKJXkU163OHaRAaeZF+Q1iX3F2
 +/NmscHyYbKjqZ14IIpLHR9KugUriNW5BKaDOGuaroSSYL2Af7k4MpZwxEUu2DX/tDQk
 HJ2n5L6TZS3m+4GoToB6vqqSqLoiOL56MWCXFWtw2j7SWu/Kl1WC5ZHMPl40FOBCq9aE
 ufCOSpZ+J5bHDqizKFgzFwsEA+s0cdy6WXaXFVeImhrG5fQnnYhVUtG4rAAClPH/TYLX
 UXWw==
X-Gm-Message-State: AOAM530bL4re1BPMmsBqgMdhu0sqLrikO/Q6DL4cYwkJymXM6ieAAdbF
 Vjxz7IhhiUP8jpF/l+6lXemM07/OoYJMcsNuYcLQ3l/OgrQ=
X-Google-Smtp-Source: ABdhPJzk5Ns2umh9W9MkI6/l77QbQnjwM4eNUYg9DPae0+PlOO/EEm4ixqit0bXszbw2ZGhcAUsrRlQacJSdg/xOI5I=
X-Received: by 2002:a2e:3615:: with SMTP id d21mr2884573lja.333.1597144894562; 
 Tue, 11 Aug 2020 04:21:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
 <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
 <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
 <CACOAw_wi3C0iyTVYc3075d4K27NT7BGMGzsKFDDozf=98vWMcA@mail.gmail.com>
 <20200811101827.GA7870@xiangao.remote.csb>
In-Reply-To: <20200811101827.GA7870@xiangao.remote.csb>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 11 Aug 2020 20:21:23 +0900
Message-ID: <CACOAw_zRPeGzHyc_siLqBRjURWTE61G5rGCwk7bnbcOnADGRpg@mail.gmail.com>
To: Gao Xiang <hsiangkao@redhat.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k5SLd-005OSx-Ak
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
 compression pages
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U3VyZSwgSSdsbCB1cGRhdGUgdGhlIHRlc3QgY29uZGl0aW9uIGFzIHlvdSBzYWlkIGluIHRoZSBj
b21taXQgbWVzc2FnZS4KRllJLCB0aGUgdGVzdCBpcyBkb25lIHdpdGggMTZrYiBjaHVuayBhbmQg
UGl4ZWwgMyAoYXJtNjQpIGRldmljZS4KClRoYW5rcywKCjIwMjDrhYQgOOyblCAxMeydvCAo7ZmU
KSDsmKTtm4QgNzoxOCwgR2FvIFhpYW5nIDxoc2lhbmdrYW9AcmVkaGF0LmNvbT7ri5jsnbQg7J6R
7ISxOgo+Cj4gT24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMDY6MzM6MjZQTSArMDkwMCwgRGFlaG8g
SmVvbmcgd3JvdGU6Cj4gPiBQbHVzLCB3aGVuIHdlIHVzZSB2bWFwKCksIHZtYXAoKSBub3JtYWxs
eSBleGVjdXRlcyBpbiBhIHNob3J0IHRpbWUKPiA+IGxpa2Ugdm1fbWFwX3JhbSgpLgo+ID4gQnV0
LCBzb21ldGltZXMsIGl0IGhhcyBhIHZlcnkgbG9uZyBkZWxheS4KPiA+Cj4gPiAyMDIww6vigKbi
gJ4gOMOs4oC64oCdIDExw6zvv73CvCAow63ihKLigJ0pIMOsy5zCpMOt4oC64oCeIDY6MjgsIERh
ZWhvIEplb25nIDxkYWVobzQzQGdtYWlsLmNvbT7Dq+KAucucw6zvv73CtCDDrMW+4oCYw6zigJ7C
sToKPiA+ID4KPiA+ID4gQWN0dWFsbHksIGFzIHlvdSBjYW4gc2VlLCBJIHVzZSB0aGUgd2hvbGUg
emVybyBkYXRhIGJsb2NrcyBpbiB0aGUgdGVzdCBmaWxlLgo+ID4gPiBJdCBjYW4gbWF4aW1pemUg
dGhlIGVmZmVjdCBvZiBjaGFuZ2luZyB2aXJ0dWFsIG1hcHBpbmcuCj4gPiA+IFdoZW4gSSB1c2Ug
bm9ybWFsIGZpbGVzIHdoaWNoIGNhbiBiZSBjb21wcmVzc2VkIGFib3V0IDcwJSBmcm9tIHRoZQo+
ID4gPiBvcmlnaW5hbCBmaWxlLAo+ID4gPiBUaGUgdm1fbWFwX3JhbSgpIHZlcnNpb24gaXMgYWJv
dXQgMnggZmFzdGVyIHRoYW4gdm1hcCgpIHZlcnNpb24uCj4KPiBXaGF0IGYyZnMgZG9lcyBpcyBt
dWNoIHNpbWlsYXIgdG8gYnRyZnMgY29tcHJlc3Npb24uIEV2ZW4gaWYgdGhlc2UKPiBibG9ja3Mg
YXJlIGFsbCB6ZXJvZWQuIEluIHByaW5jaXBsZSwgdGhlIG1heGltdW0gY29tcHJlc3Npb24gcmF0
aW8KPiBpcyBkZXRlcm1pbmVkIChjbHVzdGVyIHNpemVkIGJsb2NrcyBpbnRvIG9uZSBjb21wcmVz
c2VkIGJsb2NrLCBlLmcKPiAxNmsgY2x1c3RlciBpbnRvIG9uZSBjb21wcmVzc2VkIGJsb2NrKS4K
Pgo+IFNvIGl0J2QgYmUgYmV0dGVyIHRvIGRlc2NyaWJlIHlvdXIgY29uZmlndXJlZCBjbHVzdGVy
IHNpemUgKDE2ayBvcgo+IDEyOGspIGFuZCB5b3VyIGhhcmR3YXJlIGluZm9ybWF0aW9uIGluIHRo
ZSBjb21taXQgbWVzc2FnZSBhcyB3ZWxsLgo+Cj4gQWN0dWFsbHksIEkgYWxzbyB0cmllZCB3aXRo
IHRoaXMgcGF0Y2ggYXMgd2VsbCBvbiBteSB4ODYgbGFwdG9wIGp1c3QKPiBub3cgd2l0aCBGSU8g
KEkgZGlkbid0IHVzZSB6ZXJvZWQgYmxvY2sgdGhvdWdoKSwgYW5kIEkgZGlkbid0IG5vdGljZQo+
IG11Y2ggZGlmZmVyZW5jZSB3aXRoIHR1cmJvIGJvb3N0IG9mZiBhbmQgbWF4ZnJlcS4KPgo+IEkn
bSBub3QgYXJndWluZyB0aGlzIGNvbW1pdCwganVzdCBhIG5vdGUgYWJvdXQgdGhpcyBjb21taXQg
bWVzc2FnZS4KPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5LjE0
NjIxNyBzLCAxMDkgTS9zCj4gPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGll
ZCwgOS45OTc1NDIgcywgMTAwIE0vcwo+ID4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBH
KSBjb3BpZWQsIDEwLjEwOTcyNyBzLCA5OSBNL3MKPgo+IElNSE8sIHRoZSBhYm92ZSBudW1iZXIg
aXMgbXVjaCBsaWtlIGRlY29tcHJlc3NpbmcgaW4gdGhlIGFybTY0IGxpdHRsZSBjb3Jlcy4KPgo+
IFRoYW5rcywKPiBHYW8gWGlhbmcKPgo+Cj4gPiA+Cj4gPiA+IDIwMjDDq+KApuKAniA4w6zigLri
gJ0gMTHDrO+/vcK8ICjDreKEouKAnSkgw6zLnMKkw63igLrigJ4gNDo1NSwgQ2hhbyBZdSA8eXVj
aGFvMEBodWF3ZWkuY29tPsOr4oC5y5zDrO+/vcK0IMOsxb7igJjDrOKAnsKxOgo+ID4gPiA+Cj4g
PiA+ID4gT24gMjAyMC84LzExIDE1OjE1LCBHYW8gWGlhbmcgd3JvdGU6Cj4gPiA+ID4gPiBPbiBU
dWUsIEF1ZyAxMSwgMjAyMCBhdCAxMjozNzo1M1BNICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+ID4gPiA+PiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4g
PiA+ID4+Cj4gPiA+ID4gPj4gQnkgcHJvZmlsaW5nIGYyZnMgY29tcHJlc3Npb24gd29ya3MsIEkn
dmUgZm91bmQgdm1hcCgpIGNhbGxpbmdzIGFyZQo+ID4gPiA+ID4+IGJvdHRsZW5lY2tzIG9mIGYy
ZnMgZGVjb21wcmVzc2lvbiBwYXRoLiBDaGFuZ2luZyB0aGVzZSB3aXRoCj4gPiA+ID4gPj4gdm1f
bWFwX3JhbSgpLCB3ZSBjYW4gZW5oYW5jZSBmMmZzIGRlY29tcHJlc3Npb24gc3BlZWQgcHJldHR5
IG11Y2guCj4gPiA+ID4gPj4KPiA+ID4gPiA+PiBbVmVyaWZpY2F0aW9uXQo+ID4gPiA+ID4+IGRk
IGlmPS9kZXYvemVybyBvZj1kdW1teSBicz0xbSBjb3VudD0xMDAwCj4gPiA+ID4gPj4gZWNobyAz
ID4gL3Byb2Mvc3lzL3ZtL2Ryb3BfY2FjaGVzCj4gPiA+ID4gPj4gZGQgaWY9ZHVtbXkgb2Y9L2Rl
di96ZXJvIGJzPTUxMmsKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IC0gdy9vIGNvbXByZXNzaW9uIC0K
PiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAxLjk5OTM4NCBzLCA1
MDAgTS9zCj4gPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgMi4wMzU5
ODggcywgNDkxIE0vcwo+ID4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQs
IDIuMDM5NDU3IHMsIDQ5MCBNL3MKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IC0gYmVmb3JlIHBhdGNo
IC0KPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCA5LjE0NjIxNyBz
LCAxMDkgTS9zCj4gPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgOS45
OTc1NDIgcywgMTAwIE0vcwo+ID4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3Bp
ZWQsIDEwLjEwOTcyNyBzLCA5OSBNL3MKPiA+ID4gPiA+Pgo+ID4gPiA+ID4+IC0gYWZ0ZXIgcGF0
Y2ggLQo+ID4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMjUzNDQx
IHMsIDQ0NCBNL3MKPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykgY29waWVkLCAy
LjczOTc2NCBzLCAzNjUgTS9zCj4gPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNv
cGllZCwgMi4xODU2NDkgcywgNDU4IE0vcwo+ID4gPiA+ID4KPiA+ID4gPiA+IEluZGVlZCwgdm1h
cCgpIGFwcHJvYWNoIGhhcyBzb21lIGltcGFjdCBvbiB0aGUgd2hvbGUKPiA+ID4gPiA+IHdvcmtm
bG93LiBCdXQgSSBkb24ndCB0aGluayB0aGUgZ2FwIGlzIHN1Y2ggc2lnbmlmaWNhbnQsCj4gPiA+
ID4gPiBtYXliZSBpdCByZWxhdGVzIHRvIHVubG9ja2VkIGNwdWZyZXEgKGFuZCBiaWcgbGl0dGxl
Cj4gPiA+ID4gPiBjb3JlIGRpZmZlcmVuY2UgaWYgaXQncyBvbiBzb21lIGFybTY0IGJvYXJkKS4K
PiA+ID4gPgo+ID4gPiA+IEFncmVlZCwKPiA+ID4gPgo+ID4gPiA+IEkgZ3Vlc3MgdGhlcmUgc2hv
dWxkIGJlIG90aGVyIHJlYXNvbiBjYXVzaW5nIHRoZSBsYXJnZSBwZXJmb3JtYW5jZQo+ID4gPiA+
IGdhcCwgc2NoZWR1bGluZywgZnJlcXVlbmN5LCBvciBzb21ldGhpbmcgZWxzZS4KPiA+ID4gPgo+
ID4gPiA+ID4KPiA+ID4gPiA+Cj4gPiA+ID4gPgo+ID4gPiA+ID4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+ID4gPiA+IExpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0Cj4gPiA+ID4gPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldAo+ID4gPiA+ID4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo+ID4gPiA+ID4gLgo+ID4gPiA+ID4KPiA+Cj4KCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
