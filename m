Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A48092731D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 11:32:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPIpa-0007pM-8b;
	Thu, 04 Jul 2024 09:32:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sPIpV-0007pC-7A
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 09:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v/DMrxIh0X8YE9ccGi22StMHOQDjPWnZm33k3o5kMTQ=; b=lhYRVC28PEriO7Amvhz4gCbAq/
 Lvsk2biCSFAUqIUKBW7iKJtlZq++djqNzt27I7w8LJ36/rjwII+i9+k6vVhjWeEJEgHHlaqesvxP2
 NuWqSolblw6ou4EapysZUtHjNEI0UodpNIRjop9p5P7n+WGy6laOMEE81kBBEVE18Ies=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v/DMrxIh0X8YE9ccGi22StMHOQDjPWnZm33k3o5kMTQ=; b=PPrwKmxN9pi0SpISGlW1woWzOg
 YbwZb8THSxMNyQMYBr95eF4oRPc3CuC3uJUkIy7nunonOV/3hRjasfvoTUrFF4Xyq9ZQc8qpo+2ZT
 XeWVQspWFjdn4vcCGKQFm7tLwaX6KqJrXOa2chE+xj+/X8kVfrXlGpricagL7N1RNJ84=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPIpV-0005eq-FX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 09:32:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5EEA962611;
 Thu,  4 Jul 2024 09:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BEEC4AF0D;
 Thu,  4 Jul 2024 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720085550;
 bh=/UU6dlcInhejLosomtZUum1OVKmIQu5j7w157Dwp7As=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=BK5kdrdbNdTvEC7iAaYKdBelQ26rM8ln0nP1Beo6FBfcBBlUkQzyplzsA/kCs234z
 RclB0PwQecPq0a9dM7XO/T4YpogaujgDKJZ+SdGnvb6L69fTd0/LVTgjum/T8jQf4b
 6vKeF+OaBZ5ivLzqGghecpxgjHdL/ozvFaZrcMDb8sN+QLT3eBytlvI4ySxfovx29p
 fEgTiPSo0YlI7ellIUlzpJC7JcfIBCkdqYwls6iBzJPZ/I1SdY52ChA07vYsTpWdz1
 CbfZoCnrFKby6N6Q2cbZXMhJYjZ+nFbyA+dKK6gtsPrYSW4ufsOYAZcflZLqkmEdLM
 dVuRoB3E10jCA==
