Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8596F3B5E10
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jun 2021 14:34:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lxqSo-0005Qy-GC; Mon, 28 Jun 2021 12:34:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lxqSn-0005Qo-1n
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 12:34:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZFT0l7tps9EYzx8wgLCi7QPaAj7MKeEpO6a/KGbrIk=; b=FgVZdcAGFryMvcDqyrM/VHF0nm
 Njtln/dEcOEd7C+70C5IfwymdE1xxSyHEoZFJIx463wytmtGW94NlP0j9M5L/B5Ziwf1EkfTHv9Tw
 J+7gshfB/jpeUlVUtZVPSLHHn41lz8cJGniojzd+0O+/VaXbwwjJ/EX6tb0CG2311VGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VZFT0l7tps9EYzx8wgLCi7QPaAj7MKeEpO6a/KGbrIk=; b=DdyiMNcUpAXezjWwnq3DgrhEew
 GjncdohbCTX8yV2YPeflTqbCCA6LlkSdbojHRzsacWeN5yuFh2R6ynrPSDD5ySsj28nPHscK95gUH
 U446LX0K2PCEqdwH3Xh9jwEEIF0gTQVF4i8i3hURATk+kIVqpMbNSWrfk5rdM3+TxN+4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lxqSg-0008CP-4J
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 12:34:11 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 80ADA61C6A;
 Mon, 28 Jun 2021 12:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624883638;
 bh=OOyHM6b/euXABkREYtUfPsbWldbOJbz+L5JFqJ0vJOQ=;
 h=Subject:From:To:Cc:References:Date:In-Reply-To:From;
 b=LRfaJllObY8Gqc/xLCX/6DJiaxzKW7Y6axl8h8BjEaX5EdGx6G32vbtJaaQpewo24
 cYza49QPE8+gTeL/8Kq7qHdFtld0wnmnEc2B02j+pWulKdfgSSHvRIQXqjtYFeoJ3J
 yUxnaADiNzPT71zY6/GRpNPXKrtOjEuNjX5+c9GV4SDr9ZGGGFHnDwcxCZat1wsDWQ
 98jSyMc2iv8J2VW8M1rb+IGVhDye+lg4JzoxMwCoZQ9z6UlzNl9CAmgUuM81hR99Wi
 0OP3mqSmCKY4zQi0N5ex0cTkHfSKBPWiHDiheeAhTP40JlM5eBwopSzOvkhrKmOntD
 UJXvDFClujHbA==
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210525113909.113486-1-yuchao0@huawei.com>
 <YNLsKSSxS5xLJcnB@google.com>
 <bd548ff5-4143-31f9-0d84-abc8a53b597d@kernel.org>
 <YNNYEUumK506fxPK@google.com>
 <1ae0bb19-4773-57e1-41e3-2bedc9c850d0@kernel.org>
Message-ID: <e5118454-5890-6061-95eb-62872cd612da@kernel.org>
Date: Mon, 28 Jun 2021 20:33:56 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1ae0bb19-4773-57e1-41e3-2bedc9c850d0@kernel.org>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lxqSg-0008CP-4J
Subject: Re: [f2fs-dev] [PATCH] f2fs: avoid attaching SB_ACTIVE flag during
 mount/remount
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, Zhang Yi <yi.zhang@huawei.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/28 20:29, Chao Yu wrote:
> On 2021/6/23 23:49, Jaegeuk Kim wrote:
>> On 06/23, Chao Yu wrote:
>>> Hi Jaegeuk,
>>>
>>> On 2021/6/23 16:09, Jaegeuk Kim wrote:
>>>> Hi Chao,
>>>>
>>>> I'll remove this patch, since it breaks checkpoint=disable and recovery
>>>> flow that check SB_ACTIVE.
>>>
>>> Oh, sorry, is it due to changes in f2fs_disable_checkpoint()?
>>>
>>> So how about testing with changes f2fs_recover_orphan_inodes() and
>>> f2fs_recover_fsync_data()?
>>
>> I'm now nervous whether the test can miss corner cases. So, I don't think
>> we need to pour our time for this nice-to-have patch.
> 
> Well, could you please consider to check the fixed patch in 5.15 version?
> SB_ACTIVE in recovery flow is necessary for checkpoint disabling, it should

Sorry, I mean: if SB_ACTIVE in recovery flow is necessary...

Thanks,

