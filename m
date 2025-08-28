Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 519C9B39227
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 05:20:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5fCJNzw2sUmwXF8EYGu8LPsovmPn7J/xgJ1tb4yXZM=; b=URK20vTgdoUNY+OuATmqxA/CJ5
	6Utyf8oelDHDMNWKEcWA0wwR7s8BODC0i8Mgt1bxS5dD17e4iMUlF+iCTFxm8baP9NACWyTnroK1K
	7LFTlxm/xOJcheL8iBVsLYsWmwG6ip9NquI0fTRWn7cxJjJcQWP+TUB4Ap0gDa26FeEQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urTBm-0005BJ-17;
	Thu, 28 Aug 2025 03:20:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1urTBk-0005BA-7K
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 03:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TXlVne9EX2fxOhvIeU5HHLsw3nt2KSHnglWOQEf3WM0=; b=TVTNqjEshFkTU1+MuxyMKYTaDT
 wXmDoVPljjdjVObEt4pC4kknJaiMYekX3V9FUs1nXqyagFgt7+gLLlzjGxRgWVUs0aESJOPU8NYbj
 1Re1oPW4tPwkY7sJjBklHcLMwgS3SJSAcI0b/ug4LGqWauSOMHYz0odiLrl+cficC8j4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TXlVne9EX2fxOhvIeU5HHLsw3nt2KSHnglWOQEf3WM0=; b=TlOwTxetd4EYpkyASe6B297b7z
 bKBvc+HTro4NUcxHQGMlIQ3thSZwF4mFjf8vxwNFYOeBVbWHsCCfKDGW9VFErGJlmBY63xMgvKZYo
 uBxCZ+nNNnMi825IAkXC1PFv7ARaavq11I0KIJkblSJzz4QHf4kTUAPd+PgZnGp7h0fU=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urTBj-00053i-FN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 03:20:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C21BD601D3;
 Thu, 28 Aug 2025 03:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45337C4CEEB;
 Thu, 28 Aug 2025 03:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1756351224;
 bh=mX7YxmzzHbIU/71WKY+mN61GOLyuIiGee9drqzenYB8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=t0kogJ3Etq2Srqsz5t5L3W+W/c9kzanq5359cn9GkB+GGvfd5QylXjSfN/MH3t2E/
 YMAhVIJf0nM6uA8oTSWwLyHJEKHbKxUhB3qJ2+bK6rQZLoMdAUdyX44sJmi79jl00w
 25ceSxQHAkgF9BKxzBDMhZrO2HDMEOl79UG5itzBrj4n4+WZxe+gWirsFuV7JNhxA4
 afjMFSrFEgUQHEkkUJQR+kzsgCb5y5uyxvtPpy8xILhDShrfTZXP4Ake9Y2pdvemmb
 1Ha1p9YggpBErbxr7en2TiUBykVSYPoWMcIJL5NsXx+Zv4jigcZoGXVMcWDM5h2ROB
 4Gn8rKWcLjLVA==
Message-ID: <4c4c5095-d292-406a-84fd-23e178f1295e@kernel.org>
Date: Thu, 28 Aug 2025 11:20:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: wangzijie <wangzijie1@honor.com>, linux-f2fs-devel@lists.sourceforge.net
References: <894561d6-c0eb-4f58-ad3e-96797135e89b@kernel.org>
 <20250826014401.2020583-1-wangzijie1@honor.com>
