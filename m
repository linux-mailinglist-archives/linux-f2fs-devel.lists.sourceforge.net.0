Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86C4C220CDB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Jul 2020 14:25:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jvgT3-0006Se-Ot; Wed, 15 Jul 2020 12:24:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=fEu5=A2=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1jvgT2-0006SU-Ep
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 12:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JYpyqBzVTonq++Lt6T5OviRqCB5/sggFiIqp7OVZ6KE=; b=Nzern4wtIl/jSll/1dKWndtHzy
 e9xMaH1T6lcdhYTs+ALhKFulJNgKBTGB+gyttrlzok2jaCIYHRRJYL5JZfxjJLws+FH9WGZs8Ipwr
 n4IQqRUj1x10FTgR0btIQwUAJUsJkFQrcr2SGrBNDUJE4emL2EXa4lp2ivYrlvKEBQYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JYpyqBzVTonq++Lt6T5OviRqCB5/sggFiIqp7OVZ6KE=; b=j
 j52oHJ9bUaHU7IK555neltCc+1L7k/9qgMJ1bNVUYPXgU7lxg+4cFes8qSsbZgdl9rC7gsoFmq0Aw
 WLEvBZdA/u2eKETLuw3ZG+bPea+MeQ7ghmlPC5+4mRpMTEkZTJTiMrW+1ODlOPvoTi7nVGvvcTbfR
 8kJa6TsALTmeUha4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jvgT0-004RU8-SG
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 15 Jul 2020 12:24:56 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 15 Jul 2020 12:24:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Zhiguo.Niu@unisoc.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-208565-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlesource.com]
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jvgT0-004RU8-SG
Subject: [f2fs-dev] [Bug 208565] New: There may be dead lock for cp_rwsem
 during checkpoint
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

https://bugzilla.kernel.org/show_bug.cgi?id=208565

            Bug ID: 208565
           Summary: There may be dead lock for cp_rwsem during checkpoint
           Product: File System
           Version: 2.5
    Kernel Version: 4.14.181
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: Zhiguo.Niu@unisoc.com
        Regression: No

A deadlock may happens in the following scenario, backtrace is:

PID: 257    TASK: ecdd0000  CPU: 0   COMMAND: "init"
 #0 [<c0b420ec>] (__schedule) from [<c0b423c8>]
 #1 [<c0b423c8>] (schedule) from [<c0b459d4>]
 #2 [<c0b459d4>] (rwsem_down_read_failed) from [<c0b44fa0>]
 #3 [<c0b44fa0>] (down_read) from [<c044233c>]
 #4 [<c044233c>] (f2fs_truncate_blocks) from [<c0442890>]
 #5 [<c0442890>] (f2fs_truncate) from [<c044d408>]
 #6 [<c044d408>] (f2fs_evict_inode) from [<c030be18>]
 #7 [<c030be18>] (evict) from [<c030a558>]
 #8 [<c030a558>] (iput) from [<c047c600>]
 #9 [<c047c600>] (f2fs_sync_node_pages) from [<c0465414>]
#10 [<c0465414>] (f2fs_write_checkpoint) from [<c04575f4>]
#11 [<c04575f4>] (f2fs_sync_fs) from [<c0441918>]
#12 [<c0441918>] (f2fs_do_sync_file) from [<c0441098>]
#13 [<c0441098>] (f2fs_sync_file) from [<c0323fa0>]
#14 [<c0323fa0>] (vfs_fsync_range) from [<c0324294>]
#15 [<c0324294>] (do_fsync) from [<c0324014>]
#16 [<c0324014>] (sys_fsync) from [<c0108bc0>]

f2fs_sync_node_pages tries to flush dirty inode and calls iput(). This results
in deadlock as iput() tries to hold cp_rwsem, which is already held at the
beginning by checkpoint->block_operations().

There is a similar issue and patch in android.googlesource.com with commit id
is 82cc5e607b56abea4ea77023650247f5ae41b515, but the call trace is:

- f2fs_sync_node_pages()
 - if (is_inline_node(page))
>  - flush_inline_data()
   - ilookup()
     page = f2fs_pagecache_get_page()
     if (!page)
      goto iput_out;
     iput_out:
                        -close()
                        -iput()
       iput(inode);
       - f2fs_evict_inode()
        - f2fs_truncate_blocks()
         - f2fs_lock_op()
           - down_read(&sbi->cp_rwsem);

it seems than this patch has not cover current deadlock scenario, the current
deadlock call trace is:
- f2fs_sync_node_pages()

>  - if (flush_dirty_inode(page))

  - iput(inode);

       - f2fs_evict_inode()

        - f2fs_truncate_blocks()

         - f2fs_lock_op()

           - down_read(&sbi->cp_rwsem);

please help check and confirm.

thanks!

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
