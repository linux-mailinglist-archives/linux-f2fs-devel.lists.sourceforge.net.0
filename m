Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD93CE91EA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 10:01:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvKf6aRh6+vxnl/8hRqxBzxuv/RlGqeLhELS5SENQKs=; b=V/PiURGkKZEfofySZcYfVoXF2j
	NmaJSSZXTgM8qjMymwHw7PkwRnjf1O8TLEoKDeDcgXc6XgSB00kVcWNkJJrn06x5toKMB0Wnj3oZr
	+sGFUGwiOUF51x9MeSq/Y8wZ4+NRXDhLihnQYWMUMPh+QbxpJKtVCz38Ja67BJeP9wAQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaVbf-0006Ip-36;
	Tue, 30 Dec 2025 09:01:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaVbd-0006Ij-OZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 09:01:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6baJDt6/DJ85XkiWRZ4cJIFpfPK/EFaAAwhBDwf1aB0=; b=AHVxaO8S1eEkUAhBYDBnbSGPwS
 77SxA5ef3tTHccVd9+B4flvlm08YGrlEieUndXn8PrtFY34XoNRke+1bLCp3xibRgVeHDrqCAEzQs
 bgzZycgYIYS8+Ut/eBRkJqjjtHkvkDUXlBBAVYp6MSZTA3OgagkFiFGvksYLfWIwkJrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6baJDt6/DJ85XkiWRZ4cJIFpfPK/EFaAAwhBDwf1aB0=; b=KB87ZaSfMR0B9L4oZvAMSXcGQR
 wBpeFoLJRxa4w8PRGbVvMBRB8hZYLAaX3aaTnA4EJQfim+JqUAZ6ntct6uvjGUJPjFHoNXiEAM8zg
 bmfHQ365WXufhvl5Optz9lfPOJMSN4hsJi6wvT/1QYkTXDlvCN0fTK0+Ol4Mlys4BagQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaVbd-0001K4-2i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 09:01:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 777CC60010;
 Tue, 30 Dec 2025 09:01:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 365F0C4CEFB;
 Tue, 30 Dec 2025 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767085278;
 bh=3RD6b0CV0WiGb8Dtvh6DjCVks80EVoRwgL7H+etX43g=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=gRKnS37UvtT/r8VocYOe/oz50PUw75SZY6v8lx68+EETjgceIGGh+XSNSByDlXHI7
 xEy3movSFCmumDIXf9DDbLdVPSCu3/mvvYvSC3iSKX+PoBUPfi6nhYEDqatjMdU5rc
 LcjMqm/FGMGdFZ8gShj77ljwWClkrzo2gfq4/4u08puhoaCyH6s97HEcPzaYKFfgrG
 prftx8WxFmoN1AEtRJz3qC1AaCa5zOJBFi8K13djK+VwHy/yadUylR8GaJ28rp3Mak
 UJdPKs7QkD57DShKJnfjNcph9DWMzLBbZUR6OgiDRXZgc7u5/tejMe03AKibTj9uPz
 IMoBBf5yohMUg==
Message-ID: <1b4b042f-e496-4547-9562-c101678280b0@kernel.org>
Date: Tue, 30 Dec 2025 17:01:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
Content-Language: en-US
In-Reply-To: <20251230081429.8243-2-yangyongpeng.storage@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaVbd-0001K4-2i
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
> Signed-off-by: Sheng Yong <shengyong1@xiaomi.com>
> Signed-off-by: Jinbao Liu <liujinbao1@xiaomi.com>
> Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
