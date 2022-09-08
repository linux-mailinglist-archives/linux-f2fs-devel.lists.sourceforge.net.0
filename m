Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8328E5B1AC0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Sep 2022 12:58:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oWFEX-0008QJ-CZ;
	Thu, 08 Sep 2022 10:58:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oWFEU-0008Q9-MG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 10:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nfRTkgNPhAeUaamVLXT/Drx6KcFr8WzIrpKJwpMByCY=; b=IQyYd1eZiGWVyOOkcN3kNXrROR
 DiaueZmngUR9OxqZaVWqKf3PngnUgKy0GGapTx44IGVJmQOOrJgjWK0ms5AtpZhdoqPA0S3kORJc2
 zwYIQSIVlKyt42IezCBPt4/skJy7qOGi7+z+vuiJI6S8OfSVz/HufkOAFEAZCjXL3vuA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nfRTkgNPhAeUaamVLXT/Drx6KcFr8WzIrpKJwpMByCY=; b=gNLinRVtbFiNJH5xxKckHiL3uG
 ReiY+QvQRp0wEshsCndv2rMQlbxg3TnF/WR/42yR+OnkQrJUgHg2WKAGx1mV7jrp6CVqn35ygzcea
 wlrJDzvmp1yWHo9yjd2Ja36iECGF4bQLOf2pRQIvZdjARm6E42FdAgsUChlk0rR/Io+8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oWFEU-0024HU-0U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Sep 2022 10:58:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94E0661C22;
 Thu,  8 Sep 2022 10:58:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBD07C433C1;
 Thu,  8 Sep 2022 10:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662634680;
 bh=65Xz5LWNy5zeYP5z8NNG7GUzsoo/VQzp/ROjifsWCzA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=IDwnaXP5fIZ7Xf2XT8Fzh2nuWq0c+kJgnV0PD6vR/DARLCQHayEe3RV59afe+g5j4
 NKJiDl02U3NLIa3mW0IMjmy5fSFaPprefHC7eoLUpV/F1bvVOJDSHguVe+R96JJKMo
 6b/Q53Bfx223ugJxWarNRaghJhoYxMc/c00ZXNt6hnVPd5eCnuTbfWP+aAJySgNIk8
 VrU7AwwtSBqi/VzhT9UEVe25H9qh90ADobKaZ4tphMA0vusU9QbmIF6qNfxq9autYD
 XefVFUBwlKOf6dJVhiodNtgXBVXh5OugML9pviFrXOgGbQKVUA+THOkoahhc0Z0r80
 x7AZpWqV2XVng==
