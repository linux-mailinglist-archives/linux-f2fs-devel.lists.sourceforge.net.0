Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 325FA56138
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Jun 2019 06:20:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfzQD-0000kc-Fd; Wed, 26 Jun 2019 04:20:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <viro@ftp.linux.org.uk>) id 1hfzQC-0000kS-MO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Jun 2019 04:20:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kIclzzvbwh3gy97S4kcHDKI8qcoqoEowJ4LfFBdWgr0=; b=DYVAJ9TWHatk/5Snm+zBNW4RJ
 cX4qQAgU/e8hxFa4cjk8xfpXzEiX6fFQtwpuQdXNBfybsIhX7k0kzrJ++6OXi1Wo0OSwPhAY21gcn
 ijJJdFYK0WqXYll0+IqWM9//Wz6T8Y17Y8tcb5SVqdyEkSp2VN8Cnapw9CsU+0TPYfZ7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kIclzzvbwh3gy97S4kcHDKI8qcoqoEowJ4LfFBdWgr0=; b=fZKzgAQh4cUXMb7URwG+a5j1W4
 kAyAgzzB7n9ykby8YhlOI2O7ObNhi3rqmy6elPKYWWs8GD+sLithRNCIXfhBbJD7d9JokIvKpbgEP
 qtZcVGw2cJq5IocoxZAqhn/1KOsDq9VFF4Ypx5ewP35E8b/zBMyUD8lrlnjZY9fkN59w=;
Received: from zeniv.linux.org.uk ([195.92.253.2])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfzQM-00DvIf-QU
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 Jun 2019 04:20:48 +0000
Received: from viro by ZenIV.linux.org.uk with local (Exim 4.92 #3 (Red Hat
 Linux)) id 1hfyyN-0008Mv-UN; Wed, 26 Jun 2019 03:51:52 +0000
Date: Wed, 26 Jun 2019 04:51:51 +0100
From: Al Viro <viro@zeniv.linux.org.uk>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190626035151.GA10613@ZenIV.linux.org.uk>
References: <156151637248.2283603.8458727861336380714.stgit@magnolia>
 <156151641177.2283603.7806026378321236401.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156151641177.2283603.7806026378321236401.stgit@magnolia>
User-Agent: Mutt/1.11.3 (2019-02-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hfzQM-00DvIf-QU
Subject: Re: [f2fs-dev] [PATCH 5/5] vfs: don't allow writes to swap files
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
 linux-nilfs@vger.kernel.org, hch@infradead.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, josef@toxicpanda.com, reiserfs-devel@vger.kernel.org,
 dsterba@suse.com, jaegeuk@kernel.org, tytso@mit.edu, ard.biesheuvel@linaro.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, jk@ozlabs.org, jack@suse.com,
 linux-fsdevel@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jun 25, 2019 at 07:33:31PM -0700, Darrick J. Wong wrote:
> --- a/fs/attr.c
> +++ b/fs/attr.c
> @@ -236,6 +236,9 @@ int notify_change(struct dentry * dentry, struct iattr * attr, struct inode **de
>  	if (IS_IMMUTABLE(inode))
>  		return -EPERM;
>  
> +	if (IS_SWAPFILE(inode))
> +		return -ETXTBSY;
> +
>  	if ((ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID | ATTR_TIMES_SET)) &&
>  	    IS_APPEND(inode))
>  		return -EPERM;

Er...  So why exactly is e.g. chmod(2) forbidden for swapfiles?  Or touch(1),
for that matter...

> diff --git a/mm/swapfile.c b/mm/swapfile.c
> index 596ac98051c5..1ca4ee8c2d60 100644
> --- a/mm/swapfile.c
> +++ b/mm/swapfile.c
> @@ -3165,6 +3165,19 @@ SYSCALL_DEFINE2(swapon, const char __user *, specialfile, int, swap_flags)
>  	if (error)
>  		goto bad_swap;
>  
> +	/*
> +	 * Flush any pending IO and dirty mappings before we start using this
> +	 * swap file.
> +	 */
> +	if (S_ISREG(inode->i_mode)) {
> +		inode->i_flags |= S_SWAPFILE;
> +		error = inode_drain_writes(inode);
> +		if (error) {
> +			inode->i_flags &= ~S_SWAPFILE;
> +			goto bad_swap;
> +		}
> +	}

Why are swap partitions any less worthy of protection?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
