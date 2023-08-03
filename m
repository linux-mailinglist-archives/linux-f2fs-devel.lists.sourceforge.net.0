Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3FF076E744
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 13:47:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRWnJ-0000tm-4F;
	Thu, 03 Aug 2023 11:47:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jack@suse.cz>) id 1qRWnH-0000tg-St
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 11:47:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZRATTl9ze2dbUUVR6EVaJqJOlEgsHbOiGIMflJWuqI0=; b=fd84beggEWlxYzh4KXvW+nqfh9
 KnH18I5wILzuyIm2z4DDqd7ErFTEP2jDa4RdYUTsxcaJ0s6S4fFHY1blg7Ewtom5zFQ+Nqa3mNGeM
 +RQ654h+ytyPFsgLvID2mh+kSTi6KwznJbxUZ3Zxzql1LQvW64leCzdTxGuzb3VMk584=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZRATTl9ze2dbUUVR6EVaJqJOlEgsHbOiGIMflJWuqI0=; b=JzjxsxV4FWzFqf29foTmwamfo1
 8sGhsu8r9oEtigqtA+GxyAcv4/l/HizCP3jyzY6fXWsrUTsStCUfuDAvb03y6KmOIhXCGQIXzcahu
 NIopfoGTyg385V+YknWws7UoMQvjN6PQy2EmNgRlHczJshKfF4KMbYy8B9KvoPf0RVMY=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRWnF-00Bpzk-Iv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 11:47:04 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5113A1F747;
 Thu,  3 Aug 2023 11:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1691063212; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZRATTl9ze2dbUUVR6EVaJqJOlEgsHbOiGIMflJWuqI0=;
 b=h+EOnXJZ1jQZw9KNznDfrtEVfnT0I2iXG3/4HvbXo1yozv3rIJ+Wdq9MEXs36iEvzouiwa
 Qa8ClVd3Mwj47ujqwbT/HakaB10E6VKYHQZyrhi2fOcf6kBVnzu7m3kX6pRQr2zwBP0jIi
 nGT1wBjrem2o26HsmwfVoHsRyMvqQbg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1691063212;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZRATTl9ze2dbUUVR6EVaJqJOlEgsHbOiGIMflJWuqI0=;
 b=qfBkEeurvDJwpRK/HkPdKdpHXcX207g6s3ATzE+1nJ8sM1f44b6FY6WolKFsTJ/M5qyHi4
 gkmsb6FWy8DyysCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3A1D01333C;
 Thu,  3 Aug 2023 11:46:52 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id ymsfDqyTy2QOPAAAMHmgww
 (envelope-from <jack@suse.cz>); Thu, 03 Aug 2023 11:46:52 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
 id B5F2AA076B; Thu,  3 Aug 2023 13:46:51 +0200 (CEST)
