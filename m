Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E292593CC38
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Jul 2024 03:06:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sX9Ph-0001o6-9X;
	Fri, 26 Jul 2024 01:06:29 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sX9Pg-0001nt-5Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:06:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VU1NPrfKn7i7SiTOaNPUK2o3rDx2RqriGNi7EgCS7+8=; b=YEoCtyJ1tgwljhwx8f3v8xwMWu
 KLm11x0dOcdZR6ryc6YOlJ8EGh0rt+7qya/mJAVseihYnHyG7mSotTR8eifsXMUSoh4SO+5yjhV7g
 x29E4F6lcgpMx0N+FEsFGR9J/dNsju25YJt3CRTCM4ahQThCOvPbyDUQaVlks8ruDP1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VU1NPrfKn7i7SiTOaNPUK2o3rDx2RqriGNi7EgCS7+8=; b=J3EkmD6sEINjwIeITWgxXWPsxc
 wmjyY8EbM5McVw/BzigvNdpZRyIa98thQFpMYmMy1wQrawBAApu+/sSvEBRSnP5tQt4FBUral4Y4c
 uKJy68pkmp+I/tQGMmRh2afuyD2eh05qkpZlnC7BTO26vvReA0mz0tiscH+z52/XWh5U=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sX9Pe-0002eE-Kd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Jul 2024 01:06:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id DF6BFCE127D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 26 Jul 2024 01:06:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8179AC116B1;
 Fri, 26 Jul 2024 01:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1721955974;
 bh=sYVnj9xdCeSe7R1pi1xns6VDN4e1inwVA9ogtzZ53cg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Wix3Zta330LmeX96By18flpG7LgZ+hqzOtE76omRc1r0xBVRILfy5GvD9liqDv1Xs
 7hETGZqsOS/+tp2nWRnwkQN9LqYVSawLWIHy5TSkerYSbtZkTE2hOhRMkLiWWBaxJU
 ZwMNYh9njjmI/UxXuHD02lxBYrJ3Lut5SR1kmmrhojommpPCBcGchwLPh39jmwWN5m
 yusQK2bcjG4P7x9z/ZlIiPIUd70Hz5NmywKtBf5UWCiAowhxoxkTforkCtPPLdDczz
 DxHHTOjIF9Dsjz5ArV88cke9ocoJU7tbhmHj5G58/FEdjgmxasFQb1IoGkMfP9Ft5c
 rVX4IPzZ1GG6g==
Message-ID: <c2b7d0cd-ea10-4e25-829c-53967927bd03@kernel.org>
Date: Fri, 26 Jul 2024 09:06:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240712073415.227226-1-chao@kernel.org>
 <ZqKDnpzwX85RyGaa@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZqKDnpzwX85RyGaa@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/26 0:55, Jaegeuk Kim wrote: > On 07/12, Chao Yu
 wrote: >> All directory blocks are within the scope of i_size, so let's limit
 >> the end_block to just check valid dirent blocks. > > Do we re [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [145.40.73.55 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sX9Pe-0002eE-Kd
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't traverse directory blocks after
 EOF
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

On 2024/7/26 0:55, Jaegeuk Kim wrote:
> On 07/12, Chao Yu wrote:
>> All directory blocks are within the scope of i_size, so let's limit
>> the end_block to just check valid dirent blocks.
> 
> Do we really need this?

f2fs_readdir() and f2fs_empty_dir() uses dir_blocks() for upper boundary,
this patch aligns find_in_level() w/ them.

Also, it can avoid grabbing never used page cache across EOF.

So, we can consider taking this patch?

Thanks,

> 
>>
>> Meanwhile, it uses dir_blocks() instead of variable for cleanup in
>> __f2fs_find_entry().
>>
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/dir.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
>> index 02c9355176d3..d4591c215f07 100644
>> --- a/fs/f2fs/dir.c
>> +++ b/fs/f2fs/dir.c
>> @@ -305,18 +305,21 @@ static struct f2fs_dir_entry *find_in_level(struct inode *dir,
>>   	int s = GET_DENTRY_SLOTS(fname->disk_name.len);
>>   	unsigned int nbucket, nblock;
>>   	unsigned int bidx, end_block;
>> +	unsigned long last_block;
>>   	struct page *dentry_page;
>>   	struct f2fs_dir_entry *de = NULL;
>>   	pgoff_t next_pgofs;
>>   	bool room = false;
>>   	int max_slots;
>>   
>> +	last_block = dir_blocks(dir);
>>   	nbucket = dir_buckets(level, F2FS_I(dir)->i_dir_level);
>>   	nblock = bucket_blocks(level);
>>   
>>   	bidx = dir_block_index(level, F2FS_I(dir)->i_dir_level,
>>   			       le32_to_cpu(fname->hash) % nbucket);
>>   	end_block = bidx + nblock;
>> +	end_block = min_t(unsigned int, end_block, last_block);
>>   
>>   	while (bidx < end_block) {
>>   		/* no need to allocate new dentry pages to all the indices */
>> @@ -361,7 +364,6 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>>   					 const struct f2fs_filename *fname,
>>   					 struct page **res_page)
>>   {
>> -	unsigned long npages = dir_blocks(dir);
>>   	struct f2fs_dir_entry *de = NULL;
>>   	unsigned int max_depth;
>>   	unsigned int level;
>> @@ -373,7 +375,7 @@ struct f2fs_dir_entry *__f2fs_find_entry(struct inode *dir,
>>   		goto out;
>>   	}
>>   
>> -	if (npages == 0)
>> +	if (dir_blocks(dir) == 0)
>>   		goto out;
>>   
>>   	max_depth = F2FS_I(dir)->i_current_depth;
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
