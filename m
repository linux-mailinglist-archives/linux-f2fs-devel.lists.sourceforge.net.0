Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A91FEC6A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 09:27:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jloxd-0004ZC-MH; Thu, 18 Jun 2020 07:27:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jloxc-0004Z5-F5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 07:27:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lLV5PBNhh/tSoPvVENY6MeegmaRev/xXFFqqitnWZ2w=; b=dGQFFSH8yi+XDuUPVI5xVGZOqu
 EemlY7fUUjLLPRLWnSnWV80+ZjGdUoVk2YAME3UQRY/R/RXkTZBKw5V+4hHmVVn9ZJoj4LW/LmzmW
 MNz29I/lXqwfVKaifIbLEXVPs7M3rWrDjuKOTgsxY2gIquxPQWnSOtCuulxtiAbWr8vY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:To:Subject:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lLV5PBNhh/tSoPvVENY6MeegmaRev/xXFFqqitnWZ2w=; b=RspsC2ESS8u10OuxUvy2wpHumw
 GxB69EeoB2HOCrPyiMVFWawNnum5XhBO+ULjaftFfVfG/ZzQStaKJZ5HgC0XXEbWIggu/qafKdqjn
 df6UMaKs2ISN6SoaGNU+1F/u3W/OFZ/2c0HwW02fpgE1KnfuQRr380R2TkF5lGeO8l6o=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jloxa-00AICr-0p
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 07:27:44 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3C54A4B79B7FAB3711B3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 18 Jun 2020 15:27:27 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 15:27:18 +0800
To: Wang Xiaojun <wangxiaojun11@huawei.com>,
 <linux-f2fs-devel@lists.sourceforge.net>
References: <20200617123012.90643-1-wangxiaojun11@huawei.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <dd8dfb3f-c78a-d108-d593-ec2b2f5e4669@huawei.com>
Date: Thu, 18 Jun 2020 15:27:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200617123012.90643-1-wangxiaojun11@huawei.com>
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
X-Headers-End: 1jloxa-00AICr-0p
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kfree() to free variables
 allocated by match_strdup()
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

On 2020/6/17 20:30, Wang Xiaojun wrote:
> Use kfree() instead of kvfree() to free variables allocated
> by match_strdup(). Because the memory is allocated with kmalloc
> inside match_strdup().
> 
> Signed-off-by: Wang Xiaojun <wangxiaojun11@huawei.com>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
