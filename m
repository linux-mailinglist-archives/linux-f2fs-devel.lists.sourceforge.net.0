Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7323957B3FE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Jul 2022 11:38:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oE69q-00048p-FW; Wed, 20 Jul 2022 09:38:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oE69P-00048H-Ey
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Jul 2022 09:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oWwNcp7ezfURDRxXDBRCaioYCgl8rtK/TsTN4i4LMu0=; b=ar6RNiJYdJvCp9M2JdFnWwSDDz
 byxAgPtdCnr4ITIkeXami2y7c+CQ+wP6W5RRFZ0ozityhqLwE4am4YefJrW1SMAqNagIfQSNqZcx1
 cDoUWjhACBYHxeyuYrLpbT5o2q9ksqmr8MHQpoujXgdvgMmQKCcwsEk0qX/RYT0CvCXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oWwNcp7ezfURDRxXDBRCaioYCgl8rtK/TsTN4i4LMu0=; b=A
 h7Qiy1pFPeMgLOyEjENhEFusPripshnfuv/F4ywdhZKsstnijNePpjfV1soN0igaij9Zzx2dOKHus
 9HxXFaaF0+xHFg5Oh6us7RbNW2SwwRg/kcUMthPYwRA5orhYdVkxOHzdk76JQPnuiTt31bCkmAIDS
 g+sd+T8wSLhNFM7Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oE69J-004tjj-8Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Jul 2022 09:37:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 124F06126A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Jul 2022 09:37:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F90AC3411E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Jul 2022 09:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658309854;
 bh=QSIPGwa51XFKf9OdXkR2izXLy97Yv9Dm8yDDQ7lSdn8=;
 h=From:To:Subject:Date:From;
 b=NAA5SBPIOP5vKWYXAsIWiu2YBhcU/6ZeZ7fOQ0eoty8UyZ1+iU6pqOq1rCgkemPBH
 74bmUqOHMBtMx1e2o25DiNJEIL8RyrB6cBdRR/o4n4UipDj/ozyiGcUn4Uy3bLTG+E
 BTC/ePuUOq0mK+2DJuGKlcFQboyiUZBT1x0otjInFj3FFoGBthgY9bmlRn1RFrkCqX
 z4o+oWIhOhiJl+bV3475vO4WylGSVTtt6t9gkh8lIdXDJsG1v5qW2EEHi7m60vNK6A
 ixPgrSFIGlIcB/Cc43yrxqJbQWgs54996Jzy6sXrim29Bcka80qZu7H+8a1hN4VfXf
 OkxwZMdrA4RiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 17F6AC05FD6; Wed, 20 Jul 2022 09:37:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 20 Jul 2022 09:37:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lecopzer.chen@mediatek.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216262-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216262 Bug ID:
 216262 Summary: KASAN: invalid-access in f2fs_lookup_rb_tree+0xac/0x144
 Product:
 File System Version: 2.5 Kernel Version: 5.4.190 Hardware: All OS: Linux
 Tree: Mainline Status: NEW Severity: [...] 
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
X-Headers-End: 1oE69J-004tjj-8Q
Subject: [f2fs-dev] [Bug 216262] New: KASAN: invalid-access in
 f2fs_lookup_rb_tree+0xac/0x144
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

https://bugzilla.kernel.org/show_bug.cgi?id=216262

            Bug ID: 216262
           Summary: KASAN: invalid-access in
                    f2fs_lookup_rb_tree+0xac/0x144
           Product: File System
           Version: 2.5
    Kernel Version: 5.4.190
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: lecopzer.chen@mediatek.com
        Regression: No

kernel is from
https://android.googlesource.com/kernel/common/+log/refs/heads/android12-5.4
996a4638b6190fe369f1347c093c26762babd223

and this was from a stress test for 20hr and only happened for once.

I guess it's an abnormal value (race condition?) which wasn't catch by any
checking.

I couldn't find any exist commit that may solve this (if it had already fixed
please tell me, thanks).


