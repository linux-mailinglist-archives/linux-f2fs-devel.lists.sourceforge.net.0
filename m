Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C1B45192EE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 02:42:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nm35s-0003o7-Cl; Wed, 04 May 2022 00:42:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nm35q-0003ny-Vv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 00:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CwCxYxdNQuFXcEDg/nLy9xKCWfqT94NFtGKCMlHoxpA=; b=e3fRQAN7gN4mgoeTHfN8PbPv7c
 nblIoz0uxPCKcEXDaI21nEb6ukNConc/x0XSepg0sd1KjrQa9lD2EtkTU+v1kERJhw0nhmGVsiXea
 iOdpixQUZmGWAk0tGPBe8UUwMFaFHO+Z0ub/3mZoG+WxFWkXq1Zl0fnVmrt2NPFjbNY4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CwCxYxdNQuFXcEDg/nLy9xKCWfqT94NFtGKCMlHoxpA=; b=Ma8Kf7ff+IutwpLB+8RN3D38T2
 WWnkHPlCTV7m1oiT0KmUufGoDVzzlPuuovG7cKYyob0WQpAxro56hMqx80JVBVa96lunkJEbOYuab
 0urVX1MYw8A4sBO5uejg27FTS1Ehn/BkYx2u0qfa8FPzx/knrLHsNpS/7dq5rtTyARww=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nm35p-0006s3-0n
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 00:42:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B5FAAB82240;
 Wed,  4 May 2022 00:42:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EABC385A9;
 Wed,  4 May 2022 00:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651624925;
 bh=Oc/u/zgywgMiv8iJg6VykHdetVlVhL+ecbN6OsutqQo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wlg+VWQTtR5kCJkOiSnHypHh5ui92B54h5EXQyyX37PVh9zkWdF2ZxZv2tKcIEeS/
 wbC7MGB2lNH0vuxwWdILCYfI9bGMFQl8yPyAky6gtZQlkRG1bvi4e2ldacA4n8iDzy
 XEquwHCMwPPCyN9ZlwD0kkdouQaxdrUA4+fAKxFCDWN12t9ccJfoJ124YrwxL08Fj0
 zv02mbQuts4AAYOT9F1qH05Cu32AV7AQEd/xCVFb0TrW0rYky/Sls4dqBeHSTyxQ3Q
 RrjxGRLOvs8pujuQIJ3mTqiLqvWvapn6+53mF2F36xqeT+6Ufb334o2TxnULYy8Uga
 I8eTgOdAiVOcg==
