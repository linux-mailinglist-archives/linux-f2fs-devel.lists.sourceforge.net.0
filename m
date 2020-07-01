Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE592101B5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 04:00:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqS2u-00015z-Sb; Wed, 01 Jul 2020 02:00:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jqS2t-00015q-7A
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 02:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A2WMAPdO5Lf1fbJYedJY0uGV8RoMcyyS/7PY5yJUZZw=; b=bWQ8bjns2ZDOtxr9B8yDtbKCLj
 EAsm18kHU8HOBwXIxNAekH9IVgiJ9x3Ahjzg/0gwB+MfDfnMb6b5cR3xph5SX0uApc6T3MpSTbxtb
 mEy1mbv4RAehikDiXF4tigfmf9171Tr9aPhSzN8828MgXPe3sy04DSz+4p+dqdVcIqGo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A2WMAPdO5Lf1fbJYedJY0uGV8RoMcyyS/7PY5yJUZZw=; b=lT4AjRkVjPE8NuXZEKPnq4yndw
 vQdlI+WwY1x+jkpDxlE9dr4BL2k6zkFzVbnbltjMOij4ABCaZU+DOkopirPT/6ug1dpLMIOUIahv1
 kMJn82Fv2cXDzfDk8x6mJVI/F61Ncm9lAjO8kNUbpTmDK5sJVxCt/48SG3pi8xAdPUt8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqS2q-0089s5-JL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 02:00:19 +0000
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4681418191EF47DAEB71;
 Wed,  1 Jul 2020 10:00:01 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 1 Jul 2020
 09:59:55 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, Nathan Chancellor
 <natechancellor@gmail.com>
References: <20200624012148.180050-1-jaegeuk@kernel.org>
 <20200629150323.GA3293033@google.com> <20200629202720.GA230664@google.com>
 <20200630204348.GA2504307@ubuntu-s3-xlarge-x86>
 <20200630205635.GB1396584@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <285a4e16-2cbc-d1e9-8464-8a06bacbaaa0@huawei.com>
