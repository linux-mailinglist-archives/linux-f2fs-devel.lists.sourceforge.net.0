Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A29F4A5BFE7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Mar 2025 13:00:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tryHt-0007MQ-TF;
	Tue, 11 Mar 2025 12:00:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tryHr-0007MG-O1
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 12:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LuC9nZBhf11kZgPGPKxT9p4th/v6hRvVyoIeHqpcFUA=; b=iP09lbXm0Vlo447niVfjPNynwC
 wxsCRYJpcNNXRfROcEQehgxiUWdxg+Bps5DZlW/LVvCshH/SG8nbu0b+uheaIB7zMom7mSX0ItSrO
 NNATMQz3mfa2tV2meAoFHPeqIxWZzm2O3BLjG/d6bAx0RQnEq2vpV2VVR8HHGetVAzRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LuC9nZBhf11kZgPGPKxT9p4th/v6hRvVyoIeHqpcFUA=; b=Q62DP0pGRSbgFTGShEfoQ8Acba
 IBazh/TFvkuiHaUpbF61YYxKz9oXOL9bBHJ9kMnZHJ9c1uiwL5yPs4Ds17Bt/YguJXQERSZwGAF+V
 XvkWGp2+6yaV/8/y6t4JA4gMniCj6SqRInIrfRIhLXQCts0ckL4bKO5q94Y0BmF27qOI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tryHm-0006G3-Qs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Mar 2025 12:00:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id A74C65C61CA;
 Tue, 11 Mar 2025 11:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0426C4CEEC;
 Tue, 11 Mar 2025 12:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741694433;
 bh=UUkiOgx3l9K4c/V4+FZ1/gOMX9QIDKDarArDS8WEx9M=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=TW2bYuQnuLjiIIhKubGCj7e0KKKz/2eN9gynz5I27Ev8DqUTQiUJfySH2UqnuImLn
 g+zw7sMkPyytdcZUMMEHFB+mN39UyPm8eDm9eRZZvGAbegCfRvoj5qPMsqgnWA9Bna
 gS1J+FFV6hBsRhnjbxXdkKvNKKG7mQh19QJepnZ1ZA3T1JsG0a6H0QBXNo1MXMyshl
 EKYTNtLeB1YUgJnkWMn1x9cpWY+XbpvoioeWGJ94O2C8Lew8i2GbjdOwkyYsyaVnx0
 H8S5Ch03TTR0UjYV3Amsq2kEmZ/BH7o+BqsXIDW0AgqMiSJ3WK8Ss0YHOJEfxEkVhc
 lJphfKu5aMasA==
Message-ID: <936351d5-e99c-4c5b-bd8b-8d541122f709@kernel.org>
Date: Tue, 11 Mar 2025 20:00:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yohan Joung <jyh429@gmail.com>, jaegeuk@kernel.org, daeho43@gmail.com
References: <20250307145650.568-1-yohan.joung@sk.com>
Content-Language: en-US
In-Reply-To: <20250307145650.568-1-yohan.joung@sk.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 3/7/25 22:56, Yohan Joung wrote: > this is unnecessary
 when we know we are overwriting already allocated > blocks and the overhead
 of starting a transaction can be significant > especially for mult [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tryHm-0006G3-Qs
Subject: Re: [f2fs-dev] [PATCH] f2fs: optimize f2fs DIO overwrites
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 3/7/25 22:56, Yohan Joung wrote:
> this is unnecessary when we know we are overwriting already allocated
> blocks and the overhead of starting a transaction can be significant
> especially for multithreaded workloads doing small writes.

Hi Yohan,

So you're trying to avoid f2fs_map_lock() in dio write path, right?

Thanks,

> 
> Signed-off-by: Yohan Joung <yohan.joung@sk.com>
> ---
>  fs/f2fs/data.c | 20 ++++++++++++++++++++
>  fs/f2fs/f2fs.h |  1 +
>  fs/f2fs/file.c |  5 ++++-
>  3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 09437dbd1b42..728630037b74 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -4267,6 +4267,26 @@ static int f2fs_iomap_begin(struct inode *inode, loff_t offset, loff_t length,
>  	return 0;
>  }
>  
> +static int f2fs_iomap_overwrite_begin(struct inode *inode, loff_t offset,
> +		loff_t length, unsigned flags, struct iomap *iomap,
> +		struct iomap *srcmap)
> +{
> +	int ret;
> +
> +	/*
> +	 * Even for writes we don't need to allocate blocks, so just pretend
> +	 * we are reading to save overhead of starting a transaction.
> +	 */
> +	flags &= ~IOMAP_WRITE;
> +	ret = f2fs_iomap_begin(inode, offset, length, flags, iomap, srcmap);
> +	WARN_ON_ONCE(!ret && iomap->type != IOMAP_MAPPED);
> +	return ret;
> +}
> +
>  const struct iomap_ops f2fs_iomap_ops = {
>  	.iomap_begin	= f2fs_iomap_begin,
>  };
> +
> +const struct iomap_ops f2fs_iomap_overwrite_ops = {
> +	.iomap_begin	= f2fs_iomap_overwrite_begin,
> +};
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c6cc2694f9ac..0511ab5ed42a 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -3936,6 +3936,7 @@ void f2fs_destroy_post_read_processing(void);
>  int f2fs_init_post_read_wq(struct f2fs_sb_info *sbi);
>  void f2fs_destroy_post_read_wq(struct f2fs_sb_info *sbi);
>  extern const struct iomap_ops f2fs_iomap_ops;
> +extern const struct iomap_ops f2fs_iomap_overwrite_ops;
>  
>  static inline struct page *f2fs_find_data_page(struct inode *inode,
>  		pgoff_t index, pgoff_t *next_pgofs)
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 82b21baf5628..bb2fe6dac9b6 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4985,6 +4985,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  	const ssize_t count = iov_iter_count(from);
>  	unsigned int dio_flags;
>  	struct iomap_dio *dio;
> +	const struct iomap_ops *iomap_ops = &f2fs_iomap_ops;
>  	ssize_t ret;
>  
>  	trace_f2fs_direct_IO_enter(inode, iocb, count, WRITE);
> @@ -5025,7 +5026,9 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
>  	dio_flags = 0;
>  	if (pos + count > inode->i_size)
>  		dio_flags |= IOMAP_DIO_FORCE_WAIT;
> -	dio = __iomap_dio_rw(iocb, from, &f2fs_iomap_ops,
> +	else if (f2fs_overwrite_io(inode, pos, count))
> +		iomap_ops = &f2fs_iomap_overwrite_ops;
> +	dio = __iomap_dio_rw(iocb, from, iomap_ops,
>  			     &f2fs_iomap_dio_write_ops, dio_flags, NULL, 0);
>  	if (IS_ERR_OR_NULL(dio)) {
>  		ret = PTR_ERR_OR_ZERO(dio);



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
