Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CMGdAjP1w2lZvAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:46:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C71327078
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:46:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8MapugTXozyyPkz+WY0VH3l5jEARHHfNECpA8YtiHXU=; b=ZkUZX7G0AyRZDC4ysan8qmAS+m
	nbO3DW7P6BdKyJXxT4tQ0zcBqd64qktG8CFQew7kdgQimD0lwsRkSyyiS1xiOQ314D9TuhsTNt5jq
	IYmElO1jStlqj14XixUaXUf0zDq0pcbga/nkBt7OF+EzkLXL2Bs4rr2mCTOCR6nltXcs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5PUm-0005FB-Ko;
	Wed, 25 Mar 2026 14:46:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1w5PUl-0005F5-Ds
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tvyKhPZ3nzUkw+9X1/EbZaf8jGZ4iym5IrAaHhVdOec=; b=ZxqBbThJ+8Fqwc8HWlxcmS13C5
 Jei+RaFP7NL+/6TIUgunBPjH822u2V/K1pKGjUpsR6i+xsyBEkYsgl/Hx5da+wnJSirLevCL1CDOR
 TxeKvVQ0XcVurYJ0HK9SQ+/3HlkKHodLcsDR7dNDIk4IGTb5a8ApUdL7T/Hc+ZhYDa5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tvyKhPZ3nzUkw+9X1/EbZaf8jGZ4iym5IrAaHhVdOec=; b=T
 Qz42q0vXt7k4WXRW0bcCS00gvfVMVymSvZZYE8VmLFAQe+BQnhOymxFjelgI7hksk19XxQCbQYk8M
 rbwLinyIz+HKtJegs+vy+NJcsn/DyGaUwsOuyaqD39Yz9gtoJHgXOy2kTKV1aOHskDy+rkf14en0A
 hgehmvfVaXMBgAas=;
