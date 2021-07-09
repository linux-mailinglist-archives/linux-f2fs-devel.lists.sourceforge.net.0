Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D7A3C1DFE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Jul 2021 06:02:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1hia-0001XY-B1; Fri, 09 Jul 2021 04:02:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m1hiY-0001XR-1Q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 04:02:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/qEhbh/k0TR8YMv3A4TCGtcUPswRUrEDGAvc/02nkRM=; b=Sbdw4G5Y+X+8HLyJoKGVyM0AgW
 pAjAT+GG+xbKbt5vNbHUyQrm8l+vpkWXEKxYG3MID4NmCBQzkwHQVuvHEdjH9Mb8W3gd7WDlaB9q9
 6TrxR9ffSTS8f1SF54CFzNA+D4ctCyBAjej8UDTXkhzG2AwOpDcLoo4FQjzeueTUFlW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/qEhbh/k0TR8YMv3A4TCGtcUPswRUrEDGAvc/02nkRM=; b=U9dC/HM568pNiQWNAIkQPgWvxd
 DAFD/3LNCxOwUcR+w8h1gmDZKZ+gFBj5jx+xQundRTzHs92gmhxD3PWAcV2EAyD86q9VB+GQT3LN6
 2NnMDG9LYbaQ5Eiq/uTK29/j/XAx/vuXVOauuERGZoA+woYPbZaRQUsPTidXT+KzvOmA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1hiT-00041N-GP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Jul 2021 04:02:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB08D61407;
 Fri,  9 Jul 2021 04:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625803330;
 bh=xjWhualWPckA45oX5xv5+yYyvyWx9OLpa7xKe4FhkrI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=LvVc8Mg9dPQKg/hLkBalS4wxnOahAoc8cSXR6IhNg9VJHaKgUOLIznLGkmFnWRfA5
 T1gdW8gohzJGrGJ9ORm8S8/KiqnPISY8yVBDFPQjcJYOePl+xaj6aXIb2FiNVcIULW
 knIyqN3jO2XIGoyvWBxrteAqQ7kHGP27eW1DZvTXLiaWdYSPvZaA/p6rhyosHsQrPu
 hJd6AZ2ND61Y47jr5SvyroH5yd9gWt8vHe1bHCSSG2IOgMLqT0pA7IgHr4RRzzkI+y
 3p9jtG7WXio42jCVB2c0MCsVaaLuoituKihZLqGdYbjn7IEn5oJDXFF7EPi7UkwtOI
 Dmh9ByVB1G1Sg==
To: "wangxiaojun (N)" <wangxiaojun11@huawei.com>, jaegeuk@kernel.org
References: <20210709020559.3885430-1-wangxiaojun11@huawei.com>
 <0b0ae666-e020-2e1d-c893-e8180a7f1225@kernel.org>
 <86d53291-428e-cb99-ccb8-2f1211ab1cec@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <3a2e1506-6c67-6dfe-9c69-af80f0cc87eb@kernel.org>
