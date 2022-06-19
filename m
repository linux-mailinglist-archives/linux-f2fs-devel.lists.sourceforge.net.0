Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5DC5507BF
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Jun 2022 02:35:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o2iuZ-0007Ub-U3; Sun, 19 Jun 2022 00:35:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1o2iuZ-0007UU-1E
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kJtsZE1YKZbqcgJa1A0aISAyAWenbFLyP3Lfr1vwN2E=; b=lbthd5YC/CrTQqDm0Ed54O/Y6F
 wWPu1M9oPmC8vySDB9+vkGN5DDU+wq9JVhSMgJzdfIQ0I/0PGT1kjZGJ5oph5MJUFxzF7jsVCIkrA
 4YylAduE0FCylS3gnUEFq02Dq7J0X2pRBKQVyruy1k2DS16uFR0U39M+58Pv1kVsngQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kJtsZE1YKZbqcgJa1A0aISAyAWenbFLyP3Lfr1vwN2E=; b=B0r3rhCIykMDPDbB3w4ZkasHAW
 ls8AINbY9A7t5nJkb2aK/SKJrF7d4TfRmC0epnZk32qadaVB7JBo8UkXrSG6iKweDNYAL8g0yx4tw
 ZDhUolea0LoUUpk2n4fmQXB7co9kH+QdYAR783m3+O/ogySd6DdhEB/5pnjv8SqN/ARc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o2iuV-0004Wo-Ok
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 00:35:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B062B60DEA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Jun 2022 00:35:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61531C3411A;
 Sun, 19 Jun 2022 00:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655598923;
 bh=JvhSdmaU8CkX1kionMrJZINyzM9zc4yNPpJWqKS7g2k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=eQe20mOTH5uO8hNt8ucEZ04Pr7OO8kSatvZvQVMv5xXhnDC34BaZQm9Ff3o6/mu0r
 OgCJcWw6RwM5R0Chvvp3Y0Pq9sv+ekNMZJyBiA2LSJrv0h7Q8JvoON6pS26K8bPdQm
 UU0X7doUX6lXlPRJ/znUo7tGUsOaR63WKjb7ICN9MAxrUYjagsJ8PpBODkjNMrfZvg
 4AnTIccESlQtlSl+xDn2Fu8E1RYd7oukB1HU5+hA5Ij4PRqbfpVvZU/Lg8DTzkCofe
 fzFv0Uo9WeM5lvvM+s9I9fIOuyEArEByZVor8TlRTqGkVzqJYTkDlEOKwjULqNniuy
 +PZYqUyC22yvg==
Message-ID: <ae324c70-8671-8878-5854-c0910c744379@kernel.org>
Date: Sun, 19 Jun 2022 08:35:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20220617223106.3517374-1-jaegeuk@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220617223106.3517374-1-jaegeuk@kernel.org>
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/6/18 6:31, Jaegeuk Kim wrote: > This fixes the below
 corruption. > > [345393.335389] F2FS-fs (vdb): sanity_check_inode: inode
 (ino=6d0, mode=33206) should not have inline_data, run fsck to fix [...] 
 Content analysis details:   (-7.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o2iuV-0004Wo-Ok
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs: attach inline_data after setting
 compression
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
Cc: stable@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/6/18 6:31, Jaegeuk Kim wrote:
> This fixes the below corruption.
> 
> [345393.335389] F2FS-fs (vdb): sanity_check_inode: inode (ino=6d0, mode=33206) should not have inline_data, run fsck to fix
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 677a82b44ebf ("f2fs: fix to do sanity check for inline inode")
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>   fs/f2fs/namei.c | 16 ++++++++++------
>   1 file changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> index c549acb52ac4..a841abe6a071 100644
> --- a/fs/f2fs/namei.c
> +++ b/fs/f2fs/namei.c
> @@ -89,8 +89,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>   	if (test_opt(sbi, INLINE_XATTR))
>   		set_inode_flag(inode, FI_INLINE_XATTR);
>   
> -	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
> -		set_inode_flag(inode, FI_INLINE_DATA);
>   	if (f2fs_may_inline_dentry(inode))
>   		set_inode_flag(inode, FI_INLINE_DENTRY);
>   
> @@ -107,10 +105,6 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>   
>   	f2fs_init_extent_tree(inode, NULL);
>   
> -	stat_inc_inline_xattr(inode);
> -	stat_inc_inline_inode(inode);
> -	stat_inc_inline_dir(inode);
> -
>   	F2FS_I(inode)->i_flags =
>   		f2fs_mask_flags(mode, F2FS_I(dir)->i_flags & F2FS_FL_INHERITED);
>   
> @@ -127,6 +121,14 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
>   			set_compress_context(inode);
>   	}
>   
> +	/* Should enable inline_data after compression set */
> +	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
> +		set_inode_flag(inode, FI_INLINE_DATA);
> +
> +	stat_inc_inline_xattr(inode);
> +	stat_inc_inline_inode(inode);
> +	stat_inc_inline_dir(inode);
> +
>   	f2fs_set_inode_flags(inode);
>   
>   	trace_f2fs_new_inode(inode, 0);
> @@ -325,6 +327,8 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
>   		if (!is_extension_exist(name, ext[i], false))
>   			continue;
>   
> +		/* Do not use inline_data with compression */
> +		clear_inode_flag(inode, FI_INLINE_DATA);

if (is_inode_set_flag()) {
	clear_inode_flag();
	stat_dec_inline_inode();
}

Thanks,

>   		set_compress_context(inode);
>   		return;
>   	}


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
