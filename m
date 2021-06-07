Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D2D39EA32
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jun 2021 01:33:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqOk5-0003IH-Nc; Mon, 07 Jun 2021 23:33:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lqOk3-0003I9-SN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+b9TUERI1NrcFlfF5heDCygBb1KLo3O/P9FRHBq9Is=; b=D0weIjORR9m0otGoxUM6MOSrhd
 DUpoCIB3MwsTPiDnAaHr8YOLFPk9NKQZMkAJlW7VNUlKTZVMOQkMrDXUmV452VUkahv1sdk42pWQT
 P4z7ZUVKzto7Nd8X1xPz3Rj1rj2PLRnE4sQhmpqAyk604XEk+ug5Vq/dy0kI3UoOl9dM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5+b9TUERI1NrcFlfF5heDCygBb1KLo3O/P9FRHBq9Is=; b=CJke/Ms+YgMEHSkvuaA+yYBWDc
 oUefAPxk1PWblI9MOsl5qM45xIKiYiKF3v0zqypuEGqCGeNu+wvQkZO1bJ12V+lGcm4I9K+pOmQsQ
 F+odLACZYvjPJJF8tZEbeDoauTC1tuRhiASI6L6BlH7Eu2JW6Hkn+oYu+KZQkoG9LroA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lqOju-0003ii-PE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 23:33:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9A7DA610E5;
 Mon,  7 Jun 2021 23:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623108773;
 bh=HC3kkV8oWgBakwkIyHj/LfgohHNYJpZa7N+APwQmgTM=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=GnIIz6tP4VOxXqj4LYLCp3uNVRjR/hgMt4jvZC7DOD4xgdM89zM9hoOsw1zw9wmUk
 TJDsnl8AfkH7iNIcnJzd3VBPM6SjRmDfjRJS0T3o2tkNjl5RJwZabZpT88YzC5DUpc
 61fDnAGFuOy3mmEPG+6tuWmfoGZRY3+MiErPPdmEDPedLhciJKv5Ts97W+30twKOAl
 uXBEeADxGaRRtzcRwUGDm4GvM8CHyy06waVvhEViuD9e5m8XnaY8zKfwryQh/Am0aV
 OfpyAtxBYixyt4GwsOIRxFvZMVJra6aKLhmFRI3Z0LrtHcoujRfmjznUpT6rMzGSBj
 5ix8PSIAQX18w==
From: Chao Yu <chao@kernel.org>
To: Chao Yu <yuchao0@huawei.com>, jaegeuk@kernel.org
References: <20210601101024.119356-1-yuchao0@huawei.com>
 <9b43a461-e348-f16c-31da-fb70e064d6f8@kernel.org>
