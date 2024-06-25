Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D17E915B85
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 03:14:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLuli-00019Q-Qy;
	Tue, 25 Jun 2024 01:14:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sLulh-00019A-4U
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 01:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sATDNmcmGDNQ1n2laPas1zAQn3ALoKaqNNCgSdZxbfo=; b=kzW55GRN7hxm6RIty74SPoqkM5
 kXn9dgG1Qz2JpvC9MMxg5EFayZ959BeW9Q8CqiBN/aJo/0or1wTytDYzUdv/xl4TwBF6IyPrZ786E
 jPGE0OPRJ+yurCK7GeZICCW2//NgsIA/Ir1VxVLtzwytrHGKDBTicHE0eHvEeP4dwsg0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sATDNmcmGDNQ1n2laPas1zAQn3ALoKaqNNCgSdZxbfo=; b=OueKU0tTBU8Xsa0nVXr9ZWibK1
 GJRhZSTqo0adpn2eSO//xcs+nm6LO0PZS5AbZSQDWvD+y/qGRZpopWA7h0R7OpKWhl6wr/Ae06HjY
 KKJlwOeIeKB93/pSRPSt+J0178RBX6BAzV63pooARumM0XRkQVb5RdjsXVUZGYpi+uKw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLulh-0004hw-49 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 01:14:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7E8A5CE0225;
 Tue, 25 Jun 2024 01:14:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE13C2BBFC;
 Tue, 25 Jun 2024 01:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719278076;
 bh=zue60nLKRM9hqp7Y2+yqVUlGb8bESpFQm08i1f8AibQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=QXtQsr1KkNNyPrUujsETwUHpG/tBp/hBqa81QZ+o/H6RXq4ZDGaNYr6cHY3eoobWm
 JYwdrLrfDKD6+V8B5TwnFbH3i19QbMRerWrbTSunDCGP8bKsUDmu4ijtk4JE36TZa2
 NCDUCYO5glFDw9PTI68qqCazP+RO81st6ABlpOgRC3PA5v1ddfai/7FxVGsvRgHP4+
 aLsknnM6fYyE3Mg+usUCrDyKG13a4pBD3mf8IHhuGkK4EJUg0AKd5aL7ORsT9m6ASZ
 SX2O3o8lv20VRJI5AC4EYg2bc+fIoNFqWr1OgKM5oYgWT6nrX+b4+QNBKXprqCmFBN
 5lst4wena6yLg==
Message-ID: <f0adf39a-5c07-49bd-910d-eebbc5f41dc1@kernel.org>
Date: Tue, 25 Jun 2024 09:14:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240606095451.4088735-1-chao@kernel.org>
 <ZnmylaqsdF65PVDp@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZnmylaqsdF65PVDp@google.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/6/25 1:53, Jaegeuk Kim wrote: > On 06/06, Chao Yu
 wrote: >> Commit 59c9081bc86e ("f2fs: allow write page cache when writting
 cp") >> allows write() to write data to page cache during checkpoin [...]
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sLulh-0004hw-49
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to update user block counts in
 block_operations()
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

On 2024/6/25 1:53, Jaegeuk Kim wrote:
> On 06/06, Chao Yu wrote:
>> Commit 59c9081bc86e ("f2fs: allow write page cache when writting cp")
>> allows write() to write data to page cache during checkpoint, so block
>> count fields like .total_valid_block_count, .alloc_valid_block_count
>> and .rf_node_block_count may encounter race condition as below:
>>
>> CP				Thread A
>> - write_checkpoint
>>   - block_operations
>>    - f2fs_down_write(&sbi->node_change)
>>    - __prepare_cp_block
>>    : ckpt->valid_block_count = .total_valid_block_count
>>    - f2fs_up_write(&sbi->node_change)
>> 				- write
>> 				 - f2fs_preallocate_blocks
>> 				  - f2fs_map_blocks(,F2FS_GET_BLOCK_PRE_AIO)
>> 				   - f2fs_map_lock
>> 				    - f2fs_down_read(&sbi->node_change)
>> 				   - f2fs_reserve_new_blocks
>> 				    - inc_valid_block_count
>> 				    : percpu_counter_add(&sbi->alloc_valid_block_count, count)
>> 				    : sbi->total_valid_block_count += count
>> 				    - f2fs_up_read(&sbi->node_change)
>>   - do_checkpoint
>>   : sbi->last_valid_block_count = sbi->total_valid_block_count
>>   : percpu_counter_set(&sbi->alloc_valid_block_count, 0)
>>   : percpu_counter_set(&sbi->rf_node_block_count, 0)
>> 				- fsync
>> 				 - need_do_checkpoint
>> 				  - f2fs_space_for_roll_forward
>> 				  : alloc_valid_block_count was reset to zero,
>> 				    so, it may missed last data during checkpoint
>>
>> Let's change to update .total_valid_block_count, .alloc_valid_block_count
>> and .rf_node_block_count in block_operations(), then their access can be
>> protected by .node_change and .cp_rwsem lock, so that it can avoid above
>> race condition.
>>
>> Fixes: 59c9081bc86e ("f2fs: allow write page cache when writting cp")
>> Cc: Yunlei He <heyunlei@oppo.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/checkpoint.c | 11 ++++++-----
>>   1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>> index 66eaad591b60..010bbd5af211 100644
>> --- a/fs/f2fs/checkpoint.c
>> +++ b/fs/f2fs/checkpoint.c
>> @@ -1298,6 +1298,12 @@ static int block_operations(struct f2fs_sb_info *sbi)
>>   	 * dirty node blocks and some checkpoint values by block allocation.
>>   	 */
>>   	__prepare_cp_block(sbi);
>> +
>> +	/* update user_block_counts */
>> +	sbi->last_valid_block_count = sbi->total_valid_block_count;
>> +	percpu_counter_set(&sbi->alloc_valid_block_count, 0);
>> +	percpu_counter_set(&sbi->rf_node_block_count, 0);
> 
> Need to add this in __prepare_cp_block()?

Fine to me, will update in v2.

Thanks,

> 
>> +
>>   	f2fs_up_write(&sbi->node_change);
>>   	return err;
>>   }
>> @@ -1575,11 +1581,6 @@ static int do_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
>>   		start_blk += NR_CURSEG_NODE_TYPE;
>>   	}
>>   
>> -	/* update user_block_counts */
>> -	sbi->last_valid_block_count = sbi->total_valid_block_count;
>> -	percpu_counter_set(&sbi->alloc_valid_block_count, 0);
>> -	percpu_counter_set(&sbi->rf_node_block_count, 0);
>> -
>>   	/* Here, we have one bio having CP pack except cp pack 2 page */
>>   	f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_CP_META_IO);
>>   	/* Wait for all dirty meta pages to be submitted for IO */
>> -- 
>> 2.40.1
>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
