Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 779B9967F95
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 08:40:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sl0k5-0007Vk-Tp;
	Mon, 02 Sep 2024 06:40:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sl0k2-0007Vb-3y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 06:40:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j9FITLbKqrH3/hSF4zE7lCFe/xf9LAEPs44BjhxqEFI=; b=BvOXSseB7Q2NEz2hSTobLDf8Pc
 G56Ki8OTb7QvTVDKqhc+97r6OSEHueuSxc6VjtIEKRwVpbxjmRXqpdpVMrJ3zF3KTzcVdM0cZGhzq
 sOC//M+t4VZug9jPyPfESK3VI8i7bfqHfoWfVZA8u2+//sTRqvMX7fAeDaaiZ7RKOLZA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j9FITLbKqrH3/hSF4zE7lCFe/xf9LAEPs44BjhxqEFI=; b=c8FjhbfBz5vFdB10diCCWnhdxY
 +06dVyBSQP4TYLGNFFdDzAd+eyHCZfNrwdNeiEPDfvDYP3MW7GH6x2OiL9wq0aK77Qd6eJGNQ5Mza
 Z4dE4lLiYq0mPuKVw+7GP4AoXlwTtAVC3rLXkWl8VvRSTkH8jGYpu3oJs+MROd3JDXRE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sl0k2-0002OP-1n for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 06:40:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 564405C55FA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 Sep 2024 06:40:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CF75C4CEC2;
 Mon,  2 Sep 2024 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725259235;
 bh=l92+Z4TkBHTdsYUS62K+3LCo79KmnnuNLTIBVaXKZ6U=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IAwB8SNs9kGonJff6htuVbG+RaUf9/DXW8b7Fleg9/WdBbufzaupcS+9VulgDgnXU
 gzG+FgR2N8dAC6adGGQoqN6XQfLZSZ11WM6UQ2Rz2FQo38O7k/jTAcpQlnuVkbvDkb
 HEH+yb5H8rFGgdROEi448pyS60Xjb2xXfUcfEB6prNgRz9ciUjJuHoyPZOPqPZcc4R
 XpquAomVDosd00EEl9PqSgpXUxnuGbAxgEgZ/BALQY3f1iFHnKgTnk5pEao2qPCIsS
 MXpE+hSQILiGSxpgrNutVrqDKGw0nahRKGbmEeaXVMjAqKXVYs0mCJc70NJPLchc5g
 Vfpf3cmSj204g==
Message-ID: <2905d4bf-279c-45f0-a434-b9d47766bbd1@kernel.org>
Date: Mon, 2 Sep 2024 14:40:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240814134815.801303-1-chao@kernel.org>
 <Zs9B6-ocRysmPOKD@google.com>
Content-Language: en-US
In-Reply-To: <Zs9B6-ocRysmPOKD@google.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/28 23:27, Jaegeuk Kim wrote: > On 08/14, Chao Yu
 wrote: >> SQLite App GC Thread Shrinker >> - f2fs_ioc_start_atomic_write
 >> >> - f2fs_ioc_commit_atomic_write >> - f2fs_commit_atomic_write > [...]
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sl0k2-0002OP-1n
Subject: Re: [f2fs-dev] [PATCH v2 2/4] f2fs: atomic: fix to not allow GC to
 pollute atomic_file
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/28 23:27, Jaegeuk Kim wrote:
> On 08/14, Chao Yu wrote:
>> SQLite App			GC Thread	Shrinker
>> - f2fs_ioc_start_atomic_write
>>
>> - f2fs_ioc_commit_atomic_write
>>   - f2fs_commit_atomic_write
>>    - filemap_write_and_wait_range
>>    : write atomic_file's data to cow_inode
>> 						echo 3 > drop_caches
>> 				- f2fs_gc
>> 				 - gc_data_segment
>> 				  - move_data_page
>> 				   - set_page_dirty
>> 				   : it may load data of previous
>> 				     transaction into pagecache.
>>    - f2fs_down_write(&fi->i_gc_rwsem[WRITE])
>>    - __f2fs_commit_atomic_write
>>    - f2fs_up_write(&fi->i_gc_rwsem[WRITE])
>>
>> During committing atomic_file, GC may be triggered to migrate
>> atomic_file's block, so it may contain data of previous transaction
>> in page cache, we should drop atomic_file's cache once it was
>> migrated by GC.
>>
>> And also, we should writeback atomic_file and cow_file's data
>> w/ i_gc_rwsem lock held, in order to avoid block address change
>> during __f2fs_commit_atomic_write().
>>
>> Meahwhile, this patch adds f2fs_wait_on_block_writeback_range()
>> to wait completion of block migration.
>>
>> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>> v2:
>> - fix error path handling.
>>   fs/f2fs/segment.c | 27 +++++++++++++++++++++++----
>>   1 file changed, 23 insertions(+), 4 deletions(-)
>>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 3aee71c9f3c6..a43054ab0cf1 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -236,6 +236,9 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
>>   		return err;
>>   	}
>>   
>> +	if (__is_valid_data_blkaddr(dn.data_blkaddr))
>> +		f2fs_wait_on_block_writeback_range(inode, dn.data_blkaddr, 1);
>> +
>>   	if (recover) {
>>   		/* dn.data_blkaddr is always valid */
>>   		if (!__is_valid_data_blkaddr(new_addr)) {
>> @@ -339,6 +342,9 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>>   				goto out;
>>   			}
>>   
>> +			f2fs_wait_on_block_writeback_range(cow_inode,
>> +								blkaddr, 1);
>> +
>>   			new = f2fs_kmem_cache_alloc(revoke_entry_slab, GFP_NOFS,
>>   							true, NULL);
>>   
>> @@ -379,16 +385,29 @@ int f2fs_commit_atomic_write(struct inode *inode)
>>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>>   	int err;
>>   
>> +	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>> +
>>   	err = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
>>   	if (err)
>> -		return err;
>> +		goto out;
>>   
>> -	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
>> -	f2fs_lock_op(sbi);
>> +	/* writeback GCing page of cow_inode */
>> +	err = filemap_write_and_wait_range(fi->cow_inode->i_mapping,
>> +							0, LLONG_MAX);
>> +	if (err)
>> +		goto out;
>>   
>> -	err = __f2fs_commit_atomic_write(inode);
>> +	filemap_invalidate_lock(inode->i_mapping);
>> +
>> +	/* don't allow clean page loaded by GC to pollute atomic_file */
>> +	truncate_pagecache(inode, 0);
> 
> Performance impact?

Please drop this patch due to commit b40a2b003709 (f2fs: use meta inode for
GC of atomic file) has fixed this issue. Thanks.

Thanks,

> 
>>   
>> +	f2fs_lock_op(sbi);
>> +	err = __f2fs_commit_atomic_write(inode);
>>   	f2fs_unlock_op(sbi);
>> +
>> +	filemap_invalidate_unlock(inode->i_mapping);
>> +out:
>>   	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>   
>>   	return err;
>> -- 
>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
