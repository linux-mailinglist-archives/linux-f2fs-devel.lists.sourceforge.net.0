Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E6E2F1928
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 16:06:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyylw-0000Uz-Jw; Mon, 11 Jan 2021 15:06:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1kyylv-0000Ue-6X
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:06:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MT7jCHPs7mawaRLnhPaIa5N6qQRLBWDpQ+kvUXOq87M=; b=E/aJnyGhcWWTGek0mZvrZaLA96
 OPzLdCvlaK5hzscBLVL61iu8sr86dbs38KvzUYb2cLov78JeLy8fpyE73SvBWqlnRU+p5AMEiKF0D
 JMYMttoR390JnUDmvnRuIJ2kdvXWd/kSGIGZ7ZHEUbCDtoW3Rhk1SWliZT2TRAt7mRLU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MT7jCHPs7mawaRLnhPaIa5N6qQRLBWDpQ+kvUXOq87M=; b=UJgBmharaK8ApJEejqDplbFd11
 Jmju4w5PdzdvMortvrLD/4mdc2mjM6VMH7XIBTgRxHmYw4BBcZ+dmsoloItHT+wTCxBUHPj957J+O
 BwO8V8Y4lEsJqjuAWW0gniFax2701wKHsAME26c8bIt/HazCF+KqZcK7ixzgAl5iF25U=;
Received: from mx2.suse.de ([195.135.220.15])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyylm-001O9q-W7
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 15:06:19 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id AE86FAD5C;
 Mon, 11 Jan 2021 15:06:04 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 84E5D1E0807; Mon, 11 Jan 2021 16:06:03 +0100 (CET)
Date: Mon, 11 Jan 2021 16:06:03 +0100
From: Jan Kara <jack@suse.cz>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20210111150603.GI18475@quack2.suse.cz>
References: <20210109075903.208222-1-ebiggers@kernel.org>
 <20210109075903.208222-11-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210109075903.208222-11-ebiggers@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [195.135.220.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kyylm-001O9q-W7
Subject: Re: [f2fs-dev] [PATCH v2 10/12] gfs2: don't worry about
 I_DIRTY_TIME in gfs2_fsync()
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

On Fri 08-01-21 23:59:01, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> The I_DIRTY_TIME flag is primary used within the VFS, and there's no
> reason for ->fsync() implementations to do anything with it.  This is
> because when !datasync, the VFS will expire dirty timestamps before
> calling ->fsync().  (See vfs_fsync_range().)  This turns I_DIRTY_TIME
> into I_DIRTY_SYNC.
> 
> Therefore, change gfs2_fsync() to not check for I_DIRTY_TIME.
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  fs/gfs2/file.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/fs/gfs2/file.c b/fs/gfs2/file.c
> index b39b339feddc9..7fe2497755a37 100644
> --- a/fs/gfs2/file.c
> +++ b/fs/gfs2/file.c
> @@ -749,7 +749,7 @@ static int gfs2_fsync(struct file *file, loff_t start, loff_t end,
>  {
>  	struct address_space *mapping = file->f_mapping;
>  	struct inode *inode = mapping->host;
> -	int sync_state = inode->i_state & I_DIRTY_ALL;
> +	int sync_state = inode->i_state & I_DIRTY;
>  	struct gfs2_inode *ip = GFS2_I(inode);
>  	int ret = 0, ret1 = 0;
>  
> @@ -762,7 +762,7 @@ static int gfs2_fsync(struct file *file, loff_t start, loff_t end,
>  	if (!gfs2_is_jdata(ip))
>  		sync_state &= ~I_DIRTY_PAGES;
>  	if (datasync)
> -		sync_state &= ~(I_DIRTY_SYNC | I_DIRTY_TIME);
> +		sync_state &= ~I_DIRTY_SYNC;
>  
>  	if (sync_state) {
>  		ret = sync_inode_metadata(inode, 1);
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
