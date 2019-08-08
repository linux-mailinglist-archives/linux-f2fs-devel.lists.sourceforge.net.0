Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DD8385A72
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Aug 2019 08:20:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hvbmv-0004U6-Bj; Thu, 08 Aug 2019 06:20:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hvbmt-0004Tz-EZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 06:20:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=se2FeDzEH9vy3oGSCZNanFQC/Q9+yqHjMeL7LD396yg=; b=jz0oWJVcutodCVfgi9goqTj65F
 w5QLF9A5Y3TydjghZ+4ROGH5DAtLeTMISvDOqEM3BSO7bMUfQuFAL2lE8vdK/Y4GmInNQ60jsKYSr
 nF6n5BsSO0DvguxkbWbr4EZpC2rN1JvIN/kjCI8FHrMI2xU1PAycepVeISwW77KpS+80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=se2FeDzEH9vy3oGSCZNanFQC/Q9+yqHjMeL7LD396yg=; b=KwRlAE2uh9raYjIies9VdIdYf9
 SS+RxlNzI/h45NIr0oWL4eYqWaHRhv8aJE1fvI33Hwivz0qMIKlvG3767bxWakUoxU2qy1A7OXtGX
 T+H3Toaj/oQqUBv0Sk542a0V8lMjFufsneNQYq1uK60CZpvEpgZiyDYD+acadcY+o67A=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hvbmp-00FAnd-9N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 08 Aug 2019 06:20:35 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 346BB6A61CD9433D68E9;
 Thu,  8 Aug 2019 14:20:24 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.203) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 8 Aug 2019
 14:20:23 +0800
To: Surbhi Palande <csurbhi@gmail.com>
References: <20190807205428.3454-1-csurbhi@gmail.com>
 <37151a93-66e6-b8ee-2727-b5dc4a57aab7@huawei.com>
 <CAMBkX3eyb9qNMeoRyNsVg5W=BkChe9Ac2YvW5a7cji8AWvrN=w@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <1b9a38fa-3f4f-c1d8-0e87-d7a23e8091cb@huawei.com>
