Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C40B589E62D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Apr 2024 01:37:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruL2I-00036o-Ig;
	Tue, 09 Apr 2024 23:37:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ruL2G-00036i-Jw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 23:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ej7IAhzJEokhzRF324REk8GQfnDQfJi0Vj6poCRFTtM=; b=TR7EVFDdNmRl2y60kwZruAIq4D
 g5JB64LTc5N7MQclhQgUWmLYaHcp447/5+iuMx04fZCEHoklw0+f0mfxN5fCpxkdvuZ06TpP+yjt8
 WrMZ8smz85EE+hM+OHOzzoZTzcg0Rw+9XqEWULIgDhARBlEu/ybMw2TGlNAdWeg5Zzg0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ej7IAhzJEokhzRF324REk8GQfnDQfJi0Vj6poCRFTtM=; b=JRp2mRi/xtWsGo1CwCsi0PgVkH
 QQMDKSoK9qdm9h9iR3lT50kxcZiAbzXUYw6pcXqnx/RcPQTf2R0PBx/qjvTDuoyHY4bQITyyngHgz
 otwxvAB3TCye5Bu3CBvi50NHUG9hw+wMkrhqG4BbIFSaMMiBRqOJxqupuUNJvz6mWrlg=;
Received: from mail-vk1-f178.google.com ([209.85.221.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruL2D-00033E-HV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Apr 2024 23:37:52 +0000
Received: by mail-vk1-f178.google.com with SMTP id
 71dfb90a1353d-4dabbf19e1eso1451115e0c.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 09 Apr 2024 16:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712705863; x=1713310663; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ej7IAhzJEokhzRF324REk8GQfnDQfJi0Vj6poCRFTtM=;
 b=DI4QlEgS4AD7bHc77RnlJfJ81xax8CxNrULvhFNLxQRApL9Vn5WoFg3JoF0BDxJQwj
 49IdSwOqGqglrqQ4jpzucTUptia2Mz0r5hdchB//Eztjfue3Z34NTArWBkZZDvpcZIWj
 9LwxfILu++ruqoU9HY1HO+FPHI5GFjwEPX9DyJOFGxbVd3tPBBrPHGzELEn8tGCSUKiZ
 cOlAvk0OhMqdvRC7choY/MQnudY19lRyxVurLbyhiMLUYykDdc19kBZMkDvcO9pr5BsQ
 srNACacYNtCvO7wJdsLKCl45MDw72Z977+5VoaA3oKWlrN2vpP50VKn9wzCo1T3cnrCl
 Vn8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712705863; x=1713310663;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ej7IAhzJEokhzRF324REk8GQfnDQfJi0Vj6poCRFTtM=;
 b=bhzeoK374YyZfGXoDSfAC8/gD2KAK7kXMrJq7235avMbXzUdSzasDiM1imWlAQIRTw
 2eYd5cIh9Bc5yQGALMyQFhlMYAFXo9HJ2jYmq3A7t5I8WL+opJL/V5r9cd46kNgGTeq7
 Bqxb2cE30vCM2yTE417MaicADN2yBQmK1bhtZWszqNdX1SYKYvgK36CBlEBoBb09G2ys
 PxKa4EIsm+QHlPLkwDXjh5ST63Q2VBOkjm6/g5tj144ot0i/Tob/hyA4hwSSY+/Es6N7
 YvWZAuqWZwh6QdxGav0MRjUgy9joIzDudxXsd5oOTxkxPGPf6AMsKnOe99gMOICB6qZ2
 6Haw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWRQfKUcmLVap/YoA4j+JbkVOe/lCte6+07aVPGj2TOqp+TOIZJnm+NyQ2jnKF3FRnYEPCBJ/zVcAfzkdSsLD9DgVO7fZ78BBplxrF1ecWlRpAw9d1N5g==
X-Gm-Message-State: AOJu0YydvpVWrVgkXnmu3dwAWLkjh6bgLt2NseYqT1z0gdOMTAojAqUN
 3rSpI/AM/RPYKmGGKClVD4GWAuMsO1z32AoDEBuwugZ69pcs1/c/CrJe3kFrN0OD7VpN+juqBiG
 6BwLBiJBKBCo5S4KXRgRNbB1W7ME=
X-Google-Smtp-Source: AGHT+IE4uEffG0FRzOKJQoQatN7+eWmWAIWgP57PN5fzyXLwJZNfS82Oj6xv1jA1G5sXcA/Re66rtLrBGRvUKkKDrKw=
X-Received: by 2002:a05:6122:41e:b0:4c8:8d45:5325 with SMTP id
 e30-20020a056122041e00b004c88d455325mr1205875vkd.7.1712705863584; Tue, 09 Apr
 2024 16:37:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240404195254.556896-1-jaegeuk@kernel.org>
 <ZhVqwwCesxWOfbOA@google.com>
In-Reply-To: <ZhVqwwCesxWOfbOA@google.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 9 Apr 2024 16:37:32 -0700
Message-ID: <CACOAw_xrXi_adcBHqBPURv=SP98S92qYyF1o5xtsOJ9yLfT56g@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Apr 9, 2024 at 9:21 AM Jaegeuk Kim wrote: > > Shutdown
    does not check the error of thaw_super due to readonly, which > causes a
   deadlock like below. > > f2fs_ioc_shutdown(F2FS_GOING_DOWN_F [...] 
 
 Content analysis details:   (0.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.221.178 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.178 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
X-Headers-End: 1ruL2D-00033E-HV
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't set RO when shutting down f2fs
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?B?TGlnaHQgSHNpZWggKOisneaYjueHiCk=?= <Light.Hsieh@mediatek.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgOSwgMjAyNCBhdCA5OjIx4oCvQU0gSmFlZ2V1ayBLaW0gPGphZWdldWtAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBTaHV0ZG93biBkb2VzIG5vdCBjaGVjayB0aGUgZXJyb3Igb2Yg
dGhhd19zdXBlciBkdWUgdG8gcmVhZG9ubHksIHdoaWNoCj4gY2F1c2VzIGEgZGVhZGxvY2sgbGlr
ZSBiZWxvdy4KPgo+IGYyZnNfaW9jX3NodXRkb3duKEYyRlNfR09JTkdfRE9XTl9GVUxMU1lOQykg
ICAgICAgIGlzc3VlX2Rpc2NhcmRfdGhyZWFkCj4gIC0gYmRldl9mcmVlemUKPiAgIC0gZnJlZXpl
X3N1cGVyCj4gIC0gZjJmc19zdG9wX2NoZWNrcG9pbnQoKQo+ICAgLSBmMmZzX2hhbmRsZV9jcml0
aWNhbF9lcnJvciAgICAgICAgICAgICAgICAgICAgIC0gc2Jfc3RhcnRfd3JpdGUKPiAgICAgLSBz
ZXQgUk8gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0gd2FpdGluZwo+
ICAtIGJkZXZfdGhhdwo+ICAgLSB0aGF3X3N1cGVyX2xvY2tlZAo+ICAgICAtIHJldHVybiAtRUlO
VkFMLCBpZiBzYl9yZG9ubHkoKQo+ICAtIGYyZnNfc3RvcF9kaXNjYXJkX3RocmVhZAo+ICAgLT4g
d2FpdCBmb3Iga3RocmVhZF9zdG9wKGRpc2NhcmRfdGhyZWFkKTsKPgo+IFJlcG9ydGVkLWJ5OiAi
TGlnaHQgSHNpZWggKOisneaYjueHiCkiIDxMaWdodC5Ic2llaEBtZWRpYXRlay5jb20+Cj4gU2ln
bmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVsLm9yZz4KPiAtLS0KPgo+ICBD
aGFuZ2UgbG9nIGZyb20gdjE6Cj4gICAtIHVzZSBiZXR0ZXIgdmFyaWFibGUKPiAgIC0gZml4IHR5
cG8KPgo+ICBmcy9mMmZzL3N1cGVyLmMgfCAxMCArKysrKysrKy0tCj4gIDEgZmlsZSBjaGFuZ2Vk
LCA4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4gaW5kZXggOGFjNDczNGMyZGY2Li5kZjMyNTcz
ZDFmNjIgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4gKysrIGIvZnMvZjJmcy9zdXBl
ci5jCj4gQEAgLTQxNTksOSArNDE1OSwxNSBAQCB2b2lkIGYyZnNfaGFuZGxlX2NyaXRpY2FsX2Vy
cm9yKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdW5zaWduZWQgY2hhciByZWFzb24sCj4gICAg
ICAgICBpZiAoc2h1dGRvd24pCj4gICAgICAgICAgICAgICAgIHNldF9zYmlfZmxhZyhzYmksIFNC
SV9JU19TSFVURE9XTik7Cj4KPiAtICAgICAgIC8qIGNvbnRpbnVlIGZpbGVzeXN0ZW0gb3BlcmF0
b3JzIGlmIGVycm9ycz1jb250aW51ZSAqLwo+IC0gICAgICAgaWYgKGNvbnRpbnVlX2ZzIHx8IGYy
ZnNfcmVhZG9ubHkoc2IpKQo+ICsgICAgICAgLyoKPiArICAgICAgICAqIENvbnRpbnVlIGZpbGVz
eXN0ZW0gb3BlcmF0b3JzIGlmIGVycm9ycz1jb250aW51ZS4gU2hvdWxkIG5vdCBzZXQKPiArICAg
ICAgICAqIFJPIGJ5IHNodXRkb3duLCBzaW5jZSBSTyBieXBhc3NlcyB0aGF3X3N1cGVyIHdoaWNo
IGNhbiBoYW5nIHRoZQo+ICsgICAgICAgICogc3lzdGVtLgo+ICsgICAgICAgICovCj4gKyAgICAg
ICBpZiAoY29udGludWVfZnMgfHwgZjJmc19yZWFkb25seShzYikgfHwgc2h1dGRvd24pIHsKPiAr
ICAgICAgICAgICAgICAgZjJmc193YXJuKHNiaSwgIlN0b3BwZWQgZmlsZXN5c3RlbSBkdWUgdG8g
cmVhc29uOiAlZCIsIHJlYXNvbik7Cj4gICAgICAgICAgICAgICAgIHJldHVybjsKPiArICAgICAg
IH0KPgo+ICAgICAgICAgZjJmc193YXJuKHNiaSwgIlJlbW91bnRpbmcgZmlsZXN5c3RlbSByZWFk
LW9ubHkiKTsKPiAgICAgICAgIC8qCj4gLS0KPiAyLjQ0LjAuNDc4LmdkOTI2Mzk5ZWY5LWdvb2cK
Pgo+CgpSZXZpZXdlZC1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KCgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
