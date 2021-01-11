Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DF82F18A7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:49:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyyVO-0003Ps-KF; Mon, 11 Jan 2021 14:49:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyyVM-0003Pk-H8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:49:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wg2Yk05lN1euWviFtS1Vee4px5duVZOqbc8fT6EYB1M=; b=bMcw3n0cEbsPMe1KM2QM3NBb1K
 NfoaoJxgkkLTWHgiAyMTJ5vkqrgzhi8LANILJJTd74V1NeV4AkTda6Uevr2rKGKnj/ATeKHLpjCoR
 3C9l4Xu5OZO7/cytGtpR8RBeQb+qjqJMWJih14rBDVYZXrTHxyoi2s+OOO1Q6Kl9ZR0U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wg2Yk05lN1euWviFtS1Vee4px5duVZOqbc8fT6EYB1M=; b=QuhlCMD8vo7v2FjLNWDaTvvf8c
 BFjxRBYfNoEQAodCPtqjzAJzmMD7GYduE6TYmscFNC5FsZmFvZERTiWJtdROjBcN2OxEHtkUCi9z/
 wenGiGSLTz2MfgOpaQW9UopKIBVmkVrmS3T1NQUM6Rp2YtWSOFZ9yPWaafVVhCbPmMds=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyVK-009ZEi-T6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:49:12 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8074BAC95;
 Mon, 11 Jan 2021 14:48:57 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 46A7E1E0807; Mon, 11 Jan 2021 15:48:57 +0100 (CET)
Date: Mon, 11 Jan 2021 15:48:57 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111144857.GA18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-3-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-3-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyVK-009ZEi-T6
Subject: Re: [f2fs-dev] [PATCH v2 02/12] fs: correctly document the inode
 dirty flags
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
Cc: Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri 08-01-21 23:58:53, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The documentation for I_DIRTY_SYNC and I_DIRTY_DATASYNC is a bit
> misleading, and I_DIRTY_TIME isn't documented at all.  Fix this.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. You can add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  include/linux/fs.h | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/fs.h b/include/linux/fs.h
> index fd47deea7c176..45a0303b2aeb6 100644
> --- a/include/linux/fs.h
> +++ b/include/linux/fs.h
> @@ -2084,8 +2084,8 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
>  /*
>   * Inode state bits.  Protected by inode->i_lock
>   *
> - * Three bits determine the dirty state of the inode, I_DIRTY_SYNC,
> - * I_DIRTY_DATASYNC and I_DIRTY_PAGES.
> + * Four bits determine the dirty state of the inode: I_DIRTY_SYNC,
> + * I_DIRTY_DATASYNC, I_DIRTY_PAGES, and I_DIRTY_TIME.
>   *
>   * Four bits define the lifetime of an inode.  Initially, inodes are I_NEW,
>   * until that flag is cleared.  I_WILL_FREE, I_FREEING and I_CLEAR are set at
> @@ -2094,12 +2094,20 @@ static inline void kiocb_clone(struct kiocb *kiocb, struct kiocb *kiocb_src,
>   * Two bits are used for locking and completion notification, I_NEW and I_SYNC.
>   *
>   * I_DIRTY_SYNC		Inode is dirty, but doesn't have to be written on
> - *			fdatasync().  i_atime is the usual cause.
> - * I_DIRTY_DATASYNC	Data-related inode changes pending. We keep track of
> + *			fdatasync() (unless I_DIRTY_DATASYNC is also set).
> + *			Timestamp updates are the usual cause.
> + * I_DIRTY_DATASYNC	Data-related inode changes pending.  We keep track of
>   *			these changes separately from I_DIRTY_SYNC so that we
>   *			don't have to write inode on fdatasync() when only
> - *			mtime has changed in it.
> + *			e.g. the timestamps have changed.
>   * I_DIRTY_PAGES	Inode has dirty pages.  Inode itself may be clean.
> + * I_DIRTY_TIME		The inode itself only has dirty timestamps, and the
> + *			lazytime mount option is enabled.  We keep track of this
> + *			separately from I_DIRTY_SYNC in order to implement
> + *			lazytime.  This gets cleared if I_DIRTY_INODE
> + *			(I_DIRTY_SYNC and/or I_DIRTY_DATASYNC) gets set.  I.e.
> + *			either I_DIRTY_TIME *or* I_DIRTY_INODE can be set in
> + *			i_state, but not both.  I_DIRTY_PAGES may still be set.
>   * I_NEW		Serves as both a mutex and completion notification.
>   *			New inodes set I_NEW.  If two processes both create
>   *			the same inode, one of them will release its inode and
> -- 
> 2.30.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
