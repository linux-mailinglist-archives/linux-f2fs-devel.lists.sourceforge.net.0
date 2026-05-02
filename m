Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIICGjvx9WmVQgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 14:42:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6524B1F5D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 02 May 2026 14:42:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3V2P+G7cVT4nfmjSveqanMY8OAfLLiyamrUI/+FWaCQ=; b=l/1fsVtUx5vEouINM3lXikBZQn
	EGd685JGwNFO+EuR3E5TzzGHDOTeGgIBZrBI2O2x2VjEPaorXGsspEaOIq1Im+rBd1vFCMgHpPRsR
	bmRBttC0T69+f+eOSG9+6hqIoibtu/EpHuuKbFA1Owetiq9XwdA5xQJFIPkqKiqGZDps=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wJ9fr-0000Zd-3H;
	Sat, 02 May 2026 12:42:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1wJ9fq-0000ZT-29
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 12:42:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0TYlNOGKPAoKWtSOwNLPArH6N1dYOc6JBwGgHZq51pU=; b=TeUo40VwnXmaEmzq5LUHrQKoBp
 C0i46FFjsTQJhs3zYvPHBCVEpqFnFQow+Z+nLPs+kj2sbN3gUM76m18cXp4SYyXX1jMwIxmg/RbEb
 w0s05taqJ6ulVwl/Bkvl1+43fEAUjYorujV4zJOO8CRo7T2009PPFatHiThOO1/eNMUY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0TYlNOGKPAoKWtSOwNLPArH6N1dYOc6JBwGgHZq51pU=; b=U
 L10MKdfRPNHnQ9ge3IsUZMJTXYaDmSpx88N2J9bKqCLUXEnXoo/bGtic76BNvRqJwDLextJT/pQXk
 T5SSwKCrF7zZ1h08a8kmKf/3hyMpdtREBOcfGtYY6qVcZBD8fYx1xah23OxzGAse4gCfQcx7Z+iCk
 l8GMgLsvf4YTSmZk=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wJ9fl-0003qj-EM for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 02 May 2026 12:42:18 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-3651fa24c6bso138491a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 02 May 2026 05:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777725727; x=1778330527; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0TYlNOGKPAoKWtSOwNLPArH6N1dYOc6JBwGgHZq51pU=;
 b=pk4pc9kwYkYT+DDAy9na2dZXhg39iOTiOW5Lyqa8bxN3zwi+IToTO9MyknYyd021ok
 4mefkq9PdpDvi9rDIvJ8QKXZcSQ6R926jMK/TRoR8XCe+DjXpy4fS5jkUNsV52ttHbig
 yKX606qG8kHirBzws4DtkgSiBH2IE9qfX1ceOhOUJJjFTst0eFzVH7x89pu/lkcl1W5j
 yRov/Ir+G5NixDlf7EtqaNG2bvmkMUWM+dOENdDCYoWooSV8aT/FvHmUckteSz3ZlQW7
 VMDqDcDOTwQOlR92He0XKVepwWS5XlxS8ydkaMpxdKrKRkpWiFG6CxlP7I2ClIFA2oj2
 qqsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777725727; x=1778330527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0TYlNOGKPAoKWtSOwNLPArH6N1dYOc6JBwGgHZq51pU=;
 b=DIsXD72BNunN12+b2RKh+ecUvMQk6MuH1DYT5aVQXS7CHPuq9tq/q61es9FwFgNiY8
 79h+VLYViVSmkCYpr52M9qVd9MItIAfqG44lIfK5ANbbFUQFrUz8Nar+2UJmijn84Yho
 9kCwZJQkSNiWlnjsJhAq6jCHB84+/o4Kg/VGDZ9g6MxWrfVYBRUXzYweElDG8d6fEqvh
 7WLcUOJ7NCmOJMHsaP0DPSRCXk8X+wpLQr2PDTwHnenYrkxAViT1LDVneYNI0sB47lPF
 aVZEXMoESyc2NsjG6CyjwzBfmZ8JDSJfm8nDWk0iEf/4XMXaJ5ZoxY9Xm7BX0MKSuM6/
 LWIg==
X-Forwarded-Encrypted: i=1;
 AFNElJ8QadLVb5vJvIQRlOSK9xmtaP5Osyu/8OKJyLP/CBG/DsxVperxtqGp/k16OeWUJU7M/SqQK1u+rHzL1W+Ra7kP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzHbA99zzMO/pRz+pia6nBzS0Erc+rnAdgOMe+KBSn7JyjGVF/a
 1UJdlKxtWt7LLA8fkQkbaadiE5WwFuBiFPbzKMAr9PpGllo/Db6VVma5
