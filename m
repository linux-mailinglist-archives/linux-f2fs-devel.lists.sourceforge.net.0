Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FF773E47C8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 16:38:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mD6QK-0003AQ-1k; Mon, 09 Aug 2021 14:38:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mD6QI-0003A8-QE
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:38:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Km/6rAX0uPUHRkKM7TruPxy0TBDx6xubkK8kHYvBolc=; b=ho8A8f1bwk0RV4+7KSJR1tkiNj
 XK831mKMufzo2sPCHbo2BlaNTAc6mnGST0/cnINlZeIJPrv0bF6UigxuNlJ74UvuUrjLGAI+zjI7e
 x5j+dGZliYZePzW1R2lru6VE6VcnVNfHQSsZ+i8DK2W3aFLo5NMlFqwk+LwQIJl1+X6s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Km/6rAX0uPUHRkKM7TruPxy0TBDx6xubkK8kHYvBolc=; b=cL8lbzPO4G0mNjyTCYkZJt1iwR
 nJeE8WW21Am++Bz3mZv9KgMPS4p/bsL9mInQtsSNcTgs8rzoxtG7xJR5wYLwKueIvWaO/HFntcmIm
 +BZkufujrxcWcoT1JwYlnsjQ+eY761rn5EkkAlqA/syql8V+Z15LKvlHFx7ivHffYZn0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mD6QH-000flG-FV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:38:38 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 41F7161004;
 Mon,  9 Aug 2021 14:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628519912;
 bh=q0EfcIg5YsWdhK0HlHZkUATQcjDVaJVhVvuigjPDNeY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=TOWghRjZP3MKgOFAfTdfRflstoK/KerQ5GP0cEHUbYm6lHzUKLOv6ICHh5BcalueQ
 I7s/F5qVPXDy4UruOl85o9X/z3SeKMJscR6zwTADSpJyAI6A2yMW5IhR+d4VmvXcE/
 ahtWUBCaouyCOoiHKAsWvTGJbVLoBmJjcy4fEOL1OWQxIftqB1DZVsZjSPJAu0qH7I
 vz6WTbPuGW47QfDenP7RiA2+nAldRkMbna3fvJ8Db/RFP9PzOP2vQc8KrsqOS1LT85
 nPs3XdzN2IxhtgVT83LySPM6ryXWyFB0GhVOTma22eczQbNZLPPIqvEadKA0NvNLT+
 BqfEhWKtfy3Vg==
To: Fengnan Chang <changfengnan@vivo.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20210722032536.150423-1-changfengnan@vivo.com>
 <b2ce8000-226e-6dfa-0052-36cb2faeaf3a@kernel.org>
 <72752bc5-c8b9-43b2-ca82-d7364238649e@vivo.com>
 <1c45e327-00f4-1cc8-b168-9a7b571ba47a@kernel.org>
 <a8412e91-e43c-6801-b45c-52d390921b17@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <73f298ed-e945-5b7d-a9b8-69aafeb7ac05@kernel.org>
