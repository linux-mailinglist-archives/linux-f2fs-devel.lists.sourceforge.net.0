Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E263A7520
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 05:28:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lszku-0003Ds-CH; Tue, 15 Jun 2021 03:28:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunke32@huawei.com>) id 1lszkj-0003CZ-RW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CDD3y85LtFw9EcMJiZ49iFs/HSPfRzFGMlKH0vTmNdk=; b=RjW9C+0dW1ExNA0uVDS0uM2QOo
 JblkjGPIORe5xNtYFDzFg3EBEWBdrOaZFhJaFaeF2NGAxb2y/Jh+BlHtsw6BQvbsgpFbp97QehFtm
 5qu3Yf5d/xN72Fl7sYlspDg8X/WUX1u4mMER5XfAfHJrowxcfXdUpOl6Yy+KAFPyxoSo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CDD3y85LtFw9EcMJiZ49iFs/HSPfRzFGMlKH0vTmNdk=; b=anDwVzixKWzoRFHmHiUx0rMNDi
 9QdqKjDh+PHTGY2hbpmK9QCLu1DD/hxrE8/oMF1QiVm8yPI8BrJm3PstV5Sh0qd1cCDRRmodsKzV4
 kjMj7KMFGayQGpuTYlvuotHpwnYphIAybSpozTWGNwde239TaEfkl9N0iBBUj8/omzFM=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lszkf-0000we-SF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:28:40 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G3tx94Kd6z6yr1;
 Tue, 15 Jun 2021 11:25:17 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 11:28:26 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 15 Jun 2021 11:28:25 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>, <yuchao0@huawei.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <20210611112211.1408767-2-sunke32@huawei.com>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <1ea6a853-d892-4c3e-d023-72adc379b803@huawei.com>
Date: Tue, 15 Jun 2021 11:28:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210611112211.1408767-2-sunke32@huawei.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.188 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lszkf-0000we-SF
Subject: Re: [f2fs-dev] [PATCH] generic/103: leave more space for f2fs
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

