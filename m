Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 462AABF4BEA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Oct 2025 08:52:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHzhnue79kof7yBIprFlgBvTeWmiuvVu3q0Mk5Il85E=; b=SMDVXwnGUDJOCCl+3WCqiP69yd
	vUk6WdqHAM6S7i4G0pCM13ZOxX4L9T3s49dy1WR5pe0gyYSTVa7o2PSFY/qgs4ACrI98Fs6T57PWz
	fkPHz7bW7MpyKUopknT0+aq3Py3Ra+vZWdjQO0TB05c8jAx8zQmwrEhNvXP2cdTgE74A=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vB6EF-0008J0-8N;
	Tue, 21 Oct 2025 06:52:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vB6E9-0008IQ-Od
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 06:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PhyKE9NNOdNYL68ttvxs7drsfMMPixH7kCyGGRYFvmM=; b=ib4xg+cLMAHnfLeHVHZy3lAtnh
 AdepTzebpLxUQRIQJBCOQMtTLHG7EQpowAOHevUbUDTfj1ta1gsuV4ZT994k78L0N4p8I69x/lS4L
 RkeIGTybOeP7rv6o1War+oXDKhDP0VNTfahDKyBUrCJsvku6O6xHB9Ya9uWEuTXJx2B4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PhyKE9NNOdNYL68ttvxs7drsfMMPixH7kCyGGRYFvmM=; b=Vy6WtrfaPf1HBiDKrmVoXdjIYf
 1wqF6rKLF7p+Lytn7abUTK5o/7n9NU5SuioNlb8iuXmAxsRfZhcKdsdqI5it0vkIPxW2GNj0cGgXt
 PAl30wpE6DjhgC8RPoWqbLBGntUEz9cXBbyEfpqCNblCzkfT2ZBofj1vY15Ke/rNGndY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vB6E9-0005il-UG for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Oct 2025 06:52:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2E46160370;
 Tue, 21 Oct 2025 06:52:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07F42C4CEF1;
 Tue, 21 Oct 2025 06:51:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761029522;
 bh=9aRMxBHEJ8ae6174ZkI8n/5rBXpR8DVeI+noC7rRjBc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=CgObkyJsAreKnTeUArXWl8ovk8KSq2zg+KUrJfWc1FETiqTvgx7lXmjtcSW2qfJ3T
 SLq/oG46PpSp38FODmJ4/U8cRg8Yc6fIMOdUxU3Wn8LOOdvs+mAPR4fBeLmL5r1oGJ
 f+C0n9O95rji9lDtDN/ReCrCyasCwPoGlIwuSB1RwL9G+02pgS2oIarRrepWYxb6e8
 Lh605r0mGWEMKC6fEoew8b+mcIhTAcqOuV5vVmSoeGh+88kAKFy0JN6eEo7HlfJwcS
 CUtLQO8VC8cetqNp7gNT4exinW2/saAFTfPCfFQ1g91fWFdA8iBuJNnTk8AVG05ZlI
 v4ABmiknzgduw==
Message-ID: <75d0a52d-1662-45f9-ab67-909b906004b3@kernel.org>
Date: Tue, 21 Oct 2025 14:51:57 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jeuk Kim <jeuk20.kim@gmail.com>, jaegeuk@kernel.org
References: <20251016051621.7425-1-jeuk20.kim@gmail.com>
 <5257fece-d947-4a33-8f66-4db5e8b73a28@kernel.org>
 <e26ec66d-36db-429f-befb-8baad14779d9@gmail.com>
