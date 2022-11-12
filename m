Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B06A8626630
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 12 Nov 2022 02:28:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otfJZ-00068c-EO;
	Sat, 12 Nov 2022 01:28:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1otfJY-00068W-Kl
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 01:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Fq+T/97vjM47DS5j0lcMT9F3it3WrVV/hMtvuWGYU8=; b=IAxMB5PpM4K0/AL5e6/W8SFjOH
 oMm8HdBUcnQ4vl19d4VbyerHoV3UrbORwV/aTz+nQIvtRjIFjRU0h7AlqWljFf4BfGrJKnKd6er45
 us1CPchAdZrEwtOsJtkXl7skVsVi+O0r9yCyK4y9Fs79Y92IP2BHf0kS26Fz5/H/HfmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Fq+T/97vjM47DS5j0lcMT9F3it3WrVV/hMtvuWGYU8=; b=Zvyv03wwOjfb3Tyd/c67ZYx3NJ
 EqYDBpTojnCr/mzzKS0OmZOqDq5/wHWT7Zf+WufXVsfQO3O+TrjzsYtVVZI8wr3P4wZu/H6qsDyAK
 DTirLafjg2s7BYenv7Djkg4zD0pdAdRpWqIikfCqeUGRVT/RgXwYVDwGF7eAGEWLJfrw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otfJX-0002TX-Rj for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Nov 2022 01:28:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 044B962167;
 Sat, 12 Nov 2022 01:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A246C433D6;
 Sat, 12 Nov 2022 01:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668216479;
 bh=MoShBfZdwzrv76NQDM8F3RCjVb1XBmORpbl/oOgsLWE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UzfiLyomEvyu1Jlh/ptuz+3kSmXVV1j9Q3YNIOUFheOLcuIBHgZwiYiQ8/+xnLHVt
 el/b3QJC1d9inQHC6Rizyv6DXG+FG0FnQtBmWOTY01ODGE+OP/By32ppLqEB0bFzDf
 rQeElz9jrrU1py9sWaBB9drfXAJoHXjWOUAEifHKoVsOKHg2Ac6uulDzfyYrUMetgt
 byg1Cx4k1vVn8rCa9ZYW/nB31oV0QYoj7nquBzNcu4EN009e7Em8nCIqqSTi5VR/hG
 h8ox72aeu8WHizFrhwzL/106ynUtOxy2JTj8JwcZuO9GRrwb2xfbOoJ9icd1WmHZTE
 GMJgAxp2XyEeA==
Date: Fri, 11 Nov 2022 17:27:57 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Sheng Yong <shengyong@oppo.com>
Message-ID: <Y272nVjzr6CynmyQ@google.com>
References: <20221111100830.953733-1-shengyong@oppo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111100830.953733-1-shengyong@oppo.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Does thes make sense?
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=608460dfae20b9d23aa222f7448710a086778222
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/
 [...] Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1otfJX-0002TX-Rj
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to enable compress for
 newly created file if extension matches
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Does thes make sense?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=608460dfae20b9d23aa222f7448710a086778222
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=962379487b5cb9f3b85ea367b130c2c6ca584edf

Second one is needed to address build error.

On 11/11, Sheng Yong wrote:
> If compress_extension is set, and a newly created file matches the
> extension, the file could be marked as compression file. However,
> if inline_data is also enabled, there is no chance to check its
> extension since f2fs_should_compress() always returns false.
> 
> This patch moves set_compress_inode(), which do extension check, in
> f2fs_should_compress() to check extensions before setting inline
> data flag.
> 
> Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
> Signed-off-by: Sheng Yong <shengyong@oppo.com>
> ---
>  fs/f2fs/namei.c | 27 +++++++++++++--------------
>  1 file changed, 13 insertions(+), 14 deletions(-)
> 
> ---
> v1->v2: add filename parameter for f2fs_new_inode, and move
>         set_compress_inode into f2fs_new_inode
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index e104409c3a0e5..36e251f438568 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -22,8 +22,12 @@
>  #include "acl.h"
>  #include <trace/events/f2fs.h>
>  
> +static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
> +						const unsigned char *name);
> +
>  static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
> -						struct inode *dir, umode_t mode)
> +						struct inode *dir, umode_t mode,
> +						const char *name)
>  {
>  	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
>  	nid_t ino;
> @@ -119,6 +123,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>  		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
>  					f2fs_may_compress(inode))
>  			set_compress_context(inode);
> +		if (name)
> +			set_compress_inode(sbi, inode, name);
>  	}
>  
>  	/* Should enable inline_data after compression set */
> @@ -293,8 +299,7 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>  	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
>  	int i, cold_count, hot_count;
>  
> -	if (!f2fs_sb_has_compression(sbi) ||
> -			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
> +	if (F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
>  			!f2fs_may_compress(inode) ||
>  			(!ext_cnt && !noext_cnt))
>  		return;
> @@ -326,10 +331,6 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>  	for (i = 0; i < ext_cnt; i++) {
>  		if (!is_extension_exist(name, ext[i], false))
>  			continue;
> -
> -		/* Do not use inline_data with compression */
> -		stat_dec_inline_inode(inode);
> -		clear_inode_flag(inode, FI_INLINE_DATA);
>  		set_compress_context(inode);
>  		return;
>  	}
> @@ -352,15 +353,13 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
>  	if (err)
>  		return err;
>  
> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, mode, dentry->d_name.name);
>  	if (IS_ERR(inode))
>  		return PTR_ERR(inode);
>  
>  	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
>  		set_file_temperature(sbi, inode, dentry->d_name.name);
>  
> -	set_compress_inode(sbi, inode, dentry->d_name.name);
> -
>  	inode->i_op = &f2fs_file_inode_operations;
>  	inode->i_fop = &f2fs_file_operations;
>  	inode->i_mapping->a_ops = &f2fs_dblock_aops;
> @@ -689,7 +688,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
>  	if (err)
>  		return err;
>  
> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO);
> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO, NULL);
>  	if (IS_ERR(inode))
>  		return PTR_ERR(inode);
>  
> @@ -760,7 +759,7 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
>  	if (err)
>  		return err;
>  
> -	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode, NULL);
>  	if (IS_ERR(inode))
>  		return PTR_ERR(inode);
>  
> @@ -817,7 +816,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
>  	if (err)
>  		return err;
>  
> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>  	if (IS_ERR(inode))
>  		return PTR_ERR(inode);
>  
> @@ -856,7 +855,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
>  	if (err)
>  		return err;
>  
> -	inode = f2fs_new_inode(mnt_userns, dir, mode);
> +	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
>  	if (IS_ERR(inode))
>  		return PTR_ERR(inode);
>  
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
