Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED0D1C5B162
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Nov 2025 04:17:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uwoHZf4qIT5Gh9jwpElPVJs3C7LBBFFys/UVy9YJh2A=; b=W9pkioqOhs9vyz7GmNcurVeSD0
	JYOc38sl73QxU5PhKRM9Mu0soECsPIqEI/Xe9l3+StosOKlWomeH6zn9Kwhr66EH9KHl24B0isc8M
	dib4QPMIcpYE1LsX7HcHY0jvF3/fP7QmyMJFXJUdft7NaQ1KIvIEliA/iRKzBNhE4xg4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJkJp-0000FJ-Lv;
	Fri, 14 Nov 2025 03:17:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vJkJc-0000F2-U6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 03:17:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F7VFtDK10ME2uRNuhObRY5uNQJYocnWjpx4DPLkpa80=; b=K6CSk7uyvU284gTa49WphfWsd4
 uCdF8SId2TjVzQ8+pb342YQB73yQnVi+7VOpv528Ge+I4GAJxzqT3waRLKq8RFRl2qLeLKP6Tb6Lq
 8tKyq1ORK9/VfcNm2fhubo8lX8dXTO9yMrY3/lbTKfVuCjDPybVHMYsq9h8ABk33O1to=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F7VFtDK10ME2uRNuhObRY5uNQJYocnWjpx4DPLkpa80=; b=jOfQnWv8LQhl9trMBOTKWn8kho
 S+Gf9yO6/Iocwr9heGHGT2l/OrEuWp8++HhkAS2+Pk+ujvqRpwTxGkdNhJ+G6iwH0KGDKqx+FqH+M
 /Kfg8czOJiJHPQKLtnrZuAm0iffxAl6xpTjLwNaH2FECDbJngpudCKN1diKPxrgho7LM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vJkJc-0005Ft-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 14 Nov 2025 03:17:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 54DDC4396D;
 Fri, 14 Nov 2025 00:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F4CC19424;
 Fri, 14 Nov 2025 00:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1763081467;
 bh=RTNi5eY+1ocNQ8onnqcc1qEmLqHpa1czXHJmA4rjJvA=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=GnPcYYrLcsdPiR26lRPgnlguX6hlVVxwl3CZxPRSDQtvZmCQIdGDwMBz6eqbg3lLe
 IiPn8pT7S84G8nOOvnDW5tKBDW/rp353uSSVJiVPAabbN7CKaPg+SFeP1E4Xte3+YL
 O2zksQnAMouW2TExAni9zUDRam8IdjVfSYuKCeJKkrsra9KCUDgBVoV0SaZJ5zbFpc
 SWs/3XCmfg+XAwm5vlRcHAs7t5OXtBJGjd7E3jG2F3Sb4W4PWbVsXAQwKTtTDZFw1R
 Xi8u4LJuRifmUl5dM+vlHtKpENm264TxZ+A5b7X5mqpM8N5KZC8QNJNz3PvPZQWYeq
 F/vjRy6Fli4Kw==
Message-ID: <4c31e634-f88e-4cec-8d1e-b8434a11ebee@kernel.org>
Date: Fri, 14 Nov 2025 08:51:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng@xiaomi.com>
References: <20251110082223.902207-1-yangyongpeng.storage@gmail.com>
 <20251110082223.902207-3-yangyongpeng.storage@gmail.com>
 <aRT_KGOSGOGw3S4W@google.com>
