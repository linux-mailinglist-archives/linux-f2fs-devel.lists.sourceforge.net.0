Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19AEE6EA196
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Apr 2023 04:24:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppgRS-0007Gu-Qo;
	Fri, 21 Apr 2023 02:24:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ppgRQ-0007Gn-3a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 02:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mWiYSE+udsapZIJ3lW4VqXWw4CDnYW4ikf0ARXSPZME=; b=MeT/oblEzA+Diw3DEW9x6y3dPA
 e2OlsO+xp6Usq/KOwWAkJMN8fF2Vkh1kltlbobjUaQxBQosZDJ75A59LRDlHUXTLFWJ1jnmERf8F3
 VA9YjmRoYw5mikAurEdUm7NQue1ArOskl7ZPDvw+h0r9pvK8B242mD3c8aXR8EnIPeoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mWiYSE+udsapZIJ3lW4VqXWw4CDnYW4ikf0ARXSPZME=; b=fEAptTSP96CfvwvGCvzN3yg+Ax
 Zai2r+oAeYIING2D9kDMt0bWra4YdTKupNKt2rNMS9f16LyGMLQFvqyyjMoR+wwF/g3k8nHUbJCYN
 BgXmXzGxPbDhjS2ck2fMN8g+/o/lsD2yj8ZdrPFYEKkKVUUlYPUG0bgWZ6m+r5MCWqjA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppgRP-00E9xo-Ot for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Apr 2023 02:24:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6488261516;
 Fri, 21 Apr 2023 02:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FEFCC433D2;
 Fri, 21 Apr 2023 02:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682043837;
 bh=1Nm5Zb6uJo/S3RC7aYlzD7h6cDUnGH6wY4UXaWEbzPs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=PPw0tAgskpKmZ3wBuiV3DQzVSL/PFsI7NlcNsk/l/rGRxd5FMaaFab11mduc8ibiu
 oKMu8YJIINLXmc1TsD7VDpqlXc5MlANpML2MPWJPKQU9/1xzPJBOsxy29h3K9ety/Q
 JzQLnnlzkw+DYYNgJ+CTPUg54zDtvh8SjrV/bC7v7JbTNe25yePmSJN+gBvkG0UQnA
 dkfMtbrD8CcqoV22kwdZFW1q5gtBnf56r6HicdRNyu5kK7SsapvN8llL/IOQLo0FZO
 LEVWhX/7UZjcnYsQ4imHKURgw+IcxRm7HIPXasl5faFJWFc3C5susW0bmOjmAudHih
 7zzCEp6Ib5c1w==
Message-ID: <44ca783a-da8c-aec9-ac35-76acc5475cb9@kernel.org>
Date: Fri, 21 Apr 2023 10:23:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20230418175206.3282328-1-daeho43@gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20230418175206.3282328-1-daeho43@gmail.com>
X-Spam-Score: -6.9 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/4/19 1:52, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Need to use cow inode data content instead of
 the one in the original > inode, when we try to write the already up [...]
 Content analysis details:   (-6.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.7 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppgRP-00E9xo-Ot
Subject: Re: [f2fs-dev] [PATCH] f2fs: use cow inode data when updating
 atomic write
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/4/19 1:52, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Need to use cow inode data content instead of the one in the original
> inode, when we try to write the already updated atomic write files.
> 

Miss a fixes line?

Otherwise it looks good to me.

Thanks

> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/data.c | 15 ++++++++++-----
>   1 file changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 8df225014304..7165b1202f53 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3491,7 +3491,7 @@ static int __reserve_data_block(struct inode *inode, pgoff_t index,
>   
>   static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>   			struct page *page, loff_t pos, unsigned int len,
> -			block_t *blk_addr, bool *node_changed)
> +			block_t *blk_addr, bool *node_changed, bool *use_cow)
>   {
>   	struct inode *inode = page->mapping->host;
>   	struct inode *cow_inode = F2FS_I(inode)->cow_inode;
> @@ -3505,10 +3505,12 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
>   
>   	/* Look for the block in COW inode first */
>   	err = __find_data_block(cow_inode, index, blk_addr);
> -	if (err)
> +	if (err) {
>   		return err;
> -	else if (*blk_addr != NULL_ADDR)
> +	} else if (*blk_addr != NULL_ADDR) {
> +		*use_cow = true;
>   		return 0;
> +	}
>   
>   	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
>   		goto reserve_block;
> @@ -3538,6 +3540,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   	struct page *page = NULL;
>   	pgoff_t index = ((unsigned long long) pos) >> PAGE_SHIFT;
>   	bool need_balance = false;
> +	bool use_cow = false;
>   	block_t blkaddr = NULL_ADDR;
>   	int err = 0;
>   
> @@ -3597,7 +3600,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   
>   	if (f2fs_is_atomic_file(inode))
>   		err = prepare_atomic_write_begin(sbi, page, pos, len,
> -					&blkaddr, &need_balance);
> +					&blkaddr, &need_balance, &use_cow);
>   	else
>   		err = prepare_write_begin(sbi, page, pos, len,
>   					&blkaddr, &need_balance);
> @@ -3637,7 +3640,9 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
>   			f2fs_handle_error(sbi, ERROR_INVALID_BLKADDR);
>   			goto fail;
>   		}
> -		err = f2fs_submit_page_read(inode, page, blkaddr, 0, true);
> +		err = f2fs_submit_page_read(use_cow ?
> +				F2FS_I(inode)->cow_inode : inode, page,
> +				blkaddr, 0, true);
>   		if (err)
>   			goto fail;
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
