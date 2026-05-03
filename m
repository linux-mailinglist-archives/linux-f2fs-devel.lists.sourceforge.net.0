Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eDKrJ+IZ92n5bwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 11:48:18 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3574B513F
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 03 May 2026 11:48:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YgBj0f/vBdvwWaGhJ+SiMPNilZwdg41U2Zl6YJ9pVW8=; b=DJVt/11aayi1I77R+r5FkdvKPb
	Y3yrkL01gjJMRrhjMlX2n/kFAfhwcXh0tePAyuVHAZKL5p8xMUQhJ6tYqMsV9+Ln9shU4kDEcHuKB
	OPBHwcbE3SXld4yV2pgKvEHRcDoIwpQ4UXTFLlfqDmwq+XYLwd7gINAs3Txzq4U8iQqw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJTQq-0002cq-IT;
	Sun, 03 May 2026 09:48:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wJTQo-0002ch-Ha
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 09:48:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LaGljEdrVHHZd5piAiCMQ3WOUEWHL035X2PfsRHUrOs=; b=GyNv5hx4rget/hNY0RCec/QyRT
 HoMMuOJ5wpyqk5yZEgpNuQaDtzF4oqKnKrAs9Ju5nWufMPxKFC0BZId/BBelahgKA3MPknV8a8Gkr
 gwL/hMDzTehqdg+O4iSs4LLy8uYeSqxQrg6bevdkr01yKn3zp3925HBHB2s4v5euUu2g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LaGljEdrVHHZd5piAiCMQ3WOUEWHL035X2PfsRHUrOs=; b=Zp9Z1HyTAfVynGMLsOcydxELkl
 baMlKUYDnyHx+01tsDrBvuNfpouTtU/w0JA3we/RHWlPsjsY9lID9JY+OHXVJ+JRjOpShSUJWTYAj
 v9A0ujxKzNCODyhH1Mzpip7KDtPokcPd1112Sdq6/zaVGHJeVXdijEBAoV2+Ajx2HVyk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wJTQn-00046C-41 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 03 May 2026 09:48:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8C0FE40300;
 Sun,  3 May 2026 09:48:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44597C2BCB4;
 Sun,  3 May 2026 09:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1777801683;
 bh=jCP1aZfbeEXQHCOMtZHbDHupbSzcuxXLiYWGTo4+nk0=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=VmMcOGTmI5S14RrW0zIBS31AkAtW2ZwllZtnhEVHSh6uFzaue5+hv+ciiOphQHjJE
 dP4EPeTNZ1w3VVB3SbdHPd2/bcfXN4AZyaiAIhqYbxDbE1Iwy0lF5J9Qqxel9YhvUO
 vZyVzJnFge9pMltWw/gQ9JRjVPuitecQrob1jWo4UpUm1PHKGt6oFA6/05cxXIVYse
 Y5OuRb2Xh/X4lesy0Xan9apr/lVPkNxOKb6szMes8ugECR6HwtOmIYdqwBU1gZmg6r
 NDvZVhXsb5r2U2AfeguKAv9IOTynYq1aDWDopAwpt3jaPcXnNzBt/CFoA6FASW/5kM
 MtUrHsvWYZIeg==
Message-ID: <e4b82e9f-c863-4d3a-8077-b56df9faa491@kernel.org>
Date: Sun, 3 May 2026 17:47:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: ruipengqi <ruipengqi3@gmail.com>, jaegeuk@kernel.org
References: <20260502124157.3406780-1-ruipengqi3@gmail.com>
Content-Language: en-US
In-Reply-To: <20260502124157.3406780-1-ruipengqi3@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/2/26 20:41,
 ruipengqi wrote: > From: Ruipeng Qi <ruipengqi3@gmail.com>
 > > When the f2fs filesystem space is nearly exhausted, we encounter deadlock
 > issues as below: > > INFO: task A:1890 block [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
X-Headers-End: 1wJTQn-00046C-41
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix potential deadlock in
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
X-Rspamd-Queue-Id: EA3574B513F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruipengqi3@gmail.com,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

On 5/2/26 20:41, ruipengqi wrote:
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
>   f2fs_write_single_data_page+0x6e4/0x730
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
> v3:
> - Fixed minor grammatical issues
> - Add comment on lockless list_empty() to explain why it is safe
>    without holding bio_list_lock
> 
> Suggested-by: Chao <chao@kernel.org>

Chao Yu <chao@kernel.org>, :)

> Signed-off-by: Ruipeng Qi <ruipengqi3@gmail.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
