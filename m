Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C04059AAB1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Aug 2022 04:31:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oPEGS-0006Fu-Lo;
	Sat, 20 Aug 2022 02:31:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oPEGM-0006Fi-6r
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:31:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cl9F1qI5v3j/g3BtzmeG2io5cLjGqlhI4do3afPGLbw=; b=IdkOZbJ5kWJmS23tZoRQQGFwlm
 dZAgvm7TbW510rr8TH7LCiGsbqrl4zJaKSD6+M0hh6Kj7F3zByJZOaDI/6JIE1o/8GLMUK9lGKKLw
 1JbuodetHBlNE02qHPYxWHl5ajh8HJylkYuN1aOZQ90yJnrwe5t9EWhsfmB6q01TE0JY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cl9F1qI5v3j/g3BtzmeG2io5cLjGqlhI4do3afPGLbw=; b=SawUZ8aKfKkE2gYtNV3gI1oxxE
 FMUw+gQI1q6dWp+aho9hbWZpViO7U3eb6ZqzitWbg0yn+KGLTB5TaAdM78VQM66hFIgNr+gArwPD/
 y8uc7SB+LByyAi1xkc4SwYL4hb6Su7pY5cvvtr5FtcviPZZopAN53sXX+7SUhE7mmHw4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oPEGL-00A493-2F for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 20 Aug 2022 02:31:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 96146B82964;
 Sat, 20 Aug 2022 02:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52C22C433C1;
 Sat, 20 Aug 2022 02:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660962645;
 bh=ekatNQ35NfTUQENenCYL0+lh/xxWF2LVMBZRjKuq53k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Kvp32pTw4y53CsGi2ld5y1cBN2SKx5Sne9y80C45Oie0wzHu5hr3qXXaapqgpWCvs
 Sfg9IP5btktvArUluhFYryn7IIWitTpQ4AINokZZoZ05MXxBtPweU0b82yOAso5ZfK
 4UYYvClFMevIYFbkYC8777bVG11tuD4AkkOUXEl/4/ZFGetsPBrhAVKmvvAgeiChbE
 3mZkoxLlUcxiOb0F6hgcJq4SnPTXb3w29aZixcSOSRO2nk9GFFhRZttNuEguqZMwMA
 hoFgH3HukwgXGloaRmRth1KlWsXr+NUEinuatIlhx7BWqrZtktZa5Xf860C5HQhHO4
 ERePgrnrGilrQ==