[Wed Jul 20 00:10:57.331 2022] [ 2795.615407]
==================================================================
[Wed Jul 20 00:10:57.331 2022] [ 2795.631096] BUG: KASAN: invalid-access in
f2fs_lookup_rb_tree+0xac/0x144
[Wed Jul 20 00:10:57.331 2022] [ 2795.638520] Read of size 4 at addr
400008aa1603e211 by task f2fs_ckpt-259:1/181
[Wed Jul 20 00:10:57.331 2022] [ 2795.646529] 
[Wed Jul 20 00:10:57.331 2022] [ 2795.648748] CPU: 2 PID: 181 Comm:
f2fs_ckpt-259:1 Tainted: P        WC O      5.4.190-gad047c3d9ea5-dirty #1
[Wed Jul 20 00:10:57.331 2022] [ 2795.659275] Hardware name: MediaTek (DT)
[Wed Jul 20 00:10:57.331 2022] [ 2795.664513] Call trace:
[Wed Jul 20 00:10:57.331 2022] [ 2795.667688] dump_backtrace+0x0/0x220
[Wed Jul 20 00:10:57.331 2022] [ 2795.672075] show_stack+0x24/0x34
[Wed Jul 20 00:10:57.331 2022] [ 2795.676113] dump_stack+0x138/0x1b8
[Wed Jul 20 00:10:57.331 2022] [ 2795.680321] __kasan_report+0x1d8/0x320
[Wed Jul 20 00:10:57.331 2022] [ 2795.684871] kasan_report+0x14/0x20
[Wed Jul 20 00:10:57.331 2022] [ 2795.689115] __hwasan_load4_noabort+0x88/0x94
[Wed Jul 20 00:10:57.331 2022] [ 2795.694214] f2fs_lookup_rb_tree+0xac/0x144
[Wed Jul 20 00:10:57.331 2022] [ 2795.699122] f2fs_wait_discard_bio+0x7c/0x6d4
[Wed Jul 20 00:10:57.331 2022] [ 2795.704202]
f2fs_allocate_data_block+0x3dc/0x1314
[Wed Jul 20 00:10:57.331 2022] [ 2795.709712] do_write_page+0xf0/0x398
[Wed Jul 20 00:10:57.331 2022] [ 2795.714098]
f2fs_outplace_write_data+0xc8/0x2bc
[Wed Jul 20 00:10:57.331 2022] [ 2795.719440]
f2fs_do_write_data_page+0x9fc/0xe60
[Wed Jul 20 00:10:57.331 2022] [ 2795.724784]
f2fs_write_single_data_page+0x748/0xd2c
[Wed Jul 20 00:10:57.335 2022] [ 2795.730472]
f2fs_write_cache_pages+0x904/0xf78
[Wed Jul 20 00:10:57.335 2022] [ 2795.735726]
__f2fs_write_data_pages+0x558/0x91c
[Wed Jul 20 00:10:57.335 2022] [ 2795.741066] f2fs_write_data_pages+0x58/0x6c
[Wed Jul 20 00:10:57.335 2022] [ 2795.746058] do_writepages+0x9c/0x1a0
[Wed Jul 20 00:10:57.335 2022] [ 2795.750446]
__filemap_fdatawrite_range+0x1d4/0x218
[Wed Jul 20 00:10:57.335 2022] [ 2795.756045] filemap_fdatawrite+0x2c/0x3c
[Wed Jul 20 00:10:57.335 2022] [ 2795.760780] f2fs_quota_sync_file+0x94/0x1dc
[Wed Jul 20 00:10:57.335 2022] [ 2795.765775] f2fs_quota_sync+0x1a8/0x300
[Wed Jul 20 00:10:57.335 2022] [ 2795.770421] block_operations+0xcc/0x4ec
[Wed Jul 20 00:10:57.335 2022] [ 2795.775066] f2fs_write_checkpoint+0x234/0xa34
[Wed Jul 20 00:10:57.335 2022] [ 2795.780232]
__checkpoint_and_complete_reqs+0xa0/0x700
[Wed Jul 20 00:10:57.335 2022] [ 2795.786089]
issue_checkpoint_thread+0x78/0x1c4
[Wed Jul 20 00:10:57.335 2022] [ 2795.791341] kthread+0x240/0x268
[Wed Jul 20 00:10:57.335 2022] [ 2795.795295] ret_from_fork+0x10/0x18
[Wed Jul 20 00:10:57.335 2022] [ 2795.799586]
==================================================================
[Wed Jul 20 00:10:57.335 2022] [ 2795.807741] Mem abort info:
[Wed Jul 20 00:10:57.335 2022] [ 2795.807948] Unable to handle kernel paging
request at virtual address 000008aa1603e211
[Wed Jul 20 00:10:57.335 2022] [ 2795.811307] ESR = 0x96000004
[Wed Jul 20 00:10:57.335 2022] [ 2795.811323] EC = 0x25: DABT (current EL), IL
= 32 bits

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
