Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1BB85B252
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 06:35:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcImL-0005Oz-7d;
	Tue, 20 Feb 2024 05:34:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1rcImJ-0005Ot-HX
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 05:34:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NoWmb9bttNW0nof/0Sb31QT+U+oz83qpMX0kXDyv0do=; b=beOlG1A6CO5a8n4t19zhxaIHXT
 hoM3OvC5ASZgxQdZw/poKeWVpXSm1dOtGQa0SKdIZ1nHaLUlXVSjmUew2yLX2968AAU7Pgd/sqJ9v
 PFj2U02qJ3inbm5GihXekXAxeqFednbLukROHJqGU7a3wAxkUPpnkauTlyECkPXtvTGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NoWmb9bttNW0nof/0Sb31QT+U+oz83qpMX0kXDyv0do=; b=DMlvqvs8JmLWfFJXWO0PHnRb+j
 G1V30ObvYfNC+ZkguOaFBG8WCgqtIAk0cjO4s0yl9HFxt7FETdQay7GEz7kwzCJDiAHdpvGwdCrwx
 +8g9UIBx/quYXW6QwA+zvIzQYtTUda5FqvrZW/VdeJj6svt/PVAcj5S5zx0jdsYwgsHs=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rcImH-00042m-JJ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 05:34:51 +0000
Received: by mail-ed1-f41.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so6790011a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Feb 2024 21:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708407284; x=1709012084; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NoWmb9bttNW0nof/0Sb31QT+U+oz83qpMX0kXDyv0do=;
 b=PQycIQcQxL06zhFyAePmx088XZBvt9Y1jCzWjCswMzk0v55lrNa+xNLPAx2S+PYJZs
 OMtin2Vqj6U5SX9QqbZA53TJLsYFA4tWzkHAbGjOiu732T2ED9QBdAN2zNRz8lbxUiCR
 vHpjhdVXYVc8te9YUtHwhI1CqdApsYi33TAZ3lCEHYkBUFKDo8vdV/Cb0vmxEKfdGrCm
 n0VlBcp/6F5DSnmJGlBVoBM3If4DuaN4QGpn0ayTE228phfCYXsw6Q6FtYNE+9eL+fXx
 P+xau5hqwLGariluBEJ+nI+Zs7u8XS7HIMl30yL5K1XofzD0XNNi8qqLrSIzk/+pynHU
 9cSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708407284; x=1709012084;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NoWmb9bttNW0nof/0Sb31QT+U+oz83qpMX0kXDyv0do=;
 b=FTf8mtkQ6fKF1N0KnZKUaZhe6r+LDBv7MMFNB+XgOJH5j2Fwxdt9vLUh1pw3q7DO5d
 T1bvVwd6RNUWEPZqYSj7Vc59ozX/JnJmF98NNnCwj7f6NfF8jezlIAJArGxHkhbcPdYZ
 ZygA9VQ7XFXvEbs/7ExjPxLgc0YhzFnYiKShTnM5xvGGvpBF1EbhZK5pTgfVZjwvhjlH
 /MbRiaOu/Aw20qpR5FLnNHcnfVPSkEVU8hY/p57MJlalSnn3lZjCTv8oWZucgc5QDkkX
 uCq33tjk0ycsRFBfL2q/6HqsP4n2zcqnAwr99qMTKjaMkD3cWpx+A0cWji4ELPS0e4aY
 nNFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKIhdNwZptUQNzf+L9sm/+hBC8yF71BMYyKZ9NRDYNSPmD7CIs4ad3xOWEj6GHffvORhNUNRP5X4oBa0R1oVlai6PMKHcnf6ovFfUYNjcm1zixZtJkPA==
X-Gm-Message-State: AOJu0YwSuH7Bf8SoSN6qC0B2FxuSTRjaLMOx3EI4n+JoqkZb+xKBVT8e
 0TeumI8v3AycstcHV0pRWqXGDkFRXIedfv7Pmlbgr5RlkzZyKZF1SA6/GBY5vBU82MjmI55p7QT
 v5C4twcdd50TFUB1zC964grtyjsE=
X-Google-Smtp-Source: AGHT+IGdrCHsE18s3ly+kaKcQ2Z4iB0NPd0IprBDTBeUn6RlIZDknxVmEcWfHgRnDLlbI2mf9FtXEF4ylJu+CSAmebE=
X-Received: by 2002:a05:6402:34f:b0:564:66d3:530f with SMTP id
 r15-20020a056402034f00b0056466d3530fmr3281939edw.28.1708407284152; Mon, 19
 Feb 2024 21:34:44 -0800 (PST)
MIME-Version: 1.0
References: <1707103845-17220-1-git-send-email-zhiguo.niu@unisoc.com>
 <e2680238-9e9c-422a-adf3-bcee71dfe0a8@kernel.org>
 <ZcGoWAsl08d5-U0g@google.com>
 <6f01fe1b-d580-4a2a-adc5-7eb3baebeb7a@kernel.org>
 <CAHJ8P3J6CrYeBHUHmk4rQXRr=V0jHkLWOKHjdC+xuLgb4a+NQQ@mail.gmail.com>
 <17c9e85a-54b6-4e1c-b95f-262c771b0f1d@kernel.org>
 <4bcf0a1c-b21d-4735-bf57-b78439a65df5@kernel.org>
