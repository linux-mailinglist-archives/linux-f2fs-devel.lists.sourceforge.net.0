Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27DC9210474
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 09:05:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqWoB-0002lh-I9; Wed, 01 Jul 2020 07:05:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jqWoA-0002la-7H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 07:05:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dvUBuTvRieomSCqnJCq8xhXaqV0MYHK0mUXKNMYT7fg=; b=bL3BgMsT9R1NsTrqozcQ5ekfQp
 KEvsQMXCBvqM5V2GuxLiwEtnWptsoBEhBeq3BNsm25hA3mMyVHqAKyc5JLE/pBU0WYW6rpBJSOgAI
 NQ5kVsM0vD+1ce10HN1QkYvcneGmQeD3cspI8ht22Z7igvvgSNdqPDsgrYY7B6gfe9Tc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dvUBuTvRieomSCqnJCq8xhXaqV0MYHK0mUXKNMYT7fg=; b=HXTTL/MFN2KnOcDI6twc/yURmn
 U7UV9eC4X/bTcOKOlD28z/JeQOEoX7kE+9wwY6P8G2RqbyvK+qGkeVSVRbKDQjsWjBYjNvSznW+W+
 LJmm4+xMRHu7DI2M8wJp16ViQ5FGfgs20uiyP+h0dpPq7tT4d1eMkwniDi2Rwvx++HUA=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jqWo6-008MFM-Sp
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 07:05:26 +0000
Received: by mail-lj1-f194.google.com with SMTP id h19so25639473ljg.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 01 Jul 2020 00:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=dvUBuTvRieomSCqnJCq8xhXaqV0MYHK0mUXKNMYT7fg=;
 b=ZMNg22jfuWpv9FHjsLcHmAl1n4nnGMwS8YXn4/XRsSjhkWhDqFYthlc8VwYfnobFe0
 7NuOL1C2Q7Jqn6V/3i/diCS7/6kaFbceDtONervucpWDVCF6dbkXc00DO3C38mIHEYrE
 /VbI83vtmfp6O43qQMuCpF1QQ5L4jxByWQF0VRuOtxy7AnsLpo/bocETdiSoIttQ7vIO
 +ApYPvAM2bY6c/KD2nqQ4CIPLNv1na6E6h3XSCayN8ctLqIwCSwcYILnEmJM+Kgr5XtV
 lWGRls5ON69/6fq31hnDpoVdMOATQlGRk6AA6aVGXZ1cVgiJhNQAkrH4VrYQENoEh73T
 daog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=dvUBuTvRieomSCqnJCq8xhXaqV0MYHK0mUXKNMYT7fg=;
 b=gNPjseSUR6z4IEH3BEdCpXRCkjpXdV6l++ATSXHSSMdya0IGV9Bzqtmbv2wy7qj4U0
 jyfjQpPsnnBGjSpCt1LR9nJpFwWHcQhB+DZhsnIJn1/j+ihoECjA94KViuPYlG9mAjtx
 xnWOy4haeaNLP/3R7Xf/4gbWvhZmnIQ+r7K/2noWZ2vsmqhQ+6btDjOBONVihvetnsNI
 MiBTHEuTG6iUPHr1ndC/pTcdwUB2KCCFIzer+8CMpe76+XwxFzIqCrSF0P3WVeU0fgx1
 vEvaeUffh5MNR5tpacSIu963nlmgHj/harGJ7K64JghRwCOuN8k5r02nxyoI9wjavNud
 lgPw==
X-Gm-Message-State: AOAM533ULlgtGbji30fKg1WlPJnT7SqOfl4pLbDYB57KbL1z1tn3BK/U
 egHX4iFTgelR3iXLpFzxU/izuY/J0VaKVjZQpK8=
X-Google-Smtp-Source: ABdhPJwV5n0TyL60rtFVSJgv1WVFA75LA/7Y+Aomb1kRpVO700ihvwguTRmM/eSrsdaAEArhv7jw1+jQLsLPyUdQed8=
X-Received: by 2002:a2e:8e68:: with SMTP id t8mr5916934ljk.335.1593587103306; 
 Wed, 01 Jul 2020 00:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20200630005625.2405062-1-daeho43@gmail.com>
 <961072bb-4c8f-b01e-666d-1f5e35a8b76d@huawei.com>
In-Reply-To: <961072bb-4c8f-b01e-666d-1f5e35a8b76d@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Wed, 1 Jul 2020 16:04:52 +0900
Message-ID: <CACOAw_wQx5wjdWDX_WFebNS42t=wBuSh_k7oQ4v7abBv80SZXw@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jqWo6-008MFM-Sp
Subject: Re: [f2fs-dev] [PATCH] f2fs: add symbolic link to kobject in sysfs
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

