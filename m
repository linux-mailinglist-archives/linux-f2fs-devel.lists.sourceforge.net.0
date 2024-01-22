Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 867E2835958
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jan 2024 03:26:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rRk0q-000246-Ad;
	Mon, 22 Jan 2024 02:26:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rRk0o-000240-Ok
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 02:26:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XHq4fjBRv1j3e5tQNHRHzvXZwBnhtOTMOlrPbNMUjKM=; b=LJG37fuzpqHmlSrWtOWFND3rF+
 zpfefXvrT6m3NftBghxH365r+RutqakOlyRew6CxL+Z5/SnXEzzDVRg+BlXAbzrbig5XFYGdS0+7y
 EwNiyIZqcincZJlEZ4ftKLnxE8bBHXS9odEX3xAa7Z/kj0UWfVn9doT2ao1KqvYy+pbU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XHq4fjBRv1j3e5tQNHRHzvXZwBnhtOTMOlrPbNMUjKM=; b=GRou7x6EmWyx4p9dq4YB9oXi3X
 GSDn4SswDEvV859vrRI/rnosw58jpcfi0EdtrQxlsxD/2ImxWKcWbSHzmAefKl6bcO9YhOVNs5Ffs
 agjY04aaQspx89/+4LhAfLKHifbZG4nwpdqKeJ5gp3lkpRum81LPF6E0/STJMNjKvfcQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rRk0j-0005mR-KY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 Jan 2024 02:26:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id E8460B80B50
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 22 Jan 2024 02:25:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5708BC433C7;
 Mon, 22 Jan 2024 02:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705890354;
 bh=pqWOr9OHT2JahfiJ6SPNOeiDvCjj5v7HglRe9H85FMM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NfhM1ujm7lZG5xqfp+dzY2VVZcmA1iatFM7qmPT00b2v09nGPD74+smS4rFECCVjU
 7CXGGKHeb8JjjCeJQWodxgI9NTYOHasTY2/0c6vulNoq0eQN2OKZBvtDchldWIJwVy
 6pBpjOIn+I1sFvHkFqTeMG3Z49hJpYlPufCu/63SIN6HVT4BjC1C6k+IEiUAOV5dMl
 FKNxPlIS8PFxigtYhRrZS73Wcy0CgyfMX3u81ypVFnqXnWY5kKUkpfdr8Slu3oi1s2
 wueqVMQQ2MSvufG82v72IRE2qQHLnZlZgnSwMR1PoEV+uSyGtHx2/hz8KSF9p/Y7n/
 EpLr0tJa9a8pA==
Message-ID: <e8e44b18-26da-47d0-85fd-ab8c35006f65@kernel.org>
Date: Mon, 22 Jan 2024 10:25:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240111064406.2970205-1-chao@kernel.org>
 <ZabLA4EWNzNFGb5Q@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZabLA4EWNzNFGb5Q@google.com>
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/1/17 2:29, Jaegeuk Kim wrote: > On 01/11, Chao Yu
 wrote: >> - f2fs_disable_compressed_file >> - check inode_has_data >> -
 f2fs_file_mmap
 >> - mkwrite >> - f2fs_get_block_locked >> : update met [...] 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rRk0j-0005mR-KY
Subject: Re: [f2fs-dev] [PATCH] f2fs: compress: fix to cover
 f2fs_disable_compressed_file() w/ i_sem
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

On 2024/1/17 2:29, Jaegeuk Kim wrote:
> On 01/11, Chao Yu wrote:
>> - f2fs_disable_compressed_file
>>    - check inode_has_data
>> 					- f2fs_file_mmap
>> 					- mkwrite
>> 					 - f2fs_get_block_locked
>> 					 : update metadata in compressed
>> 					   inode's disk layout
>>    - fi->i_flags &= ~F2FS_COMPR_FL
>>    - clear_inode_flag(inode, FI_COMPRESSED_FILE);
>>
>> we should use i_sem lock to prevent above race case.
>>
>> Meanwhile, this patch adds i_size check to restrict compress inode
>> conversion condition.
> 
> Sorry, what was the reason to check i_size?

Oh, I don't see any race condition, let's remove it in v2.

Thanks,

> 
>>
>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>> Signed-off-by: Chao Yu <chao@kernel.org>
>> ---
>>   fs/f2fs/f2fs.h | 18 ++++++++++++++++--
>>   fs/f2fs/file.c |  5 ++---
>>   2 files changed, 18 insertions(+), 5 deletions(-)
>>
>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>> index 74729db0b381..e2e0ca45f881 100644
>> --- a/fs/f2fs/f2fs.h
>> +++ b/fs/f2fs/f2fs.h
>> @@ -4406,19 +4406,33 @@ static inline int set_compress_context(struct inode *inode)
>>   #endif
>>   }
>>   
>> +static inline bool inode_has_data(struct inode *inode)
>> +{
>> +	return (S_ISREG(inode->i_mode) &&
>> +		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
>> +}
>> +
>>   static inline bool f2fs_disable_compressed_file(struct inode *inode)
>>   {
>>   	struct f2fs_inode_info *fi = F2FS_I(inode);
>>   
>> -	if (!f2fs_compressed_file(inode))
>> +	f2fs_down_write(&F2FS_I(inode)->i_sem);
>> +
>> +	if (!f2fs_compressed_file(inode)) {
>> +		f2fs_up_write(&F2FS_I(inode)->i_sem);
>>   		return true;
>> -	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
>> +	}
>> +	if (f2fs_is_mmap_file(inode) || inode_has_data(inode)) {
>> +		f2fs_up_write(&F2FS_I(inode)->i_sem);
>>   		return false;
>> +	}
>>   
>>   	fi->i_flags &= ~F2FS_COMPR_FL;
>>   	stat_dec_compr_inode(inode);
>>   	clear_inode_flag(inode, FI_COMPRESSED_FILE);
>>   	f2fs_mark_inode_dirty_sync(inode, true);
>> +
>> +	f2fs_up_write(&F2FS_I(inode)->i_sem);
>>   	return true;
>>   }
>>   
>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>> index 0e4c871d6aed..5e5df234eb92 100644
>> --- a/fs/f2fs/file.c
>> +++ b/fs/f2fs/file.c
>> @@ -1926,8 +1926,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>   
>>   			f2fs_down_write(&F2FS_I(inode)->i_sem);
>>   			if (!f2fs_may_compress(inode) ||
>> -					(S_ISREG(inode->i_mode) &&
>> -					F2FS_HAS_BLOCKS(inode))) {
>> +					inode_has_data(inode)) {
>>   				f2fs_up_write(&F2FS_I(inode)->i_sem);
>>   				return -EINVAL;
>>   			}
>> @@ -4011,7 +4010,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>>   		goto out;
>>   	}
>>   
>> -	if (F2FS_HAS_BLOCKS(inode)) {
>> +	if (inode_has_data(inode)) {
>>   		ret = -EFBIG;
>>   		goto out;
>>   	}
>> -- 
>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
