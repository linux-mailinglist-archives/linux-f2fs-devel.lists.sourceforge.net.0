Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 876893A7524
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jun 2021 05:29:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lszlY-0004um-UI; Tue, 15 Jun 2021 03:29:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunke32@huawei.com>) id 1lszlX-0004uT-5D
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:29:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=k/iwTVQtC3WK5R8LLzku8pG+xcTLAF8Q82f9jmMGuRQ=; b=HnyCmeWHuM4wd2IELl6LrDSlid
 gErNfKtVlWhIXAFHuK6TX9LOVOqmHjJIBqdvFUhrLgLoyJExP0ANM4Wh9BlL7Y1t8CGLPvWr3hJzb
 nATOkdQbzJTnpV9Apd9KzquSOPo2QeD50HivA5sMdHLFp1o+BFUrAZTO27AvKu70F6IU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=k/iwTVQtC3WK5R8LLzku8pG+xcTLAF8Q82f9jmMGuRQ=; b=F//GYfSPcae0HvfOBex4xMS32i
 uVD9sBC1UDzVNcg6Tpx72pB775AYs38z0MqmOYofuwzOLGRSYSnuIL5aEKrEt3+KiG2nsb9YSL4w6
 MM79RYjqd9YSJEBpcksS8yq30HFEyCSMd/s+pezL5Elw3lGrYeizLWmoRuU1LCULbVFI=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lszlU-00A1da-0k
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 15 Jun 2021 03:29:28 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G3txC2xY1z61BC;
 Tue, 15 Jun 2021 11:25:19 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 11:29:17 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Tue, 15 Jun 2021 11:29:16 +0800
