Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D8C135395
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2020 08:14:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ipS1b-0004ER-TL; Thu, 09 Jan 2020 07:14:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ipS1a-0004EJ-6c
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 07:14:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UPqa/Jphd4vYKAaOjQulmiOjBLGtW2k8t0FhzLxVqoU=; b=fbkcG8f4yxE5nKYEBqfkp/qxAE
 Tlb/gHxwDD6AwqvVzyLQd6qgxcHeJu++H3cTDZRcaNuVNWeNq3yg+bXqnLP/+FPDgIUifZwtPJnE7
 czWyYEd5++Tv22CoN0tnepPBMkNOPxKkYCJunN92dNwvy4Zqi4Q9I4Ze5Qo3PrMMyn7w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UPqa/Jphd4vYKAaOjQulmiOjBLGtW2k8t0FhzLxVqoU=; b=BbEyYyQxuXSoBivpCan4mlNZXS
 mIA4nqHJnvidz4zhqnO6tC92ezr7S92dwuioSe2iRrp5RTl6ggj0KVoX0GmCYdeTVgLFzbJHLZ1/N
 CuFdgyjPWKuLdrgxXW59lHpJjzzKLdyOZOeBVizDlvjuBnvoxCxbvuu830Kdj/RtUn7c=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ipS1X-00EIrc-0P
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jan 2020 07:14:34 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8F2BCD8059C7DC9A87A0;
 Thu,  9 Jan 2020 15:14:22 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.439.0; Thu, 9 Jan 2020
 15:14:21 +0800
To: =?UTF-8?B?UGluZzEgWGlvbmcg54aK5bmz?= <xiongping1@xiaomi.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "jaegeuk@kernel.org"
 <jaegeuk@kernel.org>