Date: Mon, 9 Aug 2021 22:38:27 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <a8412e91-e43c-6801-b45c-52d390921b17@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mD6QH-000flG-FV
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: compress: avoid duplicate counting
 of valid blocks when read compressed file
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS84LzkgMTE6NDYsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4gSGkgY2hhbzoKPiAgICAg
IFNpbmNlIGNjLmNsdXN0ZXJfaWR4IG9ubHkgd2lsbCBiZSBzZXQgaW4gZjJmc19jb21wcmVzc19j
dHhfYWRkX3BhZ2UsCj4gc28gZm9yIG5vbi1jb21wcmVzc2VkIGNsdXN0ZXIsIGNjLmNsdXN0ZXJf
aWR4IHNob3VsZCBhbHdheXMgYmUgTlVMTC4gaXQKPiBtZWFucyB0aGF0IHRoZSBoYW5kbGluZyBw
cm9jZXNzIG9mIG5vbi1jb21wcmVzc2VkIGNsdXN0ZXIgaXMgc2FtZSBhcyBvbGRlci4KCll1cCwg
c28gd2hhdCBJIG1lYW4gaXMgd2h5IG5vdCBza2lwcGluZyBmMmZzX2lzX2NvbXByZXNzZWRfY2x1
c3RlcigpIGNoZWNrCmZvciBub24tY29tcHJlc3NlZCBjbHVzdGVyIGFzIHdlIGRpZCBmb3IgY29t
cHJlc3NlZCBjbHVzdGVyLgoKVGhhbmtzLAoKPiAKPiBPbiAyMDIxLzgvNiA4OjU3LCBDaGFvIFl1
IHdyb3RlOgo+PiBPbiAyMDIxLzcvMjMgMTE6MTgsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+PiBm
MmZzX3JlYWRfbXVsdGlfcGFnZXMgd2lsbCBoYW5kbGXvvIxhbGwgdHJ1bmNhdGUgcGFnZSB3aWxs
IGJlIHplcm8gb3V0LAo+Pj4gV2hldGhlciBwYXJ0aWFsIG9yIGFsbCBwYWdlIGluIGNsdXN0ZXIu
Cj4+Pgo+Pj4KPj4+IE9uIDIwMjEvNy8yMiAyMTo0NywgQ2hhbyBZdSB3cm90ZToKPj4+PiBPbiAy
MDIxLzcvMjIgMTE6MjUsIEZlbmduYW4gQ2hhbmcgd3JvdGU6Cj4+Pj4+IFNpbmNlIGNsdXN0ZXIg
aXMgYmFzaWMgdW5pdCBvZiBjb21wcmVzc2lvbiwgb25lIGNsdXN0ZXIgaXMKPj4+Pj4gY29tcHJl
c3NlZCBvcgo+Pj4+PiBub3QsIHNvIHdlIGNhbiBjYWxjdWxhdGUgdmFsaWQgYmxvY2tzIG9ubHkg
Zm9yIGZpcnN0IHBhZ2UgaW4KPj4+Pj4gY2x1c3RlciwgdGhlCj4+Pj4+IG90aGVyIHBhZ2VzIGp1
c3Qgc2tpcC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBDaGFuZyA8Y2hhbmdm
ZW5nbmFuQHZpdm8uY29tPgo+Pj4+PiAtLS0KPj4+Pj4gIMKgwqAgZnMvZjJmcy9kYXRhLmMgfCAx
MyArKysrKysrLS0tLS0tCj4+Pj4+ICDCoMKgIDEgZmlsZSBjaGFuZ2VkLCA3IGluc2VydGlvbnMo
KyksIDYgZGVsZXRpb25zKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2RhdGEu
YyBiL2ZzL2YyZnMvZGF0YS5jCj4+Pj4+IGluZGV4IGQyY2Y0OGM1YTJlNC4uYTAwOTlkODMyOWYw
IDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4+PiArKysgYi9mcy9mMmZzL2Rh
dGEuYwo+Pj4+PiBAQCAtMjMwNCwxMiArMjMwNCwxMyBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2Vf
cmVhZHBhZ2VzKHN0cnVjdCBpbm9kZQo+Pj4+PiAqaW5vZGUsCj4+Pj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCkKPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4+ICDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcmV0ID0gZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoaW5vZGUsIHBhZ2UtPmluZGV4KTsK
Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBzZXRfZXJyb3JfcGFnZTsKPj4+Pj4gLcKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgZWxzZSBpZiAoIXJldCkKPj4+Pj4gLcKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xlX3BhZ2U7Cj4+Pj4KPj4+PiBIb3cgYWJvdXQg
dHJ1bmNhdGlvbiByYWNlcyB3aXRoIHJlYWQ/Cj4+Cj4+IExvb2sgaW50byB0aGlzIGFnYWluLCBp
dCBsb29rcyBmaW5lLCB0cnVuY2F0aW9uIHRyaWVzIHRvIGdyYWIgYWxsIHBhZ2VzCj4+IGxvY2sK
Pj4gb2YgY2x1c3RlciwgYnV0IHJlYWRhaGVhZCBoYXMgYWxyZWFkeSBoZWxkIHNvbWUvYWxsIG9m
IHRoZW0sIHNvIHRoZXJlIGlzIG5vCj4+IHN1Y2ggcmFjZSBjb25kaXRpb24uCj4+Cj4+IFNvIGNv
bXByZXNzZWQgY2x1c3RlciBjYXNlIGxvb2tzIGZpbmUgdG8gbWUsIGJ1dCB3ZSBzdGlsbCBuZWVk
IHRvIGNhbGwKPj4gZjJmc19pc19jb21wcmVzc2VkX2NsdXN0ZXIoKSBldmVyeSB0aW1lIGZvciBu
b24tY29tcHJlc3NlZCBjbHVzdGVyLCBjb3VsZAo+PiB5b3UgcGxlYXNlIGNoZWNrIHRoYXQgYXMg
d2VsbD8KPj4KPj4gVGhhbmtzLAo+Pgo+Pj4+Cj4+Pj4gVGhhbmtzLAo+Pj4+Cj4+Pj4+IC0KPj4+
Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGNjLmNsdXN0ZXJfaWR4ID09IE5VTExfQ0xV
U1RFUikgewo+Pj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldCA9IGYyZnNf
aXNfY29tcHJlc3NlZF9jbHVzdGVyKGlub2RlLCBwYWdlLT5pbmRleCk7Cj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKHJldCA8IDApCj4+Pj4+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHNldF9lcnJvcl9wYWdlOwo+Pj4+PiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVsc2UgaWYgKCFyZXQpCj4+Pj4+ICvCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIHJlYWRfc2luZ2xlX3BhZ2U7Cj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgcmV0ID0gZjJmc19pbml0X2NvbXByZXNzX2N0eCgmY2MpOwo+Pj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBpZiAocmV0KQo+Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gc2V0X2Vycm9yX3BhZ2U7Cj4+Pj4+Cj4+Pj4KPj4KCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
