Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2B31620AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 07:10:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3w53-0005e2-Kg; Tue, 18 Feb 2020 06:10:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j3w51-0005dX-K3
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 06:09:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=orFU9yHcjJQutr8H/yohGhy9fV24WiYBdQlp7zq91I8=; b=eGhnWD2YQKxra62yy92t+aDy1M
 Tp5UH2kQKiy6DCS+envwLLymAigtc7Y3o7pcyrBp49rnUNX818h6S8UnI60ChOVpc2xp1ZYeyUHjB
 ZiRiLVA81aidjOEMrHEVbBlXbZjUkY7NAxCT++hSTddJDIU6d80YZmmCvrEFPjqVo+tE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=orFU9yHcjJQutr8H/yohGhy9fV24WiYBdQlp7zq91I8=; b=CHgjiwOJ292R5ggSLuL/76NWxT
 09Mlfrx1UTI35Ld6iLmuo7XUFy+eovzitGByPLs1oiymg1XBbWGifV1D5MQi3kneUoXbDA3cUCHMI
 STlMw1H/e+S0Oqh7zpNCu4pfp+KThs2qrLgojbaXBD7ShrhuSclkGuNVp6rqdNd89vCo=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3w4x-006k7N-VU
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 06:09:59 +0000
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C8727B81DB7338D6EC55;
 Tue, 18 Feb 2020 14:09:48 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.210) with Microsoft SMTP Server (TLS) id 14.3.439.0; Tue, 18 Feb
 2020 14:09:43 +0800
To: Sahitya Tummala <stummala@codeaurora.org>, Jaegeuk Kim
 <jaegeuk@kernel.org>, <linux-f2fs-devel@lists.sourceforge.net>
References: <1581997747-31044-1-git-send-email-stummala@codeaurora.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <53aacd2c-8e6b-91f8-b105-270502d6d6d1@huawei.com>
Date: Tue, 18 Feb 2020 14:09:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1581997747-31044-1-git-send-email-stummala@codeaurora.org>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j3w4x-006k7N-VU
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix the panic in do_checkpoint()
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
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/2/18 11:49, Sahitya Tummala wrote:
> There could be a scenario where f2fs_sync_meta_pages() will not
> ensure that all F2FS_DIRTY_META pages are submitted for IO. Thus,
> resulting in the below panic in do_checkpoint() -
> 
> f2fs_bug_on(sbi, get_pages(sbi, F2FS_DIRTY_META) &&
> 				!f2fs_cp_error(sbi));
> 
> This can happen in a low-memory condition, where shrinker could
> also be doing the writepage operation (stack shown below)
> at the same time when checkpoint is running on another core.
> 
> schedule
> down_write
> f2fs_submit_page_write -> by this time, this page in page cache is tagged
> 			as PAGECACHE_TAG_WRITEBACK and PAGECACHE_TAG_DIRTY
> 			is cleared, due to which f2fs_sync_meta_pages()
> 			cannot sync this page in do_checkpoint() path.
> f2fs_do_write_meta_page
> __f2fs_write_meta_page
> f2fs_write_meta_page
> shrink_page_list
> shrink_inactive_list
> shrink_node_memcg
> shrink_node
> kswapd
> 
> Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
