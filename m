Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDOyMLAg72lv7QAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 10:39:12 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DCBE646F3CD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Apr 2026 10:39:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2e5EXGH/5u/WOsRO0XSUCO+atjo08galJ6vleFc208A=; b=AS4ubEkIXdI58tzicUlCv/m7QG
	K2dV4fVJ9eqzorjz/WP0EKyJlnqAyYQRIIeYZYc2acnEtsBZPt5ZqUGpngge5Abx32ek4kAlISW8+
	zbaDtmUQW4DnIjB84Lv/5vZrwVPIpfi5TSmPtEPno3pDc7omSReaoEcSQlHOkPBsuPNU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wHHUY-0003NA-LS;
	Mon, 27 Apr 2026 08:38:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wHHUX-0003N2-IL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 08:38:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chPETR7+kABGlweLco9NDpos6Zs0+ILMn5JiNVXZEBw=; b=UV+heugK47FXRG0T0cCn0DtScq
 xT+gvWa8iVuUgGR+czBaVHyNJUnkUgb6JK2fWFPcF0pQqivJP6AN8EwhSssOGizFFIAIhVZZjqjwC
 pSba/k6jxUa2HdRF3ZTo1UTsojyZefoIMH3l4R3KH5hkQX5X1tRrsSLTavYhzHD+1PiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=chPETR7+kABGlweLco9NDpos6Zs0+ILMn5JiNVXZEBw=; b=L964O6R3m2RNMLB4HCqkMG917i
 PKwI1Vawc/t7WLCCKmI/8EAHQ0csMZlJjcHzWL6GFGTl8j5oeHoq0Nq0BY/IDZF1ENR5YZMx2KR1o
 bSuMqWBPQPfyirWgbm6+P/skIHG2f4ELs8cYJcVjP+oJJQwdnbfsrCxuKY3zv4VsgIvY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wHHUW-0007uO-BP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Apr 2026 08:38:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23DC360138;
 Mon, 27 Apr 2026 08:38:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FD13C19425;
 Mon, 27 Apr 2026 08:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777279124;
 bh=eCjFOfi6bWy4o5vcmh8YRjRtWrWHUOl5G3ZuBpJsrrU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=qrFiz3h/cVnm/21lORzFvglBxk1XBoCbsJ6TAt5FhsmOPKrZyxI402d84mnwZ+M6Z
 +3D543u5zKjQr67Twa2mV1apL1MNuDa+knl98mmPsiECM17VWgQR5l45Em7ci+zsZb
 YFPdxh9YB/FjLhqwfB08Osc0SRXWMU9wwWRlt+KyGEGND8bDNXZaGl17zSMqvxqWz9
 Zik29EjEB0vtF2OMQt4IBlAPh43KmqUriC3wa664SNjVAJ0ZqFhu06wzEfDnpUntKy
 j+IzN5zgR+K+EAN/gAbZxogX77MvCIgm+fX/AopHZNYG7M3G2ENdBm+kBVlwLJ7sdy
 nNYXi49t2PTVQ==
