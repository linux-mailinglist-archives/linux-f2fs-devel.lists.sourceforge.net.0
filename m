Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A8A1F9134
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2020 10:18:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jkkKG-0006x0-R0; Mon, 15 Jun 2020 08:18:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jkkK7-0006wT-LM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 08:18:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FYA93KDKLdM83bWPuaAEirwNoGKO2yJv1z6v/q5kKaw=; b=YFqpMeaCXeT5WKZ+UygT7Ec3p0
 iVy8Znmcg5oyTinC9h0rcmBTcRL2lD0qRwoAXqyCKGiCB3I8v6qMBV6+8JMu8BTNqQ4YeIkLXQ8uj
 gPD+bwv+/SthwbDBK/RKl+fUrrClriBcHXSLqsTRrdnE0sILIRlxs1lT83uDX2LcwV/Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FYA93KDKLdM83bWPuaAEirwNoGKO2yJv1z6v/q5kKaw=; b=fF32Xy1cBION7PdlZNTsqSzpwK
 2IMwIGEnOJVc9eF6AvVhZy1i2xBvmekD9UeNOa+pSUpFH9CXE5nhbBToZpnZenPVqseLXS/XSI3vg
 dEGGE9NH3fjxNSDeWVIw/jQtzlxma3i3qTf00RmD9N4Ob3ZXXpIn3Uf5EL9SmiWjp638=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jkkK4-003HKQ-A4
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 15 Jun 2020 08:18:31 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 78C85222F3D9AFF0ACD9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 15 Jun 2020 16:18:12 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.206) with Microsoft SMTP Server (TLS) id 14.3.487.0; Mon, 15 Jun
 2020 16:18:06 +0800
To: Wei Fang <fangwei1@huawei.com>, <linux-f2fs-devel@lists.sourceforge.net>
References: <20200615081138.11685-1-fangwei1@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <14d8aa52-0975-8371-c49f-86278649c3ec@huawei.com>
Date: Mon, 15 Jun 2020 16:18:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200615081138.11685-1-fangwei1@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jkkK4-003HKQ-A4
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: remove useless truncate in
 f2fs_collapse_range()
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/15 16:11, Wei Fang wrote:
> Since offset < new_size, no need to do truncate_pagecache() again
> with new_size.
> 
> Signed-off-by: Wei Fang <fangwei1@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