References: <1578482416650.67283@xiaomi.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <d48d8d65-1308-278c-db86-0806a0c3637a@huawei.com>
Date: Thu, 9 Jan 2020 15:14:20 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1578482416650.67283@xiaomi.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: xiaomi.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1ipS1X-00EIrc-0P
Subject: Re: [f2fs-dev] [PATCH] resize.f2fs: add option for large_nat_bitmap
 feature
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8xLzggMTk6MjAsIFBpbmcxIFhpb25nIOeGiuW5syB3cm90ZToKPiDigItGcm9tIGQ1
Yjg0MTFkYmFlMzcxODBjMzdkOTZiZjE2NGZhYjE2MTM4ZmMyMWEgTW9uIFNlcCAxNyAwMDowMDow
MCAyMDAxCj4gCj4gRnJvbTogeGlvbmdwaW5nMSA8eGlvbmdwaW5nMUB4aWFvbWkuY29tPgo+IERh
dGU6IFdlZCwgOCBKYW4gMjAyMCAxNzoyMDo1NSArMDgwMAo+IFN1YmplY3Q6IFtQQVRDSF0gcmVz
aXplLmYyZnM6IGFkZCBvcHRpb24gZm9yIGxhcmdlX25hdF9iaXRtYXAgZmVhdHVyZQoKVGhhbmtz
IGZvciB5b3VyIGNvbnRyaWJ1dGlvbi4KClRoZSBwYXRjaCBmb3JtYXQgaXMgaW5jb3JyZWN0LCBJ
IGd1ZXNzIGl0IHdhcyBjaGFuZ2VkIGJ5IGVtYWlsIGNsaWVudCBvciB3aGVuCnlvdSBwYXN0ZSBw
YXRjaCdzIGNvbnRlbnQsIGNvdWxkIHlvdSBjaGVjayBpdD8KCj4gCj4gcmVzaXplLmYyZnMgaGFz
IGFscmVhZHkgc3VwcG9ydGVkIGxhcmdlX25hdF9iaXRtYXAgZmVhdHVyZSwgYnV0IGhhcyBubwo+
IG9wdGlvbiB0byB0dXJuIG9uIGl0Lgo+IAo+IFRoaXMgY2hhbmdlIGFkZCBhIG5ldyAnLWknIG9w
dGlvbiB0byBjb250cm9sIHR1cm5pbmcgb24vb2ZmIGl0LgoKV2Ugb25seSBhZGQgYSBvcHRpb24g
dG8gdHVybiBvbiB0aGlzIGZlYXR1cmUsIHJpZ2h0PyByYXRoZXIgdGhhbiB0dXJuaW5nCm9uIG9y
IG9mZiBpdD8KClRoYW5rcywKCj4gCj4gU2lnbmVkLW9mZi1ieTogeGlvbmdwaW5nMSA8eGlvbmdw
aW5nMUB4aWFvbWkuY29tPgo+IC0tLQo+IMKgZnNjay9tYWluLmPCoMKgIHwgNiArKysrKy0KPiDC
oGZzY2svcmVzaXplLmMgfCA1ICsrKysrCj4gwqAyIGZpbGVzIGNoYW5nZWQsIDEwIGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZnNjay9tYWluLmMgYi9mc2Nr
L21haW4uYwo+IGluZGV4IDlhN2Q0OTkuLmU3ZTNkZmMgMTAwNjQ0Cj4gLS0tIGEvZnNjay9tYWlu
LmMKPiArKysgYi9mc2NrL21haW4uYwo+IEBAIC0xMDQsNiArMTA0LDcgQEAgdm9pZCByZXNpemVf
dXNhZ2UoKQo+IMKgwqDCoMKgwqDCoMKgwqAgTVNHKDAsICJcblVzYWdlOiByZXNpemUuZjJmcyBb
b3B0aW9uc10gZGV2aWNlXG4iKTsKPiDCoMKgwqDCoMKgwqDCoMKgIE1TRygwLCAiW29wdGlvbnNd
OlxuIik7Cj4gwqDCoMKgwqDCoMKgwqDCoCBNU0coMCwgIsKgIC1kIGRlYnVnIGxldmVsIFtkZWZh
dWx0OjBdXG4iKTsKPiArwqDCoMKgwqDCoMKgIE1TRygwLCAiwqAgLWkgZXh0ZW5kZWQgbm9kZSBi
aXRtYXAsIG5vZGUgcmF0aW8gaXMgMjAlJSBieSBkZWZhdWx0XG4iKTsKPiDCoMKgwqDCoMKgwqDC
oMKgIE1TRygwLCAiwqAgLXMgc2FmZSByZXNpemUgKERvZXMgbm90IHJlc2l6ZSBtZXRhZGF0YSki
KTsKPiDCoMKgwqDCoMKgwqDCoMKgIE1TRygwLCAiwqAgLXQgdGFyZ2V0IHNlY3RvcnMgW2RlZmF1
bHQ6IGRldmljZSBzaXplXVxuIik7Cj4gwqDCoMKgwqDCoMKgwqDCoCBNU0coMCwgIsKgIC1WIHBy
aW50IHRoZSB2ZXJzaW9uIG51bWJlciBhbmQgZXhpdFxuIik7Cj4gQEAgLTQ0OSw3ICs0NTAsNyBA
QCB2b2lkIGYyZnNfcGFyc2Vfb3B0aW9ucyhpbnQgYXJnYywgY2hhciAqYXJndltdKQo+IMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgYnJlYWs7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfQo+IMKgwqDCoMKg
wqDCoMKgwqAgfSBlbHNlIGlmICghc3RyY21wKCJyZXNpemUuZjJmcyIsIHByb2cpKSB7Cj4gLcKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hhciAqb3B0aW9uX3N0cmluZyA9ICJk
OnN0OlYiOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGNvbnN0IGNoYXIgKm9wdGlv
bl9zdHJpbmcgPSAiZDpzdDppViI7Cj4gwqAKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBjLmZ1bmMgPSBSRVNJWkU7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
d2hpbGUgKChvcHRpb24gPSBnZXRvcHQoYXJnYywgYXJndiwgb3B0aW9uX3N0cmluZykpICE9IEVP
Rikgewo+IEBAIC00NzYsNiArNDc3LDkgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlvbnMoaW50IGFy
Z2MsIGNoYXIgKmFyZ3ZbXSkKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBzc2NhbmYo
b3B0YXJnLCAiJSJQUkl4NjQiIiwKPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgICZjLnRhcmdldF9zZWN0b3JzKTsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFr
Owo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjYXNlICdp
JzoKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIGMubGFyZ2VfbmF0X2JpdG1hcCA9IDE7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSAnVic6Cj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBzaG93X3ZlcnNpb24ocHJvZyk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBleGl0KDApOwo+IGRpZmYgLS1naXQg
YS9mc2NrL3Jlc2l6ZS5jIGIvZnNjay9yZXNpemUuYwo+IGluZGV4IGZjNTYzZjIuLjg4ZTA2M2Ug
MTAwNjQ0Cj4gLS0tIGEvZnNjay9yZXNpemUuYwo+ICsrKyBiL2ZzY2svcmVzaXplLmMKPiBAQCAt
NTE5LDYgKzUxOSwxMSBAQCBzdGF0aWMgdm9pZCByZWJ1aWxkX2NoZWNrcG9pbnQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpLAo+IMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHNldF9jcChjaGVja3N1bV9vZmZzZXQsIENQX0NIS1NVTV9PRkZT
RVQpOwo+IMKgCj4gK8KgwqDCoMKgwqDCoCBpZiAoYy5sYXJnZV9uYXRfYml0bWFwKSB7Cj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc2V0X2NwKGNoZWNrc3VtX29mZnNldCwgQ1BfTUlO
X0NIS1NVTV9PRkZTRVQpOwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGZsYWdzIHw9
IENQX0xBUkdFX05BVF9CSVRNQVBfRkxBRzsKPiArwqDCoMKgwqDCoMKgIH0KPiArCj4gwqDCoMKg
wqDCoMKgwqDCoCBzZXRfY3AoY2twdF9mbGFncywgZmxhZ3MpOwo+IMKgCj4gwqDCoMKgwqDCoMKg
wqDCoCBtZW1jcHkobmV3X2NwLCBjcCwgKHVuc2lnbmVkIGNoYXIgKiljcC0+c2l0X25hdF92ZXJz
aW9uX2JpdG1hcCAtCj4gLS3CoAo+IDIuNy40Cj4gCj4g4oCLCj4gCj4gCj4gIy8qKioqKirmnKzp
gq7ku7blj4rlhbbpmYTku7blkKvmnInlsI/nsbPlhazlj7jnmoTkv53lr4bkv6Hmga/vvIzku4Xp
mZDkuo7lj5HpgIHnu5nkuIrpnaLlnLDlnYDkuK3liJflh7rnmoTkuKrkurrmiJbnvqTnu4TjgILn
poHmraLku7vkvZXlhbbku5bkurrku6Xku7vkvZXlvaLlvI/kvb/nlKjvvIjljIXmi6zkvYbkuI3p
mZDkuo7lhajpg6jmiJbpg6jliIblnLDms4TpnLLjgIHlpI3liLbjgIHmiJbmlaPlj5HvvInmnKzp
gq7ku7bkuK3nmoTkv6Hmga/jgILlpoLmnpzmgqjplJnmlLbkuobmnKzpgq7ku7bvvIzor7fmgqjn
q4vljbPnlLXor53miJbpgq7ku7bpgJrnn6Xlj5Hku7bkurrlubbliKDpmaTmnKzpgq7ku7bvvIEg
VGhpcyBlLW1haWwgYW5kIGl0cyBhdHRhY2htZW50cyBjb250YWluIGNvbmZpZGVudGlhbCBpbmZv
cm1hdGlvbiBmcm9tIFhJQU9NSSwgd2hpY2ggaXMgaW50ZW5kZWQgb25seSBmb3IgdGhlIHBlcnNv
biBvciBlbnRpdHkgd2hvc2UgYWRkcmVzcyBpcyBsaXN0ZWQgYWJvdmUuIEFueSB1c2Ugb2YgdGhl
IGluZm9ybWF0aW9uIGNvbnRhaW5lZCBoZXJlaW4gaW4gYW55IHdheSAoaW5jbHVkaW5nLCBidXQg
bm90IGxpbWl0ZWQgdG8sIHRvdGFsIG9yIHBhcnRpYWwgZGlzY2xvc3VyZSwgcmVwcm9kdWN0aW9u
LCBvciBkaXNzZW1pbmF0aW9uKSBieSBwZXJzb25zIG90aGVyIHRoYW4gdGhlIGludGVuZGVkIHJl
Y2lwaWVudChzKSBpcyBwcm9oaWJpdGVkLiBJZiB5b3UgcmVjZWl2ZSB0aGlzIGUtbWFpbCBpbiBl
cnJvciwgcGxlYXNlIG5vdGlmeSB0aGUgc2VuZGVyIGJ5IHBob25lIG9yIGVtYWlsIGltbWVkaWF0
ZWx5IGFuZCBkZWxldGUgaXQhKioqKioqLyMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdl
Lm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
