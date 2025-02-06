Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9659AA29ED1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Feb 2025 03:34:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tfriN-0000Vj-Hb;
	Thu, 06 Feb 2025 02:34:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tfriM-0000VZ-La
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 02:34:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mXEV9HgXXnJzBr1Oav40gvLoRRb2MyaquC+u6QywesI=; b=Wq9T9D+lhNq4VY5KVbd5uY30af
 Gc3vXFItOjzMozDzjq9En2IQ6HXFjf71lwvNeFVuLZ+WGqyT9ukF0LtqSSWZjHqxILLazhGV/dE6g
 ModoB1lpjbW2uLdV8kILK+4KsxsYatPg3jCrq7saMt0ptlWFFrY1o3DtbPnDc9KBjpZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mXEV9HgXXnJzBr1Oav40gvLoRRb2MyaquC+u6QywesI=; b=Xji2DMPjLGd8cQi/NQfL8S9FAT
 B2d834zgkgqZLHBFbzNvsutJhHBtB7noCohAaHGGQ6o+F9rDzmK92oaZ+u69goE0q3glJCDmv3pSY
 udOUaC/BU8CR7zZowP3FDHVq1EAjJd6FzNLdEMPTEeQgzOOdTQOZb7tXlnLN/JMq+5C4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tfriL-0001mC-Qw for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Feb 2025 02:34:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 141FEA43E1D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Feb 2025 02:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD3C1C4CED1;
 Thu,  6 Feb 2025 02:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738809230;
 bh=I5vIuvKPhmp6PiFbC1WBEkInFmFSnvCcrl/cwPxZ34s=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=M5baBKKRlUMR7WYOZ+yZJpoDR4CA6nvykrI1+RGPQeNKE1sr+NiHfMvYRVZ8kcbRP
 yCgk9urObttDIyaW5J52tsy0lnBzpan6twuJnjNc+yDScMrAL4WrgwYr4hQuWDTo8q
 qwv3kaUR/6C6POL/nmi/VDUyVjXNa0bM2MrxNs6pUmP+dMq2PR9EmO4fu67WgavsYG
 1h7yhWrj5RAnr3BBMBYgKTjOQGfD+HhRDdajewolf3RrvaZMlA02QK9zSU7uizPhx1
 YR8WaWp16bykg827xVQcxMN3IZKy/Bc7OYaMM/Nvmnuz+SvwRlx+mAgBhdYu8+KIEG
 bGURPk/kdDLYA==
