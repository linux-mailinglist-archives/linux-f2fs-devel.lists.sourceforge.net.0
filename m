Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F74B8D353B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 13:13:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCHFX-000374-4Q;
	Wed, 29 May 2024 11:13:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sCHFW-00036y-E1
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:13:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ddAO84OsBFt2TB86f98hEt6tI8+kuCa+mHV65aHhU48=; b=V0BoJgOcsvcnluE69MJbTgSb/X
 3XIWpfjGPt14OIfpQulRKEEaD6HweKjO/hb+nln+2KYvx8tffSJsXFLr/lChBa87TH7jIh0ZUDDbO
 DizaWynadn7lmzjspX2fF2wyfeVK9/gMVAdXd8hHRv6OwjnpTZqm4cVGGLNlS4oJqxsw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ddAO84OsBFt2TB86f98hEt6tI8+kuCa+mHV65aHhU48=; b=Rl30TiB1IdCjxXzYlUB1gb9DDa
 WhTKQGnq35+0IrCvkbrnDmaEyP/GhLvx1bjSN19Kh1KHkkRKzJquv6GivzgZ/wl9BFmdvSIg/XhQD
 vwiijKKurv7pPPZrHv7s3iAekF3VMgrJP6V6uABZPaTeM+GWbF8kAd+chBkZpply5DMk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCHFV-0005f9-Ce for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:13:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4666D6282F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 May 2024 11:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D459C32786;
 Wed, 29 May 2024 11:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716981215;
 bh=b7FjpDnBjzb3hqaviXRWE3Ie4w+SaRNZu55hMptmPaA=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=aOwngCH0HIPpHe0Mclknzuv8OKq5zUPew3cN2CwZtZE3/EmaLg+B0hx9E2LurWdvX
 UTOAhs+11C9dsWr1+YNWVwWLUggS9gTCWDPO8Ph6zZU0mweZ3JF9baDW2olIatSyOl
 HYOTVWbEeFXiJDoMh9bqsQ0lzhZx4oSKKhTJvRmdOZ+6+Vj18rCIbVxJvnzJO7q1RR
 zJO/LL7nWvoUheSBEND+q8BEGAthMtrHOvlqoeVEqEZfHF4Kzf6XWPtOR1PHFKHQvD
 14z/EtjU09zwB8f6ICVbM0DI2ctRpU5U+zMdeLFWx/WA122w9VAw/WReV14fxBRz+J
 DyOl2+9p6S2KQ==
Message-ID: <03647897-8b1f-4c82-b2b6-0aa0704bed05@kernel.org>
Date: Wed, 29 May 2024 19:13:31 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
References: <20240411082354.1691820-1-chao@kernel.org>
 <11d5d736-bae5-4a71-b400-087b8722893c@kernel.org>
