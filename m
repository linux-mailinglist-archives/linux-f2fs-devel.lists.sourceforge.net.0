Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D616B2B718
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Aug 2025 04:37:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5b8VJ1VSEeb6RkBfT9BR1qAtuOzThMo+rnR3hho72XU=; b=Fjx/U8Ug3Kgdnd6HVoffntomfV
	n0hEoWnynS3LakFutyP3HQSmIKiLJlrb7mGFaMp3mjVOV9ZOCtGwHgkdEnOGr/iKSrpBOHwgdSUek
	xWzGKKQM6H7NMu6VDelwKFyvFW10ZAxcHZSvJ54cVcpEslPZHOMB0qAXOwrE6gSZikTY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoCDb-0006ax-DI;
	Tue, 19 Aug 2025 02:36:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uoCDZ-0006aq-U0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 02:36:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CHiWxWt64yt91tf5ZEnRKb48ka9b5Bhg7bWKDCuuTpM=; b=HGNdgA2yyA8mNSe+qctdMfMuFA
 1CxFe2tWb/Kikx0RcQi/tXclrRZ/ZntfPGqBDGS0Qs8FovOkXE7RFatlioOt1JyKeGlHfrUIyYhN6
 J6uE2ksbz3yxTcobbqnvexzJlQ7QEhyhKAjbh5xduE5KVRSDthXplOdZTkC6+4m5ojXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CHiWxWt64yt91tf5ZEnRKb48ka9b5Bhg7bWKDCuuTpM=; b=EGqdA1GhbO4EU/AEPOx5zetPev
 T3QCSGC7P4pM8SuugB7Vm3HMgO7Qee8uVAVvDd8qVVvq2fOLi15EpbEDYXWtZT0Qw6hez+MbNaW+Y
 5GMvwo0VC4h8GBv/902cvp42m1gXXx48CkXgTztcXIywQyFeJ8fZMs+e2b1hMy6VmATg=;