X-Gm-Gg: AeBDietKVeVHUZ2krJSXQEBsNNphs9DpbmZhGSy8xQ4pUUoCoiVAW2R54Eqk1lHVmzV
 fKUN+FDWYcI5ykvd6vTlYEjBVQwILtum0dfrRwAurSNPqFsGmRyWCJz3clxJjGzlV0lFelkM5fx
 coMc0YaPTuheb33K7OTOAbySsLw1Piiv++Sv5OWHjCitz4dd6IO5B72lI0IrI/zGAdnAuAgPvfX
 GlBPtXu6Y+AKXA6QPpKKBpdFDKl0lvawnFx5Ez0mDuCehwmQ+F4WGkGwADLYbyh6PVMzIDxNjIJ
 u/VwdYaGym2z8lrj7mj9jsEqV6icbGRRW02tQVBgV15MY847DkGYqEVVFdvm/WgAOM2OtUtOrCJ
 copMvi0I7Cs1NljLhw307NYlekUu3O30dFzRhyvfd55UM4DpaBW0Ad5sObWkCWKn5OLTdDbVtBP
 S719+VGGTqmRMis2GeLH700kC91w04ehXb2wiccDprjoyq0crQ11F5nWU8EwoVorswkfLf5lHei
 CNBJ4OQz6EBAEbF
X-Received: by 2002:a17:90b:2b45:b0:35f:b69d:7292 with SMTP id
 98e67ed59e1d1-3650ce36fe3mr2803961a91.15.1777725726567; 
 Sat, 02 May 2026 05:42:06 -0700 (PDT)
