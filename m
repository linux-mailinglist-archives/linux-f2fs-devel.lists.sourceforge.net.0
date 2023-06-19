Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DCF735942
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 16:13:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBFdN-0003cv-Ga;
	Mon, 19 Jun 2023 14:13:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qBFdM-0003co-RI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:13:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bRBdh9/d/g0T1Y1NGbasOBRABklN8RqA8N9Jv3d+7a4=; b=Uc9BVxMisON4ucRNTzWJaE7a87
 B0DChwk/uW0EFBesF6SZf3iAoSmSPbFSb/jyV2riEDLbYLgYikeVifRQ5XTi/K4uhhXP6ixVYeUT5
 9G2bsg2rlD/QhFq4pomeAbiwZ+7GS6PzsHVNCmvbnWu4ayE+rJil2fKC1MLfTNyTJcEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bRBdh9/d/g0T1Y1NGbasOBRABklN8RqA8N9Jv3d+7a4=; b=cp+tShS+VGNohz6saQZe8MQe5l
 58RDHdHlfz7k/8MxulsKp/D9KROOX+3VrdNBrMbB2S9r43QIAgyZKDVCBBEtOYu8u2ROkReBXg1Dc
 wlJPdZqgSK4kpN0t5aDCMw+EeAXmX2kji5rCc18CkQLTs1ypHO0lA0/L+QZpgeRPQpq8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBFdM-0006QW-Ob for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 14:13:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3065660C74;
 Mon, 19 Jun 2023 14:13:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B2B7C433C0;
 Mon, 19 Jun 2023 14:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1687184005;
 bh=Vv+JjUW5NUGjvWxBMhY5zIj9v9WdE3i5E3SoAj5yTB0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BFO2b0Fn5GJc4IRMklTjeOV4f2MuROZsnJcmYzywaNRZqdIp8VTejsfLNU/ao22FT
 8bLKk7AvEr6Wt5evtWSfoQPLJYp5xERDfuNGhhrzuotLEaweQOXJj4QFxm8FXxRhUJ
 OQRYpzaKO9lfydShIcxa+hvsNoRd9acuNEOJ3HBSGfa3yVMxQQC5yENXwnyd+SNQJv
 9HCXQV0/18ypoyezsKiLdH/AgTtXAVbrHCeQ3wUsTuyuFghWvAGHSFJrOC4c8PTPZ7
 bxk0SaGINAhI73SCrvbvic/aPoKVWAQKwsEpHgnVsMZzqqDhsytvUTdRWlASpQkJQ+
 jBTv9ItFBa2yw==
