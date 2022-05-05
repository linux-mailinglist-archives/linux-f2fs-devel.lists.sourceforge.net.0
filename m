Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C86B51B6AC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 May 2022 05:46:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nmSRJ-0003hz-Mu; Thu, 05 May 2022 03:46:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nmSRI-0003hs-Bt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 03:46:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3cFTJinjakGeW/6mWOUa4ZfFI5r/6BTNWfmS9zTPk58=; b=h7Or5/lzTYZ9aMGdyVTIik2V3t
 4Y1q4NrgETN9yyLIsiAf2w/HXXFcAzYRNP6Z+jiH5ptj6BohTkPi7Bz2c88/StgQSZxmrG6E80NAg
 uEkcVXUxr2uvR3grt5rvAaeThpRFnx0x9zZFYmOzWWvC81Hpah1ZbPl8KRV/kCFQhK/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3cFTJinjakGeW/6mWOUa4ZfFI5r/6BTNWfmS9zTPk58=; b=ZFxnhPyMeGCiA5XM42VOIi5yZ0
 5bTGlQ5gYN4fDFq0Ez3HRGZF2ttY95vQfQqZcg8agp8HCwhmkiQMQFBPzIZ9mC8b4qa1Cx7bINka7
 +LONHZRdvUFyTwv0Qy7VTBNyMZ7QmRqns90gCaMBRghmLZ8Ey24sMNK09uBWkyVl56Y4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nmSRG-0000Ni-1D
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 05 May 2022 03:46:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C411611DB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 May 2022 03:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 06658C385A4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  5 May 2022 03:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722356;
 bh=3cFTJinjakGeW/6mWOUa4ZfFI5r/6BTNWfmS9zTPk58=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pLC7SAwsTvIMDdB05KAIpjPojsE/WBG6J58qxrbjTMkt1Fl1iZ1jxcag/5TwqwfYj
 nqAY9vil30S/OD4QWuCcyPri+WGr38dKairqs7iLCl+a2Zg/OQgSZbnnmHBe53TVl3
 btr2oLrTjIrVxI9fPPJtNvHeEtdgv99f9RbjBv2/kdVHtCPx0ti06rthoYga5+0WRD
 P8taLXjTUWHeH1ddyqicc5mvfhbdiEE75uvH1wJCuybM41doaR298CkCr/YJ53+yDH
 Swj74jT4osMotHjWzFujLf1NMezQ3+G1I3qlMOtMD1sDo9wptXXHqnnNZH6jApyppy
 WfsoepQmv3jPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DC6D7C05F98; Thu,  5 May 2022 03:45:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 05 May 2022 03:45:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215935-202145-7FOey2y8ga@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215935-202145@https.bugzilla.kernel.org/>
References: <bug-215935-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215935 ---
 Comment
 #2 from bughunter (yanming@tju.edu.cn) --- I have tried the latest branch,
 while it is weird that this issue still exists. A long list of kernel logs
 are printed like: 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nmSRG-0000Ni-1D
Subject: [f2fs-dev] [Bug 215935] kernel hangs when invoking system calls
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

https://bugzilla.kernel.org/show_bug.cgi?id=215935

--- Comment #2 from bughunter (yanming@tju.edu.cn) ---
I have tried the latest branch, while it is weird that this issue still exists.
A long list of kernel logs are printed like:

