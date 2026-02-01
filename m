Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QOd9MmlJf2mDnAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 01 Feb 2026 13:39:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1D4C5E52
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 01 Feb 2026 13:39:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dUV5SlEqpCJUGtqMmjJpmumIG/B6mcxjqk8kPlNLgio=; b=LFemhVYO1QKXYCbVYZWgKmOv+g
	hqSi6ff+HkvI/1az1PqeNNWeypRSvWnYYHM+E3lzVdXd884PnGFdi/kWAWE/1rKlaz8TvjYWU+Pjm
	MjIQ+kviRv/ibtQ+lZajTqgsogUwdotsxHpV5ChyEpW1SQWbiKFB4LO11AUVbOhbw+Cc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmWj3-0008E2-IP;
	Sun, 01 Feb 2026 12:38:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=485db9022=shinichiro.kawasaki@wdc.com>)
 id 1vmWj2-0008Dw-U4 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Feb 2026 12:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tj2NqMi0ZA2lWQRL6ok4HRudwcu7q0ankdg7m1Irsps=; b=dciYvcNNtOCO78ZBqXFi7/BtfZ
 q3YqOwnurQYBet+dNreeoFpwUXyA7d/wUaTmKFIMyuK/+2LJ1OqGTe+2N9Jre7Uk8k8y5T2YLhlyt
 Tc0YQz2G6jugxC5+rvsGyi7Bio/eZRRYseV5qoIBHq9W+dp1zeKa4q+4Woo2enXQFIfY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Tj2NqMi0ZA2lWQRL6ok4HRudwcu7q0ankdg7m1Irsps=; b=E
 fpRoBQR/LKhknOqUZGn0pW1VZI0BQp1wLtqECWkvqRuuME4CJScWXSeHdjQRzFb0Y7lujqv78g8MV
 fCO1FWBc1ECiK4D/Lla0sUf1N1lEpZlFpGG08Tj0NakJtRMKB2CHHMrtvWIrJyggz7zBkJSZ5enSo
 2YmOhqZMa/fYbGHQ=;
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmWj1-0001TB-Vc for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 01 Feb 2026 12:38:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1769949528; x=1801485528;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=PGwiD57qt/6Za9jYzOH2pEYZaEU4OEwDcsvhvLmklLQ=;
 b=aTGagHGRJTbOy1g/rUhkrH1rUgbisQ1BYpTX/qKFceXM0H06sMv1WCyl
 PaaIytgvVcQBPEVciTlkIV88pQyims4E8hhS/+Y2f0a3y9bv3ohyKQCl0
 ys65QkGTcBMp+twPqzT5B2ySKnimtFQNzwULbYeMoEar6q4HfXqnnqdLB
 vpiYx8ZvzIxCqA6GklByTjUw0hcA6n6n00ROxbFgaa61hY0ZvEqSYpxED
 JOH4gnu6g1lRQnLLXtlOJlvyVOgIYqoIlIHLfFAkq7jv6mdyAfn5ChB2Z
 eNENzNKFLpVUrD952v92Yn3cOw8h2n6tWncYc2SN9jkoyL1ILvFZKSP2e Q==;
X-CSE-ConnectionGUID: UaVooG/rQAaY6bOGDLPBmA==
X-CSE-MsgGUID: l+5+zjMSROey0MfrejPC1g==
X-IronPort-AV: E=Sophos;i="6.21,266,1763395200"; d="scan'208";a="136422776"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep03.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 01 Feb 2026 20:22:59 +0800
IronPort-SDR: 697f45a3_br6z2Pk3/H3e5UE1vi5bIqlXzrd7KpPS1v+U90xqRICUM/V
 CJ0gIp3s+3U7TZvNxPc8Cr4ztIjGjYvoG6lOcjA==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep03.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 01 Feb 2026 04:22:59 -0800
WDCIronportException: Internal
Received: from unknown (HELO shindev.ssa.fujisawa.hgst.com) ([10.149.67.30])
 by uls-op-cesaip02.wdc.com with ESMTP; 01 Feb 2026 04:22:58 -0800
