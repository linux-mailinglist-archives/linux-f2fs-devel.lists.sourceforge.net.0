Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86014734AD7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 06:05:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qB68W-0005FT-86;
	Mon, 19 Jun 2023 04:05:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qB68V-0005FN-HQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 04:05:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/lAMvzZHPio4aV6w0Wy5NmYg3BFKcwq6CncwfuGoQ9Q=; b=SGzHJNm4zV0blyw40AsSVH3yIC
 8gCy2aK8O8buuYCmswjVB3xFEcl70LoXFAMhDhi35ARv2xgg+lridO9ZQ4UhASrpYbvYmxOAHmdSg
 TZZIpH5TmatMUTLp4HjcYR0V6SwDZCmUO57tIkKSPNe5ICIF59SOeA2QdShFoNQBuB6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/lAMvzZHPio4aV6w0Wy5NmYg3BFKcwq6CncwfuGoQ9Q=; b=c/tp0d0o6AywenXz+UawxVBUFg
 I1lu5IwJ8cyIWkdm6FuvJAj0rxqC/7ihOHqSgkth6mlw7dYrA8b1rmgtxbHNogfH9PHlqqvdzk/lE
 nOLs3jR2h6IhI192z3wtEzy7iilMwHvisinSqqcXJ3bc7gPOfFBGscj3LjrG9EgoSdO4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qB68U-000236-6D for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 04:05:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C3ACF60C09;
 Mon, 19 Jun 2023 04:04:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E524DC433C8;
 Mon, 19 Jun 2023 04:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687147496;
 bh=W8waJk4XTaE76FP7LndZakOM9LvxqgfZtqHIAdHYMGw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QigEo1GRv2wym/UeqLTVusquiKXKw82/893v9gmr0EaRMB6/V8+WWrvGZMzjcb5rO
 /THHwNsdaEGYw3HC1YBFpXGf+NpuMt5PtZ1FILgcjD0fDgrOUhJVC8Qr53gP5ZyM2s
 8unE9jtqzwP2GkA4kQKsMFK9xuZTak2XzXMJHD2jJd3jtgSylIEQ2pHrR/hfGkCpdM
 xF0EFpsWKIjw5R1g54W2X3oy+zqvYmnP8iVO8/nDtA5OhxCFIffRNRitgcAGiWgBIQ
 9Uew+S5GlrbsI/tMLbnV1ljZdZLagzIHAZ0HqGuZ98I9lOwM6d03LQlIUf4K1+pxzO
 6jGJ6aCq5tclw==
