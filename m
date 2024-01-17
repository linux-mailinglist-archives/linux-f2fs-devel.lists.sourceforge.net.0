Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF42582FED0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jan 2024 03:29:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rPvgd-0007GS-Dh;
	Wed, 17 Jan 2024 02:29:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rPvgb-0007GL-T7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 02:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=smRdHfB7Q3A8TGLcisVBWK6nCAHDbkQtbFRZgWCGMlc=; b=h2nVZ/PON17syzOLrwBmtZN5HW
 xbZeKbYXlo9atFae/xEA+RchyBv9jo0h55Tl12Zr0wrgHt9sspvzXsvxPTp4XF7wOsxFmDlw/L+cj
 NmcCEjmipF5ytp7EAPxjq/q3wMFmy4CypnkjkFmgKGxdxRNKhBWe1wweK6KOxmI6JzGc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=smRdHfB7Q3A8TGLcisVBWK6nCAHDbkQtbFRZgWCGMlc=; b=VaXUZxF8S/DfLYlS1kyePXPZEU
 dqhsDj5vreno7uPmjwedOYhZol2NxeQyRJiSf+turF4H/Bk712riaPF/4gmPzjkXulmaPG6dhSUO1
 1CniWqV+LPIGhmcZgYKI2X6/iOWw15cOXTZYisBMBjViAXlp6B/A7W6+P7eUPloxQXwk=;
