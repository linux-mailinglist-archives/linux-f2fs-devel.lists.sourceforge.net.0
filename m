Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B4B2F18E7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 15:56:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyyco-0006bT-F5; Mon, 11 Jan 2021 14:56:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyycn-0006bH-Jx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:56:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mTyPu1oC57DyrwwxbFI3SBe8IX9Y1EAFmsQu2J7+b24=; b=bwLMs+xPjcCauZ0cgHziSSs2bu
 lU5ypeeZ/D3jB2Xn0lBHxjVpm1j9kQZn8ySGJdr3FJZfBqajFtxrOk/dYBgfNDOJlW6awFmVVe6i4
 +oidGH62oXpxIhQ5MBpG55K3OUNlp/7toiN/Ja1PEvSHy8qNAK5jlPNTp7zIyZZNhKBc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mTyPu1oC57DyrwwxbFI3SBe8IX9Y1EAFmsQu2J7+b24=; b=ePL0SKRRHbvli3L/zTGiyGtqA8
 X4CwixKI+TwRCI4lXvB6MSIw6yKf/pqRA9YsrJJJ/8b8tdyjdIdKI8lxeDJ/yliP9+sjp7pwp+oIB
 /Y1LOO9wRrFxEfhUeeVZ30Ui80wzMuz7+mCmM0HAgYA0p5YcYqV06dBlMXMZwasXR51w=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyyca-001N35-2m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 14:56:53 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C1EF4AD1E;
 Mon, 11 Jan 2021 14:56:33 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 967771E0807; Mon, 11 Jan 2021 15:56:33 +0100 (CET)
Date: Mon, 11 Jan 2021 15:56:33 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111145633.GE18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-7-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-7-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyyca-001N35-2m
Subject: Re: [f2fs-dev] [PATCH v2 06/12] fs: pass only I_DIRTY_INODE flags
 to ->dirty_inode
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

On Fri 08-01-21 23:58:57, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> ->dirty_inode is now only called when I_DIRTY_INODE (I_DIRTY_SYNC and/or
> I_DIRTY_DATASYNC) is set.  However it may still be passed other dirty
> flags at the same time, provided that these other flags happened to be
> passed to __mark_inode_dirty() at the same time as I_DIRTY_INODE.
> 
> This doesn't make sense because there is no reason for filesystems to
> care about these extra flags.  Nor are filesystems notified about all
> updates to these other flags.
> 
> Therefore, mask the flags before passing them to ->dirty_inode.
> 
> Also properly document ->dirty_inode in vfs.rst.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza 

> ---
>  Documentation/filesystems/vfs.rst | 5 ++++-
>  fs/fs-writeback.c                 | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/filesystems/vfs.rst b/Documentation/filesystems/vfs.rst
> index ca52c82e5bb54..287b80948a40b 100644
> --- a/Documentation/filesystems/vfs.rst
> +++ b/Documentation/filesystems/vfs.rst
> @@ -270,7 +270,10 @@ or bottom half).
>  	->alloc_inode.
>  
>  ``dirty_inode``
> -	this method is called by the VFS to mark an inode dirty.
> +	this method is called by the VFS when an inode is marked dirty.
> +	This is specifically for the inode itself being marked dirty,
> +	not its data.  If the update needs to be persisted by fdatasync(),
> +	then I_DIRTY_DATASYNC will be set in the flags argument.
>  
>  ``write_inode``
>  	this method is called when the VFS needs to write an inode to
> diff --git a/fs/fs-writeback.c b/fs/fs-writeback.c
> index b7616bbd55336..2e6064012f7d3 100644
> --- a/fs/fs-writeback.c
> +++ b/fs/fs-writeback.c
> @@ -2259,7 +2259,7 @@ void __mark_inode_dirty(struct inode *inode, int flags)
>  		trace_writeback_dirty_inode_start(inode, flags);
>  
>  		if (sb->s_op->dirty_inode)
> -			sb->s_op->dirty_inode(inode, flags);
> +			sb->s_op->dirty_inode(inode, flags & I_DIRTY_INODE);
>  
>  		trace_writeback_dirty_inode(inode, flags);
>  
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
