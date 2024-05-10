Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD488C1D16
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 May 2024 05:37:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s5H4L-0005pl-0i;
	Fri, 10 May 2024 03:37:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s5H4J-0005pb-9k
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 03:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UYMElMAXHutQ9TEBBxQI23YG7Q3h1CCb5i1x2aGQOeA=; b=P2Df0bpCLj1BSb+r1L/W/+JgWg
 J2fHoD+1j7QqH+bRBojWQ1be9xpElo56fY4Lg0GgrIttHfHhZs7d3f4o1u+lyCyJmGrHSI7QiJ7qK
 b+NCsiFmJtfZcPRiXBQ8xn1H2Q9pJopbHPthZ3VTH39oSLIP+Acp0l5I8B6KOPnb18e8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UYMElMAXHutQ9TEBBxQI23YG7Q3h1CCb5i1x2aGQOeA=; b=HkLnAl70i627xSK78DV1LKgY2Q
 3X7GLYIkstN7qLeO0fP4g8WqHmRtc/bPsILtZVOZVUBd+VKj0VJ/DQcKtWuiM1OnJtGHwP0Cn5sQJ
 J+W/Kh+LaBz/vHm/GIzVxNh4zBTHqCHA1GxWqBjrKKYTnlnC3EqRUw/402c+08btHLP8=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s5H4I-0004rX-Lz for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 May 2024 03:37:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 36261CE1C84
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 May 2024 03:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9137DC113CC;
 Fri, 10 May 2024 03:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715312217;
 bh=1KviGYd5beyNX2PBlLyIIAQ0SMbAih+SYoo5RKeNBEE=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=hBP8m2hQxhieQldc8KDb6vku9VRUD5vfmOv6LIxyK18cKM8+DqLMF/LmKoZXwVwz6
 bIOmr+nPSe9hZ+8tfjV5080kM100ppP4/QghvFkZoNdbdwCfvo7zk9LT8yw2Zxxfq5
 iXfwpgKihp90C8K4Lii7hB1Q0xbo5fDvtKrUTx4DoRKcFY0DbGOryRYorHW0IlvEBu
 ulS8j5OIsfEfapYP0XtG/9dvXQv2pkqKlz56uwdaugCTt1YEqhPRaSlbUcpL6kRXDa
 d1OxZnwDVdj58W7vE6tUzSlUJgugIILJpXRCEjnn16/qGqmjE+IWw4kxWXYI4fHKpc
 JOdkeAsUnNDaA==
Message-ID: <a67948c7-6268-4c25-990d-8946814c7c4e@kernel.org>
Date: Fri, 10 May 2024 11:36:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240506103313.773503-1-chao@kernel.org>
 <20240506103313.773503-2-chao@kernel.org> <Zjwc5QGJfm6XXzOX@google.com>
 <32e097e6-67f1-4f06-bad0-0c7b3afb46f0@kernel.org>
Content-Language: en-US
In-Reply-To: <32e097e6-67f1-4f06-bad0-0c7b3afb46f0@kernel.org>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/9 10:49, Chao Yu wrote: > On 2024/5/9 8:46, Jaegeuk
 Kim wrote: >> On 05/06, Chao Yu wrote: >>> During gc_data_segment(), if inode
 state is abnormal, it missed to call >>> iput(), fix it. >>> [...] 
 Content analysis details:   (-0.8 points, 6.0 required)
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
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s5H4I-0004rX-Lz
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: fix to add missing iput() in
 gc_data_segment()
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