In-Reply-To: <4bcf0a1c-b21d-4735-bf57-b78439a65df5@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Tue, 20 Feb 2024 13:34:32 +0800
Message-ID: <CAHJ8P3+25FxdpqWNW53yyiLLG8J7LnMAeYr_DV3ARF9-3LCUUg@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Feb 20, 2024 at 10:36 AM Chao Yu wrote: > > On 2024/2/19
    22:36, Chao Yu wrote: > >>>> Please think about how to optimize this, which
    is really ugly now > --- > fs/f2fs/checkpoint.c | 12 ++ [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.208.41 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [niuzhiguo84[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [niuzhiguo84[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.208.41 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rcImH-00042m-JJ
Subject: Re: [f2fs-dev] [PATCH v7] f2fs: unify the error handling of
 f2fs_is_valid_blkaddr
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
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hongyu.jin@unisoc.com,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBGZWIgMjAsIDIwMjQgYXQgMTA6MzbigK9BTSBDaGFvIFl1IDxjaGFvQGtlcm5lbC5v
cmc+IHdyb3RlOgo+Cj4gT24gMjAyNC8yLzE5IDIyOjM2LCBDaGFvIFl1IHdyb3RlOgo+ID4+Pj4g
UGxlYXNlIHRoaW5rIGFib3V0IGhvdyB0byBvcHRpbWl6ZSB0aGlzLCB3aGljaCBpcyByZWFsbHkg
dWdseSBub3cKPiAtLS0KPiAgIGZzL2YyZnMvY2hlY2twb2ludC5jIHwgMTIgKysrKysrKystLS0t
Cj4gICAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQo+Cj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY2hlY2twb2ludC5jIGIvZnMvZjJmcy9jaGVja3BvaW50LmMK
PiBpbmRleCA4N2I3Yzk4OGM4Y2EuLjA4OWMyNmI4MGJlMyAxMDA2NDQKPiAtLS0gYS9mcy9mMmZz
L2NoZWNrcG9pbnQuYwo+ICsrKyBiL2ZzL2YyZnMvY2hlY2twb2ludC5jCj4gQEAgLTEzNSw3ICsx
MzUsNyBAQCBzdHJ1Y3QgcGFnZSAqZjJmc19nZXRfdG1wX3BhZ2Uoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBwZ29mZl90IGluZGV4KQo+ICAgfQo+Cj4gICBzdGF0aWMgYm9vbCBfX2lzX2JpdG1h
cF92YWxpZChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3QgYmxrYWRkciwKPiAtICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGludCB0
eXBlKQo+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGlu
dCB0eXBlLCBib29sICpyZWNvcmRfZXJyb3IpCj4gICB7Cj4gICAgICAgICBzdHJ1Y3Qgc2VnX2Vu
dHJ5ICpzZTsKPiAgICAgICAgIHVuc2lnbmVkIGludCBzZWdubywgb2Zmc2V0Owo+IEBAIC0xNjAs
NiArMTYwLDcgQEAgc3RhdGljIGJvb2wgX19pc19iaXRtYXBfdmFsaWQoc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBibG9ja190IGJsa2FkZHIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgIGJs
a2FkZHIsIGV4aXN0KTsKPiAgICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX05F
RURfRlNDSyk7Cj4gICAgICAgICAgICAgICAgIGR1bXBfc3RhY2soKTsKPiArICAgICAgICAgICAg
ICAgKnJlY29yZF9lcnJvciA9IHRydWU7Cj4gICAgICAgICB9Cj4KPiAgICAgICAgIHJldHVybiBl
eGlzdDsKPiBAQCAtMjA5LDEwICsyMTAsMTMgQEAgc3RhdGljIGJvb2wgX19mMmZzX2lzX3ZhbGlk
X2Jsa2FkZHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIGR1bXBfc3RhY2soKTsKPiAgICAgICAgICAgICAgICAgICAgICAgICBnb3RvIGVycjsKPiAg
ICAgICAgICAgICAgICAgfSBlbHNlIHsKPiAtICAgICAgICAgICAgICAgICAgICAgICB2YWxpZCA9
IF9faXNfYml0bWFwX3ZhbGlkKHNiaSwgYmxrYWRkciwgdHlwZSk7Cj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgaWYgKCghdmFsaWQgJiYgdHlwZSAhPSBEQVRBX0dFTkVSSUNfRU5IQU5DRV9VUERB
VEUpIHx8Cj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAodmFsaWQgJiYgdHlwZSA9
PSBEQVRBX0dFTkVSSUNfRU5IQU5DRV9VUERBVEUpKQo+ICsgICAgICAgICAgICAgICAgICAgICAg
IGJvb2wgcmVjb3JkX2Vycm9yID0gZmFsc2U7Cj4gKwo+ICsgICAgICAgICAgICAgICAgICAgICAg
IHZhbGlkID0gX19pc19iaXRtYXBfdmFsaWQoc2JpLCBibGthZGRyLCB0eXBlLAo+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgJnJlY29yZF9l
cnJvcik7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgaWYgKCF2YWxpZCB8fCByZWNvcmRfZXJy
b3IpCmlmICAgdHlwZSA9PSBEQVRBX0dFTkVSSUNfRU5IQU5DRV9VUERBVEUgJiYgYml0bWFwIGNo
ZWNrIGludmFsaWQsICBpdAppcyBhIE9LIGNhc2UsIGJ1dCAhdmFsaWQKd2lsbCBnb3RvIGRvIGVy
cm9yIGhhbmRsaW5nLgpJIHRoaW5rIGRvIGYyZnNfaGFuZGxlX2Vycm9yIGluIF9faXNfYml0bWFw
X3ZhbGlkIGlzIGEgZ29vZCB3YXkuCgo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Z290byBlcnI7Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHZhbGlkOwo+ICAgICAg
ICAgICAgICAgICB9Cj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSBNRVRB
X0dFTkVSSUM6Cj4gLS0KPiAyLjQwLjEKPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
