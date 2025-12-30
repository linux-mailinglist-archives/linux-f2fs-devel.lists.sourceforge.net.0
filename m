Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB1CE8D83
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 08:02:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADJYk2xXcEcbQH+0AqNUJfMLhHcK03Kh/ZFA6JED0TE=; b=dAvu1FP+XW16PClG4S4+F1uCwx
	Ws+CY6TX0M6ZYkhQj0PDSWQCfK/OJp3ER4SPNm1w5TgN3jiBgGeTb6+1IDWre/dDxgD5602drcVUW
	RcJZHP8UJcIl1Er8miDd9JgVsxRoozX4J9uG1dSw0qy1cqQbG8vZD0Xpa9RW226toSn8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaTk6-0002nV-6B;
	Tue, 30 Dec 2025 07:02:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaTk4-0002nO-Rp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 07:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SpeSIEg1ft1aFgB+10HgMtFB1pD0lTsC5/z6/LnD8TA=; b=mtxkREspoi0pKtI9eoZpsHhbo0
 yRsUI6mkodHkpOgpXAxqjFzRV9d3ItP0Kj6Tf03eblXzB/Ne8igZxdR86m8ekpHrgLQmtxGVA7cSc
 JI3b/lHL3QapL3iCjwBgt8iNbGfKCUfCWeY0tKLOCejprIU2ZXvzIDsrosZvurJwZjfE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SpeSIEg1ft1aFgB+10HgMtFB1pD0lTsC5/z6/LnD8TA=; b=Vp0Xi6hj5fGKj59XR9ZxCgWnci
 B6xFp3MXA2T7uumZyTXus0Ln/REARtaDwQ0FQClndhwHUN0TYsDpLJpRgkPwv57D8wb3pnssMnCcU
 14PHn98IxfqeynjCUc+lUurUueK1wlbTDjPHSRDWLa38wFEeaF2jGXhkCo712aOCZB8E=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaTk4-0000cs-9F for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 07:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id E255040616;
 Tue, 30 Dec 2025 07:01:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC402C4CEFB;
 Tue, 30 Dec 2025 07:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767078113;
 bh=0G5o1Veg79Df1S9mSzaVm70Eun66B2hr63UfYUjxRsU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=WeDLD8fWFyKXRE/X+ESiXZzSvUaECrm9ASfd5o2BYxGNt6VW/ZOgviMxHdUYgnkLR
 qk3tI/EnwyfB5jaDquStCkZ3Rm2fZsZ51h2GwG+knmPW+tG2HbeJyKIgBQ+L2NfHwo
 TbBzHoHyKBxDFwhchhIyoCqktEgLiIvwdZoBpSOMmwvF2btDMVuBYag41awIr40W03
 6+V6c59em+hv1oufR0E9kljf6b4rpME6Du0kk2+1Gc3qS5KpmgoXliRSQ3AEczOVeT
 d/G7SGnViyHg7qabitn2KTRneO37+++H64iJme3D7kzjgT4cLO4MK/g6Rzeg7u9Hh7
 E7PhuumMzZEQQ==
Message-ID: <c0500125-a353-40df-8fb6-d6e468364f6b@kernel.org>
Date: Tue, 30 Dec 2025 15:01:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251227062141.7722-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251227062141.7722-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/27/2025 2:21 PM, Yongpeng Yang wrote: > From: Yongpeng
 Yang <yangyongpeng@xiaomi.com> > > During SPO tests, when mounting F2FS,
 an -EINVAL error was returned from > f2fs_recover_inode_page. The [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaTk4-0000cs-9F
Subject: Re: [f2fs-dev] [PATCH v3 1/1] f2fs: fix IS_CHECKPOINTED flag
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

On 12/27/2025 2:21 PM, Yongpeng Yang wrote:
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
>      : __write_node_folio(last_folio)

One more question:

If the last folio was committed before f2fs_flush_nat_entries(), that means it was
written before do_checkpoint(), so why recovery can find it in node block chain?

Thanks,

>                                                - f2fs_flush_nat_entries
>                                                  : {struct nat_entry}->flag |= BIT(IS_CHECKPOINTED)
>                                               SPO
> 
> Thread A calls f2fs_need_dentry_mark(sbi, ino), and the last_folio has
> already been written once. However, the {struct nat_entry}->flag did not
> have the IS_CHECKPOINTED set, causing set_dentry_mark(last_folio, 1) and
> write last_folio again.
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
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
> ---
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
 >   >   	/* should add to global list before clearing PAGECACHE status */
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
