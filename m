Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31F48950B81
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 19:35:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdvQL-0007ZJ-NR;
	Tue, 13 Aug 2024 17:35:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1sdvQL-0007ZD-87
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 17:35:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJ0r4OB2JRml2XcMwBI0hCNgh5rtVnKvRGddfMLqMOQ=; b=N4GpgOAfdpz4BKrfYWmKPpeAr7
 LOdk+AMvx6OxBQbn3qJfNZ7jYKonmF46VIOaksxek1V2hjQc5D+8fcVanq4KkFkbzWgdzU9Rr2JrE
 nuNKmD3F2EKsvZpqgA5wbUygnUMMKMDqGY+2BWfSV/oFikszJyQ9QH1qMBNNlQC8vNWA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gJ0r4OB2JRml2XcMwBI0hCNgh5rtVnKvRGddfMLqMOQ=; b=QwZ3Fy+YiSvWMWmgpguPXZX/II
 2kqg4DtQp3b837j2CC6kuexIt75LD2MdBzQhxh1YN2UIwfOGj3GGo4opOYUO83GiJ9PIJ+vOrXPlK
 7hKvNzZXGHXtfTTEkSZRvAyVXCT/wCJ8MTwX6hOv94QrZ4cIOh7g9BVPz0pkYXjOFOmA=;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sdvQL-000447-8A for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 17:35:09 +0000
Received: by mail-vs1-f43.google.com with SMTP id
 ada2fe7eead31-493e8ef36b4so2115032137.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Aug 2024 10:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1723570498; x=1724175298; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gJ0r4OB2JRml2XcMwBI0hCNgh5rtVnKvRGddfMLqMOQ=;
 b=WMc5qg4t2jWnw2D4vq4NuwKn803LP5+MkxKrDSl2IAMxBnHCY7dSs03nMWRKtBwhF+
 8WytajnMbugVntaB2Ipvu8kTLSLyQjmGfzc4SdQ8s/YB9Cx8KVDYjEn8N5I0rEodB9Nl
 nquNzsGUUDdCNkifzVEpPs51JKCuVaHguZrD5VDsQq67L90VvFbSL3DaocwNIoKwShLL
 n3YyirGd5wfAKQ0IxzDd2PQp8XQbY0BZI0yXYobm7PTlwEJGVC79D12dIwomUX2JrNYO
 QJZ10iUawKZRe5YdXxhsLj3zQ5Z0UxAPzCpiqQPHI3GvYU4UnH88gylJ6b0EOFPnQW/H
 fgTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723570498; x=1724175298;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gJ0r4OB2JRml2XcMwBI0hCNgh5rtVnKvRGddfMLqMOQ=;
 b=quugIBl1SzK7Qpjrpv7J55ZFIiHoxcyrP0XV0PRzoVUTlyP/x0KqGkPMwaWtsqn2TL
 uuGKObhhvkucFAt9cZg7/aD7sCpRSWqCJ87LJ9XucKn6PJlb03OBdYzUthi9Ur/wOmWp
 zyAgUHMndCJujQEEp1/C1owSKsOXrhQw6LoceRk2KZLNqeqOSz6RkDspmxotK8yFDppv
 mZsMycHBLDzAjnNxhjQGSp/MbNdh+qh7vZMvmsTsm8b/b+b1UyDmY4LixM9Od7UUEFvn
 dveLXMS/zw0JBIkOyKR9nvaxOlAZH9YyFjRwY7o60gCtf+Od8PRWQE50EKTAJ71pV/1a
 s3NQ==
X-Gm-Message-State: AOJu0YzgH/zkgW01/Q9gGzFVf8SC+67EHBZwYx0SZ5hEh+cKDHhk/2uf
 hOqxagszQWSDfhIEYGCEDFhwfsP3NqOc1RqqL9SwKBFq958vyyU7AoubeMeeMGN4j+FDp7vcD5Z
 lNohtTNNTpvQR7yyBFN750vPd6RE=
