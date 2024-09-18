Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC2197B6C2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 04:17:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqkFv-0007xL-TZ;
	Wed, 18 Sep 2024 02:17:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sqkFu-0007xF-Sl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 02:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:To:From:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s5nPtapx/sx7Qpoc3gaTKxk0HulXFrLIoILHDqj4nmY=; b=UOR08AeG9EAfrKTf99oHMWMEuh
 ZdVMLDVlOocOx3EzNbN8fNEXKPJhTDv7E908ebFJMWrUQS3EDo+qQzeavzppnNrqWQUaJbUtBbKIC
 R/ykfZ/fji1ND/mLH5Jwnj7cW/ctsoMS+k7F1NKBuAhNMcdgCZ6ZVHrXxyhvtCOTv8ds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:To:From:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s5nPtapx/sx7Qpoc3gaTKxk0HulXFrLIoILHDqj4nmY=; b=NTGhm874xa9OGL6s2pOHq2cPX3
 OZ/vm1+ASY9biOehnim9Oytn1yv6EaC53y2irJCiiJVLnWjo5Su2n2WypgIjKlTt9lvTU2pWxQjTD
 Gu7U1x2IAmJPgdXhCtv28F3xr1W177C1uzY3KPUoQQOyMcJ0zN5/xZvcgxBxmnhET4Wg=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqkFt-0002HX-UN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 02:17:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 6517FA431DA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Sep 2024 02:17:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A03C4CEC5;
 Wed, 18 Sep 2024 02:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726625830;
 bh=96sNLHPtKJjpnFwcUjmF7eaeg2lVid3ev+H1R/IjA2Y=;
 h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
 b=q2RtnQL6dqB28kcDqbEDD7ZVlrOkug5tyOwtNuwazI9cnncghRYujM2FgxHNyBRP/
 Kyl8TmD5Rl1snHi9G/S7bh96BefUqNg6uXoXPjJpEiHTCenVbL086JFZM/vQN6xWI5
 AFmhXnHvy+rfCfre76/J+Jmt/GMDxBZy91INebA+tOnXMrIKkHwxbTFLcN/wxJC4L0
 IsS80ACWZbEtCgSFT2Sb6PbxNhEFeozrZxtisZI36g+K6cSmDWYiQVefmZwcoERiOt
 6cM79U6G0XBi10r/Rf4ZMa2mukvdC1tP/kGI15B+LFjgKmvKpsgvCPZd2gVE6RlfU6
 dLon9YRvq4hyw==
Message-ID: <5a15ae2c-28e3-4305-b010-83830ad68ff2@kernel.org>
Date: Wed, 18 Sep 2024 10:17:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240411082354.1691820-1-chao@kernel.org>
 <11d5d736-bae5-4a71-b400-087b8722893c@kernel.org>
 <03647897-8b1f-4c82-b2b6-0aa0704bed05@kernel.org>
 <ZlkOLN0BugwQ2p5p@google.com>
 <41187ebc-cfc5-49a5-93e8-0350d2686d42@kernel.org>
