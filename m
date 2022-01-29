Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A600D4A2B06
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jan 2022 02:40:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDcim-0003zH-4R; Sat, 29 Jan 2022 01:40:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nDcik-0003zA-3r
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 01:40:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yxjBWFGjkRj1OACdWXx0DlKaI+eIPux94h/JPzi2/24=; b=kZUNJ4okz8lCcfDGQYJcjwi+TY
 8pSB6cV9xdZndVL0npgh8LJpQZQSlBaR8N7DXleiX10tQhm1Vh7htH+M+8nbPHdoW8z72PRW3fmKS
 y4B6vA4rXZBhV/AZ8Q3XRmt+NknEvZSCU7Q7HwxBgtvubbpwbiokCgGg8tAzQqFwgM+Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yxjBWFGjkRj1OACdWXx0DlKaI+eIPux94h/JPzi2/24=; b=MSQlnsdwO3N4BcWo3WoCMBOA/8
 Wm87Mf1VglWzjfL7+o1WKcS8afMa9omMP5VQQRnwS/v5auPmvkcIQe7yM+u8nYNVtR5p6LjRYr2UQ
 if4Kei1If1MQDudmcEAKsZTSwUwq3rJypxnYsiVxaJmEfU/eaKHPsDN9UD/IVUFE1D2k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDcig-0001QK-32
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 29 Jan 2022 01:40:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5AB2A615DE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 29 Jan 2022 01:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB06CC340E7;
 Sat, 29 Jan 2022 01:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643420388;
 bh=i/ARsD8sJj6+s0zJtAZo2iYlj46qaziHARWT2C7edUo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=pUyiYO5ENZHlLC8fcQZbve0VQ6w7KnjoCiJq9T0kgdHh7ht1j9WZJPgYGz9xHKypb
 UWIqlDVGo4xYd4hAvgxHp0imLaLHgmBSokv10GKHtgFplyWRKuB/Dbqdo5ZmV6RUg5
 7cuVp8JnweKHqepD50f3wYbfJyuhBPg31+2mdFscB1AsWt9Auojjmh9+D6nWNr9Iqc
 St3W/PjdZhTCDjt1SAUXyl2haNIWkJX4hBMwVYtswm09oPR6+bo54qqiMzwT122RMt
 xYj8GXf2BEiOC9vwvsP4o3cLd5skstb/RBKMSvbAD6bwjW4WDkBnj4PlQlHLzZFN0Z
 g5IDp80qjc98A==
Message-ID: <d5851f31-6eec-e00c-5412-59496c2c849e@kernel.org>
Date: Sat, 29 Jan 2022 09:39:45 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220128091920.1556480-1-chao@kernel.org>
 <YfSLvyMUd3lam415@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YfSLvyMUd3lam415@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/1/29 8:35, Jaegeuk Kim wrote: > On 01/28, Chao Yu
 wrote: >> Once IPU policy is enabled in some cases: >> a) f2fs forces to use
 F2FS_IPU_FORCE in a small-sized volume >> b) user configures IPU [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDcig-0001QK-32
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't check IPU policy during file
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/1/29 8:35, Jaegeuk Kim wrote:
> On 01/28, Chao Yu wrote:
>> Once IPU policy is enabled in some cases:
>> a) f2fs forces to use F2FS_IPU_FORCE in a small-sized volume
>> b) user configures IPU policy via sysfs
> 
> It's contradictory to each other. How about just letting users decide to do what
> they want to do? IOWs, if user wants to do defrag, they should change ipu_policy
> on the fly.

How about the case user wants to do defrag for specified files, and also use
ipu_policy for other common writes?

IMO, it may be not completely contradictory, if we try to treat userspace defraging
requirement as specified OPU requirement, like kernel-side OPU requirement from
node write or GC write.

Or maybe we can introduce a new ipu_policy which allow triggering OPU when defraging
triggered from userspace?

Thanks,