X-Google-Smtp-Source: AGHT+IENQXdOKhjgvI28kakrUEGwrtMoySl/140ReWTGUNaAj6jWMw8my/YblsMYpumc1sWFAAXIpx6TloIFJNqkiqI=
X-Received: by 2002:a05:6102:441d:b0:493:c95b:4c15 with SMTP id
 ada2fe7eead31-49759740750mr706493137.0.1723570498226; Tue, 13 Aug 2024
 10:34:58 -0700 (PDT)
MIME-Version: 1.0
References: <20240808205732.292600-1-jaegeuk@kernel.org>
 <CACOAw_w0Dyn4T-r00=XrvGO0ZvWCVPv9wPQis9mz-9NXoqwmPA@mail.gmail.com>
 <ZrpoNyb8h0ccIZdF@google.com>
In-Reply-To: <ZrpoNyb8h0ccIZdF@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 13 Aug 2024 10:34:47 -0700
Message-ID: <CACOAw_wDqb=mU-eTzTHvG7naASZuXpoXWJGAjH=iBS92RmX4XA@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Aug 12, 2024 at 12:53 PM Jaegeuk Kim wrote: > >
   On 08/12, Daeho Jeong wrote: > > On Thu, Aug 8, 2024 at 1:59 PM Jaegeuk
   Kim wrote: > > > > > > Should finish zones if they are open. > > [...] 
 
 Content analysis details:   (-5.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [209.85.217.43 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.217.43 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sdvQL-000447-8A
Subject: Re: [f2fs-dev] [PATCH] fsck.f2fs: don't finish zones if it's not
 open
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCBBdWcgMTIsIDIwMjQgYXQgMTI6NTPigK9QTSBKYWVnZXVrIEtpbSA8amFlZ2V1a0Br
ZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDA4LzEyLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IE9u
IFRodSwgQXVnIDgsIDIwMjQgYXQgMTo1OeKAr1BNIEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5l
bC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBTaG91bGQgZmluaXNoIHpvbmVzIGlmIHRoZXkgYXJl
IG9wZW4uCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEphZWdldWsgS2ltIDxqYWVnZXVrQGtl
cm5lbC5vcmc+Cj4gPiA+IC0tLQo+ID4gPiAgaW5jbHVkZS9mMmZzX2ZzLmggICB8IDIgKysKPiA+
ID4gIGxpYi9saWJmMmZzX3pvbmVkLmMgfCA1ICsrKy0tCj4gPiA+ICAyIGZpbGVzIGNoYW5nZWQs
IDUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvZjJmc19mcy5oIGIvaW5jbHVkZS9mMmZzX2ZzLmgKPiA+ID4gaW5kZXggM2Y1NTgz
ZDE4MzI5Li4xNWExYzgyYWUxOGYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2luY2x1ZGUvZjJmc19mcy5o
Cj4gPiA+ICsrKyBiL2luY2x1ZGUvZjJmc19mcy5oCj4gPiA+IEBAIC0xNzQyLDYgKzE3NDIsOCBA
QCBibGtfem9uZV9jb25kX3N0cihzdHJ1Y3QgYmxrX3pvbmUgKmJsa3opCj4gPiA+ICAgKiBIYW5k
bGUga2VybmVsIHpvbmUgY2FwYWNpdHkgc3VwcG9ydAo+ID4gPiAgICovCj4gPiA+ICAjZGVmaW5l
IGJsa196b25lX2VtcHR5KHopICAgICAgKGJsa196b25lX2NvbmQoeikgPT0gQkxLX1pPTkVfQ09O
RF9FTVBUWSkKPiA+ID4gKyNkZWZpbmUgYmxrX3pvbmVfb3Blbih6KSAgICAgICAoYmxrX3pvbmVf
Y29uZCh6KSA9PSBCTEtfWk9ORV9DT05EX0lNUF9PUEVOIHx8ICBcCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIGJsa196b25lX2NvbmQoeikgPT0gQkxLX1pPTkVfQ09ORF9F
WFBfT1BFTikKPiA+ID4gICNkZWZpbmUgYmxrX3pvbmVfc2VjdG9yKHopICAgICAoeiktPnN0YXJ0
Cj4gPiA+ICAjZGVmaW5lIGJsa196b25lX2xlbmd0aCh6KSAgICAgKHopLT5sZW4KPiA+ID4gICNk
ZWZpbmUgYmxrX3pvbmVfd3Bfc2VjdG9yKHopICAoeiktPndwCj4gPiA+IGRpZmYgLS1naXQgYS9s
aWIvbGliZjJmc196b25lZC5jIGIvbGliL2xpYmYyZnNfem9uZWQuYwo+ID4gPiBpbmRleCAyMjFk
N2QxMzM3YzcuLjg5YmE1YWQ3M2E3NiAxMDA2NDQKPiA+ID4gLS0tIGEvbGliL2xpYmYyZnNfem9u
ZWQuYwo+ID4gPiArKysgYi9saWIvbGliZjJmc196b25lZC5jCj4gPiA+IEBAIC01MTMsNyArNTEz
LDcgQEAgaW50IGYyZnNfZmluaXNoX3pvbmUoaW50IGksIHZvaWQgKmJsa3pvbmUpCj4gPiA+ICAg
ICAgICAgc3RydWN0IGJsa196b25lX3JhbmdlIHJhbmdlOwo+ID4gPiAgICAgICAgIGludCByZXQ7
Cj4gPiA+Cj4gPiA+IC0gICAgICAgaWYgKCFibGtfem9uZV9zZXEoYmxreikgfHwgYmxrX3pvbmVf
ZW1wdHkoYmxreikpCj4gPiA+ICsgICAgICAgaWYgKCFibGtfem9uZV9zZXEoYmxreikgfHwgIWJs
a196b25lX29wZW4oYmxreikpCj4gPgo+ID4gRG9uJ3Qgd2UgbmVlZCB0byBjaGVjayBibGtfem9u
ZV9lbXB0eSgpIGFueW1vcmU/Cj4KPiBJIHRoaW5rIHRoZSBwdXJwb3NlIG9mIGZpbmlzaGluZyBh
IHpvbmUgaXMgdG8gY2xvc2UgYW55IG9wZW4gem9uZXMuIEkgZXhwZWN0Cj4gdGhlIGVtcHR5fGZ1
bGwgem9uZSB3aWxsIGJlIHJlc2V0IGJ5IGYyZnMgbGF0ZXIgYmVmb3JlIHVzZS4KCm1ha2VzIHNl
bnNlLgoKUmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpU
aGFua3MsCgoKPgo+ID4KPiA+ID4gICAgICAgICAgICAgICAgIHJldHVybiAwOwo+ID4gPgo+ID4g
PiAgICAgICAgIC8qIE5vbiBlbXB0eSBzZXF1ZW50aWFsIHpvbmU6IGZpbmlzaCAqLwo+ID4gPiBA
QCAtNTIyLDcgKzUyMiw4IEBAIGludCBmMmZzX2ZpbmlzaF96b25lKGludCBpLCB2b2lkICpibGt6
b25lKQo+ID4gPiAgICAgICAgIHJldCA9IGlvY3RsKGRldi0+ZmQsIEJMS0ZJTklTSFpPTkUsICZy
YW5nZSk7Cj4gPiA+ICAgICAgICAgaWYgKHJldCAhPSAwKSB7Cj4gPiA+ICAgICAgICAgICAgICAg
ICByZXQgPSAtZXJybm87Cj4gPiA+IC0gICAgICAgICAgICAgICBFUlJfTVNHKCJpb2N0bCBCTEtG
SU5JU0haT05FIGZhaWxlZDogZXJybm89JWRcbiIsIGVycm5vKTsKPiA+ID4gKyAgICAgICAgICAg
ICAgIEVSUl9NU0coImlvY3RsIEJMS0ZJTklTSFpPTkUgZmFpbGVkOiBlcnJubz0lZCwgc3RhdHVz
PSVzXG4iLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBlcnJubywgYmxrX3pvbmVfY29u
ZF9zdHIoYmxreikpOwo+ID4gPiAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICByZXR1cm4g
cmV0Owo+ID4gPiAtLQo+ID4gPiAyLjQ2LjAuNzYuZ2U1NTljNGJmMWEtZ29vZwo+ID4gPgo+ID4g
Pgo+ID4gPgo+ID4gPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+ID4gPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiBMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
