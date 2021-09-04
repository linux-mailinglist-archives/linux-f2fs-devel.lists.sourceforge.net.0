Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E19400967
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 05:06:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMM0v-0004PG-JM; Sat, 04 Sep 2021 03:06:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1mMM0u-0004P9-Gz
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 03:06:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tDhGE93/g9glcm5jpR+liAnKcM1a3TOUh4YDIMdSn9Y=; b=bmElCfCUANwvQ2/04H7jH2e2nS
 qc2atpT8AHE/kOrn3ittkDcsOYxMjvm/ZO3un0lqQ1zDeXk1hx7E67cgOkO9vW1Tm5z1uNak3aqgw
 UhMj+X/+xmOvxjKohEtVgL24O6qPeOmPkbKwdoz6TciE4v6hIfdk/diSgDtofgK5wxLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tDhGE93/g9glcm5jpR+liAnKcM1a3TOUh4YDIMdSn9Y=; b=iJRN+Bt2RZ70hwwyTZAIWiKYAN
 1wWx4QpSD50/fGZIVh0WrT/nJwAkAjWZl7A36S5jsQok6NVX+O6zd5Pmuo+i1c/8SprG2pVH0Miyu
 2mJklrqKkNtHSrwOSyBsJTDJgaNf/jsGst86XiG0lfX4Mxbf3N0mrjdWrKUyHhD8zv4I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMM0s-00DuaL-Vv
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 03:06:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 86B75600EF;
 Sat,  4 Sep 2021 03:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630724788;
 bh=bf45uTGNybJZynZ0RzcJn0qt6WIrwA62SQcCpztjVco=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=BBA14g3K8DT6djOS+Ljvnzu8d3eBEEg7azMEbvGJbLqOBe8VKUrYJdkg4hcVh5Nwy
 Syj992eOSgQR7CsHeDl1v1sU1w0DffD32pmM+8TiiakuuDPvKv9POFHnYUi3i+U7gb
 cFzihK0RTgKAm4EQDeSoDQCtFhDiBgvrwBBHNmIpQPvwYEG5YlS2VVU4tR+0P7ptue
 HHZ1K2vx+RbA1DT7auTYvzMMaHQ0BrusSlR7RWVzTKB2zX1w99fZnJOWahzxE0Ox7S
 jzxtZPpMaeCXOsRvRHAVAnd0xhSCHNLgr3tgT6+4S57yXgxCdH1ODKigHEkb1f4Ioz
 Kx7/mmDi+IPBA==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210901080621.110319-1-chao@kernel.org>
 <YTK7JDnpc6+LNqsl@google.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <8756a722-3363-9033-4a5f-047e28af645c@kernel.org>
Date: Sat, 4 Sep 2021 11:06:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YTK7JDnpc6+LNqsl@google.com>
Content-Language: en-US
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/9/4 8:17, Jaegeuk Kim wrote: > I remember this gave
 a regression before? I have removed changes which bothers checkpoint disabling
 path, how about testing this in dev-test branch for a while? 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mMM0s-00DuaL-Vv
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: avoid attaching SB_ACTIVE flag
 during mount
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
Cc: Zhang Yi <yi.zhang@huawei.com>, Jan Kara <jack@suse.cz>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/9/4 8:17, Jaegeuk Kim wrote:
> I remember this gave a regression before?

I have removed changes which bothers checkpoint disabling path, how
about testing this in dev-test branch for a while?

BTW, any plan to porting checkpoint disabling testcases from android
into xfstest suit?

Thanks,

> 
> On 09/01, Chao Yu wrote:
>> Quoted from [1]
>>
>> "I do remember that I've added this code back then because otherwise
>> orphan cleanup was losing updates to quota files. But you're right
>> that now I don't see how that could be happening and it would be nice
>> if we could get rid of this hack"
>>
>> [1] https://lore.kernel.org/linux-ext4/99cce8ca-e4a0-7301-840f-2ace67c551f3@huawei.com/T/#m04990cfbc4f44592421736b504afcc346b2a7c00
>>
>> Related fix in ext4 by
>> commit 72ffb49a7b62 ("ext4: do not set SB_ACTIVE in ext4_orphan_cleanup()").
>>
>> f2fs has the same hack implementation in
>> - f2fs_recover_orphan_inodes()
>> - f2fs_recover_fsync_data()
>>
>> Let's get rid of this hack as well in f2fs.
>>
>> Cc: Zhang Yi <yi.zhang@huawei.com>
>> Cc: Jan Kara <jack@suse.cz>
>> Acked-by: Jan Kara <jack@suse.cz>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - don't bother checkpoint disabling path
>>   fs/f2fs/checkpoint.c | 3 ---
>>   fs/f2fs/recovery.c   | 8 ++------
>>   2 files changed, 2 insertions(+), 9 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 83e9bc0f91ff..7d8803a4cbc2 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -705,9 +705,6 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>>   	}
>>   
>>   #ifdef CONFIG_QUOTA
>> -	/* Needed for iput() to work correctly and not trash data */
>> -	sbi->sb->s_flags |= SB_ACTIVE;
>> -
>>   	/*
>>   	 * Turn on quotas which were not enabled for read-only mounts if
>>   	 * filesystem has quota feature, so that they are updated correctly.
>> diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
>> index 04655511d7f5..706ddb3c95c0 100644
>> --- a/fs/f2fs/recovery.c
>> +++ b/fs/f2fs/recovery.c
>> @@ -787,8 +787,6 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>>   	}
>>   
>>   #ifdef CONFIG_QUOTA
>> -	/* Needed for iput() to work correctly and not trash data */
>> -	sbi->sb->s_flags |= SB_ACTIVE;
>>   	/* Turn on quotas so that they are updated correctly */
>>   	quota_enabled = f2fs_enable_quota_files(sbi, s_flags & SB_RDONLY);
>>   #endif
>> @@ -816,10 +814,8 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
>>   	err = recover_data(sbi, &inode_list, &tmp_inode_list, &dir_list);
>>   	if (!err)
>>   		f2fs_bug_on(sbi, !list_empty(&inode_list));
>> -	else {
>> -		/* restore s_flags to let iput() trash data */
>> -		sbi->sb->s_flags = s_flags;
>> -	}
>> +	else
>> +		f2fs_bug_on(sbi, sbi->sb->s_flags & SB_ACTIVE);
>>   skip:
>>   	fix_curseg_write_pointer = !check_only || list_empty(&inode_list);
>>   
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