Date: Thu, 3 Aug 2023 13:46:51 +0200
From: Jan Kara <jack@suse.cz>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20230803114651.ihtqqgthbdjjgxev@quack3>
References: <20230802154131.2221419-1-hch@lst.de>
 <20230802154131.2221419-3-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230802154131.2221419-3-hch@lst.de>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed 02-08-23 17:41:21, Christoph Hellwig wrote: > Use the
 generic setup_bdev_super helper to open the main block device > and do various
 bits of superblock setup instead of duplicating the > logic. [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qRWnF-00Bpzk-Iv
Subject: Re: [f2fs-dev] [PATCH 02/12] nilfs2: use setup_bdev_super to
 de-duplicate the mount code
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
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
 Christian Brauner <brauner@kernel.org>, linux-nilfs@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-fsdevel@vger.kernel.org,
 "Darrick J. Wong" <djwong@kernel.org>, Josef Bacik <josef@toxicpanda.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-ext4@vger.kernel.org, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed 02-08-23 17:41:21, Christoph Hellwig wrote:
> Use the generic setup_bdev_super helper to open the main block device
> and do various bits of superblock setup instead of duplicating the
> logic.  This includes moving to the new scheme implemented in common
> code that only opens the block device after the superblock has allocated.
> 
> It does not yet convert nilfs2 to the new mount API, but doing so will
> become a bit simpler after this first step.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

AFAICS nilfs2 could *almost* use mount_bdev() directly and then just do its
snapshot thing after mount_bdev() returns. But it has this weird logic
that: "if the superblock is already mounted but we can shrink the whole
dcache, then do remount instead of ignoring mount options". Firstly, this
looks racy - what prevents someone from say opening a file on the sb just
after nilfs_tree_is_busy() shrinks dcache? Secondly, it is inconsistent
with any other filesystem so it's going to surprise sysadmins not
intimately knowing nilfs2. Thirdly, from userspace you cannot tell what
your mount call is going to do. Last but not least, what is it really good
for? Ryusuke, can you explain please?

								Honza

> ---
>  fs/nilfs2/super.c | 81 ++++++++++++++++++-----------------------------
>  1 file changed, 30 insertions(+), 51 deletions(-)
> 
> diff --git a/fs/nilfs2/super.c b/fs/nilfs2/super.c
> index 0ef8c71bde8e5f..a5d1fa4e7552f6 100644
> --- a/fs/nilfs2/super.c
> +++ b/fs/nilfs2/super.c
> @@ -35,6 +35,7 @@
>  #include <linux/writeback.h>
>  #include <linux/seq_file.h>
>  #include <linux/mount.h>
> +#include <linux/fs_context.h>
>  #include "nilfs.h"
>  #include "export.h"
>  #include "mdt.h"
> @@ -1216,7 +1217,6 @@ static int nilfs_remount(struct super_block *sb, int *flags, char *data)
>  }
>  
>  struct nilfs_super_data {
> -	struct block_device *bdev;
>  	__u64 cno;
>  	int flags;
>  };
> @@ -1283,64 +1283,49 @@ static int nilfs_identify(char *data, struct nilfs_super_data *sd)
>  
>  static int nilfs_set_bdev_super(struct super_block *s, void *data)
>  {
> -	s->s_bdev = data;
> -	s->s_dev = s->s_bdev->bd_dev;
> +	s->s_dev = *(dev_t *)data;
>  	return 0;
>  }
>  
>  static int nilfs_test_bdev_super(struct super_block *s, void *data)
>  {
> -	return (void *)s->s_bdev == data;
> +	return !(s->s_iflags & SB_I_RETIRED) && s->s_dev == *(dev_t *)data;
>  }
>  
>  static struct dentry *
>  nilfs_mount(struct file_system_type *fs_type, int flags,
>  	     const char *dev_name, void *data)
>  {
> -	struct nilfs_super_data sd;
> +	struct nilfs_super_data sd = { .flags = flags };
>  	struct super_block *s;
> -	struct dentry *root_dentry;
> -	int err, s_new = false;
> +	dev_t dev;
> +	int err;
>  
> -	sd.bdev = blkdev_get_by_path(dev_name, sb_open_mode(flags), fs_type,
> -				     NULL);
> -	if (IS_ERR(sd.bdev))
> -		return ERR_CAST(sd.bdev);
> +	if (nilfs_identify(data, &sd))
> +		return ERR_PTR(-EINVAL);
>  
> -	sd.cno = 0;
> -	sd.flags = flags;
> -	if (nilfs_identify((char *)data, &sd)) {
> -		err = -EINVAL;
> -		goto failed;
> -	}
> +	err = lookup_bdev(dev_name, &dev);
> +	if (err)
> +		return ERR_PTR(err);
>  
> -	/*
> -	 * once the super is inserted into the list by sget, s_umount
> -	 * will protect the lockfs code from trying to start a snapshot
> -	 * while we are mounting
> -	 */
> -	mutex_lock(&sd.bdev->bd_fsfreeze_mutex);
> -	if (sd.bdev->bd_fsfreeze_count > 0) {
> -		mutex_unlock(&sd.bdev->bd_fsfreeze_mutex);
> -		err = -EBUSY;
> -		goto failed;
> -	}
>  	s = sget(fs_type, nilfs_test_bdev_super, nilfs_set_bdev_super, flags,
> -		 sd.bdev);
> -	mutex_unlock(&sd.bdev->bd_fsfreeze_mutex);
> -	if (IS_ERR(s)) {
> -		err = PTR_ERR(s);
> -		goto failed;
> -	}
> +		 &dev);
> +	if (IS_ERR(s))
> +		return ERR_CAST(s);
>  
>  	if (!s->s_root) {
> -		s_new = true;
> -
> -		/* New superblock instance created */
> -		snprintf(s->s_id, sizeof(s->s_id), "%pg", sd.bdev);
> -		sb_set_blocksize(s, block_size(sd.bdev));
> -
> -		err = nilfs_fill_super(s, data, flags & SB_SILENT ? 1 : 0);
> +		/*
> +		 * We drop s_umount here because we need to open the bdev and
> +		 * bdev->open_mutex ranks above s_umount (blkdev_put() ->
> +		 * __invalidate_device()). It is safe because we have active sb
> +		 * reference and SB_BORN is not set yet.
> +		 */
> +		up_write(&s->s_umount);
> +		err = setup_bdev_super(s, flags, NULL);
> +		down_write(&s->s_umount);
> +		if (!err)
> +			err = nilfs_fill_super(s, data,
> +					       flags & SB_SILENT ? 1 : 0);
>  		if (err)
>  			goto failed_super;
>  
> @@ -1366,24 +1351,18 @@ nilfs_mount(struct file_system_type *fs_type, int flags,
>  	}
>  
>  	if (sd.cno) {
> +		struct dentry *root_dentry;
> +
>  		err = nilfs_attach_snapshot(s, sd.cno, &root_dentry);
>  		if (err)
>  			goto failed_super;
> -	} else {
> -		root_dentry = dget(s->s_root);
> +		return root_dentry;
>  	}
>  
> -	if (!s_new)
> -		blkdev_put(sd.bdev, fs_type);
> -
> -	return root_dentry;
> +	return dget(s->s_root);
>  
>   failed_super:
>  	deactivate_locked_super(s);
> -
> - failed:
> -	if (!s_new)
> -		blkdev_put(sd.bdev, fs_type);
>  	return ERR_PTR(err);
>  }
>  
> -- 
> 2.39.2
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
