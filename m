Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA14BC620ED
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Nov 2025 03:04:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9zVIZd0p+MSJF+LVFA0U8OamC9kSDb+Wk3q59cytUJU=; b=g863aZp6cmrhyPo8k9ePNg32AJ
	kfV010cEcNjYHnAcGAqL63n+OaOCXGyzzJXdPsTrLq061SK+zdqIp2Eb3E0JO/sdrswvzFvdhoU9h
	3RQVHHzGKOHkU2FRwUSAjQFft03hoaW0w4SHQAqHrley3yIYRYtxY0uvTyKYqgT9GKIw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKobK-0004zu-4U;
	Mon, 17 Nov 2025 02:04:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vKob5-0004yX-Oe
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 02:04:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CJ+YV4lX8KG9pg95uBYgbbofyI4c2p9PSn9Q/gm3xcM=; b=bZs4rMbsDCAEX7YU+3VrcTovTf
 cp0iWn6zBYExWm5ih24wwncLdqdnBZ6r9asUsg5c8hr46+MY3hzT+3EPYB/cfoK5JaR+aimy8pmp3
 Ypz5aQfaX2tpW8hpiMuk0Y/seQdIEaxfemtb/AJV2IBwP6b+o09N8z+V2tRRfLQ3gGoI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CJ+YV4lX8KG9pg95uBYgbbofyI4c2p9PSn9Q/gm3xcM=; b=KAIzWZ4P8wI8RG0Gg39uB27kRJ
 bav7QcatJsCBxN+nKJhk2stSCDp5vcXJlkArLplATpHxHpl/IslAfqe4KQmKSKDBfThFeqHh0Pde/
 9AiavWVY0cxdUDVdsDATaC6P1L9+1GgUJejd4wIohtElfYSFmhFvWUREvN4wA4JXNPxA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vKob5-0005kG-RO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Nov 2025 02:04:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C715460197;
 Mon, 17 Nov 2025 02:03:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90546C19422;
 Mon, 17 Nov 2025 02:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763345032;
 bh=Kk0pgmf2oDP8bpIUDaiAau94jHwRJpsWTLDxV5Vx/t0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=LWFQbu9NjdC+IFOMLl9y319UOGosit7rmGtcN286QVzqj8xKguTHE707PHsNokmpZ
 4dNFh09rMW29qlEfw+fAgLEu2Y2jInWpRNc16iiZ7/tkEKfpm0zTBgd0bk3erpfCJj
 +vFyyqs0fbBHzg7ErGqMEmomF0F9WPbZhcR1jPyZY7ri9AIKKKPVKZ8EcMHK+fpw0i
 yLZAVkKprHG4KgHgQHH7zz/NeGQFjGlvBbWRSZW2QSfRHlRsUmDx58EL+g4ZFpdpsS
 f7HP1X/eEFcqfBnZSF+r3+mXdrou8TvR/XDdb39466KsJBBv0g6j17EQ4i10abUX0F
 sah7NC31UqdqQ==
Message-ID: <22f56d37-5617-44cf-9c36-0366841426fd@kernel.org>
Date: Mon, 17 Nov 2025 10:03:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
 <aRT_KGOSGOGw3S4W@google.com>
 <4c31e634-f88e-4cec-8d1e-b8434a11ebee@kernel.org>
 <9df8fb59-8afb-4b20-b4fa-14bd873c9502@gmail.com>
 <1d03119c-bec1-4269-b385-34ce422125d3@kernel.org>
 <3b488053-b07b-428f-9415-741119af3d35@gmail.com>
