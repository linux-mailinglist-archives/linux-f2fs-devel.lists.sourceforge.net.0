Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0IgjAc7b7WnroAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Apr 2026 11:33:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 280E54694B0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Apr 2026 11:33:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NBf7jzyU0D93irVYhuH9xfFANjirGHWI1rd9wdw1BU=; b=Wdrueb2q07K071O1bMrroTLJ41
	IpzcuqtJ+9haEU3N+vzus1hn+jqR/EgNIw906lbEzzJ0m6Y+cQhEklsSAjuCkf3EigpUx66EfBbJ2
	YbH2W9gdYxccwXIfZeDLLibuW+paJNVyYycd3VmZ45xaVOhKT05bppV7/j4r4wXpoFis=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wGvrD-0007Oo-19;
	Sun, 26 Apr 2026 09:32:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ruipengqi3@gmail.com>) id 1wGvrB-0007Oh-41
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Apr 2026 09:32:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71Sok3rKbUy1B/Av+pUOK5C4qioSU3HHfbA1BUrgJ2E=; b=DbIOPCx0NT9M8/ZevXzjuk50Ek
 IdAXxKuuqMyRWdDXRJz3O+w7OVh0qedFoZGqnuwjqC6OTMtDw2JO36wBt/R99cxeOmGa7FZYjBigY
 Bhxp5V+jZyCg0bEEvuivyeP3IXbtyV7uEIr8enrszlLWESlVRqQYxKtkhKM3ApBQCmiY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=71Sok3rKbUy1B/Av+pUOK5C4qioSU3HHfbA1BUrgJ2E=; b=A
 uAGLFjI5FnH04S+O+wKaXEHnLmmiVQsglZsbIygGgbgoGL7otLBTG56FMRsX3HR8tJrNMNYgoV/az
 zmxSTnaE953RAQu9lcrvbbVfUvDBYqkkgc1qamenKFKAXhyf0gFc4gHVAhAICavpgcPBDqKwu3ibP
 vJ5PPLL/aIH5KDT4=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wGvrB-00016D-0y for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Apr 2026 09:32:53 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-35e576110adso6302613a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 26 Apr 2026 02:32:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1777195967; x=1777800767; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=71Sok3rKbUy1B/Av+pUOK5C4qioSU3HHfbA1BUrgJ2E=;
 b=e2hhU0pi+jte8GovCW0AcLR1gkWg5Z18aOcMzZjwYQu0O94trMx9hSLWsCgP+Gd/TC
 aFG7mzfFmDNd/K7XXy59KGjD1ySxGZgx7wGlywbutEMIsXhUkJ+ruzf3y53z33SVm2le
 UtqU8XAH3JOkgGnk/JpC3dadaBYbqro8QOTD3K6SBIAsQvumn8FnuxHsKXmByTH7HVAx
 Ot1d0aKwO7lLDYcW79+Q/arpq8frl6+pib3iSuFE7I5CLtU8TP4VF5L4HtkoDKUaXE3X
 ZrGYolMLLgOcnojwO5qoHabBL9Vq42Ee7lG2qMdWvwqGata48h0sFFNHeJQbJglLAa+B
 Yi5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1777195967; x=1777800767;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=71Sok3rKbUy1B/Av+pUOK5C4qioSU3HHfbA1BUrgJ2E=;
 b=ZaSbtQs8bPWtZ3MWT3gLzZsSXyEXhIxQLD6P0SJJP2Bl99oMQ/bLvxlNmfgKMB95ko
 jTEgSa6r03QgZvwGGl7XoC+Aw024YcBFUAC8GyGW5GFRafuv1YzBTpLRPreUm75F6zfq
 bpkZZPgqcq7QZU5M626FRfQplZwal8+1HkF3S69W5quewJi2FEA+xaBXTKovofElWmZw
 8qHK/bpSvd3PRvoAB2M8DSdLT4geW85mFAdbRiZ6k0q7SeVwz4JqZumK/Q+0uN0X5SRE
 M6kR6QcoQHnqWt7mVHUfVuQRXIynOML+WCWnRx5ePdZw3Fu7iX2KFc9iU3SgvqUTbIIy
 5U3w==
X-Forwarded-Encrypted: i=1;
 AFNElJ/lCXkE/yMmnm/cvY0qrCaE8ynxF66iJPrzHS4CsD1Uei/2adezwjMJjhkTD7ApX95H8nccV8FckHF7cEnvHGqL@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyQhBghNWX5XmLif32cory97jE3flhbbAWSuGAXWjsDjyZKBF9T
 IjUuhzDAK0z1LS8zxDKvMfBLJSKI7eDhnXCh7ILkBLkClpN7xaUvP88ta5Uz4Zr9
