Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAD26970F9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Feb 2023 23:57:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pS4Ed-0003nQ-8A;
	Tue, 14 Feb 2023 22:57:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <megi@xff.cz>) id 1pS4Eb-0003nJ-M6
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 22:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=diffAyTKujNQAA4c42SM9v4hagH67PqvNDVVDcR4sBg=; b=ei/K4WhYvPKTDDFJdr3SuGh35+
 LqeVrnnAtEoK5yB/cAeTb45GEL7ct7KNEmRjEFBHl5sS78zelf8ITXB1K+kBEwQcY2DHHK82c+V0j
 pA8ThDWXEq+Vg8qVNx7Ox2qV1Ds8NDwYNf2fRVw5L0fG5bsTMmZhZUKSsLqtQonX4m78=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=diffAyTKujNQAA4c42SM9v4hagH67PqvNDVVDcR4sBg=; b=VVukGFC7UHyzVHvbhJ17sS9Yvb
 OWUIHu4YeJ+MszH75r+zxc3+5IvKRixt0OyNXCx+xq/8b0k097D7SoBMAzu2MWr/W/CZxhpBBRUXE
 ECwyDihBrLFBi31RkIcPz6CF+nCV6R1v8DxzUQdTYfEdCTBjCkKCQJlMVCuwh/E7hRXU=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pS4EZ-0004au-Cs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Feb 2023 22:57:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1676415424; bh=bxnVr3HOt3jg09omlvgF5UohxBpaOAFxEJpE+FC589I=;
 h=Date:From:To:Subject:X-My-GPG-KeyId:References:From;
 b=pFPsCSxnTgMW1XZnDQw8ZM0IGVm0zufUimeFNsRBLtF7ybAkPi5ehvJu3UUSDKqa6
 ty269x4dTwMLuaEeGFPUof9HLqHmSgVXBNQrZrb0WggDvTwJgkIcc2apH5DdY67qGJ
 icqvYrK6e+I/TbuUM5rZe3d1SuE/nxMTtb3hO5m4=
