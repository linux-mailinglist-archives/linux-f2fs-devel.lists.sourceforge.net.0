Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 144D8C60412
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 15 Nov 2025 12:36:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gldpNOCZj62KWqPrTPH/ITfOv5f1f9LLvhiYtoLIv9I=; b=Kvo60/xbvv/YKSgOM6CDfq9zpv
	xqquzD1m5w7ds0l74k/PwFMahT3Jvsz1MHOpRMVjOiN5VdQpVrMXxD43cJcMI/2M+ak9okA+PffOf
	IzGNdqdMgN8UQppHJ3xS2xoOZXUJhP4Ck5oHFwju6p/FdqN+Lh2tgXxQyXk5m3b4ex4I=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vKEZq-0003Bi-Qq;
	Sat, 15 Nov 2025 11:36:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vKEZq-0003BY-5r
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 11:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5FrRiQHM0xeICFB7KwWTeaCWQJ63VoaTOkCA49rLuEI=; b=KEvSK4/XK3P79jOXcSFMwJ6zRu
 GWHKQbb48uj8s+j4eHEnP4HIvdtFj1otteEF7F8rmPqqvH66WjV+Zw7oU+hVvnX79maJW6FgjQ01q
 umZvxn1588awI2V2kVZ6HGV720mXbirkVkane22NJYgUlBDC8VhnJtS5Tva6EukEbfPM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5FrRiQHM0xeICFB7KwWTeaCWQJ63VoaTOkCA49rLuEI=; b=cRpU5FB+cfEU6pGqrZnNCohV8f
 JwXVeub8nnauE2mELXvVOQ8tltsn2y41KoTVetNpccHggFNlGnp2uYA/2GNCONjzWbgpIGlNy6bt3
 Xl8yxyaxJZjxp/IE53WHhMiRrZWK7riNNpArgpgItxydNa3VvQSbfeEeYcuSleprb55c=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vKEZp-0002KJ-JT for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 15 Nov 2025 11:36:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3C84D407D3;
 Sat, 15 Nov 2025 11:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08924C113D0;
 Sat, 15 Nov 2025 11:36:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763206576;
 bh=PSPHsACd6SB7jO6qI5c1pGkvogwebaMt7TO0MBzB3kw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=dM4SYItU9brb+DtC1nz6u8bFf8giVVN9+AIi6enkBhfuoNvTfgSfOaqYStJAxWK2x
 v39+JlPkNDzCYIDxwuf6EHiMOuPWKxoOKZzduq5RA2m/Uc2T2m18wUaUUQMci7P6c0
 Cvc54sjhfs9SUlAC6j/14dZfdzri8zWPrVt1eNuEdPKm7Yi2/BZQJyzM531gT0IBD7
 1y8A2L1Aw00h9NFL0EkqyDiCR0DnKlZuz0GK0mD32KWu04JIyQs13CGlP70FQH3gbq
 VNxYg9YEbLG/muLHszSx6PtpgxK0Otw5vpX6XxDX/i2kPN+e1Q7yoJW4oRPGJ1jgK6
 nij2W5XvwvaUQ==
Message-ID: <1d03119c-bec1-4269-b385-34ce422125d3@kernel.org>
Date: Sat, 15 Nov 2025 19:36:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
 <aRT_KGOSGOGw3S4W@google.com>
 <4c31e634-f88e-4cec-8d1e-b8434a11ebee@kernel.org>
 <9df8fb59-8afb-4b20-b4fa-14bd873c9502@gmail.com>
