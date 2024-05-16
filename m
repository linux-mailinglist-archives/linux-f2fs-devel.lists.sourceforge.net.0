Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6AB8C73C9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 May 2024 11:32:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s7XTX-0000ky-9j;
	Thu, 16 May 2024 09:32:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1s7XTV-0000ks-CN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 09:32:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/FKmLKERC6jycESIeSZQz9bVTxIhKocy36LuI0ttbXg=; b=h1UXkesEaDjm39QNrS7BO+j/1W
 Iee1qvhjp5W1cJjuMkAlT9NNfjKcT5Bqkhh6vchdP7ksOEvtOgoMVeYAD4R13AC8tKEWFSfuoJA3x
 vJZnIhf49AWibCG8Xlh2ikMn6NyNFRaT22RRXE7m9N5bvQPr8qLD+hfbN5RaofSKpv1U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/FKmLKERC6jycESIeSZQz9bVTxIhKocy36LuI0ttbXg=; b=DCEkRvfRCanChGl5f2vcs23Ite
 eyOCjMGwseOhAsd2gbSB1zQ+HOxL8MZFZYkOMIHOa2sWne6IFy6KNBGMV3jEB3UmeI7isPQg1dlse
 WPtLO6t1cDqKyxYWaolyLE/2zDoDm+oMe71yuHTPr6KZHdBOOLs49bzMzVXBt3vQzWPQ=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s7XTW-0006FI-72 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 May 2024 09:32:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A9D51CE1882;
 Thu, 16 May 2024 09:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57965C113CC;
 Thu, 16 May 2024 09:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715851940;
 bh=SoLSBSXOsFBOvO+gPHVZLRXS6EZu2pbQEyZVtrcKK3M=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nFVDV6Tw6MegjNUCIw2T1Ejg155ZkAuh8A+czvCBrt5T//NKR/i0aaHFXrIGJL6oO
 28ZBSgCVy0iZMCqxaNuRmtwdIS2NG97fYxappghSog8kgJ0fzeLOm/1Ei2+hgtdx+x
 Kvr4NajbgMRxp6zCKVmoK4bg+qWolpqPLY2LyzSw688PrI5AdaFAGS8wEbTh30/Qvg
 23tDtRgMy79L7nwMA0mp/Ouzppe5abAR/exk5XTYRvsWGqY9Ip2LUGnzvx+2979bRw
 U2qM8P07+2kq6R6ScxAkK1sHj7RJuh40pecyzGu8E1OCN1dJPHE3wDlYvbtOCwCf8V
 D2iEBrWQP8RGg==
Message-ID: <30a5f29b-886f-4ee7-93d1-8c3e1bb8bb49@kernel.org>
Date: Thu, 16 May 2024 17:32:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: sunshijie <sunshijie@xiaomi.corp-partner.google.com>, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
References: <20240516085512.1082640-1-sunshijie@xiaomi.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20240516085512.1082640-1-sunshijie@xiaomi.com>
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/5/16 16:55, sunshijie wrote: > When thread A calls
 kill_f2fs_super, Thread A first executes the code sbi->node_inode = NULL;
 > Then thread A may submit a bio to the function iput(sbi->meta_ino [...]
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1s7XTW-0006FI-72
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix panic in f2fs_put_super
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
Cc: sunshijie <sunshijie@xiaomi.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/5/16 16:55, sunshijie wrote:
> When thread A calls kill_f2fs_super, Thread A first executes the code sbi->node_inode = NULL;
> Then thread A may submit a bio to the function iput(sbi->meta_inode);
> Then thread A enters the process D state,
> Now that the bio submitted by thread A is complete, it calls f2fs_write_end_io and may trigger null-ptr-deref in NODE_MAPPING.

I didn't get it, if there is no cp_err, f2fs_write_checkpoint() in
f2fs_put_super() will flush all dirty pages of node_inode, if there is
cp_err, below flow will keep all dirty pages being truncated, and
there is sanity check on all types of dirty pages.

	/* our cp_error case, we can wait for any writeback page */
	f2fs_flush_merged_writes(sbi);

	f2fs_wait_on_all_pages(sbi, F2FS_WB_CP_DATA);

	if (err || f2fs_cp_error(sbi)) {
		truncate_inode_pages_final(NODE_MAPPING(sbi));
		truncate_inode_pages_final(META_MAPPING(sbi));
	}

	for (i = 0; i < NR_COUNT_TYPE; i++) {
		if (!get_pages(sbi, i))
			continue;
		f2fs_err(sbi, "detect filesystem reference count leak during "
			"umount, type: %d, count: %lld", i, get_pages(sbi, i));
		f2fs_bug_on(sbi, 1);
	}

So, is there any missing case that dirty page of node_inode is missed by
f2fs_put_super()?

Thanks,

> 
> Thread A                                          IRQ context
> - f2fs_put_super
>   - sbi->node_inode = NULL;
>   - iput(sbi->meta_inode);
>    - iput_final
>     - write_inode_now
>      - writeback_single_inode
>       - __writeback_single_inode
>        - filemap_fdatawait
>         - filemap_fdatawait_range
>          - __kcfi_typeid_free_transhuge_page
>           - __filemap_fdatawait_range
>            - wait_on_page_writeback
>             - folio_wait_writeback
>              - folio_wait_bit
>               - folio_wait_bit_common
>                - io_schedule
> 
>                                                    - __handle_irq_event_percpu
>                                                     - ufs_qcom_mcq_esi_handler
>                                                      - ufshcd_mcq_poll_cqe_nolock
>                                                       - ufshcd_compl_one_cqe
>                                                        - scsi_done
>                                                         - scsi_done_internal
>                                                          - blk_mq_complete_request
>                                                           - scsi_complete
>                                                            - scsi_finish_command
>                                                             - scsi_io_completion
>                                                              - scsi_end_request
>                                                               - blk_update_request
>                                                                - bio_endio
>                                                                 - f2fs_write_end_io
>                                                                  - NODE_MAPPING(sbi)
> 
> Signed-off-by: sunshijie <sunshijie@xiaomi.com>
> ---
>   fs/f2fs/super.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> index adffc9b80a9c..aeb085e11f9a 100644
> --- a/fs/f2fs/super.c
> +++ b/fs/f2fs/super.c
> @@ -1641,12 +1641,12 @@ static void f2fs_put_super(struct super_block *sb)
>   
>   	f2fs_destroy_compress_inode(sbi);
>   
> -	iput(sbi->node_inode);
> -	sbi->node_inode = NULL;
> -
>   	iput(sbi->meta_inode);
>   	sbi->meta_inode = NULL;
>   
> +	iput(sbi->node_inode);
> +	sbi->node_inode = NULL;
> +
>   	mutex_unlock(&sbi->umount_mutex);
>   
>   	/*


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