Content-Language: en-US
In-Reply-To: <aRT_KGOSGOGw3S4W@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/13/2025 5:42 AM, Jaegeuk Kim wrote: > This breaks the
 device giving 0 open zone which was working. Hence, I dropped > the change.
 > > On 11/10, Yongpeng Yang wrote: >> From: Yongpeng Yang <yangy [...] 
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
X-Headers-End: 1vJkJc-0005Ft-Fw
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMTMvMjAyNSA1OjQyIEFNLCBKYWVnZXVrIEtpbSB3cm90ZToKPiBUaGlzIGJyZWFrcyB0
aGUgZGV2aWNlIGdpdmluZyAwIG9wZW4gem9uZSB3aGljaCB3YXMgd29ya2luZy4gSGVuY2UsIEkg
ZHJvcHBlZAo+IHRoZSBjaGFuZ2UuCj4gCj4gT24gMTEvMTAsIFlvbmdwZW5nIFlhbmcgd3JvdGU6
Cj4+IEZyb206IFlvbmdwZW5nIFlhbmcgPHlhbmd5b25ncGVuZ0B4aWFvbWkuY29tPgo+Pgo+PiBX
aGVuIGVtdWxhdGluZyBhIFpOUyBTU0Qgb24gcWVtdSB3aXRoIHpvbmVkLm1heF9vcGVuIHNldCB0
byAwLCB0aGUKPj4gRjJGUyBjYW4gc3RpbGwgYmUgbW91bnRlZCBzdWNjZXNzZnVsbHkuIFRoZSBz
eXNmcyBlbnRyeSBzaG93cwo+PiBzYmktPm1heF9vcGVuX3pvbmVzIGFzIFVJTlRfTUFYLgo+Pgo+
PiByb290QGZlZG9yYS12bTp+IyBjYXQgL3N5cy9ibG9jay9udm1lMG4xL3F1ZXVlL3pvbmVkCj4+
IGhvc3QtbWFuYWdlZAo+PiByb290QGZlZG9yYS12bTp+IyBjYXQgL3N5cy9ibG9jay9udm1lMG4x
L3F1ZXVlL21heF9vcGVuX3pvbmVzCj4+IDAKPj4gcm9vdEBmZWRvcmEtdm06fiMgbWtmcy5mMmZz
IC1tIC1jIC9kZXYvbnZtZTBuMSAvZGV2L3ZkYQo+PiByb290QGZlZG9yYS12bTp+IyBtb3VudCAv
ZGV2L3ZkYSAvbW50L2YyZnMvCj4+IHJvb3RAZmVkb3JhLXZtOn4jIGNhdCAvc3lzL2ZzL2YyZnMv
dmRhL21heF9vcGVuX3pvbmVzCj4+IDQyOTQ5NjcyOTUKPj4KPj4gVGhlIHJvb3QgY2F1c2UgaXMg
dGhhdCBzYmktPm1heF9vcGVuX3pvbmVzIGlzIGluaXRpYWxpemVkIHRvIFVJTlRfTUFYCj4+IGFu
ZCBvbmx5IHVwZGF0ZWQgd2hlbiB0aGUgZGV2aWNl4oCZcyBtYXhfb3Blbl96b25lcyBpcyBncmVh
dGVyIHRoYW4gMC4KPj4gSG93ZXZlciwgYm90aCB0aGUgc2NzaSBkcml2ZXIgKHNkX3piY19yZWFk
X3pvbmVzIG1heSBhc3NpZ25zIDAgdG8KPj4gZGV2aWNlJ3MgbWF4X29wZW5fem9uZXMpIGFuZCB0
aGUgbnZtZSBkcml2ZXIgKG52bWVfcXVlcnlfem9uZV9pbmZvIGRvbid0Cj4+IGNoZWNrIG1heF9v
cGVuX3pvbmVzKSBhbGxvdyBtYXhfb3Blbl96b25lcyB0byBiZSAwLgo+Pgo+PiBUaGlzIHBhdGNo
IGZpeGVzIHRoZSBpc3N1ZSBieSBwcmV2ZW50aW5nIG1vdW50aW5nIG9uIHpvbmVkIFNTRHMgd2hl
bgo+PiBtYXhfb3Blbl96b25lcyBpcyAwLCB3aGlsZSBzdGlsbCBhbGxvd2luZyBTTVIgSEREcyB0
byBiZSBtb3VudGVkLgo+PiBpbml0X2Jsa3pfaW5mbygpIGlzIG9ubHkgY2FsbGVkIGJ5IGYyZnNf
c2Nhbl9kZXZpY2VzKCksIGFuZCB0aGUKPj4gYmxrem9uZWQgZmVhdHVyZSBoYXMgYWxyZWFkeSBi
ZWVuIGNoZWNrZWQgdGhlcmUuIFNvLCB0aGlzIHBhdGNoIGFsc28KPj4gcmVtb3ZlIHJlZHVuZGFu
dCB6b25lZCBkZXZpY2UgY2hlY2tzLgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZb25ncGVuZyBZYW5n
IDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4gLS0tCj4+ICAgZnMvZjJmcy9zdXBlci5jIHwg
MzYgKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5n
ZWQsIDIxIGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEv
ZnMvZjJmcy9zdXBlci5jIGIvZnMvZjJmcy9zdXBlci5jCj4+IGluZGV4IGRiN2FmYjgwNjQxMS4u
NmRjODk0NWUyNGFmIDEwMDY0NAo+PiAtLS0gYS9mcy9mMmZzL3N1cGVyLmMKPj4gKysrIGIvZnMv
ZjJmcy9zdXBlci5jCj4+IEBAIC00MzUzLDIxICs0MzUzLDYgQEAgc3RhdGljIGludCBpbml0X2Js
a3pfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBkZXZpKQo+PiAgIAl1bnNpZ25l
ZCBpbnQgbWF4X29wZW5fem9uZXM7Cj4+ICAgCWludCByZXQ7Cj4+ICAgCj4+IC0JaWYgKCFmMmZz
X3NiX2hhc19ibGt6b25lZChzYmkpKQo+PiAtCQlyZXR1cm4gMDsKPj4gLQo+PiAtCWlmIChiZGV2
X2lzX3pvbmVkKEZERVYoZGV2aSkuYmRldikpIHsKPj4gLQkJbWF4X29wZW5fem9uZXMgPSBiZGV2
X21heF9vcGVuX3pvbmVzKGJkZXYpOwo+PiAtCQlpZiAobWF4X29wZW5fem9uZXMgJiYgKG1heF9v
cGVuX3pvbmVzIDwgc2JpLT5tYXhfb3Blbl96b25lcykpCj4+IC0JCQlzYmktPm1heF9vcGVuX3pv
bmVzID0gbWF4X29wZW5fem9uZXM7Cj4+IC0JCWlmIChzYmktPm1heF9vcGVuX3pvbmVzIDwgRjJG
U19PUFRJT04oc2JpKS5hY3RpdmVfbG9ncykgewo+PiAtCQkJZjJmc19lcnIoc2JpLAo+PiAtCQkJ
CSJ6b25lZDogbWF4IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNtYWxsLCBuZWVkIGF0IGxlYXN0ICV1
IG9wZW4gem9uZXMiLAo+PiAtCQkJCXNiaS0+bWF4X29wZW5fem9uZXMsIEYyRlNfT1BUSU9OKHNi
aSkuYWN0aXZlX2xvZ3MpOwo+PiAtCQkJcmV0dXJuIC1FSU5WQUw7Cj4+IC0JCX0KPj4gLQl9Cj4+
IC0KPj4gICAJem9uZV9zZWN0b3JzID0gYmRldl96b25lX3NlY3RvcnMoYmRldik7Cj4+ICAgCWlm
IChzYmktPmJsb2Nrc19wZXJfYmxreiAmJiBzYmktPmJsb2Nrc19wZXJfYmxreiAhPQo+PiAgIAkJ
CQlTRUNUT1JfVE9fQkxPQ0soem9uZV9zZWN0b3JzKSkKPj4gQEAgLTQzNzgsNiArNDM2MywyNyBA
QCBzdGF0aWMgaW50IGluaXRfYmxrel9pbmZvKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgaW50
IGRldmkpCj4+ICAgCWlmIChucl9zZWN0b3JzICYgKHpvbmVfc2VjdG9ycyAtIDEpKQo+PiAgIAkJ
RkRFVihkZXZpKS5ucl9ibGt6Kys7Cj4+ICAgCj4+ICsJbWF4X29wZW5fem9uZXMgPSBiZGV2X21h
eF9vcGVuX3pvbmVzKGJkZXYpOwo+PiArCWlmICghbWF4X29wZW5fem9uZXMpIHsKPj4gKwkJLyoK
Pj4gKwkJICogU1NEcyByZXF1aXJlIG1heF9vcGVuX3pvbmVzID4gMCB0byBiZSBtb3VudGFibGUu
Cj4+ICsJCSAqIEZvciBIRERzLCBpZiBtYXhfb3Blbl96b25lcyBpcyByZXBvcnRlZCBhcyAwLCBp
dCBkb2Vzbid0IG1hdHRlciwKPj4gKwkJICogc2V0IGl0IHRvIEZERVYoZGV2aSkubnJfYmxrei4K
Pj4gKwkJICovCj4+ICsJCWlmIChiZGV2X25vbnJvdChiZGV2KSkgewo+PiArCQkJZjJmc19lcnIo
c2JpLCAiem9uZWQ6IFNTRCBkZXZpY2UgJXMgd2l0aG91dCBvcGVuIHpvbmVzIiwgRkRFVihkZXZp
KS5wYXRoKTsKPj4gKwkJCXJldHVybiAtRUlOVkFMOwoKT2gsIHNvLCBmb3IgY29udmVudGlvbmFs
IFVGUywgaXQgd2lsbCBnbyBpbnRvIHRoaXMgcGF0aCBhcyBTU0Qgdy8gemVybyBvcGVuIHpvbmU/
CgpBbnkgd2F5IHRvIGRpc3Rpbmd1aXNoIHRoYXQ/CgpUaGFua3MsCgo+PiArCQl9Cj4+ICsJCW1h
eF9vcGVuX3pvbmVzID0gRkRFVihkZXZpKS5ucl9ibGt6Owo+PiArCX0KPj4gKwlzYmktPm1heF9v
cGVuX3pvbmVzID0gbWluX3QodW5zaWduZWQgaW50LCBtYXhfb3Blbl96b25lcywgc2JpLT5tYXhf
b3Blbl96b25lcyk7Cj4+ICsJaWYgKHNiaS0+bWF4X29wZW5fem9uZXMgPCBGMkZTX09QVElPTihz
YmkpLmFjdGl2ZV9sb2dzKSB7Cj4+ICsJCWYyZnNfZXJyKHNiaSwKPj4gKwkJCSJ6b25lZDogbWF4
IG9wZW4gem9uZXMgJXUgaXMgdG9vIHNtYWxsLCBuZWVkIGF0IGxlYXN0ICV1IG9wZW4gem9uZXMi
LAo+PiArCQkJc2JpLT5tYXhfb3Blbl96b25lcywgRjJGU19PUFRJT04oc2JpKS5hY3RpdmVfbG9n
cyk7Cj4+ICsJCXJldHVybiAtRUlOVkFMOwo+PiArCX0KPj4gKwo+PiAgIAlGREVWKGRldmkpLmJs
a3pfc2VxID0gZjJmc19rdnphbGxvYyhzYmksCj4+ICAgCQkJCQlCSVRTX1RPX0xPTkdTKEZERVYo
ZGV2aSkubnJfYmxreikKPj4gICAJCQkJCSogc2l6ZW9mKHVuc2lnbmVkIGxvbmcpLAo+PiAtLSAK
Pj4gMi40My4wCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
