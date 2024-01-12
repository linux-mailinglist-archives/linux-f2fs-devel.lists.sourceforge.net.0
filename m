Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA9B982C71C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 23:20:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOPsX-00027u-6r;
	Fri, 12 Jan 2024 22:19:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rOPsW-00027o-3M
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 22:19:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7e/2OkUvS339Il58Bmr0PaHeMM9UBP4jRux2aDWKwj0=; b=PWCV2cxJ7e8fBsvqLIKPPy7BAA
 1lNEbvlmfX2lKgMEU7Phdg48FNFw9fhcPMpjtyMblZxswkJBDCJNBUODtnaw6oL3T2932NSkBLNnr
 5uQBy8WR0rUTK+qWHX27+kY1CzOp3grBnZHjhAQmpZ/daFQ1Jc7d6NAFUo0amEYKmFik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7e/2OkUvS339Il58Bmr0PaHeMM9UBP4jRux2aDWKwj0=; b=cPkbyTLohd+MGlnspBIboYY0lS
 U1FUBBXM/yWimyoIjI/z5YY/q5SunS7J+WA3ci7V6DCeCpNa+jAx9LAg5uJyzMZdYnyuNr73gKUXh
 VBcXqAlgSMbt3aWJO/42WRZK+wTicb4AXqL4zHpk9bdbXgflD7GfqT9RZ0sScbo/6q4I=;
Received: from mail-ua1-f52.google.com ([209.85.222.52])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rOPsU-0008Iw-SO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 22:19:52 +0000
Received: by mail-ua1-f52.google.com with SMTP id
 a1e0cc1a2514c-7ce603b9051so1874191241.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 12 Jan 2024 14:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705097985; x=1705702785; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7e/2OkUvS339Il58Bmr0PaHeMM9UBP4jRux2aDWKwj0=;
 b=kCkdDyOJ6mzFIMoFJTy9WZyjz05PVx6aQGPZHZrCaFCiT7BoKhN6yBVVg+EXSkF7Jp
 FPlqcZGbANSWODV5HBzv8/G7sQ/e5DFinmLdX+I0oJCJZaI4WP7A4d1bMzNhJPtm2iMb
 FllWacKYsB5loZFVd8OGI3m/QAllwddVfd1PVgMQNEMcwe0lWX/E9na4DsSmsCYmGvaZ
 LdqpK7l/XqxytHtb174pC0w9+H9Sn7xXFT1iXAbsVWBLS2Oz5aAlCQ04+4u157t0XuRn
 7Uxf/QEW6BX7pOO+GEnCOlXjgFRnz52JX6y4lj6SJXqliZV3aL39nUiF6UVTx+7xCumR
 xq3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705097985; x=1705702785;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7e/2OkUvS339Il58Bmr0PaHeMM9UBP4jRux2aDWKwj0=;
 b=CiP5MKKCcxljNTmA7qvTFdNlRBU81cRL3jAYyTr6Dexz4XPb3u+/Vps/S5ZNqzoDMi
 lMhOx5lJApbjmCNr4HNnq/z9RnLN/iV/KBl8sjBXAGtmpCm8waQp5GSuHoRoGxYixBCS
 TfQX7JC6n2NmElpSzjda8sxXu28hIAPRXy619I0n3pK2pIpO9cDNDQT8nTF2WsjJiZW5
 dbmvcLIHAP7xxEUpniAdIVLr05XKWHHmGMondfwlbMsAb3hO7a8zDhW+RG0O4XRZzVAV
 p4yAe8nPRKkDF2LsTPidRzzlbd/2SHL+dvNLH6ei4bBzWCQV1jX/EqNP6BzA0EH6MHgp
 sj9w==
X-Gm-Message-State: AOJu0YyYZzehkN43cg2i4Sd3KkGX3VTM/Lkv2ZHlj/zvOaOOODYMTFFY
 AdLXxlRCsTwl2XhiCbmFW01eG8fIHTNP+a89CNeyNsQlWTE=
X-Google-Smtp-Source: AGHT+IHbAIFmhodUFQ/mXl1kZldMTqJsd1oG8vONsS6msMLHUD2sLD4jVDfIFtfTXhcwfngf7f1LWSE8CEi3qClYBXQ=
X-Received: by 2002:a05:6122:2191:b0:4b6:d4c8:9caa with SMTP id
 j17-20020a056122219100b004b6d4c89caamr2254783vkd.21.1705097985517; Fri, 12
 Jan 2024 14:19:45 -0800 (PST)
MIME-Version: 1.0
References: <20231228143152.1543509-1-chao@kernel.org>
 <20231228143152.1543509-3-chao@kernel.org>
 <CACOAw_xCfOtJaC3FbOhvbrEzyUwecdSujFo4-f--dz+33BC+Sg@mail.gmail.com>
 <e7f4a835-6a4c-4f94-a79f-a425b04516e2@kernel.org>
 <CACOAw_wzBTV=+cqZeiCZvhud1Ek06aW_5nJbg=9FF327MNgxEg@mail.gmail.com>
 <d2f2e4ba-8668-4e37-a56f-dbe7c730b01f@kernel.org>
