Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF8BACE7B7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Jun 2025 03:16:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=utBljwfjRDsbxYN8w2yAMSiYL0AC3MntblyY0Wtqeug=; b=jZqBHwVd0NtZv+gOJM/8xOq44M
	HdiRI9gxkpmETFkGj/aJgFX/RRaT1O1b4CkwrJZX7af6JsZg453m8UMj2xr2h2j2BtzEnSfS4c5TA
	7IcgJVxxp0fKm15q+SYkna2Rm9JI9kUbXKKidhEOoYfFGBwIv4XrhGCTAsNZrKrKFkS8=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMzD0-00063m-V3;
	Thu, 05 Jun 2025 01:15:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1uMzCy-00063e-Jv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 01:15:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ydty2cgBT4AE+PnyHm2b8qgI6YmYVnlOGYpbNpC1b90=; b=Ijr4Qsx24bGWNI4qah2JN1Iopi
 ciukBpBg2hnthmHUBUsS8E/QuXbsX/KgO4cGajPdl8RuCbqC6pqgAo5te7BVnqJ46DLrMcwTH1DNL
 iijXVTogbr41C0uXRbSPpC5/rKyNhuNhqwOIywsrJq+0iCJQ/B8kdzeIrDHF4N2Z98x0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ydty2cgBT4AE+PnyHm2b8qgI6YmYVnlOGYpbNpC1b90=; b=BDWSZUO/B1eJhjGh8YDNVC7Bcl
 zyf4/VZSHY5tvkHB1vK4iLU4Q6H7iO4WLEX0Wii3fVmnjUDMjXst9BqGhr7gDThmvDaZwmZBxzP/T
 8pOHHxRUKam7xJXIsGC4HyaC5VZ0EmxnGp1zdnhaqyTRnf0utX8sxWtXEtNPLIK9a5vA=;