Message-ID: <979fb5f6-ff4e-e1d4-25d5-4aa61101f878@kernel.org>
Date: Tue, 8 Jun 2021 07:32:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <9b43a461-e348-f16c-31da-fb70e064d6f8@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lqOju-0003ii-PE
Subject: Re: [f2fs-dev] [PATCH v2 RFC] f2fs: fix to force keeping write
 barrier for strict fsync mode
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U3RpbGwgbm8gdGltZSB0byBjaGVjayB0aGlzPwoKVGhhbmtzLAoKT24gMjAyMS82LzQgMDowMCwg
Q2hhbyBZdSB3cm90ZToKPiBKYWVnZXVrLAo+IAo+IEFueSBjb21tZW50cyBvbiB0aGlzIHBhdGNo
Pwo+IAo+IE9uIDIwMjEvNi8xIDE4OjEwLCBDaGFvIFl1IHdyb3RlOgo+PiBbMV0gaHR0cHM6Ly93
d3cubWFpbC1hcmNoaXZlLmNvbS9saW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dC9tc2cxNTEyNi5odG1sCj4+Cj4+IEFzIFsxXSByZXBvcnRlZCwgaWYgbG93ZXIgZGV2aWNlIGRv
ZXNuJ3Qgc3VwcG9ydCB3cml0ZSBiYXJyaWVyLCBpbiBiZWxvdwo+PiBjYXNlOgo+Pgo+PiAtIHdy
aXRlIHBhZ2UgIzA7IHBlcnNpc3QKPj4gLSBvdmVyd3JpdGUgcGFnZSAjMAo+PiAtIGZzeW5jCj4+
IMKgIC0gd3JpdGUgZGF0YSBwYWdlICMwIE9QVSBpbnRvIGRldmljZSdzIGNhY2hlCj4+IMKgIC0g
d3JpdGUgaW5vZGUgcGFnZSBpbnRvIGRldmljZSdzIGNhY2hlCj4+IMKgIC0gaXNzdWUgZmx1c2gK
Pj4KPj4gSWYgU1BPIGlzIHRyaWdnZXJlZCBkdXJpbmcgZmx1c2ggY29tbWFuZCwgaW5vZGUgcGFn
ZSBjYW4gYmUgcGVyc2lzdGVkCj4+IGJlZm9yZSBkYXRhIHBhZ2UgIzAsIHNvIHRoYXQgYWZ0ZXIg
cmVjb3ZlcnksIGlub2RlIHBhZ2UgY2FuIGJlIHJlY292ZXJlZAo+PiB3aXRoIG5ldyBwaHlzaWNh
bCBibG9jayBhZGRyZXNzIG9mIGRhdGEgcGFnZSAjMCwgaG93ZXZlciB0aGVyZSBtYXkKPj4gY29u
dGFpbnMgZHVtbXkgZGF0YSBpbiBuZXcgcGh5c2ljYWwgYmxvY2sgYWRkcmVzcy4KPj4KPj4gVGhl
biB3aGF0IHVzZXIgd2lsbCBzZWUgaXM6IGFmdGVyIG92ZXJ3cml0ZSAmIGZzeW5jICsgU1BPLCBv
bGQgZGF0YSBpbgo+PiBmaWxlIHdhcyBjb3JydXB0ZWQsIGlmIGFueSB1c2VyIGRvIGNhcmUgYWJv
dXQgc3VjaCBjYXNlLCB3ZSBjYW4gc3VnZ2VzdAo+PiB1c2VyIHRvIHVzZSBTVFJJQ1QgZnN5bmMg
bW9kZSwgaW4gdGhpcyBtb2RlLCB3ZSB3aWxsIGZvcmNlIHRvIHRyaWdnZXIKPj4gcHJlZmx1c2gg
Y29tbWFuZCB0byBwZXJzaXN0IGRhdGEgaW4gZGV2aWNlIGNhY2hlIGluIHByaW9yIHRvIG5vZGUK
Pj4gd3JpdGViYWNrLCBpdCBhdm9pZHMgcG90ZW50aWFsIGRhdGEgY29ycnVwdGlvbiBkdXJpbmcg
ZnN5bmMoKS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29t
Pgo+PiAtLS0KPj4gdjI6Cj4+IC0gZml4IHRoaXMgYnkgYWRkaW5nIGFkZGl0aW9uYWwgcHJlZmx1
c2ggY29tbWFuZCByYXRoZXIgdGhhbiB1c2luZwo+PiBhdG9taWMgd3JpdGUgZmxvdy4KPj4gwqAg
ZnMvZjJmcy9maWxlLmMgfCAxNCArKysrKysrKysrKysrKwo+PiDCoCAxIGZpbGUgY2hhbmdlZCwg
MTQgaW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9maWxlLmMgYi9mcy9m
MmZzL2ZpbGUuYwo+PiBpbmRleCA3ZDUzMTFkNTRmNjMuLjIzOGNhMmE3MzNhYyAxMDA2NDQKPj4g
LS0tIGEvZnMvZjJmcy9maWxlLmMKPj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPj4gQEAgLTMwMSw2
ICszMDEsMjAgQEAgc3RhdGljIGludCBmMmZzX2RvX3N5bmNfZmlsZShzdHJ1Y3QgZmlsZSAqZmls
ZSwgbG9mZl90IHN0YXJ0LCBsb2ZmX3QgZW5kLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGYyZnNfZXhpc3Rfd3JpdHRlbl9kYXRhKHNiaSwgaW5vLCBVUERBVEVfSU5PKSkK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBmbHVzaF9vdXQ7Cj4+IMKgwqDCoMKg
wqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gK8KgwqDCoCB9IGVsc2Ugewo+PiArwqDCoMKgwqDCoMKg
wqAgLyoKPj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBmb3IgT1BVIGNhc2UsIGR1cmluZyBmc3luYygp
LCBub2RlIGNhbiBiZSBwZXJzaXN0ZWQgYmVmb3JlCj4+ICvCoMKgwqDCoMKgwqDCoMKgICogZGF0
YSB3aGVuIGxvd2VyIGRldmljZSBkb2Vzbid0IHN1cHBvcnQgd3JpdGUgYmFycmllciwgcmVzdWx0
Cj4+ICvCoMKgwqDCoMKgwqDCoMKgICogaW4gZGF0YSBjb3JydXB0aW9uIGFmdGVyIFNQTy4KPj4g
K8KgwqDCoMKgwqDCoMKgwqAgKiBTbyBmb3Igc3RyaWN0IGZzeW5jIG1vZGUsIGZvcmNlIHRvIHRy
aWdnZXIgcHJlZmx1c2ggdG8ga2VlcAo+PiArwqDCoMKgwqDCoMKgwqDCoCAqIGRhdGEvbm9kZSB3
cml0ZSBvcmRlciB0byBhdm9pZCBwb3RlbnRpYWwgZGF0YSBjb3JydXB0aW9uLgo+PiArwqDCoMKg
wqDCoMKgwqDCoCAqLwo+PiArwqDCoMKgwqDCoMKgwqAgaWYgKEYyRlNfT1BUSU9OKHNiaSkuZnN5
bmNfbW9kZSA9PSBGU1lOQ19NT0RFX1NUUklDVCAmJgo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgIWF0b21pYykgewo+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBmMmZzX2lzc3VlX2ZsdXNoKHNiaSwgaW5vZGUt
PmlfaW5vKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4g
wqDCoMKgwqDCoCB9Cj4+IMKgIGdvX3dyaXRlOgo+PiDCoMKgwqDCoMKgIC8qCj4+Cj4gCj4gCj4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGlu
dXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlz
dHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xp
c3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
