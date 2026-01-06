Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7686CF744C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 06 Jan 2026 09:19:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NPVibJbtujZCXTQttt45qXsnlp7QFyAlD6YTJmmimwg=; b=C261wGKScmNePCDDtFIitFfzZ1
	TPVuZqReHNO5P9VsPZxxCmtRCkGCfSb6ZLsWioGk7xU9k8Q87Oe9EV5a2Y1O5oYBKF1Ib+Nuf6CSs
	plLDPlxKJQxZ9dQzKxutffFdShT2NPcs8YULdJof//ox0zeeSA4A31hMtVQerhNE+CY0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vd2Hd-00044h-LY;
	Tue, 06 Jan 2026 08:19:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vd2Hc-00044b-Mw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a7yU9Cms8u9TtmOpLWjqpPzEtmuEpp7cEXSSFDUqYyw=; b=V2aY26oSBqv62DXjBQgzbGJYic
 /f5WVp+nL4KmEoJe1H9e+AIoEr5kR8dZ0ohrvJuN/u3QnxhtZzLPHw+n8cA8YZvDOkRy9PwpwQcTC
 h+9vn73gFrUVPHYDQGeJpMAWic64ZE77PXSbz4W8lKtyp3vWiw9BydiBBj4aNk40yuWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a7yU9Cms8u9TtmOpLWjqpPzEtmuEpp7cEXSSFDUqYyw=; b=jKtSwe2atltcJIXKq0kre/lrUu
 TEujiFv9MfMoTSoZnoAIC4NiCd8YKKniX3VBjCZN7Yjwpufoq+KpVG0ffW9Vrav0XVpUQLTAQUzwd
 cHFBhS9kEqH/0rjdfIoKZ4QwAmng5Ii/KojrlVg8mRM7rvwGSP6VqGKh+/zvvglUaCww=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vd2Hc-0005zS-5N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Jan 2026 08:19:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id DB8B3432F4;
 Tue,  6 Jan 2026 08:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC3F6C116C6;
 Tue,  6 Jan 2026 08:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767687550;
 bh=QD3RGrxyYhQ90TPRt88PV1btcVspq35bRl6DGVe5+vI=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=jnWRCZyJSPv2VN5I3/YkXvkExwmCqJLeUHnrbD9bNEoAkkxGosTCusgPl7fm/KdS8
 UK+AGTxgLm+NRug2V0oaDENX4H+lnreP9Ta97/HBndGkn6yqqup47Z8CiVxkr7pnrG
 YP/vPZbb21Cej/s+Pci5DRq5nIQ+syFuTmvBK/c1klBGgZOQD4jBLUEqLycl5edOJv
 68F8m7TlWmwqIrjDTA3yvPmWAeWEA0KdcuxHdwuAKFuOhGIaRVSBpp3fyp5fK8O0wL
 tFyoj94a1kJl4dw1W87/jHgWz6vY8QDEtQFeRBaIcM2Cp2X0j2n7I5sCPtul6ab0uH
 dF+cxbOGzfZfg==