To: linux-f2fs-devel@lists.sourceforge.net, Jaegeuk Kim <jaegeuk@kernel.org>,
 Chao Yu <chao@kernel.org>
Date: Sun,  1 Feb 2026 21:22:57 +0900
Message-ID: <20260201122258.3168119-1-shinichiro.kawasaki@wdc.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A lockdep WARN [1] is observed recently with linux-next
 kernel
 when I run the workload with the following steps for a zoned TCMU device:
 1) Create a zoned TCMU device 2) Create a f2fs filesystem on the zoned TCMU
 device and mount it 3) Fill the filesystem with files and trigger GC 4) Unmout
 the filesystem 5) Remove the zoned TCMU devic [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1vmWj1-0001TB-Vc
Subject: [f2fs-dev] [PATCH for-next 0/1] f2fs: fix lockdep WARN of
 sbi->cp_global_sem and q->q_usage_counter
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
From: Shin'ichiro Kawasaki via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
 Damien Le Moal <dlemoal@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wdc.com:mid,wdc.com:replyto,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,wdc.com:s=dkim.wdc.com];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,wdc.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[shinichiro.kawasaki@wdc.com]
X-Rspamd-Queue-Id: CD1D4C5E52
X-Rspamd-Action: no action

A lockdep WARN [1] is observed recently with linux-next kernel when I
run the workload with the following steps for a zoned TCMU device:

1) Create a zoned TCMU device
2) Create a f2fs filesystem on the zoned TCMU device and mount it
3) Fill the filesystem with files and trigger GC
4) Unmout the filesystem
5) Remove the zoned TCMU device

The WARN is reported at the step 5).

The WARN is recreated in stable manner. I bisected and found the trigger
is commit 4a210a5be279 ("f2fs: improve check for enough free sections").
However, this commit does not look like the cause of the WARN. It just
changes GC trigger conditions. I think the lockdep WARN was hidden from
the beginning, and the trigger commit unveiled it.

The single patch in this series addresses the WARN. The whole WARN
message is long, then I share it in this cover letter as below.

[1]