Date: Thu, 8 Aug 2019 14:20:37 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAMBkX3eyb9qNMeoRyNsVg5W=BkChe9Ac2YvW5a7cji8AWvrN=w@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hvbmp-00FAnd-9N
Subject: Re: [f2fs-dev] [PATCH] Return valid segment type in 4 head logging
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAxOS84LzggMTE6NTgsIFN1cmJoaSBQYWxhbmRlIHdyb3RlOgo+IAo+IAo+IAo+IAo+IAo+
IAo+IE9uIFdlZCwgQXVnIDcsIDIwMTkgYXQgNjozMyBQTSBDaGFvIFl1IDx5dWNoYW8wQGh1YXdl
aS5jb20KPiA8bWFpbHRvOnl1Y2hhbzBAaHVhd2VpLmNvbT4+IHdyb3RlOgo+IAo+ICAgICBPbiAy
MDE5LzgvOCA0OjU0LCBTdXJiaGkgUGFsYW5kZSB3cm90ZToKPiAgICAgPiBUaGUgdmFsaWQgdHlw
ZSBvZiBjdXJyZW50IHNlZ21lbnRzIGluIGEgNCBoZWFkIGxvZ2dpbmcgc2NoZW1lIGFyZToKPiAg
ICAgPgo+ICAgICA+IENVUlNFR19IT1RfREFUQSwgQ1VSU0VHX0NPTERfREFUQQo+ICAgICA+IENV
UlNFR19IT1RfTk9ERSwgQ1VSU0VHX0hPVF9OT0RFLgo+IAo+ICAgICBJIGRpZG4ndCBzZWUgYSB2
ZXJ5IHN0cm9uZyByZWFzb24gdG8gZm9yY2UgdG8gdXNlIEhPVC9DT0xEIGtleXdvcmQgaW4gZGF0
YXMKPiAgICAgdHlwZSwgV0FSTSBhbmQgQ09MRCBjYW4gYWxzbyBzZXBhcmF0ZSBkaWZmZXJlbnQg
dGVtcGVyYXR1cmUgb2YgZGF0YXMsIHJpZ2h0Pwo+IAo+ICAgICA+Cj4gICAgID4gV2hlbiBhIGRp
cmVjdCBub2RlIHBhZ2UgaXMgbm90IGV4cGxpY2l0bHkgbWFya2VkIGNvbGQsCj4gICAgID4gcmV0
dXJuIENVUlNFR19IT1RfTk9ERSBhcyBpdCdzIHNlZ21lbnQgdHlwZS4KPiAgICAgPiBDVVJTRUdf
V0FSTV9OT0RFIGlzIG5vdCBhIHZhbGlkIHNlZ21lbnQgdHlwZSBpbiBhCj4gICAgID4gNCBoZWFk
IGxvZ2dpbmcgc2NoZW1lLgo+IAo+ICAgICBBRkFJSywgYnkgZGVmYXVsdCwgcmVjb3Zlcnkgd2ls
bCB0cmF2ZXJzZSBhbmQgcmVwbGF5IGFsbCByZWd1bGFyJ3MgZG5vZGUgaW4KPiAgICAgbGlua2xp
c3Qgb2Ygd2FybSBub2RlIHNlZ21lbnQsIGluIG9yZGVyIHRvIGtlZXAgcmVjb3ZlcnkgbWVjaGFu
aXNtIHZhbGlkLCB3ZQo+ICAgICBrZWVwIHRoZSBydWxlIG9mIGFsbG9jYXRpbmcgd2FybSBzZWdt
ZW50IGZvciBjb2xkIG5vZGUgKHJlZ3VsYXIncyBkbm9kZSkuCj4gCj4gCj4gT0shIEdvdCBpdC4g
VGhhbmtzIQo+IAo+IMKgCj4gCj4gCj4gICAgIENlcnRhaW5seSwgeW91IGNhbiBjaGFuZ2UgdG8g
dXNlIEhPVF9OT0RFIHRvIHN0b3JlIGNvbGQgbm9kZSwgaG93ZXZlciB3ZSBzaG91bGQKPiAgICAg
YWRqdXN0IG5lZWRfZG9fY2hlY2twb2ludCgpIGFzIGJlbG93IHRvIHRyaWdnZXIgY2hlY2twb2lu
dCBmb3IgZXZlcnkgZnN5bmMsCj4gICAgIHNhZGx5IGl0IHdpbGwgY2F1c2Ugb2J2aW91cyBwZXJm
b3JtYW5jZSByZWdyZXNzaW9uLCB3ZSBjYW4ndCBhZmZvcmQgaXQuCj4gCj4gICAgIGVsc2UgaWYg
KEYyRlNfT1BUSU9OKHNiaSkuYWN0aXZlX2xvZ3MgIT0gNikKPiAgICAgwqAgwqAgwqAgwqAgY3Bf
cmVhc29uID0gQ1BfU1BFQ19MT0dfTlVNOwo+IAo+IAo+IEkgZGlkIG5vdCBzZWUgYW55IHN1cHBv
cnQgaW4gbWtmcyBvciBtb3VudCBmb3IgY3JlYXRpbmcgNCBvciAyIGFjdGl2ZSBsb2dzLgo+IEFt
IEkgbWlzc2luZyBhbnl0aGluZz8KCkZZSQoKUXVvdGVkIGZyb20gRG9jdW1lbnRhdGlvbi9maWxl
c3lzdGVtcy9mMmZzLnR4dAoKYWN0aXZlX2xvZ3M9JXUgICAgICAgICBTdXBwb3J0IGNvbmZpZ3Vy
aW5nIHRoZSBudW1iZXIgb2YgYWN0aXZlIGxvZ3MuIEluIHRoZQogICAgICAgICAgICAgICAgICAg
ICAgIGN1cnJlbnQgZGVzaWduLCBmMmZzIHN1cHBvcnRzIG9ubHkgMiwgNCwgYW5kIDYgbG9ncy4K
ICAgICAgICAgICAgICAgICAgICAgICBEZWZhdWx0IG51bWJlciBpcyA2LgoKPiAKPiBCZXN0IFJl
Z2FyZHMsCj4gU3VyYmhpLgo+IAo+IAo+IMKgCj4gCj4gCj4gICAgIFRoYW5rcywKPiAKPiAgICAg
Pgo+ICAgICA+IFNpZ25lZC1vZmYtYnk6IFN1cmJoaSBQYWxhbmRlIDxjc3VyYmhpQGdtYWlsLmNv
bSA8bWFpbHRvOmNzdXJiaGlAZ21haWwuY29tPj4KPiAgICAgPiAtLS0KPiAgICAgPsKgIGZzL2Yy
ZnMvc2VnbWVudC5jIHwgNCArKy0tCj4gICAgID7CoCAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRp
b25zKCspLCAyIGRlbGV0aW9ucygtKQo+ICAgICA+Cj4gICAgID4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvc2VnbWVudC5jIGIvZnMvZjJmcy9zZWdtZW50LmMKPiAgICAgPiBpbmRleCBhNjYxYWMzMmU4
MjkuLmI5MDRiNWQ3YjRkZiAxMDA2NDQKPiAgICAgPiAtLS0gYS9mcy9mMmZzL3NlZ21lbnQuYwo+
ICAgICA+ICsrKyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gICAgID4gQEAgLTMwMDYsOCArMzAwNiw4
IEBAIHN0YXRpYyBpbnQgX19nZXRfc2VnbWVudF90eXBlXzQoc3RydWN0IGYyZnNfaW9faW5mbwo+
ICAgICAqZmlvKQo+ICAgICA+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBlbHNlCj4gICAgID7CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBDVVJTRUdfQ09MRF9EQVRBOwo+
ICAgICA+wqAgwqAgwqAgwqB9IGVsc2Ugewo+ICAgICA+IC3CoCDCoCDCoCDCoCDCoCDCoCDCoGlm
IChJU19ETk9ERShmaW8tPnBhZ2UpICYmIGlzX2NvbGRfbm9kZShmaW8tPnBhZ2UpKQo+ICAgICA+
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJldHVybiBDVVJTRUdfV0FSTV9OT0RF
Owo+ICAgICA+ICvCoCDCoCDCoCDCoCDCoCDCoCDCoGlmIChJU19ETk9ERShmaW8tPnBhZ2UpICYm
ICFpc19jb2xkX25vZGUoZmlvLT5wYWdlKSkKPiAgICAgPiArwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqByZXR1cm4gQ1VSU0VHX0hPVF9OT0RFOwo+ICAgICA+wqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqBlbHNlCj4gICAgID7CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoHJl
dHVybiBDVVJTRUdfQ09MRF9OT0RFOwo+ICAgICA+wqAgwqAgwqAgwqB9Cj4gICAgID4KPiAKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
