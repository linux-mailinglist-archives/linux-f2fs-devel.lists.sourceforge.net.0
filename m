Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B712ECCE4FB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 04:05:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SO+jX5f5zl++xZGT2xuRns27272bPKvhmlFJRBUDrqQ=; b=Mjf1a4tQEB3o/D8RPVrfF2uL7y
	xaLWiN1dvg61K5COXLIqyiJEOJTNHyfiRLsybnzAVZy/xZzHUeJOVZX45D0UEyut0+F09KjUygw95
	tJCPKdjVLvUjrnDPExJEter4zkvqT4yjUJ0xxFhqpiautmkSxP5iSzsYh5dYueR/8Zvc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWQo2-0006Kc-8h;
	Fri, 19 Dec 2025 03:05:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <niuzhiguo84@gmail.com>) id 1vWQo1-0006KW-Ob
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:05:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YZ5WQkrM9A0JQX7LKfN9AUNAuCRwrJyMYYaa/Xj/MAk=; b=NGSd+0c5Dvs7sKC6d1VnZy8VyY
 76dTV2LAyanqhBuLsI84kP/3EcMU8lUcpuoXJYzINikwG9OJ2necTmWSPSsvQ5DPPeaxZBI/IZ+QZ
 hnI51JQ5yndOz62Y1NHcOouX4rKGwzewyUwyAqqX5fyi74jltmBP5W8FzwpunMCBhzMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YZ5WQkrM9A0JQX7LKfN9AUNAuCRwrJyMYYaa/Xj/MAk=; b=jrxl3e5MLVdmG+37zpz5rajqSY
 xMsnTOJ7W/Nbj09qR/QE+CV353KBWzpR1aZIgy1iGNTyi+bOIpzog45MNGaMZrNUL18mTRJlQvDgy
 MSmrWJj6RAJqZwx6pmR0vkZK2lC4yVUWGk9LNILatQ8BZK3nWRpyqsRi0j1RdWtas7N4=;
