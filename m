Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3007B2ACAED
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 03:16:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcJCr-0005r4-8k; Tue, 10 Nov 2020 02:16:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kcJCp-0005qp-1e
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 02:16:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2AtXYnbR1WGveefVSnzKH4nX+esY6zM21ukXewaYyvw=; b=B/0u9uXL60Hb7J6dcq8wTmr4q4
 6twJ97t4sR651IIGXmKfngsfpincot8V1iBnBdCODilrP+5Szmzz94gfqrn0GucTZ26w1x1qOEe54
 30BxGxgR3xWUx1CSTOnqZ2MPI0+szcDO9zm79MkhFur8dmEJnbJA6Bcmz6X8vjJDpqm0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2AtXYnbR1WGveefVSnzKH4nX+esY6zM21ukXewaYyvw=; b=cgTTj9XrUQu1+tFCI260VHDyNf
 CH3O2w/VupGyg96XxwoMPtVVXYjEHtWJG1DNNs/N4PYASsxT8aqHUMmltmhVBFjWzsze7Dg6ubtPr
 RnndF2Bskbd+rDoO/gj1SjbObjcqJd2+ZshpoFc79qw2cG5+A2Soq0FH/+a4eblH4N6g=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcJCX-006Gy7-0l
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 02:16:23 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CVWfz4ypBz15KWt;
 Tue, 10 Nov 2020 10:15:39 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.208) with Microsoft SMTP Server (TLS) id 14.3.487.0; Tue, 10 Nov
 2020 10:15:43 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f195a4f0-34af-1594-f443-be8ba3058707@huawei.com>
Date: Tue, 10 Nov 2020 10:15:43 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20201109170012.2129411-1-jaegeuk@kernel.org>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: mediatek.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kcJCX-006Gy7-0l
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid race condition for shinker count
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
Cc: Light Hsieh <Light.Hsieh@mediatek.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/11/10 1:00, Jaegeuk Kim wrote:
> Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in

I didn't get the problem clearly, did you mean __count_nat_entries() will
give the wrong shrink count due to race condition? should there be a lock
while reading these two variables?

> wrong do_shinker work. Basically the two counts should not happen like that.
> 
> So, I suspect this race condtion where:
> - f2fs_try_to_free_nats            __flush_nat_entry_set
>   nat_cnt=2, dirty_nat_cnt=2
>                                     __clear_nat_cache_dirty
>                                      spin_lock(nat_list_lock)
>                                      list_move()
>                                      spin_unlock(nat_list_lock)
>   spin_lock(nat_list_lock)
>   list_del()
>   spin_unlock(nat_list_lock)
>   nat_cnt=1, dirty_nat_cnt=2
>                                     nat_cnt=1, dirty_nat_cnt=1

nm_i->nat_cnt and nm_i->dirty_nat_cnt were protected by
nm_i->nat_tree_lock, I didn't see why expanding nat_list_lock range
will help... since there are still places nat_list_lock() didn't
cover these two reference counts.

Thanks,

> 
> Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/node.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 42394de6c7eb..e8ec65e40f06 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -269,11 +269,10 @@ static void __clear_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>   {
>   	spin_lock(&nm_i->nat_list_lock);
>   	list_move_tail(&ne->list, &nm_i->nat_entries);
> -	spin_unlock(&nm_i->nat_list_lock);
> -
>   	set_nat_flag(ne, IS_DIRTY, false);
>   	set->entry_cnt--;
>   	nm_i->dirty_nat_cnt--;
> +	spin_unlock(&nm_i->nat_list_lock);
>   }
>   
>   static unsigned int __gang_lookup_nat_set(struct f2fs_nm_info *nm_i,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