Message-ID: <28ec016b-1fbe-8904-3421-98e8f1db7929@kernel.org>
Date: Sat, 20 Aug 2022 10:30:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <1660276608-751-1-git-send-email-guoweichao@oppo.com>
 <YvaQFmrvi5/8YcXm@google.com>
 <42dd80bb-c130-2408-7605-770b70a70f2e@kernel.org>
 <YwAfyz3kR4mG5h7f@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YwAfyz3kR4mG5h7f@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/20 7:42, Jaegeuk Kim wrote: > On 08/15, Chao Yu
 wrote: >> Hi Jaegeuk, >> >> On 2022/8/13 1:38,
 Jaegeuk Kim wrote: >>> Hi Weichao, 
 >>> >>> On 08/12, Weichao Guo wrote: >>>> When we try to def [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oPEGL-00A493-2F
Subject: Re: [f2fs-dev] [PATCH] f2fs: allocate consective blkaddrs for
 defragment
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
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/8/20 7:42, Jaegeuk Kim wrote:
> On 08/15, Chao Yu wrote:
>> Hi Jaegeuk,
>>
>> On 2022/8/13 1:38, Jaegeuk Kim wrote:
>>> Hi Weichao,
>>>
>>> On 08/12, Weichao Guo wrote:
>>>> When we try to defrag a file, its data blocks may mess with others if there
>>>> are lots of concurrent writes. This causes the file is still fragmented
>>>> after defrag. So It's better to isolate defrag writes from others.
>>>
>>> I really don't want to add more log like this. What about using
>>
>> Any concern about adding more in-mem logs?
> 
> It gives more complexity and abuses free sections.

Well, what about just using in-mem logs allocation for those segment size aligned
defragment? and so newly allocated free section can be used entirely, thoughts?

If you don't want to add more logs, how about reusing CURSEG_COLD_DATA_PINNED here?

> 
>>
>>> wb_sync_req[DATA] to prevent async writes at least?
>>
>> __should_serialize_io() says for synchronous write or small writes, it won't
>> use writepages lock to serialize IO, so it may cause fragmentation if such
>> writes were mixed w/ writes from defragment ioctl.
> 
> I think that, if you want to make a perfect layout, it'd be better to freeze
> f2fs. Can we measure the realistic overhead on our current best-effort approach?

Sure, let's evaluate wb_sync_req scheme as well.

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>
>>>> Signed-off-by: Weichao Guo <guoweichao@oppo.com>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    fs/f2fs/debug.c   | 4 ++++
>>>>    fs/f2fs/f2fs.h    | 2 ++
>>>>    fs/f2fs/file.c    | 5 +++++
>>>>    fs/f2fs/segment.c | 7 +++++++
>>>>    fs/f2fs/segment.h | 5 ++++-
>>>>    5 files changed, 22 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
>>>> index c014715..d85dc17 100644
>>>> --- a/fs/f2fs/debug.c
>>>> +++ b/fs/f2fs/debug.c
>>>> @@ -442,6 +442,10 @@ static int stat_show(struct seq_file *s, void *v)
>>>>    			   si->curseg[CURSEG_ALL_DATA_ATGC],
>>>>    			   si->cursec[CURSEG_ALL_DATA_ATGC],
>>>>    			   si->curzone[CURSEG_ALL_DATA_ATGC]);
>>>> +		seq_printf(s, "  - DEFRAG   data: %8d %8d %8d\n",
>>>> +			   si->curseg[CURSEG_COLD_DATA_DEFRAG],
>>>> +			   si->cursec[CURSEG_COLD_DATA_DEFRAG],
>>>> +			   si->curzone[CURSEG_COLD_DATA_DEFRAG]);
>>>>    		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
>>>>    			   si->main_area_segs - si->dirty_count -
>>>>    			   si->prefree_count - si->free_segs,
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index 3c7cdb7..5f9a185 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -760,6 +760,7 @@ enum {
>>>>    	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
>>>>    	FI_ALIGNED_WRITE,	/* enable aligned write */
>>>>    	FI_COW_FILE,		/* indicate COW file */
>>>> +	FI_DEFRAG_WRITE,	/* indicate defragment writes need consective blkaddrs*/
>>>>    	FI_MAX,			/* max flag, never be used */
>>>>    };
>>>> @@ -1017,6 +1018,7 @@ enum {
>>>>    	CURSEG_COLD_DATA_PINNED = NR_PERSISTENT_LOG,
>>>>    				/* pinned file that needs consecutive block address */
>>>>    	CURSEG_ALL_DATA_ATGC,	/* SSR alloctor in hot/warm/cold data area */
>>>> +	CURSEG_COLD_DATA_DEFRAG,/* used for defragment which needs consective blkaddrs */
>>>>    	NO_CHECK_TYPE,		/* number of persistent & inmem log */
>>>>    };
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index ce4905a0..f104e2e 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -2626,7 +2626,12 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>>>>    		clear_inode_flag(inode, FI_SKIP_WRITES);
>>>> +		set_inode_flag(inode, FI_DEFRAG_WRITE);
>>>> +		f2fs_lock_op(sbi);
>>>> +		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_DEFRAG, false);
>>>> +		f2fs_unlock_op(sbi);
>>>>    		err = filemap_fdatawrite(inode->i_mapping);
>>>> +		clear_inode_flag(inode, FI_DEFRAG_WRITE);
>>>>    		if (err)
>>>>    			goto out;
>>>>    	}
>>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>>>> index 0de21f8..17e7d14 100644
>>>> --- a/fs/f2fs/segment.c
>>>> +++ b/fs/f2fs/segment.c
>>>> @@ -2749,6 +2749,7 @@ static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
>>>>    void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi)
>>>>    {
>>>>    	__f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
>>>> +	__f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
>>>>    	if (sbi->am.atgc_enabled)
>>>>    		__f2fs_save_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
>>>> @@ -2774,6 +2775,7 @@ static void __f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
>>>>    void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi)
>>>>    {
>>>>    	__f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
>>>> +	__f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
>>>>    	if (sbi->am.atgc_enabled)
>>>>    		__f2fs_restore_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
>>>> @@ -3161,6 +3163,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
>>>>    		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>>>>    			return CURSEG_COLD_DATA_PINNED;
>>>> +		if (is_inode_flag_set(inode, FI_DEFRAG_WRITE))
>>>> +			return CURSEG_COLD_DATA_DEFRAG;
>>>> +
>>>>    		if (page_private_gcing(fio->page)) {
>>>>    			if (fio->sbi->am.atgc_enabled &&
>>>>    				(fio->io_type == FS_DATA_IO) &&
>>>> @@ -4332,6 +4337,8 @@ static int build_curseg(struct f2fs_sb_info *sbi)
>>>>    			array[i].seg_type = CURSEG_COLD_DATA;
>>>>    		else if (i == CURSEG_ALL_DATA_ATGC)
>>>>    			array[i].seg_type = CURSEG_COLD_DATA;
>>>> +		else if (i == CURSEG_COLD_DATA_DEFRAG)
>>>> +			array[i].seg_type = CURSEG_COLD_DATA;
>>>>    		array[i].segno = NULL_SEGNO;
>>>>    		array[i].next_blkoff = 0;
>>>>    		array[i].inited = false;
>>>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>>>> index d1d6376..75e2aa8 100644
>>>> --- a/fs/f2fs/segment.h
>>>> +++ b/fs/f2fs/segment.h
>>>> @@ -44,7 +44,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>>>>    	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno) ||	\
>>>>    	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno) ||	\
>>>>    	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno) ||	\
>>>> -	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno))
>>>> +	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno) ||	\
>>>> +	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno))
>>>>    #define IS_CURSEC(sbi, secno)						\
>>>>    	(((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /		\
>>>> @@ -62,6 +63,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
>>>>    	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /	\
>>>>    	  (sbi)->segs_per_sec) ||	\
>>>>    	 ((secno) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno /	\
>>>> +	  (sbi)->segs_per_sec) ||	\
>>>> +	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno /	\
>>>>    	  (sbi)->segs_per_sec))
>>>>    #define MAIN_BLKADDR(sbi)						\
>>>> -- 
>>>> 2.7.4


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
