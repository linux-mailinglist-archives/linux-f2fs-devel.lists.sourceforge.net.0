Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BF2686D14B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Feb 2024 18:59:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfkgY-0003S0-9J;
	Thu, 29 Feb 2024 17:59:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rfkgW-0003Rq-DH
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rzIXC93M4QSZLUGOvxdd7AD7/8w/GqyAU4gK+DPYWBY=; b=idywD1HSZaTCtRTTy5WITW5LMG
 esb92n/nf5RuEuMD1rTscKf4U2b973PqvChGBSmJ3Kvk3sRS/1c/MyANgLyvu6tANHSsUsLKh6Y1l
 xL78cbI9/DsGMehkcAKgkCGuKP0oQ3WtdICVc8xMSRW5uq8Ea7GSeaykRe60MtBz/uNk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rzIXC93M4QSZLUGOvxdd7AD7/8w/GqyAU4gK+DPYWBY=; b=aE/U67UDnqpdmBS+tPNXNrDLxV
 Jn6JGiE+3tIOq9ANj3tgGna04/yzK9oZ/6G9nJLVATSp9wog8zYd+7syYwkJJDaz2F0LrnsxhBn9Q
 EhEpgkBWkvZmVA6aUlMyNxx8TvZS7ra+t2Hi5Wfsv/Hhh0ot/y7+Pqsae3BZDG7NwkFE=;
Received: from mail-ua1-f48.google.com ([209.85.222.48])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rfkgS-0002Zm-V3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Feb 2024 17:59:09 +0000
Received: by mail-ua1-f48.google.com with SMTP id
 a1e0cc1a2514c-7d995bd557eso656828241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Feb 2024 09:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709229534; x=1709834334; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzIXC93M4QSZLUGOvxdd7AD7/8w/GqyAU4gK+DPYWBY=;
 b=nft/LOqPYjkMWce+lKA2K58buI1UcUvCxr+kn83wPro+wpgCMXomuFRfQ6aPAqq6ze
 V+ZSLOE6F4F2lc+UKBDs6Eb6BaBrib59bd5kvMDyS2D9wcjrneZOWSTt1oCwZkXxjHxq
 ASK2ivuEvZ3VIa3hcx4MUn9IyE9iML9AryYzI9+/Z9BbJgeFNBJly6tQZ+/LlHNO2yxe
 fkcuFI4aDN218M1fymRIg2SbPrKcCipJ4RC89L9EOJPRJRhs9l/JEvLz54mfohK5evY4
 51uhQlONgd6ccTe7A5JHroSqabM80tma2cYY78QgRrCylXM6Zui5F4hUaXw3nAo7qqHB
 cuAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709229534; x=1709834334;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzIXC93M4QSZLUGOvxdd7AD7/8w/GqyAU4gK+DPYWBY=;
 b=w6XXOvXkmbcRh3/fB8o5eXH30cnBZUgTLVO98fuGobAZ+NCuUosU9i2hIQxOnbtikV
 Q8PlZOXhtCQ2Jlo+8kO7f2O3aCozp1lfoVCKEpYvHaxe4jmdZxiYwHXozYBH0Q91NicW
 7b2RZ5CQj6IwVGPk9/lwgllOXNvbzj9I406LWwFy2U8urX6spJ7VhO7gAiBmi9mbhxk1
 +HUbEQe5IHUbFLXrFKF+/QN++I0MTfWn2O9+jDyh2LGn4FHjJbP5t9RxjOZiegf+0tVF
 QgMd6xv0vhm0JZz9Xd6kjTUDSwp6f3BP7NGpxeDs11XuhGtcgF2e7WJwiTCTicWTpkwe
 Ax+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCU3OAZ4GdhIwWl1lF7f2mus3Go43dLObjuNBVVRt3iH/HQG/4MtdJyIqGtx281BkucQNVOJmex02ougjjkG7KeILSesn9WnOfeqOxASeclaqh4z7VTOPw==
X-Gm-Message-State: AOJu0YxwQ1luHZgPTCPmXl7xEqzEHbuHnvSx+upmMioIHNgwLAjy36W3
 dgMNhZFTNPt4yw12uSTY9LB+zWW+mY7HpQrGlsgTOz98SBXVXfBsf8Nv2E0wt6OifBSZesAyoDu
 3a00Bl8CjsiO79qIPWSMvTJ8YPAv+UmtPPsA=