Message-ID: <5c312ebb-a202-45e5-a82b-7b7c3f080d67@kernel.org>
Date: Thu, 4 Jul 2024 17:32:23 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: daejun7.park@samsung.com, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "daehojeong@google.com" <daehojeong@google.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <460c4708-3ec6-4fbc-8f6c-7f8e5f901061@kernel.org>
 <20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
 <CGME20240704010121epcms2p4cff8b25d976d4a1b820ba18f1eb5aa90@epcms2p4>
 <20240704075521epcms2p49cc9985b6624e4e1129907e883fbc1d9@epcms2p4>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240704075521epcms2p49cc9985b6624e4e1129907e883fbc1d9@epcms2p4>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2024/7/4 15:55, Daejun Park wrote: > Hi Chao Yu, >> >>
    --------- Original Message --------- >> Sender : Chao Yu <chao@kernel.org>
    >> Date : 2024-07-04 16:16 (GMT+9) >> Title : Re: [PATCH] f2fs: fi [...] 
 
 Content analysis details:   (-0.2 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
                             The query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                         [139.178.84.217 listed in sa-trusted.bondedsender.org]
  0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
                             query to Validity was blocked.  See
                             https://knowledge.validity.com/hc/en-us/articles/20961730681243
                              for more information.
                            [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPIpV-0005eq-FX
Subject: Re: [f2fs-dev] (2) [PATCH] f2fs: fix null reference error when
 checking end of zone
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
Cc: Nayeon Kim <nayeoni.kim@samsung.com>, Siwoo Jung <siu.jung@samsung.com>,
 Seokhwan Kim <sukka.kim@samsung.com>, Dongjin Kim <dongjin_.kim@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNC83LzQgMTU6NTUsIERhZWp1biBQYXJrIHdyb3RlOgo+IEhpwqBDaGFvIFl1LAo+PiAg
IAo+PiAtLS0tLS0tLS0gT3JpZ2luYWwgTWVzc2FnZSAtLS0tLS0tLS0KPj4gU2VuZGVyIDogQ2hh
byBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+PiBEYXRlIDogMjAyNC0wNy0wNCAxNjoxNiAoR01UKzkp
Cj4+IFRpdGxlIDogUmU6IFtQQVRDSF0gZjJmczogZml4IG51bGwgcmVmZXJlbmNlIGVycm9yIHdo
ZW4gY2hlY2tpbmcgZW5kIG9mIHpvbmUKPj4gICAKPj4gT24gMjAyNC83LzQgOTowMSwgRGFlanVu
IFBhcmsgd3JvdGU6Cj4+PiBUaGlzIHBhdGNoIGZpeGVzIGEgcG90ZW50aWFsbHkgbnVsbCBwb2lu
dGVyIGJlaW5nIGFjY2Vzc2VkIGJ5Cj4+PiBpc19lbmRfem9uZV9ibGthZGRyKCkgdGhhdCBjaGVj
a3MgdGhlIGxhc3QgYmxvY2sgb2YgYSB6b25lCj4+PiB3aGVuIGYyZnMgaXMgbW91bnRlZCBhcyBh
IHNpbmdsZSBkZXZpY2UuCj4+Cj4+IGJsa3pvbmVkIGZlYXR1cmUgZGVwZW5kcyBvbiBtdWx0aXBs
ZSBkZXZpY2UgZmVhdHVyZT8gT25lIHJlZ3VsYXIKPj4gZGV2aWNlIGFuZCBvbmUgc2VxLXpvbmUg
ZGV2aWNlPwo+IAo+IEFjY29yZGluZyB0byBta2ZzLmYyZnMsIGlmIHRoZXJlIGFyZSBhIHN1ZmZp
Y2llbnQgbnVtYmVyIG9mCj4gY29udmVudGlvbmFsIHpvbmVzLCBhIHNpbmdsZSB6b25lZCBkZXZp
Y2UgY2FuIGJlIHVzZWQuCgpDb3JyZWN0LgoKQW55d2F5LCB0aGUgY29kZSBsb29rcyBjbGVhbi4K
ClJldmlld2VkLWJ5OiBDaGFvIFl1IDxjaGFvQGtlcm5lbC5vcmc+CgpUaGFua3MsCgo+IAo+IFRo
YW5rcywKPiBEYWVqdW4KPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IEZpeGVzOiBlMDY3ZGMz
YzZiOWMgKCJmMmZzOiBtYWludGFpbiBzaXggb3BlbiB6b25lcyBmb3Igem9uZWQgZGV2aWNlcyIp
Cj4+PiBTaWduZWQtb2ZmLWJ5OiBEYWVqdW4gUGFyayA8ZGFlanVuNy5wYXJrQHNhbXN1bmcuY29t
Pgo+Pj4gLS0tCj4+PiAgwqAgZnMvZjJmcy9kYXRhLmMgNCArKystCj4+PiAgwqAgMSBmaWxlIGNo
YW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4KPj4+IGRpZmYgLS1naXQg
YS9mcy9mMmZzL2RhdGEuYyBiL2ZzL2YyZnMvZGF0YS5jCj4+PiBpbmRleCBiNmRjYjNiY2FlZjcu
LjFhYTdlZWZhNjU5YyAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZGF0YS5jCj4+PiArKysgYi9m
cy9mMmZzL2RhdGEuYwo+Pj4gQEAgLTkyNSw2ICs5MjUsNyBAQCBpbnQgZjJmc19tZXJnZV9wYWdl
X2JpbyhzdHJ1Y3QgZjJmc19pb19pbmZvICpmaW8pCj4+PiAgwqAgI2lmZGVmIENPTkZJR19CTEtf
REVWX1pPTkVECj4+PiAgwqAgc3RhdGljIGJvb2wgaXNfZW5kX3pvbmVfYmxrYWRkcihzdHJ1Y3Qg
ZjJmc19zYl9pbmZvICpzYmksIGJsb2NrX3QgYmxrYWRkcikKPj4+ICDCoCB7Cj4+PiArIMKgIMKg
IMKgIMKgc3RydWN0IGJsb2NrX2RldmljZSAqYmRldiA9IHNiaS0+c2ItPnNfYmRldjsKPj4+ICDC
oCDCoCDCoCDCoCDCoCDCoGludCBkZXZpID0gMDsKPj4+ICAgCj4+PiAgwqAgwqAgwqAgwqAgwqAg
wqBpZiAoZjJmc19pc19tdWx0aV9kZXZpY2Uoc2JpKSkgewo+Pj4gQEAgLTkzNSw4ICs5MzYsOSBA
QCBzdGF0aWMgYm9vbCBpc19lbmRfem9uZV9ibGthZGRyKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNi
aSwgYmxvY2tfdCBibGthZGRyKQo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgcmV0dXJuIGZhbHNlOwo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
fQo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgYmxrYWRkciAtPSBGREVWKGRldmkp
LnN0YXJ0X2JsazsKPj4+ICsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBiZGV2ID0gRkRFVihkZXZp
KS5iZGV2Owo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgfQo+Pj4gLSDCoCDCoCDCoCDCoHJldHVybiBi
ZGV2X2lzX3pvbmVkKEZERVYoZGV2aSkuYmRldikgJiYKPj4+ICsgwqAgwqAgwqAgwqByZXR1cm4g
YmRldl9pc196b25lZChiZGV2KSAmJgo+Pj4gIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
ZjJmc19ibGt6X2lzX3NlcShzYmksIGRldmksIGJsa2FkZHIpICYmCj4+PiAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAoYmxrYWRkciAlIHNiaS0+YmxvY2tzX3Blcl9ibGt6ID09IHNiaS0+
YmxvY2tzX3Blcl9ibGt6IC0gMSk7Cj4+PiAgwqAgfQoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