Received: from lixiang-ThinkCentre-M755e-N000.company.local ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-364ebec73aasm5394930a91.2.2026.05.02.05.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2026 05:42:06 -0700 (PDT)
From: ruipengqi <ruipengqi3@gmail.com>
To: jaegeuk@kernel.org
Date: Sat,  2 May 2026 20:41:57 +0800
Message-Id: <20260502124157.3406780-1-ruipengqi3@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Ruipeng Qi When the f2fs filesystem space is nearly
 exhausted, we encounter deadlock issues as below: INFO: task A:1890 blocked
 for more than 120 seconds. Tainted: G O 6.12.41-g3fe07ddf05ab #1 "echo 0
 > /proc/sys/kernel/hung_task_timeout_secs" disables this message. task:A
 state:D stack:0 pid:1890 tgi [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wJ9fl-0003qj-EM
Subject: [f2fs-dev] [PATCH v3] f2fs: fix potential deadlock in
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
Cc: linux-kernel@vger.kernel.org, Ruipeng Qi <ruipengqi3@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 7B6524B1F5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:ruipengqi3@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FROM_HAS_DN(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns]

From: Ruipeng Qi <ruipengqi3@gmail.com>

When the f2fs filesystem space is nearly exhausted, we encounter deadlock
issues as below:

INFO: task A:1890 blocked for more than 120 seconds.
      Tainted: G           O       6.12.41-g3fe07ddf05ab #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:A    state:D stack:0     pid:1890  tgid:1626  ppid:1153   flags:0x00000204
Call trace:
 __switch_to+0xf4/0x158
 __schedule+0x27c/0x908
 schedule+0x3c/0x118
 io_schedule+0x44/0x68
 folio_wait_bit_common+0x174/0x370
 folio_wait_bit+0x20/0x38
 folio_wait_writeback+0x54/0xc8
 truncate_inode_partial_folio+0x70/0x1e0
 truncate_inode_pages_range+0x1b0/0x450
 truncate_pagecache+0x54/0x88
 f2fs_file_write_iter+0x3e8/0xb80
 do_iter_readv_writev+0xf0/0x1e0
 vfs_writev+0x138/0x2c8
 do_writev+0x88/0x130
 __arm64_sys_writev+0x28/0x40
 invoke_syscall+0x50/0x120
 el0_svc_common.constprop.0+0xc8/0xf0
 do_el0_svc+0x24/0x38
 el0_svc+0x30/0xf8
 el0t_64_sync_handler+0x120/0x130
 el0t_64_sync+0x190/0x198

INFO: task kworker/u8:11:2680853 blocked for more than 120 seconds.
      Tainted: G           O       6.12.41-g3fe07ddf05ab #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:11   state:D stack:0     pid:2680853 tgid:2680853 ppid:2      flags:0x00000208
Workqueue: writeback wb_workfn (flush-254:0)
Call trace:
 __switch_to+0xf4/0x158
 __schedule+0x27c/0x908
 schedule+0x3c/0x118
 io_schedule+0x44/0x68
 folio_wait_bit_common+0x174/0x370
 __filemap_get_folio+0x214/0x348
 pagecache_get_page+0x20/0x70
 f2fs_get_read_data_page+0x150/0x3e8
 f2fs_get_lock_data_page+0x2c/0x160
 move_data_page+0x50/0x478
 do_garbage_collect+0xd38/0x1528
 f2fs_gc+0x240/0x7e0
 f2fs_balance_fs+0x1a0/0x208
 f2fs_write_single_data_page+0x6e4/0x730
 f2fs_write_cache_pages+0x378/0x9b0
 f2fs_write_data_pages+0x2e4/0x388
 do_writepages+0x8c/0x2c8
 __writeback_single_inode+0x4c/0x498
 writeback_sb_inodes+0x234/0x4a8
 __writeback_inodes_wb+0x58/0x118
 wb_writeback+0x2f8/0x3c0
 wb_workfn+0x2c4/0x508
 process_one_work+0x180/0x408
 worker_thread+0x258/0x368
 kthread+0x118/0x128
 ret_from_fork+0x10/0x200

INFO: task kworker/u8:8:2641297 blocked for more than 120 seconds.
      Tainted: G           O       6.12.41-g3fe07ddf05ab #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:8    state:D stack:0     pid:2641297 tgid:2641297 ppid:2      flags:0x00000208
Workqueue: writeback wb_workfn (flush-254:0)
Call trace:
 __switch_to+0xf4/0x158
 __schedule+0x27c/0x908
 rt_mutex_schedule+0x30/0x60
 __rt_mutex_slowlock_locked.constprop.0+0x460/0x8a8
 rwbase_write_lock+0x24c/0x378
 down_write+0x1c/0x30
 f2fs_balance_fs+0x184/0x208
 f2fs_write_inode+0xf4/0x328
 __writeback_single_inode+0x370/0x498
 writeback_sb_inodes+0x234/0x4a8
 __writeback_inodes_wb+0x58/0x118
 wb_writeback+0x2f8/0x3c0
 wb_workfn+0x2c4/0x508
 process_one_work+0x180/0x408
 worker_thread+0x258/0x368
 kthread+0x118/0x128
 ret_from_fork+0x10/0x20

INFO: task B:1902 blocked for more than 120 seconds.
      Tainted: G           O       6.12.41-g3fe07ddf05ab #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:B     state:D stack:0     pid:1902  tgid:1626  ppid:1153   flags:0x0000020c
Call trace:
 __switch_to+0xf4/0x158
 __schedule+0x27c/0x908
 rt_mutex_schedule+0x30/0x60
 __rt_mutex_slowlock_locked.constprop.0+0x460/0x8a8
 rwbase_write_lock+0x24c/0x378
 down_write+0x1c/0x30
 f2fs_balance_fs+0x184/0x208
 f2fs_map_blocks+0x94c/0x1110
 f2fs_file_write_iter+0x228/0xb80
 do_iter_readv_writev+0xf0/0x1e0
 vfs_writev+0x138/0x2c8
 do_writev+0x88/0x130
 __arm64_sys_writev+0x28/0x40
 invoke_syscall+0x50/0x120
 el0_svc_common.constprop.0+0xc8/0xf0
 do_el0_svc+0x24/0x38
 el0_svc+0x30/0xf8
 el0t_64_sync_handler+0x120/0x130
 el0t_64_sync+0x190/0x198

INFO: task sync:2769849 blocked for more than 120 seconds.
      Tainted: G           O       6.12.41-g3fe07ddf05ab #1
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:sync            state:D stack:0     pid:2769849 tgid:2769849 ppid:736    flags:0x0000020c
Call trace:
 __switch_to+0xf4/0x158
 __schedule+0x27c/0x908
 schedule+0x3c/0x118
 wb_wait_for_completion+0xb0/0xe8
 sync_inodes_sb+0xc8/0x2b0
 sync_inodes_one_sb+0x24/0x38
 iterate_supers+0xa8/0x138
 ksys_sync+0x54/0xc8
 __arm64_sys_sync+0x18/0x30
 invoke_syscall+0x50/0x120
 el0_svc_common.constprop.0+0xc8/0xf0
 do_el0_svc+0x24/0x38
 el0_svc+0x30/0xf8
 el0t_64_sync_handler+0x120/0x130
 el0t_64_sync+0x190/0x198

The root cause is a potential deadlock between the following tasks:

kworker/u8:11				Thread A
- f2fs_write_single_data_page
 - f2fs_do_write_data_page
  - folio_start_writeback(X)
  - f2fs_outplace_write_data
   - bio_add_folio(X)
 - folio_unlock(X)
					- truncate_inode_pages_range
					 - __filemap_get_folio(X, FGP_LOCK)
					 - truncate_inode_partial_folio(X)
					  - folio_wait_writeback(X)
 - f2fs_balance_fs
  - f2fs_gc
   - do_garbage_collect
    - move_data_page
     - f2fs_get_lock_data_page
      - __filemap_get_folio(X, FGP_LOCK)

Both threads try to access folio X. Thread A holds the lock but waits
for writeback, while kworker waits for the lock. This causes a deadlock.

Other threads also enter D state, waiting for locks such as gc_lock and
writepages.

OPU/IPU DATA folio are all affected by this issue. To avoid such
potential deadlocks, always commit these cached folios before
triggering f2fs_gc() in f2fs_balance_fs().

v2:
- Commit cached OPU/IPU folios, not just OPU folios as in v1.

v3:
- Fixed minor grammatical issues
- Add comment on lockless list_empty() to explain why it is safe
  without holding bio_list_lock

Suggested-by: Chao <chao@kernel.org>
Signed-off-by: Ruipeng Qi <ruipengqi3@gmail.com>
---
 fs/f2fs/data.c    | 29 +++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/segment.c |  8 ++++++++
 3 files changed, 38 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 338df7a2aea6..98e3863b9b54 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -939,6 +939,35 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 	}
 }
 
