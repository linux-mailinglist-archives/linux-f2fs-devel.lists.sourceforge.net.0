Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6DAE2CCFEA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 07:57:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkiYY-0004vI-FC; Thu, 03 Dec 2020 06:57:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkiXK-0004sD-Ch
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y9+Sx+Gwsuvxgygzo7chEmP+3h07+K9vwR88EPhqRq4=; b=nKbgERGglSMA6Gho7pa2NYO3ee
 LFimNx5X8QQj5vxH466kCWxdJuZqVpXVIn7DFfrV7+/UKovKbqNpGsE8/pKJq5ducUuC+Aqz/VhSl
 w5DjQWGBIR0mene9ft/5i3hMgMsry3yxVZ3Ihf9yOh91KD+iIBJ64tF53ZOgkhobq0W4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y9+Sx+Gwsuvxgygzo7chEmP+3h07+K9vwR88EPhqRq4=; b=YlPa4ZrUWyEpo9qEVbiQjDuzEV
 u0vz6Mu72BRLf2h77wv/QZd/3vVo4YM9EWVbLxmDtvHFjT391k3FUgPnP0F7fof6rvU6VsCKH7mEp
 eyXNHGIQ0qv3ySVPCoDH23Pvif3xU6/6w/uDvoGm9c13qlCqDQlhuEtM9eZfkm9+Xd5w=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkiXG-00CokX-L0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:56:18 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CmmnF0crGz15LKB;
 Thu,  3 Dec 2020 14:55:29 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.214) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 3 Dec 2020
 14:55:50 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20201109170012.2129411-1-jaegeuk@kernel.org>
 <20201112053414.GB3826485@google.com> <20201112054051.GA4092972@google.com>
 <X8iAh7quYw77O6XC@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <df364dab-6640-654b-c36e-3f84f4bcbc2b@huawei.com>
Date: Thu, 3 Dec 2020 14:55:50 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X8iAh7quYw77O6XC@google.com>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kkiXG-00CokX-L0
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: avoid race condition for shinker
 count
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

On 2020/12/3 14:07, Jaegeuk Kim wrote:
> On 11/11, Jaegeuk Kim wrote:
>> Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
>> wrong do_shinker work. Let's avoid to get stale data by using nat_tree_lock.
>>
>> Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
>> ---
>> v3:
>>   - fix to use NM_I(sbi)
>>
>>   fs/f2fs/shrinker.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
>> index d66de5999a26..555712ba06d8 100644
>> --- a/fs/f2fs/shrinker.c
>> +++ b/fs/f2fs/shrinker.c
>> @@ -18,7 +18,11 @@ static unsigned int shrinker_run_no;
>>   
>>   static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
>>   {
>> -	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
>> +	long count;
>> +
>> +	down_read(&NM_I(sbi)->nat_tree_lock);
>> +	count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
>> +	up_read(&NM_I(sbi)->nat_tree_lock);
> 
> I just fosund this can give kernel hang due to the following backtrace.
> f2fs_shrink_count
> shrink_slab
> shrink_node
> do_try_to_free_pages
> try_to_free_pages
> __alloc_pages_nodemask
> alloc_pages_current
> allocate_slab
> __slab_alloc
> __slab_alloc
> kmem_cache_alloc
> add_free_nid
> f2fs_flush_nat_entries
> f2fs_write_checkpoint

Oh, I missed that case.

> 
> Let me just check like this.
> 
>>From 971163330224449d90aac90957ea38f77d494f0f Mon Sep 17 00:00:00 2001
> From: Jaegeuk Kim <jaegeuk@kernel.org>
> Date: Fri, 6 Nov 2020 13:22:05 -0800
> Subject: [PATCH] f2fs: avoid race condition for shrinker count
> 
> Light reported sometimes shinker gets nat_cnt < dirty_nat_cnt resulting in
> wrong do_shinker work. Let's avoid to return insane overflowed value.
> 
> Reported-by: Light Hsieh <Light.Hsieh@mediatek.com>
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/shrinker.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
> index d66de5999a26..75b5b4aaed99 100644
> --- a/fs/f2fs/shrinker.c
> +++ b/fs/f2fs/shrinker.c
> @@ -18,9 +18,9 @@ static unsigned int shrinker_run_no;
>   
>   static unsigned long __count_nat_entries(struct f2fs_sb_info *sbi)
>   {
> -	long count = NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;
> -
> -	return count > 0 ? count : 0;
> +	if (NM_I(sbi)->nat_cnt > NM_I(sbi)->dirty_nat_cnt)
> +		return NM_I(sbi)->nat_cnt - NM_I(sbi)->dirty_nat_cnt;

Hmm.. in the case that we are not in checkpoint progress, nat_cnt and dirty_nat_cnt
is mutable, how can we make sure the calculation is non-negative after the check
condition? :(

Thanks

> +	return 0;
>   }
>   
>   static unsigned long __count_free_nids(struct f2fs_sb_info *sbi)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
