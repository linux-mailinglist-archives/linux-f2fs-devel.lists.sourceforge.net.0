Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E6426530209
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 May 2022 11:15:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nshgR-0006mK-TZ; Sun, 22 May 2022 09:15:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nshgQ-0006lW-CX
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 09:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uhk6kdrGS7C/yUwfb2iIMWsNyTPh0WmII+hA/NR5R4I=; b=STuam04E1eJRUP+wi7FwJgWv+j
 iSHdd28ABHRt5SftDH/GNUqPAv+KUvH6b0kjwSr7Y+jlv3BmlUZZSoiRXtdnQ3xVAf90dD6/H+liY
 xsd9um4SNtDr/K9Z1fiq/ZtULv6OQmp/xiEyqzU7JtbMZceb96LordRYoiIU6ESoXg0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uhk6kdrGS7C/yUwfb2iIMWsNyTPh0WmII+hA/NR5R4I=; b=V65p7CnpZmTY0i4DqFDbpYGKK9
 53zyE5g529MvCdYYZcvvegTekbEmhzOLafnUofB1UGpKmdMt46TE/7QDf9hPUSAhhTJ+AiKBQFkP4
 H7nO8T+YVnU6kHFHvjGCnB+LBTavhKSSbt1YcWLeHzqrdVUaQnAenNWXDMq83JblGa/g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nshgO-0004S0-R8
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 09:15:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 61FAB60F6A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 May 2022 09:15:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B77FDC385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 May 2022 09:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653210914;
 bh=LGUiW19NfTRsH7LPdnHrr6q429vB9oivhZMXFFvFh3w=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NBNv/HdRMy6zYbLDlMSuGMeaprsGfUc91le+q8ZsiNpdYsXwzXjQ08kYcWoGeN/wM
 mut2rmhgeNiYYxjg9snPGv4a3EqEw9Le5JJ1faetnmnmKg+c6pObUyLVSuWJArhxDk
 SwkYBmsdZTcGl1AmT1RQw3iUHxAHL0fLwmqQX89HC79eIYL3WoKu4nmGkcUXS9SmiS
 L1jM1e6hFM5qstE/HAIi9t86aKFHPJh0lEP8saAvaAaZf1LhbsbFX6pZrI1qTFCSGG
 3Bo1e7BWhwkRDd1Zj+G1Raoa4TkSkU2nAsFu08+cQRbLnLU97pILylY79Z5lfYMeoI
 Y3N881HSf3RHQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 96DA5C05FF5; Sun, 22 May 2022 09:15:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 22 May 2022 09:15:14 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: fs_other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215902-202145-KpbnHtbol4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215902-202145@https.bugzilla.kernel.org/>
References: <bug-215902-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215902 Zorro Lang
 (zlang@redhat.com) changed: What |Removed |Added CC| |zlang@redhat.com 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nshgO-0004S0-R8
Subject: [f2fs-dev] [Bug 215902] kernel BUG at fs/inode.c:611!
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=215902

