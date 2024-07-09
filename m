Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A601992C635
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 00:20:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRJCC-00051C-WE;
	Tue, 09 Jul 2024 22:20:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sRJCB-000516-2h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 22:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h8Czy7doaX+k4ZwzWElj3/dmGSVBZ1YnkOPpAJR0P1k=; b=hhRF2UfxImDGOGHMqOe+ozuceu
 wMEvd61f5m4uj3jhqVWeJIvJ5n7hEfaaz0968DY57q6NRvueJYkAtHRXOBvrulZ8cp5ujhEAth1QY
 tsEs7jB2DhAENi8M6ehqVr7JFfi4R5uM5+2hFkuanTp0vtUIEDojjsDj80KLK5D3mvbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h8Czy7doaX+k4ZwzWElj3/dmGSVBZ1YnkOPpAJR0P1k=; b=mN8Iz0GkYa6wWSPpE+Q6bv8dNV
 RmKSSbjfvNwkmHOh3aBkYNssyzS4/fu/dG8r0jSqarM74J3gQTqgwwV6LmSZ+Lfeey0I4x1dJd0CF
 2QI4k9f+it6NvUspWKDCWJ4QcAwCdRLEjA83LRgC2TEED0Z75ZuYgbRARTF6H8dTsZ1A=;
Received: from mail-vs1-f53.google.com ([209.85.217.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sRJCC-0003aw-Cw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Jul 2024 22:20:24 +0000
Received: by mail-vs1-f53.google.com with SMTP id
 ada2fe7eead31-48ff82266e7so1136379137.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Jul 2024 15:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720563612; x=1721168412; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8Czy7doaX+k4ZwzWElj3/dmGSVBZ1YnkOPpAJR0P1k=;
 b=FFSTrdmK23rwYq8K/vsqV7fZhh1dxEWCOc2mAKHH69OvPEb3v8ayJjgxdEi1HYGi3n
 xaPchgxxyDayEsa4lFIXNeEVFB7eWiPvn2ZBa8oahTKKpdy5NQWYZ/OuPKUOqIqVoJoC
 cf1iPoHIm3etJau5As8STP/F8PloGX/c7ASkqekA9T+fJ59ptcYcTu5aS/HL/2+x4mSy
 rFBBxxRE4Ixb56HVqgV0S9rXkz8OLyHjdLskUhcunKgsW+6EDRegeV6khw6OCX0QJQxs
 6njMCBRfkLSHgIztRYZD3P5qFLXjzCGNraCe67Apb4ck1mUDY+Ggo9LmeOx1UQJk5Yur
 kX+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720563612; x=1721168412;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8Czy7doaX+k4ZwzWElj3/dmGSVBZ1YnkOPpAJR0P1k=;
 b=dRHwAFdEYStO2Gy7oGlb6a2Qil/FBD/Rp56y5uoJ8goxHsAH7IwLESPgAJK0SuzffB
 N2oLcRyg5aZHMgkc7ynDxlyjZfbyIo69iOdqpO2nPGzsSLV9eYk7UcwyBqL9F1cf3Acu
 aEAIPg69/6AqkqKuXsk7S5omKjPqQ5h700RHnTbg8dx0U3c5i/JgSK4+DwzXCpEGl9dh
 Xh3XijrovvDB+L9xtrYK/ZWJdu3X6XyvhFyMUf5JrSNp1GaPfNkepwvT4b3uJpl1R7/s
 /IlaMS1+xp0nXYtJLfGBw86t6HVtcvuzXzHAnCo1674nkOKxcG9nNve1LXD5Ue6vRazw
 +bbw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKXQ1yJl9QBkpVCWeReFOVH8ZvM2fFGeQ9cjYRnxy0Vq4T8xZ4PMTNN3FXpEZ8kP8HtiI2qm5bHsX6kER7zQTZmjZ/OivenfJwQVWv2DNZ48C7vfPwbA==
X-Gm-Message-State: AOJu0YymiTNsCHJ5lDi+WbCtvS5WP+wio3+81DZdA+YOeXtW5qNOMTpt
 TRjR27lvT4etx7B0BljgEyPytzKqsz6L5tMIqLFAwPu5Lw7q9hsCP9/moyvCONTM00J2HiZffZO
 rxrRUKKYoem8JzmOJe0b2BMhnHr4=
X-Google-Smtp-Source: AGHT+IErL4gRn1VUDNYOKxDX+Hizc+WQ3e6bmzEUKMPWNueaUxvSd5CsMaZNbrn4mHAW15yv9vTChUtedadBTRTWfCk=
X-Received: by 2002:a05:6102:d92:b0:48f:3bcf:58a5 with SMTP id
 ada2fe7eead31-4903219912bmr3494848137.19.1720563612615; Tue, 09 Jul 2024
 15:20:12 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
 <20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
 <460c4708-3ec6-4fbc-8f6c-7f8e5f901061@kernel.org>
In-Reply-To: <460c4708-3ec6-4fbc-8f6c-7f8e5f901061@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 9 Jul 2024 15:20:01 -0700
Message-ID: <CACOAw_yP2himsj6YuE4vmpGebadHe+PtkLQyP8ZJRZSPkn6m7A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jul 4, 2024 at 12:17 AM Chao Yu wrote: > > On 2024/7/4
    9:01, Daejun Park wrote: > > This patch fixes a potentially null pointer
   being accessed by > > is_end_zone_blkaddr() that checks the [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.217.53 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.217.53 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
                             DNSWL was blocked.  See
                             http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
                              for more information.
                             [209.85.217.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.53 listed in wl.mailspike.net]
X-Headers-End: 1sRJCC-0003aw-Cw
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix null reference error when checking
 end of zone
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>,
 "daehojeong@google.com" <daehojeong@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Dongjin Kim <dongjin_.kim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKdWwgNCwgMjAyNCBhdCAxMjoxN+KAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzcvNCA5OjAxLCBEYWVqdW4gUGFyayB3cm90ZToKPiA+IFRo
aXMgcGF0Y2ggZml4ZXMgYSBwb3RlbnRpYWxseSBudWxsIHBvaW50ZXIgYmVpbmcgYWNjZXNzZWQg
YnkKPiA+IGlzX2VuZF96b25lX2Jsa2FkZHIoKSB0aGF0IGNoZWNrcyB0aGUgbGFzdCBibG9jayBv
ZiBhIHpvbmUKPiA+IHdoZW4gZjJmcyBpcyBtb3VudGVkIGFzIGEgc2luZ2xlIGRldmljZS4KPgo+
IGJsa3pvbmVkIGZlYXR1cmUgZGVwZW5kcyBvbiBtdWx0aXBsZSBkZXZpY2UgZmVhdHVyZT8gT25l
IHJlZ3VsYXIKPiBkZXZpY2UgYW5kIG9uZSBzZXEtem9uZSBkZXZpY2U/Cj4KPiBUaGFua3MsCj4K
PiA+Cj4gPiBGaXhlczogZTA2N2RjM2M2YjljICgiZjJmczogbWFpbnRhaW4gc2l4IG9wZW4gem9u
ZXMgZm9yIHpvbmVkIGRldmljZXMiKQo+ID4gU2lnbmVkLW9mZi1ieTogRGFlanVuIFBhcmsgPGRh
ZWp1bjcucGFya0BzYW1zdW5nLmNvbT4KPiA+IC0tLQo+ID4gICBmcy9mMmZzL2RhdGEuYyB8IDQg
KysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPiA+
IGluZGV4IGI2ZGNiM2JjYWVmNy4uMWFhN2VlZmE2NTljIDEwMDY0NAo+ID4gLS0tIGEvZnMvZjJm
cy9kYXRhLmMKPiA+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4gPiBAQCAtOTI1LDYgKzkyNSw3IEBA
IGludCBmMmZzX21lcmdlX3BhZ2VfYmlvKHN0cnVjdCBmMmZzX2lvX2luZm8gKmZpbykKPiA+ICAg
I2lmZGVmIENPTkZJR19CTEtfREVWX1pPTkVECj4gPiAgIHN0YXRpYyBib29sIGlzX2VuZF96b25l
X2Jsa2FkZHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIpCj4gPiAg
IHsKPiA+ICsgICAgIHN0cnVjdCBibG9ja19kZXZpY2UgKmJkZXYgPSBzYmktPnNiLT5zX2JkZXY7
Cj4gPiAgICAgICBpbnQgZGV2aSA9IDA7Cj4gPgo+ID4gICAgICAgaWYgKGYyZnNfaXNfbXVsdGlf
ZGV2aWNlKHNiaSkpIHsKPiA+IEBAIC05MzUsOCArOTM2LDkgQEAgc3RhdGljIGJvb2wgaXNfZW5k
X3pvbmVfYmxrYWRkcihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3QgYmxrYWRkcikK
PiA+ICAgICAgICAgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAgICAgICAgICAgICAg
IH0KPiA+ICAgICAgICAgICAgICAgYmxrYWRkciAtPSBGREVWKGRldmkpLnN0YXJ0X2JsazsKPiA+
ICsgICAgICAgICAgICAgYmRldiA9IEZERVYoZGV2aSkuYmRldjsKPiA+ICAgICAgIH0KPiA+IC0g
ICAgIHJldHVybiBiZGV2X2lzX3pvbmVkKEZERVYoZGV2aSkuYmRldikgJiYKPiA+ICsgICAgIHJl
dHVybiBiZGV2X2lzX3pvbmVkKGJkZXYpICYmCj4gPiAgICAgICAgICAgICAgIGYyZnNfYmxrel9p
c19zZXEoc2JpLCBkZXZpLCBibGthZGRyKSAmJgo+ID4gICAgICAgICAgICAgICAoYmxrYWRkciAl
IHNiaS0+YmxvY2tzX3Blcl9ibGt6ID09IHNiaS0+YmxvY2tzX3Blcl9ibGt6IC0gMSk7Cj4gPiAg
IH0KPgoKUmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpU
aGFua3MsCgoKPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
