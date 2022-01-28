Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D24449F0A3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jan 2022 02:43:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDGIf-0000L5-IU; Fri, 28 Jan 2022 01:43:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nDGId-0000Kz-G1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 01:43:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4VRZAMeotHYSmmx9nIiyPGhqFravo8ExEaA0AyLmASo=; b=KGI/TpQbwji4CnUpXD95ZKEcA/
 X+/PvapGSNoY1zc4bp9DgaOix3/Erznw72vMdhzT32sx3GUt/Ad+mpxeeG0k2P1J5f8KfXNs54YNS
 ZCbH3qoInwG7TSghsyUP5jxIUrYLlB7E8ZTbUY31WfhTMxbJ0XgjmuQOYjnkW9CObXHY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4VRZAMeotHYSmmx9nIiyPGhqFravo8ExEaA0AyLmASo=; b=TI9LhTNIirk4yE8E38zgQYKbhh
 BvLdJRRRGKQQbcgV4fdnIGLQbsQaYTGriM4cSGj+mSGAmOWlRXSnImLVZX9LCNPCji7h1r7zBr8n+
 kCJEJqmERuxlrVdSgtLrOGxZJan5hbsvwbTGSaYur4zelgpcwAprvNL5qMaO3XtQVeis=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDGIb-00HRBK-6k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 01:43:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D26A961DB9;
 Fri, 28 Jan 2022 01:43:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5EE5C340E5;
 Fri, 28 Jan 2022 01:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643334211;
 bh=TkowqnMfrmwTAcJsGdAvnwq3afg44JpFf1XwkrSPxKo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=hk6QOu3rIsQHhDpi2BCWY+cWfyR/YNeg4e14onaDxvIPcbSf2AGlf6qAnUhxUskl2
 1iIsNbwPzfnA/Ttdlirbmi3GsOJdNzX7LuUfl88RP6Sq7tn2yQpQZDJ4SBijNbAmU3
 IK3JxXuC997DZTyXuJRHX0S+0aA2EYth82qNVwAOjQj44AZSiNXG2LoDiXUl8vg9Sp
 YotnMNzAgoaTGyed/vkSusyudJwKrdsNx+4K9MfN+2m6LDwlTSthZZHj2WDNsjTrQ+
 +cL1+ehElCCAzQYHLYZ/hiM7XIqKT7VUWB3T+tGAU++CQqPVBfIAfwluMRpSMsojwF
 gIEn1fqnm5ZLA==
Message-ID: <e434b0a4-a66a-eebc-cafc-f0bad03c3fa5@kernel.org>
Date: Fri, 28 Jan 2022 09:43:27 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220127054449.24711-1-chao@kernel.org>
 <YfMVxzdhat01ca7m@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YfMVxzdhat01ca7m@google.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/1/28 5:59, Jaegeuk Kim wrote: > On 01/27, Chao Yu
 wrote: >> Quoted from Jing Xia's report, there is a potential deadlock may
 happen >> between kworker and checkpoint as below: >> >> [T:writeba [...]
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nDGIb-00HRBK-6k
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: Jing Xia <jing.xia@unisoc.com>, Zhiguo Niu <zhiguo.niu@unisoc.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/1/28 5:59, Jaegeuk Kim wrote:
> On 01/27, Chao Yu wrote:
>> Quoted from Jing Xia's report, there is a potential deadlock may happen
>> between kworker and checkpoint as below:
>>
>> [T:writeback]				[T:checkpoint]
>> - wb_writeback
>>   - blk_start_plug
>> bio contains NodeA was plugged in writeback threads
> 
> I'm still trying to understand more precisely. So, how is it possible to
> have bio having node write in this current context?

IMO, after above blk_start_plug(), it may plug some inode's node page in kworker
during writebacking node_inode's data page (which should be node page)?

Thanks,

> 
>> 					- do_writepages  -- sync write inodeB, inc wb_sync_req[DATA]
>> 					 - f2fs_write_data_pages
>> 					  - f2fs_write_single_data_page -- write last dirty page
>> 					   - f2fs_do_write_data_page
>> 					    - set_page_writeback  -- clear page dirty flag and
>> 					    PAGECACHE_TAG_DIRTY tag in radix tree
>> 					    - f2fs_outplace_write_data
>> 					     - f2fs_update_data_blkaddr
>> 					      - f2fs_wait_on_page_writeback -- wait NodeA to writeback here
>> 					   - inode_dec_dirty_pages
>>   - writeback_sb_inodes
>>    - writeback_single_inode
>>     - do_writepages
>>      - f2fs_write_data_pages -- skip writepages due to wb_sync_req[DATA]
>>       - wbc->pages_skipped += get_dirty_pages() -- PAGECACHE_TAG_DIRTY is not set but get_dirty_pages() returns one
>>    - requeue_inode -- requeue inode to wb->b_dirty queue due to non-zero.pages_skipped
>>   - blk_finish_plug
>>
>> Let's try to avoid deadlock condition by forcing unplugging previous bio via
>> blk_finish_plug(current->plug) once we'v skipped writeback in writepages()
>> due to valid sbi->wb_sync_req[DATA/NODE].
>>
>> Fixes: 687de7f1010c ("f2fs: avoid IO split due to mixed WB_SYNC_ALL and WB_SYNC_NONE")
>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>> Signed-off-by: Jing Xia <jing.xia@unisoc.com>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/data.c | 6 +++++-
>>   fs/f2fs/node.c | 6 +++++-
>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>> index 76d6fe7b0c8f..932a4c81acaf 100644
>> --- a/fs/f2fs/data.c
>> +++ b/fs/f2fs/data.c
>> @@ -3174,8 +3174,12 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>   	/* to avoid spliting IOs due to mixed WB_SYNC_ALL and WB_SYNC_NONE */
>>   	if (wbc->sync_mode == WB_SYNC_ALL)
>>   		atomic_inc(&sbi->wb_sync_req[DATA]);
>> -	else if (atomic_read(&sbi->wb_sync_req[DATA]))
>> +	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
>> +		/* to avoid potential deadlock */
>> +		if (current->plug)
>> +			blk_finish_plug(current->plug);
>>   		goto skip_write;
>> +	}
>>   
>>   	if (__should_serialize_io(inode, wbc)) {
>>   		mutex_lock(&sbi->writepages);
>> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
>> index 556fcd8457f3..69c6bcaf5aae 100644
>> --- a/fs/f2fs/node.c
>> +++ b/fs/f2fs/node.c
>> @@ -2106,8 +2106,12 @@ static int f2fs_write_node_pages(struct address_space *mapping,
>>   
>>   	if (wbc->sync_mode == WB_SYNC_ALL)
>>   		atomic_inc(&sbi->wb_sync_req[NODE]);
>> -	else if (atomic_read(&sbi->wb_sync_req[NODE]))
>> +	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
>> +		/* to avoid potential deadlock */
>> +		if (current->plug)
>> +			blk_finish_plug(current->plug);
>>   		goto skip_write;
>> +	}
>>   
>>   	trace_f2fs_writepages(mapping->host, wbc, NODE);
>>   
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