QWN0dWFsbHksIEkgd2FudCB0byBrZWVwIHRoZSBtb3VudCBudW1iZXIgcmVtYWluaW5nIHRvIHRo
ZSBzYW1lCm51bWJlciwgZXZlbiBpZiBpdCdzIHJlLW1vdW50ZWQuCk9yIHdlIG5lZWQgdG8ga2Vl
cCB0cmFjayBvZiB0aGUgbnVtYmVyIGJlaW5nIGluY3JlYXNlZCB3aGVuZXZlciBpdCdzCnJlbW91
bnRlZC4gOigKCjIwMjDrhYQgN+yblCAx7J28ICjsiJgpIOyYpO2bhCAzOjM2LCBDaGFvIFl1IDx5
dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToKPgo+IEhpIERhZWhvLAo+Cj4gT24gMjAy
MC82LzMwIDg6NTYsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gRnJvbTogRGFlaG8gSmVvbmcgPGRh
ZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+Cj4gPiBBZGRlZCBhIHN5bWJvbGljIGxpbmsgdG8gZGly
ZWN0b3J5IG9mIHN5c2ZzLiBJdCB3aWxsCj4gPiBjcmVhdGUgYSBzeW1ib2xpYyBsaW5rIHN1Y2gg
YXMgIm1vdW50XzAiIGFuZCAibW91bnRfMSIgdG8KPiA+IGVhY2ggZjJmcyBtb3VudCBpbiB0aGUg
b3JkZXIgb2YgbW91bnRpbmcgZmlsZXN5c3RlbS4gSXQgd2lsbAo+ID4gcHJvdmlkZSBlYXN5IGFj
Y2VzcyB0byBzeXNmcyBub2RlIGV2ZW4gaWYgbm90IGtub3dpbmcgdGhlCj4gPiBzcGVjaWZpYyBk
ZXZpY2Ugbm9kZSBuYW1lIGxpa2Ugc2RhMTkgYW5kIGRtLTMuCj4KPiBKdXN0IG91dCBvZiBjdXJp
b3NpdHksIGlmIHdlIG1vdW50L3Vtb3VudCBhcyBiZWxvdzoKPgo+IG1vdW50IC9kZXYvenJhbTAg
L21udC9mMmZzMAo+IG1vdW50IC9kZXYvenJhbTEgL21udC9mMmZzMQo+IHVtb3VudCAvbW50L2Yy
ZnMwCj4gbW91bnQgL2Rldi96cmFtMCAvbW50L2YyZnMwCj4KPiBTaG91bGRuJ3Qgc3lzZnMgc3Ry
dWN0dXJlIGJlOgo+IG1vdW50XzIgLT4genJhbTAKPiBtb3VudF8xIC0+IHpyYW0xCj4genJhbTAK
PiB6cmFtMQo+Cj4gVGhlbiB3ZSBjYW4ga25vdyB6cmFtMCBpcyBtb3VudGVkIGFmdGVyIHpyYW0x
Pwo+Cj4gSG93ZXZlciB0aGUgcmVzdWx0IHNob3dzOgo+IG1vdW50XzAgLT4genJhbTAKPiBtb3Vu
dF8xIC0+IHpyYW0xCj4genJhbTAKPiB6cmFtMQo+Cj4gVGhhbmtzLAo+Cj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+IC0tLQo+ID4g
IGZzL2YyZnMvZjJmcy5oICB8ICA0ICsrKysKPiA+ICBmcy9mMmZzL3N5c2ZzLmMgfCAzMSArKysr
KysrKysrKysrKysrKysrKysrKysrKystLS0tCj4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNl
cnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2Yy
ZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBpbmRleCA0YjI4ZmQ0MmZkYmMuLjdkNmM1ZjhjZTE2
YiAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiArKysgYi9mcy9mMmZzL2YyZnMu
aAo+ID4gQEAgLTE0MTksNiArMTQxOSw4IEBAIHN0cnVjdCBkZWNvbXByZXNzX2lvX2N0eCB7Cj4g
PiAgI2RlZmluZSBNQVhfQ09NUFJFU1NfTE9HX1NJWkUgICAgICAgICAgICAgICAgOAo+ID4gICNk
ZWZpbmUgTUFYX0NPTVBSRVNTX1dJTkRPV19TSVpFICAgICAoKFBBR0VfU0laRSkgPDwgTUFYX0NP
TVBSRVNTX0xPR19TSVpFKQo+ID4KPiA+ICsjZGVmaW5lIE1PVU5UX05BTUVfU0laRSAgICAgICAg
ICAgICAgICAgICAgICAyMAo+ID4gKwo+ID4gIHN0cnVjdCBmMmZzX3NiX2luZm8gewo+ID4gICAg
ICAgc3RydWN0IHN1cGVyX2Jsb2NrICpzYjsgICAgICAgICAgICAgICAgIC8qIHBvaW50ZXIgdG8g
VkZTIHN1cGVyIGJsb2NrICovCj4gPiAgICAgICBzdHJ1Y3QgcHJvY19kaXJfZW50cnkgKnNfcHJv
YzsgICAgICAgICAgLyogcHJvYyBlbnRyeSAqLwo+ID4gQEAgLTE1OTksNiArMTYwMSw4IEBAIHN0
cnVjdCBmMmZzX3NiX2luZm8gewo+ID4gICAgICAgLyogRm9yIHN5c2ZzIHN1cHBwb3J0ICovCj4g
PiAgICAgICBzdHJ1Y3Qga29iamVjdCBzX2tvYmo7Cj4gPiAgICAgICBzdHJ1Y3QgY29tcGxldGlv
biBzX2tvYmpfdW5yZWdpc3RlcjsKPiA+ICsgICAgIGludCBzX21vdW50X2lkOwo+ID4gKyAgICAg
Y2hhciBzX21vdW50X25hbWVbTU9VTlRfTkFNRV9TSVpFXTsKPiA+Cj4gPiAgICAgICAvKiBGb3Ig
c2hyaW5rZXIgc3VwcG9ydCAqLwo+ID4gICAgICAgc3RydWN0IGxpc3RfaGVhZCBzX2xpc3Q7Cj4g
PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zeXNmcy5jIGIvZnMvZjJmcy9zeXNmcy5jCj4gPiBpbmRl
eCBhYjQwZTFmODlmMjMuLjY0YmJlMGIzYjgzMCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc3lz
ZnMuYwo+ID4gKysrIGIvZnMvZjJmcy9zeXNmcy5jCj4gPiBAQCAtMTgsNiArMTgsNyBAQAo+ID4g
ICNpbmNsdWRlIDx0cmFjZS9ldmVudHMvZjJmcy5oPgo+ID4KPiA+ICBzdGF0aWMgc3RydWN0IHBy
b2NfZGlyX2VudHJ5ICpmMmZzX3Byb2Nfcm9vdDsKPiA+ICtzdGF0aWMgc3RydWN0IGlkYSBmMmZz
X21vdW50X2lkYTsKPiA+Cj4gPiAgLyogU3lzZnMgc3VwcG9ydCBmb3IgZjJmcyAqLwo+ID4gIGVu
dW0gewo+ID4gQEAgLTkwNiw2ICs5MDcsOSBAQCBpbnQgX19pbml0IGYyZnNfaW5pdF9zeXNmcyh2
b2lkKQo+ID4gICAgICAgfSBlbHNlIHsKPiA+ICAgICAgICAgICAgICAgZjJmc19wcm9jX3Jvb3Qg
PSBwcm9jX21rZGlyKCJmcy9mMmZzIiwgTlVMTCk7Cj4gPiAgICAgICB9Cj4gPiArCj4gPiArICAg
ICBpZGFfaW5pdCgmZjJmc19tb3VudF9pZGEpOwo+ID4gKwo+ID4gICAgICAgcmV0dXJuIHJldDsK
PiA+ICB9Cj4gPgo+ID4gQEAgLTkxNSw2ICs5MTksNyBAQCB2b2lkIGYyZnNfZXhpdF9zeXNmcyh2
b2lkKQo+ID4gICAgICAga3NldF91bnJlZ2lzdGVyKCZmMmZzX2tzZXQpOwo+ID4gICAgICAgcmVt
b3ZlX3Byb2NfZW50cnkoImZzL2YyZnMiLCBOVUxMKTsKPiA+ICAgICAgIGYyZnNfcHJvY19yb290
ID0gTlVMTDsKPiA+ICsgICAgIGlkYV9kZXN0cm95KCZmMmZzX21vdW50X2lkYSk7Cj4gPiAgfQo+
ID4KPiA+ICBpbnQgZjJmc19yZWdpc3Rlcl9zeXNmcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkp
Cj4gPiBAQCAtOTI2LDEyICs5MzEsMjIgQEAgaW50IGYyZnNfcmVnaXN0ZXJfc3lzZnMoc3RydWN0
IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gICAgICAgaW5pdF9jb21wbGV0aW9uKCZzYmktPnNfa29i
al91bnJlZ2lzdGVyKTsKPiA+ICAgICAgIGVyciA9IGtvYmplY3RfaW5pdF9hbmRfYWRkKCZzYmkt
PnNfa29iaiwgJmYyZnNfc2Jfa3R5cGUsIE5VTEwsCj4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAiJXMiLCBzYi0+c19pZCk7Cj4gPiAtICAgICBpZiAoZXJyKSB7Cj4gPiAtICAgICAg
ICAgICAgIGtvYmplY3RfcHV0KCZzYmktPnNfa29iaik7Cj4gPiAtICAgICAgICAgICAgIHdhaXRf
Zm9yX2NvbXBsZXRpb24oJnNiaS0+c19rb2JqX3VucmVnaXN0ZXIpOwo+ID4gLSAgICAgICAgICAg
ICByZXR1cm4gZXJyOwo+ID4gKyAgICAgaWYgKGVycikKPiA+ICsgICAgICAgICAgICAgZ290byBl
cnIxOwo+ID4gKwo+ID4gKyAgICAgc2JpLT5zX21vdW50X2lkID0gaWRhX3NpbXBsZV9nZXQoJmYy
ZnNfbW91bnRfaWRhLCAwLCAwLCBHRlBfS0VSTkVMKTsKPiA+ICsgICAgIGlmIChzYmktPnNfbW91
bnRfaWQgPCAwKSB7Cj4gPiArICAgICAgICAgICAgIGVyciA9IHNiaS0+c19tb3VudF9pZDsKPiA+
ICsgICAgICAgICAgICAgZ290byBlcnIxOwo+ID4gICAgICAgfQo+ID4KPiA+ICsgICAgIHNucHJp
bnRmKHNiaS0+c19tb3VudF9uYW1lLCBNT1VOVF9OQU1FX1NJWkUsICJtb3VudF8lZCIsCj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgc2JpLT5zX21vdW50X2lkKTsKPiA+ICsgICAgIGVyciA9IHN5
c2ZzX2NyZWF0ZV9saW5rKCZmMmZzX2tzZXQua29iaiwgJnNiaS0+c19rb2JqLAo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIHNiaS0+c19tb3VudF9uYW1lKTsKPiA+ICsgICAgIGlmIChlcnIpCj4g
PiArICAgICAgICAgICAgIGdvdG8gZXJyMjsKPiA+ICsKPiA+ICAgICAgIGlmIChmMmZzX3Byb2Nf
cm9vdCkKPiA+ICAgICAgICAgICAgICAgc2JpLT5zX3Byb2MgPSBwcm9jX21rZGlyKHNiLT5zX2lk
LCBmMmZzX3Byb2Nfcm9vdCk7Cj4gPgo+ID4gQEAgLTk0Niw2ICs5NjEsMTIgQEAgaW50IGYyZnNf
cmVnaXN0ZXJfc3lzZnMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgdmljdGltX2JpdHNfc2VxX3Nob3csIHNiKTsKPiA+ICAgICAgIH0K
PiA+ICAgICAgIHJldHVybiAwOwo+ID4gK2VycjI6Cj4gPiArICAgICBpZGFfc2ltcGxlX3JlbW92
ZSgmZjJmc19tb3VudF9pZGEsIHNiaS0+c19tb3VudF9pZCk7Cj4gPiArZXJyMToKPiA+ICsgICAg
IGtvYmplY3RfcHV0KCZzYmktPnNfa29iaik7Cj4gPiArICAgICB3YWl0X2Zvcl9jb21wbGV0aW9u
KCZzYmktPnNfa29ial91bnJlZ2lzdGVyKTsKPiA+ICsgICAgIHJldHVybiBlcnI7Cj4gPiAgfQo+
ID4KPiA+ICB2b2lkIGYyZnNfdW5yZWdpc3Rlcl9zeXNmcyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpz
YmkpCj4gPiBAQCAtOTU3LDYgKzk3OCw4IEBAIHZvaWQgZjJmc191bnJlZ2lzdGVyX3N5c2ZzKHN0
cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPiA+ICAgICAgICAgICAgICAgcmVtb3ZlX3Byb2NfZW50
cnkoInZpY3RpbV9iaXRzIiwgc2JpLT5zX3Byb2MpOwo+ID4gICAgICAgICAgICAgICByZW1vdmVf
cHJvY19lbnRyeShzYmktPnNiLT5zX2lkLCBmMmZzX3Byb2Nfcm9vdCk7Cj4gPiAgICAgICB9Cj4g
PiArICAgICBzeXNmc19yZW1vdmVfbGluaygmZjJmc19rc2V0LmtvYmosIHNiaS0+c19tb3VudF9u
YW1lKTsKPiA+ICsgICAgIGlkYV9zaW1wbGVfcmVtb3ZlKCZmMmZzX21vdW50X2lkYSwgc2JpLT5z
X21vdW50X2lkKTsKPiA+ICAgICAgIGtvYmplY3RfZGVsKCZzYmktPnNfa29iaik7Cj4gPiAgICAg
ICBrb2JqZWN0X3B1dCgmc2JpLT5zX2tvYmopOwo+ID4gIH0KPiA+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
