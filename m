Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E95A2A70CF4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Mar 2025 23:34:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1txCqm-0005hF-5m;
	Tue, 25 Mar 2025 22:34:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1txCqk-0005h9-SQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 22:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uos4nIEGtskCz3kQxHDBkGDTKQCWMZ5uRqFgYPmUsx4=; b=ZdMi7HMbUJqteycKBzyv/oP59W
 r6OjMlaRbj1BDBQgQgkGadcqH9wOjKv/MQrJ2Y4VcJ6aYiDYb8KYUeXA95ku2m2d0ABgreGTcIP74
 QIo5wQg2KzJA1a7kTyXE+cRUYYqERn3eBo3BzdyWzqInkO3/wV5cXCDS5Q4r1Aig1Om8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uos4nIEGtskCz3kQxHDBkGDTKQCWMZ5uRqFgYPmUsx4=; b=cx7Tb86qfCMYKwC3Jx3Kbi24fN
 19rHLpGxMqRteUx8S7EyeZCJ+wGA2dF36jbIEzeIPWyqb1ol1sGDXe7ouUOPGbw9B2K4v5qKJzRr4
 BcSTwphTXxdHCVYqYB/MLeBFh0uWNc/5+Vf+FLFKu5EeRhj6Sv8TuFPEZyaHj3HdG+Oc=;
