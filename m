Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF1723C2F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Aug 2020 03:18:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k384I-0007aH-PT; Wed, 05 Aug 2020 01:18:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k384G-0007a7-NB
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Aug 2020 01:18:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=my9wsCU2lxXP6JDIgeAWLObo39qYMEY2/36W2nxF0Cg=; b=jJJmlpJh3e574qZasZKEc1GCsR
 6iGzq7FfyjyYTB3EHNPdrSt+Oyo7Td2PIq6g9c4QZ5Q9USE8D3Bhjgk3evkD2jMnRwFRfl9n+TnMm
 mVa6LbTL5kofwA4Jvii8VAlwp6mew9Gwai0HdhOfl5E5UoxPlQsW+Xyk6B5aWefuXAI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=my9wsCU2lxXP6JDIgeAWLObo39qYMEY2/36W2nxF0Cg=; b=ir1Csp0bDf5m+EH4vhR2JfOGUu
 hzITnd+qhzBdQxXCBVn1mpSkfpEJ40bICBVgWDJKQyyAZqVpAmLzbMdovjEfeDl+TnpIwXZRLibZk
 6xbfOhOIf3lzDU7H+vpA2cMoxOClUAhLF3kt1PDQ5oqqGA4eFtCfSg+m6EW5t3/NvpsQ=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k384C-00A8VQ-JX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Aug 2020 01:18:08 +0000
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 36BD268C54B7C320E6DB;
 Wed,  5 Aug 2020 09:17:52 +0800 (CST)
Received: from [10.164.122.247] (10.164.122.247) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.487.0; Wed, 5 Aug 2020
 09:17:45 +0800
To: w00407079 <wangxiaojun11@huawei.com>, <jaegeuk@kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200804134604.459039-1-wangxiaojun11@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <959769c5-7b39-4ca8-0468-7f4c7b63ee98@huawei.com>
Date: Wed, 5 Aug 2020 09:17:45 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200804134604.459039-1-wangxiaojun11@huawei.com>
Content-Language: en-US
X-Originating-IP: [10.164.122.247]
X-CFilter-Loop: Reflected
X-Spam-Score: -1.4 (-)
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
 -1.5 NICE_REPLY_A           Looks like a legit reply (A)
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k384C-00A8VQ-JX
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove duplicated type casting
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/8/4 21:46, w00407079 wrote:
> From: Xiaojun Wang <wangxiaojun11@huawei.com>
> 
> Since DUMMY_WRITTEN_PAGE and ATOMIC_WRITTEN_PAGE have already been
> converted as unsigned long type, we don't need do type casting again.
> 
> Signed-off-by: Xiaojun Wang <wangxiaojun11@huawei.com>
> Reported-by: Jack Qiu <jack.qiu@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