4,4716,31237186595,-; <TASK>
4,4717,31237186597,-; dump_stack_lvl+0x34/0x44
4,4718,31237186601,-; f2fs_is_valid_blkaddr.cold+0x2a/0x47
4,4719,31237186607,-; f2fs_do_write_data_page+0x30a/0x1ff0
4,4720,31237186610,-; ? f2fs_should_update_outplace+0x530/0x530
4,4721,31237186613,-; ? percpu_counter_add_batch+0x79/0x130
4,4722,31237186618,-; ? unwind_get_return_address+0xa0/0xa0
4,4723,31237186620,-; ? percpu_counter_add_batch+0x79/0x130
4,4724,31237186625,-; f2fs_write_single_data_page+0x1408/0x1c60
4,4725,31237186629,-; ? f2fs_do_write_data_page+0x1ff0/0x1ff0
4,4726,31237186634,-; ? invalid_folio_referenced_vma+0x10/0x10
4,4727,31237186638,-; ? percpu_counter_add_batch+0x79/0x130
4,4728,31237186643,-; f2fs_write_cache_pages+0x4ae/0xeb0
4,4729,31237186647,-; ? f2fs_write_single_data_page+0x1c60/0x1c60
4,4730,31237186649,-; ? unwind_next_frame+0x1301/0x1c60
4,4731,31237186653,-; ? entry_SYSCALL_64_after_hwframe+0x44/0xae
4,4732,31237186656,-; ? unwind_get_return_address+0xa0/0xa0
4,4733,31237186660,-; ? _raw_spin_lock+0x82/0xd0
4,4734,31237186663,-; ? _raw_spin_lock_irqsave+0xe0/0xe0
4,4735,31237186666,-; ? blk_start_plug_nr_ios+0x270/0x270
4,4736,31237186669,-; ? __kernel_text_address+0x9/0x30
4,4737,31237186674,-; ? f2fs_remove_dirty_inode+0x112/0x4d0
4,4738,31237186677,-; f2fs_write_data_pages+0x3cb/0xde0
4,4739,31237186682,-; ? f2fs_write_cache_pages+0xeb0/0xeb0
4,4740,31237186685,-; ? load_balance+0x20d0/0x20d0
4,4741,31237186688,-; ? find_get_pages_range_tag+0x329/0x530
4,4742,31237186693,-; do_writepages+0x168/0x550
4,4743,31237186696,-; ? page_writeback_cpu_online+0x10/0x10
4,4744,31237186699,-; ? attach_entity_load_avg+0x5b4/0x7f0
4,4745,31237186703,-; ? pagevec_lookup_range_tag+0x23/0x60
4,4746,31237186706,-; ? f2fs_flush_inline_data+0xfb/0x910
4,4747,31237186711,-; filemap_fdatawrite+0xa5/0xe0
4,4748,31237186714,-; ? folio_unlock+0x30/0x30
4,4749,31237186716,-; ? _raw_spin_lock+0x82/0xd0
4,4750,31237186721,-; ? _raw_spin_unlock+0x34/0x60
4,4751,31237186724,-; f2fs_sync_dirty_inodes+0x1c4/0x760
4,4752,31237186730,-; f2fs_write_checkpoint+0x55c/0x6000
4,4753,31237186734,-; ? _raw_spin_lock_irqsave+0x88/0xe0
4,4754,31237186737,-; ? _raw_read_lock_bh+0x40/0x40
4,4755,31237186741,-; ? _raw_spin_unlock_irqrestore+0x3d/0x70
4,4756,31237186745,-; ? f2fs_get_sectors_written+0x370/0x370
4,4757,31237186750,-; ? down_write_killable+0x120/0x120
4,4758,31237186753,-; ? trace_raw_output_jbd2_checkpoint_stats+0x1f0/0x1f0
4,4759,31237186759,-; ? _raw_write_lock+0x82/0xd0
4,4760,31237186761,-; ? __ia32_sys_fdatasync+0x40/0x40
4,4761,31237186764,-; f2fs_issue_checkpoint+0x27b/0x3a0
4,4762,31237186769,-; ? f2fs_destroy_checkpoint_caches+0x20/0x20
4,4763,31237186773,-; ? down_read+0x121/0x200
4,4764,31237186778,-; ? rwsem_down_read_slowpath+0x880/0x880
4,4765,31237186781,-; ? _raw_spin_lock+0x82/0xd0
4,4766,31237186784,-; ? _raw_spin_lock_irqsave+0xe0/0xe0
4,4767,31237186788,-; ? __ia32_sys_fdatasync+0x40/0x40
4,4768,31237186791,-; iterate_supers+0x10c/0x190
4,4769,31237186794,-; ksys_sync+0xa3/0x130
4,4770,31237186798,-; ? __x64_sys_syncfs+0x110/0x110
4,4771,31237186801,-; ? exit_to_user_mode_prepare+0x36/0x120
4,4772,31237186806,-; __do_sys_sync+0x5/0x10
4,4773,31237186809,-; do_syscall_64+0x3b/0x90
4,4774,31237186814,-; entry_SYSCALL_64_after_hwframe+0x44/0xae
4,4775,31237186817,-;RIP: 0033:0x7fbd00f1476d
4,4776,31237186819,-;Code: 00 c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa
48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48>
3d 01 f0 ff ff 73 01 c3 48 8b 0d f3 36 0d 00 f7 d8 64 89 01 48
4,4777,31237186822,-;RSP: 002b:00007ffea57d8538 EFLAGS: 00000217 ORIG_RAX:
00000000000000a2
4,4778,31237186826,-;RAX: ffffffffffffffda RBX: 000055595cb04ee0 RCX:
00007fbd00f1476d
4,4779,31237186828,-;RDX: 00007fbd00f1476d RSI: ffffffffffffff80 RDI:
00007ffea57d8700
4,4780,31237186830,-;RBP: 00007ffea5bd88b0 R08: 00007ffea5bd89a8 R09:
00007ffea5bd89a8
4,4781,31237186833,-;R10: 00007ffea5bd89a8 R11: 0000000000000217 R12:
000055595cb040a0
4,4782,31237186836,-;R13: 00007ffea5bd89a0 R14: 0000000000000000 R15:
0000000000000000
4,4783,31237186838,-; </TASK>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
