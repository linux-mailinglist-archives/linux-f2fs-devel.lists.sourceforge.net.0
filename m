Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A20A54AC94B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Feb 2022 20:16:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nH9Um-0006zL-1O; Mon, 07 Feb 2022 19:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nH9Uk-0006zF-L3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 19:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NY7zNf6rL3/BnBy5bNzD/07kFHXIVSfFnfi2M/mYxZY=; b=hyZVQbXj83jXONXErLNYDouzVc
 aUXF19cSPkIeNm/pPMHzJqheynUi2cUA30QefW+E8MQTMwn9ouV9lV2xi2nNUaYk/2yf5POsOV/AH
 PgNlvhff0KJF5oeaRCwNmRmFCp/D9iKn5CosJKbDdnNcakRXAh6M7s7sqP7QkhkdGeUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NY7zNf6rL3/BnBy5bNzD/07kFHXIVSfFnfi2M/mYxZY=; b=aEaCRkrs6+QAA95RK5uuo74Reh
 SRlanOgIktq0f2X2XLkhTdtp+tSaW7yyJZ18QaQHxLCfewYMTAjrzZgAnP8YCJarOfszSPYSe4wWe
 KC7JKsJfl3SxfFV23ZxIRitSzUCZqJN0lzaG3sVetZNq5v3MTJ+xYjuFZBpjF3sC69HQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nH9Ui-0006hP-Jv
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Feb 2022 19:16:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 60E0DB80EF6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Feb 2022 19:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03219C004E1;
 Mon,  7 Feb 2022 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644261365;
 bh=FX8ZhpIlZF+4RHH0iTaQPztnxFU3gZjZlumdpdlOJzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nH2L/yXFXkWChhV3VCclL8E2NfMRs46hGDZfdUS+NeLk26ueq9blVUKofZcMxyJuv
 4XSqNwJkk+WwgY36/WpUrWh4l08REKDiDGmOkITBFVgrOU1hLnvfQu6XYh5Y7pTpyB
 F7wIc2ybYsHimr8PEUjZt4aB44qTn40Bx2yZ9IUZxFYfx/kbZv+BR3SDHq9ZQ4c+rg
 4+Y613Qu9HMtCaNlXYe/hQ+VIyrmoglIWRABM9RlbME4zgJ926w4K3T6Tg6OEyI8CX
 RlGyGXC6RTViKQ3aj80lNq4WqY8wlPQpNvTw9TU4oENNPiHPRf70MUg5/Em7N818wr
 PfXLlO3vAFlKg==
Date: Mon, 7 Feb 2022 11:16:03 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YgFv85dH0dWFTZBx@google.com>
References: <20220204091005.49407-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220204091005.49407-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/04,
 Chao Yu wrote: > There is potential hangtask happened
 during swapfile's writeback: > > - loop_kthread_worker_fn - do_checkpoint
 > - kthread_worker_fn > - loop_queue_work > - lo_rw_aio > - f2 [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nH9Ui-0006hP-Jv
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: skip f2fs_preallocate_blocks() for
 overwrite case
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/04, Chao Yu wrote:
> There is potential hangtask happened during swapfile's writeback:
> 
> - loop_kthread_worker_fn		- do_checkpoint
>   - kthread_worker_fn
>    - loop_queue_work
>     - lo_rw_aio
>      - f2fs_file_write_iter
>       - f2fs_preallocate_blocks
>        - f2fs_map_blocks
> 					 - down_write
>         - down_read
>          - rwsem_down_read_slowpath
>           - schedule
> 
> One cause is f2fs_preallocate_blocks() will always be called no matter
> the physical block addresses are allocated or not.
> 
> This patch tries to check whether block addresses are all allocated with
> i_size and i_blocks of inode, it's rough because blocks can be allocated
> beyond i_size, however, we can afford skipping block preallocation in this
> condition since it's not necessary to do preallocation all the time.
> 
> Signed-off-by: Chao Yu <chao@kernel.org>
> ---
> v2:
> - check overwrite case with i_size and i_blocks roughly.
>  fs/f2fs/file.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index cfdc41f87f5d..09565d10611d 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -4390,6 +4390,16 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
>  	int flag;
>  	int ret;
>  
> +	/*
> +	 * It tries to check whether block addresses are all allocated,
> +	 * it's rough because blocks can be allocated beyond i_size,
> +	 * however, we can afford skipping block preallocation since
> +	 * it's not necessary all the time.
> +	 */
> +	if (F2FS_BLK_ALIGN(i_size_read(inode)) ==
> +			SECTOR_TO_BLOCK(inode->i_blocks))

Do we count i_blocks only for data?

> +		return 0;
> +
>  	/* If it will be an out-of-place direct write, don't bother. */
>  	if (dio && f2fs_lfs_mode(sbi))
>  		return 0;
> -- 
> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
