Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6288118EE6E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 04:19:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGDcG-0007HN-WB; Mon, 23 Mar 2020 03:19:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jGDcF-0007HA-Qg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w2UU4YoiVzu92mLagLnqIAHa1ZooljmumlDvi8ydch4=; b=M+ABg38GS9codBGtak8jlvFd5A
 eYNEJtlDV2XeYHaOsyZY2ETJT02aTAH+fIEMABKfLJVIABpAnhasZMccYDDJ+rvik4P+uN7JDTs9m
 uLIxIf5FVtw8M9X3sssOk+NDjerYblZ6vnJNaT5yInL9lmD7d8P6SzMIa76VhS/BIGHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=w2UU4YoiVzu92mLagLnqIAHa1ZooljmumlDvi8ydch4=; b=WH1ZmVEblzAN6YCHalOA2Ci8nO
 1w5FNW/WzX6kRgsha1s6pfv1a7cBHnOdQ1FRBgN7lIM05hEhCqDqECWZvKe1ndOJkN5q7NydY9ilJ
 OfIyWs4jE7aOBTRO21xI1A625zeje7vrA8BC5gQHgxcpuzSM8AJi+ZmpW5xbRBnxRn/8=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGDcC-000QnL-S6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 03:19:03 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 06C8BED25348B3E7DE8B;
 Mon, 23 Mar 2020 11:18:52 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.211) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 23 Mar
 2020 11:18:51 +0800
To: =?UTF-8?Q?Ond=c5=99ej_Jirman?= <megi@xff.cz>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-kernel@vger.kernel.org>,
 <chao@kernel.org>
References: <20200323024109.60967-1-yuchao0@huawei.com>
 <20200323030549.rwlexq76ng4nq7nt@core.my.home>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <02e925ca-86a3-a2a8-5879-de7c2364413c@huawei.com>
Date: Mon, 23 Mar 2020 11:18:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200323030549.rwlexq76ng4nq7nt@core.my.home>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: megous.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.0 CTE_8BIT_MISMATCH      Header says 7bits but body disagrees
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGDcC-000QnL-S6
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix potential .flags overflow on
 32bit architecture
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC8zLzIzIDExOjA1LCBPbmTFmWVqIEppcm1hbiB3cm90ZToKPiBIZWxsbywKPiAKPiBP
biBNb24sIE1hciAyMywgMjAyMCBhdCAxMDo0MTowOUFNICswODAwLCBDaGFvIFl1IHdyb3RlOgo+
PiBmMmZzX2lub2RlX2luZm8uZmxhZ3MgaXMgdW5zaWduZWQgbG9uZyB2YXJpYWJsZSwgaXQgaGFz
IDMyIGJpdHMKPj4gaW4gMzJiaXQgYXJjaGl0ZWN0dXJlLCBzaW5jZSB3ZSBpbnRyb2R1Y2VkIEZJ
X01NQVBfRklMRSBmbGFnCj4+IHdoZW4gd2Ugc3VwcG9ydCBkYXRhIGNvbXByZXNzaW9uLCB3ZSBt
YXkgYWNjZXNzIG1lbW9yeSBjcm9zcwo+PiB0aGUgYm9yZGVyIG9mIC5mbGFncyBmaWVsZCwgY29y
cnVwdGluZyAuaV9zZW0gZmllbGQsIHJlc3VsdCBpbgo+PiBiZWxvdyBkZWFkbG9jay4KPj4KPj4g
VG8gZml4IHRoaXMgaXNzdWUsIGxldCdzIGV4cGFuZCAuZmxhZ3MgYXMgYW4gYXJyYXkgdG8gZ3Jh
YiBlbm91Z2gKPj4gc3BhY2UgdG8gc3RvcmUgbmV3IGZsYWdzLgo+Pgo+PiBDYWxsIFRyYWNlOgo+
PiAgX19zY2hlZHVsZSsweDhkMC8weDEzZmMKPj4gID8gbWFya19oZWxkX2xvY2tzKzB4YWMvMHgx
MDAKPj4gIHNjaGVkdWxlKzB4Y2MvMHgyNjAKPj4gIHJ3c2VtX2Rvd25fd3JpdGVfc2xvd3BhdGgr
MHgzYWIvMHg2NWQKPj4gIGRvd25fd3JpdGUrMHhjNy8weGUwCj4+ICBmMmZzX2Ryb3Bfbmxpbmsr
MHgzZC8weDYwMCBbZjJmc10KPj4gIGYyZnNfZGVsZXRlX2lubGluZV9lbnRyeSsweDMwMC8weDQ0
MCBbZjJmc10KPj4gIGYyZnNfZGVsZXRlX2VudHJ5KzB4M2ExLzB4N2YwIFtmMmZzXQo+PiAgZjJm
c191bmxpbmsrMHg1MDAvMHg3OTAgW2YyZnNdCj4+ICB2ZnNfdW5saW5rKzB4MjExLzB4NDkwCj4+
ICBkb191bmxpbmthdCsweDQ4My8weDUyMAo+PiAgc3lzX3VubGluaysweDRhLzB4NzAKPj4gIGRv
X2Zhc3Rfc3lzY2FsbF8zMisweDEyYi8weDY4Mwo+PiAgZW50cnlfU1lTRU5URVJfMzIrMHhhYS8w
eDEwMgo+Pgo+PiBGaXhlczogNGM4ZmY3MDk1YmVmICgiZjJmczogc3VwcG9ydCBkYXRhIGNvbXBy
ZXNzaW9uIikKPj4gU2lnbmVkLW9mZi1ieTogQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPgo+
IAo+IFRlc3RlZC1ieTogT25kcmVqIEppcm1hbiA8bWVnb3VzQG1lZ291cy5jb20+CgpUaGFua3Mg
Zm9yIHF1aWNrIHRlc3QsIEkndmUgYWRkZWQgdGhpcyB0YWcgaW4gdjUuIDopCgpUaGFua3MsCgo+
IAo+IFRoaXMgcGF0Y2ggYWxvbmUgYWxzbyBmaXhlcyBhbGwgdGhlIG90aGVyIGxvY2t1cHMgSSBy
ZXBvcnRlZCByZWNlbnRseSwKPiB0aGF0IHdlcmUgZWFzaWVyIHRvIHRyaWdnZXIgdGhhbiB0aGlz
IG9uZS4KPiAKPiB0aGFua3MsCj4gCW8uCj4gLgo+IAoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