Content-Language: en-US
In-Reply-To: <e26ec66d-36db-429f-befb-8baad14779d9@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/21/25 11:33, Jeuk Kim wrote: > > On 10/16/2025 7:12
 PM, Chao Yu wrote: >> On 10/16/2025 1:16 PM, Jeuk Kim wrote: >>> From: Jeuk
 Kim <jeuk20.kim@samsung.com> >>> >>> Inline encryption derives DUN [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vB6E9-0005il-UG
Subject: Re: [f2fs-dev] [PATCH] f2fs: serialize writeback for inline-crypto
 inodes
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: hyenc.jeong@samsung.com, jieon.seol@samsung.com, gyusun.lee@samsung.com,
 wone.jung@samsung.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, d_hyun.kwon@samsung.com,
 jeuk20.kim@samsung.com, jaemyung.lee@samsung.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTAvMjEvMjUgMTE6MzMsIEpldWsgS2ltIHdyb3RlOgo+IAo+IE9uIDEwLzE2LzIwMjUgNzox
MiBQTSwgQ2hhbyBZdSB3cm90ZToKPj4gT24gMTAvMTYvMjAyNSAxOjE2IFBNLCBKZXVrIEtpbSB3
cm90ZToKPj4+IEZyb206IEpldWsgS2ltIDxqZXVrMjAua2ltQHNhbXN1bmcuY29tPgo+Pj4KPj4+
IElubGluZSBlbmNyeXB0aW9uIGRlcml2ZXMgRFVOIGZyb20gPGlub2RlLCBmaWxlIG9mZnNldD4s
Cj4+PiBzbyBiaW9zIGZyb20gZGlmZmVyZW50IGlub2RlcyBjYW4ndCBtZXJnZS4gV2l0aCBtdWx0
aS10aHJlYWRlZAo+Pj4gYnVmZmVyZWQgT19TWU5DIHdyaXRlcyB3aGVyZSBlYWNoIHRocmVhZCB3
cml0ZXMgdG8gaXRzIG93biBmaWxlLAo+Pj4gNEtpQi1wZXItcGFnZSBMQkEgYWxsb2NhdGlvbiBp
bnRlcmxlYXZlcyBhY3Jvc3MgaW5vZGVzIGFuZAo+Pj4gY2F1c2VzIGJpbyBzcGxpdC4gU2VyaWFs
aXplIHdyaXRlYmFjayBmb3IgZnNjcnlwdCBpbmxpbmUtY3J5cHRvCj4+PiBpbm9kZXMgdmlhIF9f
c2hvdWxkX3NlcmlhbGl6ZV9pbygpIHRvIGtlZXAgZm9yZWdyb3VuZCB3cml0ZWJhY2sKPj4+IGZv
Y3VzZWQgb24gb25lIGlub2RlIGFuZCBhdm9pZCBzcGxpdC4KPj4+Cj4+PiBUZXN0OiBmaW8gLS1u
YW1lPXdiX29zeW5jIC0tcnc9d3JpdGUgLS1icz0xTSBcCj4+PiDCoMKgwqDCoMKgwqAgLS10aW1l
X2Jhc2VkPTEgLS1ydW50aW1lPTYwcyAtLXNpemU9MkcgXAo+Pj4gwqDCoMKgwqDCoMKgIC0taW9l
bmdpbmU9cHN5bmMgLS1kaXJlY3Q9MCAtLXN5bmM9MSBcCj4+PiDCoMKgwqDCoMKgwqAgLS1udW1q
b2JzPTggLS10aHJlYWQ9MSAtLW5yZmlsZXM9MSBcCj4+PiDCoMKgwqDCoMKgwqAgLS1maWxlbmFt
ZV9mb3JtYXQ9J3diX29zeW5jLiRqb2JudW0nCj4+Pgo+Pj4gZGV2aWNlOiBVRlMKPj4+Cj4+PiBC
ZWZvcmUgLQo+Pj4gwqDCoCB3cml0ZSB0aHJvdWdocHV0OiA2NzVNaUIvcwo+Pj4gwqDCoCBkZXZp
Y2UgSS9PIHNpemUgZGlzdHJpYnV0aW9uIChieSBjb3VudCwgdG90YWwgMTAyNzQxNCk6Cj4+PiDC
oMKgwqDCoCA0IEtpQjrCoCA5MjMxMzkgKDg5LjklKQo+Pj4gwqDCoMKgwqAgOCBLaUI6wqAgODQ3
OTggKDguMyUpCj4+PiDCoMKgwqDCoCDiiaU1MTIgS2lCOiA0NTMgKDAuMCUpCj4+Pgo+Pj4gQWZ0
ZXIgLQo+Pj4gwqDCoCB3cml0ZSB0aHJvdWdocHV0OiAxNzYwTWlCL3MKPj4+IMKgwqAgZGV2aWNl
IEkvTyBzaXplIGRpc3RyaWJ1dGlvbiAoYnkgY291bnQsIHRvdGFsIDIzMTc1MCk6Cj4+PiDCoMKg
wqDCoCA0IEtpQjrCoCAxNjkwNCAoNy4zJSkKPj4+IMKgwqDCoMKgIDggS2lCOsKgIDcyMTI4ICgz
MS4xJSkKPj4+IMKgwqDCoMKgIOKJpTUxMiBLaUI6IDExODkwMCAoNTEuMyUpCj4+Pgo+Pj4gU2ln
bmVkLW9mZi1ieTogSmV1ayBLaW0gPGpldWsyMC5raW1Ac2Ftc3VuZy5jb20+Cj4+PiAtLS0KPj4+
IMKgIGZzL2YyZnMvZGF0YS5jIHwgMiArKwo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0
aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0
YS5jCj4+PiBpbmRleCBlZjM4ZTYyY2RhOGYuLmFlNmZiNDM1ZDU3NiAxMDA2NDQKPj4+IC0tLSBh
L2ZzL2YyZnMvZGF0YS5jCj4+PiArKysgYi9mcy9mMmZzL2RhdGEuYwo+Pj4gQEAgLTMyMTcsNiAr
MzIxNyw4IEBAIHN0YXRpYyBpbmxpbmUgYm9vbCBfX3Nob3VsZF9zZXJpYWxpemVfaW8oc3RydWN0
IGlub2RlICppbm9kZSwKPj4+IMKgIMKgwqDCoMKgwqAgaWYgKGYyZnNfbmVlZF9jb21wcmVzc19k
YXRhKGlub2RlKSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+ICvCoMKg
wqAgaWYgKGZzY3J5cHRfaW5vZGVfdXNlc19pbmxpbmVfY3J5cHRvKGlub2RlKSkKPj4+ICvCoMKg
wqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+IMKgwqDCoMKgwqAgaWYgKHdiYy0+c3luY19tb2Rl
ICE9IFdCX1NZTkNfQUxMKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+Pj4g
wqDCoMKgwqDCoCBpZiAoZ2V0X2RpcnR5X3BhZ2VzKGlub2RlKSA+PSBTTV9JKEYyRlNfSV9TQihp
bm9kZSkpLT5taW5fc2VxX2Jsb2NrcykKPj4KPj4gSmV1aywKPj4KPj4gQ2FuIHlvdSBwbGVhc2Ug
dHJ5IHR1bmluZyAvc3lzL2ZzL2YyZnMvPGRldj4vbWluX3NlcV9ibG9ja3MgdG8gc2VlIHdoZXRo
ZXIgaXQKPj4gY2FuIGFjaGl2ZSB0aGUgZ29hbD8KPj4KPj4gVGhhbmtzLAo+Pgo+IEhpIENoYW8s
Cj4gCj4gVGhhbmtzIGEgbG90IGZvciB0aGUgc3VnZ2VzdGlvbi4KPiBJIHRyaWVkIHR1bmluZyBg
L3N5cy9mcy9mMmZzLzxkZXY+L21pbl9zZXFfYmxvY2tzYCBhcyB5b3UgbWVudGlvbmVkLCBhbmQg
aXQgYWxzbyBhY2hpZXZlZCBzaW1pbGFyIHBlcmZvcm1hbmNlIGltcHJvdmVtZW50IG9uIG15IHNl
dHVwLgo+IAo+IFlvdXIgYXBwcm9hY2ggbG9va3MgY2xlYW5lciBhbmQgYmV0dGVyIHRoYW4gdGhl
IG9uZSBJIHByb3Bvc2VkLgo+IAo+IEZyb20gd2hhdCBJIHNlZSwgZXZlbiBhZnRlciByZWR1Y2lu
ZyB0aGlzIHZhbHVlIGZyb20gdGhlIGRlZmF1bHQgKDJNQikgdG8gNTEyIEtCIG9uIG15IGxvY2Fs
IHN5c3RlbSwgdGhlcmUgZG9lc27igJl0IHNlZW0gdG8gYmUgYW55IG5vdGljZWFibGUgcGVyZm9y
bWFuY2UgZHJvcCBvciBvdGhlciBzaWRlIGVmZmVjdHMuCj4gRG8geW91IHNlZSBhbnkgcG9zc2li
bGUgZG93bnNpZGVzIHdpdGggbG93ZXJpbmcgdGhpcyB2YWx1ZSB0aGF0IEkgbWlnaHQgaGF2ZSBt
aXNzZWQ/CgpIaSBKZXVrLAoKV2UncmUgdXNpbmcgc2JpLT53cml0ZXBhZ2VzIHRvIHNlcmlhbGl6
ZSBsYXJnZSBJT3MsIG9uY2UgeW91IHR1bmVkIGRlZmF1bHQKdmFsdWUgZnJvbSAyTUIgdG8gNTEy
S0IsIGluIEFuZHJvaWQsIHRoZXJlIGFyZSB0aHJlYWRzIGlzc3VlIFs1MTJLLCAyTSkKc2l6ZWQg
SU9zLCB0aGV5IHdpbGwgam9pbiBpbnRvIHJhY2luZyBvbiBncmFiYmluZyB0aGUgLndyaXRlcGFn
ZXMgbG9jaywKSSBndWVzcyB0aGF0IHdpbGwgY2F1c2UgcG90ZW50aWFsIHBlcmZvcm1hbmNlIHJl
Z3Jlc3Npb24sIHJpZ2h0PwoKVGhhbmtzLAoKPiAKPiBUaGFua3MgYWdhaW4gZm9yIHlvdXIgaGVs
cC4KPiAKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
TGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAo=
