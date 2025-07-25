Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65779B11632
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 04:08:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAV2N5sEdhPP8f3ThC+lETQ7N9mzbGM/3bHc+bwRx9A=; b=EMDsvXg2j9Mu3jb5jGlihSfgFP
	jbPG4e1SDn1Mt47NQLlCDC1mPdFBs/HgtpOtWwSE6Eeeovy8lHCeKN0Z6T7spasexW+gSe/4Gtsl/
	Gmdou8QAcnnwQIBvjUVTOSXw9sbXW9cBGOvqy8yIkOP2p07V6yTFILM+XMBf5CqU53u0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf7rU-0000rF-P8;
	Fri, 25 Jul 2025 02:08:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uf7rT-0000r8-3S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:08:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pK5o9pQRebBhzheWP4WfG+NSPgSOp9xy09jqmLtcthI=; b=bSRB4mIA4qqRn276Jgv/9JlAXc
 rujZSr9PqM5alB3soGiNVZaWEP2dVOzkLTQUhlipSh+yRhBv2av4PK904HJ6+3mecumdtjZNuySgO
 EoYK1VMRmoz9IHzmO+pviMVsJBprJaRwBX08JXv8X9HzzG+yu6XAqLmcBdxcphCt4xR8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pK5o9pQRebBhzheWP4WfG+NSPgSOp9xy09jqmLtcthI=; b=IkXVIsZ10Q8Vq3BKar+tyGbu93
 ILAk9Ci1pWfuscQ3UyHkUxd5gpNnkppIpI5kcih7zUF2vzNw9in19DyW+0v01nfLfq0qeLJABMAUp
 h+3l1yNIgFH8zr8frnP1k4YPyqs0svDHrWT/To8brasJ+WrfqlXeTQXjLKJLaK1DQhu4=;
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uf7rS-0008Qf-KN for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:08:39 +0000
Received: by mail-wr1-f46.google.com with SMTP id
 ffacd0b85a97d-3b60565d5f4so29895f8f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Jul 2025 19:08:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753409307; x=1754014107; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pK5o9pQRebBhzheWP4WfG+NSPgSOp9xy09jqmLtcthI=;
 b=VX1d9rJC9Wwej1Em1m/mq95opvkxtFdz4UecTQUv55tX/UvkleB/s0UuRdGxPMEYjS
 agA6U1rqOQCOKJ5rxYH6vrORzkR56e6vtENaitKWL1j+DIwYb2EaIfTjT3ARCtjVtKLv
 FaZaegBved2IuJ+hso9nLfvqXAEhBfT5tpDBHiQ82NZr+yT9zzsQy2qCtKEwt7dsKRJu
 4o6GUKJhrIksq1Nbfb3Pn4LiyqkU660fGM3g8gBJYWLpILejcRlkuhbjse6XGughjAMY
 QhI44+WePci/aLHixjMcfzI6FZ+yNI4+JWda3CH/WF/zQQTRCHQy69+cPoypVBkjlPJ4
 +KHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753409307; x=1754014107;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pK5o9pQRebBhzheWP4WfG+NSPgSOp9xy09jqmLtcthI=;
 b=eisTyF907fhare/x5Zbo/9nT9tG/ce11LL+IL0B8is3wMOLADNnQ20fUR1+5eWKqA2
 nGCPpife3QD8AGOriArmiI6SEFpN7s6+zeYW+I5qjLTB32cz74WAK+N21zHLQYb5DR+a
 miM4xqwtsHI7GcP5BPih8xxkKlv9QkJNDc500UEKYKiZOzqKeL00UwmrTyyvjKEktVJo
 keH+QY+Sp9VO08cpNQBAGl2yPr9TupAUnrjtT7iE40YtemhOpUoKs+ORAlUtpWxiHlFY
 L4hNYdmV621jPmLs4BLSNHRRyGWKMCncp8Tc1bz1/COUJMQVxL9KoBHWN5RIp+GZvnDi
 ifMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8kPaog0ZOr8xptfCk+QkJYBt2XVR0e6/B5TG2mff2+BAtaNS85weZnkgC8V4AieagTm9o1nhWFDeNhgxGTAla@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxvQTvn0g+lbcAIybBv2HmM9ZXHMqr28z8ykqfHIgqXslZHy6X9
 3GIZGFLuWj+qxgRx3zW8/IEfviljsC7oEkAQYSDj/wD5b61J5rRwdfWtPi/BqhoXEFRNm5PrQrI
 JbG7ja77CU5ZiaM6jNKrIng7mcsV7Cv4h6VOW