Content-Language: en-US
In-Reply-To: <9df8fb59-8afb-4b20-b4fa-14bd873c9502@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/14/2025 3:37 PM, Yongpeng Yang wrote: > On 11/14/25
 08:51, Chao Yu via Linux-f2fs-devel wrote: >> On 11/13/2025 5:42 AM, Jaegeuk
 Kim wrote: >>> This breaks the device giving 0 open zone which wa [...] 
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
X-Headers-End: 1vKEZp-0002KJ-JT
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMTQvMjAyNSAzOjM3IFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IE9uIDExLzE0LzI1
IDA4OjUxLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAxMS8xMy8y
MDI1IDU6NDIgQU0sIEphZWdldWsgS2ltIHdyb3RlOgo+Pj4gVGhpcyBicmVha3MgdGhlIGRldmlj
ZSBnaXZpbmcgMCBvcGVuIHpvbmUgd2hpY2ggd2FzIHdvcmtpbmcuIEhlbmNlLCBJCj4+PiBkcm9w
cGVkCj4+PiB0aGUgY2hhbmdlLgo+Pj4KPj4+IE9uIDExLzEwLCBZb25ncGVuZyBZYW5nIHdyb3Rl
Ogo+Pj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pj4+
Cj4+Pj4gV2hlbiBlbXVsYXRpbmcgYSBaTlMgU1NEIG9uIHFlbXUgd2l0aCB6b25lZC5tYXhfb3Bl
biBzZXQgdG8gMCwgdGhlCj4+Pj4gRjJGUyBjYW4gc3RpbGwgYmUgbW91bnRlZCBzdWNjZXNzZnVs
bHkuIFRoZSBzeXNmcyBlbnRyeSBzaG93cwo+Pj4+IHNiaS0+bWF4X29wZW5fem9uZXMgYXMgVUlO
VF9NQVguCj4+Pj4KPj4+PiByb290QGZlZG9yYS12bTp+IyBjYXQgL3N5cy9ibG9jay9udm1lMG4x
L3F1ZXVlL3pvbmVkCj4+Pj4gaG9zdC1tYW5hZ2VkCj4+Pj4gcm9vdEBmZWRvcmEtdm06fiMgY2F0
IC9zeXMvYmxvY2svbnZtZTBuMS9xdWV1ZS9tYXhfb3Blbl96b25lcwo+Pj4+IDAKPj4+PiByb290
QGZlZG9yYS12bTp+IyBta2ZzLmYyZnMgLW0gLWMgL2Rldi9udm1lMG4xIC9kZXYvdmRhCj4+Pj4g
cm9vdEBmZWRvcmEtdm06fiMgbW91bnQgL2Rldi92ZGEgL21udC9mMmZzLwo+Pj4+IHJvb3RAZmVk
b3JhLXZtOn4jIGNhdCAvc3lzL2ZzL2YyZnMvdmRhL21heF9vcGVuX3pvbmVzCj4+Pj4gNDI5NDk2
NzI5NQo+Pj4+Cj4+Pj4gVGhlIHJvb3QgY2F1c2UgaXMgdGhhdCBzYmktPm1heF9vcGVuX3pvbmVz
IGlzIGluaXRpYWxpemVkIHRvIFVJTlRfTUFYCj4+Pj4gYW5kIG9ubHkgdXBkYXRlZCB3aGVuIHRo
ZSBkZXZpY2XigJlzIG1heF9vcGVuX3pvbmVzIGlzIGdyZWF0ZXIgdGhhbiAwLgo+Pj4+IEhvd2V2
ZXIsIGJvdGggdGhlIHNjc2kgZHJpdmVyIChzZF96YmNfcmVhZF96b25lcyBtYXkgYXNzaWducyAw
IHRvCj4+Pj4gZGV2aWNlJ3MgbWF4X29wZW5fem9uZXMpIGFuZCB0aGUgbnZtZSBkcml2ZXIgKG52
bWVfcXVlcnlfem9uZV9pbmZvIGRvbid0Cj4+Pj4gY2hlY2sgbWF4X29wZW5fem9uZXMpIGFsbG93
IG1heF9vcGVuX3pvbmVzIHRvIGJlIDAuCj4+Pj4KPj4+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBp
c3N1ZSBieSBwcmV2ZW50aW5nIG1vdW50aW5nIG9uIHpvbmVkIFNTRHMgd2hlbgo+Pj4+IG1heF9v
cGVuX3pvbmVzIGlzIDAsIHdoaWxlIHN0aWxsIGFsbG93aW5nIFNNUiBIRERzIHRvIGJlIG1vdW50
ZWQuCj4+Pj4gaW5pdF9ibGt6X2luZm8oKSBpcyBvbmx5IGNhbGxlZCBieSBmMmZzX3NjYW5fZGV2
aWNlcygpLCBhbmQgdGhlCj4+Pj4gYmxrem9uZWQgZmVhdHVyZSBoYXMgYWxyZWFkeSBiZWVuIGNo
ZWNrZWQgdGhlcmUuIFNvLCB0aGlzIHBhdGNoIGFsc28KPj4+PiByZW1vdmUgcmVkdW5kYW50IHpv
bmVkIGRldmljZSBjaGVja3MuCj4+Pj4KPj4+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5n
IDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+PiAtLS0KPj4+PiAgwqAgZnMvZjJmcy9zdXBl
ci5jIHwgMzYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+Pj4gIMKgIDEg
ZmlsZSBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCspLCAxNSBkZWxldGlvbnMoLSkKPj4+Pgo+Pj4+
IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N1cGVyLmMgYi9mcy9mMmZzL3N1cGVyLmMKPj4+PiBpbmRl
eCBkYjdhZmI4MDY0MTEuLjZkYzg5NDVlMjRhZiAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL3N1
cGVyLmMKPj4+PiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPj4+PiBAQCAtNDM1MywyMSArNDM1Myw2
IEBAIHN0YXRpYyBpbnQgaW5pdF9ibGt6X2luZm8oc3RydWN0IGYyZnNfc2JfaW5mbwo+Pj4+ICpz
YmksIGludCBkZXZpKQo+Pj4+ICDCoMKgwqDCoMKgIHVuc2lnbmVkIGludCBtYXhfb3Blbl96b25l
czsKPj4+PiAgwqDCoMKgwqDCoCBpbnQgcmV0Owo+Pj4+IC3CoMKgwqAgaWYgKCFmMmZzX3NiX2hh
c19ibGt6b25lZChzYmkpKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gMDsKPj4+PiAtCj4+
Pj4gLcKgwqDCoCBpZiAoYmRldl9pc196b25lZChGREVWKGRldmkpLmJkZXYpKSB7Cj4+Pj4gLcKg
wqDCoMKgwqDCoMKgIG1heF9vcGVuX3pvbmVzID0gYmRldl9tYXhfb3Blbl96b25lcyhiZGV2KTsK
Pj4+PiAtwqDCoMKgwqDCoMKgwqAgaWYgKG1heF9vcGVuX3pvbmVzICYmIChtYXhfb3Blbl96b25l
cyA8IHNiaS0+bWF4X29wZW5fem9uZXMpKQo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNi
aS0+bWF4X29wZW5fem9uZXMgPSBtYXhfb3Blbl96b25lczsKPj4+PiAtwqDCoMKgwqDCoMKgwqAg
aWYgKHNiaS0+bWF4X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihzYmkpLmFjdGl2ZV9sb2dzKSB7
Cj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZjJmc19lcnIoc2JpLAo+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgInpvbmVkOiBtYXggb3BlbiB6b25lcyAldSBpcyB0b28g
c21hbGwsIG5lZWQgYXQKPj4+PiBsZWFzdCAldSBvcGVuIHpvbmVzIiwKPj4+PiAtwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNiaS0+bWF4X29wZW5fem9uZXMsIEYyRlNfT1BUSU9OKHNi
aSkuYWN0aXZlX2xvZ3MpOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlO
VkFMOwo+Pj4+IC3CoMKgwqDCoMKgwqDCoCB9Cj4+Pj4gLcKgwqDCoCB9Cj4+Pj4gLQo+Pj4+ICDC
oMKgwqDCoMKgIHpvbmVfc2VjdG9ycyA9IGJkZXZfem9uZV9zZWN0b3JzKGJkZXYpOwo+Pj4+ICDC
oMKgwqDCoMKgIGlmIChzYmktPmJsb2Nrc19wZXJfYmxreiAmJiBzYmktPmJsb2Nrc19wZXJfYmxr
eiAhPQo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFNFQ1RPUl9UT19C
TE9DSyh6b25lX3NlY3RvcnMpKQo+Pj4+IEBAIC00Mzc4LDYgKzQzNjMsMjcgQEAgc3RhdGljIGlu
dCBpbml0X2Jsa3pfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvCj4+Pj4gKnNiaSwgaW50IGRldmkp
Cj4+Pj4gIMKgwqDCoMKgwqAgaWYgKG5yX3NlY3RvcnMgJiAoem9uZV9zZWN0b3JzIC0gMSkpCj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCBGREVWKGRldmkpLm5yX2Jsa3orKzsKPj4+PiArwqDCoMKg
IG1heF9vcGVuX3pvbmVzID0gYmRldl9tYXhfb3Blbl96b25lcyhiZGV2KTsKPj4+PiArwqDCoMKg
IGlmICghbWF4X29wZW5fem9uZXMpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgLyoKPj4+PiArwqDC
oMKgwqDCoMKgwqDCoCAqIFNTRHMgcmVxdWlyZSBtYXhfb3Blbl96b25lcyA+IDAgdG8gYmUgbW91
bnRhYmxlLgo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgICogRm9yIEhERHMsIGlmIG1heF9vcGVuX3pv
bmVzIGlzIHJlcG9ydGVkIGFzIDAsIGl0IGRvZXNuJ3QKPj4+PiBtYXR0ZXIsCj4+Pj4gK8KgwqDC
oMKgwqDCoMKgwqAgKiBzZXQgaXQgdG8gRkRFVihkZXZpKS5ucl9ibGt6Lgo+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgICovCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChiZGV2X25vbnJvdChiZGV2KSkg
ewo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGYyZnNfZXJyKHNiaSwgInpvbmVkOiBTU0Qg
ZGV2aWNlICVzIHdpdGhvdXQgb3BlbiB6b25lcyIsCj4+Pj4gRkRFVihkZXZpKS5wYXRoKTsKPj4+
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4KPj4gT2gsIHNvLCBm
b3IgY29udmVudGlvbmFsIFVGUywgaXQgd2lsbCBnbyBpbnRvIHRoaXMgcGF0aCBhcyBTU0Qgdy8g
emVybwo+PiBvcGVuIHpvbmU/Cj4+Cj4+IEFueSB3YXkgdG8gZGlzdGluZ3Vpc2ggdGhhdD8KPj4K
Pj4gVGhhbmtzLAo+Pgo+IAo+IHNiaS0+bWF4X29wZW5fem9uZXMgbWlnaHQgYmUgY2xhc3NpZmll
ZCBpbnRvIDQgY2FzZXM6Cj4gCj4gMS4gRm9yIG5vbiByb3RhdGlvbmFsIGRldmljZXMgdGhhdCBo
YXZlIGJvdGggY29udmVudGlvbmFsIHpvbmVzIGFuZAo+IHNlcXVlbnRpYWwgem9uZXMsIHdlIHNo
b3VsZCBzdGlsbCBlbnN1cmUgdGhhdCBtYXhfb3Blbl96b25lcyA+IDAuIElmIHRoZQo+ICMgb2Yg
c2VxdWVudGlhbCB6b25lcyBleGNlZWRzIG1heF9vcGVuX3pvbmVzLCB3ZSBzdGlsbCBuZWVkIHRv
IGd1YXJhbnRlZQo+IHRoYXQgbWF4X29wZW5fem9uZXMgPj0gRjJGU19PUFRJT04oc2JpKS5hY3Rp
dmVfbG9ncy4KPiAKPiBJIHRlc3RlZCB0aGlzIHdpdGggbnVsbF9ibGsgYnkgZW11bGF0aW5nIGEg
ZGV2aWNlIHRoYXQgaGFzIDEwCj4gY29udmVudGlvbmFsIHpvbmVzIGFuZCA0IHNlcXVlbnRpYWwg
em9uZXMsIGFuZCB0aGUgZmlsZXN5c3RlbSBjYW4gYmUKPiBmb3JtYXR0ZWQgc3VjY2Vzc2Z1bGx5
LiBJbiB0aGlzIGNhc2UsIHRoZSBmaWxlc3lzdGVtIHNob3VsZCBhbHNvIGJlCj4gbW91bnRhYmxl
LCBhbmQgc2JpLT5tYXhfb3Blbl96b25lcyBzaG91bGQgYmUgMTQuIEhvd2V2ZXIsIGlmCj4gem9u
ZV9tYXhfb3BlbiBpcyBzZXQgdG8gMywgdGhlIGZpbGVzeXN0ZW0gY2Fubm90IGJlIG1vdW50ZWQu
Cj4gCj4gI21vZHByb2JlIG51bGxfYmxrIG5yX2RldmljZXM9MSB6b25lZD0xICB6b25lX25yX2Nv
bnY9MTAgIHpvbmVfc2l6ZT0xMDI0Cj4gZ2I9MTQgYnM9NDA5NiByb3RhdGlvbmFsPTAgem9uZV9t
YXhfb3Blbj00Cj4gI21rZnMuZjJmcyAtbSAtYyAvZGV2L251bGxiMCAvZGV2L3ZkYSAtZgo+IAo+
IFNvLCBzYmktPm1heF9vcGVuX3pvbmVzIG1pZ2h0IGJlICMgb2YgbWF4X29wZW5fem9uZXMgb3Ig
JyMgb2Ygc2VxdWVudGlhbAo+IHpvbmVzJyArICcjIG9mIGNvbnZlbnRpb25hbCB6b25lcycuCj4g
Cj4gMi4gRm9yIG5vbiByb3RhdGlvbmFsIGRldmljZXMgd2hpY2ggb25seSBoYXZlIGNvbnZlbnRp
b25hbCB6b25lcywgSSdtCj4gbm90IHN1cmUgd2hldGhlciB0aGVyZSBhcmUgem9uZWQgZmxhc2gg
ZGV2aWNlcyB0aGF0IHByb3ZpZGUgb25seQoKSSBndWVzcyB0aGlzIGlzIGEgc2ltaWxhciBjYXNl
LCB3ZSBzaG91bGQgbm90IGxldCBtb3VudCgpIGZhaWwgZm9yIHN1Y2ggY2FzZSwKcmlnaHQ/Cgot
IG1vZHByb2JlIG51bGxfYmxrIG5yX2RldmljZXM9MSB6b25lZD0xIHpvbmVfbnJfY29udj01MTIg
em9uZV9zaXplPTIgXApnYj0xIGJzPTQwOTYgcm90YXRpb25hbD0wIHpvbmVfbWF4X29wZW49Ngot
IG1rZnMuZjJmcyAtbSAvZGV2L251bGxiMAotIG1vdW50IC9kZXYvbnVsbGIwIC9tbnQvZjJmcwoK
VGhhbmtzLAoKPiBjb252ZW50aW9uYWwgem9uZXMuIElmIHN1Y2ggZGV2aWNlcyBkbyBleGlzdCwg
dGhlbiByZXR1cm5pbmcgLUVJTlZBTCBpcwo+IGluZGVlZCBub3QgYXBwcm9wcmlhdGUuIHNiaS0+
bWF4X29wZW5fem9uZXMgc2hvdWxkIGJlICMgb2YgY29udmVudGlvbmFsCj4gem9uZXMuCj4gCj4g
My4gRm9yIG5vbiByb3RhdGlvbmFsIGRldmljZXMgd2hpY2ggb25seSBoYXZlIHNlcXVlbnRpYWwg
em9uZXMsIHNiaS0KPj4gbWF4X29wZW5fem9uZXMgc2hvdWxkIGJlICMgbWF4X29wZW5fem9uZXMu
Cj4gCj4gNC4gRm9yIHJvdGF0aW9uYWwgZGV2aWNlcywgc2JpLT5tYXhfb3Blbl96b25lcyBzaG91
bGQgYmUgIyB6b25lcyBvcgo+IG1heF9vcGVuX3pvbmVzLgo+IAo+IEFtIEkgbWlzc2luZyBhbnkg
b3RoZXIgY2FzZXM/Cj4gCj4gWW9uZ3BlbmcsCj4gCj4+Pj4gK8KgwqDCoMKgwqDCoMKgIH0KPj4+
PiArwqDCoMKgwqDCoMKgwqAgbWF4X29wZW5fem9uZXMgPSBGREVWKGRldmkpLm5yX2Jsa3o7Cj4+
Pj4gK8KgwqDCoCB9Cj4+Pj4gK8KgwqDCoCBzYmktPm1heF9vcGVuX3pvbmVzID0gbWluX3QodW5z
aWduZWQgaW50LCBtYXhfb3Blbl96b25lcywgc2JpLQo+Pj4+PiBtYXhfb3Blbl96b25lcyk7Cj4+
Pj4gK8KgwqDCoCBpZiAoc2JpLT5tYXhfb3Blbl96b25lcyA8IEYyRlNfT1BUSU9OKHNiaSkuYWN0
aXZlX2xvZ3MpIHsKPj4+PiArwqDCoMKgwqDCoMKgwqAgZjJmc19lcnIoc2JpLAo+Pj4+ICvCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNtYWxs
LCBuZWVkIGF0IGxlYXN0ICV1Cj4+Pj4gb3BlbiB6b25lcyIsCj4+Pj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgc2JpLT5tYXhfb3Blbl96b25lcywgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9n
cyk7Cj4+Pj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiAtRUlOVkFMOwo+Pj4+ICvCoMKgwqAgfQo+
Pj4+ICsKPj4+PiAgwqDCoMKgwqDCoCBGREVWKGRldmkpLmJsa3pfc2VxID0gZjJmc19rdnphbGxv
YyhzYmksCj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBC
SVRTX1RPX0xPTkdTKEZERVYoZGV2aSkubnJfYmxreikKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+Pj4+IC0t
IAo+Pj4+IDIuNDMuMAo+IAo+IAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