Received: from mail-wm1-f44.google.com ([209.85.128.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vWQo1-0001Qk-58 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 03:05:25 +0000
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-477985aea2bso1491665e9.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Dec 2025 19:05:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766113513; x=1766718313; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YZ5WQkrM9A0JQX7LKfN9AUNAuCRwrJyMYYaa/Xj/MAk=;
 b=jHsAz44nEGBnl0nfHE/SNlCTNnGMncO8bxK2ncSc4yMuLmYsC/NNimnkXavSJ0FmOZ
 SJkIoriAJgtDFVTC+gySutaCv+10AYr1/NWGShpJmKP1Ut6CptZ2JVmhfCDKHOJkJjWl
 9qcY8OzM4FJvewweZ2rxD5BwIch6fWn7LCXZN79iBTKGNUlk8xI3VGdj0hNYAU/QfXWv
 BFapPX0rjQLcsWzasezP+9GFY54Sz818lykBo1TArDCBxxhJT7z7BQvf0/CnV7Qi2IKS
 y29PDvYJpcCNTviKI6cN3yyJXXb/6rdW+SnHClCOOgfb626F55YFfJCdG+wFzax+f3w7
 rAtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766113513; x=1766718313;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=YZ5WQkrM9A0JQX7LKfN9AUNAuCRwrJyMYYaa/Xj/MAk=;
 b=RgCqC2t5hk3RKa+Er0UOnf9QdSnZ6t9PEEq3/OXIgsJTjQ2Pi+V7tBXEI8EvVl5KnC
 TpnGGyIQAUwqj8RkDLUwKh489Ig0QWFaMI7ONdd+NxXfJ86RLTqgkZTyqKNu+fu4Rhzs
 xdECkEQ+dl+z0p3eK7wdFMTK8ayHeGgCCMGOG8Na+5ofQ36lAmd8wDbL6d0ejyARScr0
 PsxdMAJrbhu8vtU0maECxt+/FFjIgtxlJvIEE/xvsnwlQ9KMyMSzgQOdzYBSpj7G1Sgt
 HgdYyBvgIO68CuE4oky0wtr5cDbMf6UmJWJHZeXJqTLUHiSLQYYdQMtNgAmH3mhKGXXC
 MHgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWj8MOrmsKA/9KVemY12/BfufXJv8Lj3bQnzPm+IljHj83tmpE7/HhShWvV7s+WvSweOgOkkBXHd0pf5GOdR2mA@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxkcgLmt/HpP49yOXR2hHIe5/SxxfxVKVZU5picQcRV8EwGuXOe
 Y6umZahcTtxICvuSxgbcrbPiYNmWnIBi2GBCOFx3qJIiSUbbQCvuaEhluP30WLiqyYQLGR4hqGJ
 Pj1h/O4HKB83IOWx3p1YmmfQN39a3kJtvodo/
X-Gm-Gg: AY/fxX44lK3s0lbY3rPiQ8Q7sSO31Pc4BkNNORFtf5X2X/EhWAFt/2o/dV6fJxktpc+
 +qiwTzkq0AUGJZBqfngaxJT8j368ScylYbrn9kA9y4QoZ2NIccgTrI7OaoM5E+va/LXNetgy8je
 sGnA6Z8Orlqez79KT9PrjymYL19zalv/uZWq2pCZPC6vRqokOyQfHb342dprgc9bReHfqpSbR3E
 kiUrfgRTSgvx2iDzfwgqniZoRzW+oUd3SjEvAq34fivggf1XdVmTS0pCKkItaaAXZL0j1j2
X-Google-Smtp-Source: AGHT+IHzMQ/0U576qzStcXSeBEEKlGt4OvybEP/bSwHYAMUpRMJTyw+LsYNiXavG0X3Uuwb3Kl3w+YQeiKuOpfZoxo8=
X-Received: by 2002:a05:600c:1c86:b0:477:c5a9:33ce with SMTP id
 5b1f17b1804b1-47d1957b705mr6589705e9.4.1766113513352; Thu, 18 Dec 2025
 19:05:13 -0800 (PST)
MIME-Version: 1.0
References: <20251219025104.12256-1-chao@kernel.org>
In-Reply-To: <20251219025104.12256-1-chao@kernel.org>
From: Zhiguo Niu <niuzhiguo84@gmail.com>
Date: Fri, 19 Dec 2025 11:05:01 +0800
X-Gm-Features: AQt7F2qtCdcne9mETLi4IIL69iu8ea54BsUftN3-qJl7RvtPDkeah6KM9DYL1_M
Message-ID: <CAHJ8P3+p7i4aPCnE=zjCRx4rq8d0sbSX0Hzxsi4c5pwnZ6mGCQ@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Chao Yu via Linux-f2fs-devel 于2025年12月19日周五 10:56写道：
    > > As Zhiguo reported, nat entry of quota inode could be corrupted: > >
   "ino/block_addr=NULL_ADDR in nid=4 entry" > > We'd bet [...] 
 
 Content analysis details:   (0.1 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail provider
                             [niuzhiguo84(at)gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
                             digit
                             [niuzhiguo84(at)gmail.com]
  0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.128.44 listed in wl.mailspike.net]
X-Headers-End: 1vWQo1-0001Qk-58
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on nat entry of
 quota inode
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
Cc: jaegeuk@kernel.org, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Q2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQ+CuS6jjIwMjXlubQxMuaciDE55pel5ZGo5LqUIDEwOjU25YaZ6YGT77yaCj4K
PiBBcyBaaGlndW8gcmVwb3J0ZWQsIG5hdCBlbnRyeSBvZiBxdW90YSBpbm9kZSBjb3VsZCBiZSBj
b3JydXB0ZWQ6Cj4KPiAiaW5vL2Jsb2NrX2FkZHI9TlVMTF9BRERSIGluIG5pZD00IGVudHJ5Igo+
Cj4gV2UnZCBiZXR0ZXIgdG8gZG8gc2FuaXR5IGNoZWNrIG9uIHF1b3RhIGlub2RlIHRvIGRldGVj
dCBhbmQgcmVjb3JkCj4gbmF0LmJsa19hZGRyIGluY29uc2lzdGVuY3ksIHNvIHRoYXQgd2UgY2Fu
IGhhdmUgYSBjaGFuY2UgdG8gcmVwYWlyCj4gaXQgdy8gbGF0ZXIgZnNjay4KPgo+IFJlcG9ydGVk
LWJ5OiBaaGlndW8gTml1IDx6aGlndW8ubml1QHVuaXNvYy5jb20+Cj4gU2lnbmVkLW9mZi1ieTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgoKUmV2aWV3ZWQtYnk6IFpoaWd1byBOaXUgPHpoaWd1
by5uaXVAdW5pc29jLmNvbT4KVGhhbmtzIQo+IC0tLQo+ICBmcy9mMmZzL2YyZnMuaCAgfCAgNiAr
KystLS0KPiAgZnMvZjJmcy9pbm9kZS5jIHwgIDIgKy0KPiAgZnMvZjJmcy9ub2RlLmMgIHwgMTEg
KysrKysrKysrKysKPiAgMyBmaWxlcyBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgK
PiBpbmRleCA2NWNhMWE1ZWFhODguLmM0NThkZjkyYmIwZCAxMDA2NDQKPiAtLS0gYS9mcy9mMmZz
L2YyZnMuaAo+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gQEAgLTQ5MjgsMTYgKzQ5MjgsMTYgQEAg
c3RhdGljIGlubGluZSBib29sIGlzX2pvdXJuYWxsZWRfcXVvdGEoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKQo+ICAgICAgICAgcmV0dXJuIGZhbHNlOwo+ICB9Cj4KPiAtc3RhdGljIGlubGluZSBi
b29sIGYyZnNfcXVvdGFfZmlsZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ICtzdGF0aWMgaW5saW5l
IGJvb2wgZjJmc19xdW90YV9maWxlKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3QgaW5v
KQo+ICB7Cj4gICNpZmRlZiBDT05GSUdfUVVPVEEKPiAgICAgICAgIGludCBpOwo+Cj4gLSAgICAg
ICBpZiAoIWYyZnNfc2JfaGFzX3F1b3RhX2lubyhGMkZTX0lfU0IoaW5vZGUpKSkKPiArICAgICAg
IGlmICghZjJmc19zYl9oYXNfcXVvdGFfaW5vKHNiaSkpCj4gICAgICAgICAgICAgICAgIHJldHVy
biBmYWxzZTsKPgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IE1BWFFVT1RBUzsgaSsrKSB7Cj4g
LSAgICAgICAgICAgICAgIGlmIChmMmZzX3FmX2lubyhGMkZTX0lfU0IoaW5vZGUpLT5zYiwgaSkg
PT0gaW5vZGUtPmlfaW5vKQo+ICsgICAgICAgICAgICAgICBpZiAoZjJmc19xZl9pbm8oc2JpLT5z
YiwgaSkgPT0gaW5vKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiB0cnVlOwo+ICAg
ICAgICAgfQo+ICAjZW5kaWYKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMvZjJm
cy9pbm9kZS5jCj4gaW5kZXggOTIxZmIwMmMwZjQ5Li5kMTI3MGIyNWFkN2QgMTAwNjQ0Cj4gLS0t
IGEvZnMvZjJmcy9pbm9kZS5jCj4gKysrIGIvZnMvZjJmcy9pbm9kZS5jCj4gQEAgLTYyMSw3ICs2
MjEsNyBAQCBzdHJ1Y3QgaW5vZGUgKmYyZnNfaWdldChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB1
bnNpZ25lZCBsb25nIGlubykKPiAgICAgICAgICAgICAgICAgaW5vZGUtPmlfZm9wID0gJmYyZnNf
ZmlsZV9vcGVyYXRpb25zOwo+ICAgICAgICAgICAgICAgICBpbm9kZS0+aV9tYXBwaW5nLT5hX29w
cyA9ICZmMmZzX2RibG9ja19hb3BzOwo+ICAgICAgICAgICAgICAgICBpZiAoSVNfSU1NVVRBQkxF
KGlub2RlKSAmJiAhZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpICYmCj4gLSAgICAgICAgICAg
ICAgICAgICAhZjJmc19xdW90YV9maWxlKGlub2RlKSkKPiArICAgICAgICAgICAgICAgICAgICFm
MmZzX3F1b3RhX2ZpbGUoc2JpLCBpbm9kZS0+aV9pbm8pKQo+ICAgICAgICAgICAgICAgICAgICAg
ICAgIG1hcHBpbmdfc2V0X2ZvbGlvX21pbl9vcmRlcihpbm9kZS0+aV9tYXBwaW5nLCAwKTsKPiAg
ICAgICAgIH0gZWxzZSBpZiAoU19JU0RJUihpbm9kZS0+aV9tb2RlKSkgewo+ICAgICAgICAgICAg
ICAgICBpbm9kZS0+aV9vcCA9ICZmMmZzX2Rpcl9pbm9kZV9vcGVyYXRpb25zOwo+IGRpZmYgLS1n
aXQgYS9mcy9mMmZzL25vZGUuYyBiL2ZzL2YyZnMvbm9kZS5jCj4gaW5kZXggN2ZlZWFkNTk1YmE1
Li5mMWU2ZmEyZGNjYzkgMTAwNjQ0Cj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPiArKysgYi9mcy9m
MmZzL25vZGUuYwo+IEBAIC02NDMsNiArNjQzLDE3IEBAIGludCBmMmZzX2dldF9ub2RlX2luZm8o
c3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBuaWRfdCBuaWQsCj4gICAgICAgICAgICAgICAgIHJl
dHVybiAtRUZTQ09SUlVQVEVEOwo+ICAgICAgICAgfQo+Cj4gKyAgICAgICBpZiAodW5saWtlbHko
ZjJmc19xdW90YV9maWxlKHNiaSwgbmktPm5pZCkgJiYKPiArICAgICAgICAgICAgICAgIV9faXNf
dmFsaWRfZGF0YV9ibGthZGRyKG5pLT5ibGtfYWRkcikpKSB7Cj4gKyAgICAgICAgICAgICAgIHNl
dF9zYmlfZmxhZyhzYmksIFNCSV9ORUVEX0ZTQ0spOwo+ICsgICAgICAgICAgICAgICBmMmZzX2Vy
cl9yYXRlbGltaXRlZChzYmksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgImYyZnNfZ2V0X25v
ZGVfaW5mbyBvZiAlcFM6IGluY29uc2lzdGVudCBuYXQgZW50cnkgZnJvbSBxZl9pbm8sICIKPiAr
ICAgICAgICAgICAgICAgICAgICAgICAiaW5vOiV1LCBuaWQ6JXUsIGJsa2FkZHI6JXUsIHZlcjol
dSwgZmxhZzoldSIsCj4gKyAgICAgICAgICAgICAgICAgICAgICAgX19idWlsdGluX3JldHVybl9h
ZGRyZXNzKDApLAo+ICsgICAgICAgICAgICAgICAgICAgICAgIG5pLT5pbm8sIG5pLT5uaWQsIG5p
LT5ibGtfYWRkciwgbmktPnZlcnNpb24sIG5pLT5mbGFnKTsKPiArICAgICAgICAgICAgICAgZjJm
c19oYW5kbGVfZXJyb3Ioc2JpLCBFUlJPUl9JTkNPTlNJU1RFTlRfTkFUKTsKPiArICAgICAgIH0K
PiArCj4gICAgICAgICAvKiBjYWNoZSBuYXQgZW50cnkgKi8KPiAgICAgICAgIGlmIChuZWVkX2Nh
Y2hlKQo+ICAgICAgICAgICAgICAgICBjYWNoZV9uYXRfZW50cnkoc2JpLCBuaWQsICZuZSk7Cj4g
LS0KPiAyLjQwLjEKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
