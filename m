Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B63089AFAE
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  7 Apr 2024 10:30:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtNun-0001qN-Ea;
	Sun, 07 Apr 2024 08:30:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rtNul-0001q0-3D
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 08:30:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KegH3sR2j0m95M/huZzcgru/39HKdJxkpUlKBF8/G8M=; b=SnwASXs1wAq2a2mWOEgn0y5iP2
 M3U8aDSDHAfpbpVqfjusqnHnzhGJ00DxuvdPYvm05/MzHETI2Lshq5wongxIfD2pIQ549WKbTIpAK
 n5eVMpYi/EjC/HCmp1eLPGTF2HwbSgo3TBVfDDu/Opn+VnN2y5EVoPfqq09Ywr/l2NFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KegH3sR2j0m95M/huZzcgru/39HKdJxkpUlKBF8/G8M=; b=mAyN20ZI/UGyi1BgeyU3o0d1cS
 58koiFhLc1hB1fIopceB7PXrSgIGlLMo4jzxMo1g6z0ED9YO3N1TjCCMC7+4asRMFOcBom5R1lPLG
 lWFmrgRz48nSqDahTQlwvHOVDErvvBUdCzrFbg9wS57TLNZNO93ZbEytbRbLE9kcKxAs=;
Received: from mail-wr1-f44.google.com ([209.85.221.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rtNuj-0000E7-O1 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 07 Apr 2024 08:30:11 +0000
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-34005b5927eso2250217f8f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 07 Apr 2024 01:30:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712478603; x=1713083403; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KegH3sR2j0m95M/huZzcgru/39HKdJxkpUlKBF8/G8M=;
 b=SGqSYaLa4d36QqvgM7P0h5WsIWBRN9qXpm/z/VfAO3zc+lx99QJxLZC6CM4r2WkvqF
 xZVr8oo65lFQIrm2PDhVS3yxkXHNuzELTLPgjb6u+WI52CN+q+Yi1Meujm5zuaLR9USX
 MP66KDYnHaJL3sySD7C52oGB4KZq9VbruvuvSQIctD1WE1BBqSjIVjN3y+sbFn5CBuh8
 xlpYX/k+t0VWxSD0KPzUhUq5qdlMx5Nvyzlf2qfgLkDppiDsc+KW2dYEHoByn4C+pA1r
 Gx6vB+fZ6/eBDTqjr3vHoWCR5lrPiY0peFEBpgDRrvikZQSPLmW1fWZ6Khxh8bGk+bcN
 9qGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712478603; x=1713083403;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KegH3sR2j0m95M/huZzcgru/39HKdJxkpUlKBF8/G8M=;
 b=BQ/ehlCvafmX9n/5Q71hgkVSMTAM5emGTPTxpLxwWaDOM4DDyHEo+7AlW3GCXIfaoC
 XZEkclmrlpEpQ4w6qZ2RqKPLMVY5Kc+J4xrA2jzaezBWtSSKNLUYirtLQaEqbtdIztPq
 uGIETDOOgNZxVSV3hi048hk0IP23z2f+Q6+mD+rENuLzcNT6N8AjqavnyBNoEvL9mGdd
 xdogsytMyGACgG6Tm6VKvdtaJ+4fPB8obP7DZNkJVFFckl97oGjM0KnWJrcVR5sXlGzB
 DwgHRaN1NMMxypaMW2uh3EEL/nRjPl+k1H5XLdlZ2vMY4zWGLmaZsR9/76Lk800A9ms5
 0a7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0Sp9LFUU7Wh2Eyij0MEOww9z491TKylZ/XuPSAUs6MiORuKE/Ymc3SMqml/AYA63pOLoyOVVulCc1/AbVQXoCa8WITs7gIoLnKVJbVz5L4dsOvr98BQ==
X-Gm-Message-State: AOJu0YzNmLEbq3c5ItYqCfG4oeq4+xYmcQLUgk+xZqTdB1UvWR0Gx6MT
 fq7lZ52mddIPyYvuTv5hl/SRaY1ShTb5h6PYIjl0HzA6yWMGCGfE5zfvP/Is67MT81Ak+6d1goF
 OciKSGie3FWiP817TRYarEzm53HJ3C9Cu5vw=
X-Google-Smtp-Source: AGHT+IER9MAB73PUR1jmYTeM+srRha7Qvz29IeaO46RJPWA6TGNOJEbz4T5IkM8olphRgM345g9jm+LxQTjXUm8RluE=
X-Received: by 2002:adf:f345:0:b0:343:7884:fb52 with SMTP id
 e5-20020adff345000000b003437884fb52mr4655325wrp.50.1712478603332; Sun, 07 Apr
 2024 01:30:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240403142420.2042498-1-chao@kernel.org>
 <CAHJ8P3LdZXLc2rqeYjvymgYHr2+YLuJ0sLG9DdsJZmwO7deuhw@mail.gmail.com>
 <6a50a23e-8975-43cb-9496-38b6a083c703@kernel.org>
In-Reply-To: <6a50a23e-8975-43cb-9496-38b6a083c703@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Sun, 7 Apr 2024 16:29:52 +0800
Message-ID: <CAHJ8P3+YPhH9BsQumZFVM=bc_7zb=4oZH85+qG7bA4XJ3vLsFw@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Sun, Apr 7, 2024 at 3:29 PM Chao Yu wrote: > > On 2024/4/7
    10:11, Zhiguo Niu wrote: > > On Wed, Apr 3, 2024 at 10:26 PM Chao Yu wrote:
    > >> > >> compress and pinfile flag should be checked [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.44 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1rtNuj-0000E7-O1
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: fix to relocate check condition in
 f2fs_fallocate()
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

T24gU3VuLCBBcHIgNywgMjAyNCBhdCAzOjI54oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvNC83IDEwOjExLCBaaGlndW8gTml1IHdyb3RlOgo+ID4gT24g
V2VkLCBBcHIgMywgMjAyNCBhdCAxMDoyNuKAr1BNIENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPj4KPiA+PiBjb21wcmVzcyBhbmQgcGluZmlsZSBmbGFnIHNob3VsZCBiZSBjaGVj
a2VkIGFmdGVyIGlub2RlIGxvY2sgaGVsZCB0bwo+ID4+IGF2b2lkIHJhY2UgY29uZGl0aW9uLCBm
aXggaXQuCj4gPj4KPiA+PiBGaXhlczogNGM4ZmY3MDk1YmVmICgiZjJmczogc3VwcG9ydCBkYXRh
IGNvbXByZXNzaW9uIikKPiA+PiBGaXhlczogNWZlZDBiZTg1ODNmICgiZjJmczogZG8gbm90IGFs
bG93IHBhcnRpYWwgdHJ1bmNhdGlvbiBvbiBwaW5uZWQgZmlsZSIpCj4gPj4gU2lnbmVkLW9mZi1i
eTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+ID4+IC0tLQo+ID4+ICAgZnMvZjJmcy9maWxl
LmMgfCAyMCArKysrKysrKysrKy0tLS0tLS0tLQo+ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKyksIDkgZGVsZXRpb25zKC0pCj4gPj4KPiA+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+ID4+IGluZGV4IDE0OGJmZTNlZmZkZi4uODNhODA3
ZTI1ZTMxIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gPj4gKysrIGIvZnMvZjJm
cy9maWxlLmMKPiA+PiBAQCAtMTgyMCwxNSArMTgyMCw2IEBAIHN0YXRpYyBsb25nIGYyZnNfZmFs
bG9jYXRlKHN0cnVjdCBmaWxlICpmaWxlLCBpbnQgbW9kZSwKPiA+PiAgICAgICAgICAgICAgICAg
IChtb2RlICYgKEZBTExPQ19GTF9DT0xMQVBTRV9SQU5HRSB8IEZBTExPQ19GTF9JTlNFUlRfUkFO
R0UpKSkKPiA+PiAgICAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+Pgo+ID4+
IC0gICAgICAgLyoKPiA+PiAtICAgICAgICAqIFBpbm5lZCBmaWxlIHNob3VsZCBub3Qgc3VwcG9y
dCBwYXJ0aWFsIHRydW5jYXRpb24gc2luY2UgdGhlIGJsb2NrCj4gPj4gLSAgICAgICAgKiBjYW4g
YmUgdXNlZCBieSBhcHBsaWNhdGlvbnMuCj4gPj4gLSAgICAgICAgKi8KPiA+PiAtICAgICAgIGlm
ICgoZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpIHx8IGYyZnNfaXNfcGlubmVkX2ZpbGUoaW5v
ZGUpKSAmJgo+ID4+IC0gICAgICAgICAgICAgICAobW9kZSAmIChGQUxMT0NfRkxfUFVOQ0hfSE9M
RSB8IEZBTExPQ19GTF9DT0xMQVBTRV9SQU5HRSB8Cj4gPj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgRkFMTE9DX0ZMX1pFUk9fUkFOR0UgfCBGQUxMT0NfRkxfSU5TRVJUX1JBTkdFKSkpCj4gPj4g
LSAgICAgICAgICAgICAgIHJldHVybiAtRU9QTk9UU1VQUDsKPiA+PiAtCj4gPj4gICAgICAgICAg
aWYgKG1vZGUgJiB+KEZBTExPQ19GTF9LRUVQX1NJWkUgfCBGQUxMT0NfRkxfUFVOQ0hfSE9MRSB8
Cj4gPj4gICAgICAgICAgICAgICAgICAgICAgICAgIEZBTExPQ19GTF9DT0xMQVBTRV9SQU5HRSB8
IEZBTExPQ19GTF9aRVJPX1JBTkdFIHwKPiA+PiAgICAgICAgICAgICAgICAgICAgICAgICAgRkFM
TE9DX0ZMX0lOU0VSVF9SQU5HRSkpCj4gPj4gQEAgLTE4MzYsNiArMTgyNywxNyBAQCBzdGF0aWMg
bG9uZyBmMmZzX2ZhbGxvY2F0ZShzdHJ1Y3QgZmlsZSAqZmlsZSwgaW50IG1vZGUsCj4gPj4KPiA+
PiAgICAgICAgICBpbm9kZV9sb2NrKGlub2RlKTsKPiA+Pgo+ID4+ICsgICAgICAgLyoKPiA+PiAr
ICAgICAgICAqIFBpbm5lZCBmaWxlIHNob3VsZCBub3Qgc3VwcG9ydCBwYXJ0aWFsIHRydW5jYXRp
b24gc2luY2UgdGhlIGJsb2NrCj4gPj4gKyAgICAgICAgKiBjYW4gYmUgdXNlZCBieSBhcHBsaWNh
dGlvbnMuCj4gPj4gKyAgICAgICAgKi8KPiA+PiArICAgICAgIGlmICgoZjJmc19jb21wcmVzc2Vk
X2ZpbGUoaW5vZGUpIHx8IGYyZnNfaXNfcGlubmVkX2ZpbGUoaW5vZGUpKSAmJgo+ID4+ICsgICAg
ICAgICAgICAgICAobW9kZSAmIChGQUxMT0NfRkxfUFVOQ0hfSE9MRSB8IEZBTExPQ19GTF9DT0xM
QVBTRV9SQU5HRSB8Cj4gPj4gKyAgICAgICAgICAgICAgICAgICAgICAgRkFMTE9DX0ZMX1pFUk9f
UkFOR0UgfCBGQUxMT0NfRkxfSU5TRVJUX1JBTkdFKSkpIHsKPiA+PiArICAgICAgICAgICAgICAg
cmV0ID0gLUVPUE5PVFNVUFA7Cj4gPj4gKyAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ID4+ICsg
ICAgICAgfQo+ID4+ICsKPiA+IERlYXIgQ2hhbywKPiA+IEkgc2VlICB0aGUganVkZ21lbnQgY29k
ZSAiaWYoIWYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkiIGFsc28gaXMKPiA+IGJlZm9yZSBp
bm9kZV9sb2NrIGluIGZ1bmN0aW9ucwo+ID4gZjJmc19pb2NfZGVjb21wcmVzc19maWxlL2YyZnNf
aW9jX2NvbXByZXNzX2ZpbGUvZjJmc19yZXNlcnZlX2NvbXByZXNzX2Jsb2Nrcy9mMmZzX3JlbGVh
c2VfY29tcHJlc3NfYmxvY2tzLgo+ID4gc2hvdWxkIHRoZXkgYXJlIGNoYW5nZWQgdG9nZXRoZXI/
Cj4KPiBaaGlndW8sCj4KPiBUaGFua3MgZm9yIG5vdGljaW5nIHRoYXQsIEkndmUgc3VibWl0dGVk
IHNlcGFyYXRlZCBwYXRjaGVzIGZvciBmaXhpbmcKPiBiZWNhdXNlIHRob3NlIGJ1Z3Mgd2VyZSBp
bnRyb2R1Y2VkIGJ5IHNlcGFyYXRlZCBjb21taXRzLgo+Cj4gVGhhbmtzLApEZWFyIENoYW8sCllv
dSdyZSB3ZWxjb21lXl4KCj4KPiA+IHRoYW5rc++8gQo+ID4+ICAgICAgICAgIHJldCA9IGZpbGVf
bW9kaWZpZWQoZmlsZSk7Cj4gPj4gICAgICAgICAgaWYgKHJldCkKPiA+PiAgICAgICAgICAgICAg
ICAgIGdvdG8gb3V0Owo+ID4+IC0tCj4gPj4gMi40MC4xCj4gPj4KPiA+Pgo+ID4+Cj4gPj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+PiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