[75353.324919][T552007] f2fs_gc_1762815636
[75353.914212][T552022] F2FS-fs (sdg): f2fs_recover_fsync_data: recovery fsync data, check_only: 0
[75353.934136][T552022] F2FS-fs (sdg): Checking entire write pointers
[75353.947159][T552022] F2FS-fs (sdg): Mounted with checkpoint version = dc0885
[75645.583261][T572068] [KTS]     f2fs_gc:  /dev/sdg: 0:04:53
[75645.781944][T572081] devconf_clean_061-fsgc-tcmu.config_1762815929
[75646.811854][T572171] 
[75646.814712][T572171] ======================================================
[75646.822242][T572171] WARNING: possible circular locking dependency detected
[75646.829746][T572171] 6.18.0-rc5-kts #1 Not tainted
[75646.835082][T572171] ------------------------------------------------------
[75646.842599][T572171] targetcli/572171 is trying to acquire lock:
[75646.849151][T572171] ffff8881145703e0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: start_flush_work+0x5a8/0xc20
[75646.860952][T572171] 
[75646.860952][T572171] but task is already holding lock:
[75646.869479][T572171] ffff88817deba820 (&q->q_usage_counter(queue)#23){++++}-{0:0}, at: del_gendisk+0x106/0x190
[75646.880080][T572171] 
[75646.880080][T572171] which lock already depends on the new lock.
[75646.880080][T572171] 
[75646.892312][T572171] 
[75646.892312][T572171] the existing dependency chain (in reverse order) is:
[75646.902481][T572171] 
[75646.902481][T572171] -> #3 (&q->q_usage_counter(queue)#23){++++}-{0:0}:
[75646.912498][T572171]        __lock_acquire+0x55d/0xbf0
[75646.918218][T572171]        lock_acquire.part.0+0xb8/0x230
[75646.924284][T572171]        blk_queue_enter+0x4d3/0x640
[75646.930090][T572171]        blk_mq_alloc_request+0x47f/0xa10
[75646.936327][T572171]        scsi_execute_cmd+0x256/0x700
[75646.942207][T572171]        sd_zbc_do_report_zones+0x1a6/0x450
[75646.948602][T572171]        sd_zbc_report_zones+0x320/0x980
[75646.954724][T572171]        blkdev_report_zones+0x1b4/0x390
[75646.960844][T572171]        do_fix_curseg_write_pointer+0x2f6/0x1420 [f2fs]
[75646.968431][T572171]        f2fs_check_and_fix_write_pointer+0x381/0x790 [f2fs]
[75646.976361][T572171]        f2fs_recover_fsync_data+0x2d9/0x720 [f2fs]
[75646.983496][T572171]        f2fs_fill_super+0x31eb/0x3e60 [f2fs]
[75646.990108][T572171]        get_tree_bdev_flags+0x322/0x610
[75646.996224][T572171]        vfs_get_tree+0x8b/0x2f0
[75647.001637][T572171]        vfs_cmd_create+0xbd/0x280
[75647.007218][T572171]        __do_sys_fsconfig+0x659/0xa40
[75647.013139][T572171]        do_syscall_64+0x94/0x7f0
[75647.018619][T572171]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[75647.025486][T572171] 
[75647.025486][T572171] -> #2 (&sbi->cp_global_sem){+.+.}-{4:4}:
[75647.034489][T572171]        __lock_acquire+0x55d/0xbf0
[75647.040122][T572171]        lock_acquire.part.0+0xb8/0x230
[75647.046103][T572171]        down_write+0x90/0x1e0
[75647.051308][T572171]        f2fs_write_checkpoint+0x315/0x14c0 [f2fs]
[75647.058314][T572171]        f2fs_gc+0x1a2e/0x28e0 [f2fs]
[75647.064185][T572171]        f2fs_balance_fs+0x613/0x740 [f2fs]
[75647.070573][T572171]        f2fs_map_blocks+0x22ac/0x3da0 [f2fs]
[75647.077130][T572171]        f2fs_preallocate_blocks+0x3f1/0x640 [f2fs]
[75647.084192][T572171]        f2fs_file_write_iter+0x482/0x11c0 [f2fs]
[75647.091077][T572171]        vfs_write+0x524/0x1010
[75647.096342][T572171]        ksys_write+0xff/0x200
[75647.101510][T572171]        do_syscall_64+0x94/0x7f0
[75647.106930][T572171]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[75647.113745][T572171] 
[75647.113745][T572171] -> #1 (&sbi->gc_lock){+.+.}-{4:4}:
[75647.122122][T572171]        __lock_acquire+0x55d/0xbf0
[75647.127711][T572171]        lock_acquire.part.0+0xb8/0x230
[75647.133634][T572171]        down_write+0x90/0x1e0
[75647.138762][T572171]        f2fs_balance_fs+0x5a6/0x740 [f2fs]
[75647.145094][T572171]        f2fs_write_inode+0x50e/0x9d0 [f2fs]
[75647.151489][T572171]        write_inode+0x147/0x380
[75647.156773][T572171]        __writeback_single_inode+0x391/0x870
[75647.163184][T572171]        writeback_sb_inodes+0x547/0xe20
[75647.169165][T572171]        __writeback_inodes_wb+0xf2/0x270
[75647.175235][T572171]        wb_writeback+0x5ca/0x810
[75647.180606][T572171]        wb_do_writeback+0x536/0x7d0
[75647.186232][T572171]        wb_workfn+0x9f/0x400
[75647.191246][T572171]        process_one_work+0x86b/0x14c0
[75647.197033][T572171]        worker_thread+0x5f2/0xfd0
[75647.202475][T572171]        kthread+0x3a4/0x760
[75647.207397][T572171]        ret_from_fork+0x2d6/0x3e0
[75647.212840][T572171]        ret_from_fork_asm+0x1a/0x30
[75647.218454][T572171] 
[75647.218454][T572171] -> #0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}:
[75647.228870][T572171]        check_prev_add+0xe1/0xcf0
[75647.234324][T572171]        validate_chain+0x4c5/0x730
[75647.239859][T572171]        __lock_acquire+0x55d/0xbf0
[75647.245383][T572171]        lock_acquire.part.0+0xb8/0x230
[75647.251258][T572171]        start_flush_work+0x5c4/0xc20
[75647.256959][T572171]        __flush_work+0xca/0x1a0
[75647.262227][T572171]        wb_shutdown+0x15e/0x210
[75647.267493][T572171]        bdi_unregister+0x170/0x5b0
[75647.273016][T572171]        __del_gendisk+0x81c/0xa20
[75647.278447][T572171]        del_gendisk+0x106/0x190
[75647.283709][T572171]        sd_remove+0x8a/0x140
[75647.288707][T572171]        device_release_driver_internal+0x36d/0x520
[75647.295619][T572171]        bus_remove_device+0x1ef/0x3f0
[75647.301396][T572171]        device_del+0x3be/0x9b0
[75647.306566][T572171]        __scsi_remove_device+0x27f/0x340
[75647.312610][T572171]        scsi_remove_device+0x3f/0x50
[75647.318305][T572171]        tcm_loop_port_unlink+0xcb/0x160 [tcm_loop]
[75647.325214][T572171]        target_fabric_port_unlink+0xdd/0x170 [target_core_mod]
[75647.333237][T572171]        configfs_unlink+0x386/0x7a0
[75647.338853][T572171]        vfs_unlink+0x2a8/0x8c0
[75647.344035][T572171]        do_unlinkat+0x3e7/0x5c0
[75647.349299][T572171]        __x64_sys_unlink+0xae/0x120
[75647.354906][T572171]        do_syscall_64+0x94/0x7f0
[75647.360252][T572171]        entry_SYSCALL_64_after_hwframe+0x76/0x7e
[75647.366991][T572171] 
[75647.366991][T572171] other info that might help us debug this:
[75647.366991][T572171] 
[75647.378454][T572171] Chain exists of:
[75647.378454][T572171]   (work_completion)(&(&wb->dwork)->work) --> &sbi->cp_global_sem --> &q->q_usage_counter(queue)#23
[75647.378454][T572171] 
[75647.396298][T572171]  Possible unsafe locking scenario:
[75647.396298][T572171] 
[75647.404571][T572171]        CPU0                    CPU1
[75647.410281][T572171]        ----                    ----
[75647.415986][T572171]   lock(&q->q_usage_counter(queue)#23);
[75647.421960][T572171]                                lock(&sbi->cp_global_sem);
[75647.429584][T572171]                                lock(&q->q_usage_counter(queue)#23);
[75647.438078][T572171]   lock((work_completion)(&(&wb->dwork)->work));
[75647.444841][T572171] 
[75647.444841][T572171]  *** DEADLOCK ***
[75647.444841][T572171] 
[75647.454283][T572171] 8 locks held by targetcli/572171:
[75647.459829][T572171]  #0: ffff88815b388420 (sb_writers#14){.+.+}-{0:0}, at: do_unlinkat+0x18f/0x5c0
[75647.469302][T572171]  #1: ffff888192ca46d8 (&sb->s_type->i_mutex_key#20/1){+.+.}-{4:4}, at: do_unlinkat+0x20f/0x5c0
[75647.480177][T572171]  #2: ffff888192ca1a20 (&sb->s_type->i_mutex_key#21){++++}-{4:4}, at: vfs_unlink+0xbb/0x8c0
[75647.490711][T572171]  #3: ffff8881427300e0 (&shost->scan_mutex){+.+.}-{4:4}, at: scsi_remove_device+0x37/0x50
[75647.501077][T572171]  #4: ffff888161396380 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x90/0x520
[75647.511970][T572171]  #5: ffff8881427303c0 (&set->update_nr_hwq_lock){++++}-{4:4}, at: del_gendisk+0xfe/0x190
[75647.522345][T572171]  #6: ffff88817deba820 (&q->q_usage_counter(queue)#23){++++}-{0:0}, at: del_gendisk+0x106/0x190
[75647.533249][T572171]  #7: ffffffffaad25720 (rcu_read_lock){....}-{1:3}, at: start_flush_work+0x34/0xc20
[75647.543119][T572171] 
[75647.543119][T572171] stack backtrace:
[75647.549972][T572171] CPU: 0 UID: 0 PID: 572171 Comm: targetcli Not tainted 6.18.0-rc5-kts #1 PREEMPT(lazy) 
[75647.549978][T572171] Hardware name: Supermicro Super Server/X11SPi-TF, BIOS 3.5 05/18/2021
[75647.549980][T572171] Call Trace:
[75647.549983][T572171]  <TASK>
[75647.549986][T572171]  dump_stack_lvl+0x6e/0xa0
[75647.549993][T572171]  print_circular_bug.cold+0x38/0x46
[75647.550000][T572171]  check_noncircular+0x14a/0x170
[75647.550007][T572171]  ? unwind_get_return_address+0x6b/0xe0
[75647.550015][T572171]  check_prev_add+0xe1/0xcf0
[75647.550019][T572171]  ? look_up_lock_class+0x59/0x140
[75647.550026][T572171]  validate_chain+0x4c5/0x730
[75647.550032][T572171]  __lock_acquire+0x55d/0xbf0
[75647.550037][T572171]  lock_acquire.part.0+0xb8/0x230
[75647.550041][T572171]  ? start_flush_work+0x5a8/0xc20
[75647.550045][T572171]  ? mark_held_locks+0x40/0x70
[75647.550048][T572171]  ? lock_acquire+0xf6/0x140
[75647.550052][T572171]  ? start_flush_work+0x5a8/0xc20
[75647.550056][T572171]  start_flush_work+0x5c4/0xc20
[75647.550059][T572171]  ? start_flush_work+0x5a8/0xc20
[75647.550065][T572171]  __flush_work+0xca/0x1a0
[75647.550069][T572171]  ? __pfx___flush_work+0x10/0x10
[75647.550073][T572171]  ? __lock_release.isra.0+0x59/0x170
[75647.550076][T572171]  ? __pfx_wq_barrier_func+0x10/0x10
[75647.550086][T572171]  ? __pfx___might_resched+0x10/0x10
[75647.550093][T572171]  ? lockdep_hardirqs_on_prepare.part.0+0x9b/0x150
[75647.550098][T572171]  wb_shutdown+0x15e/0x210
[75647.550102][T572171]  bdi_unregister+0x170/0x5b0
[75647.550105][T572171]  ? find_held_lock+0x2b/0x80
[75647.550110][T572171]  ? __pfx_bdi_unregister+0x10/0x10
[75647.550113][T572171]  ? __lock_release.isra.0+0x59/0x170
[75647.550117][T572171]  ? __up_write+0x192/0x4f0
[75647.550122][T572171]  __del_gendisk+0x81c/0xa20
[75647.550128][T572171]  ? down_read+0x1b6/0x480
[75647.550133][T572171]  ? __pfx___del_gendisk+0x10/0x10
[75647.550137][T572171]  ? __pfx_down_read+0x10/0x10
[75647.550142][T572171]  ? __lock_release.isra.0+0x59/0x170
[75647.550145][T572171]  ? __up_write+0x192/0x4f0
[75647.550150][T572171]  del_gendisk+0x106/0x190
[75647.550155][T572171]  sd_remove+0x8a/0x140
[75647.550159][T572171]  device_release_driver_internal+0x36d/0x520
[75647.550165][T572171]  bus_remove_device+0x1ef/0x3f0
[75647.550170][T572171]  device_del+0x3be/0x9b0
[75647.550175][T572171]  ? attribute_container_device_trigger+0x181/0x1f0
[75647.550181][T572171]  ? __pfx_device_del+0x10/0x10
[75647.550184][T572171]  ? __pfx_attribute_container_device_trigger+0x10/0x10
[75647.550191][T572171]  __scsi_remove_device+0x27f/0x340
[75647.550197][T572171]  scsi_remove_device+0x3f/0x50
[75647.550202][T572171]  tcm_loop_port_unlink+0xcb/0x160 [tcm_loop]
[75647.550211][T572171]  ? __pfx_target_fabric_port_unlink+0x10/0x10 [target_core_mod]
[75647.550276][T572171]  target_fabric_port_unlink+0xdd/0x170 [target_core_mod]
[75647.550336][T572171]  configfs_unlink+0x386/0x7a0
[75647.550342][T572171]  vfs_unlink+0x2a8/0x8c0
[75647.550348][T572171]  do_unlinkat+0x3e7/0x5c0
[75647.550353][T572171]  ? __pfx_do_unlinkat+0x10/0x10
[75647.550358][T572171]  ? check_heap_object+0x6a/0x4c0
[75647.550362][T572171]  ? __check_object_size.part.0+0x61/0x150
[75647.550369][T572171]  __x64_sys_unlink+0xae/0x120
[75647.550374][T572171]  do_syscall_64+0x94/0x7f0
[75647.550381][T572171]  ? __pfx___do_sys_newfstatat+0x10/0x10
[75647.550387][T572171]  ? trace_hardirqs_on_prepare+0x101/0x150
[75647.550393][T572171]  ? do_syscall_64+0x137/0x7f0
[75647.550400][T572171]  ? trace_hardirqs_on_prepare+0x101/0x150
[75647.550403][T572171]  ? do_syscall_64+0x137/0x7f0
[75647.550407][T572171]  ? trace_hardirqs_on_prepare+0x101/0x150
[75647.550411][T572171]  ? do_syscall_64+0x137/0x7f0
[75647.550414][T572171]  ? trace_hardirqs_on_prepare+0x101/0x150
[75647.550418][T572171]  ? do_syscall_64+0x137/0x7f0
[75647.550422][T572171]  ? trace_hardirqs_on_prepare+0x101/0x150
[75647.550426][T572171]  ? do_syscall_64+0x137/0x7f0
[75647.550429][T572171]  ? trace_hardirqs_on_prepare+0x101/0x150
[75647.550433][T572171]  ? do_syscall_64+0x137/0x7f0
[75647.550436][T572171]  ? clear_bhb_loop+0x30/0x80
[75647.550440][T572171]  ? clear_bhb_loop+0x30/0x80
[75647.550444][T572171]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[75647.550448][T572171] RIP: 0033:0x7f952a6f715b
[75647.550452][T572171] Code: ff e8 a9 8d 01 00 66 0f 1f 84 00 00 00 00 00 f3 0f 1e fa b8 5f 00 00 00 0f 05 c3 0f 1f 40 00 f3 0f 1e fa b8 57 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 05 c3 0f 1f 40 00 48 8b 15 71 ec 0f 00 f7 d8
[75647.550456][T572171] RSP: 002b:00007fff23eeed18 EFLAGS: 00000202 ORIG_RAX: 0000000000000057
[75647.550461][T572171] RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f952a6f715b
[75647.550464][T572171] RDX: 0000000000000001 RSI: 0000000000000000 RDI: 00007f951929bd50
[75647.550466][T572171] RBP: 00007fff23eeed40 R08: 0000000000000053 R09: 0000000000000002
[75647.550469][T572171] R10: 00007f952ab15b10 R11: 0000000000000202 R12: 00007f952ad507d0
[75647.550471][T572171] R13: 00007fff23eeed60 R14: 0000000000000001 R15: 00007f952ad507d0
[75647.550477][T572171]  </TASK>
[75648.073649][T572171] sd 11:0:1:0: [sdg] Synchronizing SCSI cache


Shin'ichiro Kawasaki (1):
  f2fs: fix lockdep WARN of sbi->cp_global_sem and q->q_usage_counter

 fs/f2fs/recovery.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