dG8gbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKCtTaIDIwMjEvNi8xMSAx
OToyMiwgU3VuIEtlINC0tcA6Cj4gSXQgZmFpbGVkIG9uIGYyZnM6Cj4gICAgICAgUUEgb3V0cHV0
IGNyZWF0ZWQgYnkgMTAzCj4gICAgICArZmFsbG9jYXRlOiBObyBzcGFjZSBsZWZ0IG9uIGRldmlj
ZQo+ICAgICAgIFNpbGVuY2UgaXMgZ29sZGVuLgo+ICAgICAgLi4uCj4gCj4gVHJ5IHRvIGxlYXZl
IH41MTJLQiwgYnV0IGR1cmluZyB0aGUgZmFsbG9jYXRlLCBmMmZzIHdpbGwgYmUgZmlsbGVkLgo+
IFByb3ZpZGUgZXJyb3IgcHJvbXB0OiAiZmFsbG9jYXRlOiBObyBzcGFjZSBsZWZ0IG9uIGRldmlj
ZSIuCj4gCj4gTGVhdmUgbW9yZSBzcGFjZSBmb3IgZjJmcy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBT
dW4gS2UgPHN1bmtlMzJAaHVhd2VpLmNvbT4KPiAtLS0KPiBJIGFkZCBzb21lIHRlc3QgY29kZQo+
IAkrICAgICAgIGRmCj4gCQkJYXZhaWw9YF9nZXRfYXZhaWxhYmxlX3NwYWNlICRTQ1JBVENIX01O
VGAKPiAJKyAgICAgICBlY2hvICJhdmFpbCA9ICR7YXZhaWx9Igo+IAkJCWZpbGVzaXpla2I9JCgo
YXZhaWwgLyAxMDI0IC0gNTEyKSkKPiAJKyAgICAgICBlY2hvICJmaWxlc2l6ZWtiID0gJHtmaWxl
c2l6ZWtifSIKPiAJCQkkWEZTX0lPX1BST0cgLWZjICJmYWxsb2MgMCAke2ZpbGVzaXpla2J9ayIg
JGZpbGUKPiAJKyAgICAgICBkZgo+IAl9Cj4gCj4gZjJmczoKPiAJUUEgb3V0cHV0IGNyZWF0ZWQg
YnkgMTAzCj4gCStGaWxlc3lzdGVtICAgICAgIDFLLWJsb2NrcyAgICAgICBVc2VkICAgQXZhaWxh
YmxlIFVzZSUgTW91bnRlZCBvbgo+IAkuLi4KPiAJKy9kZXYvc2RiICAgICAgICAgIDEyNTgwODY0
ICAgICA1NTMyOTIgICAgMTIwMjc1NzIgICA1JSAvbW50L3NjcmF0Y2gKPiAJK2F2YWlsID0gMTIz
MTYyMzM3MjgKPiAJK2ZpbGVzaXpla2IgPSAxMjAyNzA2MAo+IAkrZmFsbG9jYXRlOiBObyBzcGFj
ZSBsZWZ0IG9uIGRldmljZQo+IAkrRmlsZXN5c3RlbSAgICAgICAxSy1ibG9ja3MgICAgICAgVXNl
ZCAgIEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24KPiAJLi4uCj4gCSsvZGV2L3NkYiAgICAgICAg
ICAxMjU4MDg2NCAgIDEyNTgwODY0ICAgICAgICAgICAwIDEwMCUgL21udC9zY3JhdGNoCj4gCVNp
bGVuY2UgaXMgZ29sZGVuLgo+IAo+IHhmczoKPiAJUUEgb3V0cHV0IGNyZWF0ZWQgYnkgMTAzCj4g
CStGaWxlc3lzdGVtICAgICAgIDFLLWJsb2NrcyAgICAgICBVc2VkICAgQXZhaWxhYmxlIFVzZSUg
TW91bnRlZCBvbgo+IAkuLi4KPiAJKy9kZXYvc2RiICAgICAgICAgIDEyNTcyNjcyICAgICAxMjA4
MjggICAgMTI0NTE4NDQgICAxJSAvbW50L3NjcmF0Y2gKPiAJK2F2YWlsID0gMTI3NTA2ODgyNTYK
PiAJK2ZpbGVzaXpla2IgPSAxMjQ1MTMzMgo+IAkrRmlsZXN5c3RlbSAgICAgICAxSy1ibG9ja3Mg
ICAgICAgVXNlZCAgIEF2YWlsYWJsZSBVc2UlIE1vdW50ZWQgb24KPiAJLi4uCj4gCSsvZGV2L3Nk
YiAgICAgICAgICAxMjU3MjY3MiAgIDEyNTcyMTYwICAgICAgICAgNTEyIDEwMCUgL21udC9zY3Jh
dGNoCj4gCVNpbGVuY2UgaXMgZ29sZGVuLgo+IAo+IGV4dDQ6Cj4gCVFBIG91dHB1dCBjcmVhdGVk
IGJ5IDEwMwo+IAkrRmlsZXN5c3RlbSAgICAgICAxSy1ibG9ja3MgICAgICAgVXNlZCAgIEF2YWls
YWJsZSBVc2UlIE1vdW50ZWQgb24KPiAJLi4uCj4gCSsvZGV2L3NkYiAgICAgICAgICAxMjMxOTg4
MCAgICAgIDQxMDQ4ICAgIDExNjMzMzA0ICAgMSUgL21udC9zY3JhdGNoCj4gCSthdmFpbCA9IDEx
OTEyNTAzMjk2Cj4gCStmaWxlc2l6ZWtiID0gMTE2MzI3OTIKPiAJK0ZpbGVzeXN0ZW0gICAgICAg
MUstYmxvY2tzICAgICAgIFVzZWQgICBBdmFpbGFibGUgVXNlJSBNb3VudGVkIG9uCj4gCS4uLgo+
IAkrL2Rldi9zZGIgICAgICAgICAgMTIzMTk4ODAgICAxMTY3Mzg0NCAgICAgICAgIDUwOCAxMDAl
IC9tbnQvc2NyYXRjaAo+IAlTaWxlbmNlIGlzIGdvbGRlbi4KPiAKPiBhZnRlciBjaGFuZ2UgKGYy
ZnMpCj4gCVFBIG91dHB1dCBjcmVhdGVkIGJ5IDEwMwo+IAlGaWxlc3lzdGVtICAgICAgIDFLLWJs
b2NrcyAgICAgICBVc2VkICAgQXZhaWxhYmxlIFVzZSUgTW91bnRlZCBvbgo+IAkuLi4KPiAJL2Rl
di9zZGIgICAgICAgICAgMTI1ODA4NjQgICAxMjU4MDM5NiAgICAgICAgIDQ2OCAxMDAlIC90bXAv
c2NyYXRjaAo+IAlTaWxlbmNlIGlzIGdvbGRlbi4KPiAKPiAgIHRlc3RzL2dlbmVyaWMvMTAzIHwg
MTAgKysrKysrKysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQo+IAo+IGRpZmYgLS1naXQgYS90ZXN0cy9nZW5lcmljLzEwMyBiL3Rlc3RzL2dlbmVy
aWMvMTAzCj4gaW5kZXggYjIyYjAxNTk2MjNlLi5kZmNlMzg3MDc4MWMgMTAwNzU1Cj4gLS0tIGEv
dGVzdHMvZ2VuZXJpYy8xMDMKPiArKysgYi90ZXN0cy9nZW5lcmljLzEwMwo+IEBAIC00MCwxMCAr
NDAsMTggQEAgcm0gLWYgJHNlcXJlcy5mdWxsCj4gICBfY29uc3VtZV9mcmVlc3AoKQo+ICAgewo+
ICAgCWZpbGU9JDEKPiArCWxlYXZlPTUxMgo+ICsKPiArCSMgVHJ5IHRvIGxlYXZlIH41MTJLQiwg
YnV0IGR1cmluZyB0aGUgZmFsbG9jYXRlLCBmMmZzIHdpbGwgYmUgZmlsbGVkLgo+ICsJIyBQcm92
aWRlIGVycm9yIHByb21wdDogImZhbGxvY2F0ZTogTm8gc3BhY2UgbGVmdCBvbiBkZXZpY2UiLiBM
ZWF2ZQo+ICsJIyBtb3JlIHNwYWNlIGZvciBmMmZzLgo+ICsJaWYgWyAkRlNUWVAgPT0gImYyZnMi
IF07IHRoZW4KPiArCQlsZWF2ZT0xMjI4OAo+ICsJZmkKPiAgIAo+ICAgCSMgY29uc3VtZSBuZWFy
bHkgYWxsIGF2YWlsYWJsZSBzcGFjZSAobGVhdmUgfjUxMmtCKQo+ICAgCWF2YWlsPWBfZ2V0X2F2
YWlsYWJsZV9zcGFjZSAkU0NSQVRDSF9NTlRgCj4gLQlmaWxlc2l6ZWtiPSQoKGF2YWlsIC8gMTAy
NCAtIDUxMikpCj4gKwlmaWxlc2l6ZWtiPSQoKGF2YWlsIC8gMTAyNCAtICRsZWF2ZSkpCj4gICAJ
JFhGU19JT19QUk9HIC1mYyAiZmFsbG9jIDAgJHtmaWxlc2l6ZWtifWsiICRmaWxlCj4gICB9Cj4g
ICAKPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpM
aW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJj
ZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9s
aW51eC1mMmZzLWRldmVsCg==
