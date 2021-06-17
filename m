Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6EE3AAC87
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Jun 2021 08:39:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ltlgB-0000t9-OZ; Thu, 17 Jun 2021 06:39:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sunke32@huawei.com>) id 1ltlgA-0000t2-Vv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 06:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cg4hSuqkSdcr6+jAljg+GwpOvkq92tqpRbZC411iT9M=; b=CoR/8i1w0Tw0R8w3z17TMArxvc
 RcFb1nozawBNI+qRkNEYye2Son2AvxLYF3lrcD7z3564eRI0jttBC+zJx0sac7xnNkUJSFziIKKYx
 vVNCLi04YFP06q3QGhie2wQ5z35RFat7t8XfmcIVbf0LdJbvoqWjzyd2Z3X02DKadyCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cg4hSuqkSdcr6+jAljg+GwpOvkq92tqpRbZC411iT9M=; b=PdMR9yeuMwIqPS58soiTpqLuUz
 KB3TWILsK3EvCLG9O5ETdTtiW0NvnXyRX3KhnMypoOd4Wlb8ktaVp9utAvbXWV6wMcAOPim6WNCPk
 7b50SjXwlF4zKUrf8qdnVluNYXlUmVwJKB8Oc1/wbCd0hQNve+tEmaduqGeiJ7n39zDs=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1ltlfz-0006KH-6o
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Jun 2021 06:39:07 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G5C494bMkzZdyC;
 Thu, 17 Jun 2021 14:35:53 +0800 (CST)
Received: from dggema759-chm.china.huawei.com (10.1.198.201) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Thu, 17 Jun 2021 14:38:37 +0800
Received: from [10.174.178.31] (10.174.178.31) by
 dggema759-chm.china.huawei.com (10.1.198.201) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Thu, 17 Jun 2021 14:38:36 +0800
To: Chao Yu <chao@kernel.org>
References: <20210611112211.1408767-1-sunke32@huawei.com>
 <20210611112211.1408767-3-sunke32@huawei.com>
 <87024647-0ece-929d-8aa6-8dab9609159c@huawei.com>
 <6362f24f-35d1-7e5b-c3cc-d6cbb18947fe@kernel.org>