Message-ID: <84795faa-2fe0-0a2a-f1e6-9037c52414fa@kernel.org>
Date: Mon, 19 Jun 2023 22:13:21 +0800
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
 <65ce42d6-889a-5e1d-8f04-af8f66fd0afa@kernel.org>
 <6fb1d0be-b9d5-ce0a-7984-56b2e1a1a242@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <6fb1d0be-b9d5-ce0a-7984-56b2e1a1a242@vivo.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/19 17:31, Yangtao Li wrote: > On 2023/6/19 12:04, 
 Chao Yu wrote: > >> On 2023/6/19 11:11, Yangtao Li wrote: >>> On 2023/6/19
 8:54, Chao Yu wrote: >>> >>>> On 2023/6/13 12:14, Yangtao Li wrot [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qBFdM-0006QW-Ob
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

T24gMjAyMy82LzE5IDE3OjMxLCBZYW5ndGFvIExpIHdyb3RlOgo+IE9uIDIwMjMvNi8xOSAxMjow
NCwgQ2hhbyBZdSB3cm90ZToKPiAKPj4gT24gMjAyMy82LzE5IDExOjExLCBZYW5ndGFvIExpIHdy
b3RlOgo+Pj4gT24gMjAyMy82LzE5IDg6NTQsIENoYW8gWXUgd3JvdGU6Cj4+Pgo+Pj4+IE9uIDIw
MjMvNi8xMyAxMjoxNCwgWWFuZ3RhbyBMaSB3cm90ZToKPj4+Pj4KPj4+Pj4gT24gMjAyMy82LzEy
IDIyOjM4LCBDaGFvIFl1IHdyb3RlOgo+Pj4+Pj4gT24gMjAyMy82LzkgMjE6MTUsIFlhbmd0YW8g
TGkgd3JvdGU6Cj4+Pj4+Pj4gSXQgaXMgb2JzZXJ2ZWQgdGhhdCB3aGVuIGluIHVzZXIgY29tcHJl
c3Npb24gbW9kZQo+Pj4+Pj4+IChjb21wcmVzc19leHRlbnNpb249KiksCj4+Pj4+Pj4gZXZlbiB0
aG91Z2ggdGhlIGZpbGUgaXMgbm90IGNvbXByZXNzZWQsIHRoZSBmaWxlIGlzIHN0aWxsIGZvcmNl
ZAo+Pj4+Pj4+IHRvIHVzZQo+Pj4+Pj4+IGJ1ZmZlciBpbywgd2hpY2ggbWFrZXMgdGhlIEFuZHJv
QmVuY2ggc2VxdWVudGlhbCByZWFkIGFuZCB3cml0ZSBkcm9wCj4+Pj4+Pj4gc2lnbmlmaWNhbnRs
eS4gSW4gZmFjdCwgd2hlbiB0aGUgZmlsZSBpcyBub3QgY29tcHJlc3NlZCwgd2UgZG9uJ3QKPj4+
Pj4+PiBuZWVkCj4+Pj4+Pj4gdG8gZm9yY2UgaXQgdG8gYnVmZmVyIGlvLgo+Pj4+Pj4+Cj4+Pj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8IHcvbyBwYXRjaCB8IHcv
IHBhdGNoIHwKPj4+Pj4+PiBzZXEgcmVhZMKgIChNQi9zKSB8IDEzMjAuMDY4wqAgfCAzNjk2LjE1
NCB8Cj4+Pj4+Pj4gc2VxIHdyaXRlIChNQi9zKSB8IDYxNy45OTbCoMKgIHwgMjk3OC40NzggfAo+
Pj4+Pj4+Cj4+Pj4+Pj4gRml4ZXM6IDRjOGZmNzA5NWJlZiAoImYyZnM6IHN1cHBvcnQgZGF0YSBj
b21wcmVzc2lvbiIpCj4+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogUWkgSGFuIDxoYW5xaUB2aXZvLmNv
bT4KPj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZYW5ndGFvIExpIDxmcmFuay5saUB2aXZvLmNvbT4K
Pj4+Pj4+PiAtLS0KPj4+Pj4+PiAgwqDCoCBmcy9mMmZzL2YyZnMuaCB8IDE0ICsrKysrKysrKysr
KysrCj4+Pj4+Pj4gIMKgwqAgZnMvZjJmcy9maWxlLmMgfMKgIDIgKy0KPj4+Pj4+PiAgwqDCoCAy
IGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4+Pj4+Pgo+
Pj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4+
Pj4gaW5kZXggMWVmY2ZkOWU1YTk5Li43ZjU0NzI1MjUzMTAgMTAwNjQ0Cj4+Pj4+Pj4gLS0tIGEv
ZnMvZjJmcy9mMmZzLmgKPj4+Pj4+PiArKysgYi9mcy9mMmZzL2YyZnMuaAo+Pj4+Pj4+IEBAIC0z
MTY4LDYgKzMxNjgsMjAgQEAgc3RhdGljIGlubGluZSBpbnQgZjJmc19jb21wcmVzc2VkX2ZpbGUo
c3RydWN0Cj4+Pj4+Pj4gaW5vZGUgKmlub2RlKQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDC
oCBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfQ09NUFJFU1NFRF9GSUxFKTsKPj4+Pj4+PiAg
wqDCoCB9Cj4+Pj4+Pj4gIMKgwqAgK3N0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX2lzX2NvbXByZXNz
ZWRfZmlsZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+Pj4+Pj4+ICt7Cj4+Pj4+Pj4gK8KgwqDCoCBp
bnQgY29tcHJlc3NfbW9kZSA9Cj4+Pj4+Pj4gRjJGU19PUFRJT04oRjJGU19JX1NCKGlub2RlKSku
Y29tcHJlc3NfbW9kZTsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCBpZiAoY29tcHJlc3NfbW9k
ZSA9PSBDT01QUl9NT0RFX0ZTKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCByZXR1cm4gZjJmc19j
b21wcmVzc2VkX2ZpbGUoaW5vZGUpOwo+Pj4+Pj4+ICvCoMKgwqAgZWxzZSBpZiAoYXRvbWljX3Jl
YWQoJkYyRlNfSShpbm9kZSktPmlfY29tcHJfYmxvY2tzKSB8fAo+Pj4+Pj4KPj4+Pj4+IFNob3Vs
ZCBjaGVjayBkaXJ0eSBwYWdlIGFzIHdlbGw/IGlfY29tcHJfYmxvY2tzIG1heSBpbmNyZWFzZSBh
ZnRlcgo+Pj4+Pj4gZGF0YSB3cml0ZWJhY2suCj4+Pj4+Pgo+Pj4+PiBJSVVDLCBpbiBDT01QUl9N
T0RFX1VTRVIgbW9kZSwgaV9jb21wcl9ibG9ja3Mgd2lsbCBvbmx5IGJlIHVwZGF0ZWQKPj4+Pj4g
d2hlbgo+Pj4+PiBGSV9FTkFCTEVfQ09NUFJFU1MgaXMgZW5hYmxlZC4KPj4+Pj4KPj4+Pj4gSWYg
RklfRU5BQkxFX0NPTVBSRVNTIGlzIG5vdCBlbmFibGVkLCBpX2NvbXByX2Jsb2NrcyB3aWxsIG5l
dmVyIGJlCj4+Pj4+IHVwZGF0ZWQgYWZ0ZXIgZGF0YSB3cml0ZWJhY2suCj4+Pj4+Cj4+Pj4+IFNv
IHRoZXJlIGlzIG5vIG5lZWQgdG8gYWRkaXRpb25hbGx5IGp1ZGdlIHdoZXRoZXIgdGhlcmUgaXMg
YSBkaXJ0eQo+Pj4+PiBwYWdlPwo+Pj4+Cj4+Pj4gT2gsIHVzZXIgbW9kZSwgdGhhdCdzIGNvcnJl
Y3QuCj4+Pj4KPj4+PiBJZiB3ZSBhbGxvdyBkaW8vYWlvIG9uIGNvbXByZXNzIGZpbGUsIGl0IG5l
ZWRzIHRvIGNvbnNpZGVyIHJhY2UgY2FzZSBpbgo+Pj4+IGJldHdlZW4gYWlvIGFuZCBpb2NfY29t
cHJlc3NfZmlsZS4KPj4+Cj4+Pgo+Pj4gVGhlIGlub2RlX2xvY2sgaXMgYWxyZWFkeSBoZWxkIGlu
IGYyZnNfZmlsZV93cml0ZV9pdGVyIGFuZAo+Pj4gZjJmc19pb2NfY29tcHJlc3NfZmlsZSwgSSBn
dWVzcyB0aGlzIGlzIGVub3VnaD8KPj4+Cj4+PiBXaGF0IGVsc2U/Cj4+Cj4+IGFpbyBtYXkgY29t
cGxldGUgb3V0c2lkZSBpbm9kZSBsb2NrLCBzbyBpdCBuZWVkcyB0byBjYWxsIGlub2RlX2Rpb193
YWl0KCkKPj4gaW4gZjJmc19pb2NfY29tcHJlc3NfZmlsZSgpIHRvIGF2b2lkIHRoZSByYWNlIGNh
c2U/Cj4gCj4gCj4gSG93IGFib3V0IGFkZGluZyB0aGlzIGJlbG9377yfCj4gCj4gZGlmZiAtLWdp
dCBhL2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPiBpbmRleCBmNDVkMDVjMTNhZTUu
LjUwMjFkMTNlNzg4YiAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+ICsrKyBiL2ZzL2Yy
ZnMvZmlsZS5jCj4gQEAgLTQxNDYsNiArNDE0NiwxMCBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX2Nv
bXByZXNzX2ZpbGUoc3RydWN0IGZpbGUgKmZpbHApCj4gICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgZ290byBvdXQ7Cj4gICDCoMKgwqDCoMKgwqDCoCB9Cj4gCj4gK8KgwqDCoMKgwqDC
oCAvKiBhdm9pZCByYWNlIGNhc2UgYmV0d2VlbiBhaW8gYW5kIGlvY19jb21wcmVzc19maWxlICov
Cj4gK8KgwqDCoMKgwqDCoCBpZiAoRjJGU19PUFRJT04oc2JpKS5jb21wcmVzc19tb2RlID09IENP
TVBSX01PREVfVVNFUikKCmYyZnNfaW9jX2NvbXByZXNzX2ZpbGUoKSBoYXMgYWxyZWFkeSBjaGVj
a2VkIHRoZSBtb2RlPwoKVGhhbmtzLAoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
bm9kZV9kaW9fd2FpdChpbm9kZSk7Cj4gKwo+ICAgwqDCoMKgwqDCoMKgwqAgcmV0ID0gZmlsZW1h
cF93cml0ZV9hbmRfd2FpdF9yYW5nZShpbm9kZS0+aV9tYXBwaW5nLCAwLCBMTE9OR19NQVgpOwo+
ICAgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBnb3RvIG91dDsKPiAKPiAKPiBUaGFua3MsCj4gCj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+
Cj4+Pgo+Pj4gNDY5MSBzdGF0aWMgc3NpemVfdCBmMmZzX2ZpbGVfd3JpdGVfaXRlcihzdHJ1Y3Qg
a2lvY2IgKmlvY2IsIHN0cnVjdAo+Pj4gaW92X2l0ZXIgKmZyb20pCj4+PiA0NjkyIHsKPj4+IDQ2
OTPCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxlX2lub2RlKGlvY2It
PmtpX2ZpbHApOwo+Pj4gNDY5NMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgbG9mZl90IG9yaWdfcG9z
ID0gaW9jYi0+a2lfcG9zOwo+Pj4gNDY5NcKgwqDCoMKgwqDCoMKgwqAgY29uc3Qgc2l6ZV90IG9y
aWdfY291bnQgPSBpb3ZfaXRlcl9jb3VudChmcm9tKTsKPj4+IDQ2OTbCoMKgwqDCoMKgwqDCoMKg
IGxvZmZfdCB0YXJnZXRfc2l6ZTsKPj4+IDQ2OTfCoMKgwqDCoMKgwqDCoMKgIGJvb2wgZGlvOwo+
Pj4gNDY5OMKgwqDCoMKgwqDCoMKgwqAgYm9vbCBtYXlfbmVlZF9zeW5jID0gdHJ1ZTsKPj4+IDQ2
OTnCoMKgwqDCoMKgwqDCoMKgIGludCBwcmVhbGxvY2F0ZWQ7Cj4+PiA0NzAwwqDCoMKgwqDCoMKg
wqDCoCBzc2l6ZV90IHJldDsKPj4+IDQ3MDEKPj4+IDQ3MDLCoMKgwqDCoMKgwqDCoMKgIGlmICh1
bmxpa2VseShmMmZzX2NwX2Vycm9yKEYyRlNfSV9TQihpbm9kZSkpKSkgewo+Pj4gNDcwM8KgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU87Cj4+PiA0NzA0wqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBvdXQ7Cj4+PiA0NzA1wqDCoMKgwqDCoMKgwqDC
oCB9Cj4+PiA0NzA2Cj4+PiA0NzA3wqDCoMKgwqDCoMKgwqDCoCBpZiAoIWYyZnNfaXNfY29tcHJl
c3NfYmFja2VuZF9yZWFkeShpbm9kZSkpIHsKPj4+IDQ3MDjCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXQgPSAtRU9QTk9UU1VQUDsKPj4+IDQ3MDnCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+IDQ3MTDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IDQ3
MTEKPj4+IDQ3MTLCoMKgwqDCoMKgwqDCoMKgIGlmIChpb2NiLT5raV9mbGFncyAmIElPQ0JfTk9X
QUlUKSB7Cj4+PiA0NzEzwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpbm9k
ZV90cnlsb2NrKGlub2RlKSkgewo+Pj4gNDcxNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSAtRUFHQUlOOwo+Pj4gNDcxNcKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKPj4+IDQ3MTbCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiA0NzE3wqDCoMKgwqDCoMKgwqDCoCB9
IGVsc2Ugewo+Pj4gNDcxOMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlub2RlX2xv
Y2soaW5vZGUpOwo+Pj4gNDcxOcKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4KPj4+Cj4+PiA0MTE1IHN0
YXRpYyBpbnQgZjJmc19pb2NfY29tcHJlc3NfZmlsZShzdHJ1Y3QgZmlsZSAqZmlscCkKPj4+IDQx
MTYgewo+Pj4gNDExN8KgwqDCoMKgwqDCoMKgwqAgc3RydWN0IGlub2RlICppbm9kZSA9IGZpbGVf
aW5vZGUoZmlscCk7Cj4+PiA0MTE4wqDCoMKgwqDCoMKgwqDCoCBzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkgPSBGMkZTX0lfU0IoaW5vZGUpOwo+Pj4gNDExOcKgwqDCoMKgwqDCoMKgwqAgcGdvZmZf
dCBwYWdlX2lkeCA9IDAsIGxhc3RfaWR4Owo+Pj4gNDEyMMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgaW50IGJsa19wZXJfc2VnID0gc2JpLT5ibG9ja3NfcGVyX3NlZzsKPj4+IDQxMjHCoMKgwqDC
oMKgwqDCoMKgIGludCBjbHVzdGVyX3NpemUgPSBGMkZTX0koaW5vZGUpLT5pX2NsdXN0ZXJfc2l6
ZTsKPj4+IDQxMjLCoMKgwqDCoMKgwqDCoMKgIGludCBjb3VudCwgcmV0Owo+Pj4gNDEyMwo+Pj4g
NDEyNMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZzX3NiX2hhc19jb21wcmVzc2lvbihzYmkpIHx8
Cj4+PiA0MTI1wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IEYyRlNfT1BUSU9OKHNiaSkuY29tcHJlc3NfbW9kZSAhPQo+Pj4gQ09NUFJfTU9ERV9VU0VSKQo+
Pj4gNDEyNsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRU9QTk9UU1VQ
UDsKPj4+IDQxMjcKPj4+IDQxMjjCoMKgwqDCoMKgwqDCoMKgIGlmICghKGZpbHAtPmZfbW9kZSAm
IEZNT0RFX1dSSVRFKSkKPj4+IDQxMjnCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBy
ZXR1cm4gLUVCQURGOwo+Pj4gNDEzMAo+Pj4gNDEzMcKgwqDCoMKgwqDCoMKgwqAgaWYgKCFmMmZz
X2NvbXByZXNzZWRfZmlsZShpbm9kZSkpCj4+PiA0MTMywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+PiA0MTMzCj4+PiA0MTM0wqDCoMKgwqDCoMKgwqDC
oCBmMmZzX2JhbGFuY2VfZnMoc2JpLCB0cnVlKTsKPj4+IDQxMzUKPj4+IDQxMzbCoMKgwqDCoMKg
wqDCoMKgIGZpbGVfc3RhcnRfd3JpdGUoZmlscCk7Cj4+PiA0MTM3wqDCoMKgwqDCoMKgwqDCoCBp
bm9kZV9sb2NrKGlub2RlKTsKPj4+Cj4+Pgo+Pj4gVGhhbmtzLAo+Pj4KPj4+Pgo+Pj4+IFRoYW5r
cywKPj4+Pgo+Pj4+Pgo+Pj4+Pgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+PiBUaGFua3MsCj4+
Pj4+Pgo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklf
Q09NUFJFU1NfUkVMRUFTRUQpIHx8Cj4+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlzX2lub2RlX2Zs
YWdfc2V0KGlub2RlLCBGSV9FTkFCTEVfQ09NUFJFU1MpKQo+Pj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCByZXR1cm4gdHJ1ZTsKPj4+Pj4+PiArCj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gZmFsc2U7Cj4+
Pj4+Pj4gK30KPj4+Pj4+PiArCj4+Pj4+Pj4gIMKgwqAgc3RhdGljIGlubGluZSBib29sIGYyZnNf
bmVlZF9jb21wcmVzc19kYXRhKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+Pj4+Pj4gIMKgwqAgewo+
Pj4+Pj4+ICDCoMKgwqDCoMKgwqAgaW50IGNvbXByZXNzX21vZGUgPQo+Pj4+Pj4+IEYyRlNfT1BU
SU9OKEYyRlNfSV9TQihpbm9kZSkpLmNvbXByZXNzX21vZGU7Cj4+Pj4+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPj4+Pj4+PiBpbmRleCA3NGVjYzllMjA2
MTkuLjA2OTgxMjliMjE2NSAxMDA2NDQKPj4+Pj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4+
Pj4+ICsrKyBiL2ZzL2YyZnMvZmlsZS5jCj4+Pj4+Pj4gQEAgLTgyMSw3ICs4MjEsNyBAQCBzdGF0
aWMgYm9vbCBmMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvKHN0cnVjdCBpbm9kZQo+Pj4+Pj4+ICppbm9k
ZSwgaW50IHJ3KQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+
Pj4+PiAgwqDCoMKgwqDCoMKgIGlmIChmc3Zlcml0eV9hY3RpdmUoaW5vZGUpKQo+Pj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gdHJ1ZTsKPj4+Pj4+PiAtwqDCoMKgIGlmIChmMmZz
X2NvbXByZXNzZWRfZmlsZShpbm9kZSkpCj4+Pj4+Pj4gK8KgwqDCoCBpZiAoZjJmc19pc19jb21w
cmVzc2VkX2ZpbGUoaW5vZGUpKQo+Pj4+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4g
dHJ1ZTsKPj4+Pj4+PiAgwqDCoCDCoMKgwqDCoMKgIC8qIGRpc2FsbG93IGRpcmVjdCBJTyBpZiBh
bnkgb2YgZGV2aWNlcyBoYXMgdW5hbGlnbmVkCj4+Pj4+Pj4gYmxrc2l6ZSAqLwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
