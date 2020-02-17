Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 93327160B6D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 08:10:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3aYH-0001rr-6c; Mon, 17 Feb 2020 07:10:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j3aYF-0001rk-TW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 07:10:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=32Ks83frlzZm3+D6uI5B7W1X0FKalFn4Mj8EUfWP7ZI=; b=g+oZ6LrZkPvdrQzuWldCKDvkly
 WMZ9u03aT2hEMwO4IwZyxpPwvJkhHnC+AHKoqv+HAjrShX+XCoSHE/FTGV8N3JFw6az9EzNIGY36I
 W40Tl88Ymoqe2bPMl80ciCnUcgSWryXYuICAfYSIhqxE0aOVMoXQdimXnzUeqP7gqQGI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=32Ks83frlzZm3+D6uI5B7W1X0FKalFn4Mj8EUfWP7ZI=; b=OhkuM1ZAKH9XfTXfg2MFp5/Iki
 MgMDNpW0xMbVsXPVYZ646H92L/Z40eOJN87Fs3teD2B6wn6FGRU++554VW/5mJFrywe2pgkjxSeFF
 KglKMyVS4VKdxvinZCm5Y9C+xcRpE7+T5MLbdg6uKBKoi7B5CmjQ+w1yp2/t0xAeILyo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3aYD-00F8RL-Ik
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 07:10:43 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 1D6F5DB1E66E3430EEDC;
 Mon, 17 Feb 2020 15:10:33 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Feb
 2020 15:10:28 +0800
To: =?UTF-8?B?546L55+b?= <spearmao@126.com>
References: <381334f9.10021.1704dcbf102.Coremail.spearmao@126.com>
 <cc33bd7d-a2df-ee10-db58-445cfbfeef07@huawei.com>
 <6d0f19c8.9bd4.170518c5bf1.Coremail.spearmao@126.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <8193a15a-669e-90a3-394c-621fcf92a32d@huawei.com>
