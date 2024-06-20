Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7770790FDAD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2024 09:27:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sKCCc-0005Ph-O2;
	Thu, 20 Jun 2024 07:27:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sKCCa-0005PX-T5
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 07:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CLGoXzWdwBG2bv9IBKdwoUrFlSI2FMm3YaWHcRkAaf4=; b=HPL63pKSkc9skwZmEWrDqebf7o
 kVmSgVeEq/l6PGGFdNQlbh3eXLj3UOPdz5Y/6OR/3S4M2lva1AIIrpZC8cEx0qAK1y6DOgMUWrrVz
 uqsjBGyj9RZc+hRv4ugJe3toRzjd8I7CfCEaMMDl7t4UiID2pl0BsOdCdKDTNSySOW+I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CLGoXzWdwBG2bv9IBKdwoUrFlSI2FMm3YaWHcRkAaf4=; b=TY6p8KQiRzX+YG9fQMboReVL1k
 3GyzWQBAsVab2sQ/WB2T5l1bMlSBW01Fyx/8KUwqp175kQiHQ1pVklrvRfFTgpHvXcpMDmpBGa+CG
 8IzHQBoCS9mQ2B+TmVx52/pXl4Ld1NL0sUhRTSFUfjv9wWXRS4z9dJ57REhkQaltFlXo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sKCCc-0007dY-1H for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jun 2024 07:27:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id E61A061DF0;
 Thu, 20 Jun 2024 07:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34303C2BD10;
 Thu, 20 Jun 2024 07:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718868434;
 bh=CY+mRGNDq8rdR0CzZNFjbj7kad13ZCd0sT3y0g/8Pgs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fQP1gFIn9YhJ8cBdijzEsehb84fwwpmWAsPuXehzXJlTCq/o19FAw+ZS8WOcDLzYa
 hqF/9OPpQaOUXzSmXmnXUSlMu9qBiVLjmUApL1JEXbHLMtE88y35iakZbrBX7Sa5Qu
 /k+ptp5anlyiwYNSFHyboUxxlOFYqGj/kqjA/od31NkwlJXWASopq2B4XsmlzCWW7H
 QvMExtedtw4vfsssbGJCCWSqSJYirr7+4/g4H10Ylcta00XlOmyJQZTGDXkZN0HNsc
 eaoqCZE4y84j4nVLUHN6WAsxDmmkOEzxwfrcGQYgsMV9wfKPVQpt2aNrT5TaWT3nBK
 Lwl3R+rUH+MQw==
