Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E2A621699
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Nov 2022 15:30:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1osPcS-0004vq-Rf;
	Tue, 08 Nov 2022 14:30:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1osPcS-0004vg-8x
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 14:30:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JRN82QfV9LXZ94HgXCX7ut5arH13JRGh0OZkcNkagi4=; b=ilLT2ruTZLaufXlEQ8K5Mqsocp
 cdP4Ja1ODFfkvWVS/37i0r6i5wFOVQ0zFsxWQhmkU/dM4oyM/FTateoo4lCdOYN6t2d2LICFO+oB9
 HcEjoUxQ+H1SaEUEVtz6yRWt5YmS4+bdMKaKq0S66r0+BAo/GEhQGEiuYQuoFS0gzelk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JRN82QfV9LXZ94HgXCX7ut5arH13JRGh0OZkcNkagi4=; b=Drx9J3wlZD70pAw5+EJgge1G4z
 RyTTo+ZFVegrZRFBuHuoxtSYMQofbtJOJKeVP6XTAJI4vO1WebSF/4Vmn/27lScHkCLyn5nbEYhXM
 MHd/y74GEBfl5DYktcIk3N5x+NNWYmxjqolr31ChzusaaNgiHixz8CDytBsLe9XTJzTY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1osPcO-0003vS-TW for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Nov 2022 14:30:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 9C433B81B08;
 Tue,  8 Nov 2022 14:30:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E4FC433D7;
 Tue,  8 Nov 2022 14:30:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667917817;
 bh=HfYyn2zfWoXVMiL04ajYFQAOGugFAO+1dw/DJMyUUU8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Ue6Zs8utYdJmMhWRb1grLj7XVg1S4ZS8CcHg3jCMIwRfqQfu9PhbaGVHqA5LGmlZG
 mB7kHOoOgL5NIJNOWQrNNVPKj/lHdaRCFYrBsybYiaAFsHyvzOas6o6UpgHbElIx50
 3/xKG4SS/2vgmkH8ZKZWw1sLsN6TMstkH+2COUbTf9BaCUy8OKPwRZuJJUoFkZKkIe
 funsPjlipwr1tnbBiNgke/m3jZnmmCFYz2i53hooT1xc3vRt7jbM2ppaYJd+z3Qu1v
 9h0GfrD8lnSmFOyOU7RQAWqu4lrTO75AS4qymZ53zP7JUurtgj7e0TgxJ95P4f4rQQ
 gJ01DEKAJZrEg==
Message-ID: <8368702c-ae33-b810-a6c3-ac8fa29998df@kernel.org>
Date: Tue, 8 Nov 2022 22:30:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: qixiaoyu <qxy65535@gmail.com>
References: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
 <af41e68c-4f78-0934-1041-974e44bd3825@kernel.org>
 <20221102122518.GB22857@mi-HP-ProDesk-680-G4-MT>
 <3d2b1141-995a-4bfb-4bf0-5227be25105a@kernel.org>
 <20221108123218.GC22857@mi-HP-ProDesk-680-G4-MT>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221108123218.GC22857@mi-HP-ProDesk-680-G4-MT>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/8 20:32, qixiaoyu wrote: > On Sun, Nov 06, 2022
 at 09:54:59PM +0800, Chao Yu wrote: >> On 2022/11/2 20:25, qixiaoyu wrote:
 >>> Hi Chao, >>> >>> fdatasync do in-place-update to avoid additio [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1osPcO-0003vS-TW
Subject: Re: [f2fs-dev] [PATCH] f2fs: separate IPU policy for fdatasync from
 F2FS_IPU_FSYNC
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, qixiaoyu1 <qixiaoyu1@xiaomi.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/8 20:32, qixiaoyu wrote:
> On Sun, Nov 06, 2022 at 09:54:59PM +0800, Chao Yu wrote:
>> On 2022/11/2 20:25, qixiaoyu wrote:
>>> Hi Chao,
>>>
>>> fdatasync do in-place-update to avoid additional node writes, but currently
>>> it only do that with F2FS_IPU_FSYNC as:
>>>
>>> f2fs_do_sync_file:
>>> 	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
>>>   		set_inode_flag(inode, FI_NEED_IPU);
>>>
>>> check_inplace_update_policy:
>>> 	/* this is only set during fdatasync */
>>> 	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
>>> 			is_inode_flag_set(inode, FI_NEED_IPU))
>>> 		return true;
>>>
>>> So this patch separate in-place-update of fdatasync from F2FS_IPU_FSYNC to
>>> apply it to all IPU policy.
>>>
>>> BTW, we found small performance improvement with this patch on AndroBench app
>>> using F2FS_IPU_SSR_UTIL on our product:
>>
>> How this patch affects performance when F2FS_IPU_SSR_UTIL is on?
>>
>> Thanks,
>>
> 
> SQLite test in AndroBench app use fdatasync to sync file to the disk.
> When switch to F2FS_IPU_SSR_UTIL ipu_policy, it will use out-of-place-update
> even though SQLite calls fdatasync, which will introduce extra meta data write.

