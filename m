Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2CD4ACE10
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Feb 2022 02:41:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nHFVb-000566-HA; Tue, 08 Feb 2022 01:41:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nHFVa-000560-OJ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 01:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uZnHVWGW6nVJvKZCvytaWaRGrk+29wxwdNj3pmzmdic=; b=mwgxeMt37GwPKCbMEHBk1+fbPl
 Fhbb73SyksKG4HSpB2xh6atYlG3BXj9V+14DcOha8FQDTIl7D/kULRyjMz5cxTBaNdFCZcOQ9Tk7Q
 1V0KSNeMQpjryF2OfY1vNDDGVLomeFuwEyf/zNF1eZJwJnnSqx7xWSibkhBiuKnI3/DM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uZnHVWGW6nVJvKZCvytaWaRGrk+29wxwdNj3pmzmdic=; b=T5iKPTIbIemKrRArEuOkrknzdP
 WGjBlgwRBcggPaNu7+RDyQno903zdUx2c8RuWmlzQtFdwZyZR4mTkAv+xReGUMrzOCscW5LFH/oOS
 +kuqhagQd7dsiKZAmWBNhgDZMUXXZvifS9ESgFIEzzbEpPI7QelN3cEOB6vO8OIkbGgE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nHFVY-008F32-S6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Feb 2022 01:41:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D355B61217
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  8 Feb 2022 01:41:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AB48C004E1;
 Tue,  8 Feb 2022 01:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644284481;
 bh=PG9nKdSqWU1EyxwFEOiE2jtWbEBP0UISJyN0lr1Jgm0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mukdVPz8iz27i3XxSqkquq48InSHqIdLsdRhR5iezeRL045AFH6w96WDUFzJP+IPr
 4LvHUYmFkVrpJHVMO1tV+0BMNX5nOzHyGlS7LlAPbkCmUGE6GfMrrfvN+Gyt0MW2gz
 uAeTL3qumz68uA6fGQ/ysQcUZppseIEPibqUfTupUyxEH+EcPIcPBdbKe2/1Wfn/oJ
 kkd86XF4bAcoGMZ95g9nzDPLV0mIRWRk9KtoWT2QVD8fK4ECtaNkTc5slGRLRugjQT
 nJH07CZIcHdLRDViva9SYxnQcdm4Tts52j2xAoo9ywF4stJEDA8TO3AUfxpQCr62j2
 p+ILdmY+rJFAA==
Message-ID: <917b4044-80ce-cd46-520b-8325a011631f@kernel.org>
Date: Tue, 8 Feb 2022 09:41:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220204091005.49407-1-chao@kernel.org>
 <YgFv85dH0dWFTZBx@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YgFv85dH0dWFTZBx@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/2/8 3:16, Jaegeuk Kim wrote: > On 02/04,
 Chao Yu wrote:
 >> There is potential hangtask happened during swapfile's writeback: >> >>
 - loop_kthread_worker_fn - do_checkpoint >> - kthread_worker_ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nHFVY-008F32-S6
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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

On 2022/2/8 3:16, Jaegeuk Kim wrote:
> On 02/04, Chao Yu wrote:
>> There is potential hangtask happened during swapfile's writeback:
>>
>> - loop_kthread_worker_fn		- do_checkpoint
>>    - kthread_worker_fn
>>     - loop_queue_work
>>      - lo_rw_aio
>>       - f2fs_file_write_iter
>>        - f2fs_preallocate_blocks
>>         - f2fs_map_blocks
>> 					 - down_write
>>          - down_read
>>           - rwsem_down_read_slowpath
>>            - schedule
>>
>> One cause is f2fs_preallocate_blocks() will always be called no matter
>> the physical block addresses are allocated or not.
>>
>> This patch tries to check whether block addresses are all allocated with
>> i_size and i_blocks of inode, it's rough because blocks can be allocated
>> beyond i_size, however, we can afford skipping block preallocation in this
>> condition since it's not necessary to do preallocation all the time.
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - check overwrite case with i_size and i_blocks roughly.
>>   fs/f2fs/file.c | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index cfdc41f87f5d..09565d10611d 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -4390,6 +4390,16 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>>   	int flag;
>>   	int ret;
>>   
>> +	/*
>> +	 * It tries to check whether block addresses are all allocated,
>> +	 * it's rough because blocks can be allocated beyond i_size,
>> +	 * however, we can afford skipping block preallocation since
>> +	 * it's not necessary all the time.
>> +	 */
>> +	if (F2FS_BLK_ALIGN(i_size_read(inode)) ==
>> +			SECTOR_TO_BLOCK(inode->i_blocks))
> 
> Do we count i_blocks only for data?

Oops, it seems it's not...

Needs to introduce another function to calculate node block count based on i_size?

Thanks,

> 
>> +		return 0;
>> +
>>   	/* If it will be an out-of-place direct write, don't bother. */
>>   	if (dio && f2fs_lfs_mode(sbi))
>>   		return 0;
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
