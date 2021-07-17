Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B4AF3CC213
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Jul 2021 10:56:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m4g7Q-00059M-Br; Sat, 17 Jul 2021 08:56:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <chao@kernel.org>) id 1m4g7O-00059F-Ak
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 08:56:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1PY9X3PjmSQBhgbIRvq3j0d7NIijmQYVmcdEiaxR8D0=; b=hWMFospz1RpkEyYAEm0mDPpNwM
 81wwZ3eKRqIWTDwWqj4Lk4LXvunN+M20oBDRKPrsd+Nl7Qk400j5gp4AaZ0QW0cJX9+6Igmft02WS
 MsuEvXlch225XSWray1tV2Ik3G4wBIW0lmnNXh0mI5UH0bqTX/ZkDzc6gBJrcOcmAYvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1PY9X3PjmSQBhgbIRvq3j0d7NIijmQYVmcdEiaxR8D0=; b=FoxYBdKsBjq+YwLBvEfsOfSVw1
 hdNdnZJnM2bDVrMdzi7i0pw4GIJF6DPvGMOqDxm7bV6ap4uSLITdJn48tDjo91GBaMxpNol5rGXQp
 l2iYs75ZquaICKse3676zqi/eph8o5pzdx9EAFh6429X8oAGqaVW3osN9SBLNjseLmEg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m4g7F-0008FU-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 17 Jul 2021 08:56:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64216613C0;
 Sat, 17 Jul 2021 08:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626512164;
 bh=Wuy4aT3AF+AKu9usxoWce9QDgBSD5R94pgf5H1/EgCo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Cm+FcwNJiex1lUkuru4Rs6Npk57fUiXFtrXRmO3CZIluRR84TBxUBBEkOo8iwZlBD
 WzinCdbCbhQLfrJPIfq3Ytpguotw562bALHxdOAPlLNc6AzImrG0uW54aTF6uolbaB
 8trXmYDN/lSj8tPJiESA6UWmNVphyeZbE/RAtzkwbm+9zIM9FjUkf611wAKuMF0FdK
 S97630P0cYcpMHA7Mw4YkvyuMmcS+GAMvUw8MYVdoCAn0K8q7egjzaE0tuuXTcS8EB
 2unHQBKlFdjmU0OWCNgfs/S25uuCc0Uiyh9m8aB/tOOBMq4lVMwBOTv1bnFfMpOwSx
 EGmaspGy83jOQ==
To: Yangtao Li <frank.li@vivo.com>, jaegeuk@kernel.org
References: <20210717034955.344408-1-frank.li@vivo.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <2d651236-40de-2e7b-d6c6-9a18ce9a25ff@kernel.org>
Date: Sat, 17 Jul 2021 16:56:01 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210717034955.344408-1-frank.li@vivo.com>
Content-Language: en-US
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m4g7F-0008FU-Jr
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix ctx->pos in f2fs_read_inline_dir()
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

On 2021/7/17 11:49, Yangtao Li wrote:
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

Nice catch!

> 
> And returning early in f2fs_read_inline_dir will cause the process to be unable to see
> the changes before reopening the file.
> 
> So don't return early and remove the modification of ctx->pos in f2fs_read_inline_dir().
> 
> Signed-off-by: Yangtao Li <frank.li@vivo.com>
> ---
>   fs/f2fs/inline.c | 5 -----
>   1 file changed, 5 deletions(-)
> 
> diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
> index 56a20d5c15da..fc6551139a3d 100644
> --- a/fs/f2fs/inline.c
> +++ b/fs/f2fs/inline.c
> @@ -729,9 +729,6 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
>   
>   	make_dentry_ptr_inline(inode, &d, inline_dentry);
>   
> -	if (ctx->pos == d.max)
> -		return 0;
> -
>   	ipage = f2fs_get_node_page(F2FS_I_SB(inode), inode->i_ino);
>   	if (IS_ERR(ipage))
>   		return PTR_ERR(ipage);
> @@ -747,8 +744,6 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
>   	make_dentry_ptr_inline(inode, &d, inline_dentry);
>   
>   	err = f2fs_fill_dentries(ctx, &d, 0, fstr);

After this function, ctx->pos will point to start position of first free slot after
last dir_entry, we can't guarantee that the free slot won't be used in above race
condition, right?

Moreover, w/o inline conversion, the race condition still can happen as below, right?

dir_entry1: A
dir_entry2: B
dir_entry3: C
free slot: _

Before:
AAAABBBB___
         ^
Thread B delete dir_entry2, and create dir_entry3.

After:
AAAACCCCC__
         ^
Thanks,

> -	if (!err)
> -		ctx->pos = d.max;
>   
>   	f2fs_put_page(ipage, 0);
>   	return err < 0 ? err : 0;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