T24gMjAyNC81LzkgMTA6NDksIENoYW8gWXUgd3JvdGU6Cj4gT24gMjAyNC81LzkgODo0NiwgSmFl
Z2V1ayBLaW0gd3JvdGU6Cj4+IE9uIDA1LzA2LCBDaGFvIFl1IHdyb3RlOgo+Pj4gRHVyaW5nIGdj
X2RhdGFfc2VnbWVudCgpLCBpZiBpbm9kZSBzdGF0ZSBpcyBhYm5vcm1hbCwgaXQgbWlzc2VkIHRv
IGNhbGwKPj4+IGlwdXQoKSwgZml4IGl0Lgo+Pj4KPj4+IEZpeGVzOiAxMzJlMzIwOTc4OWMgKCJm
MmZzOiByZW1vdmUgZmFsc2UgYWxhcm0gb24gaWdldCBmYWlsdXJlIGR1cmluZyBHQyIpCgpPaCwg
dGhpcyBsaW5lIHNob3VsZCBiZSByZXBsYWNlZCB3LyBiZWxvdyBvbmUsIGxldCBtZSByZXZpc2Ug
dGhlIHBhdGNoLgoKRml4ZXM6IGI3M2U1MjgyNGM4OSAoImYyZnM6IHJlcG9zaXRpb24gdW5sb2Nr
X25ld19pbm9kZSB0byBwcmV2ZW50IGFjY2Vzc2luZyBpbnZhbGlkIGlub2RlIikuCgpUaGFua3Ms
Cgo+Pj4gRml4ZXM6IDkwNTZkNjQ4OWY1YSAoImYyZnM6IGZpeCB0byBkbyBzYW5pdHkgY2hlY2sg
b24gaW5vZGUgdHlwZSBkdXJpbmcgZ2FyYmFnZSBjb2xsZWN0aW9uIikKPj4+IFNpZ25lZC1vZmYt
Ynk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4gwqAgZnMvZjJmcy9nYy5j
IHwgOSArKysrKysrLS0KPj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuYyBiL2ZzL2YyZnMv
Z2MuYwo+Pj4gaW5kZXggODg1MjgxNGRhYjdmLi5lODZjN2YwMTUzOWEgMTAwNjQ0Cj4+PiAtLS0g
YS9mcy9mMmZzL2djLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZ2MuYwo+Pj4gQEAgLTE1NTQsMTAgKzE1
NTQsMTUgQEAgc3RhdGljIGludCBnY19kYXRhX3NlZ21lbnQoc3RydWN0IGYyZnNfc2JfaW5mbyAq
c2JpLCBzdHJ1Y3QgZjJmc19zdW1tYXJ5ICpzdW0sCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBpbnQgZXJyOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaW5vZGUgPSBmMmZz
X2lnZXQoc2IsIGRuaS5pbm8pOwo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKElTX0VS
Uihpbm9kZSkgfHwgaXNfYmFkX2lub2RlKGlub2RlKSB8fAo+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNwZWNpYWxfZmlsZShpbm9kZS0+aV9tb2RlKSkKPj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChJU19FUlIoaW5vZGUpKQo+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIGlmIChpc19iYWRfaW5vZGUoaW5vZGUpIHx8Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgc3BlY2lhbF9maWxlKGlub2RlLT5pX21vZGUpKSB7Cj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlwdXQoaW5vZGUpOwo+Pgo+PiBpZ2V0X2ZhaWxl
ZCgpIGNhbGxlZCBpcHV0KCk/Cj4gCj4gSXQgbG9va3MgdGhlIGJhZCBpbm9kZSB3YXMgcmVmZXJl
bmNlZCBpbiB0aGlzIGNvbnRleHQsIGl0IG5lZWRzIHRvIGJlIGlwdXQoKWVkCj4gaGVyZS4KPiAK
PiBUaGUgYmFkIGlub2RlIHdhcyBtYWRlIGluIG90aGVyIHRocmVhZCwgcGxlYXNlIGNoZWNrIGRl
c2NyaXB0aW9uIGluIGNvbW1pdAo+IGI3M2U1MjgyNGM4OSAoImYyZnM6IHJlcG9zaXRpb24gdW5s
b2NrX25ld19pbm9kZSB0byBwcmV2ZW50IGFjY2Vzc2luZyBpbnZhbGlkCj4gaW5vZGUiKS4KPiAK
PiBUaGFua3MsCj4gCj4+Cj4+Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNv
bnRpbnVlOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+Pj4gKwo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZXJyID0gZjJmc19nY19waW5uZWRfY29udHJvbChpbm9kZSwgZ2Nf
dHlwZSwgc2Vnbm8pOwo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGVyciA9PSAt
RUFHQUlOKSB7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlwdXQoaW5v
ZGUpOwo+Pj4gLS0gCj4+PiAyLjQwLjEKPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
