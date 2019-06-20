Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ECE84CFCC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jun 2019 16:00:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdxcC-0000if-06; Thu, 20 Jun 2019 14:00:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1hdxcB-0000iZ-IH
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:00:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RhPrggSwUXWePd9F4ptGWxocknThYvUSkEbzphlxStU=; b=VofgRiFSzvJYGj6+djaVwzGi7N
 izz039Ufxzg1xlcw1SMjUELMQMkhGXIqhwTKfksU3C/lnqVbjJaThrGJhXiNh6BBgLp+T6qFILsMA
 mwXlDyj0/xDX+IS17+t/HmsJWU4O7Crz56CDyDFSIkcc1+7orzMt6lQP5g/dUJKglQls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RhPrggSwUXWePd9F4ptGWxocknThYvUSkEbzphlxStU=; b=nGlTpicCPquzZbH8h6VVEvJ2CD
 P30QYYg9K2p11ZffbAdmivsqpGg2u7s4kseakmovLvBJOIM0Hu81SmmGZAHkquMrbTf5mPrr9KpYR
 53O5T4NVau0PNk1Wrr9VQBashCFcbsGpPE/j/tBNtpDolIPVx4wChbst5h9cAVtzNXvA=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdxcB-001TL8-DZ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jun 2019 14:00:37 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8BBB1AEF8;
 Thu, 20 Jun 2019 14:00:28 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 1187D1E434F; Thu, 20 Jun 2019 16:00:28 +0200 (CEST)
Date: Thu, 20 Jun 2019 16:00:28 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190620140028.GH30243@quack2.suse.cz>
References: <156022836912.3227213.13598042497272336695.stgit@magnolia>
 <156022838496.3227213.3771632042609589318.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156022838496.3227213.3771632042609589318.stgit@magnolia>
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
X-Headers-End: 1hdxcB-001TL8-DZ
Subject: Re: [f2fs-dev] [PATCH 2/6] vfs: flush and wait for io when setting
 the immutable flag via SETFLAGS
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

On Mon 10-06-19 21:46:25, Darrick J. Wong wrote:
> From: Darrick J. Wong <darrick.wong@oracle.com>
> 
> When we're using FS_IOC_SETFLAGS to set the immutable flag on a file, we
> need to ensure that userspace can't continue to write the file after the
> file becomes immutable.  To make that happen, we have to flush all the
> dirty pagecache pages to disk to ensure that we can fail a page fault on
> a mmap'd region, wait for pending directio to complete, and hope the
> caller locked out any new writes by holding the inode lock.
> 
> Signed-off-by: Darrick J. Wong <darrick.wong@oracle.com>

...

> diff --git a/fs/ext4/ioctl.c b/fs/ext4/ioctl.c
> index 6aa1df1918f7..a05341b94d98 100644
> --- a/fs/ext4/ioctl.c
> +++ b/fs/ext4/ioctl.c
> @@ -290,6 +290,9 @@ static int ext4_ioctl_setflags(struct inode *inode,
>  	jflag = flags & EXT4_JOURNAL_DATA_FL;
>  
>  	err = vfs_ioc_setflags_check(inode, oldflags, flags);
> +	if (err)
> +		goto flags_out;
> +	err = vfs_ioc_setflags_flush_data(inode, flags);
>  	if (err)
>  		goto flags_out;
>  

...

> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index 8dad3c80b611..9c899c63957e 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -3548,7 +3548,41 @@ static inline struct sock *io_uring_get_socket(struct file *file)
>  
>  int vfs_ioc_setflags_check(struct inode *inode, int oldflags, int flags);
>  
> +/*
> + * Do we need to flush the file data before changing attributes?  When we're
> + * setting the immutable flag we must stop all directio writes and flush the
> + * dirty pages so that we can fail the page fault on the next write attempt.
> + */
> +static inline bool vfs_ioc_setflags_need_flush(struct inode *inode, int flags)
> +{
> +	if (S_ISREG(inode->i_mode) && !IS_IMMUTABLE(inode) &&
> +	    (flags & FS_IMMUTABLE_FL))
> +		return true;
> +
> +	return false;
> +}
> +
> +/*
> + * Flush file data before changing attributes.  Caller must hold any locks
> + * required to prevent further writes to this file until we're done setting
> + * flags.
> + */
> +static inline int inode_flush_data(struct inode *inode)
> +{
> +	inode_dio_wait(inode);
> +	return filemap_write_and_wait(inode->i_mapping);
> +}
> +
> +/* Flush file data before changing attributes, if necessary. */
> +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> +{
> +	if (vfs_ioc_setflags_need_flush(inode, flags))
> +		return inode_flush_data(inode);
> +	return 0;
> +}
> +

But this is racy at least for page faults, isn't it? What protects you
against write faults just after filemap_write_and_wait() has finished?
So either you need to set FS_IMMUTABLE_FL before flushing data or you need
to get more protection from the fs than just i_rwsem. In the case of ext4
that would be i_mmap_rwsem but other filesystems don't have equivalent
protection...

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
