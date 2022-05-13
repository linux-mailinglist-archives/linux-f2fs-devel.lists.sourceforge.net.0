Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2935D526C17
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 May 2022 23:08:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npcW1-0002JU-Gd; Fri, 13 May 2022 21:08:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1npcVz-0002JO-KP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 21:07:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KY9wO2KDD8Pc5TT0Ry3AX7zIsuUxVc+n9zgWvrYjqQI=; b=WgwmGXhBzqR+sr2ItgENESeBoF
 HSK5nKHVFj+GLUlYuish8V22gf4ZSu3fCfOR8wcu5mSSeC0cvdGpu/xRoDgcPqfGA8yTyzSEsT7MO
 nNqj8pOjy3HXG2JApN25xXkT5dCaF47bbCWkN/XYCxGsgnQbmsCk9Zo1H3T+zDHw4g2s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KY9wO2KDD8Pc5TT0Ry3AX7zIsuUxVc+n9zgWvrYjqQI=; b=ZBHs5nlqItHFlBzXBYnsz687ko
 8TiFt44+hRlcvGfm5TRgsQhuMfp7lFLLYezdVTiE0vcwscKpPM4DQ/wnMGxJrxYBU+IAg6PR+pQ+x
 kmPneKXQ3J21Q2AQ/XN7qEZovwVLWh0u71puBE/U6Id8LBPZRVJomOGDajcPqBBxvv1E=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npcVt-00BI28-QG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 21:07:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 66BB5622F2;
 Fri, 13 May 2022 21:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2C51C34100;
 Fri, 13 May 2022 21:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652476059;
 bh=9sFjfKoaAyEC+9HSV3bohlPaCAHVxDSuX+3Bu1rvJ/U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XwXO6+1AhH1Ssg2P+C4fnmG1FpLpTH7pkn4XtaZZmmuz2iqiDooO2Grmn8ALGHHfg
 Yy5GM9+OK6zHI6zp3jq7iHuhIl3e9Vw4oVw5cAKffgRmFSHV0HfE/g7XXBMjYzfhHU
 4OFVZT/nSoyHJ02U3li4EpdsnVQE/B3FHhQon7adeKp7S7Cl8hGWf3TsAS6BQKXj/F
 9t4EM7d1DbJeOcJtJOQFWqLPbv81sq9RiO6KmiKIHEQzVsoup0jAw5/KqYDt5eLx0u
 BXef3OK0fVFneO0P8OJCP6jlh9Aj9j++iXZddUHX4gJuB9MWBvYr8mCO4PUrbwXfth
 kMsrjrVMpKwvA==
Date: Fri, 13 May 2022 14:07:37 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yn7Imax7fgpJ7eY5@google.com>
References: <20220428024940.12102-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428024940.12102-1-chao@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/28, Chao Yu wrote: > As Yanming reported in bugzilla:
 > > https://bugzilla.kernel.org/show_bug.cgi?id=215895 > > I have encountered
 a bug in F2FS file system in kernel v5.17. > > The kernel mess [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npcVt-00BI28-QG
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/28, Chao Yu wrote:
> As Yanming reported in bugzilla:
> 
> https://bugzilla.kernel.org/show_bug.cgi?id=215895
> 
> I have encountered a bug in F2FS file system in kernel v5.17.
> 
> The kernel message is shown below:
> 
> kernel BUG at fs/inode.c:611!
> Call Trace:
>  evict+0x282/0x4e0
>  __dentry_kill+0x2b2/0x4d0
>  dput+0x2dd/0x720
>  do_renameat2+0x596/0x970
>  __x64_sys_rename+0x78/0x90
>  do_syscall_64+0x3b/0x90
> 
> The root cause is: fuzzed inode has both inline_data flag and encrypted
> flag, so after it was deleted by rename(), during f2fs_evict_inode(),
> it will cause inline data conversion due to flags confilction, then
> page cache will be polluted and trigger panic in clear_inode().
> 
> This patch tries to fix the issue by do more sanity checks for inline
> data inode in sanity_check_inode().
> 
> Cc: stable@vger.kernel.org
> Reported-by: Ming Yan <yanming@tju.edu.cn>
> Signed-off-by: Chao Yu <chao.yu@oppo.com>
> ---
>  fs/f2fs/f2fs.h  | 7 +++++++
>  fs/f2fs/inode.c | 3 +--
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 27aa93caec06..64c511b498cc 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4173,6 +4173,13 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
>   */
>  static inline bool f2fs_post_read_required(struct inode *inode)
>  {
> +	/*
> +	 * used by sanity_check_inode(), when disk layout fields has not
> +	 * been synchronized to inmem fields.
> +	 */
> +	if (file_is_encrypt(inode) || file_is_verity(inode) ||
> +			F2FS_I(inode)->i_flags & F2FS_COMPR_FL)
> +		return true;
>  	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
>  		f2fs_compressed_file(inode);
>  }
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 83639238a1fe..234b8ed02644 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -276,8 +276,7 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  		}
>  	}
>  
> -	if (f2fs_has_inline_data(inode) &&
> -			(!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))) {
> +	if (f2fs_has_inline_data(inode) && !f2fs_may_inline_data(inode)) {

BTW, why can't we just check the above on-disk fields here only?

>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
>  			  __func__, inode->i_ino, inode->i_mode);
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