Content-Language: en-US
In-Reply-To: <41187ebc-cfc5-49a5-93e8-0350d2686d42@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/31 9:10, Chao Yu wrote: > On 2024/5/31 7:39,
 Jaegeuk
 Kim wrote: >> On 05/29, Chao Yu wrote: >>> Ping, > > Jaegeuk, > >> >> Chao,
 sorry, I might need some time to take a look at the change ca [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sqkFt-0002HX-UN
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC81LzMxIDk6MTAsIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNC81LzMxIDc6MzksIEph
ZWdldWsgS2ltIHdyb3RlOgo+PiBPbiAwNS8yOSwgQ2hhbyBZdSB3cm90ZToKPj4+IFBpbmcsCj4g
Cj4gSmFlZ2V1aywKPiAKPj4KPj4gQ2hhbywgc29ycnksIEkgbWlnaHQgbmVlZCBzb21lIHRpbWUg
dG8gdGFrZSBhIGxvb2sgYXQgdGhlIGNoYW5nZSBjYXV0aW91c2x5Lgo+IAo+IE5vIHByb2JsZW0s
IEkndmUgZG9uZSBzb21lIHRlc3RzIG9uIHRoaXMgcGF0Y2gsIHRob3VnaCwgSSB3aWxsIGtlZXBp
bmcgdGhpcyBpbgo+IG15IHF1ZXVlLCBhbmQgZG8gdGVzdCBiYXNlIG9uIHRoZSBxdWV1ZSB3aGVu
ZXZlciBpdCBjb21lcyBuZXcgcGF0Y2hlcy4KCkphZWdldWssCgpBbnkgcHJvZ3Jlc3Mgb24gdGhp
cyBwYXRjaHNldD8KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IAo+Pgo+Pj4KPj4+IE9uIDIwMjQv
NC8yMyAxMDowNywgQ2hhbyBZdSB3cm90ZToKPj4+PiBKYWVnZXVrLCBhbnkgY29tbWVudHMgZm9y
IHRoaXMgc2VyaWFscz8KPj4+Pgo+Pj4+IE9uIDIwMjQvNC8xMSAxNjoyMywgQ2hhbyBZdSB3cm90
ZToKPj4+Pj4gQWZ0ZXIgY29tbWl0IDg5OWZlZTM2ZmFjMCAoImYyZnM6IGZpeCB0byBhdm9pZCBk
YXRhIGNvcnJ1cHRpb24gYnkKPj4+Pj4gZm9yYmlkZGluZyBTU1Igb3ZlcndyaXRlIiksIHZhbGlk
IGJsb2NrIGJpdG1hcCBvZiBjdXJyZW50IG9wZW5uZWQKPj4+Pj4gc2VnbWVudCBpcyBmaXhlZCwg
bGV0J3MgaW50cm9kdWNlIGEgcGVyLWxvZyBiaXRtYXAgaW5zdGVhZCBvZiB0ZW1wCj4+Pj4+IGJp
dG1hcCB0byBhdm9pZCB1bm5lY2Vzc2FyeSBjYWxjdWxhdGlvbiBvdmVyaGVhZCB3aGVuZXZlciBh
bGxvY2F0aW5nCj4+Pj4+IGZyZWUgc2xvdCB3LyBTU1IgYWxsb2NhdG9yLgo+Pj4+Pgo+Pj4+PiBT
aWduZWQtb2ZmLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+Cj4+Pj4+IC0tLQo+Pj4+PiB2
MjoKPj4+Pj4gLSByZWJhc2UgdG8gbGFzdCBkZXYtdGVzdCBicmFuY2guCj4+Pj4+IMKgwqAgZnMv
ZjJmcy9zZWdtZW50LmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0KPj4+Pj4g
wqDCoCBmcy9mMmZzL3NlZ21lbnQuaCB8wqAgMSArCj4+Pj4+IMKgwqAgMiBmaWxlcyBjaGFuZ2Vk
LCAyMyBpbnNlcnRpb25zKCspLCA4IGRlbGV0aW9ucygtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0
IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYwo+Pj4+PiBpbmRleCA2NDc0
YjczMzhlODEuLmFmNzE2OTI1ZGIxOSAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9zZWdtZW50
LmMKPj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4gQEAgLTI4NDAsMzEgKzI4NDAs
MzkgQEAgc3RhdGljIGludCBuZXdfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50
IHR5cGUsIGJvb2wgbmV3X3NlYykKPj4+Pj4gwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+PiDC
oMKgIH0KPj4+Pj4gLXN0YXRpYyBpbnQgX19uZXh0X2ZyZWVfYmxrb2ZmKHN0cnVjdCBmMmZzX3Ni
X2luZm8gKnNiaSwKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGludCBzZWdubywgYmxvY2tfdCBzdGFydCkKPj4+Pj4gK3N0YXRpYyB2b2lkIF9fZ2V0X3NlZ21l
bnRfYml0bWFwKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgKnRhcmdldF9tYXAsCj4+Pj4+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbnQgc2Vnbm8pCj4+Pj4+
IMKgwqAgewo+Pj4+PiDCoMKgwqDCoMKgwqAgc3RydWN0IHNlZ19lbnRyeSAqc2UgPSBnZXRfc2Vn
X2VudHJ5KHNiaSwgc2Vnbm8pOwo+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IGVudHJpZXMgPSBTSVRf
VkJMT0NLX01BUF9TSVpFIC8gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpOwo+Pj4+PiAtwqDCoMKgIHVu
c2lnbmVkIGxvbmcgKnRhcmdldF9tYXAgPSBTSVRfSShzYmkpLT50bXBfbWFwOwo+Pj4+PiDCoMKg
wqDCoMKgwqAgdW5zaWduZWQgbG9uZyAqY2twdF9tYXAgPSAodW5zaWduZWQgbG9uZyAqKXNlLT5j
a3B0X3ZhbGlkX21hcDsKPj4+Pj4gwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcgKmN1cl9tYXAg
PSAodW5zaWduZWQgbG9uZyAqKXNlLT5jdXJfdmFsaWRfbWFwOwo+Pj4+PiDCoMKgwqDCoMKgwqAg
aW50IGk7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBmb3IgKGkgPSAwOyBpIDwgZW50cmllczsgaSsrKQo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCB0YXJnZXRfbWFwW2ldID0gY2twdF9tYXBbaV0gfCBj
dXJfbWFwW2ldOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgaW50IF9fbmV4dF9mcmVl
X2Jsa29mZihzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIHVuc2lnbmVkIGxvbmcgKmJpdG1hcCwK
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCBzZWdubywg
YmxvY2tfdCBzdGFydCkKPj4+Pj4gK3sKPj4+Pj4gK8KgwqDCoCBfX2dldF9zZWdtZW50X2JpdG1h
cChzYmksIGJpdG1hcCwgc2Vnbm8pOwo+Pj4+PiAtwqDCoMKgIHJldHVybiBfX2ZpbmRfcmV2X25l
eHRfemVyb19iaXQodGFyZ2V0X21hcCwgQkxLU19QRVJfU0VHKHNiaSksIHN0YXJ0KTsKPj4+Pj4g
K8KgwqDCoCByZXR1cm4gX19maW5kX3Jldl9uZXh0X3plcm9fYml0KGJpdG1hcCwgQkxLU19QRVJf
U0VHKHNiaSksIHN0YXJ0KTsKPj4+Pj4gwqDCoCB9Cj4+Pj4+IMKgwqAgc3RhdGljIGludCBmMmZz
X2ZpbmRfbmV4dF9zc3JfYmxvY2soc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4+PiAtwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGN1cnNlZ19pbmZvICpzZWcpCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgY3Vyc2VnX2luZm8gKnNlZykKPj4+Pj4g
wqDCoCB7Cj4+Pj4+IC3CoMKgwqAgcmV0dXJuIF9fbmV4dF9mcmVlX2Jsa29mZihzYmksIHNlZy0+
c2Vnbm8sIHNlZy0+bmV4dF9ibGtvZmYgKyAxKTsKPj4+Pj4gK8KgwqDCoCByZXR1cm4gX19maW5k
X3Jldl9uZXh0X3plcm9fYml0KHNlZy0+dGFyZ2V0X21hcCwKPj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBCTEtTX1BFUl9TRUcoc2JpKSwgc2VnLT5uZXh0X2Jsa29mZiArIDEp
Owo+Pj4+PiDCoMKgIH0KPj4+Pj4gwqDCoCBib29sIGYyZnNfc2VnbWVudF9oYXNfZnJlZV9zbG90
KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50IHNlZ25vKQo+Pj4+PiDCoMKgIHsKPj4+Pj4g
LcKgwqDCoCByZXR1cm4gX19uZXh0X2ZyZWVfYmxrb2ZmKHNiaSwgc2Vnbm8sIDApIDwgQkxLU19Q
RVJfU0VHKHNiaSk7Cj4+Pj4+ICvCoMKgwqAgcmV0dXJuIF9fbmV4dF9mcmVlX2Jsa29mZihzYmks
IFNJVF9JKHNiaSktPnRtcF9tYXAsIHNlZ25vLCAwKSA8Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQkxLU19QRVJfU0VHKHNiaSk7
Cj4+Pj4+IMKgwqAgfQo+Pj4+PiDCoMKgIC8qCj4+Pj4+IEBAIC0yODkwLDcgKzI4OTgsOCBAQCBz
dGF0aWMgaW50IGNoYW5nZV9jdXJzZWcoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgdHlw
ZSkKPj4+Pj4gwqDCoMKgwqDCoMKgIHJlc2V0X2N1cnNlZyhzYmksIHR5cGUsIDEpOwo+Pj4+PiDC
oMKgwqDCoMKgwqAgY3Vyc2VnLT5hbGxvY190eXBlID0gU1NSOwo+Pj4+PiAtwqDCoMKgIGN1cnNl
Zy0+bmV4dF9ibGtvZmYgPSBfX25leHRfZnJlZV9ibGtvZmYoc2JpLCBjdXJzZWctPnNlZ25vLCAw
KTsKPj4+Pj4gK8KgwqDCoCBjdXJzZWctPm5leHRfYmxrb2ZmID0gX19uZXh0X2ZyZWVfYmxrb2Zm
KHNiaSwgY3Vyc2VnLT50YXJnZXRfbWFwLAo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGN1cnNlZy0+c2Vnbm8sIDApOwo+Pj4+PiDC
oMKgwqDCoMKgwqAgc3VtX3BhZ2UgPSBmMmZzX2dldF9zdW1fcGFnZShzYmksIG5ld19zZWdubyk7
Cj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKHN1bV9wYWdlKSkgewo+Pj4+PiBAQCAtNDYz
NSw2ICs0NjQ0LDEwIEBAIHN0YXRpYyBpbnQgYnVpbGRfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2lu
Zm8gKnNiaSkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNpemVv
ZihzdHJ1Y3QgZjJmc19qb3VybmFsKSwgR0ZQX0tFUk5FTCk7Cj4+Pj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGlmICghYXJyYXlbaV0uam91cm5hbCkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVOT01FTTsKPj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGFycmF5W2ldLnRh
cmdldF9tYXAgPSBmMmZzX2t6YWxsb2Moc2JpLCBTSVRfVkJMT0NLX01BUF9TSVpFLAo+Pj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgR0ZQX0tFUk5FTCk7Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoIWFycmF5W2ldLnRh
cmdldF9tYXApCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU5PTUVNOwo+
Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoaSA8IE5SX1BFUlNJU1RFTlRfTE9HKQo+Pj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFycmF5W2ldLnNlZ190eXBlID0gQ1VSU0VH
X0hPVF9EQVRBICsgaTsKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoaSA9PSBD
VVJTRUdfQ09MRF9EQVRBX1BJTk5FRCkKPj4+Pj4gQEAgLTU0NTMsNiArNTQ2Niw3IEBAIHN0YXRp
YyB2b2lkIGRlc3Ryb3lfY3Vyc2VnKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkKPj4+Pj4gwqDC
oMKgwqDCoMKgIGZvciAoaSA9IDA7IGkgPCBOUl9DVVJTRUdfVFlQRTsgaSsrKSB7Cj4+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGtmcmVlKGFycmF5W2ldLnN1bV9ibGspOwo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBrZnJlZShhcnJheVtpXS5qb3VybmFsKTsKPj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGtmcmVlKGFycmF5W2ldLnRhcmdldF9tYXApOwo+Pj4+PiDCoMKgwqDCoMKgwqAgfQo+Pj4+
PiDCoMKgwqDCoMKgwqAga2ZyZWUoYXJyYXkpOwo+Pj4+PiDCoMKgIH0KPj4+Pj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvc2VnbWVudC5oIGIvZnMvZjJmcy9zZWdtZW50LmgKPj4+Pj4gaW5kZXggZTFj
MGY0MThhYTExLi4xMGYzZTQ0ZjAzNmYgMTAwNjQ0Cj4+Pj4+IC0tLSBhL2ZzL2YyZnMvc2VnbWVu
dC5oCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5oCj4+Pj4+IEBAIC0yOTIsNiArMjkyLDcg
QEAgc3RydWN0IGN1cnNlZ19pbmZvIHsKPj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3N1
bW1hcnlfYmxvY2sgKnN1bV9ibGs7wqDCoMKgIC8qIGNhY2hlZCBzdW1tYXJ5IGJsb2NrICovCj4+
Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3Qgcndfc2VtYXBob3JlIGpvdXJuYWxfcndzZW07wqDCoMKg
IC8qIHByb3RlY3Qgam91cm5hbCBhcmVhICovCj4+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJm
c19qb3VybmFsICpqb3VybmFsO8KgwqDCoMKgwqDCoMKgIC8qIGNhY2hlZCBqb3VybmFsIGluZm8g
Ki8KPj4+Pj4gK8KgwqDCoCB1bnNpZ25lZCBsb25nICp0YXJnZXRfbWFwO8KgwqDCoMKgwqDCoMKg
IC8qIGJpdG1hcCBmb3IgU1NSIGFsbG9jYXRvciAqLwo+Pj4+PiDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgY2hhciBhbGxvY190eXBlO8KgwqDCoMKgwqDCoMKgIC8qIGN1cnJlbnQgYWxsb2NhdGlvbiB0
eXBlICovCj4+Pj4+IMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBzaG9ydCBzZWdfdHlwZTvCoMKgwqDC
oMKgwqDCoCAvKiBzZWdtZW50IHR5cGUgbGlrZSBDVVJTRUdfWFhYX1RZUEUgKi8KPj4+Pj4gwqDC
oMKgwqDCoMKgIHVuc2lnbmVkIGludCBzZWdubzvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIGN1
cnJlbnQgc2VnbWVudCBudW1iZXIgKi8KPj4+Pgo+Pj4+Cj4+Pj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdAo+Pj4+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4g
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo+IAo+IAo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgt
ZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
