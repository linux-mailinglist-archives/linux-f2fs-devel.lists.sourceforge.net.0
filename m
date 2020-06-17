Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC5221FD3B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 19:47:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlc9a-00014V-Hh; Wed, 17 Jun 2020 17:47:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jlc9Y-00014M-Of
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 17:47:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kWcvnhGdKUKtgVpkCaiJZknZ/AEaHV+JwRuoE3Zq99Y=; b=KBPlr3K+w8JE1wKRmiOH6vLJN1
 Y+c/YnioAC6jwGhR5To/IhM4R0AQMU+8j3Eq+JHK6DBjQklM8zKeufnqZtrzm3JYSxrlqpS7sfpPr
 iODz1Vcge1rj/kZOkseaOuwK//Oyim90FymXF5gFQEuTp2wMfXPm9cAMPaHoxj6MzY2w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kWcvnhGdKUKtgVpkCaiJZknZ/AEaHV+JwRuoE3Zq99Y=; b=kgFzI0kGHiDTOZKsihCroznjQl
 715gKvxYSj12vHADKeNS3OO06KSpmpBb+KNUFK/HnnQIcJguthxa5AHb6GshN2ea6QM74ek0V0BJa
 8PU8I2NEOI+ziRkOyxJ+mU6wxifQK0wndYhyIttmDmsRMDmd1CA7xS9kiEWWZSpUBj8c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlc9W-006f8P-3i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 17:47:12 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BE73221532;
 Wed, 17 Jun 2020 17:46:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592416019;
 bh=UXP974nYkcnqpDwmLS52ZN4JfgNusjfQ08nltGiLMkk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LbwKHHobboW5GPv0wwI+ZH1bHD8EJHTDwG/XEvIaC7RMerremZcH/laUwq3uc8Cnj
 9tnf5tOtejgrxrfIx7RyMAqlxE+kEgZYytd88SETByOu2K0Z7z2M4MUqCVhedRUDmz
 5oZM0Ms7lY2M/CErISFBpz0jW0VZGBPYwi59JrLA=
Date: Wed, 17 Jun 2020 10:46:59 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Satya Tangirala <satyat@google.com>
Message-ID: <20200617174659.GA114489@google.com>
References: <20200617075732.213198-1-satyat@google.com>
 <20200617075732.213198-2-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200617075732.213198-2-satyat@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jlc9W-006f8P-3i
Subject: Re: [f2fs-dev] [PATCH 1/4] fs: introduce SB_INLINECRYPT
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/17, Satya Tangirala wrote:
> Introduce SB_INLINECRYPT, which is set by filesystems that wish to use
> blk-crypto for file content en/decryption. This flag maps to the
> '-o inlinecrypt' mount option which multiple filesystems will implement,
> and code in fs/crypto/ needs to be able to check for this mount option
> in a filesystem-independent way.
> 
> Signed-off-by: Satya Tangirala <satyat@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>

> ---
>  fs/proc_namespace.c | 1 +
>  include/linux/fs.h  | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/fs/proc_namespace.c b/fs/proc_namespace.c
> index 3059a9394c2d..e0ff1f6ac8f1 100644
> --- a/fs/proc_namespace.c
> +++ b/fs/proc_namespace.c
> @@ -49,6 +49,7 @@ static int show_sb_opts(struct seq_file *m, struct super_block *sb)
>  		{ SB_DIRSYNC, ",dirsync" },
>  		{ SB_MANDLOCK, ",mand" },
>  		{ SB_LAZYTIME, ",lazytime" },
> +		{ SB_INLINECRYPT, ",inlinecrypt" },
>  		{ 0, NULL }
>  	};
>  	const struct proc_fs_opts *fs_infop;
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 6c4ab4dc1cd7..abef6aa95524 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -1380,6 +1380,7 @@ extern int send_sigurg(struct fown_struct *fown);
>  #define SB_NODIRATIME	2048	/* Do not update directory access times */
>  #define SB_SILENT	32768
>  #define SB_POSIXACL	(1<<16)	/* VFS does not apply the umask */
> +#define SB_INLINECRYPT	(1<<17)	/* Use blk-crypto for encrypted files */
>  #define SB_KERNMOUNT	(1<<22) /* this is a kern_mount call */
>  #define SB_I_VERSION	(1<<23) /* Update inode I_version field */
>  #define SB_LAZYTIME	(1<<25) /* Update the on-disk [acm]times lazily */
> -- 
> 2.27.0.290.gba653c62da-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
