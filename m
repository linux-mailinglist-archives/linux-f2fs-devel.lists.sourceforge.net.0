Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA683CF2FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jul 2021 06:09:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m5h4A-0002aQ-Gg; Tue, 20 Jul 2021 04:09:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1m5h49-0002aK-HQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 04:09:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vWUL99EswnCubJfDP+0dNMHnJA8AFR9DdDZfiNuRnVs=; b=R6W52wZV9krF2aT1KqXk15Z8Js
 zmCsY6QbmLzR+6V3Ilibp+hbDzUtsuZ9Zwu73Q4lRAyoYSR2DZJ/mtO9lz7mYhroj0iQI0/pR5Hg7
 vgEWztnFimpHziJ0WOim61L//gue2tgLPgi60Ch8JvBVyuC7xj5wYpizBbLiFMqOxdHQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vWUL99EswnCubJfDP+0dNMHnJA8AFR9DdDZfiNuRnVs=; b=QlBmzNkzpbHfZAwubKH430DgC7
 lhtYmdQg9hvf3bN+ZOAsW004BZ1XGi/TuzikjdaEojeIHb3paFPVJNhG2A3CAhfA7XYFHaD1snmu9
 tzA8jwmUMgALs2oOMcf6ZROx0x7zIn6ioNybCLc5YQDgiGVVJQ+g5qGnZIAmsYyr60YQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m5h46-00EF2B-Ll
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 20 Jul 2021 04:09:09 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 81A0A6101B;
 Tue, 20 Jul 2021 04:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626754136;
 bh=MQ4/GKjWZC19RRUqnFkuK07XPpUeTKW/wVdBKoVqlWU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=jJQZHFgrcERSt8QHLPghedY2/EovBkzW/t1YK2Nq4der5gqCpX8+z7PE6oRRukJkJ
 tE1/cDarWzfi2AQXDJTk4QepR3lmqCDn09gS7Zrq711T1zDQpEsbTvf3lDWMQNOpxA
 JOcLZSWJlLfQ6elrXRc14WfbZD6lo4754ywK+/PoVgJNbBgwFb0G3QWjUAN0JCIXH3
 2vDAyw1RPb84ReyyAeb1Jbcbrfvzz9FacfZQqCerLlMjji7gOQSeaFgVn+SlDlbYLS
 5H4gMJMCPymgfveYklWNBzuZ7e5qeApY5PZ22D5d5koz9Bje4NUy52EHaSguF7e8q3
 r0g8zyinSlUqg==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210719101419.370520-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <cc6ee336-f5a9-8f9e-4105-4d297510e404@kernel.org>
Date: Tue, 20 Jul 2021 12:08:53 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210719101419.370520-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m5h46-00EF2B-Ll
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Reduce the scope of setting fsck
 tag when de->name_len is zero
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

On 2021/7/19 18:14, Yangtao Li wrote:
> I recently found a case where de->name_len is 0 in f2fs_fill_dentries() easily reproduced,
> and finally set the fsck flag.
> 
> Thread A					Thread B
> 
> f2fs_readdir
> 	f2fs_read_inline_dir
> 		ctx->pos = d.max
> 						f2fs_add_dentry
> 							f2fs_add_inline_entry
> 								do_convert_inline_dir
> 							f2fs_add_regular_entry
> f2fs_readdir
> 	f2fs_fill_dentries
> 		set_sbi_flag(sbi, SBI_NEED_FSCK)
> 
> Process A opens the folder, and has been reading without closing it. During this period,
> Process B created a file under the folder (occupying multiple f2fs_dir_entry, exceeding
> the d.max of the inline dir). After creation, process A uses the d.max of inline dir to
> read it again, and it will read that de->name_len is 0.
> 
> And Chao pointed out that w/o inline conversion, the race condition still can happen as below
> 
> dir_entry1: A
> dir_entry2: B
> dir_entry3: C
> free slot: _

ctx->pos: ^

> 
> Before:
> AAAABBBB___
>           ^

AAAABBBB___
         ^

> Thread B delete dir_entry2, and create dir_entry3.
> 
> After:
> AAAACCCCC__
>           ^

AAAACCCCC__
         ^

> 
> In these scenarios, the file system is not damaged, and it's hard to avoid it. But we can bypass
> tagging FSCK flag if:
> a) bit_pos (:= ctx->pos % d->max) is non-zero & b) before bit_pos moves to first
> valid dir_entry.
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/dir.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
> index 456651682daf..3e2a61a3600c 100644
> --- a/fs/f2fs/dir.c
> +++ b/fs/f2fs/dir.c
> @@ -1000,6 +1000,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>   	struct f2fs_sb_info *sbi = F2FS_I_SB(d->inode);
>   	struct blk_plug plug;
>   	bool readdir_ra = sbi->readdir_ra == 1;
> +	bool find_valid_dentry = false;

found_valid_dirent?

>   	int err = 0;
>   
>   	bit_pos = ((unsigned long)ctx->pos % d->max);
> @@ -1014,13 +1015,15 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>   
>   		de = &d->dentry[bit_pos];
>   		if (de->name_len == 0) {
> +			if (!(ctx->pos % d->max != 0 && find_valid_dentry == false)) {

if (found_valid_dirent || !bit_pos)) will be more clean?


> +				printk_ratelimited(
> +					"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
> +					KERN_WARNING, sbi->sb->s_id,
> +					le32_to_cpu(de->ino));
> +				set_sbi_flag(sbi, SBI_NEED_FSCK);
> +			}
>   			bit_pos++;
>   			ctx->pos = start_pos + bit_pos;
> -			printk_ratelimited(
> -				"%sF2FS-fs (%s): invalid namelen(0), ino:%u, run fsck to fix.",
> -				KERN_WARNING, sbi->sb->s_id,
> -				le32_to_cpu(de->ino));
> -			set_sbi_flag(sbi, SBI_NEED_FSCK);
>   			continue;
>   		}
>   
> @@ -1063,6 +1066,7 @@ int f2fs_fill_dentries(struct dir_context *ctx, struct f2fs_dentry_ptr *d,
>   			f2fs_ra_node_page(sbi, le32_to_cpu(de->ino));
>   
>   		ctx->pos = start_pos + bit_pos;
> +		find_valid_dentry = true;

found_valid_dirent = true;

Thanks,

>   	}
>   out:
>   	if (readdir_ra)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
