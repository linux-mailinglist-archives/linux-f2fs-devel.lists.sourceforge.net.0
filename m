Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F708C9F69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 May 2024 17:13:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s94h6-0000gK-Pm;
	Mon, 20 May 2024 15:12:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1s94h5-0000g7-Gg
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 15:12:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sZc1FZCYq73l90VQebCM3IT7KCZ10kRpwqDADmudC9I=; b=EzMxpdpFjUkIEeiK3xuQpjYfDz
 Z1B/E6rlHRc3JvSrLezx0xL0rFKbKYnuTutHcWYSmKEZL1QYFEJuT6WQYEoo1EiF8Ree20R1ids9n
 RUdHz0f0BAFFlwrA2Awd+W3OTAFV7fv7owa7EVVcCwTGfRaP0EhEo3a6Iq91iE8m9KQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sZc1FZCYq73l90VQebCM3IT7KCZ10kRpwqDADmudC9I=; b=WFtzQHAV0at5HKhmnhZ3Mltv+U
 NI6rABsXTeTGnInQp3n/Ktsg+4/rx2eu9Cs6TB3n9nT1117ox2BENL5qCOvdN2YP23w8bSkmY06GS
 G/GogP8bVeSMamDMKZyvnCCrTAggNqPHS1/jR9NOf5oQepN14munvagA2DyX0wRBmLxs=;
