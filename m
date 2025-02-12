Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A86BAA32C48
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Feb 2025 17:47:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tiFtq-0001ea-D4;
	Wed, 12 Feb 2025 16:47:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tiFto-0001eT-T7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 16:47:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eEe1kZKfKlf9Yf9M+1rNPR675pPsmmZoxHAnxXs4f2I=; b=mwnyN0gPFMnDFmECz7CLihlwWz
 9LhRwktIkGKIoJ9NA8zbszChc4If7udSGusY7G8z9HWuKGOtJma5fk6kgNtBK94Mm+1FybuVWsx74
 G3dlOSN96Enw1S5SFmNIc8GDaStraYCd+2PrcSkxt36Nffn6O2Q2CBqtJoyQr/DsyYGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eEe1kZKfKlf9Yf9M+1rNPR675pPsmmZoxHAnxXs4f2I=; b=EdFJHJDQrSnt04xbLCwsN6xt99
 D6QNSp8P36BGwvrcloFBroDjOfZKZ1jsEhYRrXklmngYyaZPbLBQst0BjLlpdITeKKEzBjIckuiy0
 55FP+E+zQRcd4A3mpfTJ/93xnAsUhvZilO36ueblKu9GefmjGJWRMr4jE/o9mYKfZEO8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tiFto-0006he-3O for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Feb 2025 16:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 0CA3EA40CE5;
 Wed, 12 Feb 2025 16:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD895C4CEDF;
 Wed, 12 Feb 2025 16:47:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739378853;
 bh=l49aKGECHlQJL+5gadj9OfHegUDAV/GXDkNvlccDNUs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ct/YiBkVj/1vprGdL50t6+tZ3aG+ajLJswfKlgU/6eAGNwlyaDIyRSYBf/INefrZ1
 7JpaxOf5/XOZGMmA7XrVJhPuc8ADt/r/W+ONiwSiZYVpKS2UUKvuP8LExJYrV/i+Cz
 1EErM067bDYnFD8+ddMlm7UFaKiU9UTWnxGxgqmOSVc6hVTr/Bh1r7h+HmqTbID41Y
 sYDQD2DNG9NwACjfkyyzC4xYDufLXJZ0rl55jFIN3Q+xBBSWINodFmr++kj0cTn0KO
 mo/Z8qRGKRBbF7Ot+FMipeblXWVrmDj6fj9oCuXf4qO45Sm01DpmVH7m+h5hhmhdYO
 cwJXaM1AQQ1HQ==
Date: Wed, 12 Feb 2025 16:47:31 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z6zQoyNp5td-Wgd1@google.com>
References: <20250212072742.977248-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250212072742.977248-1-chao@kernel.org>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/12,
 Chao Yu wrote: > From: Leo Stone <leocstone@gmail.com>
 > > The syzbot reproducer mounts a f2fs image, then tries to unlink an >
 existing file. However, the unlinked file already has a link c [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tiFto-0006he-3O
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add check for deleted inode
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Leo Stone <leocstone@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/12, Chao Yu wrote:
> From: Leo Stone <leocstone@gmail.com>
> 
> The syzbot reproducer mounts a f2fs image, then tries to unlink an
> existing file. However, the unlinked file already has a link count of 0
> when it is read for the first time in do_read_inode().
> 
> Add a check to sanity_check_inode() for i_nlink == 0.
> 
> [Chao Yu: rebase the code and fix orphan inode recovery issue]
> Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
> Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
> Signed-off-by: Leo Stone <leocstone@gmail.com>
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
>  fs/f2fs/checkpoint.c | 4 ++++
>  fs/f2fs/f2fs.h       | 1 +
>  fs/f2fs/inode.c      | 6 ++++++
>  3 files changed, 11 insertions(+)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index bd890738b94d..ada2c548645c 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -751,6 +751,8 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
>  		f2fs_info(sbi, "orphan cleanup on readonly fs");
>  
> +	set_sbi_flag(sbi, SBI_ORPHAN_RECOVERY);

What about using SBI_POR_DOING?

> +
>  	start_blk = __start_cp_addr(sbi) + 1 + __cp_payload(sbi);
>  	orphan_blocks = __start_sum_addr(sbi) - 1 - __cp_payload(sbi);
>  
> @@ -778,9 +780,11 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
>  		}
>  		f2fs_put_page(page, 1);
>  	}
> +
>  	/* clear Orphan Flag */
>  	clear_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG);
>  out:
> +	clear_sbi_flag(sbi, SBI_ORPHAN_RECOVERY);
>  	set_sbi_flag(sbi, SBI_IS_RECOVERED);
>  
>  	return err;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 05879c6dc4d6..1c75081c0c14 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1322,6 +1322,7 @@ enum {
>  	SBI_IS_CLOSE,				/* specify unmounting */
>  	SBI_NEED_FSCK,				/* need fsck.f2fs to fix */
>  	SBI_POR_DOING,				/* recovery is doing or not */
> +	SBI_ORPHAN_RECOVERY,			/* orphan inodes recovery is doing */
>  	SBI_NEED_SB_WRITE,			/* need to recover superblock */
>  	SBI_NEED_CP,				/* need to checkpoint */
>  	SBI_IS_SHUTDOWN,			/* shutdown by ioctl */
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index d6ad7810df69..02f1b69d03d8 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -386,6 +386,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
>  		}
>  	}
>  
> +	if (inode->i_nlink == 0 && !is_sbi_flag_set(sbi, SBI_ORPHAN_RECOVERY)) {
> +		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
> +			  __func__, inode->i_ino);
> +		return false;
> +	}
> +
>  	return true;
>  }
>  
> -- 
> 2.48.1.502.g6dc24dfdaf-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
