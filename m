Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5339AFAD11
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jul 2025 09:29:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vEvqBs1sKV8vT4ueG+CNaXrUeyG05IoVdaa/tPhAdN0=; b=nQbEs/AujnXZZRbAJFAeomKxQW
	xbZzPsuyYSc3QxgG3jWusSQA7sHca9utvHgWHpvD9frfivJmUYCmc469nzzKIxufvsj2dAo2oHikw
	9FqIj1F6Rrg8DJGYXGqFPlLco9AMjmo2FT1U6Ph2jBIFU9w3YurKWv3HyS5v5DHq5z4Q=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYgHs-0003lE-0G;
	Mon, 07 Jul 2025 07:29:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1uYgH0-0003kB-Qd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 07:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7MLBWyw9E58ilzdyJHyliEjyuYclflFuRmJhEAcspc0=; b=hUNdpvX6axn6eWVGJ4U2OOMW+l
 EkS8KRTPexlNjn+eW7xOEQnsM8pllZMiQzXbRFuB0RkQ9ZrLg4eiX9lhCxj3/MsxqeFAixF+o6p4X
 qC8yttbOwKpwsO4iHjaUYubq8XhkisG2qiSL05U7bBonshgnaPUOsaSQ3KrhWgjn4zws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7MLBWyw9E58ilzdyJHyliEjyuYclflFuRmJhEAcspc0=; b=M
 NWI1kT+olTyrefzLeLx1Oa6C00hDmIlcZiRgr8vNoh7coNejOvJl4mLzMnihlh0p/dbt6Vf0DqYrk
 PZdBsHJq7MorfR0g129Nn+T5Gn7JqEFt2UvdgpprEDnYTWEYZdg1u6I7uGeMc5hwejYsbxVbYoGIO
 LkibXNLvjobMk33w=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYgH0-0007lC-AH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 07:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ECD2D4504A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Jul 2025 07:28:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE122C4CEE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Jul 2025 07:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751873296;
 bh=VE2olt0Li8xoaPTEInpdTnvl+ThF5R2yOB8KGjzzObg=;
 h=From:To:Subject:Date:From;
 b=RXVT1mqPdMLfpg2SGnAoUSOnXzEHPgS4kUihy5/tv4WKxul3oKmaVlDbcjyGctMbR
 HptfScsyilPlmqK1Lgtfw8N+wo2yLv65gxtueZW0J3SvpnczkDEm4OR8xYiRUZlbJe
 MBQAkcJ944TN+IqLcI5KLyYGNAouJhsxQlpn5B/l7vmdzvkN6L0BvxCCU49EfMYGAl
 +B7KCzdUCMHT17Bp/WB5XQ3s2fXFLD/l/9ytrH6CwcphT4ATqwWSwYKHsiptJgIZRH
 2vzg8n+dqhScMa/gY1bINcNsD25GKi+XEkEUTukJZgLLEdgvewYVEWPijeI/aUhBgG
 /uNji+HhXsdgg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BB4D6C4160E; Mon,  7 Jul 2025 07:28:16 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 07 Jul 2025 07:28:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hy50.seo@samsung.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220321-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=220321 Bug ID:
 220321 Summary: F2FS: workqueue: WQ_MEM_RECLAIM writeback:wb_workfn is
 flushing
 !WQ_MEM_RECLAIM events_unbound:quota_release_workfn Product: File System
 Version: 2.5 Hardware: ARM OS: Linux S [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uYgH0-0007lC-AH
Subject: [f2fs-dev] [Bug 220321] New: F2FS: workqueue: WQ_MEM_RECLAIM
 writeback:wb_workfn is flushing !WQ_MEM_RECLAIM
 events_unbound:quota_release_workfn
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
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=220321

            Bug ID: 220321
           Summary: F2FS: workqueue: WQ_MEM_RECLAIM writeback:wb_workfn is
                    flushing !WQ_MEM_RECLAIM
                    events_unbound:quota_release_workfn
           Product: File System
           Version: 2.5
          Hardware: ARM
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: hy50.seo@samsung.com
        Regression: No

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/fs/f2fs/super.c?h=v6.12.36

The panic_on_warn occurred using UFS device test app with high probability.

Occurs when putting the 'quota_release_work' into the workqueue.
The 'quota_release_work' uses 'system_unbound_wq', but WQ_MEM_RECLAIM flag is
not used when creating.

Therefore, before adding the 'quota_release_work' to the work queue, check the
previously operated work queue, which seems to have been created using the
WQ_MEM_RECLAIM flag.
Previouse work queue is 'writeback:wb_workfn'.
So occurred below the problem.

When using a work queue, it seems like you should use a work queue with
'WQ_MEM_RECLAIM' instead of system_unbound_wq.


[6:  kworker/u40:2: 7357] ------------[ cut here ]------------
[6:  kworker/u40:2: 7357] workqueue: WQ_MEM_RECLAIM writeback:wb_workfn is
flushing !WQ_MEM_RECLAIM events_unbound:quota_release_workfn
[6:  kworker/u40:2: 7357] WARNING: CPU: 6 PID: 7357 at kernel/workqueue.c:3721
check_flush_dependency+0x160/0x16c

[6:  kworker/u40:2: 7357] Workqueue: writeback wb_workfn (flush-8:0)
[6:  kworker/u40:2: 7357] pstate: 634020c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS
BTYPE=--)
[6:  kworker/u40:2: 7357] pc : check_flush_dependency+0x160/0x16c
[6:  kworker/u40:2: 7357] lr : check_flush_dependency+0x160/0x16c
[6:  kworker/u40:2: 7357] sp : ffffffc0aa746b40
[6:  kworker/u40:2: 7357] x29: ffffffc0aa746b40 x28: 18ffff882b081000 x27:
0000000000000000
[6:  kworker/u40:2: 7357] x26: caffff88280841a0 x25: 3bffff8801860900 x24:
0000000000000000
[6:  kworker/u40:2: 7357] x23: b7ffff880185a000 x22: 84ffff8805128400 x21:
ffffffd01051b04c
[6:  kworker/u40:2: 7357] x20: 83ffff8064571840 x19: beffff8800033400 x18:
ffffffd012b19dc0
[6:  kworker/u40:2: 7357] x17: 454d5f5157212067 x16: 6e696873756c6620 x15:
51572120676e6968
[6:  kworker/u40:2: 7357] x14: 73756c6620736920 x13: 65725f61746f7571 x12:
3a646e756f626e75
[6:  kworker/u40:2: 7357] x11: 000000000000009c x10: ffffffc0aa746ad0 x9 :
9511e74e66c49200
[6:  kworker/u40:2: 7357] x8 : 9511e74e66c49200 x7 : ffffffffffffffff x6 :
ffffffd0117ee30c
[6:  kworker/u40:2: 7357] x5 : 0000000000000000 x4 : 0000000000000001 x3 :
0000000000000000
[6:  kworker/u40:2: 7357] x2 : 0000000000000002 x1 : 00000000000000ff x0 :
ffffffbc0aa746ab
[6:  kworker/u40:2: 7357] Call trace:
[6:  kworker/u40:2: 7357]  check_flush_dependency+0x160/0x16c
[6:  kworker/u40:2: 7357]  __flush_work+0x168/0x738
[6:  kworker/u40:2: 7357]  flush_delayed_work+0x58/0x70
[6:  kworker/u40:2: 7357]  dquot_writeback_dquots+0x90/0x4bc
[6:  kworker/u40:2: 7357]  f2fs_do_quota_sync+0x120/0x284
[6:  kworker/u40:2: 7357]  f2fs_write_checkpoint+0x58c/0xe18
[6:  kworker/u40:2: 7357]  f2fs_gc+0x3e8/0xd78
[6:  kworker/u40:2: 7357]  f2fs_balance_fs+0x204/0x284
[6:  kworker/u40:2: 7357]  f2fs_write_single_data_page+0x700/0xaf0
[6:  kworker/u40:2: 7357]  f2fs_write_data_pages+0xe94/0x15bc
[6:  kworker/u40:2: 7357]  do_writepages+0x170/0x3f8
[6:  kworker/u40:2: 7357]  __writeback_single_inode+0xa0/0x8c4
[6:  kworker/u40:2: 7357]  writeback_sb_inodes+0x2ac/0x708
[6:  kworker/u40:2: 7357]  __writeback_inodes_wb+0xc0/0x118
[6:  kworker/u40:2: 7357]  wb_writeback+0x1f4/0x664
[6:  kworker/u40:2: 7357]  wb_workfn+0x62c/0x900
[6:  kworker/u40:2: 7357]  process_one_work+0x3f8/0x968
[6:  kworker/u40:2: 7357]  worker_thread+0x610/0x794
[6:  kworker/u40:2: 7357]  kthread+0x1c4/0x1e4
[6:  kworker/u40:2: 7357]  ret_from_fork+0x10/0x20
[6:  kworker/u40:2: 7357] Kernel panic - not syncing: kernel: panic_on_warn set
...

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