Message-ID: <65ce42d6-889a-5e1d-8f04-af8f66fd0afa@kernel.org>
Date: Mon, 19 Jun 2023 12:04:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230609131555.56651-1-frank.li@vivo.com>
 <8097d4d9-815e-2527-0fb7-90ec0609a4a3@kernel.org>
 <dde6972a-e98c-8a6e-493b-9aff5668101d@vivo.com>
 <7ab6b6f9-37fa-9bf2-69ce-7b1b1944d9f3@kernel.org>
 <fe223231-5445-61ef-1ba8-0d46f4f4ed5f@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <fe223231-5445-61ef-1ba8-0d46f4f4ed5f@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/19 11:11, Yangtao Li wrote: > On 2023/6/19 8:54,
 Chao Yu wrote: > >> On 2023/6/13 12:14, Yangtao Li wrote: >>> >>> On 2023/6/12
 22:38, Chao Yu wrote: >>>> On 2023/6/9 21:15, Yangtao Li wrote [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qB68U-000236-6D
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: don't force buffered io when
 in COMPR_MODE_USER mode
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
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzE5IDExOjExLCBZYW5ndGFvIExpIHdyb3RlOgo+IE9uIDIwMjMvNi8xOSA4OjU0
LCBDaGFvIFl1IHdyb3RlOgo+IAo+PiBPbiAyMDIzLzYvMTMgMTI6MTQsIFlhbmd0YW8gTGkgd3Jv
dGU6Cj4+Pgo+Pj4gT24gMjAyMy82LzEyIDIyOjM4LCBDaGFvIFl1IHdyb3RlOgo+Pj4+IE9uIDIw
MjMvNi85IDIxOjE1LCBZYW5ndGFvIExpIHdyb3RlOgo+Pj4+PiBJdCBpcyBvYnNlcnZlZCB0aGF0
IHdoZW4gaW4gdXNlciBjb21wcmVzc2lvbiBtb2RlCj4+Pj4+IChjb21wcmVzc19leHRlbnNpb249
KiksCj4+Pj4+IGV2ZW4gdGhvdWdoIHRoZSBmaWxlIGlzIG5vdCBjb21wcmVzc2VkLCB0aGUgZmls
ZSBpcyBzdGlsbCBmb3JjZWQgdG8gdXNlCj4+Pj4+IGJ1ZmZlciBpbywgd2hpY2ggbWFrZXMgdGhl
IEFuZHJvQmVuY2ggc2VxdWVudGlhbCByZWFkIGFuZCB3cml0ZSBkcm9wCj4+Pj4+IHNpZ25pZmlj
YW50bHkuIEluIGZhY3QsIHdoZW4gdGhlIGZpbGUgaXMgbm90IGNvbXByZXNzZWQsIHdlIGRvbid0
IG5lZWQKPj4+Pj4gdG8gZm9yY2UgaXQgdG8gYnVmZmVyIGlvLgo+Pj4+Pgo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfCB3L28gcGF0Y2ggfCB3LyBwYXRjaCB8Cj4+
Pj4+IHNlcSByZWFkwqAgKE1CL3MpIHwgMTMyMC4wNjjCoCB8IDM2OTYuMTU0IHwKPj4+Pj4gc2Vx
IHdyaXRlIChNQi9zKSB8IDYxNy45OTbCoMKgIHwgMjk3OC40NzggfAo+Pj4+Pgo+Pj4+PiBGaXhl
czogNGM4ZmY3MDk1YmVmICgiZjJmczogc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uIikKPj4+Pj4g
U2lnbmVkLW9mZi1ieTogUWkgSGFuIDxoYW5xaUB2aXZvLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1i
eTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoMKgIGZz
L2YyZnMvZjJmcy5oIHwgMTQgKysrKysrKysrKysrKysKPj4+Pj4gwqDCoCBmcy9mMmZzL2ZpbGUu
YyB8wqAgMiArLQo+Pj4+PiDCoMKgIDIgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQo+Pj4+Pgo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9mMmZzLmggYi9m
cy9mMmZzL2YyZnMuaAo+Pj4+PiBpbmRleCAxZWZjZmQ5ZTVhOTkuLjdmNTQ3MjUyNTMxMCAxMDA2
NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4gKysrIGIvZnMvZjJmcy9mMmZzLmgK
Pj4+Pj4gQEAgLTMxNjgsNiArMzE2OCwyMCBAQCBzdGF0aWMgaW5saW5lIGludCBmMmZzX2NvbXBy
ZXNzZWRfZmlsZShzdHJ1Y3QKPj4+Pj4gaW5vZGUgKmlub2RlKQo+Pj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoCBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQ09NUFJFU1NFRF9GSUxFKTsKPj4+
Pj4gwqDCoCB9Cj4+Pj4+IMKgwqAgK3N0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2lzX2NvbXByZXNz
ZWRfZmlsZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+PiArewo+Pj4+PiArwqDCoMKgIGludCBj
b21wcmVzc19tb2RlID0gRjJGU19PUFRJT04oRjJGU19JX1NCKGlub2RlKSkuY29tcHJlc3NfbW9k
ZTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIGlmIChjb21wcmVzc19tb2RlID09IENPTVBSX01PREVf
RlMpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZjJmc19jb21wcmVzc2VkX2ZpbGUoaW5v
ZGUpOwo+Pj4+PiArwqDCoMKgIGVsc2UgaWYgKGF0b21pY19yZWFkKCZGMkZTX0koaW5vZGUpLT5p
X2NvbXByX2Jsb2NrcykgfHwKPj4+Pgo+Pj4+IFNob3VsZCBjaGVjayBkaXJ0eSBwYWdlIGFzIHdl
bGw/IGlfY29tcHJfYmxvY2tzIG1heSBpbmNyZWFzZSBhZnRlcgo+Pj4+IGRhdGEgd3JpdGViYWNr
Lgo+Pj4+Cj4+PiBJSVVDLCBpbiBDT01QUl9NT0RFX1VTRVIgbW9kZSwgaV9jb21wcl9ibG9ja3Mg
d2lsbCBvbmx5IGJlIHVwZGF0ZWQgd2hlbgo+Pj4gRklfRU5BQkxFX0NPTVBSRVNTIGlzIGVuYWJs
ZWQuCj4+Pgo+Pj4gSWYgRklfRU5BQkxFX0NPTVBSRVNTIGlzIG5vdCBlbmFibGVkLCBpX2NvbXBy
X2Jsb2NrcyB3aWxsIG5ldmVyIGJlCj4+PiB1cGRhdGVkIGFmdGVyIGRhdGEgd3JpdGViYWNrLgo+
Pj4KPj4+IFNvIHRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkaXRpb25hbGx5IGp1ZGdlIHdoZXRoZXIg
dGhlcmUgaXMgYSBkaXJ0eSBwYWdlPwo+Pgo+PiBPaCwgdXNlciBtb2RlLCB0aGF0J3MgY29ycmVj
dC4KPj4KPj4gSWYgd2UgYWxsb3cgZGlvL2FpbyBvbiBjb21wcmVzcyBmaWxlLCBpdCBuZWVkcyB0
byBjb25zaWRlciByYWNlIGNhc2UgaW4KPj4gYmV0d2VlbiBhaW8gYW5kIGlvY19jb21wcmVzc19m
aWxlLgo+IAo+IAo+IFRoZSBpbm9kZV9sb2NrIGlzIGFscmVhZHkgaGVsZCBpbiBmMmZzX2ZpbGVf
d3JpdGVfaXRlciBhbmQgZjJmc19pb2NfY29tcHJlc3NfZmlsZSwgSSBndWVzcyB0aGlzIGlzIGVu
b3VnaD8KPiAKPiBXaGF0IGVsc2U/CgphaW8gbWF5IGNvbXBsZXRlIG91dHNpZGUgaW5vZGUgbG9j
aywgc28gaXQgbmVlZHMgdG8gY2FsbCBpbm9kZV9kaW9fd2FpdCgpCmluIGYyZnNfaW9jX2NvbXBy
ZXNzX2ZpbGUoKSB0byBhdm9pZCB0aGUgcmFjZSBjYXNlPwoKVGhhbmtzLAoKPiAKPiAKPiA0Njkx
IHN0YXRpYyBzc2l6ZV90IGYyZnNfZmlsZV93cml0ZV9pdGVyKHN0cnVjdCBraW9jYiAqaW9jYiwg
c3RydWN0IGlvdl9pdGVyICpmcm9tKQo+IDQ2OTIgewo+IDQ2OTPCoMKgwqDCoMKgwqDCoMKgIHN0
cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxlX2lub2RlKGlvY2ItPmtpX2ZpbHApOwo+IDQ2OTTCoMKg
wqDCoMKgwqDCoMKgIGNvbnN0IGxvZmZfdCBvcmlnX3BvcyA9IGlvY2ItPmtpX3BvczsKPiA0Njk1
wqDCoMKgwqDCoMKgwqDCoCBjb25zdCBzaXplX3Qgb3JpZ19jb3VudCA9IGlvdl9pdGVyX2NvdW50
KGZyb20pOwo+IDQ2OTbCoMKgwqDCoMKgwqDCoMKgIGxvZmZfdCB0YXJnZXRfc2l6ZTsKPiA0Njk3
wqDCoMKgwqDCoMKgwqDCoCBib29sIGRpbzsKPiA0Njk4wqDCoMKgwqDCoMKgwqDCoCBib29sIG1h
eV9uZWVkX3N5bmMgPSB0cnVlOwo+IDQ2OTnCoMKgwqDCoMKgwqDCoMKgIGludCBwcmVhbGxvY2F0
ZWQ7Cj4gNDcwMMKgwqDCoMKgwqDCoMKgwqAgc3NpemVfdCByZXQ7Cj4gNDcwMQo+IDQ3MDLCoMKg
wqDCoMKgwqDCoMKgIGlmICh1bmxpa2VseShmMmZzX2NwX2Vycm9yKEYyRlNfSV9TQihpbm9kZSkp
KSkgewo+IDQ3MDPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUlPOwo+
IDQ3MDTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPiA0NzA1wqDC
oMKgwqDCoMKgwqDCoCB9Cj4gNDcwNgo+IDQ3MDfCoMKgwqDCoMKgwqDCoMKgIGlmICghZjJmc19p
c19jb21wcmVzc19iYWNrZW5kX3JlYWR5KGlub2RlKSkgewo+IDQ3MDjCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRU9QTk9UU1VQUDsKPiA0NzA5wqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4gNDcxMMKgwqDCoMKgwqDCoMKgwqAgfQo+IDQ3
MTEKPiA0NzEywqDCoMKgwqDCoMKgwqDCoCBpZiAoaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX05PV0FJ
VCkgewo+IDQ3MTPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAoIWlub2RlX3Ry
eWxvY2soaW5vZGUpKSB7Cj4gNDcxNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXQgPSAtRUFHQUlOOwo+IDQ3MTXCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4gNDcxNsKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIH0KPiA0NzE3wqDCoMKgwqDCoMKgwqDCoCB9IGVsc2Ugewo+IDQ3
MTjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpbm9kZV9sb2NrKGlub2RlKTsKPiA0
NzE5wqDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gCj4gNDExNSBzdGF0aWMgaW50IGYyZnNfaW9jX2Nv
bXByZXNzX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHApCj4gNDExNiB7Cj4gNDExN8KgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVfaW5vZGUoZmlscCk7Cj4gNDExOMKgwqDC
oMKgwqDCoMKgwqAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpID0gRjJGU19JX1NCKGlub2RlKTsK
PiA0MTE5wqDCoMKgwqDCoMKgwqDCoCBwZ29mZl90IHBhZ2VfaWR4ID0gMCwgbGFzdF9pZHg7Cj4g
NDEyMMKgwqDCoMKgwqDCoMKgwqAgdW5zaWduZWQgaW50IGJsa19wZXJfc2VnID0gc2JpLT5ibG9j
a3NfcGVyX3NlZzsKPiA0MTIxwqDCoMKgwqDCoMKgwqDCoCBpbnQgY2x1c3Rlcl9zaXplID0gRjJG
U19JKGlub2RlKS0+aV9jbHVzdGVyX3NpemU7Cj4gNDEyMsKgwqDCoMKgwqDCoMKgwqAgaW50IGNv
dW50LCByZXQ7Cj4gNDEyMwo+IDQxMjTCoMKgwqDCoMKgwqDCoMKgIGlmICghZjJmc19zYl9oYXNf
Y29tcHJlc3Npb24oc2JpKSB8fAo+IDQxMjXCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgRjJGU19PUFRJT04oc2JpKS5jb21wcmVzc19tb2RlICE9IENPTVBS
X01PREVfVVNFUikKPiA0MTI2wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IC1FT1BOT1RTVVBQOwo+IDQxMjcKPiA0MTI4wqDCoMKgwqDCoMKgwqDCoCBpZiAoIShmaWxwLT5m
X21vZGUgJiBGTU9ERV9XUklURSkpCj4gNDEyOcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybiAtRUJBREY7Cj4gNDEzMAo+IDQxMzHCoMKgwqDCoMKgwqDCoMKgIGlmICghZjJm
c19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKQo+IDQxMzLCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPiA0MTMzCj4gNDEzNMKgwqDCoMKgwqDCoMKgwqAgZjJm
c19iYWxhbmNlX2ZzKHNiaSwgdHJ1ZSk7Cj4gNDEzNQo+IDQxMzbCoMKgwqDCoMKgwqDCoMKgIGZp
bGVfc3RhcnRfd3JpdGUoZmlscCk7Cj4gNDEzN8KgwqDCoMKgwqDCoMKgwqAgaW5vZGVfbG9jayhp
bm9kZSk7Cj4gCj4gCj4gVGhhbmtzLAo+IAo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4KPj4+IFRo
YW5rcywKPj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpc19pbm9k
ZV9mbGFnX3NldChpbm9kZSwgRklfQ09NUFJFU1NfUkVMRUFTRUQpIHx8Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfRU5BQkxFX0NPTVBSRVNTKSkKPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiB0cnVlOwo+Pj4+PiArCj4+Pj4+ICvCoMKgwqAgcmV0
dXJuIGZhbHNlOwo+Pj4+PiArfQo+Pj4+PiArCj4+Pj4+IMKgwqAgc3RhdGljIGlubGluZSBib29s
IGYyZnNfbmVlZF9jb21wcmVzc19kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pj4+IMKgwqAg
ewo+Pj4+PiDCoMKgwqDCoMKgwqAgaW50IGNvbXByZXNzX21vZGUgPSBGMkZTX09QVElPTihGMkZT
X0lfU0IoaW5vZGUpKS5jb21wcmVzc19tb2RlOwo+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
aWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4+PiBpbmRleCA3NGVjYzllMjA2MTkuLjA2OTgxMjli
MjE2NSAxMDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9maWxlLmMKPj4+Pj4gKysrIGIvZnMvZjJm
cy9maWxlLmMKPj4+Pj4gQEAgLTgyMSw3ICs4MjEsNyBAQCBzdGF0aWMgYm9vbCBmMmZzX2ZvcmNl
X2J1ZmZlcmVkX2lvKHN0cnVjdCBpbm9kZQo+Pj4+PiAqaW5vZGUsIGludCBydykKPj4+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRydWU7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBpZiAoZnN2
ZXJpdHlfYWN0aXZlKGlub2RlKSkKPj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIHRy
dWU7Cj4+Pj4+IC3CoMKgwqAgaWYgKGYyZnNfY29tcHJlc3NlZF9maWxlKGlub2RlKSkKPj4+Pj4g
K8KgwqDCoCBpZiAoZjJmc19pc19jb21wcmVzc2VkX2ZpbGUoaW5vZGUpKQo+Pj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+Pj4gwqDCoCDCoMKgwqDCoMKgIC8qIGRpc2Fs
bG93IGRpcmVjdCBJTyBpZiBhbnkgb2YgZGV2aWNlcyBoYXMgdW5hbGlnbmVkIGJsa3NpemUgKi8K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
