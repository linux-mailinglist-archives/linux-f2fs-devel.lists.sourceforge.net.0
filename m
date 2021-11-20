Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2377457A80
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 20 Nov 2021 02:50:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1moFWY-0004E9-Li; Sat, 20 Nov 2021 01:50:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1moFWX-0004E3-0k
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Nov 2021 01:50:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ux/q4gI4bwIFtBAIth6bV+Fzb3qk4MfImdBb+vwRzXQ=; b=MWQzJXjhosPJ2qVkReQ6sWrjTA
 1orUne0gIVbQejL/pS3mthNGsQgDsfpfFAo9mejECU3/sZCb4zU8j4TufIQJft+XzsG9hoDIo+MIK
 eNuxmDTCe5b3k5nDWQ22elE3sKI0+CuLDGyAn4lHFPbTeYMcDXRFh0ttrM4opEHQACsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ux/q4gI4bwIFtBAIth6bV+Fzb3qk4MfImdBb+vwRzXQ=; b=DtbOmmc1Lg9YJgI0GETLMbVk3W
 JJMvaIz5EVUTdEuaUNaSMuLkYGoBx18jVzdZS4S/Ox5mj2+4LasCrJKw3vEBI8AQoHTKYFFr5mbL5
 ub//tjxBg5UtdHWZgXGMHtUvDd4cB959wudnFbOGj++uzSDTl8/QfkFKUSJKqztJQ/Dk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1moFWT-0005Pg-U7
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 20 Nov 2021 01:50:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 79BB461A0C;
 Sat, 20 Nov 2021 01:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637373023;
 bh=NZYXCV1BI/2RMkIqg8C/D/wVdEb/oaBH9ZNmJzBtqg4=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=b9FRBUpIY1y9t1s+OOBwN+XMB4X3wtnkEP/NATXcl39WBk3mW1wPeYC22H5Yp3ojP
 0LVezwSMlFnDljNCQl+WvxxgcB2aVUHlO7eOZtvbZKb2Xsp/oj+OKlxLQQfsR6TvN2
 +ArfDE8Wn+35hQmjBRmkZAH6qiq4ST566a65JRlo/vMTn84wHL6PismdlQIYI6lBID
 7g+X7EWU0o23O1r9R/sKxtYOe0UQZyyPZGNwPHKz1KCvOW6olEshthG9ecI+qMpH+S
 3NHM1zukaa9Jnxhk/mQock4YWtIGrfX3qb3UAn/J1kvWRXZs+UJ7LJthVnmz/KNvzK
 UjkyJgnxhSf8w==
Message-ID: <e25053e9-f97e-6a2f-3bac-acfcd689fdcb@kernel.org>
Date: Sat, 20 Nov 2021 09:50:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, niuzhiguo84@gmail.com
References: <1636438608-27597-1-git-send-email-niuzhiguo84@gmail.com>
 <YZU0TFBH6k2Q6fJZ@google.com>
 <e28d4963-d816-b568-dec8-60a79a9fe88d@kernel.org>