To: <fstests@vger.kernel.org>, <guan@eryu.me>, <yuchao0@huawei.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <20210611112211.1408767-3-sunke32@huawei.com>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <87024647-0ece-929d-8aa6-8dab9609159c@huawei.com>
Date: Tue, 15 Jun 2021 11:29:16 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210611112211.1408767-3-sunke32@huawei.com>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.5 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lszlU-00A1da-0k
Subject: Re: [f2fs-dev] [PATCH] generic/260: f2fs is also special
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
OToyMiwgU3VuIEtlINC0tcA6Cj4gSXQgc2VlbSB0aGF0IGYyZnMgYWxzbyBzcGVjaWFsIGxpa2Ug
YnRyZnMuCj4gCj4gICBbK10gRGVmYXVsdCBsZW5ndGggd2l0aCBzdGFydCBzZXQgKHNob3VsZCBz
dWNjZWVkKQo+ICAgWytdIExlbmd0aCBiZXlvbmQgdGhlIGVuZCBvZiBmcyAoc2hvdWxkIHN1Y2Nl
ZWQpCj4gICBbK10gTGVuZ3RoIGJleW9uZCB0aGUgZW5kIG9mIGZzIHdpdGggc3RhcnQgc2V0IChz
aG91bGQgc3VjY2VlZCkKPiArQWZ0ZXIgdGhlIGZ1bGwgZnMgZGlzY2FyZCAwIGJ5dGVzIHdlcmUg
ZGlzY2FyZGVkIGhvd2V2ZXIgdGhlIGZpbGUgc3lzdGVtIGlzIDEyODgyODA0NzM2IGJ5dGVzIGxv
bmcuCj4gK0l0IHNlZW1zIHRoYXQgZnMgbG9naWMgaGFuZGxpbmcgbGVuIGFyZ3VtZW50IG92ZXJm
bG93cwo+IAo+IFNpZ25lZC1vZmYtYnk6IFN1biBLZSA8c3Vua2UzMkBodWF3ZWkuY29tPgo+IC0t
LQo+IEkgYW0gbm90IHN1cmUgYWJvdXQgdGhhdC4gbyioc6H1qHQpbwo+IAo+ICAgdGVzdHMvZ2Vu
ZXJpYy8yNjAgfCA0ICsrLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL3Rlc3RzL2dlbmVyaWMvMjYwIGIvdGVzdHMv
Z2VuZXJpYy8yNjAKPiBpbmRleCA4MDIxYWE2OC4uNmJkODYxZDIgMTAwNzU1Cj4gLS0tIGEvdGVz
dHMvZ2VuZXJpYy8yNjAKPiArKysgYi90ZXN0cy9nZW5lcmljLzI2MAo+IEBAIC0xMDAsNyArMTAw
LDcgQEAgZmkKPiAgICMgSXQgaXMgYmVjYXVzZSBidHJmcyBkb2VzIG5vdCBoYXZlIG5vdC15ZXQt
dXNlZCBwYXJ0cyBvZiB0aGUgZGV2aWNlCj4gICAjIG1hcHBlZCBhbmQgc2luY2Ugd2UgZ290IGhl
cmUgcmlnaHQgYWZ0ZXIgdGhlIG1rZnMsIHRoZXJlIGlzIG5vdAo+ICAgIyBlbm91Z2ggZnJlZSBl
eHRlbnRzIGluIHRoZSByb290IHRyZWUuCj4gLWlmIFsgJGJ5dGVzIC1sZSAkKF9tYXRoICIkZnNz
aXplKjUxMiIpIF0gJiYgWyAkRlNUWVAgIT0gImJ0cmZzIiBdOyB0aGVuCj4gK2lmIFsgJGJ5dGVz
IC1sZSAkKF9tYXRoICIkZnNzaXplKjUxMiIpIF0gJiYgWyAkRlNUWVAgIT0gImJ0cmZzIiBdICYm
IFsgJEZTVFlQICE9ICJmMmZzIiBdOyB0aGVuCj4gICAJc3RhdHVzPTEKPiAgIAllY2hvICJBZnRl
ciB0aGUgZnVsbCBmcyBkaXNjYXJkICRieXRlcyBieXRlcyB3ZXJlIGRpc2NhcmRlZCJcCj4gICAJ
ICAgICAiaG93ZXZlciB0aGUgZmlsZSBzeXN0ZW0gaXMgJChfbWF0aCAiJGZzc2l6ZSoxMDI0Iikg
Ynl0ZXMgbG9uZy4iCj4gQEAgLTE2MCw3ICsxNjAsNyBAQCBfc2NyYXRjaF9tb3VudAo+ICAgIyBt
YXBwZWQgYW5kIHNpbmNlIHdlIGdvdCBoZXJlIHJpZ2h0IGFmdGVyIHRoZSBta2ZzLCB0aGVyZSBp
cyBub3QKPiAgICMgZW5vdWdoIGZyZWUgZXh0ZW50cyBpbiB0aGUgcm9vdCB0cmVlLgo+ICAgYnl0
ZXM9JCgkRlNUUklNX1BST0cgLXYgLWwkbGVuICRTQ1JBVENIX01OVCB8IF9maWx0ZXJfZnN0cmlt
KQo+IC1pZiBbICRieXRlcyAtbGUgJChfbWF0aCAiJGZzc2l6ZSo1MTIiKSBdICYmIFsgJEZTVFlQ
ICE9ICJidHJmcyIgXTsgdGhlbgo+ICtpZiBbICRieXRlcyAtbGUgJChfbWF0aCAiJGZzc2l6ZSo1
MTIiKSBdICYmIFsgJEZTVFlQICE9ICJidHJmcyIgXSAmJiBbICRGU1RZUCAhPSAiZjJmcyIgXTsg
dGhlbgo+ICAgCXN0YXR1cz0xCj4gICAJZWNobyAiSXQgc2VlbXMgdGhhdCBmcyBsb2dpYyBoYW5k
bGluZyBsZW4gYXJndW1lbnQgb3ZlcmZsb3dzIgo+ICAgZmkKPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