> 
>>
>> Then we may fail to defragment file via ioctl due to IPU policy check,
>> it doesn't make sense, so let's change to use IPU policy for common
>> data writeback, rather than for specific data writeback, e.g. GC,
>> defragment, and so on.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 15 ++++++++++-----
>>   fs/f2fs/f2fs.h |  3 ++-
>>   fs/f2fs/file.c | 17 ++++++++++-------
>>   3 files changed, 22 insertions(+), 13 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 0f124e8de1d4..bce7ecac8976 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -2530,6 +2530,9 @@ bool f2fs_should_update_outplace(struct inode *inode, struct f2fs_io_info *fio)
>>   	if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
>>   		return true;
>>   
>> +	if (is_inode_flag_set(inode, FI_DEFRAG_PROCESS))
>> +		return true;
>> +
>>   	if (fio) {
>>   		if (page_private_gcing(fio->page))
>>   			return true;
>> @@ -3154,8 +3157,8 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>   			f2fs_available_free_memory(sbi, DIRTY_DENTS))
>>   		goto skip_write;
>>   
>> -	/* skip writing during file defragment */
>> -	if (is_inode_flag_set(inode, FI_DO_DEFRAG))
>> +	/* skip writing in file defragment preparing stage */
>> +	if (is_inode_flag_set(inode, FI_DEFRAG_PREPARE))
>>   		goto skip_write;
>>   
>>   	trace_f2fs_writepages(mapping->host, wbc, DATA);
>> @@ -3733,7 +3736,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>>   		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
>>   		f2fs_unlock_op(sbi);
>>   
>> -		set_inode_flag(inode, FI_DO_DEFRAG);
>> +		set_inode_flag(inode, FI_DEFRAG_PREPARE);
>>   
>>   		for (blkofs = 0; blkofs < blk_per_sec; blkofs++) {
>>   			struct page *page;
>> @@ -3750,9 +3753,11 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>>   			f2fs_put_page(page, 1);
>>   		}
>>   
>> -		clear_inode_flag(inode, FI_DO_DEFRAG);
>> +		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>>   
>> +		set_inode_flag(inode, FI_DEFRAG_PROCESS);
>>   		ret = filemap_fdatawrite(inode->i_mapping);
>> +		clear_inode_flag(inode, FI_DEFRAG_PROCESS);
>>   
>>   		f2fs_up_write(&sbi->pin_sem);
>>   
>> @@ -3761,7 +3766,7 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
>>   	}
>>   
>>   done:
>> -	clear_inode_flag(inode, FI_DO_DEFRAG);
>> +	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>>   	clear_inode_flag(inode, FI_ALIGNED_WRITE);
>>   
>>   	filemap_invalidate_unlock(inode->i_mapping);
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 8178a9152e49..4b905059a81e 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -733,7 +733,8 @@ enum {
>>   	FI_DROP_CACHE,		/* drop dirty page cache */
>>   	FI_DATA_EXIST,		/* indicate data exists */
>>   	FI_INLINE_DOTS,		/* indicate inline dot dentries */
>> -	FI_DO_DEFRAG,		/* indicate defragment is running */
>> +	FI_DEFRAG_PREPARE,	/* indicate defragment is preparing */
>> +	FI_DEFRAG_PROCESS,	/* indicate defragment is processing */
>>   	FI_DIRTY_FILE,		/* indicate regular/symlink has dirty pages */
>>   	FI_PREALLOCATED_ALL,	/* all blocks for write were preallocated */
>>   	FI_HOT_DATA,		/* indicate file is hot */
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 6ccdd6e347e2..696f4a175228 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -2559,10 +2559,6 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>>   	bool fragmented = false;
>>   	int err;
>>   
>> -	/* if in-place-update policy is enabled, don't waste time here */
>> -	if (f2fs_should_update_inplace(inode, NULL))
>> -		return -EINVAL;
>> -
>>   	pg_start = range->start >> PAGE_SHIFT;
>>   	pg_end = (range->start + range->len) >> PAGE_SHIFT;
>>   
>> @@ -2570,6 +2566,11 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>>   
>>   	inode_lock(inode);
>>   
>> +	if (f2fs_is_pinned_file(inode)) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
>> +
>>   	/* writeback all dirty pages in the range */
>>   	err = filemap_write_and_wait_range(inode->i_mapping, range->start,
>>   						range->start + range->len - 1);
>> @@ -2651,7 +2652,7 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>>   			goto check;
>>   		}
>>   
>> -		set_inode_flag(inode, FI_DO_DEFRAG);
>> +		set_inode_flag(inode, FI_DEFRAG_PREPARE);
>>   
>>   		idx = map.m_lblk;
>>   		while (idx < map.m_lblk + map.m_len && cnt < blk_per_seg) {
>> @@ -2676,14 +2677,16 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
>>   		if (map.m_lblk < pg_end && cnt < blk_per_seg)
>>   			goto do_map;
>>   
>> -		clear_inode_flag(inode, FI_DO_DEFRAG);
>> +		clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>>   
>> +		set_inode_flag(inode, FI_DEFRAG_PROCESS);
>>   		err = filemap_fdatawrite(inode->i_mapping);
>> +		clear_inode_flag(inode, FI_DEFRAG_PROCESS);
>>   		if (err)
>>   			goto out;
>>   	}
>>   clear_out:
>> -	clear_inode_flag(inode, FI_DO_DEFRAG);
>> +	clear_inode_flag(inode, FI_DEFRAG_PREPARE);
>>   out:
>>   	inode_unlock(inode);
>>   	if (!err)
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
