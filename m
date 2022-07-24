Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DECE757F4A9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Jul 2022 12:21:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oFYjX-0000Gt-Gv; Sun, 24 Jul 2022 10:21:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1oFYjW-0000Gd-3e
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 10:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sYKUVhtTmPFnUlHNPCswEEkWqIHbaJAQRWK7vkU/NF0=; b=UhoPMM8fE00Mc7tHNnstoCyNky
 U+qGzQ5Gi7EnwufXWZEu626PE+Hd0DLGarr71WNIZX4Z0S95yEFbqY12jl9ORdxOex9/WNyJwWKxP
 FdWvlyClgjIS4F/2oLPNw/mp2p/yyvduKAg0IqNR0JwOABjGBNVPpx/5tuqnSnavb+zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sYKUVhtTmPFnUlHNPCswEEkWqIHbaJAQRWK7vkU/NF0=; b=Fp86A8I0L7H8u2w2C/OU+We55h
 fN7GOlwI8sP9BdI9kqnenc+Hnt2BDVjnvEfVasgGtSRlAkeKqwJprKYumrOsMVGA/0QpX3uFid8tR
 wl0RGjkc/bSwwgqQaNmwwf61IRI6woOJGpFsxZh45YHjzMIJQ6OvKunsf0NYs4+U250c=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oFYjU-0006JD-36
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Jul 2022 10:21:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BAAAC60C88;
 Sun, 24 Jul 2022 10:21:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B791CC3411E;
 Sun, 24 Jul 2022 10:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658658062;
 bh=N/BRF6ybrbTj/8aBJzvPdT6j6K1TWBKn2MYdG1LcXhs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nkPCu9vSElkTL6Yk01gNIGAoF1F23y9wHIbO5pL5VkjftLiXMZOsSdRarudGN+djJ
 6kHeWUJJRc6erQuqoFDn8bZebY6MFRY9Y9mZqACC/bK2H4U1GFCP+Y5VykanijGbH/
 ZKLdAZjwP1jACgFJuomG5PiAwS/roRqnQgat0wHgNKlRWjH1cHbFq5yAivm616u/NP
 kw/HxBEcm2ef7rfb2h2QDVVQ8w0Glgh9GEBYeLAHIRV8n0Zx7qzQhfIMOVzgf0HlbX
 b3n+vbw0vOOK+D11Ayystysy/vlKcUnAEFrdjVEbPdu/7BFa0Ouosm2fTPfpx1jDRC
 HKOn5abbj7Ovg==
Message-ID: <e82f0d90-7fda-c944-149f-d18491008f3f@kernel.org>
Date: Sun, 24 Jul 2022 18:20:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Ye Bin <yebin10@huawei.com>, jaegeuk@kernel.org,
 Daeho Jeong <daeho43@gmail.com>
References: <20220718113609.154371-1-yebin10@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220718113609.154371-1-yebin10@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/7/18 19:36, Ye Bin wrote: > There is issue as follows
 when test f2fs atomic write: > F2FS-fs (loop0): Can't find valid F2FS
 filesystem
 in 2th superblock > F2FS-fs (loop0): invalid crc_offset: [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oFYjU-0006JD-36
Subject: Re: [f2fs-dev] [PATCH -next RFC] f2fs: fix null-ptr-deref in
 f2fs_get_dnode_of_data
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/7/18 19:36, Ye Bin wrote:
> There is issue as follows when test f2fs atomic write:
> F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
> F2FS-fs (loop0): invalid crc_offset: 0
> F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=1, run fsck to fix.
> F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=2, run fsck to fix.
> ==================================================================
> BUG: KASAN: null-ptr-deref in f2fs_get_dnode_of_data+0xac/0x16d0
> Read of size 8 at addr 0000000000000028 by task rep/1990
> 
> CPU: 4 PID: 1990 Comm: rep Not tainted 5.19.0-rc6-next-20220715 #266
> Call Trace:
>   <TASK>
>   dump_stack_lvl+0x6e/0x91
>   print_report.cold+0x49a/0x6bb
>   kasan_report+0xa8/0x130
>   f2fs_get_dnode_of_data+0xac/0x16d0
>   f2fs_do_write_data_page+0x2a5/0x1030
>   move_data_page+0x3c5/0xdf0
>   do_garbage_collect+0x2015/0x36c0
>   f2fs_gc+0x554/0x1d30
>   f2fs_balance_fs+0x7f5/0xda0
>   f2fs_write_single_data_page+0xb66/0xdc0
>   f2fs_write_cache_pages+0x716/0x1420
>   f2fs_write_data_pages+0x84f/0x9a0
>   do_writepages+0x130/0x3a0
>   filemap_fdatawrite_wbc+0x87/0xa0
>   file_write_and_wait_range+0x157/0x1c0
>   f2fs_do_sync_file+0x206/0x12d0
>   f2fs_sync_file+0x99/0xc0
>   vfs_fsync_range+0x75/0x140
>   f2fs_file_write_iter+0xd7b/0x1850
>   vfs_write+0x645/0x780
>   ksys_write+0xf1/0x1e0
>   do_syscall_64+0x3b/0x90
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> 
> As 3db1de0e582c commit changed atomic write way which new a cow_inode for
> atomic write file, and also mark cow_inode as FI_ATOMIC_FILE.
> When f2fs_do_write_data_page write cow_inode will use cow_inode's cow_inode
> which is NULL. Then will trigger null-ptr-deref.
> To solve above issue, don't mark cow_inode as FI_ATOMIC_FILE.
> 
> Fiexes: 3db1de0e582c("f2fs: change the current atomic write way")
> Signed-off-by: Ye Bin <yebin10@huawei.com>
> ---
>   fs/f2fs/file.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index 466eb00aa516..735802b6b754 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -2062,7 +2062,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
>   	spin_unlock(&sbi->inode_lock[ATOMIC_FILE]);
>   
>   	set_inode_flag(inode, FI_ATOMIC_FILE);
> -	set_inode_flag(fi->cow_inode, FI_ATOMIC_FILE);

It needs to remove clear_inode_flag(fi->cow_inode, FI_ATOMIC_FILE) in
f2fs_abort_atomic_write()?

To Daeho, could you please review this patch? IIUC, cow_inode doesn't
need to be set as atomic file?

Thanks,

>   	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
>   	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>   


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
