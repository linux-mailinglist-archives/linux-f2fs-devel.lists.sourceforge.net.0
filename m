Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B197752B9D2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 May 2022 14:30:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrIoT-0000L2-HF; Wed, 18 May 2022 12:30:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nrIoH-0000EY-2L
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 12:29:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s4KTaaDPpam6u/zNdjkhy9Lldw0ISxjj5kmzadcveIc=; b=PehNEMGh/xCzlsD/DwgkzEeAzp
 06yADMNWNZvQHehy/Ge4alfIGGv6pHQT9uh7wjn4ahwo8x43WjeA7tC/gmtfItLm3CHQs9q9e9qaS
 8gh3N113gPPHtqPMqC6lVkNkhSvhoTIkj0jNJ8bUEXzAav87Az76Pzf+axPAYpEiVw40=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=s4KTaaDPpam6u/zNdjkhy9Lldw0ISxjj5kmzadcveIc=; b=A2RfZL+KJy+71ww1FvjgJGvV/j
 OfxJt7LC6DQLc3j9EyN701chVo927/u6sxEDf4ouwcV0zLv+oHGCeOs0s5NJ3Y8TD4C994lKWoc3N
 On1GyBkJaMZD6EriqK/bgnGUPXXTUWUtn1nDc/sIv8neEMGx+Q8rhX2DhR0Ef4CQOHC8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrIoF-00056v-MC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 May 2022 12:29:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CD94061610;
 Wed, 18 May 2022 12:29:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95390C34117;
 Wed, 18 May 2022 12:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652876981;
 bh=9VJtyuJ98c+2JmlYiq1B5aAhyeksMYIVW6HqtlRq25A=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Npp6io4kk7B95S1CaNcRra3SAtaZu+lsv6mqNrnbTr8lDg+marMMTSf9xD+Zk8kmK
 LSnwqBeV+SL6z3zYCOWcuWRY5AwK98aBTFEnLaQmpp6VfY0dKTsYWrH8IA5kUNGl9A
 af2QcSIBRIiL/AyskQ1wwqbydrQDGWERs+YAXKkRs6pzDYPy6e9NECoNaAET/imPKc
 ObWM/RQswEcOzk9Mnu57okM+vk+Cx8eFKpuyVnwfx0mTuGKHgCNcMgKV8u9VjCikNH
 g+DZ8RkR7LY7o+Y4h5VNQpkqbGz7LjlUfN3t9g2iZTmGmJXnjNg83UsGaJIvMRFSLD
 j7Q8B7yH8/XVA==
Message-ID: <cbb92656-d47a-edd6-1e31-3274be57bdfa@kernel.org>
Date: Wed, 18 May 2022 20:29:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220517033120.3564912-1-chao@kernel.org>
 <YoPm8UI61eKtKPB8@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YoPm8UI61eKtKPB8@google.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/5/18 2:18, Jaegeuk Kim wrote: > On 05/17, Chao Yu
 wrote: >> Yanming reported a kernel bug in Bugzilla kernel [1], which can
 be >> reproduced. The bug message is: >> >> The kernel message is sh [...]
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nrIoF-00056v-MC
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: fix to do sanity check for inline
 inode
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

On 2022/5/18 2:18, Jaegeuk Kim wrote:
> On 05/17, Chao Yu wrote:
>> Yanming reported a kernel bug in Bugzilla kernel [1], which can be
>> reproduced. The bug message is:
>>
>> The kernel message is shown below:
>>
>> kernel BUG at fs/inode.c:611!
>> Call Trace:
>>   evict+0x282/0x4e0
>>   __dentry_kill+0x2b2/0x4d0
>>   dput+0x2dd/0x720
>>   do_renameat2+0x596/0x970
>>   __x64_sys_rename+0x78/0x90
>>   do_syscall_64+0x3b/0x90
>>
>> [1] https://bugzilla.kernel.org/show_bug.cgi?id=215895
>>
>> The bug is due to fuzzed inode has both inline_data and encrypted flags.
>> During f2fs_evict_inode(), as the inode was deleted by rename(), it
>> will cause inline data conversion due to conflicting flags. The page
>> cache will be polluted and the panic will be triggered in clear_inode().
>>
>> Try fixing the bug by doing more sanity checks for inline data inode in
>> sanity_check_inode().
>>
>> Cc: stable@vger.kernel.org
>> Reported-by: Ming Yan <yanming@tju.edu.cn>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>> v4:
>> - introduce and use f2fs_post_read_required_ondisk() only for
> 
> Can we do like this?
> 
> ---
>   fs/f2fs/f2fs.h   |  1 +
>   fs/f2fs/inline.c | 30 +++++++++++++++++++++++++-----
>   fs/f2fs/inode.c  |  3 +--
>   3 files changed, 27 insertions(+), 7 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index e9e32bc814df..000468bf06ca 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4019,6 +4019,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
>    * inline.c
>    */
>   bool f2fs_may_inline_data(struct inode *inode);
> +bool f2fs_sanity_check_inline_data(struct inode *inode);
>   bool f2fs_may_inline_dentry(struct inode *inode);
>   void f2fs_do_read_inline_data(struct page *page, struct page *ipage);
>   void f2fs_truncate_inline_inode(struct inode *inode,
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index a578bf83b803..daf8c0e0a6b6 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -14,21 +14,41 @@
>   #include "node.h"
>   #include <trace/events/f2fs.h>
>   
> -bool f2fs_may_inline_data(struct inode *inode)
> +static bool support_inline_data(struct inode *inode)
>   {
>   	if (f2fs_is_atomic_file(inode))
>   		return false;
> -
>   	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
>   		return false;
> -
>   	if (i_size_read(inode) > MAX_INLINE_DATA(inode))
>   		return false;
> +	return true;
> +}
>   
> -	if (f2fs_post_read_required(inode))
> +bool f2fs_may_inline_data(struct inode *inode)
> +{
> +	if (!support_inline_data(inode))
>   		return false;
>   
> -	return true;
> +	return !(f2fs_encrypted_file(inode) || fsverity_active(inode) ||
> +		f2fs_compressed_file(inode));

!f2fs_post_read_required(), otherwise looks good!

Thanks,

> +}
> +
> +bool f2fs_sanity_check_inline_data(struct inode *inode)
> +{
> +	if (!f2fs_has_inline_data(inode))
> +		return false;
> +
> +	if (!support_inline_data(inode))
> +		return true;
> +
> +	/*
> +	 * used by sanity_check_inode(), when disk layout fields has not
> +	 * been synchronized to inmem fields.
> +	 */
> +	return (S_ISREG(inode->i_mode) &&
> +		(file_is_encrypt(inode) || file_is_verity(inode) ||
> +		(F2FS_I(inode)->i_flags & F2FS_COMPR_FL)));
>   }
>   
>   bool f2fs_may_inline_dentry(struct inode *inode)
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 2fce8fa0dac8..938961a9084e 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>   		}
>   	}
>   
> -	if (f2fs_has_inline_data(inode) &&
> -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
> +	if (f2fs_sanity_check_inline_data(inode)) {
>   		set_sbi_flag(sbi, SBI_NEED_FSCK);
>   		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
>   			  __func__, inode->i_ino, inode->i_mode);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