Message-ID: <56c2f3d8-51ca-4808-8224-52ec1e6b50cd@kernel.org>
Date: Tue, 6 Jan 2026 16:19:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/30/2025 4:14 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > During SPO tests, when mounting F2FS,
 an -EINVAL error was returned from > f2fs_recover_inode_page. The [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vd2Hc-0005zS-5N
Subject: Re: [f2fs-dev] [PATCH v4 1/1] f2fs: fix IS_CHECKPOINTED flag
 inconsistency issue caused by concurrent atomic commit and checkpoint
 writes
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
Cc: Jinbao Liu <jinbaoliu365@gmail.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>, Jinbao Liu <liujinbao1@xiaomi.com>,
 Sheng Yong <shengyong1@xiaomi.com>, linux-f2fs-devel@lists.sourceforge.net,
 Yongpeng Yang <yangyongpeng.storage@outlook.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/30/2025 4:14 PM, Yongpeng Yang wrote:
> From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> 
> During SPO tests, when mounting F2FS, an -EINVAL error was returned from
> f2fs_recover_inode_page. The issue occurred under the following scenario
> 
> Thread A                                     Thread B
> f2fs_ioc_commit_atomic_write
>   - f2fs_do_sync_file // atomic = true
>    - f2fs_fsync_node_pages
>      : last_folio = inode folio
>      : schedule before folio_lock(last_folio) f2fs_write_checkpoint
>                                                - block_operations// writeback last_folio
>                                                - schedule before f2fs_flush_nat_entries
>      : set_fsync_mark(last_folio, 1)
>      : set_dentry_mark(last_folio, 1)
>      : folio_mark_dirty(last_folio)
>      - __write_node_folio(last_folio)
>        : f2fs_down_read(&sbi->node_write)//block
>                                                - f2fs_flush_nat_entries
>                                                  : {struct nat_entry}->flag |= BIT(IS_CHECKPOINTED)
>                                                - unblock_operations
>                                                  : f2fs_up_write(&sbi->node_write)
>                                               f2fs_write_checkpoint//return
>        : f2fs_do_write_node_page()
> f2fs_ioc_commit_atomic_write//return
>                                               SPO
> 
> Thread A calls f2fs_need_dentry_mark(sbi, ino), and the last_folio has
> already been written once. However, the {struct nat_entry}->flag did not
> have the IS_CHECKPOINTED set, causing set_dentry_mark(last_folio, 1) and
> write last_folio again after Thread B finishes f2fs_write_checkpoint.
> 
> After SPO and reboot, it was detected that {struct node_info}->blk_addr
> was not NULL_ADDR because Thread B successfully write the checkpoint.
> 
> This issue only occurs in atomic write scenarios. For regular file
> fsync operations, the folio must be dirty. If
> block_operations->f2fs_sync_node_pages successfully submit the folio
> write, this path will not be executed. Otherwise, the
> f2fs_write_checkpoint will need to wait for the folio write submission
> to complete, as sbi->nr_pages[F2FS_DIRTY_NODES] > 0. Therefore, the
> situation where f2fs_need_dentry_mark checks that the {struct
> nat_entry}->flag /wo the IS_CHECKPOINTED flag, but the folio write has
> already been submitted, will not occur.
> 
> Therefore, for atomic file fsync, sbi->node_write should be acquired
> through __write_node_folio to ensure that the IS_CHECKPOINTED flag
> correctly indicates that the checkpoint write has been completed.
> 
> Fixes: 608514deba38 ("f2fs: set fsync mark only for the last dnode")

Oh, need Cc stable tag to make sure the patch can be backported to
LTS kernel.

Cc: stable@kernel.org

> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
> v4:
> - Clarify when the last_folio write completes in the commit message.
> v3:
> - Add detailed explanations for why fsync operations on regular files do
> not hit this issue.
> v2:
> - If atomic is true, set_dentry_mark in __write_node_folio.
> ---
>   fs/f2fs/node.c | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index 482a362f2625..2c6102bee349 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1774,8 +1774,13 @@ static bool __write_node_folio(struct folio *folio, bool atomic, bool *submitted
>   		goto redirty_out;
>   	}
>   
> -	if (atomic && !test_opt(sbi, NOBARRIER))
> -		fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> +	if (atomic) {
> +		if (!test_opt(sbi, NOBARRIER))
> +			fio.op_flags |= REQ_PREFLUSH | REQ_FUA;
> +		if (IS_INODE(folio))
> +			set_dentry_mark(folio,
> +				f2fs_need_dentry_mark(sbi, ino_of_node(folio)));
> +	}
>   
>   	/* should add to global list before clearing PAGECACHE status */
>   	if (f2fs_in_warm_node_list(sbi, folio)) {
> @@ -1916,8 +1921,9 @@ int f2fs_fsync_node_pages(struct f2fs_sb_info *sbi, struct inode *inode,
>   					if (is_inode_flag_set(inode,
>   								FI_DIRTY_INODE))
>   						f2fs_update_inode(inode, folio);
> -					set_dentry_mark(folio,
> -						f2fs_need_dentry_mark(sbi, ino));
> +					if (!atomic)
> +						set_dentry_mark(folio,
> +							f2fs_need_dentry_mark(sbi, ino));
>   				}
>   				/* may be written by other thread */
>   				if (!folio_test_dirty(folio))



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
