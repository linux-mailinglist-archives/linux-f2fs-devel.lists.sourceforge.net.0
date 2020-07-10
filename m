Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA4421AE0A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 06:26:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtkcT-00032R-VE; Fri, 10 Jul 2020 04:26:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jtkcS-00032J-H7
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 04:26:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IDb3g5vxr/qWKzrtnhotFmzcC0SHY54b9+eqVy5+8NQ=; b=Hy913nhSatLHftkyYUS6S6Yy98
 hXz8asdrHZDik0qjo+rVvW2ex2ydaCGz/Cg47SGR/y3oU3V7nyqWZXcEzSKpzedH0Wrmh9Mpw6BjU
 2K7YMobai97sRQeUgsIIPbXR28Qd1TNZYGf/qFwDkDG/lTng9couoGNzazn1sO6I+g/4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IDb3g5vxr/qWKzrtnhotFmzcC0SHY54b9+eqVy5+8NQ=; b=Cl/ii3z87OncjEaRKJ/fuRY5uz
 6JQhwkVwiImwcGPVYCEOT+9/lCPcBEXkhnvZlElk5oZoh+ZoV5xkRXVwKWdXoCK8UWF+0K1MC62Mr
 XETMxg+FQ0ZTEO8J3iEUbVKeDGVNHvQ7yskvR1e/CZg4DtWvm8hWL/3biy1B1/50lGHk=;
Received: from mail-lj1-f193.google.com ([209.85.208.193])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtkcN-00Fqcb-NU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 04:26:40 +0000
Received: by mail-lj1-f193.google.com with SMTP id f5so4873921ljj.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 21:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=IDb3g5vxr/qWKzrtnhotFmzcC0SHY54b9+eqVy5+8NQ=;
 b=PJZfH/tmK25TBftSy5/M6juOuRHXquLDyvbKyrrLRCX61V2LqMKbxKpcoMka91bVn2
 k+Xew+QRGh6XCY5DGIJVM1jhssPxW81Rw+9GEfjbVsbpSE5oidFlytX+1nyWKS7DKub+
 vEGQ9XQn+DKAWIPOXI3eciE1yeHB5vu6FvOnwJ3Lv+wEJS57hTVXRA9zwBlOj15dLv5k
 bPhGPitcjicnNfeWeh8o3zJWIBOVy+IcArEePs6bZsNAGaNpWNubf6V1tFgs3FRvUY4u
 fV+mezFb0C8oTUR2oIVee7ZV+lJp4QZv/xxgWhNxHogc4gPTM+2bdZD5HP9JisUIcSZM
 YiHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=IDb3g5vxr/qWKzrtnhotFmzcC0SHY54b9+eqVy5+8NQ=;
 b=LZyZj1k4DSh4lJ7G4ET+bJWCP+v/+QUB71kZuoZ8o5L5SFqFDJSb/EqpHJXAfez/M7
 pkLl4o2F/P5k3XoVr8ZMZdVAcMi2/UssFQJORUxgLLrjLJkaL2SRwxTpAEBkRHYxZwYR
 C9/BBgCYxDgECTjNX1YJINDpDdZZcPonmwz4fk6d05KPZ2aNQOs+q/STwL0WRT+5pXv0
 yblhImUuXQYav86Fw6ZX1Lm40ElI3FmlkPsJ09JNu8TFlPRYbdFwd4kvmKGBbe0CBMbv
 J4rI0va8PWn7moe5N3l36Cb2hOuVCc/NsoDXWUipkZR97ASZfZ2e95ed8KP3FjwY4rTP
 wC3A==
X-Gm-Message-State: AOAM530RlfZhhEIEGBCE4xSyhgS4sFJ1Wg+TeUujjbdqgjw70qpnupdm
 LCtOrSl1FQ1CByJpT+zo/rjy/SUtasRwwYWrF14=
