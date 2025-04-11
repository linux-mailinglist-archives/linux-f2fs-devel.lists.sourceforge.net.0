Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48608A8599A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 12:25:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u3BZK-00016k-6t;
	Fri, 11 Apr 2025 10:25:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u3BZJ-00016e-CT
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:25:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2viUuTSOryTVz3MbIrhcgzdyhW9cgJlxt5vA2SE52bc=; b=W8z6l5Iz5CqpgJ4sOsmSooeoYp
 H7a9sSb4syfOXeH0ZF/+EP70GMytVlQvHca9HAEvR6waETiEScZAp37FQTfDlXZXj2u6+UdRBXY46
 mfGT2uinByt+pDPAf3VFZXgpmisss9lSe6p2ack6hucwm4jRszEFRUpA+UQIJg/dQxDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2viUuTSOryTVz3MbIrhcgzdyhW9cgJlxt5vA2SE52bc=; b=D2TK53TISVMyt1f/0tQZjG2nQH
 qSaqkW08OMitZpbOLtger4NvlbzGS5QW6MBoRGfBAdjWkMAkwsUG89mEFBmwT8FsfWJS/g0hM9LDM
 BnpYDt4tzjvRDpoe2L00qvwO8OxjFEGwc344QXf4c3wDDK0+AF+8ZHmdIIVaENrTy8EE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u3BZ3-0005OI-06 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 10:25:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9C24C5C4DA5;
 Fri, 11 Apr 2025 10:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8549FC4CEE2;
 Fri, 11 Apr 2025 10:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744367083;
 bh=gzbaIZlSFdD25YyzAx6KzeF4zt/z6ZlVtN8uDBiGYdc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Dv6BGnv0iEM+jq75cvSo2fRgwrI4NftqKYoYIijhiZrkB66Sl+1vkI5hQ5N8RLtTI
 M6rLHrq7OcaQh1pth7TCTO4o4/xoEu5TJP3rybLzN8zyDOzyKqYaEK9bJ78M9Zs6Ja
 8He8SdvwSDBcC5mkVqGAsr7AD7jUCPw08CZwUGZSn14XkP5u6sVYT+wO3GB0R1Yp1+
 BcrKMMcFSNnINady4I/OBka1EbzXSEWmaVGNOBVtd9y8QiG9AVQj9u/LMS156QdKP1
 lvDwYLCPkpViRWtkrkk9hupNojZZaULaGpjDp5VgDjyGv1GTBTwUbKPzizU1E9AJT9
 tTWunu8UKHJvA==