From: Sun Ke <sunke32@huawei.com>
Message-ID: <2bc7d16b-c9f3-f8f6-2007-3f567e2b5a4b@huawei.com>
Date: Thu, 17 Jun 2021 14:38:36 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6362f24f-35d1-7e5b-c3cc-d6cbb18947fe@kernel.org>
X-Originating-IP: [10.174.178.31]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggema759-chm.china.huawei.com (10.1.198.201)
X-CFilter-Loop: Reflected
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.187 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.3 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1ltlfz-0006KH-6o
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
Cc: guan@eryu.me, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgrlnKggMjAyMS82LzE2IDIxOjQzLCBDaGFvIFl1IOWGmemBkzoKPiBPbiAyMDIxLzYvMTUgMTE6
MjksIFN1biBLZSB3cm90ZToKPj4gdG8gbGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKPj4KPj4g5ZyoIDIwMjEvNi8xMSAxOToyMiwgU3VuIEtlIOWGmemBkzoKPj4+IEl0IHNl
ZW0gdGhhdCBmMmZzIGFsc28gc3BlY2lhbCBsaWtlIGJ0cmZzLgo+Pj4KPj4+IMKgIFsrXSBEZWZh
dWx0IGxlbmd0aCB3aXRoIHN0YXJ0IHNldCAoc2hvdWxkIHN1Y2NlZWQpCj4+PiDCoCBbK10gTGVu
Z3RoIGJleW9uZCB0aGUgZW5kIG9mIGZzIChzaG91bGQgc3VjY2VlZCkKPj4+IMKgIFsrXSBMZW5n
dGggYmV5b25kIHRoZSBlbmQgb2YgZnMgd2l0aCBzdGFydCBzZXQgKHNob3VsZCBzdWNjZWVkKQo+
Pj4gK0FmdGVyIHRoZSBmdWxsIGZzIGRpc2NhcmQgMCBieXRlcyB3ZXJlIGRpc2NhcmRlZCBob3dl
dmVyIHRoZSBmaWxlIAo+Pj4gc3lzdGVtIGlzIDEyODgyODA0NzM2IGJ5dGVzIGxvbmcuCj4+PiAr
SXQgc2VlbXMgdGhhdCBmcyBsb2dpYyBoYW5kbGluZyBsZW4gYXJndW1lbnQgb3ZlcmZsb3dzCj4g
Cj4gV2VsbCwgdGhlIHJvb3QgY2F1c2UgaXMgZjJmcyBjYW4gdGFnIGEgc3BlY2lhbCBmbGFnIFRS
SU1NRURfRkxBRyB0bwo+IGluZGljYXRlIHRoZSB3aG9sZSBmaWxlc3lzdGVtIGlzIHRyaW1tZWQs
IHNvIGFmdGVyIG1rZnMvZnN0cmltKCksCj4gZm9sbG93aW5nIGZzdHJpbSgpIHdvbid0IHRyaW0g
YW55IGJsb2NrLgo+IAo+IENhbiB5b3UgcGxlYXNlIHVwZGF0ZSBjb21taXQgbWVzc2FnZSBhbmQg
YWRkIGNvbW1lbnRzIGluIHNjcmlwdD8KPiAKPiBUaGFua3MsCgpHbGFkIHRvIGRvIHRoYXQuCgpU
aGFua3MsClN1biBLZQo+IAo+Pj4KPj4+IFNpZ25lZC1vZmYtYnk6IFN1biBLZSA8c3Vua2UzMkBo
dWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiBJIGFtIG5vdCBzdXJlIGFib3V0IHRoYXQuIG8o4pWv4pah
4pWwKW8KPj4+Cj4+PiDCoCB0ZXN0cy9nZW5lcmljLzI2MCB8IDQgKystLQo+Pj4gwqAgMSBmaWxl
IGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0t
Z2l0IGEvdGVzdHMvZ2VuZXJpYy8yNjAgYi90ZXN0cy9nZW5lcmljLzI2MAo+Pj4gaW5kZXggODAy
MWFhNjguLjZiZDg2MWQyIDEwMDc1NQo+Pj4gLS0tIGEvdGVzdHMvZ2VuZXJpYy8yNjAKPj4+ICsr
KyBiL3Rlc3RzL2dlbmVyaWMvMjYwCj4+PiBAQCAtMTAwLDcgKzEwMCw3IEBAIGZpCj4+PiDCoCAj
IEl0IGlzIGJlY2F1c2UgYnRyZnMgZG9lcyBub3QgaGF2ZSBub3QteWV0LXVzZWQgcGFydHMgb2Yg
dGhlIGRldmljZQo+Pj4gwqAgIyBtYXBwZWQgYW5kIHNpbmNlIHdlIGdvdCBoZXJlIHJpZ2h0IGFm
dGVyIHRoZSBta2ZzLCB0aGVyZSBpcyBub3QKPj4+IMKgICMgZW5vdWdoIGZyZWUgZXh0ZW50cyBp
biB0aGUgcm9vdCB0cmVlLgo+Pj4gLWlmIFsgJGJ5dGVzIC1sZSAkKF9tYXRoICIkZnNzaXplKjUx
MiIpIF0gJiYgWyAkRlNUWVAgIT0gImJ0cmZzIiBdOyB0aGVuCj4+PiAraWYgWyAkYnl0ZXMgLWxl
ICQoX21hdGggIiRmc3NpemUqNTEyIikgXSAmJiBbICRGU1RZUCAhPSAiYnRyZnMiIF0gJiYgCj4+
PiBbICRGU1RZUCAhPSAiZjJmcyIgXTsgdGhlbgo+Pj4gwqDCoMKgwqDCoCBzdGF0dXM9MQo+Pj4g
wqDCoMKgwqDCoCBlY2hvICJBZnRlciB0aGUgZnVsbCBmcyBkaXNjYXJkICRieXRlcyBieXRlcyB3
ZXJlIGRpc2NhcmRlZCJcCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiaG93ZXZlciB0aGUgZmls
ZSBzeXN0ZW0gaXMgJChfbWF0aCAiJGZzc2l6ZSoxMDI0IikgYnl0ZXMgCj4+PiBsb25nLiIKPj4+
IEBAIC0xNjAsNyArMTYwLDcgQEAgX3NjcmF0Y2hfbW91bnQKPj4+IMKgICMgbWFwcGVkIGFuZCBz
aW5jZSB3ZSBnb3QgaGVyZSByaWdodCBhZnRlciB0aGUgbWtmcywgdGhlcmUgaXMgbm90Cj4+PiDC
oCAjIGVub3VnaCBmcmVlIGV4dGVudHMgaW4gdGhlIHJvb3QgdHJlZS4KPj4+IMKgIGJ5dGVzPSQo
JEZTVFJJTV9QUk9HIC12IC1sJGxlbiAkU0NSQVRDSF9NTlQgfCBfZmlsdGVyX2ZzdHJpbSkKPj4+
IC1pZiBbICRieXRlcyAtbGUgJChfbWF0aCAiJGZzc2l6ZSo1MTIiKSBdICYmIFsgJEZTVFlQICE9
ICJidHJmcyIgXTsgdGhlbgo+Pj4gK2lmIFsgJGJ5dGVzIC1sZSAkKF9tYXRoICIkZnNzaXplKjUx
MiIpIF0gJiYgWyAkRlNUWVAgIT0gImJ0cmZzIiBdICYmIAo+Pj4gWyAkRlNUWVAgIT0gImYyZnMi
IF07IHRoZW4KPj4+IMKgwqDCoMKgwqAgc3RhdHVzPTEKPj4+IMKgwqDCoMKgwqAgZWNobyAiSXQg
c2VlbXMgdGhhdCBmcyBsb2dpYyBoYW5kbGluZyBsZW4gYXJndW1lbnQgb3ZlcmZsb3dzIgo+Pj4g
wqAgZmkKPj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2Uu
bmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAuCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