In-Reply-To: <e28d4963-d816-b568-dec8-60a79a9fe88d@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/11/18 14:46, Chao Yu wrote: > On 2021/11/18 0:56,
 Jaegeuk Kim wrote: >> On 11/09, niuzhiguo84@gmail.com wrote: >>> From: Zhiguo
 Niu <zhiguo.niu@unisoc.com> >>> >>> There could be a scenario as [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1moFWT-0005Pg-U7
Subject: Re: [f2fs-dev] [PATCH Vx 1/1] f2fs: Avoid deadlock between
 writeback and checkpoint
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
Cc: Jing.Xia@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/11/18 14:46, Chao Yu wrote:
> On 2021/11/18 0:56, Jaegeuk Kim wrote:
>> On 11/09, niuzhiguo84@gmail.com wrote:
>>> From: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>>
>>> There could be a scenario as following:
>>> The inodeA and inodeB are in b_io queue of writeback
>>> inodeA : f2fs's node inode
>>> inodeB : a dir inode with only one dirty pages, and the node page
>>> of inodeB cached into inodeA
>>>
>>> writeback:
>>>
>>> wb_workfn
>>> wb_writeback
>>> blk_start_plug
>>>           loop {
>>>           queue_io
>>>           progress=__writeback_inodes_wb
>>>                   __writeback_single_inode
>>>                           do_writepages
>>>                                   f2fs_write_data_pages
>>>                                   wbc->pages_skipped +=get_dirty_pages
>>>                           inode->i_state &= ~dirty
>>>                   wrote++
>>>                   requeue_inode
>>>           }
>>> blk_finish_plug
>>>
>>> checkpoint:
>>>
>>> f2fs_write_checkpoint
>>> f2fs_sync_dirty_inodes
>>> filemap_fdatawrite
>>> do_writepages
>>> f2fs_write_data_pages
>>>           f2fs_write_single_data_page
>>>                   f2fs_do_write_data_page
>>>                           set_page_writeback
>>>                           f2fs_outplace_write_data
>>>                                   f2fs_update_data_blkaddr
>>>                                           f2fs_wait_on_page_writeback
>>>                   inode_dec_dirty_pages
>>>
>>> 1. Writeback thread flush inodeA, and push it's bio request in task's plug;
>>> 2. Checkpoint thread writes inodeB's dirty page, and then wait its node
>>>       page writeback cached into inodeA which is in writeback task's plug
>>> 3. Writeback thread flush inodeB and skip writing the dirty page as
>>>       wb_sync_req[DATA] > 0.
>>> 4. As none of the inodeB's page is marked as PAGECACHE_TAG_DIRTY, writeback
>>>       thread clear inodeB's dirty state.
>>> 5. Then inodeB is moved from b_io to b_dirty because of pages_skipped > 0
>>>       as checkpoint thread is stuck before dec dirty_pages.
>>>
>>> This patch collect correct pages_skipped according to the tag state in
>>> page tree of inode
>>>
>>> Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
>>> Signed-off-by: Jing Xia <jing.xia@unisoc.com>
>>> ---
>>>    fs/f2fs/data.c | 4 +++-
>>>    1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
>>> index f4fd6c246c9a..e98628e3868c 100644
>>> --- a/fs/f2fs/data.c
>>> +++ b/fs/f2fs/data.c
>>> @@ -3237,7 +3237,9 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
>>>    	return ret;
>>>    
>>>    skip_write:
>>> -	wbc->pages_skipped += get_dirty_pages(inode);
>>> +	wbc->pages_skipped +=
>>> +		mapping_tagged(inode->i_mapping, PAGECACHE_TAG_DIRTY) ?
>>
>> Is there any race condition to get 0, if there's any dirty page? IOWs, it
> 
> Quoted from Jing Xia's explanation:
> 
> [T:writeback]				[T:checkpoint]

My bad, [1] should be here:

bio contains NodeA was plugged in writeback threads

Thanks,

> 					- do_writepages  -- sync write inodeB, inc wb_sync_req[DATA]
> 					 - f2fs_write_data_pages
> 					  - f2fs_write_single_data_page -- write last dirty page
> 					   - f2fs_do_write_data_page
> 					    - set_page_writeback  -- clear page dirty flag and
> 					    PAGECACHE_TAG_DIRTY tag in radix tree
> 					    - f2fs_outplace_write_data
> 					     - f2fs_update_data_blkaddr
> 					      - f2fs_wait_on_page_writeback -- wait NodeA to writeback here
> 					   - inode_dec_dirty_pages

> bio contains NodeA was plugged in writeback threads

[1]

Thanks,

> - writeback_sb_inodes
>    - writeback_single_inode
>     - do_writepages
>      - f2fs_write_data_pages -- skip writepages due to wb_sync_req[DATA]
>       - wbc->pages_skipped += get_dirty_pages() -- PAGECACHE_TAG_DIRTY is not set but get_dirty_pages() returns one
>    - requeue_inode -- requeue inode to wb->b_dirty queue due to non-zero.pages_skipped
> 
>> seems the current condition is just requeuing the inode as dirty, but next
>> flushing time will remove it from dirty list. Is this giving too much overheads?
> 
> I prefer to let writeback thread call blk_flush_plug() after skipping
> writepages() due to wb_sync_req[DATA/NODE] check condition, thoughts?
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9f754aaef558..b6e1ed73f8f5 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3087,6 +3087,8 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
>    			/* give a priority to WB_SYNC threads */
>    			if (atomic_read(&sbi->wb_sync_req[DATA]) &&
>    					wbc->sync_mode == WB_SYNC_NONE) {
> +				if (current->plug)
> +					blk_flush_plug(current->plug, false);
>    				done = 1;
>    				break;
>    			}
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 556fcd8457f3..dd9a817d8dab 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1946,6 +1946,8 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>    			if (atomic_read(&sbi->wb_sync_req[NODE]) &&
>    					wbc->sync_mode == WB_SYNC_NONE) {
>    				done = 1;
> +				if (current->plug)
> +					blk_flush_plug(current->plug, false);
>    				break;
>    			}
> 
> 
> 
> Thanks,
> 
>>
>>> +		get_dirty_pages(inode) : 0;
>>>    	trace_f2fs_writepages(mapping->host, wbc, DATA);
>>>    	return 0;
>>>    }
>>> -- 
>>> 2.28.0
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