Date: Mon, 17 Feb 2020 15:10:28 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6d0f19c8.9bd4.170518c5bf1.Coremail.spearmao@126.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j3aYD-00F8RL-Ik
Subject: Re: [f2fs-dev] F2fs panic | update_sit_entry() | no free segment |
 se invalid
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8yLzE3IDEzOjA4LCDnjovnn5sgd3JvdGU6Cj4gCj4gSGkgQ2hhbywKPiAKPiBUaGFu
a3MgZm9yIHlvdXIgcHJvbXB0IHJlcGx5Lgo+IDEuIElzIGl0IHBvc3NpYmxlIHRoYXQgd2hlbiB0
aGUgaXNzdWUgb2NjdXJyZWQsIHRoZXJlIGlzIGluZGVlZCBhbGwgZnJlZSBzZWdtZW50Cj4gdXNl
ZCB1cD8KCk5vLCBmMmZzIHJlc2VydmVkIHNvbWUgc2VjdGlvbnMgZm9yIGZvcmVncm91bmQgR0Ms
IG5vIG9uZSBzaG91bGQgdXNlIHVwIHRob3NlCnJlc2VydmVkIHNlY3Rpb25zLCB0aG91Z2ggZm9y
ZWdyb3VuZCBHQyBtYXkgdXNlIHRoZW0gdGVtcG9yYXJpbHkgdG8gbWlncmF0ZSBibG9ja3MuCgo+
IMKgwqDCoCAoRW5kIHVzZXIgdXNlZCB1cCBhbGwgZnJlZSBzZWdtZW50cywgc3lzdGVtIGNvcmUg
c2VydmljZSh1aWQgcm9vdCkgdXNlZCB1cAo+IGFsbCByZXNlcnZlZCBzZWdtZW50cykKPiAKPiDC
oMKgwqAgSWYgdGhpcyBtYXliZSB0cnVlLCBpdCB3b3VsZCBsZWFkIHN1Y2ggY3Jhc2ggaXNzdWUs
IGlzIHRoaXMgcmlnaHQ/Cj4gwqDCoMKgIEkgbWVhbiBpZiB3ZSBjYW4gYWRkIG1vcmUgZGV0YWls
ZWQgY2hlY2sgdG8gc2VlIGlmIHRoZXJlIGlzIGZyZWUgc2VnbWVudCBhbmQKPiByZXR1cm4gRU5P
U1BDIGluIHRpbWUgYmVmb3JlIGhpdCBjcmFzaC4KPiAyLiBJbiBkYXRhL25vZGUgd3JpdGUgcGF0
aCwgaXQgd2lsbCBjYWxsIGhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcyhzYmksIDAsIDApIHRvCj4g
bWFrZSBzdXJlIHRoZXJlIGlzIGVub3VnaCBzZWdtZW50cy4KClRoYXQgaXMgZm9yIHJlY2xhaW0g
cGF0aCBpbiB3aGVyZSB3YmMtPmZvcl9yZWNsYWltIHNob3VsZCBiZSB0cnVlLgoKQnV0IGFueXdh
eSwgaW4gZGF0YS9ub2RlIHdyaXRlIHBhdGgsIHdlIG1heSBjYWxsIGYyZnNfYmFsYW5jZV9mcygp
IHRvIGNoZWNrCmZvcmVncm91bmQgR0Mgd2F0ZXIgbGluZS4KCj4gQnV0IGluIHRoaXMgY3Jhc2gg
Y2FsbHN0YWNrLCBpdCBjcmFzaGVkIGluCj4gZG9fd3JpdGVfcGFnZSgpLT5mMmZzX2FsbG9jYXRl
X2RhdGFfYmxvY2soKS4KPiBJcyB0aGVyZSBhbnkgY29ybmVyIGNhc2UgdGhhdCBoYXNfbm90X2Vu
b3VnaF9mcmVlX3NlY3MoKSBpcyBtaXNzZWQgZHVyaW5nIHRoaXMKPiB3cml0ZSBwcm9jZWR1cmU/
CgpJJ3ZlIG5vIGlkZWEsIG9uZSB3YXkgaXMgdG8gY2hlY2sgd2hldGhlciB0aGVyZSBpcyBhIGRl
dGVybWluYXRlIG1ldGhvZCB0bwpyZXByb2R1Y2UgdGhpcyBpc3N1ZSwgaWYgdGhlcmUgaXMsIG1h
eWJlIEkgY2FuIGNoZWNrIHRoaXMgaXNzdWUgaW4gbW9yZSBkZXRhaWxzLgoKVGhhbmtzLAoKPiAK
PiBUaGFua3MsCj4gTWFvCj4gCj4gCj4gQXQgMjAyMC0wMi0xNyAxMTo1MDo1NiwgIkNoYW8gWXUi
IDx5dWNoYW8wQGh1YXdlaS5jb20+IHdyb3RlOgo+PkhpIOeOi+efm++8jAo+Pgo+Pk9uIDIwMjAv
Mi8xNiAxOTozOSwg546L55+bIHdyb3RlOgo+Pj4gKlNvIHRoZSBwcm9ibGVtIGlzOioKPj4+IAo+
Pj4gMS4gaW4gbmV3X2N1cnNlZygpLCBpZiB0aGUgc2Vnbm8gYWxsb2NhdGVkIGlzIGludmFsaWQo
bm8gZnJlZSBzZWdtZW50LCBtYXggc2Vnbm8KPj4+IGlzIHJldHVybmVkKS4KPj4+IAo+Pj4gRjJm
cyBzaG91bGQgZG8gc29tZXRoaW5nIHRvIGluZGljYXRlIHRoaXMgZXhjZXB0aW9uLgo+Pj4gCj4+
PiAyLiBvdGhlcndpc2UsIHdlIG1heSBoaXQgdGhlIGYyZnMgcGFuaWMoc2UgaW52YWxpZCkuCj4+
PiAKPj4+IE1heWJlIHdlIHNob3VsZCBkbyBzYW5pdHkgY2hlY2sgaW4gdXBkYXRlX3NpdF9lbnRy
eSgpIHRvIHNlZSBpZiBzZWdubyBpcyByZWFsbHkKPj4+IG91dCBvZiByYW5nZSBhbmQgY2F1c2Vk
IHRoaXMgcGFuaWMuCj4+Cj4+SSdtIGFmcmFpZCBpdCdzIHRvbyBsYXRlIHRvIGhhbmRsZSBzdWNo
IGVycm9yIGluIHVwZGF0ZV9zaXRfZW50cnkoKSwgc2luY2Ugd2UKPj5leHBlY3QgYWxsIHByb2Nl
ZHVyZXMgaW4gZG9fd3JpdGVfcGFnZSgpIHdpbGwgYmUgc3VjY2Vzc2Z1bCwgaXQncyBhIGxpdHRs
ZSBoYXJkCj4+dG8gaGFuZGxlIHN1Y2ggZXJyb3IgaW4gdGhhdCBjb250ZXh0Lgo+Pgo+PlNvIHRo
ZSBwcm9ibGVtIGhlcmUgaXMgd2h5IHdlIGNhbiBub3QgZmluZCBhbnkgZnJlZSBzZWdtZW50cyB3
LyBMRlMgYWxsb2NhdGlvbiwKPj5iZWNhdXNlIGluIGNhc2Ugb2YgbGFjayBvZiBmcmVlIHNlZ21l
bnRzIChjaGVjayB2aWEgaGFzX25vdF9lbm91Z2hfZnJlZV9zZWNzKCkpLAo+PmYyZnMgd2lsbCBm
b3JjZSB0byB0cmlnZ2VyIGYyZnNfZ2MoKSB0byByZWN5Y2xlIGZyZWUgc2VjdGlvbnMuCj4+Cj4+
SSBkb3VidCB0aGVyZSBtYXkgYmUgc29tZSBjb3JuZXIgY2FzZSB3ZSBoYXZlbid0IGNvbnNpZGVy
ZWQsIHJlc3VsdCBhbGwgZnJlZQo+PnNlZ21lbnRzIChpbmNsdWRpbmcgcmVzZXJ2ZWQgZnJlZSBz
ZWdtZW50cykgd2FzIGV4aGF1c3RlZCBieSBkYXRhL25vZGUgd3JpdGVzCj4+d2hlbiBsYXN0IGNo
ZWNrcG9pbnQgaXMgdHJpZ2dlcmVkIGR1cmluZyB1bW91bnQuCj4+Cj4+SWYgdGhpcyBpc3N1ZSBj
YW4gYmUgcmVwcm9kdWNlZCAoZHVyaW5nIHVtb3VudCwgZnJlZV9zZWdtZW50cygpIDwKPj5yZXNl
cnZlZF9zZWdtZW50cygpKSwgd2UgY2FuIGFkZCBzb21lIGxvZ3MgdG8gc2VlIHdoeSBmMmZzX2Jh
bGFuY2VfZnMoKSBmYWlsIHRvCj4+cmVjeWNsZSBlbm91Z2ggZnJlZSBzZWdtZW50cyBwcmV2aW91
c2x5Lgo+Pgo+PlRoYW5rcywKPj4KPj4+IAo+Pj4gCj4+PiBUaGFua3MsCj4+PiBNYW8KPj4+IAo+
Pj4gCj4+PiAKPj4+IMKgCj4+PiAKPiAKPiAKPiAKPiDCoAo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBs
aXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMu
c291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
