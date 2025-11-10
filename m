Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82605C45A7B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 10:33:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L+0WJ3ychlMaCDUVeNZ9aKMIUQHMTCAWxupP6mhv/O4=; b=apupkh2EK7uUFzS5cj4RGpcK84
	PUy3YqpkeEv7K5Re3nTD6oW1iILg+pBBiDQKiFI4YkWVpzxQ7EWeaiqSIIvLgRIvmgOP4PinHl0TL
	xpvukDlLVPc0LVj4zIWDNj5SUVRY/emMRsECIao/o0EVE1E1yEI73vBNvegAWVyhTSfE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIOGk-00065P-8q;
	Mon, 10 Nov 2025 09:33:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vIOGi-00065A-Rq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:33:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1xnNjnKqlsO9EhxIuSqjGbUDjzuwV1/KUg0QJR8JD4A=; b=L7Ok5SQkXnHeQs6t/tKJVDUckL
 2A+6PZZZztf1x6Ucgx9GsdFtuqpsDkeGlh5MxsiJeDKY61ePe+l5Ft25+I2ERSaUVo82+l0U1MoqP
 7XxX4jYp8nNw27e77IW+EsOUTs5J8rbCCVfye3DuHXraD0V8a8hmepFQaRFApDHJKKO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1xnNjnKqlsO9EhxIuSqjGbUDjzuwV1/KUg0QJR8JD4A=; b=CRqvNLfUGfw1wE7I/YKhBelKWa
 mTG7XXAaMbZD02ttgLAoBqgB/OBvCO/22pykJilKZkEjkbJP9ypy9R11eruHL43Qasf/1Ra6laODs
 GpE/AQbdlOcwtTckviO7tK8pahLFSv3+KAKERXobUAO0ggPeSzMXl4+bb0BvvE6iiy6E=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIOGi-0005D8-46 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 09:33:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 669E2601A4;
 Mon, 10 Nov 2025 09:32:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2A91C116D0;
 Mon, 10 Nov 2025 09:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762767169;
 bh=hAAGwCknBPak54FTiOuOZSVt73rRWEfuNcabJVZ3U+c=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qVWud4lVOz7rXump49K2C3+aT7kR7tN8WCF0F/23NnOWsqAe4xOZG8PQ0ds/vjgvs
 z9kNhQn7dv0+DFowBfsjcdPYs4Wwb9iUSnBTXT6sZPCvYC8PaZIZdfO4LDql5FQF+W
 hQ5xpXQ10Gw9yyBkmLLXeLJJ7onXOdaYTI0xZG6p7XZQlU1kw/m2qeilUVoQ1giVNy
 +DTcr7gH9posiL7CAVcoqZofzormF/qkaKOHJIbpAlTMFZU2XcjJJFLU0GEtdI4VN4
 SGXqxieghRwFwIWEMKd3Ib92JBqjnP968BaSr+NZqAqWaHn9O98erO8ypgRKiBKXcC
 12Syl2fS2Qhzw==
Message-ID: <128fd300-d2d1-4169-a86f-a0babb47101b@kernel.org>
Date: Mon, 10 Nov 2025 17:32:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Yunlei He <heyunlei1988@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
 <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
 <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
