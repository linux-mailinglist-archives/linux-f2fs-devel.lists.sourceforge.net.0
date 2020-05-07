Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DCF71C8044
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 May 2020 05:03:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWWp4-0004Gb-Np; Thu, 07 May 2020 03:03:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jWWp3-0004GU-CJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 03:03:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OXBS/eJwVEDf689WQ3iDMkGTOPqUnoxN1bFe7sb0k18=; b=OfpvWa2L5bOfWlUjcwTq205FX9
 iYW+lnbtkyjqqQnSbvUIxm4BYrQW1PT3Dq1k5K4jkkFkpZ2QwQkesYvk/l6sNaLYTw5yKuh3TNXkx
 UIwO2UpWagJZfNy5fqVGzi5TqwtZQOouhe7y+IvwAgsegWDIY3VzMNyji12AalDkFVb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OXBS/eJwVEDf689WQ3iDMkGTOPqUnoxN1bFe7sb0k18=; b=NfMXBssb48UZBcaLaVtBIgVMZr
 rbCJGUuTPp233cn4E3kSekPGu2U/09GhC7kSHFgRgTTeaeRM1ssgcRj+LZUFIht7UqS71hJYX1uYZ
 5JF81HRJCRZJZh57yOvleplF4EF8XZfl8DxNsIUPl3IxOSf2aGGMksDoiw6sWUZT2BaE=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jWWoz-00Df4p-80
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 03:03:41 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 0FB04998E81665E6A654;
 Thu,  7 May 2020 11:03:30 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.201) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 7 May 2020
 11:03:28 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20200506104542.123575-1-yuchao0@huawei.com>
 <20200506150521.GE107238@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <f577a7a8-298f-cdda-7627-1273f83c261c@huawei.com>
Date: Thu, 7 May 2020 11:03:25 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200506150521.GE107238@google.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWWoz-00Df4p-80
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: shrink spinlock coverage
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/5/6 23:05, Jaegeuk Kim wrote:
> On 05/06, Chao Yu wrote:
>> In f2fs_try_to_free_nids(), .nid_list_lock spinlock critical region will
>> increase as expected shrink number increase, to avoid spining other CPUs
>> for long time, it's better to implement like extent cache and nats
>> shrinker.
>>
>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>> ---
>> v2:
>> - fix unlock wrong spinlock.
>>  fs/f2fs/node.c | 15 +++++++++++----
>>  1 file changed, 11 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 4da0d8713df5..ad0b14f4dab8 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2488,7 +2488,6 @@ void f2fs_alloc_nid_failed(struct f2fs_sb_info *sbi, nid_t nid)
>>  int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
>>  {
>>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>> -	struct free_nid *i, *next;
>>  	int nr = nr_shrink;
>>  
>>  	if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
>> @@ -2498,14 +2497,22 @@ int f2fs_try_to_free_nids(struct f2fs_sb_info *sbi, int nr_shrink)
>>  		return 0;
>>  
>>  	spin_lock(&nm_i->nid_list_lock);
>> -	list_for_each_entry_safe(i, next, &nm_i->free_nid_list, list) {
>> -		if (nr_shrink <= 0 ||
>> -				nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
>> +	while (nr_shrink) {
>> +		struct free_nid *i;
>> +
>> +		if (nm_i->nid_cnt[FREE_NID] <= MAX_FREE_NIDS)
>>  			break;
>>  
>> +		i = list_first_entry(&nm_i->free_nid_list,
>> +					struct free_nid, list);
>> +		list_del(&i->list);
>> +		spin_unlock(&nm_i->nid_list_lock);
>> +
>>  		__remove_free_nid(sbi, i, FREE_NID);
> 
> __remove_free_nid() will do list_del again. btw, how about just splitting out

Oh, my bad.

How about moving __remove_free_nid into .nid_list_lock coverage?

> given nr_shrink into multiple trials?

Like this?

	while (shrink) {
		batch = DEFAULT_BATCH_NUMBER; // 16
		spinlock();
		list_for_each_entry_safe() {
			if (!shrink || !batch)
				break;
			remove_item_from_list;
			shrink--;
			batch--;
		}
		spin_unlock();
	}

Thanks,

> 
>>  		kmem_cache_free(free_nid_slab, i);
>>  		nr_shrink--;
>> +
>> +		spin_lock(&nm_i->nid_list_lock);
>>  	}
>>  	spin_unlock(&nm_i->nid_list_lock);
>>  	mutex_unlock(&nm_i->build_lock);
>> -- 
>> 2.18.0.rc1
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