Received: from mail-vk1-f172.google.com ([209.85.221.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1txCqj-00013P-HQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Mar 2025 22:34:22 +0000
Received: by mail-vk1-f172.google.com with SMTP id
 71dfb90a1353d-523eb86b31aso2654482e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 25 Mar 2025 15:34:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742942050; x=1743546850; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uos4nIEGtskCz3kQxHDBkGDTKQCWMZ5uRqFgYPmUsx4=;
 b=YP4YjZTyUzmOThyxd2wHBjxy2SODuRlHd4dX7wZdAVzQHxsVX0VVPgPLqb4XBSG2Ma
 5CxuECd0HqXgeHT/scFWLNGA7+6CPhX+2ZsVeIhFIlhul0UiiGF9m3ZuakgEUW+JvS13
 1JHIj21B1wJGIrt4wYkatyyM8I22qwU6lMKOysum38msXczjVuzhhMWV8EoRqyBCjeYh
 jAe/bwYOF9YK06yIX2M09vCdeYQdaww5pIn1uh+1yyAc85QnOLmZnCljA54RE7qmpO0Y
 On25wE4MjIVIniEDuevAjsKhhMEk0aXjBU2buTUuS2UIMLpOYppMsI5hq2emNBt5Lnyc
 HGdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742942050; x=1743546850;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uos4nIEGtskCz3kQxHDBkGDTKQCWMZ5uRqFgYPmUsx4=;
 b=jzX4XwoLskUCdlXHuvtYnAe7UKg7yd9+pXJZntFbxazgjZrymy2qFvqRL3RqyhvsFr
 5+GKADbZaLzeDXsWKWZZ+h9q6FLRtHPlZW/tbvDJgD9Id/TuE3X8MN4b+XgMFlT/MqCq
 TRBlksLrwh+aYoGEZ4BKCdRFz20G2nurij8wh5OyX1Mg/JHDY8YBN1l9ReLKMXCbvVRS
 VuKg4njDgX1qm8G3FqCIBfnAFzn1rmQQhKbWhqKmVmQIYrqnxB1lAiCKScJd6VIfyMbp
 42QL/3uq4ih5JIjMJsz0fPFedW/w6lHetpH0lHy1djrsGo9xQA5hHmkyF4Usm20clBCj
 MBwQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4Ve5ssVRg5LUgOAW9QwOdrF0Ck2YLAvADZO/CnnIRmF9UXFMa5AIHUPJU3WauLc3ZN0DypPWSVzREEocoMn8U@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzgEETcpCMKlDfGiPxI9FdbKT17ob2EjIUoS9v+e+SR0WBCdjc8
 PRYhcQo87WA7iwCDMelxPXwr6xxNllTQ0+hF7u2jHzMAo4AGI1ijMV0+VQB+vgoncYwjPUxopCX
 tec1QBd1D4rGyVf/ILOu/MWL6DSo=
X-Gm-Gg: ASbGncvvDUmpRH8s0jpHh+3ZTNz+m/tB/65aNRNHO1RTmGwHTBiSJD0/51KyfTcuG7z
 TkFMB5DoK86Pk+PrMrN3uQC2sPGTqPJTXbZ9so4YKBFMgWks3llKKKelASuQeWoauczhsc5fUe6
 R4/rOCUWRnxhqwn6gzb3dhs3Kz+xSvvjUQEx501QYIwCPBA0Vn7Ev5IBIN
X-Google-Smtp-Source: AGHT+IEZEfp0IC0V1HCPvxajk9/zFfT2FEvemSSUeEzas4JC8+lyDOdIkFJMziNTBvhAu/U33Ngy5eRo5qyZwG4meYc=
X-Received: by 2002:a05:6102:358c:b0:4ba:971a:41fd with SMTP id
 ada2fe7eead31-4c50d626786mr15442298137.19.1742942050371; Tue, 25 Mar 2025
 15:34:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250325080646.3291947-1-chao@kernel.org>
In-Reply-To: <20250325080646.3291947-1-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 25 Mar 2025 15:33:59 -0700
X-Gm-Features: AQ5f1JqgLFr6hrR_b21OMLQFPCtalcWZu0uy8F3y1Tn6V7X3QEqCyY1gLLihExU
Message-ID: <CACOAw_wH6E1tU9KGBjyBxLGzZSFMDeU=49hVs=cEqehdqKoF0Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Mar 25, 2025 at 1:09 AM Chao Yu via Linux-f2fs-devel
    wrote: > > A zoned device can has both conventional zones and sequential
   zones, > so we should not treat first segment of zoned device [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.172 listed in list.dnswl.org]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.221.172 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [209.85.221.172 listed in bl.score.senderscore.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1txCqj-00013P-HQ
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: zone: fix to calculate
 first_zoned_segno correctly
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXIgMjUsIDIwMjUgYXQgMTowOeKAr0FNIENoYW8gWXUgdmlhIExpbnV4LWYyZnMt
ZGV2ZWwKPGxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0PiB3cm90ZToKPgo+
IEEgem9uZWQgZGV2aWNlIGNhbiBoYXMgYm90aCBjb252ZW50aW9uYWwgem9uZXMgYW5kIHNlcXVl
bnRpYWwgem9uZXMsCj4gc28gd2Ugc2hvdWxkIG5vdCB0cmVhdCBmaXJzdCBzZWdtZW50IG9mIHpv
bmVkIGRldmljZSBhcyBmaXJzdF96b25lZF9zZWdubywKPiBpbnN0ZWFkLCB3ZSBuZWVkIHRvIGNo
ZWNrIHpvbmUgdHlwZSBmb3IgZWFjaCB6b25lIGR1cmluZyB0cmF2ZXJzaW5nIHpvbmVkCj4gZGV2
aWNlIHRvIGZpbmQgZmlyc3Rfem9uZWRfc2Vnbm8uCj4KPiBPdGhlcndpc2UsIGZvciBiZWxvdyBj
YXNlLCBmaXJzdF96b25lZF9zZWdubyB3aWxsIGJlIDAsIHdoaWNoIGNvdWxkIGJlCj4gd3Jvbmcu
Cj4KPiBjcmVhdGVfbnVsbF9ibGsgNTEyIDIgMTAyNCAxMDI0Cj4gbWtmcy5mMmZzIC1tIC9kZXYv
bnVsbGIwCj4KPiBGaXhlczogOTcwM2Q2OWQ5ZDE1ICgiZjJmczogc3VwcG9ydCBmaWxlIHBpbm5p
bmcgZm9yIHpvbmVkIGRldmljZXMiKQo+IENjOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29n
bGUuY29tPgo+IFNpZ25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0K
PiB2MjoKPiAtIHRyYXZlcnNlIHcvIHpvbmUgdW5pdCBpbiBnZXRfZmlyc3Rfem9uZWRfc2Vnbm8o
KQo+ICBmcy9mMmZzL2YyZnMuaCAgICB8IDE4ICsrKysrKysrKysrKystLS0tLQo+ICBmcy9mMmZz
L3NlZ21lbnQuYyB8ICAyICstCj4gIGZzL2YyZnMvc3VwZXIuYyAgIHwgMzcgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDQ3IGluc2VydGlv
bnMoKyksIDEwIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIv
ZnMvZjJmcy9mMmZzLmgKPiBpbmRleCBjYTg4NGUzOWE1ZmYuLjNkZWEwMzdmYWE1NSAxMDA2NDQK
PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gQEAgLTQ2MzAs
MTIgKzQ2MzAsMTYgQEAgRjJGU19GRUFUVVJFX0ZVTkNTKHJlYWRvbmx5LCBSTyk7Cj4gIEYyRlNf
RkVBVFVSRV9GVU5DUyhkZXZpY2VfYWxpYXMsIERFVklDRV9BTElBUyk7Cj4KPiAgI2lmZGVmIENP
TkZJR19CTEtfREVWX1pPTkVECj4gLXN0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2Jsa3pfaXNfc2Vx
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGRldmksCj4gLSAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgYmxvY2tfdCBibGthZGRyKQo+ICtzdGF0aWMgaW5saW5lIGJvb2wg
ZjJmc196b25lX2lzX3NlcShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBkZXZpLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgdW5z
aWduZWQgaW50IHpvbmUpCj4gIHsKPiAtICAgICAgIHVuc2lnbmVkIGludCB6bm8gPSBibGthZGRy
IC8gc2JpLT5ibG9ja3NfcGVyX2Jsa3o7Cj4gKyAgICAgICByZXR1cm4gdGVzdF9iaXQoem9uZSwg
RkRFVihkZXZpKS5ibGt6X3NlcSk7Cj4gK30KPgo+IC0gICAgICAgcmV0dXJuIHRlc3RfYml0KHpu
bywgRkRFVihkZXZpKS5ibGt6X3NlcSk7Cj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2Jsa3pf
aXNfc2VxKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IGRldmksCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsb2Nr
X3QgYmxrYWRkcikKPiArewo+ICsgICAgICAgcmV0dXJuIGYyZnNfem9uZV9pc19zZXEoc2JpLCBk
ZXZpLCBibGthZGRyIC8gc2JpLT5ibG9ja3NfcGVyX2Jsa3opOwo+ICB9Cj4gICNlbmRpZgo+Cj4g
QEAgLTQ3MTEsOSArNDcxNSwxMyBAQCBzdGF0aWMgaW5saW5lIGJvb2wgZjJmc192YWxpZF9waW5u
ZWRfYXJlYShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYmxvY2tfdCBibGthZGRyKQo+ICB7Cj4gICAgICAgICBpZiAo
ZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkgewo+ICsjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9O
RUQKPiAgICAgICAgICAgICAgICAgaW50IGRldmkgPSBmMmZzX3RhcmdldF9kZXZpY2VfaW5kZXgo
c2JpLCBibGthZGRyKTsKPgo+IC0gICAgICAgICAgICAgICByZXR1cm4gIWJkZXZfaXNfem9uZWQo
RkRFVihkZXZpKS5iZGV2KTsKPiArICAgICAgICAgICAgICAgcmV0dXJuICFmMmZzX2Jsa3pfaXNf
c2VxKHNiaSwgZGV2aSwgYmxrYWRkcik7Cj4gKyNlbHNlCj4gKyAgICAgICAgICAgICAgIHJldHVy
biB0cnVlOwo+ICsjZW5kaWYKPiAgICAgICAgIH0KPiAgICAgICAgIHJldHVybiB0cnVlOwo+ICB9
Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiBp
bmRleCAzOTZlZjcxZjQxZTMuLmRjMzYwYjRiMDU2OSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3Nl
Z21lbnQuYwo+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gQEAgLTMzMTEsNyArMzMxMSw3IEBA
IGludCBmMmZzX2FsbG9jYXRlX3Bpbm5pbmdfc2VjdGlvbihzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmkpCj4KPiAgICAgICAgIGlmIChmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpICYmIGVyciA9PSAt
RUFHQUlOICYmIGdjX3JlcXVpcmVkKSB7Cj4gICAgICAgICAgICAgICAgIGYyZnNfZG93bl93cml0
ZSgmc2JpLT5nY19sb2NrKTsKPiAtICAgICAgICAgICAgICAgZXJyID0gZjJmc19nY19yYW5nZShz
YmksIDAsIEdFVF9TRUdOTyhzYmksIEZERVYoMCkuZW5kX2JsayksCj4gKyAgICAgICAgICAgICAg
IGVyciA9IGYyZnNfZ2NfcmFuZ2Uoc2JpLCAwLCBzYmktPmZpcnN0X3pvbmVkX3NlZ25vIC0gMSwK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHRydWUsIFpPTkVEX1BJTl9TRUNfUkVR
VUlSRURfQ09VTlQpOwo+ICAgICAgICAgICAgICAgICBmMmZzX3VwX3dyaXRlKCZzYmktPmdjX2xv
Y2spOwo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+
IGluZGV4IDAxMTkyNWVlNTRmOC4uOWE0MmExMzIzZjQyIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMv
c3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+IEBAIC00MzA3LDEyICs0MzA3LDMzIEBA
IHN0YXRpYyB2b2lkIGYyZnNfcmVjb3JkX2Vycm9yX3dvcmsoc3RydWN0IHdvcmtfc3RydWN0ICp3
b3JrKQo+Cj4gIHN0YXRpYyBpbmxpbmUgdW5zaWduZWQgaW50IGdldF9maXJzdF96b25lZF9zZWdu
byhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4gIHsKPiArI2lmZGVmIENPTkZJR19CTEtfREVW
X1pPTkVECj4gKyAgICAgICB1bnNpZ25lZCBpbnQgem9uZW5vLCB0b3RhbF96b25lczsKPiAgICAg
ICAgIGludCBkZXZpOwo+Cj4gLSAgICAgICBmb3IgKGRldmkgPSAwOyBkZXZpIDwgc2JpLT5zX25k
ZXZzOyBkZXZpKyspCj4gLSAgICAgICAgICAgICAgIGlmIChiZGV2X2lzX3pvbmVkKEZERVYoZGV2
aSkuYmRldikpCj4gLSAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIEdFVF9TRUdOTyhzYmks
IEZERVYoZGV2aSkuc3RhcnRfYmxrKTsKPiAtICAgICAgIHJldHVybiAwOwo+ICsgICAgICAgaWYg
KCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+ICsgICAgICAgICAgICAgICByZXR1cm4gTlVM
TF9TRUdOTzsKPiArCj4gKyAgICAgICBmb3IgKGRldmkgPSAwOyBkZXZpIDwgc2JpLT5zX25kZXZz
OyBkZXZpKyspIHsKPiArICAgICAgICAgICAgICAgaWYgKCFiZGV2X2lzX3pvbmVkKEZERVYoZGV2
aSkuYmRldikpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAg
ICAgICAgICAgICB0b3RhbF96b25lcyA9IEdFVF9aT05FX0ZST01fU0VHKHNiaSwgRkRFVihkZXZp
KS50b3RhbF9zZWdtZW50cyk7Cj4gKwo+ICsgICAgICAgICAgICAgICBmb3IgKHpvbmVubyA9IDA7
IHpvbmVubyA8IHRvdGFsX3pvbmVzOyB6b25lbm8rKykgewo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHVuc2lnbmVkIGludCBzZWdzLCBibGtzOwo+ICsKPiArICAgICAgICAgICAgICAgICAgICAg
ICBpZiAoIWYyZnNfem9uZV9pc19zZXEoc2JpLCBkZXZpLCB6b25lbm8pKQo+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHNlZ3MgPSBHRVRfU0VHX0ZST01fU0VDKHNiaSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgem9uZW5vICogc2JpLT5zZWNzX3Blcl96b25lKTsKPiArICAgICAg
ICAgICAgICAgICAgICAgICBibGtzID0gU0VHU19UT19CTEtTKHNiaSwgc2Vncyk7Cj4gKyAgICAg
ICAgICAgICAgICAgICAgICAgcmV0dXJuIEdFVF9TRUdOTyhzYmksIEZERVYoZGV2aSkuc3RhcnRf
YmxrICsgYmxrcyk7Cj4gKyAgICAgICAgICAgICAgIH0KPiArICAgICAgIH0KPiArI2VuZGlmCj4g
KyAgICAgICByZXR1cm4gTlVMTF9TRUdOTzsKPiAgfQo+Cj4gIHN0YXRpYyBpbnQgZjJmc19zY2Fu
X2RldmljZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+IEBAIC00MzQ5LDYgKzQzNzAsMTQg
QEAgc3RhdGljIGludCBmMmZzX3NjYW5fZGV2aWNlcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Cj4gICNlbmRpZgo+Cj4gICAgICAgICBmb3IgKGkgPSAwOyBpIDwgbWF4X2RldmljZXM7IGkrKykg
ewo+ICsgICAgICAgICAgICAgICBpZiAobWF4X2RldmljZXMgPT0gMSkgewo+ICsgICAgICAgICAg
ICAgICAgICAgICAgIEZERVYoaSkudG90YWxfc2VnbWVudHMgPQo+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgbGUzMl90b19jcHUocmF3X3N1cGVyLT5zZWdtZW50X2NvdW50X21haW4p
Owo+ICsgICAgICAgICAgICAgICAgICAgICAgIEZERVYoaSkuc3RhcnRfYmxrID0gMDsKPiArICAg
ICAgICAgICAgICAgICAgICAgICBGREVWKGkpLmVuZF9ibGsgPSBGREVWKGkpLnRvdGFsX3NlZ21l
bnRzICoKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBC
TEtTX1BFUl9TRUcoc2JpKTsKPiArICAgICAgICAgICAgICAgfQo+ICsKPiAgICAgICAgICAgICAg
ICAgaWYgKGkgPT0gMCkKPiAgICAgICAgICAgICAgICAgICAgICAgICBGREVWKDApLmJkZXZfZmls
ZSA9IHNiaS0+c2ItPnNfYmRldl9maWxlOwo+ICAgICAgICAgICAgICAgICBlbHNlIGlmICghUkRF
VihpKS5wYXRoWzBdKQo+IC0tCj4gMi40OC4xCj4KClJldmlld2VkLWJ5OiBEYWVobyBKZW9uZyA8
ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKVGhhbmtzLgoKPgo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