+void f2fs_submit_all_merged_ipu_writes(struct f2fs_sb_info *sbi)
+{
+	struct bio_entry *be, *tmp;
+	struct f2fs_bio_info *io;
+	enum temp_type temp;
+
+	for (temp = HOT; temp < NR_TEMP_TYPE; temp++) {
+		LIST_HEAD(list);
+
+		io = sbi->write_io[DATA] + temp;
+
+		/* A lockless list_empty() check is safe here: any bios from
+		 * other kworkers that we miss will be submitted by those
+		 * kworkers accordingly.
+		 */
+		if (list_empty(&io->bio_list))
+			continue;
+
+		f2fs_down_write(&io->bio_list_lock);
+		list_splice_init(&io->bio_list, &list);
+		f2fs_up_write(&io->bio_list_lock);
+
+		list_for_each_entry_safe(be, tmp, &list, list) {
+			f2fs_submit_write_bio(sbi, be->bio, DATA);
+			del_bio_entry(be);
+		}
+	}
+}
+
 int f2fs_merge_page_bio(struct f2fs_io_info *fio)
 {
 	struct bio *bio = *fio->bio;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bb34e864d0ef..e9038ab1b2bd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4148,6 +4148,7 @@ void f2fs_submit_merged_write_folio(struct f2fs_sb_info *sbi,
 				struct folio *folio, enum page_type type);
 void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 					struct bio **bio, struct folio *folio);
+void f2fs_submit_all_merged_ipu_writes(struct f2fs_sb_info *sbi);
 void f2fs_flush_merged_writes(struct f2fs_sb_info *sbi);
 int f2fs_submit_page_bio(struct f2fs_io_info *fio);
 int f2fs_merge_page_bio(struct f2fs_io_info *fio);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6a97fe76712b..b57d36f66681 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -462,6 +462,14 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 			.should_migrate_blocks = false,
 			.err_gc_skipped = false,
 			.nr_free_secs = 1 };
+
+		/*
+		 * Submit all cached OPU/IPU DATA bios before triggering
+		 * foreground GC to avoid potential deadlocks.
+		 */
+		f2fs_submit_merged_write(sbi, DATA);
+		f2fs_submit_all_merged_ipu_writes(sbi);
+
 		f2fs_down_write_trace(&sbi->gc_lock, &gc_control.lc);
 		stat_inc_gc_call_count(sbi, FOREGROUND);
 		f2fs_gc(sbi, &gc_control);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