X-Google-Smtp-Source: ABdhPJyZYWzkEiDKOx6X2h2aclsw1W0QryWEfiD9Zrapu4xZynRTvKmpnMtKBlPxlcfcbigRHcH9uHWHK4tGx4lPbR4=
X-Received: by 2002:a2e:8e68:: with SMTP id t8mr30798793ljk.335.1594355189016; 
 Thu, 09 Jul 2020 21:26:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200710021505.2405872-1-daeho43@gmail.com>
 <20200710030246.GA545837@google.com>
 <62c9dd7a-5d18-8bb6-8e43-c055fcff51cc@huawei.com>
 <20200710033100.GE545837@google.com>
 <ede6620c-6fc9-797d-e3ea-e630eb76b309@huawei.com>
 <20200710035215.GI545837@google.com>
In-Reply-To: <20200710035215.GI545837@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 10 Jul 2020 13:26:17 +0900
Message-ID: <CACOAw_zRXYv_Vo2Q2=FnU-DL-fROuFi40xymrRPrJ91v=TFjKQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtkcN-00Fqcb-NU
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the way of handling range.len
 in F2FS_IOC_SEC_TRIM_FILE
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

VG8gaGFuZGxlIHRoYXQgY2FzZSwgSSB0aGluayB3ZSBuZWVkIHRvIGhhbmRsZSByYW5nZS5sZW4o
LTEpIGRpZmZlcmVudGx5LgpXaGVuIHJhbmdlLmxlbiBpcyAtMSwgd2UgbmVlZCB0byBmaW5kIG91
dCBldmVyeSBibG9jayBiZWxvbmdzIHRvIHRoZQppbm9kZSByZWdhcmRsZXNzIG9mIGlfc2l6ZSBh
bmQgZGlzY2FyZCBpdC4KCjIwMjDrhYQgN+yblCAxMOydvCAo6riIKSDsmKTtm4QgMTI6NTIsIEph
ZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IE9uIDA3LzEw
LCBDaGFvIFl1IHdyb3RlOgo+ID4gT24gMjAyMC83LzEwIDExOjMxLCBKYWVnZXVrIEtpbSB3cm90
ZToKPiA+ID4gT24gMDcvMTAsIENoYW8gWXUgd3JvdGU6Cj4gPiA+PiBPbiAyMDIwLzcvMTAgMTE6
MDIsIEphZWdldWsgS2ltIHdyb3RlOgo+ID4gPj4+IE9uIDA3LzEwLCBEYWVobyBKZW9uZyB3cm90
ZToKPiA+ID4+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+
ID4+Pj4KPiA+ID4+Pj4gQ2hhbmdlZCB0aGUgd2F5IG9mIGhhbmRsaW5nIHJhbmdlLmxlbiBvZiBG
MkZTX0lPQ19TRUNfVFJJTV9GSUxFLgo+ID4gPj4+PiAgMS4gQWRkZWQgLTEgdmFsdWUgc3VwcG9y
dCBmb3IgcmFuZ2UubGVuIHRvIHNpZ25pZnkgdGhlIGVuZCBvZiBmaWxlLgo+ID4gPj4+PiAgMi4g
SWYgdGhlIGVuZCBvZiB0aGUgcmFuZ2UgcGFzc2VzIG92ZXIgdGhlIGVuZCBvZiBmaWxlLCBpdCBt
ZWFucyB1bnRpbAo+ID4gPj4+PiAgICAgdGhlIGVuZCBvZiBmaWxlLgo+ID4gPj4+PiAgMy4gaWdu
b3JlZCB0aGUgY2FzZSBvZiB0aGF0IHJhbmdlLmxlbiBpcyB6ZXJvIHRvIHByZXZlbnQgdGhlIGZ1
bmN0aW9uCj4gPiA+Pj4+ICAgICBmcm9tIG1ha2luZyBlbmRfYWRkciB6ZXJvIGFuZCB0cmlnZ2Vy
aW5nIGRpZmZlcmVudCBiZWhhdmlvdXIgb2YKPiA+ID4+Pj4gICAgIHRoZSBmdW5jdGlvbi4KPiA+
ID4+Pj4KPiA+ID4+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29v
Z2xlLmNvbT4KPiA+ID4+Pj4gLS0tCj4gPiA+Pj4+ICBmcy9mMmZzL2ZpbGUuYyB8IDE2ICsrKysr
KystLS0tLS0tLS0KPiA+ID4+Pj4gIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDkg
ZGVsZXRpb25zKC0pCj4gPiA+Pj4+Cj4gPiA+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUu
YyBiL2ZzL2YyZnMvZmlsZS5jCj4gPiA+Pj4+IGluZGV4IDM2OGM4MGY4ZTJhMS4uMWM0NjAxZjk5
MzI2IDEwMDY0NAo+ID4gPj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4gPj4+PiArKysgYi9m
cy9mMmZzL2ZpbGUuYwo+ID4gPj4+PiBAQCAtMzgxMywyMSArMzgxMywxOSBAQCBzdGF0aWMgaW50
IGYyZnNfc2VjX3RyaW1fZmlsZShzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcp
Cj4gPiA+Pj4+ICAgICAgICAgIGZpbGVfc3RhcnRfd3JpdGUoZmlscCk7Cj4gPiA+Pj4+ICAgICAg
ICAgIGlub2RlX2xvY2soaW5vZGUpOwo+ID4gPj4+Pgo+ID4gPj4+PiAtICAgICAgICBpZiAoZjJm
c19pc19hdG9taWNfZmlsZShpbm9kZSkgfHwgZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKSB7
Cj4gPiA+Pj4+ICsgICAgICAgIGlmIChmMmZzX2lzX2F0b21pY19maWxlKGlub2RlKSB8fCBmMmZz
X2NvbXByZXNzZWRfZmlsZShpbm9kZSkgfHwKPiA+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAg
ICAgIHJhbmdlLnN0YXJ0ID49IGlub2RlLT5pX3NpemUpIHsKPiA+ID4+Pj4gICAgICAgICAgICAg
ICAgICByZXQgPSAtRUlOVkFMOwo+ID4gPj4+PiAgICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+
ID4gPj4+PiAgICAgICAgICB9Cj4gPiA+Pj4+Cj4gPiA+Pj4+IC0gICAgICAgIGlmIChyYW5nZS5z
dGFydCA+PSBpbm9kZS0+aV9zaXplKSB7Cj4gPiA+Pj4+IC0gICAgICAgICAgICAgICAgcmV0ID0g
LUVJTlZBTDsKPiA+ID4+Pj4gKyAgICAgICAgaWYgKHJhbmdlLmxlbiA9PSAwKQo+ID4gPj4+PiAg
ICAgICAgICAgICAgICAgIGdvdG8gZXJyOwo+ID4gPj4+PiAtICAgICAgICB9Cj4gPiA+Pj4+Cj4g
PiA+Pj4+IC0gICAgICAgIGlmIChpbm9kZS0+aV9zaXplIC0gcmFuZ2Uuc3RhcnQgPCByYW5nZS5s
ZW4pIHsKPiA+ID4+Pj4gLSAgICAgICAgICAgICAgICByZXQgPSAtRTJCSUc7Cj4gPiA+Pj4+IC0g
ICAgICAgICAgICAgICAgZ290byBlcnI7Cj4gPiA+Pj4+IC0gICAgICAgIH0KPiA+ID4+Pj4gLSAg
ICAgICAgZW5kX2FkZHIgPSByYW5nZS5zdGFydCArIHJhbmdlLmxlbjsKPiA+ID4+Pj4gKyAgICAg
ICAgaWYgKHJhbmdlLmxlbiA9PSAodTY0KS0xIHx8IGlub2RlLT5pX3NpemUgLSByYW5nZS5zdGFy
dCA8IHJhbmdlLmxlbikKPiA+ID4+Pj4gKyAgICAgICAgICAgICAgICBlbmRfYWRkciA9IGlub2Rl
LT5pX3NpemU7Cj4gPiA+Pgo+ID4gPj4gV2UgY2FuIHJlbW92ZSAncmFuZ2UubGVuID09ICh1NjQp
LTEnIGNvbmRpdGlvbiBzaW5jZSBsYXRlciBjb25kaXRpb24gY2FuIGNvdmVyCj4gPiA+PiB0aGlz
Pwo+ID4gPj4KPiA+ID4+Pgo+ID4gPj4+IEhtbSwgd2hhdCBpZiB0aGVyZSBhcmUgYmxvY2tzIGJl
eW9uZCBpX3NpemU/IERvIHdlIG5lZWQgdG8gY2hlY2sgaV9ibG9ja3MgZm9yCj4gPiA+Pgo+ID4g
Pj4gVGhlIGJsb2NrcyBiZXlvbmQgaV9zaXplIHdpbGwgbmV2ZXIgYmUgd3JpdHRlbiwgdGhlcmUg
d29uJ3QgYmUgYW55IHZhbGlkIG1lc3NhZ2UKPiA+ID4+IHRoZXJlLCBzbyB3ZSBkb24ndCBuZWVk
IHRvIHdvcnJ5IGFib3V0IHRoYXQuCj4gPiA+Cj4gPiA+IEkgZG9uJ3QgdGhpbmsgd2UgaGF2ZSBh
IHdheSB0byBndWFyYW50ZWUgdGhlIG9yZGVyIG9mIGlfc2l6ZSBhbmQgYmxvY2sKPiA+ID4gYWxs
b2NhdGlvbiBpbiBmMmZzLiBTZWUgZjJmc193cml0ZV9iZWdpbiBhbmQgZjJmc193cml0ZV9lbmQu
Cj4gPgo+ID4gSG93ZXZlciwgd3JpdGVfYmVnaW4gJiB3cml0ZV9lbmQgYXJlIGNvdmVyZWQgYnkg
aW5vZGVfbG9jaywgaXQgY291bGQgbm90IGJlCj4gPiByYWN5IHdpdGggaW5vZGUgc2l6ZSBjaGVj
ayBpbiBmMmZzX3NlY190cmltX2ZpbGUoKSBhcyBpdCBob2xkIGlub2RlX2xvY2sgYXMKPiA+IHdl
bGw/Cj4KPiBMaWtlIERhZWhvIHNhaWQsIHdyaXRlX2JlZ2luIC0+IGNoZWNrcG9pbnQgLT4gcG93
ZXItY3V0IGNhbiBnaXZlIGJpZ2dlciBpX2Jsb2Nrcwo+IHRoYW4gaV9zaXplLgo+Cj4gPgo+ID4g
Pgo+ID4gPj4KPiA+ID4+IFRoYW5rcywKPiA+ID4+Cj4gPiA+Pj4gZW5kaW5nIGNyaXRlcmlhPwo+
ID4gPj4+Cj4gPiA+Pj4+ICsgICAgICAgIGVsc2UKPiA+ID4+Pj4gKyAgICAgICAgICAgICAgICBl
bmRfYWRkciA9IHJhbmdlLnN0YXJ0ICsgcmFuZ2UubGVuOwo+ID4gPj4+Pgo+ID4gPj4+PiAgICAg
ICAgICB0b19lbmQgPSAoZW5kX2FkZHIgPT0gaW5vZGUtPmlfc2l6ZSk7Cj4gPiA+Pj4+ICAgICAg
ICAgIGlmICghSVNfQUxJR05FRChyYW5nZS5zdGFydCwgRjJGU19CTEtTSVpFKSB8fAo+ID4gPj4+
PiAtLQo+ID4gPj4+PiAyLjI3LjAuMzgzLmcwNTAzMTljMmFlLWdvb2cKPiA+ID4+Pj4KPiA+ID4+
Pj4KPiA+ID4+Pj4KPiA+ID4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KPiA+ID4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+ID4+
Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+ID4+Pj4gaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+
ID4gPj4+Cj4gPiA+Pj4KPiA+ID4+PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwo+ID4gPj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPiA+
Pj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiA+ID4+PiBodHRwczov
L2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCj4g
PiA+Pj4gLgo+ID4gPj4+Cj4gPiA+IC4KPiA+ID4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
