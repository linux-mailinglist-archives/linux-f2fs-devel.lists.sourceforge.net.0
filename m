Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC87509E3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2019 13:37:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfNIA-0001jx-3m; Mon, 24 Jun 2019 11:37:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1hfNI9-0001jq-4x
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jun 2019 11:37:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kC0tGTExToSY0TsjLIPhoVhUNCUhdd7MZXe46kxsGEA=; b=WIVrrVQZ9zQIF8OOHow5knSxt7
 Q6wc+fD8r9h2Haoc6PISuL7fgJlXShNhN1DUfHjVGSNiK9/lkCr3uJ3Gfvj/lasvg8VEkyX5U05TS
 PCzdJ9AZdbVRdMvflgf9bEua8H7CsNY3ZMmAhbGtuKqj4WWTradSRqWlv5t2gVa/okVI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kC0tGTExToSY0TsjLIPhoVhUNCUhdd7MZXe46kxsGEA=; b=JGM/PoC2O6xWrxeskfhUOgLRBg
 K/3vtRix6KREyvc3Dg/dZPkVwUF8F7J4IaivOYCOjjo1h/tuYiHtwMt7C6/CkglZptvIzi+2qJiB6
 aIp2Xu5b3tRBsOhroxQGbBpY07/Ej0ItUHFtVTq4cacT4RLt9tisn70vidkvUXV+BXZ0=;
Received: from mx2.suse.de ([195.135.220.15] helo=mx1.suse.de)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hfNIB-00C02a-3V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Jun 2019 11:37:48 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 0EF03AE79;
 Mon, 24 Jun 2019 11:37:40 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id DBCD31E2F23; Mon, 24 Jun 2019 13:37:37 +0200 (CEST)
Date: Mon, 24 Jun 2019 13:37:37 +0200
From: Jan Kara <jack@suse.cz>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Message-ID: <20190624113737.GG32376@quack2.suse.cz>
References: <156116141046.1664939.11424021489724835645.stgit@magnolia>
 <156116142734.1664939.5074567130774423066.stgit@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <156116142734.1664939.5074567130774423066.stgit@magnolia>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hfNIB-00C02a-3V
Subject: Re: [f2fs-dev] [PATCH 2/7] vfs: flush and wait for io when setting
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

On Fri 21-06-19 16:57:07, Darrick J. Wong wrote:
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

Seeing the way this worked out, is there a reason to have separate
vfs_ioc_setflags_flush_data() instead of folding the functionality in
vfs_ioc_setflags_check() (possibly renaming it to
vfs_ioc_setflags_prepare() to indicate it does already some changes)? I
don't see any place that would need these two separated...

> +/*
> + * Flush all pending IO and dirty mappings before setting S_IMMUTABLE on an
> + * inode via FS_IOC_SETFLAGS.  If the flush fails we'll clear the flag before
> + * returning error.
> + *
> + * Note: the caller should be holding i_mutex, or else be sure that
> + * they have exclusive access to the inode structure.
> + */
> +static inline int vfs_ioc_setflags_flush_data(struct inode *inode, int flags)
> +{
> +	int ret;
> +
> +	if (!vfs_ioc_setflags_need_flush(inode, flags))
> +		return 0;
> +
> +	inode_set_flags(inode, S_IMMUTABLE, S_IMMUTABLE);
> +	ret = inode_flush_data(inode);
> +	if (ret)
> +		inode_set_flags(inode, 0, S_IMMUTABLE);
> +	return ret;
> +}

Also this sets S_IMMUTABLE whenever vfs_ioc_setflags_need_flush() returns
true. That is currently the right thing but seems like a landmine waiting
to trip? So I'd just drop the vfs_ioc_setflags_need_flush() abstraction to
make it clear what's going on.

								Honza
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
