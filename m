Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0BB51EDDB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  8 May 2022 15:52:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnhKo-0004T9-Io; Sun, 08 May 2022 13:52:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nnhKn-0004T3-RC
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 13:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vT44HeIfoUmnXsWUnslYYiR0XPmxQzzHX2v+MNnRe9k=; b=jwYPZ4bJNzhJQM4D6KtVNdzB0X
 pxxdJQlDicNDwwKrvPIJVncHCbANH7EWysU+5Xf+KxQZzhG56zSFpz2tdHwN/pjPrrIY588fpQW1n
 Qns2nYhBw9MIioxR9YR2sLWIA7Gvf84exWV5TOl1idDUEENexqXANN/wnhx/gHctyhsI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:References:Cc:To:From:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vT44HeIfoUmnXsWUnslYYiR0XPmxQzzHX2v+MNnRe9k=; b=S5VsZBa2trbF9UMtbIRmwgqvMn
 1UavGflGZOYNMqNBgEYpV5NVm8rKA7qGUVL99ooQ4hFUbqn3381cd8w08rXsz3NifGCs/1VIrQrQo
 u5OZD5kH7pnifNtq8boQYDNau9vm+TTfcZxXarWot1Todoql3zez0nU8+Qr7bZzznvRA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnhKk-005A4U-Ur
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 08 May 2022 13:52:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6018EB80CF6;
 Sun,  8 May 2022 13:52:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCFB0C385AC;
 Sun,  8 May 2022 13:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652017931;
 bh=K8ZdW0YTIJUfw19c0PaxA0xsHdt8IH5745zf3Q2+Wmg=;
 h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
 b=qEtBsHNME4BVvPB0XeyE7fum/bHyEUgjXIeZUNLTwwJQ4PJyQNmZRBILOXB2ey/pt
 9Do2pz1MJuaHjCzY83wsIGKA17Cja8WftP7hgI1UCmLHPUBsAZ1mKqq1WczbiBiPRG
 bzQXZp/gJIi1ohGXOR5NSP5mdmmJg3qhO3W7IQpwWAijMKbC4dnaz2DprJxYXFSVzJ
 d2zHwVejcA0Fv68Hyf0/xXCmz7D1V0YZBHiOr8KypFK0A9UUaRE7r1BoPamMLQdr45
 wiqQm5AhiAJOJpTTOETh8/d4wg2bcHBf4EKI0Q22AeBf0z92pEz3ToyYgTWeVBrZJ3
 p2OO32eQfvBvw==
Message-ID: <c717cdc3-bb6f-d437-f039-d05418c9dd88@kernel.org>
Date: Sun, 8 May 2022 21:52:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220428024940.12102-1-chao@kernel.org>
 <YnLwDx1smguDQ6qC@google.com>
 <173c51c2-eff3-8d76-7041-e9c58024a97e@kernel.org>
 <YnNFCEdSpyVSaTZq@google.com>
 <142acf95-c940-8d4a-7f00-08f1bb816c49@kernel.org>
In-Reply-To: <142acf95-c940-8d4a-7f00-08f1bb816c49@kernel.org>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Ping, On 2022/5/5 22:33, Chao Yu wrote: > On 2022/5/5 11:31, 
 Jaegeuk Kim wrote: >> On 05/05, Chao Yu wrote: >>> On 2022/5/5 5:28, Jaegeuk
 Kim wrote: >>>> On 04/28, Chao Yu wrote: >>>>> As Yanming reported i [...]
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
X-Headers-End: 1nnhKk-005A4U-Ur
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to do sanity check for inline inode
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

Ping,