Message-ID: <80bd501f-b1a8-4abc-8758-4896fed34535@kernel.org>
Date: Fri, 11 Apr 2025 18:24:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <20250411100526.7939-1-chao@kernel.org>
 <20250411100526.7939-2-chao@kernel.org>
 <CAD14+f3XQjvRxHEFm9OFv2RSOC_Ekbzu-LiJhRj+XXOndYw1dQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f3XQjvRxHEFm9OFv2RSOC_Ekbzu-LiJhRj+XXOndYw1dQ@mail.gmail.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2025/4/11 18:20, Juhyung Park wrote: > On Fri, Apr 11,
   2025 at 3:05 AM Chao Yu <chao@kernel.org> wrote: >> >> resize.f2fs doesn't
    guarantee atomically resizing f2fs image, >> so that potential su [...] 
 
 Content analysis details:   (-5.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                             [139.178.84.217 listed in sa-accredit.habeas.com]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u3BZ3-0005OI-06
Subject: Re: [f2fs-dev] [PATCH v2 2/2] resize.f2fs: add caution message for
 resize
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDE4OjIwLCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4gT24gRnJpLCBBcHIgMTEs
IDIwMjUgYXQgMzowNeKAr0FNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4gd3JvdGU6Cj4+Cj4+
IHJlc2l6ZS5mMmZzIGRvZXNuJ3QgZ3VhcmFudGVlIGF0b21pY2FsbHkgcmVzaXppbmcgZjJmcyBp
bWFnZSwKPj4gc28gdGhhdCBwb3RlbnRpYWwgc3VkZGVudCBwb3dlciBjdXQsIElPIGVycm9yLCBv
dXQgb2YgbWVtb3J5LAo+PiBTSUdLSUxMIHJlY2VpdmVkIG9yIHByb2dyYW0gZXhpdHMgZHVlIHRv
IG90aGVyIHJlYXNvbnMgbWF5IGNhdXNlCj4+IGRhdGEgY29ycnVwdGlvbi4KPj4KPj4gVGhpcyBw
YXRjaCBhZGRzIGNhdXRpb24gbWVzc2FnZSBmb3IgcmVzaXplIHVzZXJzIHRvIG5vdGljZQo+PiBw
b3RlbnRpYWwgcmlzayBvZiB1c2luZyByZXNpemluZyB0b29sLCBhbmQgcmVtaW5kIHRoZW0gdG8g
YmFja3VwCj4+IGRhdGEgYmVmb3JlIHJlc2l6ZS4KPj4KPj4gcmVzaXplLmYyZnMgPHBhcnRpdGlv
bj4KPj4KPj4gIlBsZWFzZSBub3RpY2UgdGhlcmUgaXMgaGlnaCByaXNrIG9mIGRhdGEgbG9zdCBk
dXJpbmcgcmVzaXplLCBwbGVhc2UgYmFja3VwIHlvdXIgZGF0YSBiZWZvcmUgcmVzaXplLgo+PiBE
byB5b3Ugd2FudCB0byByZXNpemUgdGhpcyBwYXJ0aXRpb24/IFt5L25dIHkKPj4gcHJvY2VzcyBy
ZXNpemUiCj4+Cj4+IElmIHdlIHdhbnQgdG8gZm9yY2UgdG8gdXNlIHJlc2l6ZS5mMmZzLCB3ZSBj
YW4gdXNlIC1GIG9wdGlvbiwKPj4gbGV0J3MgZW5hYmxlIC1GIG9wdGlvbiBpbiBBbmRyb2lkIGJ5
IGRlZmF1bHQgdG8gbm90IGJyZWFrIGFueQo+PiB1c2FnZS4KPj4KPj4gQ2M6IEp1IEh5dW5nIFBh
cmsgPHFrcnduZ3VkODI1QGdtYWlsLmNvbT4KPiAKPiBDYW4geW91IHVwZGF0ZSB0aGlzIHRvICJK
dWh5dW5nIFBhcmsiPyBUaGF0J3MgdGhlIHByZWZlcnJlZCBuYW1lIHRoYXQKPiBJIHVzZSBub3cg
OykKCkFoLCBzdXJlLiA7KQoKVGhhbmtzLAoKPiAKPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8
Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gICBmc2NrL21haW4uYyAgICAgICB8IDI3ICsrKysr
KysrKysrKysrKysrKysrKysrKystLQo+PiAgIGZzY2svcmVzaXplLmMgICAgIHwgIDIgKy0KPj4g
ICBpbmNsdWRlL2YyZnNfZnMuaCB8ICAxICsKPj4gICBtYW4vcmVzaXplLmYyZnMuOCB8IDEyICsr
KysrKysrKysrKwo+PiAgIDQgZmlsZXMgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKSwgMyBkZWxl
dGlvbnMoLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKPj4g
aW5kZXggYWY0MDYxMy4uZWY2YjE3ZCAxMDA2NDQKPj4gLS0tIGEvZnNjay9tYWluLmMKPj4gKysr
IGIvZnNjay9tYWluLmMKPj4gQEAgLTIyMiw2ICsyMjIsOCBAQCBzdGF0aWMgdm9pZCBhZGRfZGVm
YXVsdF9vcHRpb25zKHZvaWQpCj4+ICAgICAgICAgICAgICAgICAgaWYgKGMuZnVuYyA9PSBGU0NL
KSB7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAvKiAtYSAqLwo+PiAgICAgICAgICAgICAg
ICAgICAgICAgICAgYy5hdXRvX2ZpeCA9IDE7Cj4+ICsgICAgICAgICAgICAgICB9IGVsc2UgaWYg
KGMuZnVuYyA9PSBSRVNJWkUpIHsKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYy5mb3JjZSA9
IDE7Cj4+ICAgICAgICAgICAgICAgICAgfQo+Pgo+PiAgICAgICAgICAgICAgICAgIC8qCj4+IEBA
IC02MDEsNyArNjAzLDcgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFyZ2MsIGNoYXIg
KmFyZ3ZbXSkKPj4gICAjZW5kaWYKPj4gICAgICAgICAgfSBlbHNlIGlmICghc3RyY21wKCJyZXNp
emUuZjJmcyIsIHByb2cpKSB7Cj4+ICAgI2lmZGVmIFdJVEhfUkVTSVpFCj4+IC0gICAgICAgICAg
ICAgICBjb25zdCBjaGFyICpvcHRpb25fc3RyaW5nID0gImQ6ZkhzdDpvOlYiOwo+PiArICAgICAg
ICAgICAgICAgY29uc3QgY2hhciAqb3B0aW9uX3N0cmluZyA9ICJkOmZGSHN0Om86ViI7Cj4+Cj4+
ICAgICAgICAgICAgICAgICAgYy5mdW5jID0gUkVTSVpFOwo+PiAgICAgICAgICAgICAgICAgIHdo
aWxlICgob3B0aW9uID0gZ2V0b3B0KGFyZ2MsIGFyZ3YsIG9wdGlvbl9zdHJpbmcpKSAhPSBFT0Yp
IHsKPj4gQEAgLTYxOCw5ICs2MjAsMTIgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFy
Z2MsIGNoYXIgKmFyZ3ZbXSkKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYy5kYmdfbHYpOwo+PiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPj4gICAgICAgICAgICAgICAgICAgICAgICAgIGNhc2UgJ2YnOgo+
PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGMuaWdub3JlX2Vycm9yID0gMTsKPj4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNU0coMCwgIkluZm86IEluZ29yZSBlcnJv
ciBkdXJpbmcgcmVzaXplXG4iKTsKPiAKPiBzL0luZ29yZS9pZ25vcmUKPiBzL2Vycm9yL2Vycm9y
cwo+IAo+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJyZWFrOwo+PiArICAgICAg
ICAgICAgICAgICAgICAgICBjYXNlICdGJzoKPj4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgYy5mb3JjZSA9IDE7Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIE1T
RygwLCAiSW5mbzogRm9yY2UgdG8gcmVzaXplXG4iKTsKPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBicmVhazsKPiAKPiBJcyB0aGlzIGZhbGx0aHJvdWdoIGludGVuZGVkPwo+IAo+
PiAgICAgICAgICAgICAgICAgICAgICAgICAgY2FzZSAnSCc6Cj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMubmVlZF93aGludCA9IHRydWU7Cj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIGMud2hpbnQgPSBXUklURV9MSUZFX05PVF9TRVQ7Cj4+IEBAIC0xMTA0
LDYgKzExMDksMjQgQEAgb3V0X3JhbmdlOgo+PiAgICNpZmRlZiBXSVRIX1JFU0laRQo+PiAgIHN0
YXRpYyBpbnQgZG9fcmVzaXplKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4gICB7Cj4+ICsg
ICAgICAgY2hhciBhbnN3ZXJbMjU1XSA9IHswfTsKPj4gKyAgICAgICBpbnQgcmV0Owo+PiArCj4+
ICsgICAgICAgaWYgKCFjLmZvcmNlKSB7Cj4+ICtyZXRyeToKPj4gKyAgICAgICAgICAgICAgIHBy
aW50ZigiXG5QbGVhc2Ugbm90aWNlIHRoZXJlIGlzIGhpZ2ggcmlzayBvZiBkYXRhIGxvc3QgZHVy
aW5nIHJlc2l6ZSwgIgo+PiArICAgICAgICAgICAgICAgICAgICAgICAicGxlYXNlIGJhY2t1cCB5
b3VyIGRhdGEgYmVmb3JlIHJlc2l6ZS5cbiIKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgIkRv
IHlvdSB3YW50IHRvIHJlc2l6ZSB0aGlzIHBhcnRpdGlvbj8gW3kvbl0gIik7Cj4gCj4gImhpZ2gg
cmlzayIgaXMgcHJvYmFibHkgdG9vIGFnZ3Jlc3NpdmUuIEkgaGFkIG1hbnkgc3VjY2Vzc2VzIGlu
IHJlc2l6ZS4KPiAKPiBNYXliZSAiUmVzaXplIG9wZXJhdGlvbiBpcyBjdXJyZW50bHkgZXhwZXJp
bWVudGFsLCBwbGVhc2UgYmFja3VwIHlvdXIKPiBkYXRhLlxuRG8geW91IHdhbnQgdG8gY29udGlu
dWU/IFt5L25dICI/Cj4gCj4+ICsgICAgICAgICAgICAgICByZXQgPSBzY2FuZigiJXMiLCBhbnN3
ZXIpOwo+PiArICAgICAgICAgICAgICAgQVNTRVJUKHJldCA+PSAwKTsKPj4gKyAgICAgICAgICAg
ICAgIGlmICghc3RyY2FzZWNtcChhbnN3ZXIsICJ5IikpCj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIHByaW50ZigicHJvY2VzcyByZXNpemVcbiIpOwo+IAo+IFNvbWV0aGluZyBsaWtlICJQcm9j
ZWVkaW5nIHRvIHJlc2l6ZSIgbG9va3MgYmV0dGVyIGhlcmUuCj4gCj4+ICsgICAgICAgICAgICAg
ICBlbHNlIGlmICghc3RyY2FzZWNtcChhbnN3ZXIsICJuIikpCj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldHVybiAwOwo+PiArICAgICAgICAgICAgICAgZWxzZQo+PiArICAgICAgICAgICAg
ICAgICAgICAgICBnb3RvIHJldHJ5Owo+PiArICAgICAgIH0KPj4gKwo+PiAgICAgICAgICBpZiAo
IWMudGFyZ2V0X3NlY3RvcnMpCj4+ICAgICAgICAgICAgICAgICAgYy50YXJnZXRfc2VjdG9ycyA9
IGMudG90YWxfc2VjdG9yczsKPj4KPj4gZGlmZiAtLWdpdCBhL2ZzY2svcmVzaXplLmMgYi9mc2Nr
L3Jlc2l6ZS5jCj4+IGluZGV4IDI2ODFiOWYuLjFhYjdkNzUgMTAwNjQ0Cj4+IC0tLSBhL2ZzY2sv
cmVzaXplLmMKPj4gKysrIGIvZnNjay9yZXNpemUuYwo+PiBAQCAtNzY1LDcgKzc2NSw3IEBAIGlu
dCBmMmZzX3Jlc2l6ZShzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4+ICAgICAgICAgICAgICAg
ICAgfQo+PiAgICAgICAgICBlbHNlIGlmICgoKGMudGFyZ2V0X3NlY3RvcnMgKiBjLnNlY3Rvcl9z
aXplID4+Cj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBnZXRfc2IobG9nX2Jsb2Nrc2l6ZSkp
ID4gZ2V0X3NiKGJsb2NrX2NvdW50KSkgfHwKPj4gLSAgICAgICAgICAgICAgICAgICAgICAgYy5m
b3JjZSkKPj4gKyAgICAgICAgICAgICAgICAgICAgICAgYy5pZ25vcmVfZXJyb3IpCj4+ICAgICAg
ICAgICAgICAgICAgcmV0dXJuIGYyZnNfcmVzaXplX2dyb3coc2JpKTsKPj4gICAgICAgICAgZWxz
ZSB7Cj4+ICAgICAgICAgICAgICAgICAgTVNHKDAsICJOb3RoaW5nIHRvIHJlc2l6ZS5cbiIpOwo+
PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9mMmZzX2ZzLmggYi9pbmNsdWRlL2YyZnNfZnMuaAo+PiBp
bmRleCA3ZTNmMjViLi45MjhmOTYzIDEwMDY0NAo+PiAtLS0gYS9pbmNsdWRlL2YyZnNfZnMuaAo+
PiArKysgYi9pbmNsdWRlL2YyZnNfZnMuaAo+PiBAQCAtMTUyOCw2ICsxNTI4LDcgQEAgc3RydWN0
IGYyZnNfY29uZmlndXJhdGlvbiB7Cj4+ICAgICAgICAgIGludCBub19rZXJuZWxfY2hlY2s7Cj4+
ICAgICAgICAgIGludCBmaXhfb247Cj4+ICAgICAgICAgIGludCBmb3JjZTsKPj4gKyAgICAgICBp
bnQgaWdub3JlX2Vycm9yOwo+PiAgICAgICAgICBpbnQgZGVmc2V0Owo+PiAgICAgICAgICBpbnQg
YnVnX29uOwo+PiAgICAgICAgICB1bnNpZ25lZCBpbnQgaW52YWxpZF9zYjsKPj4gZGlmZiAtLWdp
dCBhL21hbi9yZXNpemUuZjJmcy44IGIvbWFuL3Jlc2l6ZS5mMmZzLjgKPj4gaW5kZXggMDJmZjI0
NS4uYmRkYTRmZCAxMDA2NDQKPj4gLS0tIGEvbWFuL3Jlc2l6ZS5mMmZzLjgKPj4gKysrIGIvbWFu
L3Jlc2l6ZS5mMmZzLjgKPj4gQEAgLTE4LDYgKzE4LDEyIEBAIHJlc2l6ZS5mMmZzIFwtIHJlc2l6
ZSBmaWxlc3lzdGVtIHNpemUKPj4gICAuSSBvdmVycHJvdmlzaW9uLXJhdGlvLXBlcmNlbnRhZ2UK
Pj4gICBdCj4+ICAgWwo+PiArLkIgXC1mCj4+ICtdCj4+ICtbCj4+ICsuQiBcLUYKPj4gK10KPj4g
K1sKPj4gICAuQiBcLUgKPj4gICBdCj4+ICAgWwo+PiBAQCAtNTMsNiArNTksMTIgQEAgU3BlY2lm
eSB0aGUgcGVyY2VudGFnZSBvZiB0aGUgdm9sdW1lIHRoYXQgd2lsbCBiZSB1c2VkIGFzIG92ZXJw
cm92aXNpb24gYXJlYS4KPj4gICBUaGlzIGFyZWEgaXMgaGlkZGVuIHRvIHVzZXJzLCBhbmQgdXRp
bGl6ZWQgYnkgRjJGUyBjbGVhbmVyLiBJZiBub3Qgc3BlY2lmaWVkLCB0aGUKPj4gICBiZXN0IG51
bWJlciB3aWxsIGJlIGFzc2lnbmVkIGF1dG9tYXRpY2FsbHkgYWNjb3JkaW5nIHRvIHRoZSBwYXJ0
aXRpb24gc2l6ZS4KPj4gICAuVFAKPj4gKy5CSSBcLWYKPj4gK0ZvcmNlIHRvIGZpeCBhbnkgaW5j
b25zaXN0ZW50IGRhdGEgZHVyaW5nIHJlc2l6ZS4KPj4gKy5UUAo+PiArLkJJIFwtRgo+PiArU2tp
cCBjYXV0aW9uIGRpYWxvZ3VlIGFuZCByZXNpemUgcGFydGl0aW9uIGRpcmVjdGx5Lgo+PiArLlRQ
Cj4+ICAgLkJJIFwtSAo+PiAgIFNwZWNpZnkgc3VwcG9ydCB3cml0ZSBoaW50Lgo+PiAgIC5UUAo+
PiAtLQo+PiAyLjQwLjEKPj4KCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
