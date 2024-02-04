Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8FD848AB1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  4 Feb 2024 03:36:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWSN7-00018y-Bd;
	Sun, 04 Feb 2024 02:36:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rWSN5-00018s-Q4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 02:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RIWdLIt7qWx0iRk6mguZcbqKY6VxYqeUlneCozypm+c=; b=jsxgZg6g4klC6l3t++xMc1L+zY
 8vaAR6BB2OH4dhwPhf+CsxmkcHbbQ38crzMxI+qBt/7VQhxzeiIq4HdcveUbxVwihUTAu8HPbZEKD
 Z1MnN/wOgGRugDxOe9GgMBtTpCK9+AI2rUs2MI3eNHd1WD+WiwnQvYZolYecrPoG9RxU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RIWdLIt7qWx0iRk6mguZcbqKY6VxYqeUlneCozypm+c=; b=hKkUb57Pc+bdSJO4fFGbAr2tpZ
 Gn/E99q0ybWapstggJ5d4sqLYZvl5HMt2FNH9DTPKhIJWMOo+FlrY/xCARBLcereoM6xk5pcmrNWt
 +iX+770PU6SNQD4arNb9ZTwJy4CQ686lknk37j+tNmXlWoFgfnx8ziQXzd0NJ+neHrbc=;
Received: from mail-qt1-f177.google.com ([209.85.160.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rWSN1-00053Z-LJ for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 04 Feb 2024 02:36:40 +0000
Received: by mail-qt1-f177.google.com with SMTP id
 d75a77b69052e-42a4516ec46so20302291cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Feb 2024 18:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707014185; x=1707618985; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RIWdLIt7qWx0iRk6mguZcbqKY6VxYqeUlneCozypm+c=;
 b=MgfTH5ivIyJxrWuEmhxZcb0b0lLGrePNXPo+F9UGOry2VGVGsFAY9CBZY2AfjUU54V
 HFBHLfdMG6Q3GcNtnqqPoOfe0ARVOjPwQOlHNtonN/NtjhuFad5rcGYCqLNh9fID2QfS
 F7t8IoEBMDpuWmn7efWb3HDVXkjysb/XUJ5Pc7DAhEvW7ls1KLt6jGfcGLyEaW9a+sfM
 B7sY5WfibiMET4eSp9Ux+EYHinuKDAspLasHQPfHmx+sRejmRWLMGz14QRvZ+usKXklZ
 CEvuUdqMbJPyateRLP/fqe0Mp2z6aHm36ZdykC2sJs+elaknPVFfDnPvnuhT58Yc/IiF
 yUSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707014185; x=1707618985;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIWdLIt7qWx0iRk6mguZcbqKY6VxYqeUlneCozypm+c=;
 b=OUWJDL4wkUp4m0IBwB03P3imsGEd06RhvyTCfo6B96oP4DIqqdCorVDtxfE/K8gQBu
 268GM+uQQyhXPmlTTixqiUarDq1OYoYIdF3eArnUNURySgWTbP+g5DoKwNxLuFNt/MX7
 nBcHvPis/BpyIdeE2jrMD/3Kxv8iRGgkI21P6QvffQIpOn9cRgDW0AbW6lsYidLTN3uX
 92KYaK1u7ydP2CaHxaeBtm27GaN/iXBX4EOSnyJiWBIL0YpXmKe+hNXT7ytpNAeOKygR
 84Sh5vhnDiTRAscl/neAKjUDK+gHTbhmLYklrXbkOOYLdz4Sw8C2scx3e9NoOsXcBiMq
 spNw==
X-Gm-Message-State: AOJu0YwJIuFLDarNwdZqTdWtSXr3SPKohKG6OfanXf3rhcTrsBsKwFAL
 lO66kdVK1RmmmtjXiB5/OheLFJd/h6xj01PW/gjqgAEkxlnjCdBwsfJ2IP+Jdk6uorzdk4+Kp7h
 cIAEADHIwGIHKwmC9mq0DFbG9q2o=
X-Google-Smtp-Source: AGHT+IEjJ9y3U2Ef+W/FHH+YiCml0EuxG95JG5fpys3Qlvv5Ss+R20O5FEwzmAf30txXd/gPfkascUfcI44ihb+b1l0=
X-Received: by 2002:ac8:568c:0:b0:42c:1492:68ef with SMTP id
 h12-20020ac8568c000000b0042c149268efmr3103068qta.9.1707014185357; Sat, 03 Feb
 2024 18:36:25 -0800 (PST)
MIME-Version: 1.0
References: <20240203152436.1352-1-qwjhust@gmail.com>
 <8eaf59a4-1aaa-460e-a3cc-b798ed5e0f63@kernel.org>
 <CAGFpFsTz_9Zaj0PuptjBxOJwxF68geAUfd1qtx9--Tczh+jZww@mail.gmail.com>
 <e42ae14e-88b8-41de-9693-1513bf335fc2@kernel.org>
In-Reply-To: <e42ae14e-88b8-41de-9693-1513bf335fc2@kernel.org>
From: Wenjie Qi <qwjhust@gmail.com>
Date: Sun, 4 Feb 2024 10:36:15 +0800
Message-ID: <CAGFpFsTwH8S5QsDCd5hqS+WNNr4ZZPJ2FuPFLRWzkVCqfjxiQQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  I agree with you, it looks a bit more intuitive that way.
   I'll submit a new version of the patch as soon as I can. Thanks, On Sun, Feb
    4, 2024 at 10:24 AM Chao Yu wrote: > > On 2024/2/4 10:18, Wenjie Qi wrote:
    > > Hi Chao, > > > > It seems to me that when mounting multiple zoned devices,
    > > if their max_open_zones ar [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [qwjhust[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.160.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.160.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rWSN1-00053Z-LJ
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix zoned block device information
 initialization
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

SSBhZ3JlZSB3aXRoIHlvdSwgaXQgbG9va3MgYSBiaXQgbW9yZSBpbnR1aXRpdmUgdGhhdCB3YXku
CkknbGwgc3VibWl0IGEgbmV3IHZlcnNpb24gb2YgdGhlIHBhdGNoIGFzIHNvb24gYXMgSSBjYW4u
ClRoYW5rcywKCk9uIFN1biwgRmViIDQsIDIwMjQgYXQgMTA6MjTigK9BTSBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gMjAyNC8yLzQgMTA6MTgsIFdlbmppZSBRaSB3cm90
ZToKPiA+IEhpIENoYW8sCj4gPgo+ID4gSXQgc2VlbXMgdG8gbWUgdGhhdCB3aGVuIG1vdW50aW5n
IG11bHRpcGxlIHpvbmVkIGRldmljZXMsCj4gPiBpZiB0aGVpciBtYXhfb3Blbl96b25lcyBhcmUg
YWxsIDAsIHRoZW4gc2JpLT5tYXhfb3Blbl96b25lcyBpcyAwLgo+ID4gVGhpcyBzdWdnZXN0cyB0
aGF0IGFsbCBvZiB0aGUgbW91bnRlZCBkZXZpY2VzIGNhbiBvcGVuIGFuIHVubGltaXRlZAo+ID4g
bnVtYmVyIG9mIHpvbmVzLAo+ID4gYW5kIHRoYXQgd2UgZG9uJ3QgbmVlZCB0byBjb21wYXJlIHNi
aS0+bWF4X29wZW5fem9uZXMgd2l0aAo+ID4gRjJGU19PUFRJT04oIHNiaSkuYWN0aXZlX2xvZ3Mu
Cj4KPiBZZXMsIGJ1dCBJJ20gY3VyaW91cyBhYm91dCBob3cgdGhpcyBjYXNlIChzYmktPm1heF9v
cGVuX3pvbmVzIGlzIHplcm8pCj4gd29ya3Mgdy8gZm9sbG93aW5nIHBhdGNoLCBkbyB3ZSBuZWVk
IHRvIGluaXRpYWxpemVkIHNiaS0+bWF4X29wZW5fem9uZXMKPiB3LyBVSU5UX01BWCB0byBpbmRp
Y2F0ZSB0aGUgdW5saW1pdGVkIG9wZW4gem9uZSBzdGF0dXMgb2YgZGV2aWNlIGlmCj4gYWxsIHpv
bmVkIGRldmljZXMnIG1heF9vcGVuX3pvbmVzIGlzIHplcm8/Cj4KPiA+Cj4gPiBUaGFua3MsCj4g
Pgo+ID4gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiDkuo4yMDI05bm0MuaciDTml6Xlkajml6Ug
MDk6NDflhpnpgZPvvJoKPiA+Pgo+ID4+IE9uIDIwMjQvMi8zIDIzOjI0LCBXZW5qaWUgUWkgd3Jv
dGU6Cj4gPj4+IElmIHRoZSBtYXggb3BlbiB6b25lcyBvZiB6b25lZCBkZXZpY2VzIGFyZSBsZXNz
IHRoYW4KPiA+Pj4gdGhlIGFjdGl2ZSBsb2dzIG9mIEYyRlMsIHRoZSBkZXZpY2UgbWF5IGVycm9y
IGR1ZSB0bwo+ID4+PiBpbnN1ZmZpY2llbnQgem9uZSByZXNvdXJjZXMgd2hlbiBtdWx0aXBsZSBh
Y3RpdmUgbG9ncyBhcmUKPiA+Pj4gYmVpbmcgd3JpdHRlbiBhdCB0aGUgc2FtZSB0aW1lLiBJZiB0
aGlzIHZhbHVlIGlzIDAsCj4gPj4+IHRoZXJlIGlzIG5vIGxpbWl0Lgo+ID4+Pgo+ID4+PiBTaWdu
ZWQtb2ZmLWJ5OiBXZW5qaWUgUWkgPHF3amh1c3RAZ21haWwuY29tPgo+ID4+PiAtLS0KPiA+Pj4g
ICAgZnMvZjJmcy9mMmZzLmggIHwgIDEgKwo+ID4+PiAgICBmcy9mMmZzL3N1cGVyLmMgfCAyMSAr
KysrKysrKysrKysrKysrKysrKysKPiA+Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCAyMiBpbnNlcnRp
b25zKCspCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4gPj4+IGluZGV4IDU0Mzg5ODQ4MmY4Yi4uMTYxMTA3ZjJkM2JkIDEwMDY0NAo+ID4+
PiAtLS0gYS9mcy9mMmZzL2YyZnMuaAo+ID4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+ID4+PiBA
QCAtMTU1OCw2ICsxNTU4LDcgQEAgc3RydWN0IGYyZnNfc2JfaW5mbyB7Cj4gPj4+Cj4gPj4+ICAg
ICNpZmRlZiBDT05GSUdfQkxLX0RFVl9aT05FRAo+ID4+PiAgICAgICAgdW5zaWduZWQgaW50IGJs
b2Nrc19wZXJfYmxrejsgICAgICAgICAgIC8qIEYyRlMgYmxvY2tzIHBlciB6b25lICovCj4gPj4+
ICsgICAgIHVuc2lnbmVkIGludCBtYXhfb3Blbl96b25lczsgICAgICAgICAgICAvKiBtYXggb3Bl
biB6b25lIHJlc291cmNlcyBvZiB0aGUgem9uZWQgZGV2aWNlICovCj4gPj4+ICAgICNlbmRpZgo+
ID4+Pgo+ID4+PiAgICAgICAgLyogZm9yIG5vZGUtcmVsYXRlZCBvcGVyYXRpb25zICovCj4gPj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPiA+Pj4gaW5k
ZXggMWI3MThiZWJmYWExLi40NWU4MmQ2MDE2ZmMgMTAwNjQ0Cj4gPj4+IC0tLSBhL2ZzL2YyZnMv
c3VwZXIuYwo+ID4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiA+Pj4gQEAgLTIzODgsNiArMjM4
OCwxNiBAQCBzdGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBp
bnQgKmZsYWdzLCBjaGFyICpkYXRhKQo+ID4+PiAgICAgICAgaWYgKGVycikKPiA+Pj4gICAgICAg
ICAgICAgICAgZ290byByZXN0b3JlX29wdHM7Cj4gPj4+Cj4gPj4+ICsjaWZkZWYgQ09ORklHX0JM
S19ERVZfWk9ORUQKPiA+Pj4gKyAgICAgaWYgKHNiaS0+bWF4X29wZW5fem9uZXMgJiYgc2JpLT5t
YXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpIHsKPiA+Pj4gKyAg
ICAgICAgICAgICBmMmZzX2VycihzYmksCj4gPj4+ICsgICAgICAgICAgICAgICAgICAgICAiem9u
ZWQ6IG1heCBvcGVuIHpvbmVzICV1IGlzIHRvbyBzbWFsbCwgbmVlZCBhdCBsZWFzdCAldSBvcGVu
IHpvbmVzIiwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHNiaS0+bWF4X29w
ZW5fem9uZXMsIEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+ID4+PiArICAgICAgICAg
ICAgIGVyciA9IC1FSU5WQUw7Cj4gPj4+ICsgICAgICAgICAgICAgZ290byByZXN0b3JlX29wdHM7
Cj4gPj4+ICsgICAgIH0KPiA+Pj4gKyNlbmRpZgo+ID4+PiArCj4gPj4+ICAgICAgICAvKiBmbHVz
aCBvdXRzdGFuZGluZyBlcnJvcnMgYmVmb3JlIGNoYW5naW5nIGZzIHN0YXRlICovCj4gPj4+ICAg
ICAgICBmbHVzaF93b3JrKCZzYmktPnNfZXJyb3Jfd29yayk7Cj4gPj4+Cj4gPj4+IEBAIC0zOTMw
LDExICszOTQwLDIyIEBAIHN0YXRpYyBpbnQgaW5pdF9ibGt6X2luZm8oc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBpbnQgZGV2aSkKPiA+Pj4gICAgICAgIHNlY3Rvcl90IG5yX3NlY3RvcnMgPSBi
ZGV2X25yX3NlY3RvcnMoYmRldik7Cj4gPj4+ICAgICAgICBzdHJ1Y3QgZjJmc19yZXBvcnRfem9u
ZXNfYXJncyByZXBfem9uZV9hcmc7Cj4gPj4+ICAgICAgICB1NjQgem9uZV9zZWN0b3JzOwo+ID4+
PiArICAgICB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4gPj4+ICAgICAgICBpbnQgcmV0
Owo+ID4+Pgo+ID4+PiAgICAgICAgaWYgKCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+ID4+
PiAgICAgICAgICAgICAgICByZXR1cm4gMDsKPiA+Pj4KPiA+Pj4gKyAgICAgbWF4X29wZW5fem9u
ZXMgPSBiZGV2X21heF9vcGVuX3pvbmVzKGJkZXYpOwo+ID4+Cj4gPj4gV2VuamllLAo+ID4+Cj4g
Pj4gbWF4X29wZW5fem9uZXMgY2FuIGFsd2F5cyBiZSB6ZXJvPyB0aGVuIHNiaS0+bWF4X29wZW5f
em9uZXMgd2lsbCBiZSB6ZXJvLAo+ID4+IGlzIHRoaXMgYSB2YWxpZCBjYXNlPwo+ID4+Cj4gPj4g
VGhhbmtzLAo+ID4+Cj4gPj4+ICsgICAgIGlmIChtYXhfb3Blbl96b25lcyAmJiAobWF4X29wZW5f
em9uZXMgPCBzYmktPm1heF9vcGVuX3pvbmVzIHx8ICFzYmktPm1heF9vcGVuX3pvbmVzKSkKPiA+
Pj4gKyAgICAgICAgICAgICBzYmktPm1heF9vcGVuX3pvbmVzID0gbWF4X29wZW5fem9uZXM7Cj4g
Pj4+ICsgICAgIGlmIChzYmktPm1heF9vcGVuX3pvbmVzICYmIHNiaS0+bWF4X29wZW5fem9uZXMg
PCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7Cj4gPj4+ICsgICAgICAgICAgICAgZjJm
c19lcnIoc2JpLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgInpvbmVkOiBtYXggb3BlbiB6
b25lcyAldSBpcyB0b28gc21hbGwsIG5lZWQgYXQgbGVhc3QgJXUgb3BlbiB6b25lcyIsCj4gPj4+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYmktPm1heF9vcGVuX3pvbmVzLCBGMkZT
X09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKTsKPiA+Pj4gKyAgICAgICAgICAgICByZXR1cm4gLUVJ
TlZBTDsKPiA+Pj4gKyAgICAgfQo+ID4+PiArCj4gPj4+ICAgICAgICB6b25lX3NlY3RvcnMgPSBi
ZGV2X3pvbmVfc2VjdG9ycyhiZGV2KTsKPiA+Pj4gICAgICAgIGlmICghaXNfcG93ZXJfb2ZfMih6
b25lX3NlY3RvcnMpKSB7Cj4gPj4+ICAgICAgICAgICAgICAgIGYyZnNfZXJyKHNiaSwgIkYyRlMg
ZG9lcyBub3Qgc3VwcG9ydCBub24gcG93ZXIgb2YgMiB6b25lIHNpemVzXG4iKTsKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