Message-ID: <5a3472bb-c024-e78b-adae-7f4ce8bf921b@kernel.org>
Date: Wed, 4 May 2022 08:42:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220429144456.22232-1-chao@kernel.org>
 <YnGi9va0RW/vcwXi@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YnGi9va0RW/vcwXi@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/4 5:47, Jaegeuk Kim wrote: > On 04/29,
 Chao Yu wrote: >> As Yanming reported in bugzilla: >> >>
 https://bugzilla.kernel.org/show_bug.cgi?id=215916
 >> >> The kernel message is shown below: >> [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nm35p-0006s3-0n
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check on
 total_data_blocks
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
Cc: Ming Yan <yanming@tju.edu.cn>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 2022/5/4 5:47, Jaegeuk Kim wrote:
> On 04/29, Chao Yu wrote:
>> As Yanming reported in bugzilla:
>>
>> https://bugzilla.kernel.org/show_bug.cgi?id=215916
>>
>> The kernel message is shown below:
>>
>> kernel BUG at fs/f2fs/segment.c:2560!
>> Call Trace:
>>   allocate_segment_by_default+0x228/0x440
>>   f2fs_allocate_data_block+0x13d1/0x31f0
>>   do_write_page+0x18d/0x710
>>   f2fs_outplace_write_data+0x151/0x250
>>   f2fs_do_write_data_page+0xef9/0x1980
>>   move_data_page+0x6af/0xbc0
>>   do_garbage_collect+0x312f/0x46f0
>>   f2fs_gc+0x6b0/0x3bc0
>>   f2fs_balance_fs+0x921/0x2260
>>   f2fs_write_single_data_page+0x16be/0x2370
>>   f2fs_write_cache_pages+0x428/0xd00
>>   f2fs_write_data_pages+0x96e/0xd50
>>   do_writepages+0x168/0x550
>>   __writeback_single_inode+0x9f/0x870
>>   writeback_sb_inodes+0x47d/0xb20
>>   __writeback_inodes_wb+0xb2/0x200
>>   wb_writeback+0x4bd/0x660
>>   wb_workfn+0x5f3/0xab0
>>   process_one_work+0x79f/0x13e0
>>   worker_thread+0x89/0xf60
>>   kthread+0x26a/0x300
>>   ret_from_fork+0x22/0x30
>> RIP: 0010:new_curseg+0xe8d/0x15f0
>>
>> The root cause is: ckpt.valid_block_count is inconsistent with SIT table,
>> stat info indicates filesystem has free blocks, but SIT table indicates
>> filesystem has no free segment.
>>
>> So that during garbage colloection, it triggers panic when LFS allocator
>> fails to find free segment.
>>
>> This patch tries to fix this issue by checking consistency in between
>> ckpt.valid_block_count and block accounted from SIT.
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Ming Yan <yanming@tju.edu.cn>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>>   fs/f2fs/segment.c | 24 +++++++++++++++++++++---
>>   1 file changed, 21 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 8c17fed8987e..eddaf3b45b25 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -4462,6 +4462,7 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>>   	unsigned int readed, start_blk = 0;
>>   	int err = 0;
>>   	block_t total_node_blocks = 0;
>> +	block_t total_data_blocks = 0;
>>   
>>   	do {
>>   		readed = f2fs_ra_meta_pages(sbi, start_blk, BIO_MAX_VECS,
>> @@ -4488,6 +4489,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>>   			seg_info_from_raw_sit(se, &sit);
>>   			if (IS_NODESEG(se->type))
>>   				total_node_blocks += se->valid_blocks;
>> +			else
>> +				total_data_blocks += se->valid_blocks;
>>   
>>   			if (f2fs_block_unit_discard(sbi)) {
>>   				/* build discard map only one time */
>> @@ -4529,6 +4532,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>>   		old_valid_blocks = se->valid_blocks;
>>   		if (IS_NODESEG(se->type))
>>   			total_node_blocks -= old_valid_blocks;
>> +		else
>> +			total_data_blocks -= old_valid_blocks;
>>   
>>   		err = check_block_count(sbi, start, &sit);
>>   		if (err)
>> @@ -4536,6 +4541,8 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>>   		seg_info_from_raw_sit(se, &sit);
>>   		if (IS_NODESEG(se->type))
>>   			total_node_blocks += se->valid_blocks;
>> +		else
>> +			total_data_blocks += se->valid_blocks;
>>   
>>   		if (f2fs_block_unit_discard(sbi)) {
>>   			if (is_set_ckpt_flags(sbi, CP_TRIMMED_FLAG)) {
>> @@ -4557,13 +4564,24 @@ static int build_sit_entries(struct f2fs_sb_info *sbi)
>>   	}
>>   	up_read(&curseg->journal_rwsem);
>>   
>> -	if (!err && total_node_blocks != valid_node_count(sbi)) {
>> +	if (err)
>> +		return err;
>> +
>> +	if (total_node_blocks != valid_node_count(sbi)) {
>>   		f2fs_err(sbi, "SIT is corrupted node# %u vs %u",
>>   			 total_node_blocks, valid_node_count(sbi));
>> -		err = -EFSCORRUPTED;
>> +		return -EFSCORRUPTED;
>>   	}
>>   
>> -	return err;
>> +	if (total_data_blocks + total_node_blocks !=
>> +				valid_user_blocks(sbi)) {
>> +		f2fs_err(sbi, "SIT is corrupted data# %u vs %u",
>> +			 total_data_blocks,
>> +			 valid_user_blocks(sbi) - total_node_blocks);
> 
> This doesn't work, since some NEW_ADDR is not counted from SIT.

Yup, so how about updating check condition as below? it means image
may be corrupted if blocks counted from SIT is more than the one counted
from CKPT.

if (total_data_blocks + total_node_blocks >
			valid_user_blocks(sbi))

Thanks,

> 
>> +		return -EFSCORRUPTED;
>> +	}
>> +
>> +	return 0;
>>   }
>>   
>>   static void init_free_segmap(struct f2fs_sb_info *sbi)
>> -- 
>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