Message-ID: <e0d89f10-19b0-45db-948d-4c140c2dffa7@kernel.org>
Date: Thu, 20 Jun 2024 15:27:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 Wenjie Cheng <cwjhust@gmail.com>
References: <e2371e59-7be5-40dc-9a2a-aef90ac93b18@kernel.org>
 <2842767c-db80-407b-a5e5-2b9fa74b0d79@kernel.org>
 <20240614004841.103114-1-cwjhust@gmail.com>
 <20240620055648epcms2p11b9914d40f560fb02fa241a7d2599298@epcms2p1>
 <CGME20240620032223epcas2p4d6b770a8e256d140e5296df8a386418e@epcms2p1>
 <20240620072218epcms2p11597e482b28804dd5f66b9d42a21b22f@epcms2p1>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240620072218epcms2p11597e482b28804dd5f66b9d42a21b22f@epcms2p1>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/20 15:22, Daejun Park wrote: >> On 2024/6/20 13:56,
 Daejun Park wrote: >>> Hi Chao, >>> >>>> Jaegeuk, >>>> >>>> Quoted commit
 message from commit c550e25bca66 ("f2fs: use flush command >>>> [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sKCCc-0007dY-1H
Subject: Re: [f2fs-dev] (2) (2) [PATCH] Revert "f2fs: use flush command
 instead of FUA for zoned device"
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
Cc: "qwjhust@gmail.com" <qwjhust@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC82LzIwIDE1OjIyLCBEYWVqdW4gUGFyayB3cm90ZToKPj4gT24gMjAyNC82LzIwIDEz
OjU2LCBEYWVqdW4gUGFyayB3cm90ZToKPj4+IEhpIENoYW8sCj4+Pgo+Pj4+IEphZWdldWssCj4+
Pj4KPj4+PiBRdW90ZWQgY29tbWl0IG1lc3NhZ2UgZnJvbSBjb21taXQgYzU1MGUyNWJjYTY2ICgi
ZjJmczogdXNlIGZsdXNoIGNvbW1hbmQKPj4+PiBpbnN0ZWFkIG9mIEZVQSBmb3Igem9uZWQgZGV2
aWNlIikKPj4+PiAiCj4+Pj4gVGhlIGJsb2NrIGxheWVyIGZvciB6b25lZCBkaXNrIGNhbiByZW9y
ZGVyIHRoZSBGVUEnZWQgSU9zLiBMZXQncyB1c2UgZmx1c2gKPj4+PiBjb21tYW5kIHRvIGtlZXAg
dGhlIHdyaXRlIG9yZGVyLgo+Pj4+ICIKPj4+Pgo+Pj4+IEl0IHNlZW1zIG1xLWRlYWRsaW5lIHVz
ZSBmaWZvIHF1ZXVlIGFuZCBtYWtlIHF1ZXVlIGRlcHRoIG9mIHpvbmUgZGV2aWNlCj4+Pj4gYXMg
MSB0byBJTyBvcmRlciwgc28gd2h5IEZVQSdlZCB3cml0ZSBub2RlIElPcyBjYW4gYmUgcmVvcmRl
cmVkIGJ5IGJsb2NrCj4+Pj4gbGF5ZXI/Cj4+Pgo+Pj4gV2hpbGUgb3RoZXIgd3JpdGVzIGFyZSBh
bGlnbmVkIGJ5IHRoZSBtcS1kZWFkbGluZSwgd3JpdGUgd2l0aCBGVUEgaXMgbm90IHBhc3NlZAo+
Pj4gdG8gdGhlIHNjaGVkdWxlciBidXQgaGFuZGxlZCBhdCB0aGUgYmxvY2sgbGF5ZXIuCj4+Cj4+
IEhpIERhZWp1biwKPj4KPj4gSUlVQywgZG8geW91IG1lYW4gd3JpdGUgdy8gRlVBIG1heSBiZSBo
YW5kbGVkIGRpcmVjdGx5IGluIGJlbG93IHBhdGg/Cj4+Cj4+IC0gYmxrX21xX3N1Ym1pdF9iaW8K
Pj4gIMKgIC0gb3BfaXNfZmx1c2ggJiYgYmxrX2luc2VydF9mbHVzaAo+IAo+IEhpIENoYW8sCj4g
Cj4gWWVzLCBJIHRoaW5rIHRoZSBwYXRoIGNhdXNlZCBhbiB1bmFsaWduZWQgd3JpdGUgd2hlbiB0
aGUgem9uZSBsb2NrIHdhcwo+IGJlaW5nIGFwcGxpZWQgYnkgbXEtZGVhZGxpbmUuCgpCdXQsIGJs
a19pbnNlcnRfZmx1c2goKSBtYXkgcmV0dXJuIGZhbHNlIGR1ZSB0byBwb2xpY3kgc2hvdWxkIGJl
ClJFUV9GU0VRX0RBVEEgb3IgUkVRX0ZTRVFfREFUQSB8IFJFUV9GU0VRX1BPU1RGTFVTSCwgdGhl
bgpibGtfbXFfaW5zZXJ0X3JlcXVlc3QoKSBhZnRlciBibGtfaW5zZXJ0X2ZsdXNoKCkgd2lsbCBi
ZSBjYWxsZWQ/CgpUaGFua3MsCgo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+
Pj4gRGFlanVuCj4+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4gT24gMjAyNC82LzE0IDg6
NDgsIFdlbmppZSBDaGVuZyB3cm90ZToKPj4+Pj4gVGhpcyByZXZlcnRzIGNvbW1pdCBjNTUwZTI1
YmNhNjYwZWQyNTU0Y2JiNDhkMzJiODJkMGJiOThlNGIxLgo+Pj4+Pgo+Pj4+PiBDb21taXQgYzU1
MGUyNWJjYTY2MGVkMjU1NGNiYjQ4ZDMyYjgyZDBiYjk4ZTRiMSAoImYyZnM6IHVzZSBmbHVzaAo+
Pj4+PiBjb21tYW5kIGluc3RlYWQgb2YgRlVBIGZvciB6b25lZCBkZXZpY2UiKSB1c2VkIGFkZGl0
aW9uYWwgZmx1c2gKPj4+Pj4gY29tbWFuZCB0byBrZWVwIHdyaXRlIG9yZGVyLgo+Pj4+Pgo+Pj4+
PiBTaW5jZSBDb21taXQgZGQyOTFkNzdjYzkwZWI2YTg2ZTk4NjBiYThlNmUzOGVlYmQ1N2QxMiAo
ImJsb2NrOgo+Pj4+PiBJbnRyb2R1Y2Ugem9uZSB3cml0ZSBwbHVnZ2luZyIpIGhhcyBlbmFibGVk
IHRoZSBibG9jayBsYXllciB0bwo+Pj4+PiBoYW5kbGUgdGhpcyBvcmRlciBpc3N1ZSwgdGhlcmUg
aXMgbm8gbmVlZCB0byB1c2UgZmx1c2ggY29tbWFuZC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogV2VuamllIENoZW5nIDxjd2podXN0QGdtYWlsLmNvbT4KPj4+Pj4gLS0tCj4+Pj4+ICDCoCDC
oCBmcy9mMmZzL2ZpbGUuYyAzICstLQo+Pj4+PiAgwqAgwqAgZnMvZjJmcy9ub2RlLmMgMiArLQo+
Pj4+PiAgwqAgwqAgMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2ZpbGUuYyBiL2ZzL2YyZnMvZmls
ZS5jCj4+Pj4+IGluZGV4IGVhZTJlNzkwODA3Mi4uZjA4ZTYyMDhlMTgzIDEwMDY0NAo+Pj4+PiAt
LS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4+PiArKysgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+PiBAQCAt
MzcyLDggKzM3Miw3IEBAIHN0YXRpYyBpbnQgZjJmc19kb19zeW5jX2ZpbGUoc3RydWN0IGZpbGUg
KmZpbGUsIGxvZmZfdCBzdGFydCwgbG9mZl90IGVuZCwKPj4+Pj4gIMKgIMKgIMKgIMKgIMKgIMKg
IMKgZjJmc19yZW1vdmVfaW5vX2VudHJ5KHNiaSwgaW5vLCBBUFBFTkRfSU5PKTsKPj4+Pj4gIMKg
IMKgIMKgIMKgIMKgIMKgIMKgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVBQRU5EX1dSSVRF
KTsKPj4+Pj4gIMKgIMKgIGZsdXNoX291dDoKPj4+Pj4gLSDCoCDCoCDCoCDCoGlmICgoIWF0b21p
YyAmJiBGMkZTX09QVElPTihzYmkpLmZzeW5jX21vZGUgIT0gRlNZTkNfTU9ERV9OT0JBUlJJRVIp
Cj4+Pj4+IC0gwqAgwqAgwqAgwqDCoCDCoCAoYXRvbWljICYmICF0ZXN0X29wdChzYmksIE5PQkFS
UklFUikgJiYgZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkpCj4+Pj4+ICsgwqAgwqAgwqAgwqBp
ZiAoIWF0b21pYyAmJiBGMkZTX09QVElPTihzYmkpLmZzeW5jX21vZGUgIT0gRlNZTkNfTU9ERV9O
T0JBUlJJRVIpCj4+Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldCA9IGYy
ZnNfaXNzdWVfZmx1c2goc2JpLCBpbm9kZS0+aV9pbm8pOwo+Pj4+PiAgwqAgwqAgwqAgwqAgwqAg
wqAgwqBpZiAoIXJldCkgewo+Pj4+PiAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBm
MmZzX3JlbW92ZV9pbm9fZW50cnkoc2JpLCBpbm8sIFVQREFURV9JTk8pOwo+Pj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+Pj4+PiBpbmRleCAxNDRmOWY5
NjY2OTAuLmM0NWQzNDFkY2Y2ZSAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4+
Pj4gKysrIGIvZnMvZjJmcy9ub2RlLmMKPj4+Pj4gQEAgLTE2MzEsNyArMTYzMSw3IEBAIHN0YXRp
YyBpbnQgX193cml0ZV9ub2RlX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UsIGJvb2wgYXRvbWljLCBi
b29sICpzdWJtaXR0ZWQsCj4+Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGdv
dG8gcmVkaXJ0eV9vdXQ7Cj4+Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoH0KPj4+Pj4gICAKPj4+
Pj4gLSDCoCDCoCDCoCDCoGlmIChhdG9taWMgJiYgIXRlc3Rfb3B0KHNiaSwgTk9CQVJSSUVSKSAm
JiAhZjJmc19zYl9oYXNfYmxrem9uZWQoc2JpKSkKPj4+Pj4gKyDCoCDCoCDCoCDCoGlmIChhdG9t
aWMgJiYgIXRlc3Rfb3B0KHNiaSwgTk9CQVJSSUVSKSkKPj4+Pj4gIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgZmlvLm9wX2ZsYWdzID0gUkVRX1BSRUZMVVNIIFJFUV9GVUE7Cj4+Pj4+
ICAgCj4+Pj4+ICDCoCDCoCDCoCDCoCDCoCDCoCDCoC8qIHNob3VsZCBhZGQgdG8gZ2xvYmFsIGxp
c3QgYmVmb3JlIGNsZWFyaW5nIFBBR0VDQUNIRSBzdGF0dXMgKi8KCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