On 2022/5/5 22:33, Chao Yu wrote:
> On 2022/5/5 11:31, Jaegeuk Kim wrote:
>> On 05/05, Chao Yu wrote:
>>> On 2022/5/5 5:28, Jaegeuk Kim wrote:
>>>> On 04/28, Chao Yu wrote:
>>>>> As Yanming reported in bugzilla:
>>>>>
>>>>> https://bugzilla.kernel.org/show_bug.cgi?id=215895
>>>>>
>>>>> I have encountered a bug in F2FS file system in kernel v5.17.
>>>>>
>>>>> The kernel message is shown below:
>>>>>
>>>>> kernel BUG at fs/inode.c:611!
>>>>> Call Trace:
>>>>>     evict+0x282/0x4e0
>>>>>     __dentry_kill+0x2b2/0x4d0
>>>>>     dput+0x2dd/0x720
>>>>>     do_renameat2+0x596/0x970
>>>>>     __x64_sys_rename+0x78/0x90
>>>>>     do_syscall_64+0x3b/0x90
>>>>>
>>>>> The root cause is: fuzzed inode has both inline_data flag and encrypted
>>>>> flag, so after it was deleted by rename(), during f2fs_evict_inode(),
>>>>> it will cause inline data conversion due to flags confilction, then
>>>>> page cache will be polluted and trigger panic in clear_inode().
>>>>>
>>>>> This patch tries to fix the issue by do more sanity checks for inline
>>>>> data inode in sanity_check_inode().
>>>>>
>>>>> Cc: stable@vger.kernel.org
>>>>> Reported-by: Ming Yan <yanming@tju.edu.cn>
>>>>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>>>>> ---
>>>>>     fs/f2fs/f2fs.h  | 7 +++++++
>>>>>     fs/f2fs/inode.c | 3 +--
>>>>>     2 files changed, 8 insertions(+), 2 deletions(-)
>>>>>
>>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>>> index 27aa93caec06..64c511b498cc 100644
>>>>> --- a/fs/f2fs/f2fs.h
>>>>> +++ b/fs/f2fs/f2fs.h
>>>>> @@ -4173,6 +4173,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>>>>>      */
>>>>>     static inline bool f2fs_post_read_required(struct inode *inode)
>>>>>     {
>>>>> +	/*
>>>>> +	 * used by sanity_check_inode(), when disk layout fields has not
>>>>> +	 * been synchronized to inmem fields.
>>>>> +	 */
>>>>> +	if (file_is_encrypt(inode) || file_is_verity(inode) ||
>>>>> +			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
>>>>> +		return true;
>>>>>     	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
>>>>>     		f2fs_compressed_file(inode);
>>>>>     }
>>>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>>>> index 83639238a1fe..234b8ed02644 100644
>>>>> --- a/fs/f2fs/inode.c
>>>>> +++ b/fs/f2fs/inode.c
>>>>> @@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>>>>>     		}
>>>>>     	}
>>>>> -	if (f2fs_has_inline_data(inode) &&
>>>>> -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
>>>>> +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
>>>>
>>>> It seems f2fs_may_inline_data() is breaking the atomic write case. Please fix.
>>>
>>> sanity_check_inode() change only affect f2fs_iget(), during inode initialization,
>>> file should not be set as atomic one, right?
>>>
>>> I didn't see any failure during 'f2fs_io write atomic_write' testcase... could you
>>> please provide me detail of the testcase?
>>
>> I just applied this into my device and was getting lots of the below error
>> messages resulting in open failures of database files.
> 
> Could you please help to apply below patch and dump the log?
> 
> From: Chao Yu <chao@kernel.org>
> Subject: [PATCH] f2fs: fix to do sanity check for inline inode
> 
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
>    fs/f2fs/f2fs.h  |  7 +++++++
>    fs/f2fs/inode.c | 11 +++++++----
>    2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 0f8c426aed50..13a9212d6cb6 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4159,6 +4159,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>     */
>    static inline bool f2fs_post_read_required(struct inode *inode)
>    {
> +	/*
> +	 * used by sanity_check_inode(), when disk layout fields has not
> +	 * been synchronized to inmem fields.
> +	 */
> +	if (file_is_encrypt(inode) || file_is_verity(inode) ||
> +			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
> +		return true;
>    	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
>    		f2fs_compressed_file(inode);
>    }
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 02630c17da93..a98614a24ad0 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -276,11 +276,14 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>    		}
>    	}
> 
> -	if (f2fs_has_inline_data(inode) &&
> -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
> +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {
>    		set_sbi_flag(sbi, SBI_NEED_FSCK);
> -		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
> -			  __func__, inode->i_ino, inode->i_mode);
> +		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) reason(%d, %llu, %ld, %d, %d, %lu) should not have inline_data, run fsck to fix",
> +			  __func__, inode->i_ino, inode->i_mode,
> +			  f2fs_is_atomic_file(inode),
> +			  i_size_read(inode), MAX_INLINE_DATA(inode),
> +			  file_is_encrypt(inode), file_is_verity(inode),
> +			  F2FS_I(inode)->i_flags & F2FS_COMPR_FL);
>    		return false;
>    	}
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