Why not using F2FS_IPU_SSR_UTIL | F2FS_IPU_FSYNC, I guess these two flags
cover different scenarios, F2FS_IPU_SSR_UTIL for ssr case, and F2FS_IPU_FSYNC
for f{data,}sync case.

Thanks,

> 
> Thanks.
> 
>>>
>>>                  F2FS_IPU_FSYNC  F2FS_IPU_SSR_UTIL   F2FS_IPU_SSR_UTIL(with patch)
>>> SQLite Insert(QPS)  6818.08     6327.09(-7.20%)     6757.72
>>> SQLite Update(QPS)  6528.81     6336.57(-2.94%)     6490.77
>>> SQLite Delete(QPS)  9724.68     9378.37(-3.56%)     9622.27
>>>
>>> Thanks
>>>
>>> On Tue, Nov 01, 2022 at 11:14:55PM +0800, Chao Yu wrote:
>>>> On 2022/10/21 10:31, qixiaoyu1 wrote:
>>>>> Currently IPU policy for fdatasync is coupled with F2FS_IPU_FSYNC.
>>>>> Fix to apply it to all IPU policy.
>>>>
>>>> Xiaoyu,
>>>>
>>>> Sorry for the delay.
>>>>
>>>> I didn't get the point, can you please explain more about the
>>>> issue?
>>>>
>>>> Thanks,
>>>>
>>>>>
>>>>> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
>>>>> ---
>>>>>   fs/f2fs/data.c | 8 +++-----
>>>>>   fs/f2fs/file.c | 4 +++-
>>>>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>>>> index a71e818cd67b..fec8e15fe820 100644
>>>>> --- a/fs/f2fs/data.c
>>>>> +++ b/fs/f2fs/data.c
>>>>> @@ -2518,6 +2518,9 @@ static inline bool check_inplace_update_policy(struct inode *inode,
>>>>>   	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
>>>>>   			is_inode_flag_set(inode, FI_OPU_WRITE))
>>>>>   		return false;
>>>>> +	/* this is set by fdatasync or F2FS_IPU_FSYNC policy */
>>>>> +	if (is_inode_flag_set(inode, FI_NEED_IPU))
>>>>> +		return true;
>>>>>   	if (policy & (0x1 << F2FS_IPU_FORCE))
>>>>>   		return true;
>>>>>   	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
>>>>> @@ -2538,11 +2541,6 @@ static inline bool check_inplace_update_policy(struct inode *inode,
>>>>>   			!IS_ENCRYPTED(inode))
>>>>>   		return true;
>>>>> -	/* this is only set during fdatasync */
>>>>> -	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
>>>>> -			is_inode_flag_set(inode, FI_NEED_IPU))
>>>>> -		return true;
>>>>> -
>>>>>   	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>>>>>   			!f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
>>>>>   		return true;
>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>>> index 82cda1258227..08091550cdf2 100644
>>>>> --- a/fs/f2fs/file.c
>>>>> +++ b/fs/f2fs/file.c
>>>>> @@ -270,8 +270,10 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>>>>>   		goto go_write;
>>>>>   	/* if fdatasync is triggered, let's do in-place-update */
>>>>> -	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
>>>>> +	if (datasync || (SM_I(sbi)->ipu_policy & (0x1 << F2FS_IPU_FSYNC) &&
>>>>> +			get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks))
>>>>>   		set_inode_flag(inode, FI_NEED_IPU);
>>>>> +
>>>>>   	ret = file_write_and_wait_range(file, start, end);
>>>>>   	clear_inode_flag(inode, FI_NEED_IPU);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
