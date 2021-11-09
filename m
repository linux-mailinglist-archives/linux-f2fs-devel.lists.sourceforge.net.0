Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3FA44B154
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Nov 2021 17:40:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mkUAa-0005dS-4P; Tue, 09 Nov 2021 16:40:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2) (envelope-from
 <BATV+d5854fb4eedb8c199da5+6652+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1mkUAN-0005cA-Pv
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 16:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HrXSYw8rk4n+A4PZtzybK6DqKpPd/fbVLmvWcN7MKLY=; b=VWjvfjM1csji6v9nHb8+KdlQYk
 oVQMDTSTn9FN01FBMEHj3pCCwloojAKcTLJsA1mPPlI2u2WePZQhELhNawLUqay/TC6nGyBDy0mbb
 ETk51/xdMD04BS/3M6pApbsXrKtllKvHyv4SeN/IPEbNemvJXRdNgrZRpTvBVOFylX4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HrXSYw8rk4n+A4PZtzybK6DqKpPd/fbVLmvWcN7MKLY=; b=P7Dy6+bUj/HlCDb8QlpJYmMPQk
 Ug2sSqSZvalRO+aBMmZ0xH3Q6IfIRFeZJLN15CDNs4lEEuVNd9a2uUraVty4w+ocRK5qLYSpgCVrn
 UQkv0eVF8devZjZ4wBmsWY0FL+8kGvv2wbPoYkdvkzmMoPnQGkUqS0djRrBNjy03EWVs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mkUAI-0003Qz-A4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Nov 2021 16:40:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=HrXSYw8rk4n+A4PZtzybK6DqKpPd/fbVLmvWcN7MKLY=; b=UHjJm/M0a6jysVzwv55hP5Uzm0
 iK1H669wXcWisFWKFSki4/Ys5QBVqbHMvV9j2k8nqyNM2wfyzFm1sVQxeLirA/z0jTWRoCPP0jO8M
 KmZIOk1hXTrQTzbFuA8PdQs0Os9FYtElATLiI7crSQ80+LzhHhQv8XqmgGw0RQQaGQLmPZXUDDU14
 5sJDCSUVxgsqpXXmdRzhqe/Vqbfa/OLUXDh9qrjUv4iVCt453PNSWAurV7//B1mbO0jcfcw+0EQr5
 5/kAikwmtzYqjPKAdTUG5Ach3mso5A+4FGI0aXzIHzmhmsCBmOlChE2ehNLtUdC6qiDBT4cI1zT4C
 evdBOVbw==;
Received: from hch by bombadil.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1mkUA5-002iSj-NZ; Tue, 09 Nov 2021 16:39:53 +0000
Date: Tue, 9 Nov 2021 08:39:53 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <YYqkWWZZsMW49/xu@infradead.org>
References: <20211109021336.3796538-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211109021336.3796538-1-jaegeuk@kernel.org>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Nov 08, 2021 at 06:13:36PM -0800, Jaegeuk Kim wrote:
 > This patch adds a way to attach HIPRI by expanding the existing sysfs's
 > data_io_flag. User can measure IO performance by enabling it. NAK. This
 flag should only be used when explicitly specified by the submitter of the
 I/O. Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1mkUAI-0003Qz-A4
Subject: Re: [f2fs-dev] [PATCH] f2fs: provide a way to attach HIPRI for
 Direct IO
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
Cc: linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Nov 08, 2021 at 06:13:36PM -0800, Jaegeuk Kim wrote:
> This patch adds a way to attach HIPRI by expanding the existing sysfs's
> data_io_flag. User can measure IO performance by enabling it.

NAK.  This flag should only be used when explicitly specified by
the submitter of the I/O.

> 
> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> ---
>  Documentation/ABI/testing/sysfs-fs-f2fs | 16 +++++++++-------
>  fs/f2fs/data.c                          |  2 ++
>  fs/f2fs/f2fs.h                          |  3 +++
>  3 files changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
> index b268e3e18b4a..ac52e1c6bcbc 100644
> --- a/Documentation/ABI/testing/sysfs-fs-f2fs
> +++ b/Documentation/ABI/testing/sysfs-fs-f2fs
> @@ -369,13 +369,15 @@ Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
>  Description:	Give a way to attach REQ_META|FUA to data writes
>  		given temperature-based bits. Now the bits indicate:
>  
> -		+-------------------+-------------------+
> -		|      REQ_META     |      REQ_FUA      |
> -		+------+------+-----+------+------+-----+
> -		|    5 |    4 |   3 |    2 |    1 |   0 |
> -		+------+------+-----+------+------+-----+
> -		| Cold | Warm | Hot | Cold | Warm | Hot |
> -		+------+------+-----+------+------+-----+
> +		+------------+-------------------+-------------------+
> +		| HIPRI_DIO  |      REQ_META     |      REQ_FUA      |
> +		+------------+------+------+-----+------+------+-----+
> +		|          6 |    5 |    4 |   3 |    2 |    1 |   0 |
> +		+------------+------+------+-----+------+------+-----+
> +		|        All | Cold | Warm | Hot | Cold | Warm | Hot |
> +		+------------+------+------+-----+------+------+-----+
> +
> +		Note that, HIPRI_DIO bit is only for direct IO path.
>  
>  What:		/sys/fs/f2fs/<disk>/node_io_flag
>  Date:		June 2020
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 9f754aaef558..faa40aca2848 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3707,6 +3707,8 @@ static ssize_t f2fs_direct_IO(struct kiocb *iocb, struct iov_iter *iter)
>  		if (do_opu)
>  			down_read(&fi->i_gc_rwsem[READ]);
>  	}
> +	if (sbi->data_io_flag & HIPRI_DIO)
> +		iocb->ki_flags |= IOCB_HIPRI;
>  
>  	err = __blockdev_direct_IO(iocb, inode, inode->i_sb->s_bdev,
>  			iter, rw == WRITE ? get_data_block_dio_write :
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index ce9fc9f13000..094f1e8ff82b 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -1557,6 +1557,9 @@ struct decompress_io_ctx {
>  #define MAX_COMPRESS_LOG_SIZE		8
>  #define MAX_COMPRESS_WINDOW_SIZE(log_size)	((PAGE_SIZE) << (log_size))
>  
> +/* HIPRI for direct IO used in sysfs/data_io_flag */
> +#define HIPRI_DIO			(1 << 6)
> +
>  struct f2fs_sb_info {
>  	struct super_block *sb;			/* pointer to VFS super block */
>  	struct proc_dir_entry *s_proc;		/* proc entry */
> -- 
> 2.34.0.rc0.344.g81b53c2807-goog
> 
---end quoted text---


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
