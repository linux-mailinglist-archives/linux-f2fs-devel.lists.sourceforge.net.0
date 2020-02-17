Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 34261160941
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 04:51:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3XRA-00027e-K3; Mon, 17 Feb 2020 03:51:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j3XR8-00027W-BT
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 03:51:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ixTXCc4q43TAvLFA6eLRMH9ZSsIvtxxOpXfjnBOhgCw=; b=FvRcfu7RXviPUaGoBIBeQxQde2
 KdomNBat5diE+HOpVrQAOUd8Ujeay5N3lT7G+RAG7iY7Z1BVCDtefoQEOIy6rX5fU4tnOJsCgwzo2
 483O/0HZAlBQHbuS5UmRClzVjxU/ySj/75MzsLUEiqFZStH46yx1Q4U+be8Ew4QjglG8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ixTXCc4q43TAvLFA6eLRMH9ZSsIvtxxOpXfjnBOhgCw=; b=OBIzglTwYwTD0sjBaEMj+s3x58
 aYvou5KGiNImVwOj9b2/qEBI6i1gUkKaSwVnuon+LZbcS3vU2Bl7Xy765j4SX5iFr5UWWJSkw4zI8
 /Kckd6g5lrxciYULZHI4GN+9cidv0RJPbN0ILVY/f9CQwxMCF5S8kkOmMUc+vXuBSHmo=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3XR6-00F0RZ-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 03:51:10 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8AFA76B90E9869D6C1AE;
 Mon, 17 Feb 2020 11:50:58 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.439.0; Mon, 17 Feb
 2020 11:50:57 +0800
To: =?UTF-8?B?546L55+b?= <spearmao@126.com>
References: <381334f9.10021.1704dcbf102.Coremail.spearmao@126.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cc33bd7d-a2df-ee10-db58-445cfbfeef07@huawei.com>
Date: Mon, 17 Feb 2020 11:50:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <381334f9.10021.1704dcbf102.Coremail.spearmao@126.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j3XR6-00F0RZ-Lu
Subject: Re: [f2fs-dev] F2fs panic | update_sit_entry() | no free segment |
 se invalid
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkg546L55+b77yMCgpPbiAyMDIwLzIvMTYgMTk6MzksIOeOi+efmyB3cm90ZToKPiAqU28gdGhl
IHByb2JsZW0gaXM6Kgo+IAo+IDEuIGluIG5ld19jdXJzZWcoKSwgaWYgdGhlIHNlZ25vIGFsbG9j
YXRlZCBpcyBpbnZhbGlkKG5vIGZyZWUgc2VnbWVudCwgbWF4IHNlZ25vCj4gaXMgcmV0dXJuZWQp
Lgo+IAo+IEYyZnMgc2hvdWxkIGRvIHNvbWV0aGluZyB0byBpbmRpY2F0ZSB0aGlzIGV4Y2VwdGlv
bi4KPiAKPiAyLiBvdGhlcndpc2UsIHdlIG1heSBoaXQgdGhlIGYyZnMgcGFuaWMoc2UgaW52YWxp
ZCkuCj4gCj4gTWF5YmUgd2Ugc2hvdWxkIGRvIHNhbml0eSBjaGVjayBpbiB1cGRhdGVfc2l0X2Vu
dHJ5KCkgdG8gc2VlIGlmIHNlZ25vIGlzIHJlYWxseQo+IG91dCBvZiByYW5nZSBhbmQgY2F1c2Vk
IHRoaXMgcGFuaWMuCgpJJ20gYWZyYWlkIGl0J3MgdG9vIGxhdGUgdG8gaGFuZGxlIHN1Y2ggZXJy
b3IgaW4gdXBkYXRlX3NpdF9lbnRyeSgpLCBzaW5jZSB3ZQpleHBlY3QgYWxsIHByb2NlZHVyZXMg
aW4gZG9fd3JpdGVfcGFnZSgpIHdpbGwgYmUgc3VjY2Vzc2Z1bCwgaXQncyBhIGxpdHRsZSBoYXJk
CnRvIGhhbmRsZSBzdWNoIGVycm9yIGluIHRoYXQgY29udGV4dC4KClNvIHRoZSBwcm9ibGVtIGhl
cmUgaXMgd2h5IHdlIGNhbiBub3QgZmluZCBhbnkgZnJlZSBzZWdtZW50cyB3LyBMRlMgYWxsb2Nh
dGlvbiwKYmVjYXVzZSBpbiBjYXNlIG9mIGxhY2sgb2YgZnJlZSBzZWdtZW50cyAoY2hlY2sgdmlh
IGhhc19ub3RfZW5vdWdoX2ZyZWVfc2VjcygpKSwKZjJmcyB3aWxsIGZvcmNlIHRvIHRyaWdnZXIg
ZjJmc19nYygpIHRvIHJlY3ljbGUgZnJlZSBzZWN0aW9ucy4KCkkgZG91YnQgdGhlcmUgbWF5IGJl
IHNvbWUgY29ybmVyIGNhc2Ugd2UgaGF2ZW4ndCBjb25zaWRlcmVkLCByZXN1bHQgYWxsIGZyZWUK
c2VnbWVudHMgKGluY2x1ZGluZyByZXNlcnZlZCBmcmVlIHNlZ21lbnRzKSB3YXMgZXhoYXVzdGVk
IGJ5IGRhdGEvbm9kZSB3cml0ZXMKd2hlbiBsYXN0IGNoZWNrcG9pbnQgaXMgdHJpZ2dlcmVkIGR1
cmluZyB1bW91bnQuCgpJZiB0aGlzIGlzc3VlIGNhbiBiZSByZXByb2R1Y2VkIChkdXJpbmcgdW1v
dW50LCBmcmVlX3NlZ21lbnRzKCkgPApyZXNlcnZlZF9zZWdtZW50cygpKSwgd2UgY2FuIGFkZCBz
b21lIGxvZ3MgdG8gc2VlIHdoeSBmMmZzX2JhbGFuY2VfZnMoKSBmYWlsIHRvCnJlY3ljbGUgZW5v
dWdoIGZyZWUgc2VnbWVudHMgcHJldmlvdXNseS4KClRoYW5rcywKCj4gCj4gCj4gVGhhbmtzLAo+
IE1hbwo+IAo+IAo+IAo+IMKgCj4gCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
