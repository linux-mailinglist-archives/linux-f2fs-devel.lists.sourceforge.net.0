Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD63B1168A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Jul 2025 04:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oIrn3MAxYK/+Unpbjos14PgMC9Pl0YpvB8DrsG79qxA=; b=KnTuZ2a8e9R7y+wsODdqh5lDex
	1KVLro8xfqudAQcnIFLFWr6lu7M5LJy3oxUyMHadRdCevzX8OKW4ODoirIZJOk3zq4n03OyFiE7d0
	O4BZw5Equa5UggkLl1fQGKOFUctpN/obwnD7Atz2/VPmPHXn0wdQbazHbWgB55dWvtRo=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uf8Ir-0001RP-7N;
	Fri, 25 Jul 2025 02:36:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1uf8Iq-0001RG-3l
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:36:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJ07pKmZTvzwTxyAuJ/xcbtcmCloN3CxKBj206fsd5w=; b=TxLPIVfZ0W/CP83Pw2LpBTXlpP
 oP4qJjFz3lMZprBczu56laFGqB+ukJ58H1Yhd0Rno4+bSEoOOXpfapNFZdUhD48gM4jtNLXklnMho
 fERH9Q2+p6AhM3cech2mQgTtz8OlEkdz7h/DRXd0ZZPUH0w4cN0SrUW5wjgC0mXT97+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BJ07pKmZTvzwTxyAuJ/xcbtcmCloN3CxKBj206fsd5w=; b=C9y39a59G9u+UGQ3OCB/qb0gWX
 pKoZ2th3XJXE7uBEtR16i30/nZLYCh+qt1UnQDYr3DPKH8OHaSZdpahhz6t23sRJcf5PZfa2Rw4MQ
 MWR9h/q0SMg4nd2GSi0QBzSiOYzbapac++MgOOlxnqVH726rA2uzso4S+oD9XOVExk2U=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uf8Ip-0002uF-Cm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 25 Jul 2025 02:36:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BF261A4EA15;
 Fri, 25 Jul 2025 02:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 537F4C4CEED;
 Fri, 25 Jul 2025 02:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753411004;
 bh=PcieKZXvp0nbEeGoMVMnk++vnyS3t/GKGyNSGEnagdM=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=SeKLKl2Wfs2l0nfo6k6zaTY7lKysosEGqk3OIqfg7ANP/+Uyf0LtGLLg6LkwiijnW
 832E/xSEJWeESoJUGNa5FRyDHV/WG2JyFM8+6HQBGQ+KWRbKOZHbgt4/9rvYUEJ+Sp
 /pNoQ5jNXO/irCf5nbjaPOejIkfTV8kfPNpj2Egacnk3DYp/QCl/5KLLXwtWAoa/sX
 57Gq7RvrCUBhrbHxXL1nTrTMqwKElJtXxIgyeZRcBVdsYOB8VpyJXGKMf8UR9J2OQ3
 Bu70v7v9FWsUdXFYJ6PhAMl8yBHSZ/m/F4VqyXzyXBr4wia3XcWP7yHKMWSWHk4S0r
 AeesX06/agiiA==