Message-ID: <7d99f84f-5f99-4434-a3ef-5054caee22ef@kernel.org>
Date: Thu, 6 Feb 2025 10:33:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20250205214014.3270585-1-jaegeuk@kernel.org>
Content-Language: en-US
In-Reply-To: <20250205214014.3270585-1-jaegeuk@kernel.org>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2/6/25 05:40, Jaegeuk Kim via Linux-f2fs-devel wrote: >
 This patch adds an ioctl to give a per-file priority hint to attach >
 REQ_PRIO.
 > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> > --- > f [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tfriL-0001mC-Qw
Subject: Re: [f2fs-dev] [PATCH] f2fs: add ioctl to get IO priority hint
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2/6/25 05:40, Jaegeuk Kim via Linux-f2fs-devel wrote:
> This patch adds an ioctl to give a per-file priority hint to attach
> REQ_PRIO.
> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  fs/f2fs/data.c            |  6 ++++++
>  fs/f2fs/f2fs.h            |  7 +++++++
>  fs/f2fs/file.c            | 20 ++++++++++++++++++++
>  include/uapi/linux/f2fs.h |  1 +
>  4 files changed, 34 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 07b46b444d31..24c5cb1f5ada 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -413,6 +413,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
>  static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>  {
>  	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
> +	struct folio *fio_folio = page_folio(fio->page);
>  	unsigned int fua_flag, meta_flag, io_flag;
>  	blk_opf_t op_flags = 0;
>  
> @@ -438,6 +439,11 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
>  		op_flags |= REQ_META;
>  	if (BIT(fio->temp) & fua_flag)
>  		op_flags |= REQ_FUA;
> +
> +	if (fio->type == DATA &&
> +	    F2FS_I(fio_folio->mapping->host)->ioprio_hint == F2FS_IOPRIO_WRITE)
> +		op_flags |= REQ_PRIO;
> +
>  	return op_flags;
>  }
>  
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bd0d8138b71d..c0a5f0df8781 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -816,6 +816,12 @@ enum {
>  	FI_MAX,			/* max flag, never be used */
>  };
>  
> +/* used for f2fs_inode_info->ioprio_hint. */
> +enum {
> +	F2FS_IOPRIO_WRITE = 1,	/* high write priority */
> +	F2FS_IOPRIO_MAX,
> +};

This needs to be exported to user via include/uapi/linux/f2fs.h

> +
>  struct f2fs_inode_info {
>  	struct inode vfs_inode;		/* serve a vfs inode */
>  	unsigned long i_flags;		/* keep an inode flags for ioctl */
> @@ -830,6 +836,7 @@ struct f2fs_inode_info {
>  
>  	/* Use below internally in f2fs*/
>  	unsigned long flags[BITS_TO_LONGS(FI_MAX)];	/* use to pass per-file flags */
> +	unsigned int ioprio_hint;	/* hint for IO priority */

Seems one bit in f2fs_inode_info->flags is enough to store write priority?

>  	struct f2fs_rwsem i_sem;	/* protect fi info */
>  	atomic_t dirty_pages;		/* # of dirty pages */
>  	f2fs_hash_t chash;		/* hash value of given file name */
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 642b8d85a035..2f93a27d2f45 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -3503,6 +3503,23 @@ static int f2fs_ioc_get_dev_alias_file(struct file *filp, unsigned long arg)
>  			(u32 __user *)arg);
>  }
>  
> +static int f2fs_ioc_io_prio(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	__u32 level;
> +
> +	if (get_user(level, (__u32 __user *)arg))
> +		return -EFAULT;
> +
> +	if (!S_ISREG(inode->i_mode) || level >= F2FS_IOPRIO_MAX)
> +		return -EINVAL;
> +
> +	inode_lock(inode);
> +	F2FS_I(inode)->ioprio_hint = level;
> +	inode_unlock(inode);
> +	return 0;
> +}
> +
>  int f2fs_precache_extents(struct inode *inode)
>  {
>  	struct f2fs_inode_info *fi = F2FS_I(inode);
> @@ -4606,6 +4623,8 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_ioc_compress_file(filp);
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
>  		return f2fs_ioc_get_dev_alias_file(filp, arg);
> +	case F2FS_IOC_IO_PRIO:
> +		return f2fs_ioc_io_prio(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -5321,6 +5340,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_DECOMPRESS_FILE:
>  	case F2FS_IOC_COMPRESS_FILE:
>  	case F2FS_IOC_GET_DEV_ALIAS_FILE:
> +	case F2FS_IOC_IO_PRIO:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
> index cd38a7c166e6..fb2f85b3c540 100644
> --- a/include/uapi/linux/f2fs.h
> +++ b/include/uapi/linux/f2fs.h
> @@ -46,6 +46,7 @@
>  #define F2FS_IOC_GET_DEV_ALIAS_FILE	_IOR(F2FS_IOCTL_MAGIC, 26, __u32)
>  #define F2FS_IOC_DONATE_RANGE		_IOW(F2FS_IOCTL_MAGIC, 27,	\
>  						struct f2fs_donate_range)
> +#define F2FS_IOC_IO_PRIO		_IOW(F2FS_IOCTL_MAGIC, 28, __u32)
>  
>  /*
>   * should be same as XFS_IOC_GOINGDOWN.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
