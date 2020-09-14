Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E929268516
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Sep 2020 08:46:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kHiFJ-00024Z-C2; Mon, 14 Sep 2020 06:45:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kHiFH-00024K-Le
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 06:45:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0ta4g0SZTqV0SKBAiIBIbMPPkhMiXh620oxJflLNUUQ=; b=EnojK7KYwg2le8tD+HmapT5B+K
 ikye/CpHWR1QGlvbYHpsylm6hcn1LG9jqCaa9I6AdP+GDrurgJSn4TV5GXE2lLvRWzFLdmSg7HFbJ
 vjf5RQSaqM0YxxoUDSFICDeoHLk9YZc7Wli6oB7If6Qz9e1z8q6zeakZM1+tc/hyFOpA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0ta4g0SZTqV0SKBAiIBIbMPPkhMiXh620oxJflLNUUQ=; b=YBnYovc85Laq1HS8v92rixRr18
 XfnI09hWoa291uQuB3+TYr4lPjrhmlPVXtl6cLUx554jU6ZsUDPZ+jEPX6FN4CiSrfd+yr8vLp3mh
 6p8pn8RrUajCefnN5ajxJCbRj0RfTLTiJoFn2O5smxUbi8TCo2spf/kY87JIufA7+OP0=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kHiFA-008j0Q-Qi
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Sep 2020 06:45:47 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 418A33D41CA060FB1A9C;
 Mon, 14 Sep 2020 14:45:27 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 14 Sep
 2020 14:45:25 +0800
To: Daeho Jeong <daeho43@gmail.com>
References: <20200910052948.2021806-1-daeho43@gmail.com>
 <bb32e47d-ecc1-39d5-7877-38aac7390d60@huawei.com>
 <CACOAw_x-mfVFAVBE4p0CgspQuCREA2M28yZSw0yHJzr30k+5gg@mail.gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <baf08421-aaff-71e4-bca3-b1f060cc1d2a@huawei.com>
Date: Mon, 14 Sep 2020 14:45:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CACOAw_x-mfVFAVBE4p0CgspQuCREA2M28yZSw0yHJzr30k+5gg@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kHiFA-008j0Q-Qi
Subject: Re: [f2fs-dev] [PATCH v3] f2fs_io: change fibmap to fiemap
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC85LzExIDExOjQwLCBEYWVobyBKZW9uZyB3cm90ZToKPiBJIGRvbid0IHRoaW5rIGl0
IGlzIHJlcXVpcmVkLCBzaW5jZSBvbmx5IGYyZnNfaW8uYyB1c2VzIGZpZW1hcCBhbmQKPiBmMmZz
X2lvIGRvZXNuJ3QgdXNlIGluY2x1ZGUvYW5kcm9pZF9jb25maWcuaC4KCkNvcnJlY3QuCgo+IAo+
IDIwMjDrhYQgOeyblCAxMeydvCAo6riIKSDsmKTtm4QgMTI6MzYsIENoYW8gWXUgPHl1Y2hhbzBA
aHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Pgo+PiBPbiAyMDIwLzkvMTAgMTM6MjksIERhZWhv
IEplb25nIHdyb3RlOgo+Pj4gRnJvbTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29vZ2xlLmNv
bT4KPj4+Cj4+PiBDdXJyZW50bHkgd2Ugc3VwcG9ydCBmaWVtYXAgY29tbWFuZCB1c2luZyBmaWJt
YXAuIEl0J3Mgc2ltcGxlIGFuZAo+Pj4gZWFzeSB0byB1c2UsIGJ1dCB3ZSBjYW5ub3QgdXNlIHRo
aXMgZm9yIGNvbXByZXNzZWQgZmlsZS4gVG8gc3VwcG9ydAo+Pj4gbW9yZSBkaWZmZXJlbnQgdHlw
ZXMgb2YgZmlsZXMsIHdlIG5lZWQgdG8gY2hhbmdlIHRoaXMgdG8gdXNlIGZpZW1hcC4KPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgoKUmV2
aWV3ZWQtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KClRoYW5rcywKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