X-Google-Smtp-Source: AGHT+IE+bklgMnSPBe75G1/kO6+0yrz8rklNofbjQi5tPjR1OFixJxMWemrObfo7sk5fPyKHmWzuhtlqpJfLdSjovXE=
X-Received: by 2002:a05:6102:3093:b0:472:6e7f:888b with SMTP id
 l19-20020a056102309300b004726e7f888bmr2722097vsb.32.1709229534095; Thu, 29
 Feb 2024 09:58:54 -0800 (PST)
MIME-Version: 1.0
References: <20240226013208.2389246-1-chao@kernel.org>
 <20240226013208.2389246-3-chao@kernel.org>
In-Reply-To: <20240226013208.2389246-3-chao@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 29 Feb 2024 09:58:43 -0800
Message-ID: <CACOAw_xQnfFpvWn18tu-T-m0+P+xxPFxwguG2k8VodvxFd42XA@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Reviewed-by: Daeho Jeong Thanks, On Sun, Feb 25, 2024 at 5:33 PM
    Chao Yu wrote: > > Move f2fs_valid_pinned_area() check logic from new_curseg()
    to > get_new_segment(), it can avoid calling __set_free() if it fails > to
    find free [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.222.48 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.222.48 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rfkgS-0002Zm-V3
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: clean up new_curseg()
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

UmV2aWV3ZWQtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+CgpUaGFua3Ms
CgpPbiBTdW4sIEZlYiAyNSwgMjAyNCBhdCA1OjMz4oCvUE0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwu
b3JnPiB3cm90ZToKPgo+IE1vdmUgZjJmc192YWxpZF9waW5uZWRfYXJlYSgpIGNoZWNrIGxvZ2lj
IGZyb20gbmV3X2N1cnNlZygpIHRvCj4gZ2V0X25ld19zZWdtZW50KCksIGl0IGNhbiBhdm9pZCBj
YWxsaW5nIF9fc2V0X2ZyZWUoKSBpZiBpdCBmYWlscwo+IHRvIGZpbmQgZnJlZSBzZWdtZW50IGlu
IGNvbnZlbnRpb25hbCB6b25lIGZvciBwaW5uZWQgZmlsZS4KPgo+IFNpZ25lZC1vZmYtYnk6IENo
YW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9zZWdtZW50LmMgfCAyMyAr
KysrKysrKysrKysrKy0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5zZXJ0aW9ucygr
KSwgOSBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2Zz
L2YyZnMvc2VnbWVudC5jCj4gaW5kZXggODQ3ZmUwYjdmMjlmLi5jMTU5YjA5ODU1OTYgMTAwNjQ0
Cj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50LmMKPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+IEBA
IC0yNzE1LDEyICsyNzE1LDE5IEBAIHN0YXRpYyBpbnQgZ2V0X25ld19zZWdtZW50KHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKPiAgZ290X2l0Ogo+ICAgICAgICAgLyogc2V0IGl0IGFzIGRpcnR5
IHNlZ21lbnQgaW4gZnJlZSBzZWdtYXAgKi8KPiAgICAgICAgIGYyZnNfYnVnX29uKHNiaSwgdGVz
dF9iaXQoc2Vnbm8sIGZyZWVfaS0+ZnJlZV9zZWdtYXApKTsKPiArCj4gKyAgICAgICAvKiBubyBm
cmVlIHNlY3Rpb24gaW4gY29udmVudGlvbmFsIHpvbmUgKi8KPiArICAgICAgIGlmIChuZXdfc2Vj
ICYmIHBpbm5pbmcgJiYKPiArICAgICAgICAgICAgICAgIWYyZnNfdmFsaWRfcGlubmVkX2FyZWEo
c2JpLCBTVEFSVF9CTE9DSyhzYmksIHNlZ25vKSkpIHsKPiArICAgICAgICAgICAgICAgcmV0ID0g
LUVBR0FJTjsKPiArICAgICAgICAgICAgICAgZ290byBvdXRfdW5sb2NrOwo+ICsgICAgICAgfQo+
ICAgICAgICAgX19zZXRfaW51c2Uoc2JpLCBzZWdubyk7Cj4gICAgICAgICAqbmV3c2VnID0gc2Vn
bm87Cj4gIG91dF91bmxvY2s6Cj4gICAgICAgICBzcGluX3VubG9jaygmZnJlZV9pLT5zZWdtYXBf
bG9jayk7Cj4KPiAtICAgICAgIGlmIChyZXQpIHsKPiArICAgICAgIGlmIChyZXQgPT0gLUVOT1NQ
Qykgewo+ICAgICAgICAgICAgICAgICBmMmZzX3N0b3BfY2hlY2twb2ludChzYmksIGZhbHNlLCBT
VE9QX0NQX1JFQVNPTl9OT19TRUdNRU5UKTsKPiAgICAgICAgICAgICAgICAgZjJmc19idWdfb24o
c2JpLCAxKTsKPiAgICAgICAgIH0KPiBAQCAtMjc5NiwxOSArMjgwMywxNyBAQCBzdGF0aWMgaW50
IG5ld19jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlwZSwgYm9vbCBuZXdf
c2VjKQo+ICAgICAgICAgc3RydWN0IGN1cnNlZ19pbmZvICpjdXJzZWcgPSBDVVJTRUdfSShzYmks
IHR5cGUpOwo+ICAgICAgICAgdW5zaWduZWQgaW50IHNlZ25vID0gY3Vyc2VnLT5zZWdubzsKPiAg
ICAgICAgIGJvb2wgcGlubmluZyA9IHR5cGUgPT0gQ1VSU0VHX0NPTERfREFUQV9QSU5ORUQ7Cj4g
KyAgICAgICBpbnQgcmV0Owo+Cj4gICAgICAgICBpZiAoY3Vyc2VnLT5pbml0ZWQpCj4gICAgICAg
ICAgICAgICAgIHdyaXRlX3N1bV9wYWdlKHNiaSwgY3Vyc2VnLT5zdW1fYmxrLCBHRVRfU1VNX0JM
T0NLKHNiaSwgc2Vnbm8pKTsKPgo+ICAgICAgICAgc2Vnbm8gPSBfX2dldF9uZXh0X3NlZ25vKHNi
aSwgdHlwZSk7Cj4gLSAgICAgICBpZiAoZ2V0X25ld19zZWdtZW50KHNiaSwgJnNlZ25vLCBuZXdf
c2VjLCBwaW5uaW5nKSkgewo+IC0gICAgICAgICAgICAgICBjdXJzZWctPnNlZ25vID0gTlVMTF9T
RUdOTzsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1FTk9TUEM7Cj4gLSAgICAgICB9Cj4gLSAg
ICAgICBpZiAobmV3X3NlYyAmJiBwaW5uaW5nICYmCj4gLSAgICAgICAgICAgIWYyZnNfdmFsaWRf
cGlubmVkX2FyZWEoc2JpLCBTVEFSVF9CTE9DSyhzYmksIHNlZ25vKSkpIHsKPiAtICAgICAgICAg
ICAgICAgX19zZXRfZnJlZShzYmksIHNlZ25vKTsKPiAtICAgICAgICAgICAgICAgcmV0dXJuIC1F
QUdBSU47Cj4gKyAgICAgICByZXQgPSBnZXRfbmV3X3NlZ21lbnQoc2JpLCAmc2Vnbm8sIG5ld19z
ZWMsIHBpbm5pbmcpOwo+ICsgICAgICAgaWYgKHJldCkgewo+ICsgICAgICAgICAgICAgICBpZiAo
cmV0ID09IC1FTk9TUEMpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgY3Vyc2VnLT5zZWdubyA9
IE5VTExfU0VHTk87Cj4gKyAgICAgICAgICAgICAgIHJldHVybiByZXQ7Cj4gICAgICAgICB9Cj4K
PiAgICAgICAgIGN1cnNlZy0+bmV4dF9zZWdubyA9IHNlZ25vOwo+IC0tCj4gMi40MC4xCj4KPgo+
Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