X-Gm-Gg: AeBDieuGoLEEStUAYvZxQLimNm0MAZxHC/ouEzvAYrFbfFWipq6CNcmMSNXHmuIM+9c
 4SQ2OdYnX9zvcPg6wPmAIvf2tKxXUlI9NvFIcn5SAASJji2M56D3OxVMC88tm2P8g2UGDOEl7p/
 UqeulodzDdJNJJIMmUnURbm8j/Z2ExTVPZ2rYdptzAuKbjFWe71Qbik4yxj12yyZjfwmfMf7ww4
 GgvUA9edziRhSb1jwT1B/+MXRyvWoBytJbhiTJ4dluWmsIqaugduA+rp6QNNXxf0kRVBkH4GeBG
 TOXx2F4n4zmLNICqqagBW0eo1IgadiSeo7TcQDs8iCg44VD5t204B+eFfc1R7FlzxbYmc1U+EWI
 DrUr3DkACeXcEn5drCbAkMMrYZvrgYlbb1cKUMBMGUOleTqKL2ba1fKL03rEUz10eax6S4gozm+
 PzwOqukoQO3A2S/nfbjFBhitdhHFM4hOFZ7fa8pK9yIu8RxMtJfXT5BnW87Fm2kRKw6bO92RPn6
 d46N3e12WWEAmE7
X-Received: by 2002:a17:90b:17cb:b0:35d:aa02:d776 with SMTP id
 98e67ed59e1d1-3613ffce5admr30597891a91.2.1777195967289; 
 Sun, 26 Apr 2026 02:32:47 -0700 (PDT)
Received: from lixiang-ThinkCentre-M755e-N000.company.local ([210.184.73.204])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-361417748aesm27642544a91.0.2026.04.26.02.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Apr 2026 02:32:46 -0700 (PDT)
From: ruipengqi <ruipengqi3@gmail.com>
To: jaegeuk@kernel.org
Date: Sun, 26 Apr 2026 17:32:39 +0800
Message-Id: <20260426093239.165767-1-ruipengqi3@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Ruipeng Qi When the f2fs filesystem space is nearly
 exhausted, we encounter deadlock issues as below: INFO: task A:1890 blocked
 for more than 120 seconds. Tainted: G O 6.12.41-g3fe07ddf05ab #1 "echo 0
 > /proc/sys/kernel/hung_task_timeout_secs" disables this message. task:A
 state:D stack:0 pid:1890 tgi [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [ruipengqi3(at)gmail.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [ruipengqi3(at)gmail.com]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wGvrB-00016D-0y
Subject: [f2fs-dev] [PATCH v2] f2fs: fix potential deadlock in
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
X-Rspamd-Queue-Id: 280E54694B0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
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

OPU/IPU DATA folio are all affected by this issue. To avoid such
potential deadlocks, always commit these cached folios before
triggering f2fs_gc() in f2fs_balance_fs().

v2:
- Commit cached OPU/IPU folios, not just OPU folios as in v1.

Suggested-by: Chao <chao@kernel.org>
Signed-off-by: Ruipeng Qi <ruipengqi3@gmail.com>
---
 fs/f2fs/data.c    | 26 ++++++++++++++++++++++++++
 fs/f2fs/f2fs.h    |  1 +
 fs/f2fs/segment.c |  9 +++++++++
 3 files changed, 36 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 338df7a2aea6..fd03366b3228 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -939,6 +939,32 @@ void f2fs_submit_merged_ipu_write(struct f2fs_sb_info *sbi,
 	}
 }
 
+void f2fs_submit_all_merged_ipu_writes(struct f2fs_sb_info *sbi)
+{
+	struct bio_entry *be, *tmp;
+	struct f2fs_bio_info *io;
+	enum temp_type temp;
+	LIST_HEAD(list);
+
+	for (temp = HOT; temp < NR_TEMP_TYPE; temp++) {
+		io = sbi->write_io[DATA] + temp;
+
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
+
+	}
+
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
index 6a97fe76712b..856ffe91b94f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -454,6 +454,15 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
 		io_schedule();
 		finish_wait(&sbi->gc_thread->fggc_wq, &wait);
 	} else {
+
+		/*
+		 * Submit all cached OPU/IPU DATA bios before triggering
+		 * foreground GC to avoid potential deadlocks.
+		 */
+
+		f2fs_submit_merged_write(sbi, DATA);
+		f2fs_submit_all_merged_ipu_writes(sbi);
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