Content-Language: en-US
In-Reply-To: <3b488053-b07b-428f-9415-741119af3d35@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/17/25 00:31, Yongpeng Yang wrote: > > On 11/15/2025
 7:36 PM, Chao Yu via Linux-f2fs-devel wrote: >> On 11/14/2025 3:37 PM, Yongpeng
 Yang wrote: >>> On 11/14/25 08:51, Chao Yu via Linux-f2fs-deve [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vKob5-0005kG-RO
Subject: Re: [f2fs-dev] [PATCH v2 3/3] f2fs: fix handling of zoned block
 devices with max_open_zones == 0
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMTcvMjUgMDA6MzEsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gCj4gT24gMTEvMTUvMjAy
NSA3OjM2IFBNLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAxMS8x
NC8yMDI1IDM6MzcgUE0sIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+PiBPbiAxMS8xNC8yNSAwODo1
MSwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4+PiBPbiAxMS8xMy8yMDI1
IDU6NDIgQU0sIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4+PiBUaGlzIGJyZWFrcyB0aGUgZGV2aWNl
IGdpdmluZyAwIG9wZW4gem9uZSB3aGljaCB3YXMgd29ya2luZy4gSGVuY2UsIEkKPj4+Pj4gZHJv
cHBlZAo+Pj4+PiB0aGUgY2hhbmdlLgo+Pj4+Pgo+Pj4+PiBPbiAxMS8xMCwgWW9uZ3BlbmcgWWFu
ZyB3cm90ZToKPj4+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWku
Y29tPgo+Pj4+Pj4KPj4+Pj4+IFdoZW4gZW11bGF0aW5nIGEgWk5TIFNTRCBvbiBxZW11IHdpdGgg
em9uZWQubWF4X29wZW4gc2V0IHRvIDAsIHRoZQo+Pj4+Pj4gRjJGUyBjYW4gc3RpbGwgYmUgbW91
bnRlZCBzdWNjZXNzZnVsbHkuIFRoZSBzeXNmcyBlbnRyeSBzaG93cwo+Pj4+Pj4gc2JpLT5tYXhf
b3Blbl96b25lcyBhcyBVSU5UX01BWC4KPj4+Pj4+Cj4+Pj4+PiByb290QGZlZG9yYS12bTp+IyBj
YXQgL3N5cy9ibG9jay9udm1lMG4xL3F1ZXVlL3pvbmVkCj4+Pj4+PiBob3N0LW1hbmFnZWQKPj4+
Pj4+IHJvb3RAZmVkb3JhLXZtOn4jIGNhdCAvc3lzL2Jsb2NrL252bWUwbjEvcXVldWUvbWF4X29w
ZW5fem9uZXMKPj4+Pj4+IDAKPj4+Pj4+IHJvb3RAZmVkb3JhLXZtOn4jIG1rZnMuZjJmcyAtbSAt
YyAvZGV2L252bWUwbjEgL2Rldi92ZGEKPj4+Pj4+IHJvb3RAZmVkb3JhLXZtOn4jIG1vdW50IC9k
ZXYvdmRhIC9tbnQvZjJmcy8KPj4+Pj4+IHJvb3RAZmVkb3JhLXZtOn4jIGNhdCAvc3lzL2ZzL2Yy
ZnMvdmRhL21heF9vcGVuX3pvbmVzCj4+Pj4+PiA0Mjk0OTY3Mjk1Cj4+Pj4+Pgo+Pj4+Pj4gVGhl
IHJvb3QgY2F1c2UgaXMgdGhhdCBzYmktPm1heF9vcGVuX3pvbmVzIGlzIGluaXRpYWxpemVkIHRv
IFVJTlRfTUFYCj4+Pj4+PiBhbmQgb25seSB1cGRhdGVkIHdoZW4gdGhlIGRldmljZeKAmXMgbWF4
X29wZW5fem9uZXMgaXMgZ3JlYXRlciB0aGFuIDAuCj4+Pj4+PiBIb3dldmVyLCBib3RoIHRoZSBz
Y3NpIGRyaXZlciAoc2RfemJjX3JlYWRfem9uZXMgbWF5IGFzc2lnbnMgMCB0bwo+Pj4+Pj4gZGV2
aWNlJ3MgbWF4X29wZW5fem9uZXMpIGFuZCB0aGUgbnZtZSBkcml2ZXIgKG52bWVfcXVlcnlfem9u
ZV9pbmZvIGRvbid0Cj4+Pj4+PiBjaGVjayBtYXhfb3Blbl96b25lcykgYWxsb3cgbWF4X29wZW5f
em9uZXMgdG8gYmUgMC4KPj4+Pj4+Cj4+Pj4+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBpc3N1ZSBi
eSBwcmV2ZW50aW5nIG1vdW50aW5nIG9uIHpvbmVkIFNTRHMgd2hlbgo+Pj4+Pj4gbWF4X29wZW5f
em9uZXMgaXMgMCwgd2hpbGUgc3RpbGwgYWxsb3dpbmcgU01SIEhERHMgdG8gYmUgbW91bnRlZC4K
Pj4+Pj4+IGluaXRfYmxrel9pbmZvKCkgaXMgb25seSBjYWxsZWQgYnkgZjJmc19zY2FuX2Rldmlj
ZXMoKSwgYW5kIHRoZQo+Pj4+Pj4gYmxrem9uZWQgZmVhdHVyZSBoYXMgYWxyZWFkeSBiZWVuIGNo
ZWNrZWQgdGhlcmUuIFNvLCB0aGlzIHBhdGNoIGFsc28KPj4+Pj4+IHJlbW92ZSByZWR1bmRhbnQg
em9uZWQgZGV2aWNlIGNoZWNrcy4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVu
ZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gwqDCoCBm
cy9mMmZzL3N1cGVyLmMgfCAzNiArKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
Pj4+Pj4+IMKgwqAgMSBmaWxlIGNoYW5nZWQsIDIxIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9u
cygtKQo+Pj4+Pj4KPj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZz
L3N1cGVyLmMKPj4+Pj4+IGluZGV4IGRiN2FmYjgwNjQxMS4uNmRjODk0NWUyNGFmIDEwMDY0NAo+
Pj4+Pj4gLS0tIGEvZnMvZjJmcy9zdXBlci5jCj4+Pj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMK
Pj4+Pj4+IEBAIC00MzUzLDIxICs0MzUzLDYgQEAgc3RhdGljIGludCBpbml0X2Jsa3pfaW5mbyhz
dHJ1Y3QgZjJmc19zYl9pbmZvCj4+Pj4+PiAqc2JpLCBpbnQgZGV2aSkKPj4+Pj4+IMKgwqDCoMKg
wqDCoCB1bnNpZ25lZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4+Pj4+PiDCoMKgwqDCoMKgwqAgaW50
IHJldDsKPj4+Pj4+IC3CoMKgwqAgaWYgKCFmMmZzX3NiX2hhc19ibGt6b25lZChzYmkpKQo+Pj4+
Pj4gLcKgwqDCoMKgwqDCoMKgIHJldHVybiAwOwo+Pj4+Pj4gLQo+Pj4+Pj4gLcKgwqDCoCBpZiAo
YmRldl9pc196b25lZChGREVWKGRldmkpLmJkZXYpKSB7Cj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAg
bWF4X29wZW5fem9uZXMgPSBiZGV2X21heF9vcGVuX3pvbmVzKGJkZXYpOwo+Pj4+Pj4gLcKgwqDC
oMKgwqDCoMKgIGlmIChtYXhfb3Blbl96b25lcyAmJiAobWF4X29wZW5fem9uZXMgPCBzYmktPm1h
eF9vcGVuX3pvbmVzKSkKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNiaS0+bWF4X29w
ZW5fem9uZXMgPSBtYXhfb3Blbl96b25lczsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpZiAoc2Jp
LT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpIHsKPj4+Pj4+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwKPj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgInpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28gc21h
bGwsIG5lZWQgYXQKPj4+Pj4+IGxlYXN0ICV1IG9wZW4gem9uZXMiLAo+Pj4+Pj4gLcKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBzYmktPm1heF9vcGVuX3pvbmVzLCBGMkZTX09QVElPTihz
YmkpLmFjdGl2ZV9sb2dzKTsKPj4+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAt
RUlOVkFMOwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4+IC3CoMKgwqAgfQo+Pj4+Pj4g
LQo+Pj4+Pj4gwqDCoMKgwqDCoMKgIHpvbmVfc2VjdG9ycyA9IGJkZXZfem9uZV9zZWN0b3JzKGJk
ZXYpOwo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChzYmktPmJsb2Nrc19wZXJfYmxreiAmJiBzYmkt
PmJsb2Nrc19wZXJfYmxreiAhPQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIFNFQ1RPUl9UT19CTE9DSyh6b25lX3NlY3RvcnMpKQo+Pj4+Pj4gQEAgLTQzNzgsNiAr
NDM2MywyNyBAQCBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8K
Pj4+Pj4+ICpzYmksIGludCBkZXZpKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgIGlmIChucl9zZWN0b3Jz
ICYgKHpvbmVfc2VjdG9ycyAtIDEpKQo+Pj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgRkRFVihk
ZXZpKS5ucl9ibGt6Kys7Cj4+Pj4+PiArwqDCoMKgIG1heF9vcGVuX3pvbmVzID0gYmRldl9tYXhf
b3Blbl96b25lcyhiZGV2KTsKPj4+Pj4+ICvCoMKgwqAgaWYgKCFtYXhfb3Blbl96b25lcykgewo+
Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIC8qCj4+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoCAqIFNTRHMg
cmVxdWlyZSBtYXhfb3Blbl96b25lcyA+IDAgdG8gYmUgbW91bnRhYmxlLgo+Pj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqAgKiBGb3IgSEREcywgaWYgbWF4X29wZW5fem9uZXMgaXMgcmVwb3J0ZWQgYXMg
MCwgaXQgZG9lc24ndAo+Pj4+Pj4gbWF0dGVyLAo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKiBz
ZXQgaXQgdG8gRkRFVihkZXZpKS5ucl9ibGt6Lgo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgwqAgKi8K
Pj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBpZiAoYmRldl9ub25yb3QoYmRldikpIHsKPj4+Pj4+ICvC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwgInpvbmVkOiBTU0QgZGV2aWNlICVz
IHdpdGhvdXQgb3BlbiB6b25lcyIsCj4+Pj4+PiBGREVWKGRldmkpLnBhdGgpOwo+Pj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pj4KPj4+PiBPaCwgc28sIGZv
ciBjb252ZW50aW9uYWwgVUZTLCBpdCB3aWxsIGdvIGludG8gdGhpcyBwYXRoIGFzIFNTRCB3LyB6
ZXJvCj4+Pj4gb3BlbiB6b25lPwo+Pj4+Cj4+Pj4gQW55IHdheSB0byBkaXN0aW5ndWlzaCB0aGF0
Pwo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pgo+Pj4gc2JpLT5tYXhfb3Blbl96b25lcyBtaWdo
dCBiZSBjbGFzc2lmaWVkIGludG8gNCBjYXNlczoKPj4+Cj4+PiAxLiBGb3Igbm9uIHJvdGF0aW9u
YWwgZGV2aWNlcyB0aGF0IGhhdmUgYm90aCBjb252ZW50aW9uYWwgem9uZXMgYW5kCj4+PiBzZXF1
ZW50aWFsIHpvbmVzLCB3ZSBzaG91bGQgc3RpbGwgZW5zdXJlIHRoYXQgbWF4X29wZW5fem9uZXMg
PiAwLiBJZiB0aGUKPj4+ICMgb2Ygc2VxdWVudGlhbCB6b25lcyBleGNlZWRzIG1heF9vcGVuX3pv
bmVzLCB3ZSBzdGlsbCBuZWVkIHRvIGd1YXJhbnRlZQo+Pj4gdGhhdCBtYXhfb3Blbl96b25lcyA+
PSBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzLgo+Pj4KPj4+IEkgdGVzdGVkIHRoaXMgd2l0
aCBudWxsX2JsayBieSBlbXVsYXRpbmcgYSBkZXZpY2UgdGhhdCBoYXMgMTAKPj4+IGNvbnZlbnRp
b25hbCB6b25lcyBhbmQgNCBzZXF1ZW50aWFsIHpvbmVzLCBhbmQgdGhlIGZpbGVzeXN0ZW0gY2Fu
IGJlCj4+PiBmb3JtYXR0ZWQgc3VjY2Vzc2Z1bGx5LiBJbiB0aGlzIGNhc2UsIHRoZSBmaWxlc3lz
dGVtIHNob3VsZCBhbHNvIGJlCj4+PiBtb3VudGFibGUsIGFuZCBzYmktPm1heF9vcGVuX3pvbmVz
IHNob3VsZCBiZSAxNC4gSG93ZXZlciwgaWYKPj4+IHpvbmVfbWF4X29wZW4gaXMgc2V0IHRvIDMs
IHRoZSBmaWxlc3lzdGVtIGNhbm5vdCBiZSBtb3VudGVkLgo+Pj4KPj4+ICNtb2Rwcm9iZSBudWxs
X2JsayBucl9kZXZpY2VzPTEgem9uZWQ9McKgIHpvbmVfbnJfY29udj0xMMKgIHpvbmVfc2l6ZT0x
MDI0Cj4+PiBnYj0xNCBicz00MDk2IHJvdGF0aW9uYWw9MCB6b25lX21heF9vcGVuPTQKPj4+ICNt
a2ZzLmYyZnMgLW0gLWMgL2Rldi9udWxsYjAgL2Rldi92ZGEgLWYKPj4+Cj4+PiBTbywgc2JpLT5t
YXhfb3Blbl96b25lcyBtaWdodCBiZSAjIG9mIG1heF9vcGVuX3pvbmVzIG9yICcjIG9mIHNlcXVl
bnRpYWwKPj4+IHpvbmVzJyArICcjIG9mIGNvbnZlbnRpb25hbCB6b25lcycuCj4+Pgo+Pj4gMi4g
Rm9yIG5vbiByb3RhdGlvbmFsIGRldmljZXMgd2hpY2ggb25seSBoYXZlIGNvbnZlbnRpb25hbCB6
b25lcywgSSdtCj4+PiBub3Qgc3VyZSB3aGV0aGVyIHRoZXJlIGFyZSB6b25lZCBmbGFzaCBkZXZp
Y2VzIHRoYXQgcHJvdmlkZSBvbmx5Cj4+Cj4+IEkgZ3Vlc3MgdGhpcyBpcyBhIHNpbWlsYXIgY2Fz
ZSwgd2Ugc2hvdWxkIG5vdCBsZXQgbW91bnQoKSBmYWlsIGZvciBzdWNoIGNhc2UsCj4+IHJpZ2h0
Pwo+IAo+IFllcywgaXQgc2hvdWxkIGJlIG1vdXRhYmxlLiBJJ2xsIHRha2UgYWxsIHRoZXNlIGNh
c2VzIGludG8gYWNjb3VudCBpbgo+IHRoZSB2MyBwYXRjaC4KPiAKPj4KPj4gLSBtb2Rwcm9iZSBu
dWxsX2JsayBucl9kZXZpY2VzPTEgem9uZWQ9MSB6b25lX25yX2NvbnY9NTEyIHpvbmVfc2l6ZT0y
IFwKPj4gZ2I9MSBicz00MDk2IHJvdGF0aW9uYWw9MCB6b25lX21heF9vcGVuPTYKPiAKPiBUaGlz
IHNjZW5hcmlvIGNhbm5vdCBiZSBlbXVsYXRlZCB3aXRoIG51bGxfYmxrLiBUaGVyZSBtdXN0IGJl
IGF0IGxlYXN0IDEKPiBzZXF1ZW50aWFsIHpvbmUsIGFuZCB6b25lX21heF9vcGVuIGlzIGdyZWF0
ZXIgdGhhbiAjIG9mIHNlcXVlbnRpYWwKCk9oLCBJIHNlZS4KCnJvb3RAbG9jYWxob3N0On4jIGR1
bXAuZjJmcyAtZCAzIC9kZXYvbnVsbGIwCkluZm86IERlYnVnIGxldmVsID0gMwpbZjJmc19jaGVj
a196b25lczogMzU1XSBab25lIDAwMDAwOiBDb252ZW50aW9uYWwsIGNvbmQgMHgwIChOb3Qtd3Jp
dGUtcG9pbnRlciksIHNlY3RvciAwLCA0MDk2IHNlY3RvcnMKLi4uCltmMmZzX2NoZWNrX3pvbmVz
OiAzNTVdIFpvbmUgMDA1MTA6IENvbnZlbnRpb25hbCwgY29uZCAweDAgKE5vdC13cml0ZS1wb2lu
dGVyKSwgc2VjdG9yIDIwODg5NjAsIDQwOTYgc2VjdG9ycwpbZjJmc19jaGVja196b25lczogMzY2
XSBab25lIDAwNTExOiB0eXBlIDB4MiAoU2VxdWVudGlhbC13cml0ZS1yZXF1aXJlZCksIGNvbmQg
MHgxIChFbXB0eSksIG5lZWRfcmVzZXQgMCwgbm9uX3NlcSAwLCBzZWN0b3IgMjA5MzA1NiwgNDA5
NiBzZWN0b3JzLCBjYXBhY2l0eSA0MDk2LCB3cCBzZWN0b3IgMjA5MzA1NgoKSSBtYXkgc3VmZmVy
IGRpZmZlcmVudCBmYWlsdXJlIGR1cmluZyBtb3VudGluZyBhIHN1Y2Nlc3NmdWxseSBmb3JtYXR0
ZWQKbnVsbGJsayBkZXZpY2UuCgpbICAzNDYuMTQzNTIwXSBGMkZTLWZzIChudWxsYjApOiBNYWdp
YyBNaXNtYXRjaCwgdmFsaWQoMHhmMmY1MjAxMCkgLSByZWFkKDB4MCkKWyAgMzQ2LjE0MzUyNl0g
RjJGUy1mcyAobnVsbGIwKTogQ2FuJ3QgZmluZCB2YWxpZCBGMkZTIGZpbGVzeXN0ZW0gaW4gMXRo
IHN1cGVyYmxvY2sKWyAgMzQ2LjE0NjE1OV0gRjJGUy1mcyAobnVsbGIwKTogTWFnaWMgTWlzbWF0
Y2gsIHZhbGlkKDB4ZjJmNTIwMTApIC0gcmVhZCgweDApClsgIDM0Ni4xNDYxNjJdIEYyRlMtZnMg
KG51bGxiMCk6IENhbid0IGZpbmQgdmFsaWQgRjJGUyBmaWxlc3lzdGVtIGluIDJ0aCBzdXBlcmJs
b2NrCgpUaGFua3MsCgoKPiB6b25lcywgd2hlcmVhcyBpbiByZWFsaXR5IG1heF9vcGVuX3pvbmVz
IGlzIDAuCj4gCj4gWW9uZ3BlbmcsCj4gCj4+IC0gbWtmcy5mMmZzIC1tIC9kZXYvbnVsbGIwCj4+
IC0gbW91bnQgL2Rldi9udWxsYjAgL21udC9mMmZzCj4+Cj4+IFRoYW5rcywKPj4KPj4+IGNvbnZl
bnRpb25hbCB6b25lcy4gSWYgc3VjaCBkZXZpY2VzIGRvIGV4aXN0LCB0aGVuIHJldHVybmluZyAt
RUlOVkFMIGlzCj4+PiBpbmRlZWQgbm90IGFwcHJvcHJpYXRlLiBzYmktPm1heF9vcGVuX3pvbmVz
IHNob3VsZCBiZSAjIG9mIGNvbnZlbnRpb25hbAo+Pj4gem9uZXMuCj4+Pgo+Pj4gMy4gRm9yIG5v
biByb3RhdGlvbmFsIGRldmljZXMgd2hpY2ggb25seSBoYXZlIHNlcXVlbnRpYWwgem9uZXMsIHNi
aS0KPj4+PiBtYXhfb3Blbl96b25lcyBzaG91bGQgYmUgIyBtYXhfb3Blbl96b25lcy4KPj4+Cj4+
PiA0LiBGb3Igcm90YXRpb25hbCBkZXZpY2VzLCBzYmktPm1heF9vcGVuX3pvbmVzIHNob3VsZCBi
ZSAjIHpvbmVzIG9yCj4+PiBtYXhfb3Blbl96b25lcy4KPj4+Cj4+PiBBbSBJIG1pc3NpbmcgYW55
IG90aGVyIGNhc2VzPwo+Pj4KPj4+IFlvbmdwZW5nLAo+Pj4KPj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oCB9Cj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgbWF4X29wZW5fem9uZXMgPSBGREVWKGRldmkpLm5y
X2Jsa3o7Cj4+Pj4+PiArwqDCoMKgIH0KPj4+Pj4+ICvCoMKgwqAgc2JpLT5tYXhfb3Blbl96b25l
cyA9IG1pbl90KHVuc2lnbmVkIGludCwgbWF4X29wZW5fem9uZXMsIHNiaS0KPj4+Pj4+PiBtYXhf
b3Blbl96b25lcyk7Cj4+Pj4+PiArwqDCoMKgIGlmIChzYmktPm1heF9vcGVuX3pvbmVzIDwgRjJG
U19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGYyZnNf
ZXJyKHNiaSwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ6b25lZDogbWF4IG9wZW4g
em9uZXMgJXUgaXMgdG9vIHNtYWxsLCBuZWVkIGF0IGxlYXN0ICV1Cj4+Pj4+PiBvcGVuIHpvbmVz
IiwKPj4+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9uZXMsIEYy
RlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MpOwo+Pj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVy
biAtRUlOVkFMOwo+Pj4+Pj4gK8KgwqDCoCB9Cj4+Pj4+PiArCj4+Pj4+PiDCoMKgwqDCoMKgwqAg
RkRFVihkZXZpKS5ibGt6X3NlcSA9IGYyZnNfa3Z6YWxsb2Moc2JpLAo+Pj4+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgQklUU19UT19MT05HUyhGREVWKGRl
dmkpLm5yX2Jsa3opCj4+Pj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCAqIHNpemVvZih1bnNpZ25lZCBsb25nKSwKPj4+Pj4+IC0twqAKPj4+Pj4+IDIuNDMu
MAo+Pj4KPj4+Cj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYy
ZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAKCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
