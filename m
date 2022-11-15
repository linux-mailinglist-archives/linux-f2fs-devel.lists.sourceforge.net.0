Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5578628F2A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Nov 2022 02:24:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oukgQ-0003ki-RK;
	Tue, 15 Nov 2022 01:24:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oukgQ-0003kc-2V
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 01:24:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tsonFvOS6RS1LC5pv3D8m58KLVJTIE3DCLY7yqwKmo8=; b=Ii/ihL+ogI3tSKVOxXb/Gsav+D
 JnPlMGEs08t7eDQx5kLPq3t9aKpIJ5IxZM4dItI9qzlSBu+tGhr8TxNwrT0OO5xbHYyUh3pt0L61b
 1YdHbjDJiqVumVhjCLP+DrBq5exCQSaojWt4U8bSH2Z1pnhDFDJGbIl11v3gOQaFbBm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tsonFvOS6RS1LC5pv3D8m58KLVJTIE3DCLY7yqwKmo8=; b=a6F5Zbu05b4HFx1kHy+uBsR8Mn
 rZMlyN8Z5o9BcNaOnUPmQ9aqUj5TmQSpDTSVEC+LlrSW73clbOVsuNd+WlGPUi9u0VhBG4aZGFR5B
 nNtZgWMj4+hCW/r+Zn/dVDo5da5vDNOtJKErz7gnb8s1Z5p5zcDdqKw+dqgBVsreo1xY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oukgP-008ZNR-21 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Nov 2022 01:24:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EA96BB8163C;
 Tue, 15 Nov 2022 01:24:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 628AAC433D6;
 Tue, 15 Nov 2022 01:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668475443;
 bh=OkqUrzgA922jHYY9nyFD/fx/9c8hDaSCvzWETiK5mt8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DL/FrX1UGUXe2nntIRUqsW4lY7h560UlQoioX1sAkLQuzDvVVP77mgBJ0CFIY2lrx
 pYHCVGunnhC4RV6dCnJW7OVCJIbaMw2QdetawxLW6CBlh0YFOgkaM6n5fNjtVigki5
 b0Z0GNOvLsdWJCPj3PCmcAOPQ926zuV48GkSL5rC9U9altzGCnTe1VOguRU9+n3YMY
 ReKESOO3FZU/eUwHdS1adEikkS2XcQHBK1swf06klj7cqxQ129dWV3xcGpW4/m7Ncv
 jx1rqoi/qrklCMS+0hRassoKSUP0+hQQ4yLmtoIz9ULWFpjRiCO4Swaye6LkqX3BYb
 xHfYnbKYdMfwg==