Received: from mail-oi1-f176.google.com ([209.85.167.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s94h5-0003CT-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 May 2024 15:12:55 +0000
Received: by mail-oi1-f176.google.com with SMTP id
 5614622812f47-3c9937b7292so1304802b6e.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 May 2024 08:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716217969; x=1716822769; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sZc1FZCYq73l90VQebCM3IT7KCZ10kRpwqDADmudC9I=;
 b=MNo5k1GLYXXZmd8alrsx+C862vFSir+GzRy4UtD7TznGQKArvH/KzYnuG1y9YWDVA5
 8FwXpHViQsGsKCyWkWU0fc5hHDQwwPyrY5lhKrvutd9qyZjm146x4RE1yu6c49lbzqPh
 9gs9n0WNFtUsxw5hlg1+y9PDX1lRSf/aVM9t5BPPJk+tDwOqNZ1NN1KQSzpdCU2nwAUO
 nBeKUC+RxVu0BduFXVZcpd1YyqkzMt6dMixrEXyF7hdYwSw9UdxVlWxb8jAM5Q5+5svv
 /zMgDXBEzQ9BMbnT+Ipl3iGnh5qD+2iugt+99Vei47rD7tFnRwUMnvw+aMkCjokmin4m
 Eezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716217969; x=1716822769;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sZc1FZCYq73l90VQebCM3IT7KCZ10kRpwqDADmudC9I=;
 b=Vxxj3KRfgPlEmY51F3v5ri+CY4F5UcIat4vDDKPOpnibiRe7rJPWRRK214vjkHEdow
 EUfkTQOe6UgQaeTvELaQLJTiEszDRp39Y8TKRh+/EoJFrUFb+Ecpu8U/YxyRGjy3Pjly
 jsCkIONnO+RjehYnLdbEyvy957nXPkLsJFdU8+Wv/FjA6HfkM9XY9x3c4CcmgtbzXJZZ
 iIfO5Q4qyEVIxXdCdwmht0jBxk7zrDZYJ/rP/Ly4iQR843D0JBvrpA4mm3jKqhHOnRlq
 tQCUTw/ut7ca5AGIdHcFFWFwUnamIK2M9dfZ4LsxrFPxHbGPLI8unn6VBi5O3d0XwOT6
 2Z0w==
X-Gm-Message-State: AOJu0YwhFGSXYNRAUdZ8OcREbEhA6/3A74e5fXRAvVhI1mnDw/SIkFDf
 53uwYM545AnCHUJ6HSSPgkcwLm1A+rvFelGRWUlbtODIDhgqEwEf5GkuwA+fMTqnuJYrG9XYbW3
 X/AMiKGylAa1cv/JZMc7xOYVhlxFN564H
X-Google-Smtp-Source: AGHT+IF7jr+DGDiD2EHWhI5YYVo3mzqtGYTRKbLbRoSC/JgD6aNzMVcnlShM+2diMxupym/7fcHB5SYGw2mF9TeTwvc=
X-Received: by 2002:a05:6808:1a28:b0:3c9:68b9:984b with SMTP id
 5614622812f47-3c9970d1b61mr35959858b6e.53.1716217969323; Mon, 20 May 2024
 08:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20240508005704.765813-1-drosen@google.com>
 <20240508005704.765813-2-drosen@google.com>
In-Reply-To: <20240508005704.765813-2-drosen@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 20 May 2024 08:12:38 -0700
Message-ID: <CACOAw_yO_AGO3Qd73WuLchE1XKEi4e8a0h6uDE=aHR=4KJnG5A@mail.gmail.com>
To: Daniel Rosenberg <drosen@google.com>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, May 7, 2024 at 6:23 PM Daniel Rosenberg via Linux-f2fs-devel
    wrote: > > Xattrs for files with inline data were being skipped. This dumps
    those, > as well as xattrs for folders. > > Signed- [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.176 listed in wl.mailspike.net]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
X-Headers-End: 1s94h5-0003CT-Pa
Subject: Re: [f2fs-dev] [PATCH 2/2] dump.f2fs: Fix xattr dumping
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBNYXkgNywgMjAyNCBhdCA2OjIz4oCvUE0gRGFuaWVsIFJvc2VuYmVyZyB2aWEgTGlu
dXgtZjJmcy1kZXZlbAo8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQ+IHdy
b3RlOgo+Cj4gWGF0dHJzIGZvciBmaWxlcyB3aXRoIGlubGluZSBkYXRhIHdlcmUgYmVpbmcgc2tp
cHBlZC4gVGhpcyBkdW1wcyB0aG9zZSwKPiBhcyB3ZWxsIGFzIHhhdHRycyBmb3IgZm9sZGVycy4K
Pgo+IFNpZ25lZC1vZmYtYnk6IERhbmllbCBSb3NlbmJlcmcgPGRyb3NlbkBnb29nbGUuY29tPgo+
IC0tLQo+ICBmc2NrL2R1bXAuYyB8IDI1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgMSBm
aWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0t
Z2l0IGEvZnNjay9kdW1wLmMgYi9mc2NrL2R1bXAuYwo+IGluZGV4IGY2MGY2ZjkuLjNiZDE3ZTMg
MTAwNjQ0Cj4gLS0tIGEvZnNjay9kdW1wLmMKPiArKysgYi9mc2NrL2R1bXAuYwo+IEBAIC0zNzcs
NyArMzc3LDcgQEAgc3RhdGljIHZvaWQgZHVtcF9ub2RlX2JsayhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIGludCBudHlwZSwKPiAgfQo+Cj4gICNpZmRlZiBIQVZFX0ZTRVRYQVRUUgo+IC1zdGF0
aWMgdm9pZCBkdW1wX3hhdHRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgc3RydWN0IGYyZnNf
bm9kZSAqbm9kZV9ibGspCj4gK3N0YXRpYyB2b2lkIGR1bXBfeGF0dHIoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBzdHJ1Y3QgZjJmc19ub2RlICpub2RlX2JsaywgaW50IGlzX2RpcikKPiAgewo+
ICAgICAgICAgdm9pZCAqeGF0dHI7Cj4gICAgICAgICB2b2lkICpsYXN0X2Jhc2VfYWRkcjsKPiBA
QCAtNDMxLDggKzQzMSwxNCBAQCBzdGF0aWMgdm9pZCBkdW1wX3hhdHRyKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwgc3RydWN0IGYyZnNfbm9kZSAqbm9kZV9ibGspCj4KPiAgICAgICAgICAgICAg
ICAgREJHKDEsICJmZCAlZCB4YXR0cl9uYW1lICVzXG4iLCBjLmR1bXBfZmQsIHhhdHRyX25hbWUp
Owo+ICAjaWYgZGVmaW5lZChfX2xpbnV4X18pCj4gLSAgICAgICAgICAgICAgIHJldCA9IGZzZXR4
YXR0cihjLmR1bXBfZmQsIHhhdHRyX25hbWUsIHZhbHVlLAo+IC0gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGUxNl90b19jcHUoZW50LT5lX3ZhbHVlX3NpemUpLCAwKTsKPiArICAgICAg
ICAgICAgICAgaWYgKGlzX2Rpcikgewo+ICsgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IHNl
dHhhdHRyKCIuIiwgeGF0dHJfbmFtZSwgdmFsdWUsCj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBsZTE2X3RvX2NwdShlbnQtPmVfdmFsdWVf
c2l6ZSksIDApOwo+ICsgICAgICAgICAgICAgICB9IGVsc2Ugewo+ICsgICAgICAgICAgICAgICAg
ICAgICAgIHJldCA9IGZzZXR4YXR0cihjLmR1bXBfZmQsIHhhdHRyX25hbWUsIHZhbHVlLAo+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGUx
Nl90b19jcHUoZW50LT5lX3ZhbHVlX3NpemUpLCAwKTsKPiArICAgICAgICAgICAgICAgfQo+ICsK
PiAgI2VsaWYgZGVmaW5lZChfX0FQUExFX18pCj4gICAgICAgICAgICAgICAgIHJldCA9IGZzZXR4
YXR0cihjLmR1bXBfZmQsIHhhdHRyX25hbWUsIHZhbHVlLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgbGUxNl90b19jcHUoZW50LT5lX3ZhbHVlX3NpemUpLCAwLAo+IEBAIC00NjIs
MTMgKzQ2OCwxNSBAQCBzdGF0aWMgaW50IGR1bXBfaW5vZGVfYmxrKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSwgdTMyIG5pZCwKPiAgICAgICAgIHU2NCBvZnMgPSAwOwo+ICAgICAgICAgdTMyIGFk
ZHJfcGVyX2Jsb2NrOwo+ICAgICAgICAgYm9vbCBpc19kaXIgPSBTX0lTRElSKGxlMTZfdG9fY3B1
KG5vZGVfYmxrLT5pLmlfbW9kZSkpOwo+ICsgICAgICAgaW50IHJldCA9IDA7Cj4KPiAgICAgICAg
IGlmICgobm9kZV9ibGstPmkuaV9pbmxpbmUgJiBGMkZTX0lOTElORV9EQVRBKSkgewo+ICAgICAg
ICAgICAgICAgICBEQkcoMywgImlub1sweCV4XSBoYXMgaW5saW5lIGRhdGEhXG4iLCBuaWQpOwo+
ICAgICAgICAgICAgICAgICAvKiByZWNvdmVyIGZyb20gaW5saW5lIGRhdGEgKi8KPiAgICAgICAg
ICAgICAgICAgZGV2X3dyaXRlX2R1bXAoKCh1bnNpZ25lZCBjaGFyICopbm9kZV9ibGspICsgSU5M
SU5FX0RBVEFfT0ZGU0VULAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDAsIE1BWF9JTkxJTkVfREFUQShub2RlX2JsaykpOwo+IC0gICAgICAgICAgICAg
ICByZXR1cm4gLTE7Cj4gKyAgICAgICAgICAgICAgIHJldCA9IC0xOwo+ICsgICAgICAgICAgICAg
ICBnb3RvIGR1bXBfeGF0dHI7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIGlmICgobm9kZV9ibGst
PmkuaV9pbmxpbmUgJiBGMkZTX0lOTElORV9ERU5UUlkpKSB7Cj4gQEAgLTQ4MCw3ICs0ODgsOCBA
QCBzdGF0aWMgaW50IGR1bXBfaW5vZGVfYmxrKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdTMy
IG5pZCwKPiAgICAgICAgICAgICAgICAgREJHKDMsICJpbm9bMHgleF0gaGFzIGlubGluZSBkZW50
cmllcyFcbiIsIG5pZCk7Cj4gICAgICAgICAgICAgICAgIC8qIHJlY292ZXIgZnJvbSBpbmxpbmUg
ZGVudHJ5ICovCj4gICAgICAgICAgICAgICAgIGR1bXBfZm9sZGVyX2NvbnRlbnRzKHNiaSwgZC5i
aXRtYXAsIGQuZGVudHJ5LCBkLmZpbGVuYW1lLCBkLm1heCk7Cj4gLSAgICAgICAgICAgICAgIHJl
dHVybiAtMTsKPiArICAgICAgICAgICAgICAgcmV0ID0gLTE7Cj4gKyAgICAgICAgICAgICAgIGdv
dG8gZHVtcF94YXR0cjsKPiAgICAgICAgIH0KPgo+ICAgICAgICAgYy5zaG93X2ZpbGVfbWFwX21h
eF9vZmZzZXQgPSBmMmZzX21heF9maWxlX29mZnNldCgmbm9kZV9ibGstPmkpOwo+IEBAIC01MTYs
OSArNTI1LDkgQEAgc3RhdGljIGludCBkdW1wX2lub2RlX2JsayhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmksIHUzMiBuaWQsCj4gICAgICAgICB9Cj4gICAgICAgICAvKiBsYXN0IGJsb2NrIGluIGV4
dGVudCBjYWNoZSAqLwo+ICAgICAgICAgcHJpbnRfZXh0ZW50KHRydWUpOwo+IC0KPiAtICAgICAg
IGR1bXBfeGF0dHIoc2JpLCBub2RlX2Jsayk7Cj4gLSAgICAgICByZXR1cm4gMDsKPiArZHVtcF94
YXR0cjoKPiArICAgICAgIGR1bXBfeGF0dHIoc2JpLCBub2RlX2JsaywgaXNfZGlyKTsKPiArICAg
ICAgIHJldHVybiByZXQ7Cj4gIH0KPgo+ICBzdGF0aWMgdm9pZCBkdW1wX2ZpbGUoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLCBzdHJ1Y3Qgbm9kZV9pbmZvICpuaSwKPiAtLQo+IDIuNDUuMC5yYzEu
MjI1LmcyYTNhZTg3ZTdmLWdvb2cKPgo+CgpSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KClRoYW5rcywKCgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
