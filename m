Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7936E968424
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 12:08:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sl3zB-0003LG-Vg;
	Mon, 02 Sep 2024 10:08:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sl3z9-0003Kz-8Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 10:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hSBEHVYDwm3y8mJXdzagOeJ4ktCJYtACE1If7wUkmZo=; b=CblbBT/QvSaN2RTnVcTqEqu9rW
 P9sbqiU5iHWmf5Ik6QD0h6AU5DqQSsEQR7xEkHYMAKLWPD0DhPTkUBBJxxLfKHc5+aXV1xCsnnKqO
 EBFL7GyzylJADXd2ZYgI4tDfBEzTfe4Ak1OwNAJy3qJVvNXNoTkNIKzUZfAUB2g1A1JY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hSBEHVYDwm3y8mJXdzagOeJ4ktCJYtACE1If7wUkmZo=; b=fJqU31WdUbgAoZYI7IfBvHN78K
 TeNPsMdk18JOdDYeUSdfDfBuz5UlrVLlCieS3OY+7RkXniqE5ln41g/oQIWsKzf2/djkfsJabxoho
 F5EyINxqRdlf3y1HPsbyD1eHxro9TKV7aU6PoKUmzGyw+a/YBv0fB9vC5IFXzCGlutFc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sl3z8-0001rb-F6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 10:08:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BACA75C568A;
 Mon,  2 Sep 2024 10:08:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD7E7C4CEC2;
 Mon,  2 Sep 2024 10:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725271703;
 bh=sql6vHe/3EO6mdE86526uAu9+kxcquuGrC0M8wPZbnk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sU+VeKZnBBYtd/yBU6G54ZSXXdzGoiIcBDXzwsd1UWmT6Kk5N+hFduzYje2NfsKbQ
 DtyBtuRdCGTMhS6DsOj+38M6OgLXgc4KJaapc/AWLezj77Wtc/e7KSEsUUiEBKkWRi
 BLrpCwXsd2+F5j+64rSILpw3cCtk3xGomYYU62gG4eMv5YV5CEP71F1z3rczF70NpM
 6alvPXOUqKtz6GJIrlRkM9YXwx2rqU1Pm3Oki0SWjltGZKOF8tUeIGZb/kxis21czT
 digE+ZQbsL61LegK+XAjXmo1XuLfVCehizfQXlMt9sUSvi9Pd4ER6HiSwIqJgWXQRh
 r4W0qpmTsy86w==
Message-ID: <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
Date: Mon, 2 Sep 2024 18:08:20 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Daeho Jeong <daeho43@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com
References: <20240826202352.2150294-1-daeho43@gmail.com>
Content-Language: en-US
In-Reply-To: <20240826202352.2150294-1-daeho43@gmail.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/8/27 4:23, Daeho Jeong wrote: > From: Daeho Jeong
 <daehojeong@google.com> > > Keep atomic file clean while updating and make
 it dirtied during commit > in order to avoid unnecessary and excess [...]
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sl3z8-0001rb-F6
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: Daeho Jeong <daehojeong@google.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/8/27 4:23, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Keep atomic file clean while updating and make it dirtied during commit
> in order to avoid unnecessary and excessive inode updates in the previous
> fix.
> 
> Fixes: 4bf78322346f ("f2fs: mark inode dirty for FI_ATOMIC_COMMITTED flag")
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>   fs/f2fs/f2fs.h    |  3 +--
>   fs/f2fs/inode.c   | 10 ++++++----
>   fs/f2fs/segment.c | 10 ++++++++--
>   3 files changed, 15 insertions(+), 8 deletions(-)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index 465b2fd50c70..5a7f6fa8b585 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -801,7 +801,7 @@ enum {
>   	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
>   	FI_ALIGNED_WRITE,	/* enable aligned write */
>   	FI_COW_FILE,		/* indicate COW file */
> -	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
> +	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
>   	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
>   	FI_OPENED_FILE,		/* indicate file has been opened */
>   	FI_MAX,			/* max flag, never be used */
> @@ -3042,7 +3042,6 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
>   	case FI_INLINE_DOTS:
>   	case FI_PIN_FILE:
>   	case FI_COMPRESS_RELEASED:
> -	case FI_ATOMIC_COMMITTED:
>   		f2fs_mark_inode_dirty_sync(inode, true);
>   	}
>   }
> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> index 1eb250c6b392..5dd3e55d2be2 100644
> --- a/fs/f2fs/inode.c
> +++ b/fs/f2fs/inode.c
> @@ -35,6 +35,11 @@ void f2fs_mark_inode_dirty_sync(struct inode *inode, bool sync)
>   	if (f2fs_inode_dirtied(inode, sync))

It will return directly here if inode was dirtied, so it may missed to set
FI_ATOMIC_DIRTIED flag?

Thanks,

>   		return;
>   
> +	if (f2fs_is_atomic_file(inode)) {
> +		set_inode_flag(inode, FI_ATOMIC_DIRTIED);
> +		return;
> +	}
> +
>   	mark_inode_dirty_sync(inode);
>   }
>   
> @@ -653,10 +658,7 @@ void f2fs_update_inode(struct inode *inode, struct page *node_page)
>   	ri->i_gid = cpu_to_le32(i_gid_read(inode));
>   	ri->i_links = cpu_to_le32(inode->i_nlink);
>   	ri->i_blocks = cpu_to_le64(SECTOR_TO_BLOCK(inode->i_blocks) + 1);
> -
> -	if (!f2fs_is_atomic_file(inode) ||
> -			is_inode_flag_set(inode, FI_ATOMIC_COMMITTED))
> -		ri->i_size = cpu_to_le64(i_size_read(inode));
> +	ri->i_size = cpu_to_le64(i_size_read(inode));
>   
>   	if (et) {
>   		read_lock(&et->lock);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 78c3198a6308..2b5391b229a8 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -196,9 +196,12 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
>   		truncate_inode_pages_final(inode->i_mapping);
>   
>   	release_atomic_write_cnt(inode);
> -	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
>   	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
>   	clear_inode_flag(inode, FI_ATOMIC_FILE);
> +	if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
> +		clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
> +		f2fs_mark_inode_dirty_sync(inode, true);
> +	}
>   	stat_dec_atomic_inode(inode);
>   
>   	F2FS_I(inode)->atomic_write_task = NULL;
> @@ -365,7 +368,10 @@ static int __f2fs_commit_atomic_write(struct inode *inode)
>   		sbi->revoked_atomic_block += fi->atomic_write_cnt;
>   	} else {
>   		sbi->committed_atomic_block += fi->atomic_write_cnt;
> -		set_inode_flag(inode, FI_ATOMIC_COMMITTED);
> +		if (is_inode_flag_set(inode, FI_ATOMIC_DIRTIED)) {
> +			clear_inode_flag(inode, FI_ATOMIC_DIRTIED);
> +			f2fs_mark_inode_dirty_sync(inode, true);
> +		}
>   	}
>   
>   	__complete_revoke_list(inode, &revoke_list, ret ? true : false);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