Date: Wed, 1 Jul 2020 09:59:54 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200630205635.GB1396584@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jqS2q-0089s5-JL
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid readahead race condition
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC83LzEgNDo1NiwgSmFlZ2V1ayBLaW0gd3JvdGU6Cj4gT24gMDYvMzAsIE5hdGhhbiBD
aGFuY2VsbG9yIHdyb3RlOgo+PiBPbiBNb24sIEp1biAyOSwgMjAyMCBhdCAwMToyNzoyMFBNIC0w
NzAwLCBKYWVnZXVrIEtpbSB3cm90ZToKPj4+IElmIHR3byByZWFkYWhlYWQgdGhyZWFkcyBoYXZp
bmcgc2FtZSBvZmZzZXQgZW50ZXIgaW4gcmVhZHBhZ2VzLCBldmVyeSByZWFkCj4+PiBJT3MgYXJl
IHNwbGl0IGFuZCBpc3N1ZWQgdG8gdGhlIGRpc2sgd2hpY2ggZ2l2aW5nIGxvd2VyIGJhbmR3aWR0
aC4KPj4+Cj4+PiBUaGlzIHBhdGNoIHRyaWVzIHRvIGF2b2lkIHJlZHVuZGFudCByZWFkYWhlYWQg
Y2FsbHMuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtAa2VybmVs
Lm9yZz4KPj4+IC0tLQo+Pj4gdjM6Cj4+PiAgLSB1c2UgUkVBRHxXUklURV9PTkNFCj4+PiB2MjoK
Pj4+ICAgLSBhZGQgbWlzc2luZyBjb2RlIHRvIGJ5cGFzcyByZWFkCj4+PiAgCj4+PiAgZnMvZjJm
cy9kYXRhLmMgIHwgMTggKysrKysrKysrKysrKysrKysrCj4+PiAgZnMvZjJmcy9mMmZzLmggIHwg
IDEgKwo+Pj4gIGZzL2YyZnMvc3VwZXIuYyB8ICAyICsrCj4+PiAgMyBmaWxlcyBjaGFuZ2VkLCAy
MSBpbnNlcnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMv
ZjJmcy9kYXRhLmMKPj4+IGluZGV4IDk5NWNmNzhiMjNjNWUuLjM2MGI0YzkwODBkOTcgMTAwNjQ0
Cj4+PiAtLS0gYS9mcy9mMmZzL2RhdGEuYwo+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+IEBA
IC0yMjk2LDYgKzIyOTYsNyBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVj
dCBpbm9kZSAqaW5vZGUsCj4+PiAgCXVuc2lnbmVkIG5yX3BhZ2VzID0gcmFjID8gcmVhZGFoZWFk
X2NvdW50KHJhYykgOiAxOwo+Pj4gIAl1bnNpZ25lZCBtYXhfbnJfcGFnZXMgPSBucl9wYWdlczsK
Pj4+ICAJaW50IHJldCA9IDA7Cj4+PiArCWJvb2wgZHJvcF9yYSA9IGZhbHNlOwo+Pj4gIAo+Pj4g
IAltYXAubV9wYmxrID0gMDsKPj4+ICAJbWFwLm1fbGJsayA9IDA7Cj4+PiBAQCAtMjMwNiwxMCAr
MjMwNywyNCBAQCBzdGF0aWMgaW50IGYyZnNfbXBhZ2VfcmVhZHBhZ2VzKHN0cnVjdCBpbm9kZSAq
aW5vZGUsCj4+PiAgCW1hcC5tX3NlZ190eXBlID0gTk9fQ0hFQ0tfVFlQRTsKPj4+ICAJbWFwLm1f
bWF5X2NyZWF0ZSA9IGZhbHNlOwo+Pj4gIAo+Pj4gKwkvKgo+Pj4gKwkgKiBUd28gcmVhZGFoZWFk
IHRocmVhZHMgZm9yIHNhbWUgYWRkcmVzcyByYW5nZSBjYW4gY2F1c2UgcmFjZSBjb25kaXRpb24K
Pj4+ICsJICogd2hpY2ggZnJhZ21lbnRzIHNlcXVlbnRpYWwgcmVhZCBJT3MuIFNvIGxldCdzIGF2
b2lkIGVhY2ggb3RoZXIuCj4+PiArCSAqLwo+Pj4gKwlpZiAocmFjICYmIHJlYWRhaGVhZF9jb3Vu
dChyYWMpKSB7Cj4+PiArCQlpZiAoUkVBRF9PTkNFKEYyRlNfSShpbm9kZSktPnJhX29mZnNldCkg
PT0gcmVhZGFoZWFkX2luZGV4KHJhYykpCj4+PiArCQkJZHJvcF9yYSA9IHRydWU7Cj4+PiArCQll
bHNlCj4+PiArCQkJV1JJVEVfT05DRShGMkZTX0koaW5vZGUpLT5yYV9vZmZzZXQsCj4+PiArCQkJ
CQkJcmVhZGFoZWFkX2luZGV4KHJhYykpOwo+Pj4gKwl9Cj4+PiArCj4+PiAgCWZvciAoOyBucl9w
YWdlczsgbnJfcGFnZXMtLSkgewo+Pj4gIAkJaWYgKHJhYykgewo+Pj4gIAkJCXBhZ2UgPSByZWFk
YWhlYWRfcGFnZShyYWMpOwo+Pj4gIAkJCXByZWZldGNodygmcGFnZS0+ZmxhZ3MpOwo+Pj4gKwkJ
CWlmIChkcm9wX3JhKQo+Pj4gKwkJCQlnb3RvIG5leHRfcGFnZTsKPj4KPj4gV2hlbiBDT05GSUdf
RjJGU19GU19DT01QUkVTU0lPTiBpcyBub3Qgc2V0IChpLmUuIHg4Nl82NCBkZWZjb25maWcgKwo+
PiBDT05GSUdfRjJGU19GUz15KToKPj4KPj4gJCBtYWtlIC1za2oiJChucHJvYykiIE89b3V0IGRp
c3RjbGVhbiBkZWZjb25maWcgZnMvZjJmcy9kYXRhLm8KPj4gLi4vZnMvZjJmcy9kYXRhLmM6IElu
IGZ1bmN0aW9uIOKAmGYyZnNfbXBhZ2VfcmVhZHBhZ2Vz4oCZOgo+PiAuLi9mcy9mMmZzL2RhdGEu
YzoyMzI3OjU6IGVycm9yOiBsYWJlbCDigJhuZXh0X3BhZ2XigJkgdXNlZCBidXQgbm90IGRlZmlu
ZWQKPj4gIDIzMjcgfCAgICAgZ290byBuZXh0X3BhZ2U7Cj4+ICAgICAgIHwgICAgIF5+fn4KPj4g
Li4uCj4gCj4gVGhhbmtzLiBJIHB1c2hlZCB0aGUgZml4IGZvciAtbmV4dC4KPiBodHRwczovL2xv
cmUua2VybmVsLm9yZy9saW51eC1mMmZzLWRldmVsLzFiZTE4Mzk3LTdmYzYtNzAzZS0xMjFiLWUy
MTBlMTAxMzU3ZkBpbmZyYWRlYWQub3JnL1QvI3QKClJldmlld2VkLWJ5OiBDaGFvIFl1IDx5dWNo
YW8wQGh1YXdlaS5jb20+CgpUaGFua3MsCgo+IAo+IFRoYW5rcywKPiAKPj4KPj4gQ2hlZXJzLAo+
PiBOYXRoYW4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5u
ZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAo+IAo+IF9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKPiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
PiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