Date: Fri, 9 Jul 2021 12:02:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <86d53291-428e-cb99-ccb8-2f1211ab1cec@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1hiT-00041N-GP
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid to create an empty string as the
 extension_list
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS83LzkgMTE6NDksIHdhbmd4aWFvanVuIChOKSB3cm90ZToKPiAKPiDlnKggMjAyMS83
LzkgMTE6MjEsIENoYW8gWXUg5YaZ6YGTOgo+PiBPbiAyMDIxLzcvOSAxMDowNSwgV2FuZyBYaWFv
anVuIHdyb3RlOgo+Pj4gV2hlbiBjcmVhdGluZyBhIGZpbGUsIHdlIG5lZWQgdG8gc2V0IHRoZSB0
ZW1wZXJhdHVyZSBiYXNlZCBvbgo+Pj4gZXh0ZW5zaW9uX2xpc3QuIElmIHRoZSBlbXB0eSBzdHJp
bmcgaXMgYSB2YWxpZCBleHRlbnNpb25fbGlzdCwKPj4+IHRoZSBpc19leHRlbnNpb25fZXhpc3Qg
d2lsbCBhbHdheXMgcmV0dXJucyB0cnVlLAo+Pj4gd2hpY2ggYWZmZWN0cyB0aGUgc2VwYXJhdGlv
biBvZiBob3QgYW5kIGNvbGQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogV2FuZyBYaWFvanVuIDx3
YW5neGlhb2p1bjExQGh1YXdlaS5jb20+Cj4+PiAtLS0KPj4+ICDCoCBmcy9mMmZzL25hbWVpLmMg
fCAyICsrCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL25hbWVpLmMgYi9mcy9mMmZzL25hbWVpLmMKPj4+IGluZGV4IGE5
Y2Q5Y2Y5NzIyOS4uMzQzNDFkM2VkYjhkIDEwMDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9uYW1laS5j
Cj4+PiArKysgYi9mcy9mMmZzL25hbWVpLmMKPj4+IEBAIC0yMTksNiArMjE5LDggQEAgaW50IGYy
ZnNfdXBkYXRlX2V4dGVuc2lvbl9saXN0KHN0cnVjdAo+Pj4gZjJmc19zYl9pbmZvICpzYmksIGNv
bnN0IGNoYXIgKm5hbWUsCj4+PiAgwqDCoMKgwqDCoCBpbnQgc3RhcnQsIGNvdW50Owo+Pj4gIMKg
wqDCoMKgwqAgaW50IGk7Cj4+PiAgwqAgK8KgwqDCoCBpZiAoIXN0cmxlbihuYW1lKSkKPj4+ICvC
oMKgwqDCoMKgwqDCoCByZXR1cm4gLUVJTlZBTDsKPj4KPj4gSG93IGFib3V0IGFkZGluZyB0aGlz
IGluIF9fc2JpX3N0b3JlKCk/IGxpa2U6Cj4+Cj4+IGlmICghc3RybGVuKG5hbWUpIHx8IHN0cmxl
bihuYW1lKSA+PSBGMkZTX0VYVEVOU0lPTl9MRU4pCj4+ICDCoMKgwqDCoHJldHVybiAtRUlOVkFM
Owo+Pgo+PiBPdGhlcndpc2UsIGl0IGxvb2tzIGdvb2QgdG8gbWUuCj4gCj4gVGhpcyBpcyBhbiBh
bHRlcm5hdGl2ZSBtb2RpZmljYXRpb24uIEV4Y2VwdGlvbiBjaGVjayBpcyBtb3JlIGNvbXBhY3Qg
aGVyZS4KPiAKPiBCdXQgaWYgdGhlIGYyZnNfdXBkYXRlX2V4dGVuc2lvbl9saXN0IGZ1bmN0aW9u
IGlzIGNhbGxlZCBlbHNld2hlcmUgaW4KPiB0aGUgZnV0dXJlLAoKVGhlcmUgaXMgb3RoZXIgcmVs
YXRlZCBjaGVjayBvZiBAbmFtZSBpbiBfX3NiaV9zdG9yZSgpLCBzbyBJIGd1ZXNzCmYyZnNfdXBk
YXRlX2V4dGVuc2lvbl9saXN0KCkgaXMgY291cGxpbmcgdG8gX19zYmlfc3RvcmUoKSBub3cuCgo+
IAo+IGNoZWNraW5nIGluc2lkZSB0aGUgZnVuY3Rpb24gY2FuIGF2b2lkIHRoaXMgcHJvYmxlbS4K
PiAKPiBJIHdhcyBhbHNvIGEgbGl0dGxlIHVuc3VyZSwgYW5kIGZpbmFsbHkgY2hvc2UgdGhpcyBt
b2RpZmljYXRpb24uCgpJJ20gZmluZSB0byBtb3ZlIGFsbCBjaGVja3MgaW50byBmMmZzX3VwZGF0
ZV9leHRlbnNpb25fbGlzdCgpLCBidXQgbm93Cml0IGxvb2tzIG1vcmUgY2xlYW4gdG8ganVzdCBs
ZXQgdGhlIGNhbGxlciBkbyB0aGUgY2hlY2sgb24gQG5hbWUuCgpUaGFua3MsCgo+IAo+Pgo+PiBS
ZXZpZXdlZC1ieTogQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPgo+Pgo+PiBUaGFua3MsCj4+Cj4+
PiAgwqDCoMKgwqDCoCBpZiAoc2V0KSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICh0b3Rh
bF9jb3VudCA9PSBGMkZTX01BWF9FWFRFTlNJT04pCj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FSU5WQUw7Cj4+Pgo+PiAuCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