Content-Language: en-US
In-Reply-To: <11d5d736-bae5-4a71-b400-087b8722893c@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, On 2024/4/23 10:07, Chao Yu wrote: > Jaegeuk,
 any comments
 for this serials? > > On 2024/4/11 16:23, Chao Yu wrote: >> After commit
 899fee36fac0 ("f2fs: fix to avoid data corruption by >> forbidding S [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sCHFV-0005f9-Ce
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: use per-log target_bitmap to
 improve lookup performace of ssr allocation
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

UGluZywKCk9uIDIwMjQvNC8yMyAxMDowNywgQ2hhbyBZdSB3cm90ZToKPiBKYWVnZXVrLCBhbnkg
Y29tbWVudHMgZm9yIHRoaXMgc2VyaWFscz8KPiAKPiBPbiAyMDI0LzQvMTEgMTY6MjMsIENoYW8g
WXUgd3JvdGU6Cj4+IEFmdGVyIGNvbW1pdCA4OTlmZWUzNmZhYzAgKCJmMmZzOiBmaXggdG8gYXZv
aWQgZGF0YSBjb3JydXB0aW9uIGJ5Cj4+IGZvcmJpZGRpbmcgU1NSIG92ZXJ3cml0ZSIpLCB2YWxp
ZCBibG9jayBiaXRtYXAgb2YgY3VycmVudCBvcGVubmVkCj4+IHNlZ21lbnQgaXMgZml4ZWQsIGxl
dCdzIGludHJvZHVjZSBhIHBlci1sb2cgYml0bWFwIGluc3RlYWQgb2YgdGVtcAo+PiBiaXRtYXAg
dG8gYXZvaWQgdW5uZWNlc3NhcnkgY2FsY3VsYXRpb24gb3ZlcmhlYWQgd2hlbmV2ZXIgYWxsb2Nh
dGluZwo+PiBmcmVlIHNsb3Qgdy8gU1NSIGFsbG9jYXRvci4KPj4KPj4gU2lnbmVkLW9mZi1ieTog
Q2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiAtLS0KPj4gdjI6Cj4+IC0gcmViYXNlIHRvIGxh
c3QgZGV2LXRlc3QgYnJhbmNoLgo+PiDCoCBmcy9mMmZzL3NlZ21lbnQuYyB8IDMwICsrKysrKysr
KysrKysrKysrKysrKystLS0tLS0tLQo+PiDCoCBmcy9mMmZzL3NlZ21lbnQuaCB8wqAgMSArCj4+
IMKgIDIgZmlsZXMgY2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4K
Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4g
aW5kZXggNjQ3NGI3MzM4ZTgxLi5hZjcxNjkyNWRiMTkgMTAwNjQ0Cj4+IC0tLSBhL2ZzL2YyZnMv
c2VnbWVudC5jCj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4+IEBAIC0yODQwLDMxICsyODQw
LDM5IEBAIHN0YXRpYyBpbnQgbmV3X2N1cnNlZyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGlu
dCB0eXBlLCBib29sIG5ld19zZWMpCj4+IMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+IMKgIH0KPj4g
LXN0YXRpYyBpbnQgX19uZXh0X2ZyZWVfYmxrb2ZmKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwK
Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBzZWdubywgYmxv
Y2tfdCBzdGFydCkKPj4gK3N0YXRpYyB2b2lkIF9fZ2V0X3NlZ21lbnRfYml0bWFwKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHVuc2lnbmVkIGxvbmcgKnRhcmdldF9tYXAsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpbnQgc2Vnbm8pCj4+IMKgIHsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3Qg
c2VnX2VudHJ5ICpzZSA9IGdldF9zZWdfZW50cnkoc2JpLCBzZWdubyk7Cj4+IMKgwqDCoMKgwqAg
aW50IGVudHJpZXMgPSBTSVRfVkJMT0NLX01BUF9TSVpFIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcp
Owo+PiAtwqDCoMKgIHVuc2lnbmVkIGxvbmcgKnRhcmdldF9tYXAgPSBTSVRfSShzYmkpLT50bXBf
bWFwOwo+PiDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgKmNrcHRfbWFwID0gKHVuc2lnbmVkIGxv
bmcgKilzZS0+Y2twdF92YWxpZF9tYXA7Cj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgbG9uZyAqY3Vy
X21hcCA9ICh1bnNpZ25lZCBsb25nICopc2UtPmN1cl92YWxpZF9tYXA7Cj4+IMKgwqDCoMKgwqAg
aW50IGk7Cj4+IMKgwqDCoMKgwqAgZm9yIChpID0gMDsgaSA8IGVudHJpZXM7IGkrKykKPj4gwqDC
oMKgwqDCoMKgwqDCoMKgIHRhcmdldF9tYXBbaV0gPSBja3B0X21hcFtpXSB8IGN1cl9tYXBbaV07
Cj4+ICt9Cj4+ICsKPj4gK3N0YXRpYyBpbnQgX19uZXh0X2ZyZWVfYmxrb2ZmKHN0cnVjdCBmMmZz
X3NiX2luZm8gKnNiaSwgdW5zaWduZWQgbG9uZyAqYml0bWFwLAo+PiArwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW50IHNlZ25vLCBibG9ja190IHN0YXJ0KQo+PiArewo+
PiArwqDCoMKgIF9fZ2V0X3NlZ21lbnRfYml0bWFwKHNiaSwgYml0bWFwLCBzZWdubyk7Cj4+IC3C
oMKgwqAgcmV0dXJuIF9fZmluZF9yZXZfbmV4dF96ZXJvX2JpdCh0YXJnZXRfbWFwLCBCTEtTX1BF
Ul9TRUcoc2JpKSwgc3RhcnQpOwo+PiArwqDCoMKgIHJldHVybiBfX2ZpbmRfcmV2X25leHRfemVy
b19iaXQoYml0bWFwLCBCTEtTX1BFUl9TRUcoc2JpKSwgc3RhcnQpOwo+PiDCoCB9Cj4+IMKgIHN0
YXRpYyBpbnQgZjJmc19maW5kX25leHRfc3NyX2Jsb2NrKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwKPj4gLcKgwqDCoMKgwqDCoMKgIHN0cnVjdCBjdXJzZWdfaW5mbyAqc2VnKQo+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGN1cnNlZ19pbmZvICpzZWcp
Cj4+IMKgIHsKPj4gLcKgwqDCoCByZXR1cm4gX19uZXh0X2ZyZWVfYmxrb2ZmKHNiaSwgc2VnLT5z
ZWdubywgc2VnLT5uZXh0X2Jsa29mZiArIDEpOwo+PiArwqDCoMKgIHJldHVybiBfX2ZpbmRfcmV2
X25leHRfemVyb19iaXQoc2VnLT50YXJnZXRfbWFwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEJMS1NfUEVSX1NFRyhzYmkpLCBzZWctPm5leHRfYmxrb2ZmICsgMSk7Cj4+IMKg
IH0KPj4gwqAgYm9vbCBmMmZzX3NlZ21lbnRfaGFzX2ZyZWVfc2xvdChzdHJ1Y3QgZjJmc19zYl9p
bmZvICpzYmksIGludCBzZWdubykKPj4gwqAgewo+PiAtwqDCoMKgIHJldHVybiBfX25leHRfZnJl
ZV9ibGtvZmYoc2JpLCBzZWdubywgMCkgPCBCTEtTX1BFUl9TRUcoc2JpKTsKPj4gK8KgwqDCoCBy
ZXR1cm4gX19uZXh0X2ZyZWVfYmxrb2ZmKHNiaSwgU0lUX0koc2JpKS0+dG1wX21hcCwgc2Vnbm8s
IDApIDwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBCTEtTX1BFUl9TRUcoc2JpKTsKPj4gwqAgfQo+PiDCoCAvKgo+PiBAQCAtMjg5MCw3
ICsyODk4LDggQEAgc3RhdGljIGludCBjaGFuZ2VfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSwgaW50IHR5cGUpCj4+IMKgwqDCoMKgwqAgcmVzZXRfY3Vyc2VnKHNiaSwgdHlwZSwgMSk7
Cj4+IMKgwqDCoMKgwqAgY3Vyc2VnLT5hbGxvY190eXBlID0gU1NSOwo+PiAtwqDCoMKgIGN1cnNl
Zy0+bmV4dF9ibGtvZmYgPSBfX25leHRfZnJlZV9ibGtvZmYoc2JpLCBjdXJzZWctPnNlZ25vLCAw
KTsKPj4gK8KgwqDCoCBjdXJzZWctPm5leHRfYmxrb2ZmID0gX19uZXh0X2ZyZWVfYmxrb2ZmKHNi
aSwgY3Vyc2VnLT50YXJnZXRfbWFwLAo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN1cnNlZy0+c2Vnbm8sIDApOwo+PiDCoMKgwqDCoMKg
IHN1bV9wYWdlID0gZjJmc19nZXRfc3VtX3BhZ2Uoc2JpLCBuZXdfc2Vnbm8pOwo+PiDCoMKgwqDC
oMKgIGlmIChJU19FUlIoc3VtX3BhZ2UpKSB7Cj4+IEBAIC00NjM1LDYgKzQ2NDQsMTAgQEAgc3Rh
dGljIGludCBidWlsZF9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVvZihzdHJ1Y3QgZjJmc19qb3VybmFsKSwg
R0ZQX0tFUk5FTCk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWFycmF5W2ldLmpvdXJuYWwp
Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+PiArwqDCoMKg
wqDCoMKgwqAgYXJyYXlbaV0udGFyZ2V0X21hcCA9IGYyZnNfa3phbGxvYyhzYmksIFNJVF9WQkxP
Q0tfTUFQX1NJWkUsCj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMKTsKPj4gK8KgwqDCoMKgwqDCoMKgIGlm
ICghYXJyYXlbaV0udGFyZ2V0X21hcCkKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FTk9NRU07Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaSA8IE5SX1BFUlNJU1RFTlRfTE9H
KQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBhcnJheVtpXS5zZWdfdHlwZSA9IENVUlNF
R19IT1RfREFUQSArIGk7Cj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBlbHNlIGlmIChpID09IENVUlNF
R19DT0xEX0RBVEFfUElOTkVEKQo+PiBAQCAtNTQ1Myw2ICs1NDY2LDcgQEAgc3RhdGljIHZvaWQg
ZGVzdHJveV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+PiDCoMKgwqDCoMKgIGZv
ciAoaSA9IDA7IGkgPCBOUl9DVVJTRUdfVFlQRTsgaSsrKSB7Cj4+IMKgwqDCoMKgwqDCoMKgwqDC
oCBrZnJlZShhcnJheVtpXS5zdW1fYmxrKTsKPj4gwqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKGFy
cmF5W2ldLmpvdXJuYWwpOwo+PiArwqDCoMKgwqDCoMKgwqAga2ZyZWUoYXJyYXlbaV0udGFyZ2V0
X21hcCk7Cj4+IMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgIGtmcmVlKGFycmF5KTsKPj4gwqAg
fQo+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmggYi9mcy9mMmZzL3NlZ21lbnQuaAo+
PiBpbmRleCBlMWMwZjQxOGFhMTEuLjEwZjNlNDRmMDM2ZiAxMDA2NDQKPj4gLS0tIGEvZnMvZjJm
cy9zZWdtZW50LmgKPj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmgKPj4gQEAgLTI5Miw2ICsyOTIs
NyBAQCBzdHJ1Y3QgY3Vyc2VnX2luZm8gewo+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3N1bW1h
cnlfYmxvY2sgKnN1bV9ibGs7wqDCoMKgIC8qIGNhY2hlZCBzdW1tYXJ5IGJsb2NrICovCj4+IMKg
wqDCoMKgwqAgc3RydWN0IHJ3X3NlbWFwaG9yZSBqb3VybmFsX3J3c2VtO8KgwqDCoCAvKiBwcm90
ZWN0IGpvdXJuYWwgYXJlYSAqLwo+PiDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX2pvdXJuYWwgKmpv
dXJuYWw7wqDCoMKgwqDCoMKgwqAgLyogY2FjaGVkIGpvdXJuYWwgaW5mbyAqLwo+PiArwqDCoMKg
IHVuc2lnbmVkIGxvbmcgKnRhcmdldF9tYXA7wqDCoMKgwqDCoMKgwqAgLyogYml0bWFwIGZvciBT
U1IgYWxsb2NhdG9yICovCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgY2hhciBhbGxvY190eXBlO8Kg
wqDCoMKgwqDCoMKgIC8qIGN1cnJlbnQgYWxsb2NhdGlvbiB0eXBlICovCj4+IMKgwqDCoMKgwqAg
dW5zaWduZWQgc2hvcnQgc2VnX3R5cGU7wqDCoMKgwqDCoMKgwqAgLyogc2VnbWVudCB0eXBlIGxp
a2UgQ1VSU0VHX1hYWF9UWVBFICovCj4+IMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IHNlZ25vO8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogY3VycmVudCBzZWdtZW50IG51bWJlciAqLwo+IAo+IAo+
IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xp
bnV4LWYyZnMtZGV2ZWwKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