Message-ID: <8a2f450e-2e10-42d2-a5a8-fa3fdc3aee27@kernel.org>
Date: Fri, 25 Jul 2025 10:36:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <524de02e-31a1-4b98-8601-edaa51d40d56@kernel.org>
 <20250725021738.1011413-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250725021738.1011413-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/25/2025 10:17 AM, wangzijie wrote: >> On 7/22/25 22:36, 
 wangzijie wrote: >>> When we need to alloc nat entry and set it dirty, we
 can directly add it to >>> dirty set list(or initialize its list_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uf8Ip-0002uF-Cm
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: directly add newly allocated
 pre-dirty nat entry to dirty set list
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org, feng.han@honor.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 7/25/2025 10:17 AM, wangzijie wrote:
>> On 7/22/25 22:36, wangzijie wrote:
>>> When we need to alloc nat entry and set it dirty, we can directly add it to
>>> dirty set list(or initialize its list_head for new_ne) instead of adding it
>>> to clean list and make a move. Introduce init_dirty flag to do it.
>>>
>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>> ---
>>>   fs/f2fs/node.c | 37 ++++++++++++++++++++++++++++++-------
>>>   1 file changed, 30 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>> index a23db6238..20bcf8559 100644
>>> --- a/fs/f2fs/node.c
>>> +++ b/fs/f2fs/node.c
>>> @@ -185,7 +185,7 @@ static void __free_nat_entry(struct nat_entry *e)
>>>   
>>>   /* must be locked by nat_tree_lock */
>>>   static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
>>> -	struct nat_entry *ne, struct f2fs_nat_entry *raw_ne, bool no_fail)
>>> +	struct nat_entry *ne, struct f2fs_nat_entry *raw_ne, bool no_fail, bool init_dirty)
>>>   {
>>>   	if (no_fail)
>>>   		f2fs_radix_tree_insert(&nm_i->nat_root, nat_get_nid(ne), ne);
>>> @@ -195,6 +195,11 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
>>>   	if (raw_ne)
>>>   		node_info_from_raw_nat(&ne->ni, raw_ne);
>>>   
>>> +	if (init_dirty) {
>>> +		nm_i->nat_cnt[TOTAL_NAT]++;
>>> +		return ne;
>>> +	}
>>> +
>>>   	spin_lock(&nm_i->nat_list_lock);
>>>   	list_add_tail(&ne->list, &nm_i->nat_entries);
>>>   	spin_unlock(&nm_i->nat_list_lock);
>>> @@ -256,7 +261,7 @@ static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *nm_i,
>>>   }
>>>   
>>>   static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>>> -						struct nat_entry *ne)
>>> +					struct nat_entry *ne, bool init_dirty)
>>>   {
>>>   	struct nat_entry_set *head;
>>>   	bool new_ne = nat_get_blkaddr(ne) == NEW_ADDR;
>>> @@ -275,6 +280,18 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>>>   
>>>   	set_nat_flag(ne, IS_PREALLOC, new_ne);
>>>   
>>> +	if (init_dirty) {
>>> +		nm_i->nat_cnt[DIRTY_NAT]++;
>>> +		set_nat_flag(ne, IS_DIRTY, true);
>>> +		spin_lock(&nm_i->nat_list_lock);
>>> +		if (new_ne)
>>> +			INIT_LIST_HEAD(&ne->list);
>>> +		else
>>> +			list_add_tail(&ne->list, &head->entry_list);
>>> +		spin_unlock(&nm_i->nat_list_lock);
>>> +		return;
>>> +    }
>>
>> Nit issue, above blanks should be replaced w/ tab.
> 
> Ah...my bad :-(
> 
>> Can we clean up like this?
>>
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index de99b42437c6..60fc2c7b8e10 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -280,30 +280,23 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>>
>>   	set_nat_flag(ne, IS_PREALLOC, new_ne);
>>
>> -	if (init_dirty) {
>> -		nm_i->nat_cnt[DIRTY_NAT]++;
>> -		set_nat_flag(ne, IS_DIRTY, true);
>> -		spin_lock(&nm_i->nat_list_lock);
>> -		if (new_ne)
>> -			INIT_LIST_HEAD(&ne->list);
>> -		else
>> -			list_add_tail(&ne->list, &head->entry_list);
>> -		spin_unlock(&nm_i->nat_list_lock);
>> -		return;
>> -    }
>> -
>>   	if (get_nat_flag(ne, IS_DIRTY))
>>   		goto refresh_list;
>>
>>   	nm_i->nat_cnt[DIRTY_NAT]++;
>> -	nm_i->nat_cnt[RECLAIMABLE_NAT]--;
>> +	if (!init_dirty)
>> +		nm_i->nat_cnt[RECLAIMABLE_NAT]--;
>>   	set_nat_flag(ne, IS_DIRTY, true);
>>   refresh_list:
>>   	spin_lock(&nm_i->nat_list_lock);
>> -	if (new_ne)
>> -		list_del_init(&ne->list);
>> -	else
>> +	if (new_ne) {
>> +		if (init_dirty)
>> +			INIT_LIST_HEAD(&ne->list);
>> +		else
>> +			list_del_init(&ne->list);
>> +	} else {
>>   		list_move_tail(&ne->list, &head->entry_list);
>> +	}
>>   	spin_unlock(&nm_i->nat_list_lock);
>>   }
>>
>> Thanks,
> 
> We need to init list_head before using list_move_tail.
> I think we can do more clean up like this, keep refresh_list part code.

Ah, that's better.

Thanks,

> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 20bcf8559..ebb624fa1 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -196,6 +196,7 @@ static struct nat_entry *__init_nat_entry(struct f2fs_nm_info *nm_i,
>   		node_info_from_raw_nat(&ne->ni, raw_ne);
>   
>   	if (init_dirty) {
> +		INIT_LIST_HEAD(&ne->list);
>   		nm_i->nat_cnt[TOTAL_NAT]++;
>   		return ne;
>   	}
> @@ -280,23 +281,12 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>   
>   	set_nat_flag(ne, IS_PREALLOC, new_ne);
>   
> -	if (init_dirty) {
> -		nm_i->nat_cnt[DIRTY_NAT]++;
> -		set_nat_flag(ne, IS_DIRTY, true);
> -		spin_lock(&nm_i->nat_list_lock);
> -		if (new_ne)
> -			INIT_LIST_HEAD(&ne->list);
> -		else
> -			list_add_tail(&ne->list, &head->entry_list);
> -		spin_unlock(&nm_i->nat_list_lock);
> -		return;
> -    }
> -
>   	if (get_nat_flag(ne, IS_DIRTY))
>   		goto refresh_list;
>   
>   	nm_i->nat_cnt[DIRTY_NAT]++;
> -	nm_i->nat_cnt[RECLAIMABLE_NAT]--;
> +	if (!init_dirty)
> +		nm_i->nat_cnt[RECLAIMABLE_NAT]--;
>   	set_nat_flag(ne, IS_DIRTY, true);
>   refresh_list:
>   	spin_lock(&nm_i->nat_list_lock);
> 
>>> +
>>>   	if (get_nat_flag(ne, IS_DIRTY))
>>>   		goto refresh_list;
>>>   
>>> @@ -441,7 +458,7 @@ static void cache_nat_entry(struct f2fs_sb_info *sbi, nid_t nid,
>>>   	f2fs_down_write(&nm_i->nat_tree_lock);
>>>   	e = __lookup_nat_cache(nm_i, nid, false);
>>>   	if (!e)
>>> -		e = __init_nat_entry(nm_i, new, ne, false);
>>> +		e = __init_nat_entry(nm_i, new, ne, false, false);
>>>   	else
>>>   		f2fs_bug_on(sbi, nat_get_ino(e) != le32_to_cpu(ne->ino) ||
>>>   				nat_get_blkaddr(e) !=
>>> @@ -458,11 +475,13 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
>>>   	struct f2fs_nm_info *nm_i = NM_I(sbi);
>>>   	struct nat_entry *e;
>>>   	struct nat_entry *new = __alloc_nat_entry(sbi, ni->nid, true);
>>> +	bool init_dirty = false;
>>>   
>>>   	f2fs_down_write(&nm_i->nat_tree_lock);
>>>   	e = __lookup_nat_cache(nm_i, ni->nid, true);
>>>   	if (!e) {
>>> -		e = __init_nat_entry(nm_i, new, NULL, true);
>>> +		init_dirty = true;
>>> +		e = __init_nat_entry(nm_i, new, NULL, true, true);
>>>   		copy_node_info(&e->ni, ni);
>>>   		f2fs_bug_on(sbi, ni->blk_addr == NEW_ADDR);
>>>   	} else if (new_blkaddr == NEW_ADDR) {
>>> @@ -498,7 +517,7 @@ static void set_node_addr(struct f2fs_sb_info *sbi, struct node_info *ni,
>>>   	nat_set_blkaddr(e, new_blkaddr);
>>>   	if (!__is_valid_data_blkaddr(new_blkaddr))
>>>   		set_nat_flag(e, IS_CHECKPOINTED, false);
>>> -	__set_nat_cache_dirty(nm_i, e);
>>> +	__set_nat_cache_dirty(nm_i, e, init_dirty);
>>>   
>>>   	/* update fsync_mark if its inode nat entry is still alive */
>>>   	if (ni->nid != ni->ino)
>>> @@ -2924,6 +2943,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>>>   	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
>>>   	struct f2fs_journal *journal = curseg->journal;
>>>   	int i;
>>> +	bool init_dirty;
>>>   
>>>   	down_write(&curseg->journal_rwsem);
>>>   	for (i = 0; i < nats_in_cursum(journal); i++) {
>>> @@ -2934,12 +2954,15 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>>>   		if (f2fs_check_nid_range(sbi, nid))
>>>   			continue;
>>>   
>>> +		init_dirty = false;
>>> +
>>>   		raw_ne = nat_in_journal(journal, i);
>>>   
>>>   		ne = __lookup_nat_cache(nm_i, nid, true);
>>>   		if (!ne) {
>>> +			init_dirty = true;
>>>   			ne = __alloc_nat_entry(sbi, nid, true);
>>> -			__init_nat_entry(nm_i, ne, &raw_ne, true);
>>> +			__init_nat_entry(nm_i, ne, &raw_ne, true, true);
>>>   		}
>>>   
>>>   		/*
>>> @@ -2954,7 +2977,7 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>>>   			spin_unlock(&nm_i->nid_list_lock);
>>>   		}
>>>   
>>> -		__set_nat_cache_dirty(nm_i, ne);
>>> +		__set_nat_cache_dirty(nm_i, ne, init_dirty);
>>>   	}
>>>   	update_nats_in_cursum(journal, -i);
>>>   	up_write(&curseg->journal_rwsem);
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