Date: Tue, 14 Feb 2023 23:57:04 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20230214225704.pqqisa62pfzj6wz2@core>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20230214210723.vxmzehsbbvrilr4c@core>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230214210723.vxmzehsbbvrilr4c@core>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 14, 2023 at 10:07:23PM +0100, megi xff wrote:
 > Hello, > > I'm trying 6.2-rc8 on my Orange Pi PC and noticed this bug in
 dmesg and > locked-up fsync. (impossible to write to the filesystem [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pS4EZ-0004au-Cs
Subject: Re: [f2fs-dev] kernel BUG at fs/f2fs/extent_cache.c:730 and
 subsequent warning (6.2-rc8)
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

On Tue, Feb 14, 2023 at 10:07:23PM +0100, megi xff wrote:
> Hello,
> 
> I'm trying 6.2-rc8 on my Orange Pi PC and noticed this bug in dmesg and
> locked-up fsync. (impossible to write to the filesystem)
> 
> [...]
>
> This is a 32bit system.

A bit of followup... I've tried the same kernel on another 32bit system, and
also on a 64bit system, and this seems specific to 32bit systems (happens
on almost every boot). I've run -rc8 and earlier on several 64bit systems
for many days without issues, but the same kernel bugs out on 32bit systems
very early during boot.

Here is more debugging output that can be helpful:

sysrq w

[  571.133078] sysrq: Show Blocked State
[  571.135646] task:kworker/u8:0    state:D stack:0     pid:9     ppid:2      flags:0x00000000
[  571.135682] Workqueue: writeback wb_workfn (flush-179:0)
[  571.135720]  __schedule from schedule+0x50/0xa0
[  571.135744]  schedule from schedule_preempt_disabled+0xc/0x10
[  571.135763]  schedule_preempt_disabled from __mutex_lock.constprop.0+0x208/0x50c
[  571.135784]  __mutex_lock.constprop.0 from f2fs_write_data_pages+0x1bc/0x268
[  571.135807]  f2fs_write_data_pages from do_writepages+0x60/0x19c
[  571.135828]  do_writepages from __writeback_single_inode+0x2c/0x1e0
[  571.135845]  __writeback_single_inode from writeback_sb_inodes+0x1d0/0x410
[  571.135863]  writeback_sb_inodes from __writeback_inodes_wb+0x38/0xe4
[  571.135880]  __writeback_inodes_wb from wb_writeback+0x170/0x1a8
[  571.135898]  wb_writeback from wb_workfn+0x1ec/0x370
[  571.135914]  wb_workfn from process_one_work+0x1e8/0x3e8
[  571.135941]  process_one_work from worker_thread+0x48/0x540
[  571.135961]  worker_thread from kthread+0xd4/0xf0
[  571.135981]  kthread from ret_from_fork+0x14/0x1c
[  571.136000] Exception stack(0xe0841fb0 to 0xe0841ff8)
[  571.136012] 1fa0:                                     00000000 00000000 00000000 00000000
[  571.136024] 1fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  571.136036] 1fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  571.136071] task:kworker/u8:1    state:D stack:0     pid:47    ppid:2      flags:0x00000000
[  571.136088] Workqueue: writeback wb_workfn (flush-179:0)
[  571.136108]  __schedule from schedule+0x50/0xa0
[  571.136125]  schedule from schedule_preempt_disabled+0xc/0x10
[  571.136142]  schedule_preempt_disabled from __mutex_lock.constprop.0+0x208/0x50c
[  571.136161]  __mutex_lock.constprop.0 from f2fs_write_data_pages+0x1bc/0x268
[  571.136181]  f2fs_write_data_pages from do_writepages+0x60/0x19c
[  571.136197]  do_writepages from __writeback_single_inode+0x2c/0x1e0
[  571.136213]  __writeback_single_inode from writeback_sb_inodes+0x1d0/0x410
[  571.136231]  writeback_sb_inodes from __writeback_inodes_wb+0x38/0xe4
[  571.136248]  __writeback_inodes_wb from wb_writeback+0x170/0x1a8
[  571.136265]  wb_writeback from wb_workfn+0x1ec/0x370
[  571.136281]  wb_workfn from process_one_work+0x1e8/0x3e8
[  571.136303]  process_one_work from worker_thread+0x48/0x540
[  571.136323]  worker_thread from kthread+0xd4/0xf0
[  571.136341]  kthread from ret_from_fork+0x14/0x1c
[  571.136359] Exception stack(0xe08e9fb0 to 0xe08e9ff8)
[  571.136370] 9fa0:                                     00000000 00000000 00000000 00000000
[  571.136383] 9fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  571.136395] 9fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  571.136437] task:kworker/u8:2    state:D stack:0     pid:89    ppid:2      flags:0x00000000
[  571.136454] Workqueue: writeback wb_workfn (flush-179:0)
[  571.136473]  __schedule from schedule+0x50/0xa0
[  571.136489]  schedule from schedule_preempt_disabled+0xc/0x10
[  571.136507]  schedule_preempt_disabled from __mutex_lock.constprop.0+0x208/0x50c
[  571.136526]  __mutex_lock.constprop.0 from f2fs_write_data_pages+0x1bc/0x268
[  571.136546]  f2fs_write_data_pages from do_writepages+0x60/0x19c
[  571.136562]  do_writepages from __writeback_single_inode+0x2c/0x1e0
[  571.136579]  __writeback_single_inode from writeback_sb_inodes+0x1d0/0x410
[  571.136596]  writeback_sb_inodes from __writeback_inodes_wb+0x38/0xe4
[  571.136613]  __writeback_inodes_wb from wb_writeback+0x170/0x1a8
[  571.136630]  wb_writeback from wb_workfn+0x1ec/0x370
[  571.136646]  wb_workfn from process_one_work+0x1e8/0x3e8
[  571.136669]  process_one_work from worker_thread+0x48/0x540
[  571.136688]  worker_thread from kthread+0xd4/0xf0
[  571.136706]  kthread from ret_from_fork+0x14/0x1c
[  571.136724] Exception stack(0xe0a05fb0 to 0xe0a05ff8)
[  571.136735] 5fa0:                                     00000000 00000000 00000000 00000000
[  571.136747] 5fc0: 00000000 00000000 00000000 00000000 00000000 00000000 00000000 00000000
[  571.136759] 5fe0: 00000000 00000000 00000000 00000000 00000013 00000000
[  571.136855] task:sshd            state:D stack:0     pid:243   ppid:227    flags:0x00000005
[  571.136880]  __schedule from schedule+0x50/0xa0
[  571.136899]  schedule from io_schedule+0x34/0x44
[  571.136916]  io_schedule from folio_wait_bit_common+0x150/0x308
[  571.136938]  folio_wait_bit_common from __filemap_get_folio+0x1d0/0x3e8
[  571.136961]  __filemap_get_folio from pagecache_get_page+0xc/0x3c
[  571.136980]  pagecache_get_page from f2fs_write_begin+0x6c/0xc84
[  571.136999]  f2fs_write_begin from generic_perform_write+0xa8/0x1b8
[  571.137019]  generic_perform_write from f2fs_buffered_write_iter+0x40/0x9c
[  571.137041]  f2fs_buffered_write_iter from f2fs_file_write_iter+0x69c/0x930
[  571.137061]  f2fs_file_write_iter from vfs_write+0x1bc/0x384
[  571.137082]  vfs_write from ksys_write+0x54/0xc8
[  571.137099]  ksys_write from ret_fast_syscall+0x0/0x4c
[  571.137114] Exception stack(0xe0c8dfa8 to 0xe0c8dff0)
[  571.137126] dfa0:                   000dd280 00000000 00000005 bea113d4 00000180 00000000
[  571.137140] dfc0: 000dd280 00000000 00000005 00000004 00000002 005b91b8 bea12724 0000001c
[  571.137151] dfe0: 00000000 bea11384 b698bf5c b6933c10

Kind regards,
	o.


> Any ideas or suggestions?
> 
> kind regards,
> 	o.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
