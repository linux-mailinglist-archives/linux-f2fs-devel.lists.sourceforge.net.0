Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0737B61E276
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  6 Nov 2022 14:55:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1org7A-0002YS-OS;
	Sun, 06 Nov 2022 13:55:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1org7A-0002YM-0M
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 13:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OSMPcHN54vNod9afrppaNbQYWdzBn7by2JEIT6S2N6c=; b=AkAW61I//b75VZTh/ZhdJuuK3P
 nptSkfoOUdn9g7XWTBme/Ux1+dzlEWdRMbq/USFswERHmbDUZGaLPNmDeose0kHWMOBvqYvMOcKt0
 H/0kzaOyAWvIREYImVRTqT/IvKT0NK21PAZAXN8DZuirMbSYzXkqc+qI5e/nGUXIQqZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OSMPcHN54vNod9afrppaNbQYWdzBn7by2JEIT6S2N6c=; b=OXft3I5QPbGbw+Gxno2CW9Vg8S
 p1tp7AewU/HkAg4KEIXUoaOjmEJ7tdtVWtYk80d1xdxVKe8755CI8RYxMcLMMZNm39ikHSDnxWgGV
 DPsKkqHDOP48e977Znz8AT8PEoGKa8geYa20jTNg/b3FJ6+16rmmkA6FiavCfV+0Bgbg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1org79-0006CC-93 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 06 Nov 2022 13:55:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0DE860C52;
 Sun,  6 Nov 2022 13:55:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BA99C433C1;
 Sun,  6 Nov 2022 13:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667742901;
 bh=e3Hjt0HFvq7svWTT6yYuVpQxSjxCKFMNN+dx63micnQ=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=qeITGlTuvEFxzY/KVK0EY03Zk0kEjYk5Mb6jk0ZGEuQ0CtDZHXzweMESsFvIizhbV
 rRa61wVrN9OIiIIWxiqmdA0oLfo8BtHIIWvQJaqGW8xiFc2ksL2cQF1Y5/Wbx9nVRV
 +htmGoCzAlYPLiFTwSAw3zIYbiiLtDL2+odjx414WLEoP5sAoPm4kK+NHcd3Fkw22a
 i4aOEdIIVHk/1u0F14OSbvrAZSTzeNcV2g8wP4xyEMQPIfZLFASuuaqIqymmT6TVw+
 /7oKcNDFS87tpOfvI+dGCulEA3tyA2f6cLWo8IMSI+0ooo0gEllz3T4GZr1l/J03pn
 ZQqnyvNXMf0fw==
Message-ID: <3d2b1141-995a-4bfb-4bf0-5227be25105a@kernel.org>
Date: Sun, 6 Nov 2022 21:54:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
To: qixiaoyu <qxy65535@gmail.com>
References: <20221021023136.22863-1-qixiaoyu1@xiaomi.com>
 <af41e68c-4f78-0934-1041-974e44bd3825@kernel.org>
 <20221102122518.GB22857@mi-HP-ProDesk-680-G4-MT>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20221102122518.GB22857@mi-HP-ProDesk-680-G4-MT>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/11/2 20:25, qixiaoyu wrote: > Hi Chao, > > fdatasync
 do in-place-update to avoid additional node writes, but currently > it only
 do that with F2FS_IPU_FSYNC as: > > f2fs_do_sync_file: > if (da [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1org79-0006CC-93
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
Cc: qixiaoyu1 <qixiaoyu1@xiaomi.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/11/2 20:25, qixiaoyu wrote:
> Hi Chao,
> 
> fdatasync do in-place-update to avoid additional node writes, but currently
> it only do that with F2FS_IPU_FSYNC as:
> 
> f2fs_do_sync_file:
> 	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
>   		set_inode_flag(inode, FI_NEED_IPU);
> 
> check_inplace_update_policy:
> 	/* this is only set during fdatasync */
> 	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
> 			is_inode_flag_set(inode, FI_NEED_IPU))
> 		return true;
> 
> So this patch separate in-place-update of fdatasync from F2FS_IPU_FSYNC to
> apply it to all IPU policy.
> 
> BTW, we found small performance improvement with this patch on AndroBench app
> using F2FS_IPU_SSR_UTIL on our product:

How this patch affects performance when F2FS_IPU_SSR_UTIL is on?

Thanks,

> 
>                  F2FS_IPU_FSYNC  F2FS_IPU_SSR_UTIL   F2FS_IPU_SSR_UTIL(with patch)
> SQLite Insert(QPS)  6818.08     6327.09(-7.20%)     6757.72
> SQLite Update(QPS)  6528.81     6336.57(-2.94%)     6490.77
> SQLite Delete(QPS)  9724.68     9378.37(-3.56%)     9622.27
> 
> Thanks
> 
> On Tue, Nov 01, 2022 at 11:14:55PM +0800, Chao Yu wrote:
>> On 2022/10/21 10:31, qixiaoyu1 wrote:
>>> Currently IPU policy for fdatasync is coupled with F2FS_IPU_FSYNC.
>>> Fix to apply it to all IPU policy.
>>
>> Xiaoyu,
>>
>> Sorry for the delay.
>>
>> I didn't get the point, can you please explain more about the
>> issue?
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: qixiaoyu1 <qixiaoyu1@xiaomi.com>
>>> ---
>>>   fs/f2fs/data.c | 8 +++-----
>>>   fs/f2fs/file.c | 4 +++-
>>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index a71e818cd67b..fec8e15fe820 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -2518,6 +2518,9 @@ static inline bool check_inplace_update_policy(struct inode *inode,
>>>   	if (policy & (0x1 << F2FS_IPU_HONOR_OPU_WRITE) &&
>>>   			is_inode_flag_set(inode, FI_OPU_WRITE))
>>>   		return false;
>>> +	/* this is set by fdatasync or F2FS_IPU_FSYNC policy */
>>> +	if (is_inode_flag_set(inode, FI_NEED_IPU))
>>> +		return true;
>>>   	if (policy & (0x1 << F2FS_IPU_FORCE))
>>>   		return true;
>>>   	if (policy & (0x1 << F2FS_IPU_SSR) && f2fs_need_SSR(sbi))
>>> @@ -2538,11 +2541,6 @@ static inline bool check_inplace_update_policy(struct inode *inode,
>>>   			!IS_ENCRYPTED(inode))
>>>   		return true;
>>> -	/* this is only set during fdatasync */
>>> -	if (policy & (0x1 << F2FS_IPU_FSYNC) &&
>>> -			is_inode_flag_set(inode, FI_NEED_IPU))
>>> -		return true;
>>> -
>>>   	if (unlikely(fio && is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
>>>   			!f2fs_is_checkpointed_data(sbi, fio->old_blkaddr)))
>>>   		return true;
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 82cda1258227..08091550cdf2 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -270,8 +270,10 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
>>>   		goto go_write;
>>>   	/* if fdatasync is triggered, let's do in-place-update */
>>> -	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
>>> +	if (datasync || (SM_I(sbi)->ipu_policy & (0x1 << F2FS_IPU_FSYNC) &&
>>> +			get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks))
>>>   		set_inode_flag(inode, FI_NEED_IPU);
>>> +
>>>   	ret = file_write_and_wait_range(file, start, end);
>>>   	clear_inode_flag(inode, FI_NEED_IPU);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