Received: from mail-qv1-f44.google.com ([209.85.219.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w5PUk-00040M-Rp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:46:07 +0000
Received: by mail-qv1-f44.google.com with SMTP id
 6a1803df08f44-89a06bc2f1bso76034316d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2026 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774449956; x=1775054756; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tvyKhPZ3nzUkw+9X1/EbZaf8jGZ4iym5IrAaHhVdOec=;
 b=sow+BwOMj9TlPZKcnT2lJ1FuWAIv9Y57a+xYG6g5vtBOaUl4LhYvGZc4NItSwRu1sH
 05JyTe2UD03TXB1jTt4B5/zu/2qsiQ71lcTuQhmqZ922VTl5iEpj/TAZwdtnIbRFCraK
 +Xvwue1gkap1X+swwrdIEPlUipOce0LIt0OiKTLqo+IhayHgA5XMxi2jV2CWsATrMUvV
 QwfPC4ufBZ3orqs4wi5i8BcYk3EAATwp+UkD2NRTmmoMflhj6viHTuUcU8QI66KLLtc3
 PObdYr4MZVuDO/eHT8wOzZk6y+Ek2yzv5Git9UWgkws6FQJB3Jo0Ob/QBJOQsnu+N1cN
 V6rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774449956; x=1775054756;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tvyKhPZ3nzUkw+9X1/EbZaf8jGZ4iym5IrAaHhVdOec=;
 b=bPR89HpHeKp+B5fAwKS/Zn7Nqrtn83JDZVbyUXtt0JB2oy3uqoLQMy+Lk09T9/uy3f
 pGIBotexmCopkWt2nJtEwS5d9cPSUi1G3rABVqF+UUrCEW0fC7y+ogwidxsNYkTJO/vP
 iVgFMMbHbDogwOK4h6N919egjyRahwhUHZsUSdBnSsziwlh9UN8osvbmEb4+PtDsC/xa
 ZYQWPypjx5sJOKgcFKc3MyQhF4DR5PFkrr+x/mOJ3JKlkpam2F1MVxHqPSTksfBE4Bts
 O70JnKJXkONtEsRH3Cnixj9sZEadARbYkQepFuiMaX84hvtEHlEjm8GjlcEJmX2LG6dD
 L0Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGtg3zEZacVY0C34PvhSUBLQmC6pvmnL7PGi3ibO+PFzDx5e/Q6Q0yoT+vMAymDWEIC8yroVmhEa0SRaoJDlhC@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyNxvkZ4zWVnhBZYBSQ6jR/yKONaW2vFAURsEwIivUlfpQq4oHg
 tohajA1xMF/zRV2MwgTJhSV4WFaib8ZBrVinZe4Esd6+MKhiA+zTIZQHOGeFJkEZ
X-Gm-Gg: ATEYQzxTRFiXT/pGMuH/9hhLJ+Fv537hbv4rKKvXhdmo9p2W1GTW8qIskyE2isfBldZ
 1fOxYfR8nWzpP6aZ3QcbcZCgYCROB83Z02kctyC5EJKnnbP7MK8un/NtlBAX0ZMrfywF4Ygu5gx
 cjzNRQ3sKv4t1vhU/N9htJHZlZGW5oBwssrt+AHTaxzfuAj0TTWcNeOQkwerN538QrxgWNGYfip
 M6hIUjqAQwepDvbqm4ZBrG4YyC5XhmOm5zGbcJNy6UC029Ydx5e2UASiKgvZSssHhk4FSyRNjw4
 zP4avFoWzsvn47EbSFv2cY5ZaFMYrAHR3lDIlLpeeyeGrHA5o5WUb9Kf4438O341nWzOcRUsp6B
 x/hzr2OfJdXMabBn00UM9E9G52pMJ1g2tjR2XOlcBCEm66Pj57l7Ntc4pTCDIzLiYCis9rIJGZf
 BP9gzaTgXPYF6/4PFpCt7WRqiyvDLIcMPkMvaGTFnoBdO2iyLDH+T4d+pjyJR2rCtRmec=
X-Received: by 2002:a17:90a:dfc8:b0:35c:936:d4cc with SMTP id
 98e67ed59e1d1-35c0dca8e19mr3369159a91.14.1774445877607; 
 Wed, 25 Mar 2026 06:37:57 -0700 (PDT)
Received: from lixiang-ThinkCentre-M755e-N000.company.local ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-c743a7ff961sm11644178a12.5.2026.03.25.06.37.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 06:37:57 -0700 (PDT)
From: ruipengqi <ruipengqi3@gmail.com>
To: jaegeuk@kernel.org
Date: Wed, 25 Mar 2026 21:37:49 +0800
Message-Id: <20260325133749.1053541-1-ruipengqi3@gmail.com>
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
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.44 listed in wl.mailspike.net]
X-Headers-End: 1w5PUk-00040M-Rp
Subject: [f2fs-dev] [PATCH] f2fs: fix potential deadlock in f2fs_balance_fs()
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
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:ruipengqi3@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER(0.00)[ruipengqi3@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 63C71327078
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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
 f2fs_write_single_data_page+0x6e4/0x730  //0xfffffe0d6ca08300
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

To avoid this potential deadlock, always call f2fs_submit_merged_write
before triggering f2fs_gc in f2fs_balance_fs.

Signed-off-by: Ruipeng Qi <ruipengqi3@gmail.com>
---
 fs/f2fs/segment.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6a97fe76712b..b58299e49c23 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -454,6 +454,20 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 		io_schedule();
 		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
 	} else {
+
+		/*
+		 * Before triggering foreground GC, submit all cached DATA
+		 * write bios. During writeback, pages may be added to
+		 * write_io[DATA].bio with PG_writeback set but the bio not
+		 * yet submitted. If GC's move_data_page() blocks on
+		 * __folio_lock() for such a folio, and the lock holder waits
+		 * for PG_writeback to clear via VFS folio_wait_writeback()
+		 * neither thread can make progress. Flushing here ensures
+		 * the bio completion callback can clear PG_writeback.
+		 */
+
+		f2fs_submit_merged_write(sbi, DATA);
+
 		struct f2fs_gc_control gc_control = {
 			.victim_segno = NULL_SEGNO,
 			.init_gc_type = f2fs_sb_has_blkzoned(sbi) ?
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
