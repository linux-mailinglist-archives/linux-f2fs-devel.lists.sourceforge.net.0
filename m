Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E52D8C92
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Oct 2019 11:34:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iKfh6-0006LE-MY; Wed, 16 Oct 2019 09:34:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1iKfh4-0006Ko-QF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:34:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hgE1BPcek7+6QDdwnkBbSupr8kX1PQc3UnJQ+D+wOQ=; b=kpwMJ9HlVQZ4FEnaA1D6Ojq7k1
 bccmqa2mLZSgb0VdfvLsZ0DQ/XD22EHDp3BHsBfOzwRgJzwBGLPSuN2JeEgqLhyGSqgTlO2dzc88z
 uCLm8v6FeNktRkRIYU91fJNuO52CA76CoyQhajNzWl4Mv5mCNhOGG9r4+RuV8onATVHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7hgE1BPcek7+6QDdwnkBbSupr8kX1PQc3UnJQ+D+wOQ=; b=MRGHCwR/1+Jo6N0Rdz2viMYcOR
 CN8AVHvDiS4hleQ1Der4CiBANXTJDRKe4LEdeEtQnmfn6ap+cMI/HGtQkksur0SiF1qZM85e5Ysmk
 TVH1+g+XYw/tbuZJ5/Z/+wG4rpxohmG9wZGq5YJj5RZrqXvrhR8ONxEiodcxZcoMJqU4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iKfgy-003eEc-It
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 16 Oct 2019 09:34:05 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 9FDEED5BC9F97019C161;
 Wed, 16 Oct 2019 17:33:57 +0800 (CST)
Received: from [127.0.0.1] (10.133.219.219) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0;
 Wed, 16 Oct 2019 17:33:48 +0800
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
References: <1571217309-63636-1-git-send-email-koulihong@huawei.com>
From: lihong <koulihong@huawei.com>
Message-ID: <262f6cc7-4b8e-4c72-6a48-28c2bd3aba34@huawei.com>
Date: Wed, 16 Oct 2019 17:33:48 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1571217309-63636-1-git-send-email-koulihong@huawei.com>
X-Originating-IP: [10.133.219.219]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1iKfgy-003eEc-It
Subject: Re: [f2fs-dev] [PATCH 0/2] add a new fio cache for IPU.
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
Cc: zengguangyue@hisilicon.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UGxlYXNlIGlnbm9yZSB0aGlzIHBhdGNoLCB0aGVyZSBhcmUgc29tZSBmb3JtYXQgZXJyb3JzIGlu
IHRoZSBjb21taXQgCmRlc2NyaXB0aW9uLCBpIHdpbGwgc2VuZCB0aGUgcGF0Y2hzIHdpdGgKCnRo
ZSBmaXguCgrU2iAyMDE5LzEwLzE2IDE3OjE1LCBMaWhvbmcgS291INC0tcA6Cj4gKioqIEJMVVJC
IEhFUkUgKioqCj4KPiBMaWhvbmcgS291ICgxKToKPiAgICBSZXZlcnQgImYyZnM6IGFkZCBiaW8g
Y2FjaGUgZm9yIElQVSIKPgo+IGswMDQxNzkyNSAoMSk6Cj4gICAgZjJmczogaW50cm9kdWNlIGEg
bmV3IGZpbyBjYWNoZSBmb3IgSVBVLgo+Cj4gICBmcy9mMmZzL2NoZWNrcG9pbnQuYyB8ICAxICsK
PiAgIGZzL2YyZnMvZGF0YS5jICAgICAgIHwgOTMgKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICAgZnMvZjJmcy9mMmZzLmggICAgICAgfCAgNCAr
LS0KPiAgIGZzL2YyZnMvc2VnbWVudC5jICAgIHwgMjIgKysrKysrLS0tLS0tLQo+ICAgZnMvZjJm
cy9zdXBlci5jICAgICAgfCAgMiArKwo+ICAgNSBmaWxlcyBjaGFuZ2VkLCAyOSBpbnNlcnRpb25z
KCspLCA5MyBkZWxldGlvbnMoLSkKPgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