Message-ID: <29fa9df4-dc5f-a944-a150-68d34904cc91@kernel.org>
Date: Tue, 15 Nov 2022 09:23:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Yuwei Guan <ssawgyw@gmail.com>, jaegeuk@kernel.org
References: <20221112083250.295700-1-Yuwei.Guan@zeekrlife.com>
 <20221112083250.295700-2-Yuwei.Guan@zeekrlife.com>
 <983de611-a9e7-56d0-d375-f2b54e1f4d05@kernel.org>
 <7f221206-a29c-08ee-dfae-d4875bf7205d@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <7f221206-a29c-08ee-dfae-d4875bf7205d@gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/15 0:13, Yuwei Guan wrote: > > On 2022/11/14 22:42,
 Chao Yu wrote: >> On 2022/11/12 16:32,
 Yuwei Guan wrote: >>> The commit 84b89e5d943d8
 ("f2fs: add auto tuning for small devices") add >>> [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oukgP-008ZNR-21
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: fix to alloc_mode changed after
 remount on a small volume device
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

T24gMjAyMi8xMS8xNSAwOjEzLCBZdXdlaSBHdWFuIHdyb3RlOgo+IAo+IE9uIDIwMjIvMTEvMTQg
MjI6NDIsIENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjIvMTEvMTIgMTY6MzIsIFl1d2VpIEd1YW4g
d3JvdGU6Cj4+PiBUaGUgY29tbWl0IDg0Yjg5ZTVkOTQzZDggKCJmMmZzOiBhZGQgYXV0byB0dW5p
bmcgZm9yIHNtYWxsIGRldmljZXMiKSBhZGQKPj4+IHR1bmluZyBmb3Igc21hbGwgdm9sdW1lIGRl
dmljZSwgbm93IHN1cHBvcnQgdG8gdHVuZSBhbGxvY2VfbW9kZSB0byAncmV1c2UnCj4+PiBpZiBp
dCdzIHNtYWxsIHNpemUuIEJ1dCB0aGUgYWxsb2NfbW9kZSB3aWxsIGNoYW5nZSB0byAnZGVmYXVs
dCcgd2hlbiBkbwo+Pj4gcmVtb3VudCBvbiB0aGlzIHNtYWxsIHNpemUgZGlldmNlLgo+Pj4KPj4+
IFRoZSBjb21taXQgNGNhYzkwZDU0OTFjOSAoImYyZnM6IHJlbG9jYXRlIHJlYWRkaXJfcmEgY29u
ZmlndXJlCj4+PiBpbml0aWFsaXphdGlvbiIpIHJlbG9jYXRlcyByZWFkZGlyX3JhIHZhcmlhYmxl
IHRvIHR1bmluZyBwcm9jZXNzLgo+Pj4KPj4+IFRoaXMgcGF0Y2ggZm8gZml4IGFsbG9jX21vZGUg
Y2hhbmdlZCB3aGVuIGRvIHJlbW91bnQgZm9yIGEgc21hbGwgdm9sdW1lCj4+PiBkZXZpY2UuCj4+
Pgo+Pj4gRm9yIGEgc21hbGwgZGV2aWNlLAo+Pj4gLSBhbGxvY19tb2RlIHdpbGwga2VlcCAncmV1
c2UnLCBpZiBubyBhbGxvY19tb2RlIG9wdGlvbiBpbiByZW1vdW50Cj4+PiDCoMKgIGNvbW1hbmQs
Cj4+PiAtIGFsbG9jX21vZGUgd2lsbCBiZSBzZXQgYXMgcmVtb3VudCBjb21tYW5kLCBpZiBpdCBo
YXMgJ2FsbG9jX21vZGU9Jy4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZdXdlaSBHdWFuIDxZdXdl
aS5HdWFuQHplZWtybGlmZS5jb20+Cj4+PiAtLS0KPj4+IMKgIGZzL2YyZnMvc3VwZXIuYyB8IDM3
ICsrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tLS0KPj4+IMKgIDEgZmlsZSBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+PiBpbmRleCAzODM0ZWFkMDQ2
MjAuLjJmMzY4MjRmZjg0YiAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+Pj4gKysr
IGIvZnMvZjJmcy9zdXBlci5jCj4+PiBAQCAtMjE5MCw2ICsyMTkwLDIzIEBAIHN0YXRpYyB2b2lk
IGYyZnNfZW5hYmxlX2NoZWNrcG9pbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4gwqDC
oMKgwqDCoCBmMmZzX2ZsdXNoX2NrcHRfdGhyZWFkKHNiaSk7Cj4+PiDCoCB9Cj4+PiDCoCArc3Rh
dGljIHZvaWQgZjJmc190dW5pbmdfcGFyYW1ldGVycyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmks
IGJvb2wgaXNfcmVtb3VudCkKPj4+ICt7Cj4+PiArwqDCoMKgIHN0cnVjdCBmMmZzX3NtX2luZm8g
KnNtX2kgPSBTTV9JKHNiaSk7Cj4+PiArCj4+PiArwqDCoMKgIC8qIGFkanVzdCBwYXJhbWV0ZXJz
IGFjY29yZGluZyB0byB0aGUgdm9sdW1lIHNpemUgKi8KPj4+ICvCoMKgwqAgaWYgKHNtX2ktPm1h
aW5fc2VnbWVudHMgPD0gU01BTExfVk9MVU1FX1NFR01FTlRTKSB7Cj4+PiArwqDCoMKgwqDCoMKg
wqAgRjJGU19PUFRJT04oc2JpKS5hbGxvY19tb2RlID0gQUxMT0NfTU9ERV9SRVVTRTsKPj4KPj4g
SG93IGFib3V0IG1vdmluZyBhYm92ZSBsb2dpYyBpbnRvIGRlZmF1bHRfb3B0aW9ucygpPwo+Pgo+
IEhpIENoYW8sCj4gCj4gJ3NtX2ktPm1haW5fc2VnbWVudHMnIGluaXQgaW4gZnVuYyAnZjJmc19i
dWlsZF9zZWdtZW50X21hbmFnZXIoKScsCj4gCj4gd2hlbiBkbyBmaWxsIHN1cGVyIHByb2Nlc3Ms
IHNvIGl0IGNhbm5vdCBtb3ZlIGludG8gZGVmYXVsdF9vcHRpb25zKCkuCgpIb3cgYWJvdXQgY2hl
Y2tpbmcgbGUzMl90b19jcHUocmF3X3N1cGVyLT5zZWdtZW50X2NvdW50X21haW4pIGRpcmVjdGx5
PwoKVGhhbmtzLAoKPiAKPj4gVGhhbmtzLAo+Pgo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChmMmZz
X2Jsb2NrX3VuaXRfZGlzY2FyZChzYmkpKQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc21f
aS0+ZGNjX2luZm8tPmRpc2NhcmRfZ3JhbnVsYXJpdHkgPSAxOwo+Pj4gK8KgwqDCoMKgwqDCoMKg
IHNtX2ktPmlwdV9wb2xpY3kgPSAxIDw8IEYyRlNfSVBVX0ZPUkNFIHwKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAxIDw8IEYyRlNfSVBVX0hPTk9SX09QVV9XUklU
RTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDCoCBpZiAoIWlzX3JlbW91bnQpCj4+PiAr
wqDCoMKgwqDCoMKgwqAgc2JpLT5yZWFkZGlyX3JhID0gMTsKPj4+ICt9Cj4+PiArCj4+PiDCoCBz
dGF0aWMgaW50IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdz
LCBjaGFyICpkYXRhKQo+Pj4gwqAgewo+Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkgPSBGMkZTX1NCKHNiKTsKPj4+IEBAIC0yMjQ4LDYgKzIyNjUsOCBAQCBzdGF0aWMgaW50
IGYyZnNfcmVtb3VudChzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCBpbnQgKmZsYWdzLCBjaGFyICpk
YXRhKQo+Pj4gwqAgwqDCoMKgwqDCoCBkZWZhdWx0X29wdGlvbnMoc2JpKTsKPj4+IMKgICvCoMKg
wqAgZjJmc190dW5pbmdfcGFyYW1ldGVycyhzYmksIHRydWUpOwo+Pj4gKwo+Pj4gwqDCoMKgwqDC
oCAvKiBwYXJzZSBtb3VudCBvcHRpb25zICovCj4+PiDCoMKgwqDCoMKgIGVyciA9IHBhcnNlX29w
dGlvbnMoc2IsIGRhdGEsIHRydWUpOwo+Pj4gwqDCoMKgwqDCoCBpZiAoZXJyKQo+Pj4gQEAgLTQw
NTQsMjIgKzQwNzMsNiBAQCBzdGF0aWMgaW50IGYyZnNfc2V0dXBfY2FzZWZvbGQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKQo+Pj4gwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+IMKgIH0KPj4+IMKg
IC1zdGF0aWMgdm9pZCBmMmZzX3R1bmluZ19wYXJhbWV0ZXJzKHN0cnVjdCBmMmZzX3NiX2luZm8g
KnNiaSkKPj4+IC17Cj4+PiAtwqDCoMKgIHN0cnVjdCBmMmZzX3NtX2luZm8gKnNtX2kgPSBTTV9J
KHNiaSk7Cj4+PiAtCj4+PiAtwqDCoMKgIC8qIGFkanVzdCBwYXJhbWV0ZXJzIGFjY29yZGluZyB0
byB0aGUgdm9sdW1lIHNpemUgKi8KPj4+IC3CoMKgwqAgaWYgKHNtX2ktPm1haW5fc2VnbWVudHMg
PD0gU01BTExfVk9MVU1FX1NFR01FTlRTKSB7Cj4+PiAtwqDCoMKgwqDCoMKgwqAgRjJGU19PUFRJ
T04oc2JpKS5hbGxvY19tb2RlID0gQUxMT0NfTU9ERV9SRVVTRTsKPj4+IC3CoMKgwqDCoMKgwqDC
oCBpZiAoZjJmc19ibG9ja191bml0X2Rpc2NhcmQoc2JpKSkKPj4+IC3CoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHNtX2ktPmRjY19pbmZvLT5kaXNjYXJkX2dyYW51bGFyaXR5ID0gMTsKPj4+IC3CoMKg
wqDCoMKgwqDCoCBzbV9pLT5pcHVfcG9saWN5ID0gMSA8PCBGMkZTX0lQVV9GT1JDRSB8Cj4+PiAt
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgMSA8PCBGMkZTX0lQVV9IT05P
Ul9PUFVfV1JJVEU7Cj4+PiAtwqDCoMKgIH0KPj4+IC0KPj4+IC3CoMKgwqAgc2JpLT5yZWFkZGly
X3JhID0gMTsKPj4+IC19Cj4+PiAtCj4+PiDCoCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihz
dHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+Pj4gwqAgewo+
Pj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmk7Cj4+PiBAQCAtNDQ3NSw3ICs0
NDc4LDcgQEAgc3RhdGljIGludCBmMmZzX2ZpbGxfc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpz
Yiwgdm9pZCAqZGF0YSwgaW50IHNpbGVudCkKPj4+IMKgIMKgwqDCoMKgwqAgZjJmc19qb2luX3No
cmlua2VyKHNiaSk7Cj4+PiDCoCAtwqDCoMKgIGYyZnNfdHVuaW5nX3BhcmFtZXRlcnMoc2JpKTsK
Pj4+ICvCoMKgwqAgZjJmc190dW5pbmdfcGFyYW1ldGVycyhzYmksIGZhbHNlKTsKPj4+IMKgIMKg
wqDCoMKgwqAgZjJmc19ub3RpY2Uoc2JpLCAiTW91bnRlZCB3aXRoIGNoZWNrcG9pbnQgdmVyc2lv
biA9ICVsbHgiLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY3VyX2NwX3ZlcnNpb24o
RjJGU19DS1BUKHNiaSkpKTsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVs
QGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0
cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