Received: from mta20.hihonor.com ([81.70.206.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uoCDY-0008AA-Ug for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Aug 2025 02:36:57 +0000
Received: from w002.hihonor.com (unknown [10.68.28.120])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4c5Yck2LbjzYlLKn;
 Tue, 19 Aug 2025 10:36:38 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 19 Aug
 2025 10:36:49 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 19 Aug
 2025 10:36:48 +0800
From: wangzijie <wangzijie1@honor.com>
To: <niuzhiguo84@gmail.com>
Date: Tue, 19 Aug 2025 10:36:48 +0800
Message-ID: <20250819023648.1031767-1-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAHJ8P3L20KyE2npVnpujp0N+pwaHKp02wPFprAaLVFjuSKpPdA@mail.gmail.com>
References: <CAHJ8P3L20KyE2npVnpujp0N+pwaHKp02wPFprAaLVFjuSKpPdA@mail.gmail.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w003.hihonor.com (10.68.17.88) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: >> >> Sometimes I suffered the nat_tree_lock contention
 between
 f2fs_write_checkpoint >> and f2fs_get_node_info. Commit a9419b6("f2fs: do
 not bother checkpoint by >> f2fs_get_node_info") also mentione [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uoCDY-0008AA-Ug
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org,
 wangzijie1@honor.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>>
>> Sometimes I suffered the nat_tree_lock contention between f2fs_write_checkpoint
>> and f2fs_get_node_info. Commit a9419b6("f2fs: do not bother checkpoint by
>> f2fs_get_node_info") also mentioned that situation.
>>
>> My idea is, when flush nat entries, we can use some structures to record nat
>> pages we may read, and readahead them before hold nat_tree_lock. Before
>> impletement code, I did some survey and found a submittion in community.
>>
>> Subject: f2fs: use bucket sort to avoid tree lookup and list sort when nat flushing
>> Link: https://lore.kernel.org/linux-f2fs-devel/20170520122435.17574-2-houpengyang@huawei.com/
>> This patch aims to improve nat entry set sort by using bucket.
>> I steal that structure and readahead nat pages contain nat entry set which cannot be moved
>> to journal according to dirty nat entry set bucket.
>>
>> By doing this, I think there are two benefits to reducing nat_tree_lock hold time when
>> when flush nat entries.
>> 1. avoid nat set tree lookup and sort
>> 2. readahead nat pages before holding nat_tree_lock
>>
>> Signed-off-by: wangzijie <wangzijie1@honor.com>
>> ---
>>  fs/f2fs/f2fs.h |  1 +
>>  fs/f2fs/node.c | 70 ++++++++++++++++++++++++--------------------------
>>  fs/f2fs/node.h |  2 +-
>>  3 files changed, 35 insertions(+), 38 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 46be75605..b27cc059f 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -975,6 +975,7 @@ struct f2fs_nm_info {
>>         struct radix_tree_root nat_set_root;/* root of the nat set cache */
>>         struct f2fs_rwsem nat_tree_lock;        /* protect nat entry tree */
>>         struct list_head nat_entries;   /* cached nat entry list (clean) */
>> +       struct list_head nat_dirty_set[NAT_ENTRY_PER_BLOCK + 1];        /* store dirty nat set */
>>         spinlock_t nat_list_lock;       /* protect clean nat entry list */
>>         unsigned int nat_cnt[MAX_NAT_STATE]; /* the # of cached nat entries */
>>         unsigned int nat_blocks;        /* # of nat blocks */
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 27743b93e..87c975ee8 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -244,6 +244,12 @@ static void __del_from_nat_cache(struct f2fs_nm_info *nm_i, struct nat_entry *e)
>>         __free_nat_entry(e);
>>  }
>>
>> +static void __relocate_nat_entry_set(struct f2fs_nm_info *nm_i,
>> +                                                       struct nat_entry_set *set)
>> +{
>> +       list_move_tail(&set->set_list, &nm_i->nat_dirty_set[set->entry_cnt]);
>> +}
>Hi zijie,
>Is there any lock protecting this list related operations in the
>current process?

Hi, Zhiguo
I think the lock protection needed is as same as __set_nat_cache_dirty().

>> +
>>  static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *nm_i,
>>                                                         struct nat_entry *ne)
>>  {
>> @@ -260,6 +266,7 @@ static struct nat_entry_set *__grab_nat_entry_set(struct f2fs_nm_info *nm_i,
>>                 head->set = set;
>>                 head->entry_cnt = 0;
>>                 f2fs_radix_tree_insert(&nm_i->nat_set_root, set, head);
>> +               __relocate_nat_entry_set(nm_i, head);
>>         }
>>         return head;
>>  }
>> @@ -279,8 +286,10 @@ static void __set_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>>          * 2. update old block address to new one;
>>          */
>>         if (!new_ne && (get_nat_flag(ne, IS_PREALLOC) ||
>> -                               !get_nat_flag(ne, IS_DIRTY)))
>> +                               !get_nat_flag(ne, IS_DIRTY))) {
>>                 head->entry_cnt++;
>> +               __relocate_nat_entry_set(nm_i, head);
>> +       }
>>
>>         set_nat_flag(ne, IS_PREALLOC, new_ne);
>>
>> @@ -309,6 +318,7 @@ static void __clear_nat_cache_dirty(struct f2fs_nm_info *nm_i,
>>
>>         set_nat_flag(ne, IS_DIRTY, false);
>>         set->entry_cnt--;
>> +       __relocate_nat_entry_set(nm_i, set);
>>         nm_i->nat_cnt[DIRTY_NAT]--;
>>         nm_i->nat_cnt[RECLAIMABLE_NAT]++;
>>  }
>> @@ -2976,24 +2986,6 @@ static void remove_nats_in_journal(struct f2fs_sb_info *sbi)
>>         up_write(&curseg->journal_rwsem);
>>  }
>>
>> -static void __adjust_nat_entry_set(struct nat_entry_set *nes,
>> -                                               struct list_head *head, int max)
>> -{
>> -       struct nat_entry_set *cur;
>> -
>> -       if (nes->entry_cnt >= max)
>> -               goto add_out;
>> -
>> -       list_for_each_entry(cur, head, set_list) {
>> -               if (cur->entry_cnt >= nes->entry_cnt) {
>> -                       list_add(&nes->set_list, cur->set_list.prev);
>> -                       return;
>> -               }
>> -       }
>> -add_out:
>> -       list_add_tail(&nes->set_list, head);
>> -}
>> -
>>  static void __update_nat_bits(struct f2fs_sb_info *sbi, nid_t start_nid,
>>                 const struct f2fs_nat_block *nat_blk)
>>  {
>> @@ -3095,6 +3087,7 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
>>
>>         /* Allow dirty nats by node block allocation in write_begin */
>>         if (!set->entry_cnt) {
>> +               list_del(&set->set_list);
>>                 radix_tree_delete(&NM_I(sbi)->nat_set_root, set->set);
>>                 kmem_cache_free(nat_entry_set_slab, set);
>>         }
>> @@ -3109,11 +3102,8 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>         struct f2fs_nm_info *nm_i = NM_I(sbi);
>>         struct curseg_info *curseg = CURSEG_I(sbi, CURSEG_HOT_DATA);
>>         struct f2fs_journal *journal = curseg->journal;
>> -       struct nat_entry_set *setvec[NAT_VEC_SIZE];
>>         struct nat_entry_set *set, *tmp;
>> -       unsigned int found;
>> -       nid_t set_idx = 0;
>> -       LIST_HEAD(sets);
>> +       int i;
>>         int err = 0;
>>
>>         /*
>> @@ -3129,6 +3119,16 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>         if (!nm_i->nat_cnt[DIRTY_NAT])
>>                 return 0;
>>
>> +       /* readahead sets which cannot be moved to journal */
>> +       if (!__has_cursum_space(journal, nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL)) {
>> +               for (i = MAX_NAT_JENTRIES(journal); i <= NAT_ENTRY_PER_BLOCK; i++) {
>i am a little confused, why is there "i <= NAT_ENTRY_PER_BLOCK;"?
>do we need to calculate according to the current nat block/entry number?
>thanks!

Yes, you are right, we can calculate according to DIRTY_NAT count to end this loop early.


>> +                       list_for_each_entry_safe(set, tmp, &nm_i->nat_dirty_set[i], set_list) {
>> +                               f2fs_ra_meta_pages(sbi, set->set, 1,
>> +                                                               META_NAT, true);
>> +                       }
>> +               }
>> +       }
>> +
>>         f2fs_down_write(&nm_i->nat_tree_lock);
>>
>>         /*
>> @@ -3141,21 +3141,13 @@ int f2fs_flush_nat_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>                         nm_i->nat_cnt[DIRTY_NAT], NAT_JOURNAL))
>>                 remove_nats_in_journal(sbi);
>>
>> -       while ((found = __gang_lookup_nat_set(nm_i,
>> -                                       set_idx, NAT_VEC_SIZE, setvec))) {
>> -               unsigned idx;
>> -
>> -               set_idx = setvec[found - 1]->set + 1;
>> -               for (idx = 0; idx < found; idx++)
>> -                       __adjust_nat_entry_set(setvec[idx], &sets,
>> -                                               MAX_NAT_JENTRIES(journal));
>> -       }
>> -
>>         /* flush dirty nats in nat entry set */
>> -       list_for_each_entry_safe(set, tmp, &sets, set_list) {
>> -               err = __flush_nat_entry_set(sbi, set, cpc);
>> -               if (err)
>> -                       break;
>> +       for (i = 0; i <= NAT_ENTRY_PER_BLOCK; i++) {
>> +               list_for_each_entry_safe(set, tmp, &nm_i->nat_dirty_set[i], set_list) {
>> +                       err = __flush_nat_entry_set(sbi, set, cpc);
>> +                       if (err)
>> +                               break;
>> +               }
>>         }
>>
>>         f2fs_up_write(&nm_i->nat_tree_lock);
>> @@ -3249,6 +3241,7 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>>         struct f2fs_nm_info *nm_i = NM_I(sbi);
>>         unsigned char *version_bitmap;
>>         unsigned int nat_segs;
>> +       int i;
>>         int err;
>>
>>         nm_i->nat_blkaddr = le32_to_cpu(sb_raw->nat_blkaddr);
>> @@ -3275,6 +3268,9 @@ static int init_node_manager(struct f2fs_sb_info *sbi)
>>         INIT_LIST_HEAD(&nm_i->nat_entries);
>>         spin_lock_init(&nm_i->nat_list_lock);
>>
>> +       for (i = 0; i <= NAT_ENTRY_PER_BLOCK; i++)
>> +               INIT_LIST_HEAD(&nm_i->nat_dirty_set[i]);
>> +
>>         mutex_init(&nm_i->build_lock);
>>         spin_lock_init(&nm_i->nid_list_lock);
>>         init_f2fs_rwsem(&nm_i->nat_tree_lock);
>> diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
>> index 030390543..d805d4ce7 100644
>> --- a/fs/f2fs/node.h
>> +++ b/fs/f2fs/node.h
>> @@ -158,7 +158,7 @@ enum mem_type {
>>  };
>>
>>  struct nat_entry_set {
>> -       struct list_head set_list;      /* link with other nat sets */
>> +       struct list_head set_list;      /* link with nat sets which have same entry_cnt */
>>         struct list_head entry_list;    /* link with dirty nat entries */
>>         nid_t set;                      /* set number*/
>>         unsigned int entry_cnt;         /* the # of nat entries in set */
>> --
>> 2.25.1

By the way, Chao and Zhiguo
I noticed that in f2fs_flush_nat_entries(), the check for nat_cnt[DIRTY_NAT] is out of
nat_tree_lock, and in f2fs_write_checkpoint(), there has below check without nat_tree_lock:

if (cpc->reason & CP_DISCARD) {
	if (!f2fs_exist_trim_candidates(sbi, cpc)) {
		unblock_operations(sbi);
		goto out;
	}

	if (NM_I(sbi)->nat_cnt[DIRTY_NAT] == 0 &&
			SIT_I(sbi)->dirty_sentries == 0 &&
			prefree_segments(sbi) == 0) {
		f2fs_flush_sit_entries(sbi, cpc);
		f2fs_clear_prefree_segments(sbi, cpc);
		unblock_operations(sbi);
		goto out;
	}
}

Is there a missing or we don't need nat_tree_lock in these situations?

And do you think the way in this patch is appropriate for reducing nat_tree_lock
hold time?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