Message-ID: <f8b522ab-ff2f-c340-5640-e446c7e68d0a@kernel.org>
Date: Thu, 8 Sep 2022 18:57:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Content-Language: en-US
To: Shuqi Zhang <zhangshuqi3@huawei.com>, jaegeuk@kernel.org
References: <20220831022440.2985736-1-zhangshuqi3@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20220831022440.2985736-1-zhangshuqi3@huawei.com>
X-Spam-Score: -8.4 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/8/31 10:24, Shuqi Zhang wrote: > This is a BUG_ON
 issue as follows when running xfstest-generic-503: > WARNING: CPU: 21 PID:
 1385 at fs/f2fs/inode.c:762 f2fs_evict_inode+0x847/0xaa0 > Modules [...] 
 Content analysis details:   (-8.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oWFEU-0024HU-0U
Subject: Re: [f2fs-dev] [PATCH v2 -next] f2fs: fix wrong dirty page count
 when race between mmap and fallocate.
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

On 2022/8/31 10:24, Shuqi Zhang wrote:
> This is a BUG_ON issue as follows when running xfstest-generic-503:
> WARNING: CPU: 21 PID: 1385 at fs/f2fs/inode.c:762 f2fs_evict_inode+0x847/0xaa0
> Modules linked in:
> CPU: 21 PID: 1385 Comm: umount Not tainted 5.19.0-rc5+ #73
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.14.0-4.fc34 04/01/2014
> 
> Call Trace:
> evict+0x129/0x2d0
> dispose_list+0x4f/0xb0
> evict_inodes+0x204/0x230
> generic_shutdown_super+0x5b/0x1e0
> kill_block_super+0x29/0x80
> kill_f2fs_super+0xe6/0x140
> deactivate_locked_super+0x44/0xc0
> deactivate_super+0x79/0x90
> cleanup_mnt+0x114/0x1a0
> __cleanup_mnt+0x16/0x20
> task_work_run+0x98/0x100
> exit_to_user_mode_prepare+0x3d0/0x3e0
> syscall_exit_to_user_mode+0x12/0x30
> do_syscall_64+0x42/0x80
> entry_SYSCALL_64_after_hwframe+0x46/0xb0
> 
> Function flow analysis when BUG occurs:
> f2fs_fallocate                    mmap
>                                    do_page_fault
>                                      pte_spinlock  // ---lock_pte
>                                      do_wp_page
>                                        wp_page_shared
>                                          pte_unmap_unlock   // unlock_pte
>                                            do_page_mkwrite
>                                            f2fs_vm_page_mkwrite
>                                              down_read(invalidate_lock)
>                                              lock_page
>                                              if (PageMappedToDisk(page))
>                                                goto out;
>                                              // set_page_dirty  --NOT RUN
>                                              out: up_read(invalidate_lock);
>                                          finish_mkwrite_fault // unlock_pte
> f2fs_collapse_range
>    down_write(i_mmap_sem)
>    truncate_pagecache
>      unmap_mapping_pages
>        i_mmap_lock_write // down_write(i_mmap_rwsem)
>          ......
>          zap_pte_range
>            pte_offset_map_lock // ---lock_pte
>             set_page_dirty
>              f2fs_dirty_data_folio
>                if (!folio_test_dirty(folio)) {
>                                          fault_dirty_shared_page
>                                            set_page_dirty
>                                              f2fs_dirty_data_folio
>                                                if (!folio_test_dirty(folio)) {
>                                                  filemap_dirty_folio
>                                                  f2fs_update_dirty_folio // ++
>                                                }
>                                              unlock_page
>                  filemap_dirty_folio
>                  f2fs_update_dirty_folio // page count++
>                }
>            pte_unmap_unlock  // --unlock_pte
>        i_mmap_unlock_write  // up_write(i_mmap_rwsem)
>    truncate_inode_pages
>    up_write(i_mmap_sem)

Will this race condition affact f2fs private field update?

Thanks,

> 
> When race happens between mmap-do_page_fault-wp_page_shared and
> fallocate-truncate_pagecache-zap_pte_range, the zap_pte_range calls
> function set_page_dirty without page lock. Besides, though
> truncate_pagecache has immap and pte lock, wp_page_shared calls
> fault_dirty_shared_page without any. In this case, two threads race
> in f2fs_dirty_data_folio function. Page is set to dirty only ONCE,
> but the count is added TWICE by calling filemap_dirty_folio.
> Thus the count of dirty page cannot accord with the real dirty pages.
> 
> Following is the solution to in case of race happens without any lock.
> Since folio_test_set_dirty in filemap_dirty_folio is atomic, judge return
> value will not be at risk of race.
> 
> Signed-off-by: Shuqi Zhang <zhangshuqi3@huawei.com>
> ---
>   fs/f2fs/checkpoint.c | 3 +--
>   fs/f2fs/data.c       | 3 +--
>   fs/f2fs/node.c       | 3 +--
>   3 files changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> index 8259e0fa97e1..3a3329bf1033 100644
> --- a/fs/f2fs/checkpoint.c
> +++ b/fs/f2fs/checkpoint.c
> @@ -448,8 +448,7 @@ static bool f2fs_dirty_meta_folio(struct address_space *mapping,
>   
>   	if (!folio_test_uptodate(folio))
>   		folio_mark_uptodate(folio);
> -	if (!folio_test_dirty(folio)) {
> -		filemap_dirty_folio(mapping, folio);
> +	if (filemap_dirty_folio(mapping, folio)) {
>   		inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_META);
>   		set_page_private_reference(&folio->page);
>   		return true;
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index aa3ccddfa037..16c39bd948a0 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -3697,8 +3697,7 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
>   		folio_mark_uptodate(folio);
>   	BUG_ON(folio_test_swapcache(folio));
>   
> -	if (!folio_test_dirty(folio)) {
> -		filemap_dirty_folio(mapping, folio);
> +	if (filemap_dirty_folio(mapping, folio)) {
>   		f2fs_update_dirty_folio(inode, folio);
>   		return true;
>   	}
> diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> index e06a0c478b39..3506ffcb31f8 100644
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -2147,8 +2147,7 @@ static bool f2fs_dirty_node_folio(struct address_space *mapping,
>   	if (IS_INODE(&folio->page))
>   		f2fs_inode_chksum_set(F2FS_M_SB(mapping), &folio->page);
>   #endif
> -	if (!folio_test_dirty(folio)) {
> -		filemap_dirty_folio(mapping, folio);
> +	if (filemap_dirty_folio(mapping, folio)) {
>   		inc_page_count(F2FS_M_SB(mapping), F2FS_DIRTY_NODES);
>   		set_page_private_reference(&folio->page);
>   		return true;


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
