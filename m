Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 30832A88EFF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Apr 2025 00:22:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u4SCY-0005tW-T8;
	Mon, 14 Apr 2025 22:22:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1u4SCH-0005tE-GD
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:22:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iK/nxqicaOMRgHlN+BH55oegbNVrqJvNg6xS7Bg7ixo=; b=KCmJDJFxvP5ZYU/MUSH0DqX7rT
 liEnWl0Sz0SnnRYroKFqBmqYXL7GnIUMQFLz4elxv2UQvTHoO//m2YK0D8XclcnxRpCeiEj8hrXXJ
 ZFOxQJUM4eeK6KfiToHgn64EpS5/jiP6n37Ird/Y1hS2MEProQg5bkv8lc6JwKUQ9DlI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iK/nxqicaOMRgHlN+BH55oegbNVrqJvNg6xS7Bg7ixo=; b=gJLeeFIp3U4xd5XNyerFaPJI/l
 f4jLwXV38168QkIMcrPglxQvclUN0I725ywp5IDPF76kqkmY5yIEikrbFaKXPBH9zijIuCS10pFHG
 Xq6TaerPTf1rms4Q6xLW4v8Ba+p7UDt3Mi0/6gzECSTbyc/hlHtqACtVCyj91z8Snm08=;
Received: from mail-ua1-f54.google.com ([209.85.222.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u4SC1-0006rv-D0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Apr 2025 22:22:33 +0000
Received: by mail-ua1-f54.google.com with SMTP id
 a1e0cc1a2514c-86d6fd581f4so5393232241.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 14 Apr 2025 15:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1744669326; x=1745274126; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iK/nxqicaOMRgHlN+BH55oegbNVrqJvNg6xS7Bg7ixo=;
 b=M3iLVCe+pr9WD9sNP6Acp+Fulvmfpwk6wQt8RU68NLFqn1I5i2wrWqJGJCA7t+VDaa
 Ol8hu4NQ53uG5zfzv3pQwmKjz5vcZ+nokAiZLHXDz576ej0OCjqaZr2mWF9d46pjPcZk
 7o77E7AGDP/v3WMd6qa2XYxfYPpI7NfCRwvlt1tOo+2Niobi9JzRKUZjbD7aUH3HJhF2
 F7wqdMFbDrV59m9C455nXQy2ixw93zwmjlnbkG6c1g2dOcboCN6vypyYSP3HZOEvathB
 ga5XoTB/aNgtyByuc+l24b/U5xcGJr+kUeWhmvLx3wtVc+x1hUtIwQR3V8OMINgC3qMb
 kS0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744669326; x=1745274126;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iK/nxqicaOMRgHlN+BH55oegbNVrqJvNg6xS7Bg7ixo=;
 b=hE/WwOF8aiLqFFbA3FXJt8N+ZR2DZFQ/vS9e/NMAC/1/4T+D6POonETHSwtqU4/g86
 AiIvVrJXuD07NHwqFU8JioMsIV0p6QKGHWeZezDsxjS2oztTwWftiN8u2wCLh0fIrStk
 qB04TWa1l2kVZ2ltHvs+DtkUDsXBYXzh5J/EbNS54p4pY72eP+aznnFHAHOvGy73umLL
 v0Y80BECvoIbhOt+VSHG65Na0qhd+4miYQW3wp6sTW93M2f3ssLE1d6JEwsbRSar6J9r
 ptTtCiRDkleZz68M/7G/PtQ4sNIUV1yfPCCxz2sQZMX9wOX1C6ADGUtrlsGaAaOYZRrJ
 6n5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWgwua8ChG1ZzrJineXSyh2IErGVtoeZ8i2T/y3FPYQ4TU1c9lsXlNX8z1eKFK31qu4zPSVuErkmqrpac/88eF@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwOix9VXrP5TraTfwrm8YBxHYBOSta6g4LEQVW2LBhOy/BoJ2u4
 8jA2yOO5GQsytzNuBNRmwNQ5StshkcgCW8XRjdEN+JXQGlBxVbGXCijK0t8BgSCw56hYEZ73MqE
 sjOLjUWFV2g+ZJFsrohnEhSmf4YU=
X-Gm-Gg: ASbGncsYLB71OB2i//2nSKMd5seOjshH7SVjKLsS901DoMvIGQxcvYE1fQDhi2BYUNm
 K7zT3PBHPdNozXkGpUBXNM/aZSlEfDn2R+ZdDyy4uQIdmhc5rDN9rlOXqhnyzUZu4qhFxdfEIVc
 GZ8Mfj27AeDHsVX6cWEKI/WIAma6Axcba1qbbMR3gRoOyUaRE+1ToRFMI=
X-Google-Smtp-Source: AGHT+IF0/N+41owJcwFJnZTGUTx2bmokxI68RBiwge12PFIrT/0VRnWiurjDcdvq+4FtF6W2GBvhu29U/K4CWYouBfo=
X-Received: by 2002:a67:c986:0:b0:4c4:ebb1:4f6d with SMTP id
 ada2fe7eead31-4cb42eb1e78mr892003137.11.1744669326413; Mon, 14 Apr 2025
 15:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250410001747.1844-1-yohan.joung@sk.com>
 <de198b35-fdfd-4fe9-98b9-bb346a81b54c@kernel.org>
In-Reply-To: <de198b35-fdfd-4fe9-98b9-bb346a81b54c@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 14 Apr 2025 15:21:55 -0700
X-Gm-Features: ATxdqUFIeybaPUiDisaKH1o_2ttH9TqwAAbsl-twjTpipedkdep39QFCv1tlaHs
Message-ID: <CACOAw_x6YjYzF0PbifP05c9fnO9n1r_jN8NxUByef3DMPVXjPQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Fri, Apr 11, 2025 at 3:07 AM Chao Yu wrote: > > Yohan,
    > > Sorry for the delay, will catch up this a little bit latter. > > On 2025/4/10
    8:17, yohan.joung wrote: > > hi jeageuk, chao > > How ab [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [209.85.222.54 listed in bl.score.senderscore.com]
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                          [209.85.222.54 listed in sa-trusted.bondedsender.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.54 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.54 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1u4SC1-0006rv-D0
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: Improve large section GC by
 locating valid block segments
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
 linux-kernel@vger.kernel.org, pilhyun.kim@sk.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMzowN+KAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBZb2hhbiwKPgo+IFNvcnJ5IGZvciB0aGUgZGVsYXksIHdpbGwgY2F0Y2gg
dXAgdGhpcyBhIGxpdHRsZSBiaXQgbGF0dGVyLgo+Cj4gT24gMjAyNS80LzEwIDg6MTcsIHlvaGFu
LmpvdW5nIHdyb3RlOgo+ID4gaGkgamVhZ2V1aywgY2hhbwo+ID4gSG93IGFib3V0IGNoYW5naW5n
IHRoZSBsYXJnZSBzZWN0aW9uIGdjIGluIHRoaXMgZGlyZWN0aW9uPwo+ID4gVGhhbmtzCj4gPgo+
ID4+IENoYW5nZSB0aGUgbGFyZ2Ugc2VjdGlvbiBHQyB0byBsb2NhdGUgdmFsaWQgYmxvY2sgc2Vn
bWVudHMgaW5zdGVhZCBvZgo+ID4+IHBlcmZvcm1pbmcgYSBzZXF1ZW50aWFsIHNlYXJjaC4gVGhp
cyBtb2RpZmljYXRpb24gZW5oYW5jZXMgcGVyZm9ybWFuY2UKPiA+PiBieSByZWR1Y2luZyB1bm5l
Y2Vzc2FyeSBibG9jayBzY2FubmluZyBpbiBsYXJnZSBzdG9yYWdlIHNlY3Rpb25zLgo+ID4+Cj4g
Pj4gZXhhbXBsZSA6Cj4gPj4gW2ludmFsaWQgc2VnIDBdIFtpbnZhbGlkIHNlZyAxXSBbaW52YWxp
ZCBzZWcgMl0KPiA+PiBbICB2YWxpZCBzZWcgM10gWyAgdmFsaWQgc2VnIDRdIFsgIHZhbGlkIHNl
ZyA1XQo+ID4+Cj4gPj4gQ3VycmVudDogSW4gdGhlIGZpcnN0IEdDLCBub3RoaW5nIGlzIG1vdmVk
LAo+ID4+IGJ1dCBpbiB0aGUgc2Vjb25kIEdDLCBzZWdtZW50cyAzLCA0LCBhbmQgNSBhcmUgbW92
ZWQuCj4gPj4gQ2hhbmdlOiBJbiB0aGUgZmlyc3QgR0MsIHNlZ21lbnRzIDMsIDQsIGFuZCA1IGFy
ZSBtb3ZlZC4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IHlvaGFuLmpvdW5nIDx5b2hhbi5qb3Vu
Z0Bzay5jb20+Cj4gPj4gLS0tCj4gPj4gICBmcy9mMmZzL2YyZnMuaCAgfCAgMiArKwo+ID4+ICAg
ZnMvZjJmcy9nYy5jICAgIHwgOTIgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKyst
LS0tLS0tLS0tLS0tLQo+ID4+ICAgZnMvZjJmcy9nYy5oICAgIHwgIDYgKysrKwo+ID4+ICAgZnMv
ZjJmcy9zdXBlci5jIHwgIDggKysrKy0KPiA+PiAgIDQgZmlsZXMgY2hhbmdlZCwgODIgaW5zZXJ0
aW9ucygrKSwgMjYgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
MmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+ID4+IGluZGV4IGYxNTc2ZGM2ZWM2Ny4uMzQ4NDE3ZWRh
YzI1IDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPj4gKysrIGIvZnMvZjJmcy9m
MmZzLmgKPiA+PiBAQCAtNDAwOCw2ICs0MDA4LDggQEAgaW50IGYyZnNfZ2NfcmFuZ2Uoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4+ICAgaW50IGYyZnNfcmVzaXplX2ZzKHN0cnVjdCBmaWxl
ICpmaWxwLCBfX3U2NCBibG9ja19jb3VudCk7Cj4gPj4gICBpbnQgX19pbml0IGYyZnNfY3JlYXRl
X2dhcmJhZ2VfY29sbGVjdGlvbl9jYWNoZSh2b2lkKTsKPiA+PiAgIHZvaWQgZjJmc19kZXN0cm95
X2dhcmJhZ2VfY29sbGVjdGlvbl9jYWNoZSh2b2lkKTsKPiA+PiAraW50IF9faW5pdCBmMmZzX2lu
aXRfZ2FyYmFnZV9jb2xsZWN0aW9uX3N1bW1hcnlfY2FjaGUodm9pZCk7Cj4gPj4gK3ZvaWQgZjJm
c19kZXN0cm95X2dhcmJhZ2VfY29sbGVjdGlvbl9zdW1tYXJ5X2NhY2hlKHZvaWQpOwo+ID4+ICAg
LyogdmljdGltIHNlbGVjdGlvbiBmdW5jdGlvbiBmb3IgY2xlYW5pbmcgYW5kIFNTUiAqLwo+ID4+
ICAgaW50IGYyZnNfZ2V0X3ZpY3RpbShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVk
IGludCAqcmVzdWx0LAo+ID4+ICAgICAgICAgICAgICAgICAgICAgIGludCBnY190eXBlLCBpbnQg
dHlwZSwgY2hhciBhbGxvY19tb2RlLAo+ID4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmMgYi9m
cy9mMmZzL2djLmMKPiA+PiBpbmRleCAyYjhmOTIzOWJlZGUuLjNiNjNlODVmYTAzOCAxMDA2NDQK
PiA+PiAtLS0gYS9mcy9mMmZzL2djLmMKPiA+PiArKysgYi9mcy9mMmZzL2djLmMKPiA+PiBAQCAt
MjQsNiArMjQsNyBAQAo+ID4+ICAgI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9mMmZzLmg+Cj4gPj4K
PiA+PiAgIHN0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqdmljdGltX2VudHJ5X3NsYWI7Cj4gPj4g
K3N0YXRpYyBzdHJ1Y3Qga21lbV9jYWNoZSAqZ2NfcGFnZV9lbnRyeV9zbGFiOwo+ID4+Cj4gPj4g
ICBzdGF0aWMgdW5zaWduZWQgaW50IGNvdW50X2JpdHMoY29uc3QgdW5zaWduZWQgbG9uZyAqYWRk
ciwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVuc2lnbmVkIGludCBvZmZzZXQs
IHVuc2lnbmVkIGludCBsZW4pOwo+ID4+IEBAIC03MTEsNiArNzEyLDMwIEBAIHN0YXRpYyB2b2lk
IHJlbGVhc2VfdmljdGltX2VudHJ5KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+PiAgICAg
IGYyZnNfYnVnX29uKHNiaSwgIWxpc3RfZW1wdHkoJmFtLT52aWN0aW1fbGlzdCkpOwo+ID4+ICAg
fQo+ID4+Cj4gPj4gK3N0YXRpYyBzdHJ1Y3QgZ2NfcGFnZV9lbnRyeSAqYWRkX2djX3BhZ2VfZW50
cnkoc3RydWN0IGxpc3RfaGVhZCAqZ2NfcGFnZV9saXN0LAo+ID4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgcGFnZSAqc3VtX3BhZ2UsIHVuc2lnbmVkIGludCBz
ZWdubykKPiA+PiArewo+ID4+ICsgICAgc3RydWN0IGdjX3BhZ2VfZW50cnkgKmdwZTsKPiA+PiAr
Cj4gPj4gKyAgICBncGUgPSBmMmZzX2ttZW1fY2FjaGVfYWxsb2MoZ2NfcGFnZV9lbnRyeV9zbGFi
LCBHRlBfTk9GUywgdHJ1ZSwgTlVMTCk7Cj4gPj4gKyAgICBncGUtPnNlZ25vID0gc2Vnbm87Cj4g
Pj4gKyAgICBncGUtPnN1bV9wYWdlID0gc3VtX3BhZ2U7Cj4gPj4gKyAgICBsaXN0X2FkZF90YWls
KCZncGUtPmxpc3QsIGdjX3BhZ2VfbGlzdCk7Cj4gPj4gKyAgICByZXR1cm4gZ3BlOwo+ID4+ICt9
Cj4gPj4gKwo+ID4+ICtzdGF0aWMgdm9pZCByZWxlYXNlX2djX3BhZ2VfZW50cnkoc3RydWN0IGxp
c3RfaGVhZCAqZ2NfcGFnZV9saXN0LCBib29sIHB1dHBhZ2UpCj4gPj4gK3sKPiA+PiArICAgIHN0
cnVjdCBnY19wYWdlX2VudHJ5ICpncGUsICp0bXA7Cj4gPj4gKwo+ID4+ICsgICAgbGlzdF9mb3Jf
ZWFjaF9lbnRyeV9zYWZlKGdwZSwgdG1wLCBnY19wYWdlX2xpc3QsIGxpc3QpIHsKPiA+PiArICAg
ICAgICAgICAgaWYgKHB1dHBhZ2UpCj4gPj4gKyAgICAgICAgICAgICAgICAgICAgZjJmc19wdXRf
cGFnZShncGUtPnN1bV9wYWdlLCAwKTsKPiA+PiArICAgICAgICAgICAgbGlzdF9kZWwoJmdwZS0+
bGlzdCk7Cj4gPj4gKyAgICAgICAgICAgIGttZW1fY2FjaGVfZnJlZShnY19wYWdlX2VudHJ5X3Ns
YWIsIGdwZSk7Cj4gPj4gKyAgICB9Cj4gPj4gK30KPiA+PiArCj4gPj4gICBzdGF0aWMgYm9vbCBm
MmZzX3Bpbl9zZWN0aW9uKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgaW50IHNl
Z25vKQo+ID4+ICAgewo+ID4+ICAgICAgc3RydWN0IGRpcnR5X3NlZ2xpc3RfaW5mbyAqZGlydHlf
aSA9IERJUlRZX0koc2JpKTsKPiA+PiBAQCAtMTcyMSwxNCArMTc0NiwxOCBAQCBzdGF0aWMgaW50
IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4gICAgICBz
dHJ1Y3QgcGFnZSAqc3VtX3BhZ2U7Cj4gPj4gICAgICBzdHJ1Y3QgZjJmc19zdW1tYXJ5X2Jsb2Nr
ICpzdW07Cj4gPj4gICAgICBzdHJ1Y3QgYmxrX3BsdWcgcGx1ZzsKPiA+PiArICAgIHN0cnVjdCBn
Y19wYWdlX2VudHJ5ICpncGU7Cj4gPj4gICAgICB1bnNpZ25lZCBpbnQgc2Vnbm8gPSBzdGFydF9z
ZWdubzsKPiA+PiAgICAgIHVuc2lnbmVkIGludCBlbmRfc2Vnbm8gPSBzdGFydF9zZWdubyArIFNF
R1NfUEVSX1NFQyhzYmkpOwo+ID4+ICAgICAgdW5zaWduZWQgaW50IHNlY19lbmRfc2Vnbm87Cj4g
Pj4gKyAgICB1bnNpZ25lZCBpbnQgd2luZG93X2dyYW51bGFyaXR5ID0gMTsKPiA+PiAgICAgIGlu
dCBzZWdfZnJlZWQgPSAwLCBtaWdyYXRlZCA9IDA7Cj4gPj4gICAgICB1bnNpZ25lZCBjaGFyIHR5
cGUgPSBJU19EQVRBU0VHKGdldF9zZWdfZW50cnkoc2JpLCBzZWdubyktPnR5cGUpID8KPiA+PiAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBTVU1fVFlQRV9EQVRB
IDogU1VNX1RZUEVfTk9ERTsKPiA+PiAgICAgIHVuc2lnbmVkIGNoYXIgZGF0YV90eXBlID0gKHR5
cGUgPT0gU1VNX1RZUEVfREFUQSkgPyBEQVRBIDogTk9ERTsKPiA+PiAgICAgIGludCBzdWJtaXR0
ZWQgPSAwOwo+ID4+ICsgICAgaW50IGdjX2xpc3RfY291bnQgPSAwOwo+ID4+ICsgICAgTElTVF9I
RUFEKGdjX3BhZ2VfbGlzdCk7Cj4gPj4KPiA+PiAgICAgIGlmIChfX2lzX2xhcmdlX3NlY3Rpb24o
c2JpKSkgewo+ID4+ICAgICAgICAgICAgICBzZWNfZW5kX3NlZ25vID0gcm91bmRkb3duKGVuZF9z
ZWdubywgU0VHU19QRVJfU0VDKHNiaSkpOwo+ID4+IEBAIC0xNzQ0LDcgKzE3NzMsNyBAQCBzdGF0
aWMgaW50IGRvX2dhcmJhZ2VfY29sbGVjdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPj4g
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGYyZnNfdXNhYmxlX3NlZ3NfaW5f
c2VjKHNiaSk7Cj4gPj4KPiA+PiAgICAgICAgICAgICAgaWYgKGdjX3R5cGUgPT0gQkdfR0MgfHwg
b25lX3RpbWUpIHsKPiA+PiAtICAgICAgICAgICAgICAgICAgICB1bnNpZ25lZCBpbnQgd2luZG93
X2dyYW51bGFyaXR5ID0KPiA+PiArICAgICAgICAgICAgICAgICAgICB3aW5kb3dfZ3JhbnVsYXJp
dHkgPQo+ID4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5taWdyYXRpb25fd2lu
ZG93X2dyYW51bGFyaXR5OwoKUGx6LCByZWZlciB0byB0aGUgYmVsb3cgZGVzY3JpYmVkIGluIHN5
c2ZzLWZzLWYyZnMuCgpXaGF0OiAgICAgICAgICAgL3N5cy9mcy9mMmZzLzxkaXNrPi9taWdyYXRp
b25fd2luZG93X2dyYW51bGFyaXR5CkRhdGU6ICAgICAgICAgICBTZXB0ZW1iZXIgMjAyNApDb250
YWN0OiAgICAgICAgIkRhZWhvIEplb25nIiA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgpEZXNjcmlw
dGlvbjogICAgQ29udHJvbHMgbWlncmF0aW9uIHdpbmRvdyBncmFudWxhcml0eSBvZiBnYXJiYWdl
CmNvbGxlY3Rpb24gb24gbGFyZ2UKICAgICAgICAgICAgICAgIHNlY3Rpb24uIGl0IGNhbiBjb250
cm9sIHRoZSBzY2FubmluZyB3aW5kb3cKZ3JhbnVsYXJpdHkgZm9yIEdDIG1pZ3JhdGlvbgogICAg
ICAgICAgICAgICAgaW4gYSB1bml0IG9mIHNlZ21lbnQsIHdoaWxlIG1pZ3JhdGlvbl9ncmFudWxh
cml0eQpjb250cm9scyB0aGUgbnVtYmVyCiAgICAgICAgICAgICAgICBvZiBzZWdtZW50cyB3aGlj
aCBjYW4gYmUgbWlncmF0ZWQgYXQgdGhlIHNhbWUgdHVybi4KCkluIHlvdXIgcGF0Y2gsIGl0J3Mg
bW9yZSBsaWtlIG1pZ3JhdGlvbl9ncmFudWxhcml0eS4KUGx1cywgSSB0aGluayB3ZSBkb24ndCBu
ZWVkIG1pZ3JhdGlvbl93aW5kb3dfZ3JhbnVsYXJpdHkgYW55bW9yZSB3aXRoCnlvdXIgcGF0Y2gu
Cgo+ID4+Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgaWYgKGYyZnNfc2JfaGFzX2Jsa3pvbmVk
KHNiaSkgJiYKPiA+PiBAQCAtMTc1Miw4ICsxNzgxLDYgQEAgc3RhdGljIGludCBkb19nYXJiYWdl
X2NvbGxlY3Qoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ID4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBzYmktPmdjX3RocmVhZC0+Ym9vc3Rfem9uZWRfZ2NfcGVyY2Vu
dCkpCj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICB3aW5kb3dfZ3JhbnVsYXJpdHkg
Kj0KPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQk9PU1RfR0NfTVVM
VElQTEU7Cj4gPj4gLQo+ID4+IC0gICAgICAgICAgICAgICAgICAgIGVuZF9zZWdubyA9IHN0YXJ0
X3NlZ25vICsgd2luZG93X2dyYW51bGFyaXR5Owo+ID4+ICAgICAgICAgICAgICB9Cj4gPj4KPiA+
PiAgICAgICAgICAgICAgaWYgKGVuZF9zZWdubyA+IHNlY19lbmRfc2Vnbm8pCj4gPj4gQEAgLTE3
NjIsMzcgKzE3ODksMzggQEAgc3RhdGljIGludCBkb19nYXJiYWdlX2NvbGxlY3Qoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLAo+ID4+Cj4gPj4gICAgICBzYW5pdHlfY2hlY2tfc2VnX3R5cGUoc2Jp
LCBnZXRfc2VnX2VudHJ5KHNiaSwgc2Vnbm8pLT50eXBlKTsKPiA+Pgo+ID4+IC0gICAgLyogcmVh
ZGFoZWFkIG11bHRpIHNzYSBibG9ja3MgdGhvc2UgaGF2ZSBjb250aWd1b3VzIGFkZHJlc3MgKi8K
PiA+PiAtICAgIGlmIChfX2lzX2xhcmdlX3NlY3Rpb24oc2JpKSkKPiA+PiArICAgIGZvciAoc2Vn
bm8gPSBzdGFydF9zZWdubzsgc2Vnbm8gPCBlbmRfc2Vnbm87IHNlZ25vKyspIHsKPiA+PiArICAg
ICAgICAgICAgaWYgKCFnZXRfdmFsaWRfYmxvY2tzKHNiaSwgc2Vnbm8sIGZhbHNlKSkKPiA+PiAr
ICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKPiA+PiArCj4gPj4gKyAgICAgICAgICAgIC8q
IHJlYWRhaGVhZCBtdWx0aSBzc2EgYmxvY2tzIHRob3NlIGhhdmUgY29udGlndW91cyBhZGRyZXNz
ICovCj4gPj4gICAgICAgICAgICAgIGYyZnNfcmFfbWV0YV9wYWdlcyhzYmksIEdFVF9TVU1fQkxP
Q0soc2JpLCBzZWdubyksCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IGVuZF9zZWdubyAtIHNlZ25vLCBNRVRBX1NTQSwgdHJ1ZSk7Cj4gPj4gKyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB3aW5kb3dfZ3JhbnVsYXJpdHksIE1FVEFfU1NBLCB0cnVlKTsKPiA+Pgo+
ID4+IC0gICAgLyogcmVmZXJlbmNlIGFsbCBzdW1tYXJ5IHBhZ2UgKi8KPiA+PiAtICAgIHdoaWxl
IChzZWdubyA8IGVuZF9zZWdubykgewo+ID4+IC0gICAgICAgICAgICBzdW1fcGFnZSA9IGYyZnNf
Z2V0X3N1bV9wYWdlKHNiaSwgc2Vnbm8rKyk7Cj4gPj4gKyAgICAgICAgICAgIC8qIHJlZmVyZW5j
ZSBhbGwgc3VtbWFyeSBwYWdlICovCj4gPj4gKyAgICAgICAgICAgIHN1bV9wYWdlID0gZjJmc19n
ZXRfc3VtX3BhZ2Uoc2JpLCBzZWdubyk7Cj4gPj4gICAgICAgICAgICAgIGlmIChJU19FUlIoc3Vt
X3BhZ2UpKSB7Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgaW50IGVyciA9IFBUUl9FUlIoc3Vt
X3BhZ2UpOwo+ID4+IC0KPiA+PiAtICAgICAgICAgICAgICAgICAgICBlbmRfc2Vnbm8gPSBzZWdu
byAtIDE7Cj4gPj4gLSAgICAgICAgICAgICAgICAgICAgZm9yIChzZWdubyA9IHN0YXJ0X3NlZ25v
OyBzZWdubyA8IGVuZF9zZWdubzsgc2Vnbm8rKykgewo+ID4+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgc3VtX3BhZ2UgPSBmaW5kX2dldF9wYWdlKE1FVEFfTUFQUElORyhzYmkpLAo+ID4+
IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdFVF9TVU1fQkxP
Q0soc2JpLCBzZWdubykpOwo+ID4+IC0gICAgICAgICAgICAgICAgICAgICAgICAgICAgZjJmc19w
dXRfcGFnZShzdW1fcGFnZSwgMCk7Cj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
MmZzX3B1dF9wYWdlKHN1bV9wYWdlLCAwKTsKPiA+PiAtICAgICAgICAgICAgICAgICAgICB9Cj4g
Pj4gKyAgICAgICAgICAgICAgICAgICAgcmVsZWFzZV9nY19wYWdlX2VudHJ5KCZnY19wYWdlX2xp
c3QsIHRydWUpOwo+ID4+ICAgICAgICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4gPj4gICAg
ICAgICAgICAgIH0KPiA+PiArICAgICAgICAgICAgYWRkX2djX3BhZ2VfZW50cnkoJmdjX3BhZ2Vf
bGlzdCwgc3VtX3BhZ2UsIHNlZ25vKTsKPiA+PiAgICAgICAgICAgICAgdW5sb2NrX3BhZ2Uoc3Vt
X3BhZ2UpOwo+ID4+ICsgICAgICAgICAgICBpZiAoKytnY19saXN0X2NvdW50ID49IHdpbmRvd19n
cmFudWxhcml0eSkKPiA+PiArICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+PiAgICAgIH0K
PiA+Pgo+ID4+ICAgICAgYmxrX3N0YXJ0X3BsdWcoJnBsdWcpOwo+ID4+Cj4gPj4gLSAgICBmb3Ig
KHNlZ25vID0gc3RhcnRfc2Vnbm87IHNlZ25vIDwgZW5kX3NlZ25vOyBzZWdubysrKSB7Cj4gPj4g
KyAgICBsaXN0X2Zvcl9lYWNoX2VudHJ5KGdwZSwgJmdjX3BhZ2VfbGlzdCwgbGlzdCkgewo+ID4+
Cj4gPj4gICAgICAgICAgICAgIC8qIGZpbmQgc2VnbWVudCBzdW1tYXJ5IG9mIHZpY3RpbSAqLwo+
ID4+IC0gICAgICAgICAgICBzdW1fcGFnZSA9IGZpbmRfZ2V0X3BhZ2UoTUVUQV9NQVBQSU5HKHNi
aSksCj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIEdFVF9TVU1fQkxP
Q0soc2JpLCBzZWdubykpOwo+ID4+IC0gICAgICAgICAgICBmMmZzX3B1dF9wYWdlKHN1bV9wYWdl
LCAwKTsKPiA+PiArICAgICAgICAgICAgc3VtX3BhZ2UgPSBncGUtPnN1bV9wYWdlOwo+ID4+ICsg
ICAgICAgICAgICBzZWdubyA9IGdwZS0+c2Vnbm87Cj4gPj4gKyAgICAgICAgICAgIGlmICghc3Vt
X3BhZ2UpIHsKPiA+PiArICAgICAgICAgICAgICAgICAgICBmMmZzX2VycihzYmksICJGYWlsZWQg
dG8gZ2V0IHN1bW1hcnkgcGFnZSBmb3Igc2VnbWVudCAldSIsIHNlZ25vKTsKPiA+PiArICAgICAg
ICAgICAgICAgICAgICBnb3RvIHNraXA7Cj4gPj4gKyAgICAgICAgICAgIH0KPiA+Pgo+ID4+ICAg
ICAgICAgICAgICBpZiAoZ2V0X3ZhbGlkX2Jsb2NrcyhzYmksIHNlZ25vLCBmYWxzZSkgPT0gMCkK
PiA+PiAgICAgICAgICAgICAgICAgICAgICBnb3RvIGZyZWVkOwo+ID4+IEBAIC0xODM1LDE4ICsx
ODYzLDIwIEBAIHN0YXRpYyBpbnQgZG9fZ2FyYmFnZV9jb2xsZWN0KHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdldF92YWxpZF9ibG9j
a3Moc2JpLCBzZWdubywgZmFsc2UpID09IDApCj4gPj4gICAgICAgICAgICAgICAgICAgICAgc2Vn
X2ZyZWVkKys7Cj4gPj4KPiA+PiAtICAgICAgICAgICAgaWYgKF9faXNfbGFyZ2Vfc2VjdGlvbihz
YmkpKQo+ID4+IC0gICAgICAgICAgICAgICAgICAgIHNiaS0+bmV4dF92aWN0aW1fc2VnW2djX3R5
cGVdID0KPiA+PiAtICAgICAgICAgICAgICAgICAgICAgICAgICAgIChzZWdubyArIDEgPCBzZWNf
ZW5kX3NlZ25vKSA/Cj4gPj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNl
Z25vICsgMSA6IE5VTExfU0VHTk87Cj4gPj4gICBza2lwOgo+ID4+ICAgICAgICAgICAgICBmMmZz
X3B1dF9wYWdlKHN1bV9wYWdlLCAwKTsKPiA+PiAgICAgIH0KPiA+Pgo+ID4+ICsgICAgaWYgKF9f
aXNfbGFyZ2Vfc2VjdGlvbihzYmkpICYmICFsaXN0X2VtcHR5KCZnY19wYWdlX2xpc3QpKQo+ID4+
ICsgICAgICAgICAgICBzYmktPm5leHRfdmljdGltX3NlZ1tnY190eXBlXSA9Cj4gPj4gKyAgICAg
ICAgICAgICAgICAgICAgKHNlZ25vICsgMSA8IHNlY19lbmRfc2Vnbm8pID8KPiA+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHNlZ25vICsgMSA6IE5VTExfU0VHTk87Cj4gPj4gKwo+ID4+
ICAgICAgaWYgKHN1Ym1pdHRlZCkKPiA+PiAgICAgICAgICAgICAgZjJmc19zdWJtaXRfbWVyZ2Vk
X3dyaXRlKHNiaSwgZGF0YV90eXBlKTsKPiA+Pgo+ID4+ICAgICAgYmxrX2ZpbmlzaF9wbHVnKCZw
bHVnKTsKPiA+PiArICAgIHJlbGVhc2VfZ2NfcGFnZV9lbnRyeSgmZ2NfcGFnZV9saXN0LCBmYWxz
ZSk7Cj4gPj4KPiA+PiAgICAgIGlmIChtaWdyYXRlZCkKPiA+PiAgICAgICAgICAgICAgc3RhdF9p
bmNfZ2Nfc2VjX2NvdW50KHNiaSwgZGF0YV90eXBlLCBnY190eXBlKTsKPiA+PiBAQCAtMjAwOCw2
ICsyMDM4LDE4IEBAIGludCBmMmZzX2djKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0
IGYyZnNfZ2NfY29udHJvbCAqZ2NfY29udHJvbCkKPiA+PiAgICAgIHJldHVybiByZXQ7Cj4gPj4g
ICB9Cj4gPj4KPiA+PiAraW50IF9faW5pdCBmMmZzX2luaXRfZ2FyYmFnZV9jb2xsZWN0aW9uX3N1
bW1hcnlfY2FjaGUodm9pZCkKPiA+PiArewo+ID4+ICsgICAgZ2NfcGFnZV9lbnRyeV9zbGFiID0g
ZjJmc19rbWVtX2NhY2hlX2NyZWF0ZSgiZjJmc19nY19wYWdlX2VudHJ5IiwKPiA+PiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBnY19wYWdlX2VudHJ5
KSk7Cj4gPj4gKyAgICByZXR1cm4gZ2NfcGFnZV9lbnRyeV9zbGFiID8gMCA6IC1FTk9NRU07Cj4g
Pj4gK30KPiA+PiArCj4gPj4gK3ZvaWQgZjJmc19kZXN0cm95X2dhcmJhZ2VfY29sbGVjdGlvbl9z
dW1tYXJ5X2NhY2hlKHZvaWQpCj4gPj4gK3sKPiA+PiArICAgIGttZW1fY2FjaGVfZGVzdHJveShn
Y19wYWdlX2VudHJ5X3NsYWIpOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICAgaW50IF9faW5pdCBmMmZz
X2NyZWF0ZV9nYXJiYWdlX2NvbGxlY3Rpb25fY2FjaGUodm9pZCkKPiA+PiAgIHsKPiA+PiAgICAg
IHZpY3RpbV9lbnRyeV9zbGFiID0gZjJmc19rbWVtX2NhY2hlX2NyZWF0ZSgiZjJmc192aWN0aW1f
ZW50cnkiLAo+ID4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2djLmggYi9mcy9mMmZzL2djLmgKPiA+
PiBpbmRleCA1YzFlYWY1NWUxMjcuLjljODY5NWVmZTM5NCAxMDA2NDQKPiA+PiAtLS0gYS9mcy9m
MmZzL2djLmgKPiA+PiArKysgYi9mcy9mMmZzL2djLmgKPiA+PiBAQCAtODIsNiArODIsMTIgQEAg
c3RydWN0IHZpY3RpbV9lbnRyeSB7Cj4gPj4gICAgICBzdHJ1Y3QgbGlzdF9oZWFkIGxpc3Q7Cj4g
Pj4gICB9Owo+ID4+Cj4gPj4gK3N0cnVjdCBnY19wYWdlX2VudHJ5IHsKPiA+PiArICAgIHVuc2ln
bmVkIGludCBzZWdubzsKPiA+PiArICAgIHN0cnVjdCBwYWdlICpzdW1fcGFnZTsKPiA+PiArICAg
IHN0cnVjdCBsaXN0X2hlYWQgbGlzdDsKPiA+PiArfTsKPiA+PiArCj4gPj4gICAvKgo+ID4+ICAg
ICogaW5saW5lIGZ1bmN0aW9ucwo+ID4+ICAgICovCj4gPj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMv
c3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+ID4+IGluZGV4IGYwODdiMmI3MWM4OS4uYTMyNDE3
MzBmZTRmIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ID4+ICsrKyBiL2ZzL2Yy
ZnMvc3VwZXIuYwo+ID4+IEBAIC01MDkwLDkgKzUwOTAsMTIgQEAgc3RhdGljIGludCBfX2luaXQg
aW5pdF9mMmZzX2ZzKHZvaWQpCj4gPj4gICAgICBlcnIgPSBmMmZzX2NyZWF0ZV9nYXJiYWdlX2Nv
bGxlY3Rpb25fY2FjaGUoKTsKPiA+PiAgICAgIGlmIChlcnIpCj4gPj4gICAgICAgICAgICAgIGdv
dG8gZnJlZV9leHRlbnRfY2FjaGU7Cj4gPj4gLSAgICBlcnIgPSBmMmZzX2luaXRfc3lzZnMoKTsK
PiA+PiArICAgIGVyciA9IGYyZnNfaW5pdF9nYXJiYWdlX2NvbGxlY3Rpb25fc3VtbWFyeV9jYWNo
ZSgpOwo+ID4+ICAgICAgaWYgKGVycikKPiA+PiAgICAgICAgICAgICAgZ290byBmcmVlX2dhcmJh
Z2VfY29sbGVjdGlvbl9jYWNoZTsKPiA+PiArICAgIGVyciA9IGYyZnNfaW5pdF9zeXNmcygpOwo+
ID4+ICsgICAgaWYgKGVycikKPiA+PiArICAgICAgICAgICAgZ290byBmcmVlX2dhcmJhZ2VfY29s
bGVjdGlvbl9zdW1tYXJ5X2NhY2hlOwo+ID4+ICAgICAgZXJyID0gZjJmc19pbml0X3Nocmlua2Vy
KCk7Cj4gPj4gICAgICBpZiAoZXJyKQo+ID4+ICAgICAgICAgICAgICBnb3RvIGZyZWVfc3lzZnM7
Cj4gPj4gQEAgLTUxNDEsNiArNTE0NCw4IEBAIHN0YXRpYyBpbnQgX19pbml0IGluaXRfZjJmc19m
cyh2b2lkKQo+ID4+ICAgICAgZjJmc19leGl0X3Nocmlua2VyKCk7Cj4gPj4gICBmcmVlX3N5c2Zz
Ogo+ID4+ICAgICAgZjJmc19leGl0X3N5c2ZzKCk7Cj4gPj4gK2ZyZWVfZ2FyYmFnZV9jb2xsZWN0
aW9uX3N1bW1hcnlfY2FjaGU6Cj4gPj4gKyAgICBmMmZzX2Rlc3Ryb3lfZ2FyYmFnZV9jb2xsZWN0
aW9uX3N1bW1hcnlfY2FjaGUoKTsKPiA+PiAgIGZyZWVfZ2FyYmFnZV9jb2xsZWN0aW9uX2NhY2hl
Ogo+ID4+ICAgICAgZjJmc19kZXN0cm95X2dhcmJhZ2VfY29sbGVjdGlvbl9jYWNoZSgpOwo+ID4+
ICAgZnJlZV9leHRlbnRfY2FjaGU6Cj4gPj4gQEAgLTUxNzIsNiArNTE3Nyw3IEBAIHN0YXRpYyB2
b2lkIF9fZXhpdCBleGl0X2YyZnNfZnModm9pZCkKPiA+PiAgICAgIGYyZnNfZGVzdHJveV9yb290
X3N0YXRzKCk7Cj4gPj4gICAgICBmMmZzX2V4aXRfc2hyaW5rZXIoKTsKPiA+PiAgICAgIGYyZnNf
ZXhpdF9zeXNmcygpOwo+ID4+ICsgICAgZjJmc19kZXN0cm95X2dhcmJhZ2VfY29sbGVjdGlvbl9z
dW1tYXJ5X2NhY2hlKCk7Cj4gPj4gICAgICBmMmZzX2Rlc3Ryb3lfZ2FyYmFnZV9jb2xsZWN0aW9u
X2NhY2hlKCk7Cj4gPj4gICAgICBmMmZzX2Rlc3Ryb3lfZXh0ZW50X2NhY2hlKCk7Cj4gPj4gICAg
ICBmMmZzX2Rlc3Ryb3lfcmVjb3ZlcnlfY2FjaGUoKTsKPiA+PiAtLQo+ID4+IDIuMzMuMAo+ID4+
CgpEbyB5b3UgaGF2ZSBhbnkgbnVtYmVycyBzaG93aW5nIGhvdyBtdWNoIHRoZSBwZXJmb3JtYW5j
ZSBpcyBlbmhhbmNlZD8KClRoYW5rcy4KCj4gPj4KPiA+Pgo+ID4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPj4gTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKPiA+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