Received: from mail-qt1-f171.google.com ([209.85.160.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rPvgX-0005I8-DO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 02:29:49 +0000
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-427ca22a680so72856721cf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Jan 2024 18:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705458580; x=1706063380; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=smRdHfB7Q3A8TGLcisVBWK6nCAHDbkQtbFRZgWCGMlc=;
 b=kE81s8L8IVKHnwEA63GUFOu0e1N1p1DMrDPVmdmGFjFGRTHXRxKUCv9FZB5UUN06zW
 c/lpK8x+WiIYrs1T42wPaV7OAz42Kk8kT+pX4Zgr2w4ogAXbprcS5jWeImAV6goAblnC
 Lx7k0IoUdxn+tg1JxUS59KTqk+UpdsqzIS0GfTRGhJyeXT0qnxVV5cvGM+qTtT3OPPRq
 3Vbu5Qe2465+3exSnP1ngEf0mFR92nHK8akUnYiEOJLyUXPA0VaR5+WcuwwiLhtEVeQi
 tNiIN8YP9jnhVAUE4iO+wQtNGzEpkXf8LBIE/ZUaDqgkcAqa4mAkmQxX+FXqf3RBDbKV
 hcRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705458580; x=1706063380;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=smRdHfB7Q3A8TGLcisVBWK6nCAHDbkQtbFRZgWCGMlc=;
 b=hQs4zF1sU4TtkQEsWxWySvLhP7DG26V773bnoKWnAuR0o9x7FJYWFgNFeAOuQEE/cm
 X8+rFw88N5jYRNT7pEAPIKQBB3uUagHIsFb5xyk+WXfPZAog1jCYsBzyHtr/Oo6D3cM+
 xDyoKGhUqMKlP4quN/fncg7GY+oHqv1QKo2/SMUjrbDE8M0UubE69nojX4IiZRi7DMeh
 ofhM8tjpBdX/PpsaK6xk5VNpN2ZeA5zGQ1TeXq6o68xvkTBsuHIVvPsCqRSQbUnreSvv
 o9U9tRjZjNzGiyT99/J4Uj2r9h1QFyc3pjih4OaA3z4Fjo0cToB/iOUR1cs99nXDtLS+
 5EuA==
X-Gm-Message-State: AOJu0YzzVMY4R5U/5qZeooVJIsJkFo2OEsenT94cdH/v/tgxLdPA8Pug
 viBeNtlO+7XaMy6qwDfMNhMz2JTKXl4fE8j2uM+fYYeh5ZeUdw==
X-Google-Smtp-Source: AGHT+IEpXdusZs4m7FiiTWT4q76KXWXL0r/pxA/NlMER/j2kqz+fklH6n0IKXbcIf+Ma+GBzZw4NTyUwMERLDjNH5Oc=
X-Received: by 2002:a05:622a:164d:b0:42a:a08:86ec with SMTP id
 y13-20020a05622a164d00b0042a0a0886ecmr1696343qtj.121.1705458580379; Tue, 16
 Jan 2024 18:29:40 -0800 (PST)
MIME-Version: 1.0
References: <20240116143422.1268-1-qwjhust@gmail.com>
 <CACOAw_zP_=w21p__X5hD8Br8tARLHozn5REA5maW8OU2M=AAhg@mail.gmail.com>
 <CACOAw_wzP2emXE_Os-eutBp9L3QRCwsDWg+qt-pQEHto_BvFUw@mail.gmail.com>
In-Reply-To: <CACOAw_wzP2emXE_Os-eutBp9L3QRCwsDWg+qt-pQEHto_BvFUw@mail.gmail.com>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Wed, 17 Jan 2024 10:29:30 +0800
Message-ID: <CAGFpFsTJAJXjrkRT2n9oFHCMW-V3BgVmouR_8-GD4ZqxC2n_nw@mail.gmail.com>
To: Daeho Jeong <daeho43@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Do you mean we down the semaphore when we write the first
   block of the zone and up it when the last bio of the zone finishes? That seems
    a bit more concise. On Wed, Jan 17, 2024 at 7:12 AM Daeho Jeong wrote:
   > > On Tue, Jan 16, 2024 at 2:58 PM Daeho Jeong wrote: > > > > On Tue, Jan
    16, 2024 at 6:36 AM Wenjie Qi wrote: > > > > > > We can get th [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qwjhust[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.160.171 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.171 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rPvgX-0005I8-DO
Subject: Re: [f2fs-dev] [PATCH v1] f2fs: fix max open zone constraints
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, hustqwj@hust.edu.cn,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RG8geW91IG1lYW4gd2UgZG93biB0aGUgc2VtYXBob3JlIHdoZW4gd2Ugd3JpdGUgdGhlIGZpcnN0
IGJsb2NrIG9mIHRoZSB6b25lCmFuZCB1cCBpdCB3aGVuIHRoZSBsYXN0IGJpbyBvZiB0aGUgem9u
ZSBmaW5pc2hlcz8gVGhhdCBzZWVtcyBhIGJpdCBtb3JlIGNvbmNpc2UuCgpPbiBXZWQsIEphbiAx
NywgMjAyNCBhdCA3OjEy4oCvQU0gRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPiB3cm90
ZToKPgo+IE9uIFR1ZSwgSmFuIDE2LCAyMDI0IGF0IDI6NTjigK9QTSBEYWVobyBKZW9uZyA8ZGFl
aG80M0BnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFR1ZSwgSmFuIDE2LCAyMDI0IGF0IDY6
MzbigK9BTSBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4g
V2UgY2FuIGdldCB0aGUgbnVtYmVyIG9mIHJlbWFpbmluZyBhdmFpbGFibGUgem9uZQo+ID4gPiBy
ZXNvdXJjZXMgYnkgc3VidHJhY3RpbmcgdGhlIG51bWJlciBvZiBhY3RpdmUgbG9ncyBmcm9tCj4g
PiA+IHRoZSBudW1iZXIgb2YgbWF4IGFjdGl2ZSB6b25lcyBvZiB6b25lZCBkZXZpY2VzLiBXZSBj
YW4KPiA+ID4gdXNlIHRoZXNlIGF2YWlsYWJsZSB6b25lIHJlc291cmNlcyB0byByZWR1Y2UgdGhl
IG51bWJlcgo+ID4gPiBvZiBwZW5kaW5nIGJpbyB3aGVuIHN3aXRjaGluZyB6b25lcy4KPiA+ID4g
SWYgbWF4IGFjdGl2ZSB6b25lcyBpcyAwLCB0aGVyZSBpcyBubyBsaW1pdC4KPiA+ID4KPiA+ID4g
U2lnbmVkLW9mZi1ieTogV2VuamllIFFpIDxxd2podXN0QGdtYWlsLmNvbT4KPiA+ID4gLS0tCj4g
PiA+ICBmcy9mMmZzL2RhdGEuYyAgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0t
LQo+ID4gPiAgZnMvZjJmcy9mMmZzLmggIHwgIDIgKysKPiA+ID4gIGZzL2YyZnMvc3VwZXIuYyB8
IDExICsrKysrKysrKysrCj4gPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDM4IGluc2VydGlvbnMoKyks
IDcgZGVsZXRpb25zKC0pCj4gPiA+Cj4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBi
L2ZzL2YyZnMvZGF0YS5jCj4gPiA+IGluZGV4IGRjZThkZWZkZjRjNy4uMGI2MmNhMjk2MDc0IDEw
MDY0NAo+ID4gPiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+ID4gPiArKysgYi9mcy9mMmZzL2RhdGEu
Ywo+ID4gPiBAQCAtMzkyLDYgKzM5MiwxOSBAQCBzdGF0aWMgdm9pZCBmMmZzX3pvbmVfd3JpdGVf
ZW5kX2lvKHN0cnVjdCBiaW8gKmJpbykKPiA+ID4gICAgICAgICBjb21wbGV0ZSgmaW8tPnpvbmVf
d2FpdCk7Cj4gPiA+ICAgICAgICAgZjJmc193cml0ZV9lbmRfaW8oYmlvKTsKPiA+ID4gIH0KPiA+
ID4gKwo+ID4gPiArc3RhdGljIHZvaWQgZjJmc196b25lX3dyaXRlX2VuZF9pb19ub3dhaXQoc3Ry
dWN0IGJpbyAqYmlvKQo+ID4gPiArewo+ID4gPiArI2lmZGVmIENPTkZJR19GMkZTX0lPU1RBVAo+
ID4gPiArICAgICAgIHN0cnVjdCBiaW9faW9zdGF0X2N0eCAqaW9zdGF0X2N0eCA9IGJpby0+Ymlf
cHJpdmF0ZTsKPiA+ID4gKyAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkgPSBpb3N0YXRf
Y3R4LT5zYmk7Cj4gPiA+ICsjZWxzZQo+ID4gPiArICAgICAgIHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSA9IChzdHJ1Y3QgZjJmc19zYl9pbmZvICopYmlvLT5iaV9wcml2YXRlOwo+ID4gPiArI2Vu
ZGlmCj4gPiA+ICsKPiA+ID4gKyAgICAgICBhdG9taWNfaW5jKCZzYmktPmF2YWlsYWJsZV9hY3Rp
dmVfem9uZXMpOwo+ID4gPiArICAgICAgIGYyZnNfd3JpdGVfZW5kX2lvKGJpbyk7Cj4gPiA+ICt9
Cj4gPiA+ICAjZW5kaWYKPiA+Cj4gPiBJIGRvbid0IHRoaW5rIHRoaXMgd29ya3MuIExldCdzIGFz
c3VtZSB3ZSBzdGFydCB3aXRoIDIKPiA+IGF2YWlsYWJsZV9hY3RpdmVfem9uZXMgYW5kIDQgYWN0
aXZlIGxvZ3MuCj4gPiBIb3cgYWJvdXQgNCBhY3RpdmUgbG9ncyByZWFjaCBhdCB0aGUgZW5kIG9m
IHRoZSB6b25lcyBhdCB0aGUgc2FtZSB0aW1lPwo+Cj4gU29ycnksIEkgd2FzIGNvbmZ1c2VkLiBJ
dCB3b3VsZCB3b3JrLiBIb3dldmVyLCBpdCBtaWdodCBiZSBhIGxpdHRsZSBjbHVtc3kuCj4gSG93
IGFib3V0IHVzaW5nIGEgZGF0YSBzdHJ1Y3R1cmUgbGlrZSBhIGNvdW50aW5nIHNlbWFwaG9yZT8K
PiBXZSBjYW4gZGVjcmVhc2UgaXQgYXMgd2Ugb3BlbiBhIHpvbmUgYW5kIGluY3JlYXNlIGl0IGFz
IHdlIGNsb3NlIGEgem9uZS4KPgo+ID4KPiA+ID4KPiA+ID4gIHN0cnVjdCBibG9ja19kZXZpY2Ug
KmYyZnNfdGFyZ2V0X2RldmljZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksCj4gPiA+IEBAIC0x
MDg1LDE0ICsxMDk4LDE5IEBAIHZvaWQgZjJmc19zdWJtaXRfcGFnZV93cml0ZShzdHJ1Y3QgZjJm
c19pb19pbmZvICpmaW8pCj4gPiA+ICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gPiA+ICBv
dXQ6Cj4gPiA+ICAjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPiA+ID4gLSAgICAgICBpZiAo
ZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBidHlwZSA8IE1FVEEgJiYKPiA+ID4gKyAgICAg
ICBpZiAoZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSAmJiBzYmktPm1heF9hY3RpdmVfem9uZXMg
JiYgYnR5cGUgPCBNRVRBICYmCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIGlzX2VuZF96
b25lX2Jsa2FkZHIoc2JpLCBmaW8tPm5ld19ibGthZGRyKSkgewo+ID4gPiAtICAgICAgICAgICAg
ICAgYmlvX2dldChpby0+YmlvKTsKPiA+ID4gLSAgICAgICAgICAgICAgIHJlaW5pdF9jb21wbGV0
aW9uKCZpby0+em9uZV93YWl0KTsKPiA+ID4gLSAgICAgICAgICAgICAgIGlvLT5iaV9wcml2YXRl
ID0gaW8tPmJpby0+YmlfcHJpdmF0ZTsKPiA+ID4gLSAgICAgICAgICAgICAgIGlvLT5iaW8tPmJp
X3ByaXZhdGUgPSBpbzsKPiA+ID4gLSAgICAgICAgICAgICAgIGlvLT5iaW8tPmJpX2VuZF9pbyA9
IGYyZnNfem9uZV93cml0ZV9lbmRfaW87Cj4gPiA+IC0gICAgICAgICAgICAgICBpby0+em9uZV9w
ZW5kaW5nX2JpbyA9IGlvLT5iaW87Cj4gPiA+ICsgICAgICAgICAgICAgICBpZiAoIWF0b21pY19h
ZGRfbmVnYXRpdmUoLTEsICZzYmktPmF2YWlsYWJsZV9hY3RpdmVfem9uZXMpKSB7Cj4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgIGlvLT5iaW8tPmJpX2VuZF9pbyA9IGYyZnNfem9uZV93cml0
ZV9lbmRfaW9fbm93YWl0Owo+ID4gPiArICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgYXRvbWljX2luYygmc2JpLT5hdmFpbGFibGVfYWN0aXZlX3pv
bmVzKTsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgYmlvX2dldChpby0+YmlvKTsKPiA+
ID4gKyAgICAgICAgICAgICAgICAgICAgICAgcmVpbml0X2NvbXBsZXRpb24oJmlvLT56b25lX3dh
aXQpOwo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICBpby0+YmlfcHJpdmF0ZSA9IGlvLT5i
aW8tPmJpX3ByaXZhdGU7Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIGlvLT5iaW8tPmJp
X3ByaXZhdGUgPSBpbzsKPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgaW8tPmJpby0+Ymlf
ZW5kX2lvID0gZjJmc196b25lX3dyaXRlX2VuZF9pbzsKPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaW8tPnpvbmVfcGVuZGluZ19iaW8gPSBpby0+YmlvOwo+ID4gPiArICAgICAgICAgICAg
ICAgfQo+ID4gPiAgICAgICAgICAgICAgICAgX19zdWJtaXRfbWVyZ2VkX2Jpbyhpbyk7Cj4gPiA+
ICAgICAgICAgfQo+ID4gPiAgI2VuZGlmCj4gPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMu
aCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiA+IGluZGV4IDY1Mjk0ZTNiMGJlZi4uMmFhZGUzNjdhYzY2
IDEwMDY0NAo+ID4gPiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4gPiArKysgYi9mcy9mMmZzL2Yy
ZnMuaAo+ID4gPiBAQCAtMTU1MSw2ICsxNTUxLDggQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4g
PiA+Cj4gPiA+ICAjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPiA+ID4gICAgICAgICB1bnNp
Z25lZCBpbnQgYmxvY2tzX3Blcl9ibGt6OyAgICAgICAgICAgLyogRjJGUyBibG9ja3MgcGVyIHpv
bmUgKi8KPiA+ID4gKyAgICAgICB1bnNpZ25lZCBpbnQgbWF4X2FjdGl2ZV96b25lczsgICAgICAg
ICAgLyogbWF4IHpvbmUgcmVzb3VyY2VzIG9mIHRoZSB6b25lZCBkZXZpY2UgKi8KPiA+ID4gKyAg
ICAgICBhdG9taWNfdCBhdmFpbGFibGVfYWN0aXZlX3pvbmVzOyAgICAgICAgLyogcmVtYWluaW5n
IHpvbmUgcmVzb3VyY2VzIGZvciB6b25lIHN3aXRjaCAqLwo+ID4gPiAgI2VuZGlmCj4gPiA+Cj4g
PiA+ICAgICAgICAgLyogZm9yIG5vZGUtcmVsYXRlZCBvcGVyYXRpb25zICovCj4gPiA+IGRpZmYg
LS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gaW5kZXggMjA2
ZDAzYzgyZDk2Li42NzExMjgzZmYxODcgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2YyZnMvc3VwZXIu
Ywo+ID4gPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+ID4gQEAgLTIzODUsNiArMjM4NSwxMiBA
QCBzdGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZs
YWdzLCBjaGFyICpkYXRhKQo+ID4gPiAgICAgICAgIGlmIChlcnIpCj4gPiA+ICAgICAgICAgICAg
ICAgICBnb3RvIHJlc3RvcmVfb3B0czsKPiA+ID4KPiA+ID4gKyNpZmRlZiBDT05GSUdfQkxLX0RF
Vl9aT05FRAo+ID4gPiArICAgICAgIGlmIChzYmktPm1heF9hY3RpdmVfem9uZXMpCj4gPiA+ICsg
ICAgICAgICAgICAgICBhdG9taWNfc2V0KCZzYmktPmF2YWlsYWJsZV9hY3RpdmVfem9uZXMsCj4g
PiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc2JpLT5tYXhfYWN0aXZlX3pvbmVz
IC0gRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncyk7Cj4gPiA+ICsjZW5kaWYKPiA+ID4gKwo+
ID4gPiAgICAgICAgIC8qIGZsdXNoIG91dHN0YW5kaW5nIGVycm9ycyBiZWZvcmUgY2hhbmdpbmcg
ZnMgc3RhdGUgKi8KPiA+ID4gICAgICAgICBmbHVzaF93b3JrKCZzYmktPnNfZXJyb3Jfd29yayk7
Cj4gPiA+Cj4gPiA+IEBAIC0zOTMyLDYgKzM5MzgsMTEgQEAgc3RhdGljIGludCBpbml0X2Jsa3pf
aW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBkZXZpKQo+ID4gPiAgICAgICAgIGlm
ICghZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPiA+ID4gICAgICAgICAgICAgICAgIHJldHVy
biAwOwo+ID4gPgo+ID4gPiArICAgICAgIHNiaS0+bWF4X2FjdGl2ZV96b25lcyA9IGJkZXZfbWF4
X2FjdGl2ZV96b25lcyhiZGV2KTsKPiA+ID4gKyAgICAgICBpZiAoc2JpLT5tYXhfYWN0aXZlX3pv
bmVzKQo+ID4gPiArICAgICAgICAgICAgICAgYXRvbWljX3NldCgmc2JpLT5hdmFpbGFibGVfYWN0
aXZlX3pvbmVzLAo+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4
X2FjdGl2ZV96b25lcyAtIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+ID4gPiArCj4g
Pgo+ID4gTmVlZCB0byBtYWtlIGF2YWlsYWJsZV9hY3RpdmVfem9uZXMgbm90IGJlIG5lZ2F0aXZl
LCByaWdodD8KPiA+IEhtbSwgbmVlZCB0byBtYWtlIHN1cmUgYWN0aXZlX2xvZ3Mgc2hvdWxkIGJl
IGVxdWFsIG9yIGxlc3MgdGhhbgo+ID4gbWF4X2FjdGl2ZV96b25lcy4KPiA+Cj4gPiA+ICAgICAg
ICAgem9uZV9zZWN0b3JzID0gYmRldl96b25lX3NlY3RvcnMoYmRldik7Cj4gPiA+ICAgICAgICAg
aWYgKCFpc19wb3dlcl9vZl8yKHpvbmVfc2VjdG9ycykpIHsKPiA+ID4gICAgICAgICAgICAgICAg
IGYyZnNfZXJyKHNiaSwgIkYyRlMgZG9lcyBub3Qgc3VwcG9ydCBub24gcG93ZXIgb2YgMiB6b25l
IHNpemVzXG4iKTsKPiA+ID4gLS0KPiA+ID4gMi4zNC4xCj4gPiA+Cj4gPiA+Cj4gPiA+Cj4gPiA+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gPiA+IExp
bnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cj4gPiA+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