Message-ID: <d799ebe3-cbdb-4abf-8667-8ef8b112b48a@kernel.org>
Date: Mon, 27 Apr 2026 16:38:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ruipengqi <ruipengqi3@gmail.com>, jaegeuk@kernel.org
References: <20260426093239.165767-1-ruipengqi3@gmail.com>
Content-Language: en-US
In-Reply-To: <20260426093239.165767-1-ruipengqi3@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/26/26 17:32,
 ruipengqi wrote: > From: Ruipeng Qi <ruipengqi3@gmail.com>
 > > When the f2fs filesystem space is nearly exhausted, we encounter deadlock
 > issues as below: > > INFO: task A:1890 bloc [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wHHUW-0007uO-BP
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix potential deadlock in
 f2fs_balance_fs()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: DCBE646F3CD
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruipengqi3@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

On 4/26/26 17:32, ruipengqi wrote:
> From: Ruipeng Qi <ruipengqi3@gmail.com>
> 
> When the f2fs filesystem space is nearly exhausted, we encounter deadlock
> issues as below:
> 
> INFO: task A:1890 blocked for more than 120 seconds.
>        Tainted: G           O       6.12.41-g3fe07ddf05ab #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:A    state:D stack:0     pid:1890  tgid:1626  ppid:1153   flags:0x00000204
> Call trace:
>   __switch_to+0xf4/0x158
>   __schedule+0x27c/0x908
>   schedule+0x3c/0x118
>   io_schedule+0x44/0x68
>   folio_wait_bit_common+0x174/0x370
>   folio_wait_bit+0x20/0x38
>   folio_wait_writeback+0x54/0xc8
>   truncate_inode_partial_folio+0x70/0x1e0
>   truncate_inode_pages_range+0x1b0/0x450
>   truncate_pagecache+0x54/0x88
>   f2fs_file_write_iter+0x3e8/0xb80
>   do_iter_readv_writev+0xf0/0x1e0
>   vfs_writev+0x138/0x2c8
>   do_writev+0x88/0x130
>   __arm64_sys_writev+0x28/0x40
>   invoke_syscall+0x50/0x120
>   el0_svc_common.constprop.0+0xc8/0xf0
>   do_el0_svc+0x24/0x38
>   el0_svc+0x30/0xf8
>   el0t_64_sync_handler+0x120/0x130
>   el0t_64_sync+0x190/0x198
> 
> INFO: task kworker/u8:11:2680853 blocked for more than 120 seconds.
>        Tainted: G           O       6.12.41-g3fe07ddf05ab #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u8:11   state:D stack:0     pid:2680853 tgid:2680853 ppid:2      flags:0x00000208
> Workqueue: writeback wb_workfn (flush-254:0)
> Call trace:
>   __switch_to+0xf4/0x158
>   __schedule+0x27c/0x908
>   schedule+0x3c/0x118
>   io_schedule+0x44/0x68
>   folio_wait_bit_common+0x174/0x370
>   __filemap_get_folio+0x214/0x348
>   pagecache_get_page+0x20/0x70
>   f2fs_get_read_data_page+0x150/0x3e8
>   f2fs_get_lock_data_page+0x2c/0x160
>   move_data_page+0x50/0x478
>   do_garbage_collect+0xd38/0x1528
>   f2fs_gc+0x240/0x7e0
>   f2fs_balance_fs+0x1a0/0x208
>   f2fs_write_single_data_page+0x6e4/0x730  //0xfffffe0d6ca08300
>   f2fs_write_cache_pages+0x378/0x9b0
>   f2fs_write_data_pages+0x2e4/0x388
>   do_writepages+0x8c/0x2c8
>   __writeback_single_inode+0x4c/0x498
>   writeback_sb_inodes+0x234/0x4a8
>   __writeback_inodes_wb+0x58/0x118
>   wb_writeback+0x2f8/0x3c0
>   wb_workfn+0x2c4/0x508
>   process_one_work+0x180/0x408
>   worker_thread+0x258/0x368
>   kthread+0x118/0x128
>   ret_from_fork+0x10/0x200
> 
> INFO: task kworker/u8:8:2641297 blocked for more than 120 seconds.
>        Tainted: G           O       6.12.41-g3fe07ddf05ab #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u8:8    state:D stack:0     pid:2641297 tgid:2641297 ppid:2      flags:0x00000208
> Workqueue: writeback wb_workfn (flush-254:0)
> Call trace:
>   __switch_to+0xf4/0x158
>   __schedule+0x27c/0x908
>   rt_mutex_schedule+0x30/0x60
>   __rt_mutex_slowlock_locked.constprop.0+0x460/0x8a8
>   rwbase_write_lock+0x24c/0x378
>   down_write+0x1c/0x30
>   f2fs_balance_fs+0x184/0x208
>   f2fs_write_inode+0xf4/0x328
>   __writeback_single_inode+0x370/0x498
>   writeback_sb_inodes+0x234/0x4a8
>   __writeback_inodes_wb+0x58/0x118
>   wb_writeback+0x2f8/0x3c0
>   wb_workfn+0x2c4/0x508
>   process_one_work+0x180/0x408
>   worker_thread+0x258/0x368
>   kthread+0x118/0x128
>   ret_from_fork+0x10/0x20
> 
> INFO: task B:1902 blocked for more than 120 seconds.
>        Tainted: G           O       6.12.41-g3fe07ddf05ab #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:B     state:D stack:0     pid:1902  tgid:1626  ppid:1153   flags:0x0000020c
> Call trace:
>   __switch_to+0xf4/0x158
>   __schedule+0x27c/0x908
>   rt_mutex_schedule+0x30/0x60
>   __rt_mutex_slowlock_locked.constprop.0+0x460/0x8a8
>   rwbase_write_lock+0x24c/0x378
>   down_write+0x1c/0x30
>   f2fs_balance_fs+0x184/0x208
>   f2fs_map_blocks+0x94c/0x1110
>   f2fs_file_write_iter+0x228/0xb80
>   do_iter_readv_writev+0xf0/0x1e0
>   vfs_writev+0x138/0x2c8
>   do_writev+0x88/0x130
>   __arm64_sys_writev+0x28/0x40
>   invoke_syscall+0x50/0x120
>   el0_svc_common.constprop.0+0xc8/0xf0
>   do_el0_svc+0x24/0x38
>   el0_svc+0x30/0xf8
>   el0t_64_sync_handler+0x120/0x130
>   el0t_64_sync+0x190/0x198
> 
> INFO: task sync:2769849 blocked for more than 120 seconds.
>        Tainted: G           O       6.12.41-g3fe07ddf05ab #1
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:sync            state:D stack:0     pid:2769849 tgid:2769849 ppid:736    flags:0x0000020c
> Call trace:
>   __switch_to+0xf4/0x158
>   __schedule+0x27c/0x908
>   schedule+0x3c/0x118
>   wb_wait_for_completion+0xb0/0xe8
>   sync_inodes_sb+0xc8/0x2b0
>   sync_inodes_one_sb+0x24/0x38
>   iterate_supers+0xa8/0x138
>   ksys_sync+0x54/0xc8
>   __arm64_sys_sync+0x18/0x30
>   invoke_syscall+0x50/0x120
>   el0_svc_common.constprop.0+0xc8/0xf0
>   do_el0_svc+0x24/0x38
>   el0_svc+0x30/0xf8
>   el0t_64_sync_handler+0x120/0x130
>   el0t_64_sync+0x190/0x198
> 
> The root cause is a potential deadlock between the following tasks:
> 
> kworker/u8:11				Thread A
> - f2fs_write_single_data_page
>   - f2fs_do_write_data_page
>    - folio_start_writeback(X)
>    - f2fs_outplace_write_data
>     - bio_add_folio(X)
>   - folio_unlock(X)
> 					- truncate_inode_pages_range
> 					 - __filemap_get_folio(X, FGP_LOCK)
> 					 - truncate_inode_partial_folio(X)
> 					  - folio_wait_writeback(X)
>   - f2fs_balance_fs
>    - f2fs_gc
>     - do_garbage_collect
>      - move_data_page
>       - f2fs_get_lock_data_page
>        - __filemap_get_folio(X, FGP_LOCK)
> 
> Both threads try to access folio X. Thread A holds the lock but waits
> for writeback, while kworker waits for the lock. This causes a deadlock.
> 
> Other threads also enter D state, waiting for locks such as gc_lock and
> writepages.
> 
> OPU/IPU DATA folio are all affected by this issue. To avoid such
> potential deadlocks, always commit these cached folios before
> triggering f2fs_gc() in f2fs_balance_fs().
> 
> v2:
> - Commit cached OPU/IPU folios, not just OPU folios as in v1.
> 
> Suggested-by: Chao <chao@kernel.org>
> Signed-off-by: Ruipeng Qi <ruipengqi3@gmail.com>
> ---
>   fs/f2fs/data.c    | 26 ++++++++++++++++++++++++++
>   fs/f2fs/f2fs.h    |  1 +
>   fs/f2fs/segment.c |  9 +++++++++
>   3 files changed, 36 insertions(+)
> 
> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> index 338df7a2aea6..fd03366b3228 100644
> --- a/fs/f2fs/data.c
> +++ b/fs/f2fs/data.c
> @@ -939,6 +939,32 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
>   	}
>   }
>   
> +void f2fs_submit_all_merged_ipu_writes(struct f2fs_sb_info *sbi)
> +{
> +	struct bio_entry *be, *tmp;
> +	struct f2fs_bio_info *io;
> +	enum temp_type temp;
> +	LIST_HEAD(list);
> +
> +	for (temp = HOT; temp < NR_TEMP_TYPE; temp++) {
> +		io = sbi->write_io[DATA] + temp;
> +
> +		if (list_empty(&io->bio_list))
> +			continue;

Needs to be covered w/ bio_list_lock to avoid race condition.

> +
> +		f2fs_down_write(&io->bio_list_lock);
> +		list_splice_init(&io->bio_list, &list);
> +		f2fs_up_write(&io->bio_list_lock);
> +
> +		list_for_each_entry_safe(be, tmp, &list, list) {
> +			f2fs_submit_write_bio(sbi, be->bio, DATA);
> +			del_bio_entry(be);
> +		}
> +

Unnecessary blank line.

Thanks,

> +	}
> +
> +}
> +
>   int f2fs_merge_page_bio(struct f2fs_io_info *fio)
>   {
>   	struct bio *bio = *fio->bio;
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index bb34e864d0ef..e9038ab1b2bd 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -4148,6 +4148,7 @@ void f2fs_submit_merged_write_folio(struct f2fs_sb_info *sbi,
>   				struct folio *folio, enum page_type type);
>   void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
>   					struct bio **bio, struct folio *folio);
> +void f2fs_submit_all_merged_ipu_writes(struct f2fs_sb_info *sbi);
>   void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi);
>   int f2fs_submit_page_bio(struct f2fs_io_info *fio);
>   int f2fs_merge_page_bio(struct f2fs_io_info *fio);
> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> index 6a97fe76712b..856ffe91b94f 100644
> --- a/fs/f2fs/segment.c
> +++ b/fs/f2fs/segment.c
> @@ -454,6 +454,15 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
>   		io_schedule();
>   		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
>   	} else {
> +
> +		/*
> +		 * Submit all cached OPU/IPU DATA bios before triggering
> +		 * foreground GC to avoid potential deadlocks.
> +		 */
> +
> +		f2fs_submit_merged_write(sbi, DATA);
> +		f2fs_submit_all_merged_ipu_writes(sbi);
> +
>   		struct f2fs_gc_control gc_control = {
>   			.victim_segno = NULL_SEGNO,
>   			.init_gc_type = f2fs_sb_has_blkzoned(sbi) ?



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
