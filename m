Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7FB4CFE2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 16:03:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdxfO-0000sI-CP; Thu, 20 Jun 2019 14:03:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1hdxfM-0000s5-JM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ToNfqA1qtuKBR7PgDNN9N50tBNymGFS9RPUY+mCXJFo=; b=f+GyDzZJcY72Zt8GAuweK/TQnY
 YuJn0LFjBDpzDvbOwh44tVi3r22MaPknk6nqj/Zva2hZpuoS05QLn8G5rKtwPqm80SsJT8/s8eIEx
 CqJiNrxhw+DbqDFgRw6iWX1HJ6rlNYFdPuvhV8fL6PGNqlr9f4Q4oizSVJKtVmTSylhc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ToNfqA1qtuKBR7PgDNN9N50tBNymGFS9RPUY+mCXJFo=; b=DRqsOd5ps6ivrfp4OBMyGDyjsh
 0VMEGcWBEcmW4pTQWAwlXtD3TrKCmOKGZ+WG/8DvrO1bPI7LkNx/d1wH5EQ9b+D0jEmyjesOvwxeW
 gLc+G6aFuyPrazXc4gVkeoaddzrm2qrpMcvE1zhlc1dv663sUKMbmRM7PRaM21mR+o90=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdxfM-006XNO-Nk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:03:54 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 05638AF85;
 Thu, 20 Jun 2019 14:03:46 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id A12B31E434F; Thu, 20 Jun 2019 16:03:45 +0200 (CEST)
Date: Thu, 20 Jun 2019 16:03:45 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190620140345.GI30243@quack2.suse.cz>
References: <156022836912.3227213.13598042497272336695.stgit@magnolia>
 <156022840560.3227213.4776913678782966728.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022840560.3227213.4776913678782966728.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hdxfM-006XNO-Nk
Subject: Re: [f2fs-dev] [PATCH 4/6] vfs: don't allow most setxattr to
 immutable files
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
Cc: linux-efi@vger.kernel.org, linux-btrfs@vger.kernel.org, linux-mm@kvack.org,
 clm@fb.com, adilger.kernel@dilger.ca, matthew.garrett@nebula.com,
 linux-nilfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
 viro@zeniv.linux.org.uk, dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu,
 ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, jack@suse.com, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon 10-06-19 21:46:45, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> The chattr manpage has this to say about immutable files:
> 
> "A file with the 'i' attribute cannot be modified: it cannot be deleted
> or renamed, no link can be created to this file, most of the file's
> metadata can not be modified, and the file can not be opened in write
> mode."
> 
> However, we don't actually check the immutable flag in the setattr code,
> which means that we can update inode flags and project ids and extent
> size hints on supposedly immutable files.  Therefore, reject setflags
> and fssetxattr calls on an immutable file if the file is immutable and
> will remain that way.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>
> ---
>  fs/inode.c |   31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index a3757051fd55..adfb458bf533 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2184,6 +2184,17 @@ int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags)
>  	    !capable(CAP_LINUX_IMMUTABLE))
>  		return -EPERM;
>  
> +	/*
> +	 * We aren't allowed to change any other flags if the immutable flag is
> +	 * already set and is not being unset.
> +	 */
> +	if ((oldflags & FS_IMMUTABLE_FL) &&
> +	    (flags & FS_IMMUTABLE_FL)) {
> +		if ((oldflags & ~FS_IMMUTABLE_FL) !=
> +		    (flags & ~FS_IMMUTABLE_FL))

This check looks a bit strange when you've just check FS_IMMUTABLE_FL isn't
changing... Why not just oldflags != flags?

> +	if ((old_fa->fsx_xflags & FS_XFLAG_IMMUTABLE) &&
> +	    (fa->fsx_xflags & FS_XFLAG_IMMUTABLE)) {
> +		if ((old_fa->fsx_xflags & ~FS_XFLAG_IMMUTABLE) !=
> +		    (fa->fsx_xflags & ~FS_XFLAG_IMMUTABLE))

Ditto here...

> +			return -EPERM;
> +		if (old_fa->fsx_projid != fa->fsx_projid)
> +			return -EPERM;
> +		if ((fa->fsx_xflags & (FS_XFLAG_EXTSIZE |
> +				       FS_XFLAG_EXTSZINHERIT)) &&
> +		    old_fa->fsx_extsize != fa->fsx_extsize)
> +			return -EPERM;
> +		if ((old_fa->fsx_xflags & FS_XFLAG_COWEXTSIZE) &&
> +		    old_fa->fsx_cowextsize != fa->fsx_cowextsize)
> +			return -EPERM;
> +	}
> +
>  	/* Extent size hints of zero turn off the flags. */
>  	if (fa->fsx_extsize == 0)
>  		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