Content-Language: en-US
In-Reply-To: <20250826014401.2020583-1-wangzijie1@honor.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 8/26/25 09:44, wangzijie wrote: >> On 8/13/25 12:04,
 wangzijie
 wrote: >>> Sometimes I suffered the nat_tree_lock contention between
 f2fs_write_checkpoint
 >>> and f2fs_get_node_info. Commit a9419b6( [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urTBj-00053i-FN
Subject: Re: [f2fs-dev] [PATCH] f2fs: reduce nat_tree_lock hold time when
 flush nat entries
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 8/26/25 09:44, wangzijie wrote:
>> On 8/13/25 12:04, wangzijie wrote:
>>> Sometimes I suffered the nat_tree_lock contention between f2fs_write_checkpoint
>>> and f2fs_get_node_info. Commit a9419b6("f2fs: do not bother checkpoint by
>>> f2fs_get_node_info") also mentioned that situation.
>>>
>>> My idea is, when flush nat entries, we can use some structures to record nat
>>> pages we may read, and readahead them before hold nat_tree_lock. Before
>>> impletement code, I did some survey and found a submittion in community.
>>>
>>> Subject: f2fs: use bucket sort to avoid tree lookup and list sort when nat flushing
>>> Link: https://lore.kernel.org/linux-f2fs-devel/20170520122435.17574-2-houpengyang@huawei.com/
>>> This patch aims to improve nat entry set sort by using bucket.
>>> I steal that structure and readahead nat pages contain nat entry set which cannot be moved
>>> to journal according to dirty nat entry set bucket.
>>>
>>> By doing this, I think there are two benefits to reducing nat_tree_lock hold time when
>>> when flush nat entries.
>>
>> Zijie,
>>
>> Can you please figure out some numbers for this patch? something like
>> checkpoint latency or average or extreme time to grab nat_tree_lock...?
>>
>>> 1. avoid nat set tree lookup and sort
>>> 2. readahead nat pages before holding nat_tree_lock
>>
>> It may cause performance regression if it races w/ drop_caches?
>>
>> Thanks,
> 
> Hi, Chao
> Do you mean that it will race with f2fs_try_to_free_nats()?

No, I meant get_current_nat_folio() readahead may race with memory reclaim? e.g.
all uptodate nat pages are reclaimed before late updates? Seems a corner case.

Thanks,

> In this patch, nat_tree_lock is not held when readahead nat pages, but
> in fact we need it. Am I right?
> 
>>>
>>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>>> ---
>>>  fs/f2fs/f2fs.h |  1 +
>>>  fs/f2fs/node.c | 70 ++++++++++++++++++++++++--------------------------
>>>  fs/f2fs/node.h |  2 +-
>>>  3 files changed, 35 insertions(+), 38 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index 46be75605..b27cc059f 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -975,6 +975,7 @@ struct f2fs_nm_info {
>>>  	struct radix_tree_root nat_set_root;/* root of the nat set cache */
>>>  	struct f2fs_rwsem nat_tree_lock;	/* protect nat entry tree */
>>>  	struct list_head nat_entries;	/* cached nat entry list (clean) */
>>> +	struct list_head nat_dirty_set[NAT_ENTRY_PER_BLOCK + 1];	/* store dirty nat set */
>>>  	spinlock_t nat_list_lock;	/* protect clean nat entry list */
>>>  	unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
>>>  	unsigned int nat_blocks;	/* # of nat blocks */
>>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>>> index 27743b93e..87c975ee8 100644
>>> --- a/fs/f2fs/node.c
>>> +++ b/fs/f2fs/node.c
>>> @@ -244,6 +244,12 @@ static void __del_from_nat_cache(struct f2fs_nm_info *nm_i, struct nat_entry *e)
>>>  	__free_nat_entry(e);
>>>  }
>>>  
>>> +static void __relocate_nat_entry_set(struct f2fs_nm_info *nm_i,
>>> +							struct nat_entry_set *set)
>>> +{
>>> +	list_move_tail(&set->set_list, &nm_i->nat_dirty_set[set->entry_cnt]);
>>> +}
>>> +
>>>  static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *nm_i,
>>>  							struct nat_entry *ne)
>>>  {
>>> @@ -260,6 +266,7 @@ static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *nm_i,
>>>  		head->set = set;
>>>  		head->entry_cnt = 0;
>>>  		f2fs_radix_tree_insert(&nm_i->nat_set_root, set, head);
>>> +		__relocate_nat_entry_set(nm_i, head);
>>>  	}
>>>  	return head;
>>>  }
>>> @@ -279,8 +286,10 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>>>  	 * 2. update old block address to new one;
>>>  	 */
>>>  	if (!new_ne && (get_nat_flag(ne, IS_PREALLOC) ||
>>> -				!get_nat_flag(ne, IS_DIRTY)))
>>> +				!get_nat_flag(ne, IS_DIRTY))) {
>>>  		head->entry_cnt++;
>>> +		__relocate_nat_entry_set(nm_i, head);
>>> +	}
>>>  
>>>  	set_nat_flag(ne, IS_PREALLOC, new_ne);
>>>  
>>> @@ -309,6 +318,7 @@ static void __clear_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>>>  
>>>  	set_nat_flag(ne, IS_DIRTY, false);
>>>  	set->entry_cnt--;
>>> +	__relocate_nat_entry_set(nm_i, set);
>>>  	nm_i->nat_cnt[DIRTY_NAT]--;
>>>  	nm_i->nat_cnt[RECLAIMABLE_NAT]++;
>>>  }
>>> @@ -2976,24 +2986,6 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>>>  	up_write(&curseg->journal_rwsem);
>>>  }
>>>  
>>> -static void __adjust_nat_entry_set(struct nat_entry_set *nes,
>>> -						struct list_head *head, int max)
>>> -{
>>> -	struct nat_entry_set *cur;
>>> -
>>> -	if (nes->entry_cnt >= max)
>>> -		goto add_out;
>>> -
>>> -	list_for_each_entry(cur, head, set_list) {
>>> -		if (cur->entry_cnt >= nes->entry_cnt) {
>>> -			list_add(&nes->set_list, cur->set_list.prev);
>>> -			return;
>>> -		}
>>> -	}
>>> -add_out:
>>> -	list_add_tail(&nes->set_list, head);
>>> -}
>>> -
>>>  static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
>>>  		const struct f2fs_nat_block *nat_blk)
>>>  {
>>> @@ -3095,6 +3087,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
>>>  
>>>  	/* Allow dirty nats by node block allocation in write_begin */
>>>  	if (!set->entry_cnt) {
>>> +		list_del(&set->set_list);
>>>  		radix_tree_delete(&NM_I(sbi)->nat_set_root, set->set);
>>>  		kmem_cache_free(nat_entry_set_slab, set);
>>>  	}
>>> @@ -3109,11 +3102,8 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>>>  	struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
>>>  	struct f2fs_journal *journal = curseg->journal;
>>> -	struct nat_entry_set *setvec[NAT_VEC_SIZE];
>>>  	struct nat_entry_set *set, *tmp;
>>> -	unsigned int found;
>>> -	nid_t set_idx = 0;
>>> -	LIST_HEAD(sets);
>>> +	int i;
>>>  	int err = 0;
>>>  
>>>  	/*
>>> @@ -3129,6 +3119,16 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>  	if (!nm_i->nat_cnt[DIRTY_NAT])
>>>  		return 0;
>>>  
>>> +	/* readahead sets which cannot be moved to journal */
>>> +	if (!__has_cursum_space(journal, nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL)) {
>>> +		for (i = MAX_NAT_JENTRIES(journal); i <= NAT_ENTRY_PER_BLOCK; i++) {
>>> +			list_for_each_entry_safe(set, tmp, &nm_i->nat_dirty_set[i], set_list) {
>>> +				f2fs_ra_meta_pages(sbi, set->set, 1,
>>> +								META_NAT, true);
>>> +			}
>>> +		}
>>> +	}
>>> +
>>>  	f2fs_down_write(&nm_i->nat_tree_lock);
>>>  
>>>  	/*
>>> @@ -3141,21 +3141,13 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>>  			nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
>>>  		remove_nats_in_journal(sbi);
>>>  
>>> -	while ((found = __gang_lookup_nat_set(nm_i,
>>> -					set_idx, NAT_VEC_SIZE, setvec))) {
>>> -		unsigned idx;
>>> -
>>> -		set_idx = setvec[found - 1]->set + 1;
>>> -		for (idx = 0; idx < found; idx++)
>>> -			__adjust_nat_entry_set(setvec[idx], &sets,
>>> -						MAX_NAT_JENTRIES(journal));
>>> -	}
>>> -
>>>  	/* flush dirty nats in nat entry set */
>>> -	list_for_each_entry_safe(set, tmp, &sets, set_list) {
>>> -		err = __flush_nat_entry_set(sbi, set, cpc);
>>> -		if (err)
>>> -			break;
>>> +	for (i = 0; i <= NAT_ENTRY_PER_BLOCK; i++) {
>>> +		list_for_each_entry_safe(set, tmp, &nm_i->nat_dirty_set[i], set_list) {
>>> +			err = __flush_nat_entry_set(sbi, set, cpc);
>>> +			if (err)
>>> +				break;
>>> +		}
>>>  	}
>>>  
>>>  	f2fs_up_write(&nm_i->nat_tree_lock);
>>> @@ -3249,6 +3241,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>>>  	struct f2fs_nm_info *nm_i = NM_I(sbi);
>>>  	unsigned char *version_bitmap;
>>>  	unsigned int nat_segs;
>>> +	int i;
>>>  	int err;
>>>  
>>>  	nm_i->nat_blkaddr = le32_to_cpu(sb_raw->nat_blkaddr);
>>> @@ -3275,6 +3268,9 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>>>  	INIT_LIST_HEAD(&nm_i->nat_entries);
>>>  	spin_lock_init(&nm_i->nat_list_lock);
>>>  
>>> +	for (i = 0; i <= NAT_ENTRY_PER_BLOCK; i++)
>>> +		INIT_LIST_HEAD(&nm_i->nat_dirty_set[i]);
>>> +
>>>  	mutex_init(&nm_i->build_lock);
>>>  	spin_lock_init(&nm_i->nid_list_lock);
>>>  	init_f2fs_rwsem(&nm_i->nat_tree_lock);
>>> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
>>> index 030390543..d805d4ce7 100644
>>> --- a/fs/f2fs/node.h
>>> +++ b/fs/f2fs/node.h
>>> @@ -158,7 +158,7 @@ enum mem_type {
>>>  };
>>>  
>>>  struct nat_entry_set {
>>> -	struct list_head set_list;	/* link with other nat sets */
>>> +	struct list_head set_list;	/* link with nat sets which have same entry_cnt */
>>>  	struct list_head entry_list;	/* link with dirty nat entries */
>>>  	nid_t set;			/* set number*/
>>>  	unsigned int entry_cnt;		/* the # of nat entries in set */
> 



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