> not be enabled only under CONFIG_QUOTA, right?
> 
> Thanks,
> 
>>
>>>
>>> Thanks,
>>>
>>>>
>>>> Thanks,
>>>>
>>>> On 05/25, Chao Yu wrote:
>>>>> Quoted from [1]
>>>>>
>>>>> "I do remember that I've added this code back then because otherwise
>>>>> orphan cleanup was losing updates to quota files. But you're right
>>>>> that now I don't see how that could be happening and it would be nice
>>>>> if we could get rid of this hack"
>>>>>
>>>>> [1] https://lore.kernel.org/linux-ext4/99cce8ca-e4a0-7301-840f-2ace67c551f3@huawei.com/T/#m04990cfbc4f44592421736b504afcc346b2a7c00
>>>>>
>>>>> Related fix in ext4 by
>>>>> commit 72ffb49a7b62 ("ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()").
>>>>>
>>>>> f2fs has the same hack implementation in
>>>>> - f2fs_recover_orphan_inodes()
>>>>> - f2fs_recover_fsync_data()
>>>>> - f2fs_disable_checkpoint()
>>>>>
>>>>> Let's get rid of this hack as well in f2fs.
>>>>>
>>>>> Cc: Zhang Yi <yi.zhang@huawei.com>
>>>>> Cc: Jan Kara <jack@suse.cz>
>>>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>>>> ---
>>>>>     fs/f2fs/checkpoint.c |  3 ---
>>>>>     fs/f2fs/recovery.c   |  8 ++------
>>>>>     fs/f2fs/super.c      | 11 ++++-------
>>>>>     3 files changed, 6 insertions(+), 16 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>>> index 6c208108d69c..a578c7d13d81 100644
>>>>> --- a/fs/f2fs/checkpoint.c
>>>>> +++ b/fs/f2fs/checkpoint.c
>>>>> @@ -691,9 +691,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>>>>>     	}
>>>>>     #ifdef CONFIG_QUOTA
>>>>> -	/* Needed for iput() to work correctly and not trash data */
>>>>> -	sbi->sb->s_flags |= SB_ACTIVE;
>>>>> -
>>>>>     	/*
>>>>>     	 * Turn on quotas which were not enabled for read-only mounts if
>>>>>     	 * filesystem has quota feature, so that they are updated correctly.
>>>>> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
>>>>> index 4b2f7d1d5bf4..4cfe36fa41be 100644
>>>>> --- a/fs/f2fs/recovery.c
>>>>> +++ b/fs/f2fs/recovery.c
>>>>> @@ -782,8 +782,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>>>>>     	}
>>>>>     #ifdef CONFIG_QUOTA
>>>>> -	/* Needed for iput() to work correctly and not trash data */
>>>>> -	sbi->sb->s_flags |= SB_ACTIVE;
>>>>>     	/* Turn on quotas so that they are updated correctly */
>>>>>     	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
>>>>>     #endif
>>>>> @@ -811,10 +809,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>>>>>     	err = recover_data(sbi, &inode_list, &tmp_inode_list, &dir_list);
>>>>>     	if (!err)
>>>>>     		f2fs_bug_on(sbi, !list_empty(&inode_list));
>>>>> -	else {
>>>>> -		/* restore s_flags to let iput() trash data */
>>>>> -		sbi->sb->s_flags = s_flags;
>>>>> -	}
>>>>> +	else
>>>>> +		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
>>>>>     skip:
>>>>>     	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
>>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>>> index 0a77808ebb8f..e7bd983fbddc 100644
>>>>> --- a/fs/f2fs/super.c
>>>>> +++ b/fs/f2fs/super.c
>>>>> @@ -1881,17 +1881,15 @@ static int f2fs_enable_quotas(struct super_block *sb);
>>>>>     static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>>>>>     {
>>>>> -	unsigned int s_flags = sbi->sb->s_flags;
>>>>>     	struct cp_control cpc;
>>>>>     	int err = 0;
>>>>>     	int ret;
>>>>>     	block_t unusable;
>>>>> -	if (s_flags & SB_RDONLY) {
>>>>> +	if (sbi->sb->s_flags & SB_RDONLY) {
>>>>>     		f2fs_err(sbi, "checkpoint=disable on readonly fs");
>>>>>     		return -EINVAL;
>>>>>     	}
>>>>> -	sbi->sb->s_flags |= SB_ACTIVE;
>>>>>     	f2fs_update_time(sbi, DISABLE_TIME);
>>>>> @@ -1909,13 +1907,13 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>>>>>     	ret = sync_filesystem(sbi->sb);
>>>>>     	if (ret || err) {
>>>>>     		err = ret ? ret : err;
>>>>> -		goto restore_flag;
>>>>> +		goto out;
>>>>>     	}
>>>>>     	unusable = f2fs_get_unusable_blocks(sbi);
>>>>>     	if (f2fs_disable_cp_again(sbi, unusable)) {
>>>>>     		err = -EAGAIN;
>>>>> -		goto restore_flag;
>>>>> +		goto out;
>>>>>     	}
>>>>>     	down_write(&sbi->gc_lock);
>>>>> @@ -1931,8 +1929,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
>>>>>     out_unlock:
>>>>>     	up_write(&sbi->gc_lock);
>>>>> -restore_flag:
>>>>> -	sbi->sb->s_flags = s_flags;	/* Restore SB_RDONLY status */
>>>>> +out:
>>>>>     	return err;
>>>>>     }
>>>>> -- 
>>>>> 2.29.2
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