Zorro Lang (zlang@redhat.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |zlang@redhat.com

--- Comment #1 from Zorro Lang (zlang@redhat.com) ---
I hit this panic too, on linux 5.18.0-rc7+. By running fstests on CIFS:

[ 2060.317812] run fstests generic/072 at 2022-05-21 03:46:16 
[ 2099.043374] restraintd[2206]: *** Current Time: Sat May 21 03:46:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2159.048237] restraintd[2206]: *** Current Time: Sat May 21 03:47:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2219.064124] restraintd[2206]: *** Current Time: Sat May 21 03:48:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2279.051516] restraintd[2206]: *** Current Time: Sat May 21 03:49:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[-- MARK -- Sat May 21 07:50:00 2022] 
[ 2339.067535] restraintd[2206]: *** Current Time: Sat May 21 03:50:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2399.060978] restraintd[2206]: *** Current Time: Sat May 21 03:51:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2459.048587] restraintd[2206]: *** Current Time: Sat May 21 03:52:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2479.117705] systemd-journald[496]: Data hash table of
/run/log/journal/c03da93f15244bf788a7fc5b4a07f385/system.journal has a fill
level at 75.0 (51968 of 69290 items, 33554432 file size, 645 bytes per hash
table item), suggesting rotation. 
[ 2479.117757] systemd-journald[496]:
/run/log/journal/c03da93f15244bf788a7fc5b4a07f385/system.journal: Journal
header limits reached or header out-of-date, rotating. 
[ 2519.059168] restraintd[2206]: *** Current Time: Sat May 21 03:53:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2578.778169] CIFS: Attempting to mount
\\ibm-p9z-15-lp11.lab.eng.bos.redhat.com\TEST_dev 
[ 2579.222226] CIFS: Attempting to mount
\\ibm-p9z-15-lp11.lab.eng.bos.redhat.com\SCRATCH_dev 
[ 2579.262520] CIFS: Attempting to mount
\\ibm-p9z-15-lp11.lab.eng.bos.redhat.com\SCRATCH_dev 
[ 2579.327088] run fstests generic/073 at 2022-05-21 03:54:55 
[ 2579.029460] restraintd[2206]: *** Current Time: Sat May 21 03:54:56 2022 
Localwatchdog at: Mon May 23 03:13:55 2022 
[ 2579.723371] ------------[ cut here ]------------ 
[ 2579.723727] kernel BUG at fs/inode.c:611! 
[ 2579.723734] Oops: Exception in kernel mode, sig: 5 [#1] 
[ 2579.723739] LE PAGE_SIZE=64K MMU=Hash SMP NR_CPUS=2048 NUMA pSeries 
[ 2579.723744] Modules linked in: loop dm_mod cifs rdma_cm iw_cm ib_cm ib_core
dns_resolver fscache netfs bonding tls rfkill sunrpc pseries_rng drm fuse
drm_panel_orientation_quirks xfs libcrc32c sd_mod t10_pi crc64_rocksoft_generic
crc64_rocksoft crc64 sg ibmvscsi ibmveth scsi_transport_srp vmx_crypto 
[ 2579.723785] CPU: 2 PID: 393323 Comm: umount Kdump: loaded Not tainted
5.18.0-rc7+ #1 
[ 2579.723791] NIP:  c000000000628d48 LR: c000000000628d40 CTR:
c000000000628d10 
[ 2579.723796] REGS: c00000006e8f3740 TRAP: 0700   Not tainted  (5.18.0-rc7+) 
[ 2579.723802] MSR:  800000000282b033 <SF,VEC,VSX,EE,FP,ME,IR,DR,RI,LE>  CR:
44002204  XER: 00000000 
[ 2579.723817] CFAR: c0000000010c1788 IRQMASK: 1  
[ 2579.723817] GPR00: c000000000628d40 c00000006e8f39e0 c000000002d06900
0000000000000001  
[ 2579.723817] GPR04: c00000005a4af760 0000000000000002 c000000003012b88
00000003fac90000  
[ 2579.723817] GPR08: c000000002e20748 0000000000000001 00000003fac90000
0000000000002000  
[ 2579.723817] GPR12: 00000003fac90000 c00000000ffce400 ffffffffffffffff
000000000ee6b280  
[ 2579.723817] GPR16: 00007fffde2f9f70 0000000108456508 00007fffde2f9f70
0000000000000000  
[ 2579.723817] GPR20: 0000000000000001 0000000000000000 c00000000142f3f8
c0000000c0b9da80  
[ 2579.723817] GPR24: c0000000c0b9d000 c000000063a1b000 c00000006e8f3af8
c0000000c0b9dac8  
[ 2579.723817] GPR28: c00000000142f3f8 c0080000035f0088 c00000005a4af6e0
c00000005a4af500  
[ 2579.723878] NIP [c000000000628d48] clear_inode+0x38/0xb0 
[ 2579.723886] LR [c000000000628d40] clear_inode+0x30/0xb0 
[ 2579.723892] Call Trace: 
[ 2579.723894] [c00000006e8f39e0] [c000000000628d40] clear_inode+0x30/0xb0
(unreliable) 
[ 2579.723903] [c00000006e8f3a20] [c00800000352b678] cifs_evict_inode+0x50/0xb0
[cifs] 
[ 2579.723944] [c00000006e8f3a50] [c00000000062b438] evict+0xf8/0x230 
[ 2579.723950] [c00000006e8f3a90] [c00000000062b600] dispose_list+0x90/0xe0 
[ 2579.723956] [c00000006e8f3ad0] [c00000000062b7e4] evict_inodes+0x194/0x220 
[ 2579.723962] [c00000006e8f3b60] [c0000000005f8850]
generic_shutdown_super+0x70/0x1a0 
[ 2579.723970] [c00000006e8f3be0] [c0000000005f8c28] kill_anon_super+0x28/0x50 
[ 2579.723977] [c00000006e8f3c10] [c00800000352bc48] cifs_kill_sb+0xf0/0x120
[cifs] 
[ 2579.724010] [c00000006e8f3c60] [c0000000005fa0c4]
deactivate_locked_super+0x74/0x130 
[ 2579.724018] [c00000006e8f3ca0] [c0000000006382fc] cleanup_mnt+0x14c/0x220 
[ 2579.724024] [c00000006e8f3cf0] [c00000000018ec04] task_work_run+0xb4/0x120 
[ 2579.724032] [c00000006e8f3d40] [c000000000022684]
do_notify_resume+0x134/0x140 
[ 2579.724040] [c00000006e8f3d70] [c0000000000309a0]
interrupt_exit_user_prepare_main+0x230/0x290 
[ 2579.724047] [c00000006e8f3de0] [c000000000030e84]
syscall_exit_prepare+0xe4/0x1e0 
[ 2579.724053] [c00000006e8f3e10] [c00000000000be74]
system_call_vectored_common+0xf4/0x278 
[ 2579.724061] --- interrupt: 3000 at 0x7fff896adaf4 
[ 2579.724066] NIP:  00007fff896adaf4 LR: 0000000000000000 CTR:
0000000000000000 
[ 2579.724071] REGS: c00000006e8f3e80 TRAP: 3000   Not tainted  (5.18.0-rc7+) 
[ 2579.724075] MSR:  800000000280f033 <SF,VEC,VSX,EE,PR,FP,ME,IR,DR,RI,LE>  CR:
48002402  XER: 00000000 
[ 2579.724091] IRQMASK: 0  
[ 2579.724091] GPR00: 0000000000000034 00007fffde2f9c90 00007fff897a7200
0000000000000000  
[ 2579.724091] GPR04: 0000000000000000 00007fffde2f9ca8 0000000000000000
0000000000000001  
[ 2579.724091] GPR08: 0000000000000000 0000000000000000 0000000000000000
0000000000000000  
[ 2579.724091] GPR12: 0000000000000000 00007fff898dc0c0 ffffffffffffffff
000000000ee6b280  
[ 2579.724091] GPR16: 00007fffde2f9f70 0000000108456508 00007fffde2f9f70
0000000000000000  
[ 2579.724091] GPR20: 0000000000000001 0000000000000000 0000000000000000
0000000000000000  
[ 2579.724091] GPR24: 00007fffde2fb610 0000000108456468 0000000108456ae8
000001001c780630  
[ 2579.724091] GPR28: 000001001c780510 0000000000000000 000001001c785390
000001001c780400  
[ 2579.724148] NIP [00007fff896adaf4] 0x7fff896adaf4 
[ 2579.724153] LR [0000000000000000] 0x0 
[ 2579.724156] --- interrupt: 3000 
[ 2579.724159] Instruction dump: 
[ 2579.724163] 7c0802a6 60000000 7c0802a6 fbe1fff8 7c7f1b78 38630248 f8010010
f821ffc1  
[ 2579.724174] f8610028 48a9899d 60000000 e93f0408 <0b090000> e8610028 48a98ee9
60000000  
[ 2579.724186] ---[ end trace 0000000000000000 ]--- 
[ 2579.725293]  
[ 2579.725296] note: umount[393323] exited with preempt_count 1 
[ 2579.747025] CIFS: Attempting to mount
\\ibm-p9z-15-lp11.lab.eng.bos.redhat.com\TEST_dev 
[-- MARK -- Sat May 21 07:55:00 2022]

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
