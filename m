Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8EE51B097
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 May 2022 23:29:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmMYP-0002bl-Dk; Wed, 04 May 2022 21:28:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nmMYP-0002bf-47
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 21:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LqpvrKy7i+HfeorIg6COM8zl+m/eCztMP3+5Z5G+0JI=; b=bXqiAgax6WcXXjVIcJThSrTuN4
 uDB6LizK1GxAm1dptzXGMZ8B8afha2UHKyoIt2+9NCT3iTLvtbnmObnvCxuMHCDeQXWPjJCuxrIbm
 mQqpyWOi3aFT+ur0KgIZaHHh3usCIFh9qPAfwKChEdqq9wXUih/8k8GpgP/VfKot8NRk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LqpvrKy7i+HfeorIg6COM8zl+m/eCztMP3+5Z5G+0JI=; b=BPuIEitJoNLBRPT+/Q1YJSq7xu
 +P9YXRBpyvc3mVI1kt6V+d5U4h+L5rIaDSJZtQlshO/TMXimECNsrmDae6rcLo7BsnAh0dBKKybb3
 mW+V2FXU9hIg6T5KIOKYfJcYzKYChZUBkzqAtZome1RduSRpdMX1FXjZV2FAv2tMjLdE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmMYL-000489-5x
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 May 2022 21:28:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF5D2B8293D;
 Wed,  4 May 2022 21:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A0B2C385A4;
 Wed,  4 May 2022 21:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651699729;
 bh=k/SHTcjQ/PrI0QjQFYZgO+ymU5S0yqAqGxV95jD8MsQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AdVKX9QSdZLa7TIJ3yvhHLml7315UPHCfxhawSuffcCTBVJotbhWHUzsROHlu2O5e
 jPAZTuP4dm5QjDRzuEWnuSnugpo1wvvQtnrPNzLgJIyuOX+vtX94qcN0DwtZf8U4/m
 ZBaXw3Hihi4m/X8rhkruZupoD+MYwjUK2HyN9s/HTQizW9b+zi6E3xpx6utfeTDtK/
 Y66zF313//wPDhubvYbZGAlRpalOIzlLj2APkEM2lAU3mSTGcbcJD9XZbqCXuRxn6x
 aXN4sHCVprdCf8uqq5ZDKQVixCM/+1Sh+YwzhAlpEPuNESC2X6aSnBfPlnoWXUWdzj
 0FnwTqPfzpeyA==
Date: Wed, 4 May 2022 14:28:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YnLwDx1smguDQ6qC@google.com>
References: <20220428024940.12102-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220428024940.12102-1-chao@kernel.org>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/28, Chao Yu wrote: > As Yanming reported in bugzilla:
 > > https://bugzilla.kernel.org/show_bug.cgi?id=215895 > > I have encountered
 a bug in F2FS file system in kernel v5.17. > > The kernel mess [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmMYL-000489-5x
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

It seems f2fs_may_inline_data() is breaking the atomic write case. Please fix.

>  		set_sbi_flag(sbi, SBI_NEED_FSCK);
>  		f2fs_warn(sbi, "%s: inode (ino=%lx, mode=%u) should not have inline_data, run fsck to fix",
>  			  __func__, inode->i_ino, inode->i_mode);
> -- 
> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