In-Reply-To: <d2f2e4ba-8668-4e37-a56f-dbe7c730b01f@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Jan 2024 14:19:34 -0800
Message-ID: <CACOAw_xLFQchVKde8dH5EooqrUq8J1pftDYFJ-Ur6KaqXL_dfQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Jan 11, 2024 at 5:06 PM Chao Yu wrote: > > On 2024/1/12
    1:15, Daeho Jeong wrote: > > On Wed, Jan 10, 2024 at 5:33 PM Chao Yu wrote:
    > >> > >> On 2024/1/11 9:18, Daeho Jeong wrote: > >> [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.52 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.52 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOPsU-0008Iw-SO
Subject: Re: [f2fs-dev] [PATCH v3 3/6] f2fs: compress: fix to check
 unreleased compressed cluster
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBKYW4gMTEsIDIwMjQgYXQgNTowNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9y
Zz4gd3JvdGU6Cj4KPiBPbiAyMDI0LzEvMTIgMToxNSwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBP
biBXZWQsIEphbiAxMCwgMjAyNCBhdCA1OjMz4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPiA+Pgo+ID4+IE9uIDIwMjQvMS8xMSA5OjE4LCBEYWVobyBKZW9uZyB3cm90ZToK
PiA+Pj4gT24gVGh1LCBEZWMgMjgsIDIwMjMgYXQgNjozM+KAr0FNIENoYW8gWXUgPGNoYW9Aa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPj4+Pgo+ID4+Pj4gRnJvbTogU2hlbmcgWW9uZyA8c2hlbmd5b25n
QG9wcG8uY29tPgo+ID4+Pj4KPiA+Pj4+IENvbXByZXNzZWQgY2x1c3RlciBtYXkgbm90IGJlIHJl
bGVhc2VkIGR1ZSB0byB3ZSBjYW4gZmFpbCBpbgo+ID4+Pj4gcmVsZWFzZV9jb21wcmVzc19ibG9j
a3MoKSwgZml4IHRvIGhhbmRsZSByZXNlcnZlZCBjb21wcmVzc2VkCj4gPj4+PiBjbHVzdGVyIGNv
cnJlY3RseSBpbiByZXNlcnZlX2NvbXByZXNzX2Jsb2NrcygpLgo+ID4+Pj4KPiA+Pj4+IEZpeGVz
OiA0YzhmZjcwOTViZWYgKCJmMmZzOiBzdXBwb3J0IGRhdGEgY29tcHJlc3Npb24iKQo+ID4+Pj4g
U2lnbmVkLW9mZi1ieTogU2hlbmcgWW9uZyA8c2hlbmd5b25nQG9wcG8uY29tPgo+ID4+Pj4gU2ln
bmVkLW9mZi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4+Pj4gLS0tCj4gPj4+PiAg
ICBmcy9mMmZzL2ZpbGUuYyB8IDEyICsrKysrKysrKysrKwo+ID4+Pj4gICAgMSBmaWxlIGNoYW5n
ZWQsIDEyIGluc2VydGlvbnMoKykKPiA+Pj4+Cj4gPj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
aWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+Pj4gaW5kZXggMDI2ZDA1YTdlZGQ4Li43ODJhZTNi
ZTQ4ZjYgMTAwNjQ0Cj4gPj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ID4+Pj4gKysrIGIvZnMv
ZjJmcy9maWxlLmMKPiA+Pj4+IEBAIC0zNjI0LDYgKzM2MjQsMTUgQEAgc3RhdGljIGludCByZXNl
cnZlX2NvbXByZXNzX2Jsb2NrcyhzdHJ1Y3QgZG5vZGVfb2ZfZGF0YSAqZG4sIHBnb2ZmX3QgY291
bnQpCj4gPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZ290byBuZXh0Owo+
ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPj4+Pgo+ID4+Pj4gKyAgICAgICAg
ICAgICAgICAgICAgICAgLyoKPiA+Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAqIGNvbXBy
ZXNzZWQgY2x1c3RlciB3YXMgbm90IHJlbGVhc2VkIGR1ZSB0bwo+ID4+Pj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICogaXQgZmFpbHMgaW4gcmVsZWFzZV9jb21wcmVzc19ibG9ja3MoKS4KPiA+
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAqLwo+ID4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKGJsa2FkZHIgPT0gTkVXX0FERFIpIHsKPiA+Pj4+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgY29tcHJfYmxvY2tzKys7Cj4gPj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIGNvbnRpbnVlOwo+ID4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgfQo+
ID4+Pj4gKwo+ID4+Pj4gICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoX19pc192YWxpZF9k
YXRhX2Jsa2FkZHIoYmxrYWRkcikpIHsKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb21wcl9ibG9ja3MrKzsKPiA+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBjb250aW51ZTsKPiA+Pj4KPiA+Pj4gSG93IGFib3V0IG1lcmdpbmcgdHdvIGNvbmRp
dGlvbnMgbGlrZSAiYmxrYWRkciA9PSBORVdfQUREUiB8fAo+ID4+PiBfX2lzX3ZhbGlkX2RhdGFf
YmxrYWRkcihibGthZGRyKSI/Cj4gPj4KPiA+PiBPaCwgc3VyZS4KPiA+Pgo+ID4+Pgo+ID4+Pj4g
QEAgLTM2MzMsNiArMzY0Miw5IEBAIHN0YXRpYyBpbnQgcmVzZXJ2ZV9jb21wcmVzc19ibG9ja3Mo
c3RydWN0IGRub2RlX29mX2RhdGEgKmRuLCBwZ29mZl90IGNvdW50KQo+ID4+Pj4gICAgICAgICAg
ICAgICAgICAgfQo+ID4+Pj4KPiA+Pj4+ICAgICAgICAgICAgICAgICAgIHJlc2VydmVkID0gY2x1
c3Rlcl9zaXplIC0gY29tcHJfYmxvY2tzOwo+ID4+Pj4gKyAgICAgICAgICAgICAgIGlmICghcmVz
ZXJ2ZWQpCj4gPj4+PiArICAgICAgICAgICAgICAgICAgICAgICBnb3RvIG5leHQ7Cj4gPj4+PiAr
Cj4gPj4+Cj4gPj4+IEhvdyBjYW4gdGhlIHJlc2VydmVkIHZhcmlhYmxlIGJlIHplcm8/Cj4gPj4K
PiA+PiBJIGd1ZXNzIGl0IGNhbiBoYXBwZW4gaWYgYSBjbHVzdGVyIHdhcyBub3QgcmVsZWFzZWQg
ZHVyaW5nCj4gPj4gcmVsZWFzZV9jb21wcmVzc19ibG9ja3MoKSwgdGhlbiBhbGwgYmxvY2tzIGlu
IHRoZSBjbHVzdGVyIHNob3VsZAo+ID4+IGhhcyBiZWVuIHJlc2VydmVkLCBzbywgaW4gdGhpcyBy
b3VuZCBvZiByZXNlcnZpbmcsIGl0IG5lZWRzIHRvIHNraXAKPiA+PiByZXNlcnZlIGJsb2Nrcywg
cmlnaHQ/Cj4gPgo+ID4gTGV0J3MgYXNzdW1lIGNsdXN0ZXJfc2l6ZSBpcyA0LiBIb3cgY2FuIGNv
bXByX2Jsb2NrcyBiZSA0Pwo+ID4KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoaSA9
PSAwKSB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpZiAoYmxrYWRkciA9
PSBDT01QUkVTU19BRERSKQo+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBjb250aW51ZTsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGRuLT5v
ZnNfaW5fbm9kZSArPSBjbHVzdGVyX3NpemU7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBnb3RvIG5leHQ7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4KPiA+
IFdlIHNraXAgdGhlIGJsb2NrIGhhdmluZyBDT01QUkVTU19BRERSIHdoZW4gY291bnRpbmcgY29t
cHJfYmxvY2tzLgo+ID4gU28sIHRoZSBtYXhpbXVtIHZhbHVlIG9mIGNvbXByX2Jsb2NrcyBzaG91
bGQgYmUgMywgcmlnaHQ/Cj4KPiBBaCwgZ290IGl0LCBhbmQgSSB0aGluayB5b3UncmUgcmlnaHQu
Cj4KPiBTaG91bGQgZml4IHRoZSBjb25kaXRpb24gYXMgYmVsb3c/Cj4KPiAgICAgICAgICAgICAg
ICAgLyogZm9yIHRoZSBjYXNlIGFsbCBibG9ja3MgaW4gY2x1c3RlciB3ZXJlIHJlc2VydmVkICov
Cj4gICAgICAgICAgICAgICAgIGlmIChyZXNlcnZlZCA9PSAxKQo+ICAgICAgICAgICAgICAgICAg
ICAgICAgIGdvdG8gbmV4dDsKCkl0IGxvb2tzIGdvb2QgdG8gbWUuCgo+Cj4gVGhhbmtzLAo+Cj4g
Pgo+ID4+Cj4gPj4gVGhhbmtzLAo+ID4+Cj4gPj4+Cj4gPj4+PiAgICAgICAgICAgICAgICAgICBy
ZXQgPSBpbmNfdmFsaWRfYmxvY2tfY291bnQoc2JpLCBkbi0+aW5vZGUsICZyZXNlcnZlZCk7Cj4g
Pj4+PiAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ID4+Pj4gICAgICAgICAgICAgICAgICAg
ICAgICAgICByZXR1cm4gcmV0Owo+ID4+Pj4gLS0KPiA+Pj4+IDIuNDAuMQo+ID4+Pj4KPiA+Pj4+
Cj4gPj4+Pgo+ID4+Pj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiA+Pj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gPj4+PiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+ID4+Pj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