Content-Language: en-US
In-Reply-To: <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/10/25 17:20, Yongpeng Yang wrote: > On 11/8/25 11:11, 
 Chao Yu via Linux-f2fs-devel wrote: >> Yunlei, >> >> On 2025/11/7 14:29,
 Yunlei He wrote: >>> From: Yunlei He <heyunlei@xiaomi.com> >>> >>> [...] 
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
X-Headers-End: 1vIOGi-0005D8-46
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMTAvMjUgMTc6MjAsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gT24gMTEvOC8yNSAxMTox
MSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gWXVubGVpLAo+Pgo+PiBP
biAyMDI1LzExLzcgMTQ6MjksIFl1bmxlaSBIZSB3cm90ZToKPj4+IEZyb206IFl1bmxlaSBIZSA8
aGV5dW5sZWlAeGlhb21pLmNvbT4KPj4+Cj4+PiBHQyBtb3ZlIGZiZSBkYXRhIGJsb2NrIHdpbGwg
YWRkIHNvbWUgbm9uIHVwdG9kYXRlIHBhZ2UsIHdlJ2QKPj4+IGJldHRlciByZWxlYXNlIGl0IGF0
IHRoZSBlbmQuCj4+Cj4+IFRoaXMgaXMganVzdCBmb3Igc2F2aW5nIG1lbW9yeSwgcmlnaHQ/Cj4+
Cj4gCj4gWWVzLCBtb3ZlX2RhdGFfYmxvY2soKSBkb2VzbuKAmXQgcmVhZCBhbnkgZGF0YSB0byBm
b2xpbywgYW5kIHRoZSBHQwo+IHVzdWFsbHkgc2VsZWN0cyBjb2xkIGRhdGEuIFRoZXJlZm9yZSwg
dGhpcyBmb2xpbyBpcyB0eXBpY2FsbHkgbm90Cj4gdXB0b2RhdGUsIGFuZCB0aGVyZeKAmXMgbm8g
bmVlZCBmb3IgaXQgdG8gb2NjdXB5IHRoZSBwYWdlIGNhY2hlLgo+IAo+Pj4KPj4+IFNpZ25lZC1v
ZmYtYnk6IFl1bmxlaSBIZSA8aGV5dW5sZWlAeGlhb21pLmNvbT4KPj4+IFNpZ25lZC1vZmYtYnk6
IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4gLS0tCj4+PiDCoCBm
cy9mMmZzL2djLmMgfCA1ICsrKysrCj4+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMvZ2MuYwo+Pj4g
aW5kZXggOGFiZjUyMTUzMGZmLi4wOWI2NWU2ZWE4NTMgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZz
L2djLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4gQEAgLTEzMTUsNiArMTMxNSw3IEBAIHN0
YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJsb2NrX3QgYmlk
eCwKPj4+IMKgwqDCoMKgwqAgc3RydWN0IG5vZGVfaW5mbyBuaTsKPj4+IMKgwqDCoMKgwqAgc3Ry
dWN0IGZvbGlvICpmb2xpbywgKm1mb2xpbzsKPj4+IMKgwqDCoMKgwqAgYmxvY2tfdCBuZXdhZGRy
Owo+Pj4gK8KgwqDCoCBib29sIG5lZWRfaW52YWxpZGF0ZSA9IHRydWU7Cj4+PiDCoMKgwqDCoMKg
IGludCBlcnIgPSAwOwo+Pj4gwqDCoMKgwqDCoCBib29sIGxmc19tb2RlID0gZjJmc19sZnNfbW9k
ZShmaW8uc2JpKTsKPj4+IMKgwqDCoMKgwqAgaW50IHR5cGUgPSBmaW8uc2JpLT5hbS5hdGdjX2Vu
YWJsZWQgJiYgKGdjX3R5cGUgPT0gQkdfR0MpICYmCj4+PiBAQCAtMTQ1MCw3ICsxNDUxLDExIEBA
IHN0YXRpYyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsIGJsb2NrX3Qg
YmlkeCwKPj4+IMKgIHB1dF9vdXQ6Cj4+PiDCoMKgwqDCoMKgIGYyZnNfcHV0X2Rub2RlKCZkbik7
Cj4+PiDCoCBvdXQ6Cj4+PiArwqDCoMKgIGlmIChmb2xpb190ZXN0X3VwdG9kYXRlKGZvbGlvKSkK
Pj4+ICvCoMKgwqDCoMKgwqDCoCBuZWVkX2ludmFsaWRhdGUgPSBmYWxzZTsKPj4KPj4gSG93IGFi
b3V0IGRyb3BwaW5nIHN1Y2ggZm9saW8gdW5kZXIgaXRzIGxvY2s/Cj4+Cj4+IGlmICghZm9saW9f
dGVzdF91cHRvZGF0ZSgpKQo+PiDCoMKgwqDCoMKgdHJ1bmNhdGVfaW5vZGVfcGFydGlhbF9mb2xp
bygpCj4+Cj4gCj4gdHJ1bmNhdGVfaW5vZGVfcGFydGlhbF9mb2xpbygpIGlzIG1vcmUgZWZmaWNp
ZW50IHNpbmNlIGl0IGF2b2lkcyBsb29raW5nCj4gdXAgdGhlIGZvbGlvIGFnYWluLCBidXQgaXTi
gJlzIGRlY2xhcmVkIGluIG1tL2ludGVybmFsLmgsIHNvIGl0IGNhbm5vdCBiZQo+IGNhbGxlZCBk
aXJlY3RseS4KClllYWgsIG9yIGdlbmVyaWNfZXJyb3JfcmVtb3ZlX2ZvbGlvKCksIG5vdCBzdXJl
LgoKSSBqdXN0IHRha2UgYSBsb29rIHRvIGNoZWNrIHdoZXRoZXIgdGhlcmUgaXMgYSBiZXR0ZXIg
YWx0ZXJuYXRpdmUgc2NoZW1lLgoKVGhhbmtzLAoKPiAKPiBZb25ncGVuZywKPiAKPj4+IMKgwqDC
oMKgwqAgZjJmc19mb2xpb19wdXQoZm9saW8sIHRydWUpOwo+Pj4gK8KgwqDCoCBpZiAobmVlZF9p
bnZhbGlkYXRlKQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGludmFsaWRhdGVfbWFwcGluZ19wYWdlcyht
YXBwaW5nLCBiaWR4LCBiaWR4KTsKPj4+IMKgwqDCoMKgwqAgcmV0dXJuIGVycjsKPj4+IMKgIH0K
Pj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1kZXZlbEBs
aXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