X-Gm-Gg: ASbGnctEwsAy8iPjjMkVlNqVPKLePM++Olr0h5Hjipml+n64/Jh8SVc4lznO10k2wsS
 sg6s6fa4UOUv85Pzu/aDm3eU0KA3VRxDoSIRyadAujXxISiSKSxl61xrPJpHw5tYZr7yP69eux8
 OsGph0yikaeXUyFfkbMJW9DbrO83PRNbmm3pscKEl9T9izaTKrMgx79gkU09Yd4P5sMCTYDiRHw
 9obHboYMeFviuzu5uA=
X-Google-Smtp-Source: AGHT+IHG7uDLvEiRCJ2vaD/9Nmb2dj6ouqAqkS72b7RKEvQ8QAaUO4+V9YS2QuNrsJpX88M6EzyMwOfBkGQlLrqyZKA=
X-Received: by 2002:a05:6000:178f:b0:3a4:eed9:753a with SMTP id
 ffacd0b85a97d-3b776763515mr47486f8f.13.1753409306721; Thu, 24 Jul 2025
 19:08:26 -0700 (PDT)
MIME-Version: 1.0
References: <20250725005924.3909785-1-chao@kernel.org>
In-Reply-To: <20250725005924.3909785-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 25 Jul 2025 10:08:15 +0800
X-Gm-Features: Ac12FXxwwBH9mu98fAwMpw10zKKDT8tg2aLVKpjstlFGvZmJZDWiSvDcMeyZwCQ
Message-ID: <CAHJ8P3LSv5hYwc6uTAg-LYE8Bwyf8Xp-gme=EKZ0hbx4LKJv=A@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年7月25日周五 09:03写道：
    > > It provides a way to disable linear lookup fallback during mkfs. > >
   Behavior summary: > Android Distro > By default disable [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.221.46 listed in wl.mailspike.net]