Received: from mail-wm1-f41.google.com ([209.85.128.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uMzCy-0001yC-39 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Jun 2025 01:15:52 +0000
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-450d61cc409so474145e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Jun 2025 18:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749086140; x=1749690940; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ydty2cgBT4AE+PnyHm2b8qgI6YmYVnlOGYpbNpC1b90=;
 b=iC8lq6tJVL4GTy4KCMfEELV8tQo7K2CMDHEvx4z5uU/AEI9GF83nQk3sHr54JbjDCj
 s3icXMWq9YguvWAuMqvIJwO3PsLeIuxHYsQOqd4U8ndYa1ld7AQJChJaHQfH87zEcciI
 kXmHeoA8IkauCRZg8Oe4R1bW7UtG70cBnEjaOjT0CS9Bos7ZD0Jbz2Pb846OzM1rD+YQ
 Pv9tF60WdWZFD+en2++dPHj1qRl8T+1y2BaadHKh6vymM6iz8u0O8KgJLIlTid2xnyWK
 FCLmM8hw0CN26mVq8tz7g/+q3CDWcypzecTozZTlOF+pDSzMlatELC8W+QRGk4vLpwlh
 DaxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749086140; x=1749690940;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ydty2cgBT4AE+PnyHm2b8qgI6YmYVnlOGYpbNpC1b90=;
 b=XjPhPGvI0ges4ITXoEHjYZMoFFmJss/nNrzdG0z5nBJTEtbqwxvBkfjsqPLIG0Ia/X
 FfZs1Ajn0b6R13aQMBluwzz1Q8lB+Fe48JEAH7u2UFd21WbjylwWQi+bFWvd4H16aWtk
 6mWRUzPTJEVMQmIFyGSskDAqeaDI9YvLw53JJxe8SI/JH07yw3xZNjFfPxByGxk9saUJ
 bD3VedQMHsd7uVKLM9jrq8PZv9KlYTUBVKk246sSqsE9Kt444Mt4L8or4/MPTQFuyUWT
 ILE3EF2REIuWIQzjmefZ5IV35qap2PcnjLhuU3n0tJ3Ww6xSp8jHJ7d4aLoadGFG8uLZ
 HjOA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIsHkUnst3IlHthbfl7GUHPqeaQoyojAH934Q+e0xxnOoTF0UTZFjxQjSu0GeEhTco8ukZoL/hH87ACqViJTES@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw9KaFV5ro4fwPFu73TTmb7wvSrWjA1OmN0UkkmYb8mH2NwPzWY
 mevLRjnSbg77B2YCQVlWpie9tR9EPQZzeDP0ldnxfDPATNkLiBeRXZr8mzCmCpQwHX2JhVXm5tK
 dg1yQexg1vt2sqwUvOYD6OxNmQN/VrGw=
X-Gm-Gg: ASbGncuYHEIR8pOwhQIkrE5+OR4fmY939NiwBbVogR3JvjFoV2e9s0jaC0SvyFzdA6N
 sVrxrBZrH/b5cY0Z5g2F2L2Fa4mppBS2jBdt7g0z2D0sSHAMt6Xf6p4AMgM3vW2FybwK2H7Kien
 O1plOOVFmQUGdocqvRsHAI+rYcz0cKgqSbmA==
X-Google-Smtp-Source: AGHT+IFOv3cxIGhg6XydehDxtKJHQb0TYHVmegO4c/fhHhapPb0fBZJ0JyDbC9mtlVtiDtD9Aa2MNoxVJIGq7SFc/r8=
X-Received: by 2002:a05:600c:8b23:b0:450:d5ed:3c20 with SMTP id
 5b1f17b1804b1-451f0b33452mr16474005e9.6.1749086140318; Wed, 04 Jun 2025
 18:15:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250604085700.2454694-1-chao@kernel.org>
In-Reply-To: <20250604085700.2454694-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Thu, 5 Jun 2025 09:15:29 +0800
X-Gm-Features: AX0GCFunATjmE-Apl3YtLj-4r7yYwysLxV6JvJRBuEX71CccePVVeXbo7AjYETA
Message-ID: <CAHJ8P3JXJfX=YVKGuQzM6n+yRbAh6Kxem+dLqdP_3F_BN=b_+Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年6月4日周三 17:01写道：
    > > fstest reports a f2fs bug: > > generic/363 42s ... [failed, exit status
    1]- output mismatch (see /share/git/fstests/results// [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.41 listed in wl.mailspike.net]
X-Headers-End: 1uMzCy-0001yC-39
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to zero post-eof page
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQ25pyINOaXpeWRqOS4iSAxNzowMeWGmemBk++8mgo+Cj4g
ZnN0ZXN0IHJlcG9ydHMgYSBmMmZzIGJ1ZzoKPgo+IGdlbmVyaWMvMzYzIDQycyAuLi4gW2ZhaWxl
ZCwgZXhpdCBzdGF0dXMgMV0tIG91dHB1dCBtaXNtYXRjaCAoc2VlIC9zaGFyZS9naXQvZnN0ZXN0
cy9yZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkKQo+ICAgICAtLS0gdGVzdHMvZ2VuZXJpYy8z
NjMub3V0ICAgMjAyNS0wMS0xMiAyMTo1Nzo0MC4yNzE0NDA1NDIgKzA4MDAKPiAgICAgKysrIC9z
aGFyZS9naXQvZnN0ZXN0cy9yZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkIDIwMjUtMDUtMTkg
MTk6NTU6NTguMDAwMDAwMDAwICswODAwCj4gICAgIEBAIC0xLDIgKzEsNzggQEAKPiAgICAgIFFB
IG91dHB1dCBjcmVhdGVkIGJ5IDM2Mwo+ICAgICAgZnN4IC1xIC1TIDAgLWUgMSAtTiAxMDAwMDAK
PiAgICAgK1JFQUQgQkFEIERBVEE6IG9mZnNldCA9IDB4ZDZmYiwgc2l6ZSA9IDB4ZjA0NCwgZm5h
bWUgPSAvbW50L2YyZnMvanVuawo+ICAgICArT0ZGU0VUICAgICAgR09PRCAgICBCQUQgICAgIFJB
TkdFCj4gICAgICsweDE1NDBkICAgICAweDAwMDAgIDB4MmEyNSAgMHgwCj4gICAgICtvcGVyYXRp
b24jIChtb2QgMjU2KSBmb3IgdGhlIGJhZCBkYXRhIG1heSBiZSAzNwo+ICAgICArMHgxNTQwZSAg
ICAgMHgwMDAwICAweDI1MjcgIDB4MQo+ICAgICAuLi4KPiAgICAgKFJ1biAnZGlmZiAtdSAvc2hh
cmUvZ2l0L2ZzdGVzdHMvdGVzdHMvZ2VuZXJpYy8zNjMub3V0IC9zaGFyZS9naXQvZnN0ZXN0cy9y
ZXN1bHRzLy9nZW5lcmljLzM2My5vdXQuYmFkJyAgdG8gc2VlIHRoZSBlbnRpcmUgZGlmZikKPiBS
YW46IGdlbmVyaWMvMzYzCj4gRmFpbHVyZXM6IGdlbmVyaWMvMzYzCj4gRmFpbGVkIDEgb2YgMSB0
ZXN0cwo+Cj4gVGhlIHJvb3QgY2F1c2UgaXMgdXNlciBjYW4gdXBkYXRlIHBvc3QtZW9mIHBhZ2Ug
dmlhIG1tYXAsIGhvd2V2ZXIsIGYyZnMgbWlzc2VkCj4gdG8gemVybyBwb3N0LWVvZiBwYWdlIGlu
IGJlbG93IG9wZXJhdGlvbnMsIHNvLCBvbmNlIGl0IGV4cGFuZHMgaV9zaXplLCB0aGVuIGl0Cj4g
d2lsbCBpbmNsdWRlIGR1bW15IGRhdGEgbG9jYXRlcyBwcmV2aW91cyBwb3N0LWVvZiBwYWdlLCBz
byBkdXJpbmcgYmVsb3cKPiBvcGVyYXRpb25zLCB3ZSBuZWVkIHRvIHplcm8gcG9zdC1lb2YgcGFn
ZS4KPgo+IE9wZXJhdGlvbnMgd2hpY2ggY2FuIGluY2x1ZGUgZHVtbXkgZGF0YSBhZnRlciBwcmV2
aW91cyBpX3NpemUgYWZ0ZXIgZXhwYW5kaW5nCj4gaV9zaXplOgo+IC0gd3JpdGUKPiAtIG1hcHdy
aXRlCj4gLSB0cnVuY2F0ZQo+IC0gZmFsbG9jYXRlCj4gICogcHJlYWxsb2NhdGUKPiAgKiB6ZXJv
X3JhbmdlCj4gICogaW5zZXJ0X3JhbmdlCj4gICogY29sbGFwc2VfcmFuZ2UKPiAtIGNsb25lX3Jh
bmdlIChkb2VzbuKAmXQgc3VwcG9ydCBpbiBmMmZzKQo+IC0gY29weV9yYW5nZSAoZG9lc27igJl0
IHN1cHBvcnQgaW4gZjJmcykKPgo+IENjOiBzdGFibGVAa2VybmVsLm9yZwo+IFNpZ25lZC1vZmYt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPiAtLS0KPiB2MjoKPiAtIGNvdmVyIGYyZnNf
emVyb19wb3N0X2VvZl9wYWdlIHcvIGludmFsaWRhdGVfbG9jawo+ICBmcy9mMmZzL2ZpbGUuYyB8
IDM4ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAzOCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9m
cy9mMmZzL2ZpbGUuYwo+IGluZGV4IDZiZDNkZTY0ZjJhOC4uZWU1ZTY2MmQyYTRjIDEwMDY0NAo+
IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiBAQCAtMzUsNiAr
MzUsMTcgQEAKPiAgI2luY2x1ZGUgPHRyYWNlL2V2ZW50cy9mMmZzLmg+Cj4gICNpbmNsdWRlIDx1
YXBpL2xpbnV4L2YyZnMuaD4KPgo+ICtzdGF0aWMgdm9pZCBmMmZzX3plcm9fcG9zdF9lb2ZfcGFn
ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3QgbmV3X3NpemUpCj4gK3sKPiArICAgICAgIGxv
ZmZfdCBvbGRfc2l6ZSA9IGlfc2l6ZV9yZWFkKGlub2RlKTsKPiArCj4gKyAgICAgICBpZiAob2xk
X3NpemUgPiBuZXdfc2l6ZSkKSGkgQ2hhbywKc2hvdWxkIGl0IGJlIG9sZF9zaXplID49IG5ld19z
aXplPwoKPiArICAgICAgICAgICAgICAgcmV0dXJuOwo+ICsKPiArICAgICAgIC8qIHplcm8gb3Ig
ZHJvcCBwYWdlcyBvbmx5IGluIHJhbmdlIG9mIFtvbGRfc2l6ZSwgbmV3X3NpemVdICovCj4gKyAg
ICAgICB0cnVuY2F0ZV9wYWdlY2FjaGUoaW5vZGUsIG9sZF9zaXplKTsKPiArfQo+ICsKPiAgc3Rh
dGljIHZtX2ZhdWx0X3QgZjJmc19maWxlbWFwX2ZhdWx0KHN0cnVjdCB2bV9mYXVsdCAqdm1mKQo+
ICB7Cj4gICAgICAgICBzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZV9pbm9kZSh2bWYtPnZtYS0+
dm1fZmlsZSk7Cj4gQEAgLTEwMyw4ICsxMTQsMTMgQEAgc3RhdGljIHZtX2ZhdWx0X3QgZjJmc192
bV9wYWdlX21rd3JpdGUoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4KPiAgICAgICAgIGYyZnNfYnVn
X29uKHNiaSwgZjJmc19oYXNfaW5saW5lX2RhdGEoaW5vZGUpKTsKPgo+ICsgICAgICAgZmlsZW1h
cF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4gKyAgICAgICBmMmZzX3plcm9f
cG9zdF9lb2ZfcGFnZShpbm9kZSwgKGZvbGlvLT5pbmRleCArIDEpIDw8IFBBR0VfU0hJRlQpOwo+
ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhpbm9kZS0+aV9tYXBwaW5nKTsKPiAr
Cj4gICAgICAgICBmaWxlX3VwZGF0ZV90aW1lKHZtZi0+dm1hLT52bV9maWxlKTsKPiAgICAgICAg
IGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrX3NoYXJlZChpbm9kZS0+aV9tYXBwaW5nKTsKPiArCj4g
ICAgICAgICBmb2xpb19sb2NrKGZvbGlvKTsKPiAgICAgICAgIGlmICh1bmxpa2VseShmb2xpby0+
bWFwcGluZyAhPSBpbm9kZS0+aV9tYXBwaW5nIHx8Cj4gICAgICAgICAgICAgICAgICAgICAgICAg
Zm9saW9fcG9zKGZvbGlvKSA+IGlfc2l6ZV9yZWFkKGlub2RlKSB8fAo+IEBAIC0xMTA5LDYgKzEx
MjUsOCBAQCBpbnQgZjJmc19zZXRhdHRyKHN0cnVjdCBtbnRfaWRtYXAgKmlkbWFwLCBzdHJ1Y3Qg
ZGVudHJ5ICpkZW50cnksCj4gICAgICAgICAgICAgICAgIGYyZnNfZG93bl93cml0ZSgmZmktPmlf
Z2NfcndzZW1bV1JJVEVdKTsKPiAgICAgICAgICAgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xv
Y2soaW5vZGUtPmlfbWFwcGluZyk7Cj4KPiArICAgICAgICAgICAgICAgaWYgKGF0dHItPmlhX3Np
emUgPiBvbGRfc2l6ZSkKPiArICAgICAgICAgICAgICAgICAgICAgICBmMmZzX3plcm9fcG9zdF9l
b2ZfcGFnZShpbm9kZSwgb2xkX3NpemUpOwpJJ20gYSBsaXR0bGUgc3VzcGljaW91cyBhYm91dCB0
aGUgbG9naWMgaGVyZe+8jCBoZXJlIG9sZF9zaXplIGlzIGZyb20KaV9zaXplX3JlYWQoaW5vZGUp
LAphbmQgaXQgd2lsbCBjb21wYXJlIHdpdGggdGhlICJvbGRfc2l6ZSIgaW4gZjJmc196ZXJvX3Bv
c3RfZW9mX3BhZ2UsIGl0CmlzIGFsc28gZnJvbSBpX3NpemVfcmVhZChpbm9kZSksCnNvIGlzIHRo
aXMgYWN0dWFsbHkgbWVhbmluZ2xlc3M/ClRoYW5rcyEKPiAgICAgICAgICAgICAgICAgdHJ1bmNh
dGVfc2V0c2l6ZShpbm9kZSwgYXR0ci0+aWFfc2l6ZSk7Cj4KPiAgICAgICAgICAgICAgICAgaWYg
KGF0dHItPmlhX3NpemUgPD0gb2xkX3NpemUpCj4gQEAgLTEyMjcsNiArMTI0NSwxMCBAQCBzdGF0
aWMgaW50IGYyZnNfcHVuY2hfaG9sZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBsb2ZmX3Qgb2Zmc2V0
LCBsb2ZmX3QgbGVuKQo+ICAgICAgICAgaWYgKHJldCkKPiAgICAgICAgICAgICAgICAgcmV0dXJu
IHJldDsKPgo+ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGlu
Zyk7Cj4gKyAgICAgICBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgb2Zmc2V0ICsgbGVu
KTsKPiArICAgICAgIGZpbGVtYXBfaW52YWxpZGF0ZV91bmxvY2soaW5vZGUtPmlfbWFwcGluZyk7
Cj4gKwo+ICAgICAgICAgcGdfc3RhcnQgPSAoKHVuc2lnbmVkIGxvbmcgbG9uZykgb2Zmc2V0KSA+
PiBQQUdFX1NISUZUOwo+ICAgICAgICAgcGdfZW5kID0gKCh1bnNpZ25lZCBsb25nIGxvbmcpIG9m
ZnNldCArIGxlbikgPj4gUEFHRV9TSElGVDsKPgo+IEBAIC0xNTEwLDYgKzE1MzIsOCBAQCBzdGF0
aWMgaW50IGYyZnNfZG9fY29sbGFwc2Uoc3RydWN0IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNl
dCwgbG9mZl90IGxlbikKPiAgICAgICAgIGYyZnNfZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+
aV9nY19yd3NlbVtXUklURV0pOwo+ICAgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soaW5v
ZGUtPmlfbWFwcGluZyk7Cj4KPiArICAgICAgIGYyZnNfemVyb19wb3N0X2VvZl9wYWdlKGlub2Rl
LCBvZmZzZXQgKyBsZW4pOwo+ICsKPiAgICAgICAgIGYyZnNfbG9ja19vcChzYmkpOwo+ICAgICAg
ICAgZjJmc19kcm9wX2V4dGVudF90cmVlKGlub2RlKTsKPiAgICAgICAgIHRydW5jYXRlX3BhZ2Vj
YWNoZShpbm9kZSwgb2Zmc2V0KTsKPiBAQCAtMTYzMSw2ICsxNjU1LDEwIEBAIHN0YXRpYyBpbnQg
ZjJmc196ZXJvX3JhbmdlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGxvZmZfdCBvZmZzZXQsIGxvZmZf
dCBsZW4sCj4gICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICByZXR1cm4gcmV0Owo+
Cj4gKyAgICAgICBmaWxlbWFwX2ludmFsaWRhdGVfbG9jayhtYXBwaW5nKTsKPiArICAgICAgIGYy
ZnNfemVyb19wb3N0X2VvZl9wYWdlKGlub2RlLCBvZmZzZXQgKyBsZW4pOwo+ICsgICAgICAgZmls
ZW1hcF9pbnZhbGlkYXRlX3VubG9jayhtYXBwaW5nKTsKPiArCj4gICAgICAgICBwZ19zdGFydCA9
ICgodW5zaWduZWQgbG9uZyBsb25nKSBvZmZzZXQpID4+IFBBR0VfU0hJRlQ7Cj4gICAgICAgICBw
Z19lbmQgPSAoKHVuc2lnbmVkIGxvbmcgbG9uZykgb2Zmc2V0ICsgbGVuKSA+PiBQQUdFX1NISUZU
Owo+Cj4gQEAgLTE3NjIsNiArMTc5MCw4IEBAIHN0YXRpYyBpbnQgZjJmc19pbnNlcnRfcmFuZ2Uo
c3RydWN0IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwgbG9mZl90IGxlbikKPiAgICAgICAg
IC8qIGF2b2lkIGdjIG9wZXJhdGlvbiBkdXJpbmcgYmxvY2sgZXhjaGFuZ2UgKi8KPiAgICAgICAg
IGYyZnNfZG93bl93cml0ZSgmRjJGU19JKGlub2RlKS0+aV9nY19yd3NlbVtXUklURV0pOwo+ICAg
ICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2sobWFwcGluZyk7Cj4gKwo+ICsgICAgICAgZjJm
c196ZXJvX3Bvc3RfZW9mX3BhZ2UoaW5vZGUsIG9mZnNldCArIGxlbik7Cj4gICAgICAgICB0cnVu
Y2F0ZV9wYWdlY2FjaGUoaW5vZGUsIG9mZnNldCk7Cj4KPiAgICAgICAgIHdoaWxlICghcmV0ICYm
IGlkeCA+IHBnX3N0YXJ0KSB7Cj4gQEAgLTE4MTksNiArMTg0OSwxMCBAQCBzdGF0aWMgaW50IGYy
ZnNfZXhwYW5kX2lub2RlX2RhdGEoc3RydWN0IGlub2RlICppbm9kZSwgbG9mZl90IG9mZnNldCwK
PiAgICAgICAgIGlmIChlcnIpCj4gICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4KPiArICAg
ICAgIGZpbGVtYXBfaW52YWxpZGF0ZV9sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ICsgICAgICAg
ZjJmc196ZXJvX3Bvc3RfZW9mX3BhZ2UoaW5vZGUsIG9mZnNldCArIGxlbik7Cj4gKyAgICAgICBm
aWxlbWFwX2ludmFsaWRhdGVfdW5sb2NrKGlub2RlLT5pX21hcHBpbmcpOwo+ICsKPiAgICAgICAg
IGYyZnNfYmFsYW5jZV9mcyhzYmksIHRydWUpOwo+Cj4gICAgICAgICBwZ19zdGFydCA9ICgodW5z
aWduZWQgbG9uZyBsb25nKW9mZnNldCkgPj4gUEFHRV9TSElGVDsKPiBAQCAtNDg2MCw2ICs0ODk0
LDEwIEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfd3JpdGVfY2hlY2tzKHN0cnVjdCBraW9jYiAqaW9j
Yiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQo+ICAgICAgICAgZXJyID0gZmlsZV9tb2RpZmllZChm
aWxlKTsKPiAgICAgICAgIGlmIChlcnIpCj4gICAgICAgICAgICAgICAgIHJldHVybiBlcnI7Cj4g
Kwo+ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX2xvY2soaW5vZGUtPmlfbWFwcGluZyk7Cj4g
KyAgICAgICBmMmZzX3plcm9fcG9zdF9lb2ZfcGFnZShpbm9kZSwgaW9jYi0+a2lfcG9zICsgaW92
X2l0ZXJfY291bnQoZnJvbSkpOwo+ICsgICAgICAgZmlsZW1hcF9pbnZhbGlkYXRlX3VubG9jayhp
bm9kZS0+aV9tYXBwaW5nKTsKPiAgICAgICAgIHJldHVybiBjb3VudDsKPiAgfQo+Cj4gLS0KPiAy
LjQ5LjAKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
