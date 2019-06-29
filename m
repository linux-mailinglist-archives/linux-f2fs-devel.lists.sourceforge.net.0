Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 251F95AD4F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jun 2019 22:09:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhJeq-0006kJ-In; Sat, 29 Jun 2019 20:09:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>)
 id 1hhJeo-0006jv-VM; Sat, 29 Jun 2019 20:09:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q6LJh+RWUyrFUkX7o1RvpdTLDpjFd/+CXTUvcV17XYk=; b=CmH+SXT+b5Fh629vMbN8rkZOYG
 enyAgPCZzlnhLiF/rlqQQKwVc10CoPfzg3AcQqdk7YluKMwRfCV75wsApdtbB+GeYMftcfLdEaa46
 WnWvfJ6kKodKISDfGf/Mrx6Ec7Nkkza+HRk2Yn5hvxKSJseGDaS13THGv/sQZEq8/G20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q6LJh+RWUyrFUkX7o1RvpdTLDpjFd/+CXTUvcV17XYk=; b=JAZ7c3Ed61g8gn5du35F2JUyyr
 ORsXU5YtVx+63NYzsYRoNyHrYu8AhoPp+A1GF9z57UpK9qyYTiPZcnlbCK61fADSDQF5IKKdy1gCY
 M2m1505dLra8Hlr4DK5SPO3aiLvCnBFhjjzT0snBHBCdwFC85ug9nhZWoc9G68j+8rcQ=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hhJep-001Z64-CG; Sat, 29 Jun 2019 20:09:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 20195AD70;
 Sat, 29 Jun 2019 20:09:03 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id AA7D51E3F56; Sat, 29 Jun 2019 22:09:01 +0200 (CEST)
Date: Sat, 29 Jun 2019 22:09:01 +0200
From: Jan Kara <jack@suse.cz>
To: " Darrick J. Wong " <darrick.wong@oracle.com>
Message-ID: <20190629200901.GA18642@quack2.suse.cz>
References: <156174682897.1557318.14418894077683701275.stgit@magnolia>
 <156174687185.1557318.13703922197244050336.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156174687185.1557318.13703922197244050336.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.cz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hhJep-001Z64-CG
Subject: Re: [f2fs-dev] [PATCH 5/5] vfs: only allow FSSETXATTR to set DAX
 flag on files and dirs
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
Cc: shaggy@kernel.org, jfs-discussion@lists.sourceforge.net,
 linux-efi@vger.kernel.org, clm@fb.com, adilger.kernel@dilger.ca,
 ocfs2-devel@oss.oracle.com, hch@infradead.org, linux-nilfs@vger.kernel.org,
 cluster-devel@redhat.com, linux-ext4@vger.kernel.org,
 matthew.garrett@nebula.com, josef@toxicpanda.com,
 reiserfs-devel@vger.kernel.org, viro@zeniv.linux.org.uk,
 David Sterba <dsterba@suse.com>, jaegeuk@kernel.org, tytso@mit.edu,
 ard.biesheuvel@linaro.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 jk@ozlabs.org, Jan Kara <jack@suse.com>, linux-fsdevel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 28-06-19 11:34:31,  Darrick J. Wong  wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> The DAX flag only applies to files and directories, so don't let it get
> set for other types of files.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/inode.c |    8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> 
> diff --git a/fs/inode.c b/fs/inode.c
> index 670d5408d022..f08711b34341 100644
> --- a/fs/inode.c
> +++ b/fs/inode.c
> @@ -2259,6 +2259,14 @@ int vfs_ioc_fssetxattr_check(struct inode *inode, const struct fsxattr *old_fa,
>  	    !S_ISREG(inode->i_mode) && !S_ISDIR(inode->i_mode))
>  		return -EINVAL;
>  
> +	/*
> +	 * It is only valid to set the DAX flag on regular files and
> +	 * directories on filesystems.
> +	 */
> +	if ((fa->fsx_xflags & FS_XFLAG_DAX) &&
> +	    !(S_ISREG(inode->i_mode) || S_ISDIR(inode->i_mode)))
> +		return -EINVAL;
> +
>  	/* Extent size hints of zero turn off the flags. */
>  	if (fa->fsx_extsize == 0)
>  		fa->fsx_xflags &= ~(FS_XFLAG_EXTSIZE | FS_XFLAG_EXTSZINHERIT);
> 
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