X-Headers-End: 1uf7rS-0008Qf-KN
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: support -C [no]hashonly to
 control linear lookup fallback
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ35pyIMjXml6XlkajkupQgMDk6MDPlhpnpgZPvvJoKPgo+
IEl0IHByb3ZpZGVzIGEgd2F5IHRvIGRpc2FibGUgbGluZWFyIGxvb2t1cCBmYWxsYmFjayBkdXJp
bmcgbWtmcy4KPgo+IEJlaGF2aW9yIHN1bW1hcnk6Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
QW5kcm9pZCAgICAgICAgIERpc3Rybwo+IEJ5IGRlZmF1bHQgICAgICAgICAgICAgIGRpc2FibGVk
ICAgICAgICBlbmFibGVkCj4gVHVuZSB3LyBbbm9daGFzaG9ubHkgICAgbm8gICAgICAgICAgICAg
IHllcwo+Cj4gQW5kcm9pZCBjYXNlOgo+Cj4gMS4xKSBEaXNhYmxlIGxpbmVhciBsb29rdXA6Cj4g
bWtmcy5mMmZzIC1mIC1nIGFuZHJvaWQgLU8gY2FzZWZvbGQgLUMgdXRmODpoYXNob25seSAvZGV2
L3ZkYgo+IGR1bXAuZjJmcyAtZDMgL2Rldi92ZGIgfGdyZXAgc19lbmNvZGluZ19mbGFncwo+IHNf
ZW5jb2RpbmdfZmxhZ3MgICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAgMiA6IDJdCj4K
PiAxLjIpIEVuYWJsZSBsaW5lYXIgbG9va3VwOgo+IG1rZnMuZjJmcyAtZiAtZyBhbmRyb2lkIC1P
IGNhc2Vmb2xkIC1DIHV0Zjg6bm9oYXNob25seSAvZGV2L3ZkYgo+IGR1bXAuZjJmcyAtZDMgL2Rl
di92ZGIgfGdyZXAgc19lbmNvZGluZ19mbGFncwo+IHNfZW5jb2RpbmdfZmxhZ3MgICAgICAgICAg
ICAgICAgICAgICAgICBbMHggICAgICAgMiA6IDJdCkhpIENoYW8sClNlZW1zIGxpa2UgYSB0eXBv
IGhlcmU/IHNob3VsZCBiZToKc19lbmNvZGluZ19mbGFncyAgICAgICAgICAgICAgICAgICAgICAg
IFsweCAgICAgICAwIDogMF0gPwp0aGFua3MhCj4KPiAxLjMpIEJ5IGRlZmF1bHQ6Cj4gbWtmcy5m
MmZzIC1mIC1nIGFuZHJvaWQgLU8gY2FzZWZvbGQgLUMgdXRmOCAvZGV2L3ZkYgo+IGR1bXAuZjJm
cyAtZDMgL2Rldi92ZGIgfGdyZXAgc19lbmNvZGluZ19mbGFncwo+IHNfZW5jb2RpbmdfZmxhZ3Mg
ICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAgMiA6IDJdCj4KPiBEaXN0cm8gY2FzZToK
Pgo+IDIuMSkgRGlzYWJsZSBsaW5lYXIgbG9va3VwOgo+IG1rZnMuZjJmcyAtZiAtTyBjYXNlZm9s
ZCAtQyB1dGY4Omhhc2hvbmx5IC9kZXYvdmRiCj4gZHVtcC5mMmZzIC1kMyAvZGV2L3ZkYiB8Z3Jl
cCBzX2VuY29kaW5nX2ZsYWdzCj4gc19lbmNvZGluZ19mbGFncyAgICAgICAgICAgICAgICAgICAg
ICAgIFsweCAgICAgICAyIDogMl0KPgo+IDIuMikgRW5hYmxlIGxpbmVhciBsb29rdXA6Cj4gbWtm
cy5mMmZzIC1mIC1PIGNhc2Vmb2xkIC1DIHV0Zjg6bm9oYXNob25seSAvZGV2L3ZkYgo+IGR1bXAu
ZjJmcyAtZDMgL2Rldi92ZGIgfGdyZXAgc19lbmNvZGluZ19mbGFncwo+IHNfZW5jb2RpbmdfZmxh
Z3MgICAgICAgICAgICAgICAgICAgICAgICBbMHggICAgICAgMCA6IDBdCj4KPiAyLjMpIEJ5IGRl
ZmF1bHQ6Cj4gbWtmcy5mMmZzIC1mIC1PIGNhc2Vmb2xkIC1DIHV0ZjggL2Rldi92ZGIKPiBkdW1w
LmYyZnMgLWQzIC9kZXYvdmRiIHxncmVwIHNfZW5jb2RpbmdfZmxhZ3MKPiBzX2VuY29kaW5nX2Zs
YWdzICAgICAgICAgICAgICAgICAgICAgICAgWzB4ICAgICAgIDAgOiAwXQo+Cj4gU2lnbmVkLW9m
Zi1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+IC0tLQo+IHYyOgo+IC0gZGlzYWJsZSBs
aW5lYXIgbG9va3VwIGJ5IGRlZmF1bHQgZm9yIEFuZHJvaWQgY2FzZQo+ICBpbmNsdWRlL2YyZnNf
ZnMuaCAgICAgICB8ICAzICsrLQo+ICBsaWIvbGliZjJmcy5jICAgICAgICAgICB8ICAxICsKPiAg
bWFuL21rZnMuZjJmcy44ICAgICAgICAgfCAxMCArKysrKysrKy0tCj4gIG1rZnMvZjJmc19mb3Jt
YXQuYyAgICAgIHwgIDMgKysrCj4gIG1rZnMvZjJmc19mb3JtYXRfbWFpbi5jIHwgIDMgKystCj4g
IDUgZmlsZXMgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRp
ZmYgLS1naXQgYS9pbmNsdWRlL2YyZnNfZnMuaCBiL2luY2x1ZGUvZjJmc19mcy5oCj4gaW5kZXgg
ZjcyNjhkMS4uYThkYThmYSAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2YyZnNfZnMuaAo+ICsrKyBi
L2luY2x1ZGUvZjJmc19mcy5oCj4gQEAgLTE0NzgsNyArMTQ3OCw4IEBAIGVudW0gewo+Cj4gIC8q
IGZlYXR1cmUgbGlzdCBpbiBBbmRyb2lkICovCj4gIGVudW0gewo+IC0gICAgICAgRjJGU19GRUFU
VVJFX05BVF9CSVRTID0gMHgwMDAxLAo+ICsgICAgICAgRjJGU19GRUFUVVJFX05BVF9CSVRTICAg
ICAgICAgICA9IDB4MDAwMSwKPiArICAgICAgIEYyRlNfRkVBVFVSRV9MSU5FQVJfTE9PS1VQICAg
ICAgPSAweDAwMDIsCj4gIH07Cj4KPiAgLyogbm9saW5lYXIgbG9va3VwIHR1bmUgKi8KPiBkaWZm
IC0tZ2l0IGEvbGliL2xpYmYyZnMuYyBiL2xpYi9saWJmMmZzLmMKPiBpbmRleCAyZjAxMmM4Li4w
ZTNlNjJhIDEwMDY0NAo+IC0tLSBhL2xpYi9saWJmMmZzLmMKPiArKysgYi9saWIvbGliZjJmcy5j
Cj4gQEAgLTE0MjQsNiArMTQyNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZW5jX2ZsYWdzIHsK
PiAgICAgICAgIGNoYXIgKnBhcmFtOwo+ICB9IGVuY29kaW5nX2ZsYWdzW10gPSB7Cj4gICAgICAg
ICB7IEYyRlNfRU5DX1NUUklDVF9NT0RFX0ZMLCAic3RyaWN0IiB9LAo+ICsgICAgICAgeyBGMkZT
X0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwsICJoYXNob25seSJ9Cj4gIH07Cj4KPiAgLyogUmV0
dXJuIGEgcG9zaXRpdmUgbnVtYmVyIDwgMHhmZiBpbmRpY2F0aW5nIHRoZSBlbmNvZGluZyBtYWdp
YyBudW1iZXIKPiBkaWZmIC0tZ2l0IGEvbWFuL21rZnMuZjJmcy44IGIvbWFuL21rZnMuZjJmcy44
Cj4gaW5kZXggOGIzYjBjYy4uOGNiN2QzMiAxMDA2NDQKPiAtLS0gYS9tYW4vbWtmcy5mMmZzLjgK
PiArKysgYi9tYW4vbWtmcy5mMmZzLjgKPiBAQCAtMjMyLDkgKzIzMiwxNSBAQCBVc2UgVVRGLTgg
Zm9yIGNhc2Vmb2xkaW5nLgo+ICAuSSBmbGFnczoKPiAgLlJTIDEuMmkKPiAgLlRQIDEuMmkKPiAt
LkIgc3RyaWN0Cj4gKy5CIFtub11zdHJpY3QKPiAgVGhpcyBmbGFnIHNwZWNpZmllcyB0aGF0IGlu
dmFsaWQgc3RyaW5ncyBzaG91bGQgYmUgcmVqZWN0ZWQgYnkgdGhlIGZpbGVzeXN0ZW0uCj4gLURl
ZmF1bHQgaXMgZGlzYWJsZWQuCj4gK0ZvciBhbmRyb2lkIGNhc2UsIGl0IHdpbGwgZGlzYWJsZSBs
aW5lYXIgbG9va3VwIGJ5IGRlZmF1bHQuCj4gKy5SRQo+ICsuUlMgMS4yaQo+ICsuVFAgMS4yaQo+
ICsuQiBbbm9daGFzaG9ubHkKPiArVGhpcyBmbGFnIHNwZWNpZmllcyB0aGF0IHRoZXJlIGlzIG5v
IGxpbmVhciBsb29rdXAgZmFsbGJhY2sgZHVyaW5nIGxvb2t1cC4KPiArQnkgZGVmYXVsdCwgbGlu
ZWFyIGxvb2t1cCBmYWxsYmFjayBpcyBlbmFibGVkLgo+ICAuUkUKPiAgLlJFCj4gIC5UUAo+IGRp
ZmYgLS1naXQgYS9ta2ZzL2YyZnNfZm9ybWF0LmMgYi9ta2ZzL2YyZnNfZm9ybWF0LmMKPiBpbmRl
eCAyNjgwYmQzLi5hNDViYmNiIDEwMDY0NAo+IC0tLSBhL21rZnMvZjJmc19mb3JtYXQuYwo+ICsr
KyBiL21rZnMvZjJmc19mb3JtYXQuYwo+IEBAIC02NzEsNiArNjcxLDkgQEAgc3RhdGljIGludCBm
MmZzX3ByZXBhcmVfc3VwZXJfYmxvY2sodm9pZCkKPiAgICAgICAgIG1lbWNweShzYi0+aW5pdF92
ZXJzaW9uLCBjLnZlcnNpb24sIFZFUlNJT05fTEVOKTsKPgo+ICAgICAgICAgaWYgKGMuZmVhdHVy
ZSAmIEYyRlNfRkVBVFVSRV9DQVNFRk9MRCkgewo+ICsgICAgICAgICAgICAgICBpZiAoIShjLnNf
ZW5jb2RpbmdfZmxhZ3MgJiBGMkZTX0VOQ19OT19DT01QQVRfRkFMTEJBQ0tfRkwpICYmCj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgKGMuZGlzYWJsZWRfZmVhdHVyZSAmIEYyRlNfRkVBVFVSRV9M
SU5FQVJfTE9PS1VQKSkKPiArICAgICAgICAgICAgICAgICAgICAgICBjLnNfZW5jb2RpbmdfZmxh
Z3MgfD0gRjJGU19FTkNfTk9fQ09NUEFUX0ZBTExCQUNLX0ZMOwo+ICAgICAgICAgICAgICAgICBz
ZXRfc2Ioc19lbmNvZGluZywgYy5zX2VuY29kaW5nKTsKPiAgICAgICAgICAgICAgICAgc2V0X3Ni
KHNfZW5jb2RpbmdfZmxhZ3MsIGMuc19lbmNvZGluZ19mbGFncyk7Cj4gICAgICAgICB9Cj4gZGlm
ZiAtLWdpdCBhL21rZnMvZjJmc19mb3JtYXRfbWFpbi5jIGIvbWtmcy9mMmZzX2Zvcm1hdF9tYWlu
LmMKPiBpbmRleCBmMGJlYzRmLi44ZjhlOTc1IDEwMDY0NAo+IC0tLSBhL21rZnMvZjJmc19mb3Jt
YXRfbWFpbi5jCj4gKysrIGIvbWtmcy9mMmZzX2Zvcm1hdF9tYWluLmMKPiBAQCAtMTQzLDcgKzE0
Myw4IEBAIHN0YXRpYyB2b2lkIGFkZF9kZWZhdWx0X29wdGlvbnModm9pZCkKPiAgICAgICAgICAg
ICAgICAgZm9yY2Vfb3ZlcndyaXRlID0gMTsKPiAgICAgICAgICAgICAgICAgYy53YW50ZWRfc2Vj
dG9yX3NpemUgPSBGMkZTX0JMS1NJWkU7Cj4gICAgICAgICAgICAgICAgIGMucm9vdF91aWQgPSBj
LnJvb3RfZ2lkID0gMDsKPiAtICAgICAgICAgICAgICAgYy5kaXNhYmxlZF9mZWF0dXJlIHw9IEYy
RlNfRkVBVFVSRV9OQVRfQklUUzsKPiArICAgICAgICAgICAgICAgYy5kaXNhYmxlZF9mZWF0dXJl
IHw9IEYyRlNfRkVBVFVSRV9OQVRfQklUUyB8Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIEYyRlNfRkVBVFVSRV9MSU5FQVJfTE9PS1VQOwo+Cj4gICAgICAgICAgICAg
ICAgIC8qIFJPIGRvZXNuJ3QgbmVlZCBhbnkgb3RoZXIgZmVhdHVyZXMgKi8KPiAgICAgICAgICAg
ICAgICAgaWYgKGMuZmVhdHVyZSAmIEYyRlNfRkVBVFVSRV9STykKPiAtLQo+IDIuNDkuMAo+Cj4K
Pgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGlu
dXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZv
L2xpbnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
