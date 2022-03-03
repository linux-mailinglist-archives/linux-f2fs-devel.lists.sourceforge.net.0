Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 35DBE4CC9D0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 00:09:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPuZb-0000Gi-V6; Thu, 03 Mar 2022 23:09:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nPuZa-0000GW-5T
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Mar 2022 23:09:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cfhIDahStjEtCPqWnWG4SOGJ+bciHMtbLLEODNGdlMQ=; b=UCrC7HEj2s1kgD8fwbHSdhvIRn
 6zK3HVQvsPNexOCI6RvZyAeXnCgsB0gfTGs6vGolqe7SP31YUECNqcAmEfz3y3TrdGGIcwLflMCCu
 Loz61qowgwvDEw9Bd9zsViyTp4UVYKQhksd2Q4NW1F3km2621Y6R5XO9xVLGo4fNTHg0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cfhIDahStjEtCPqWnWG4SOGJ+bciHMtbLLEODNGdlMQ=; b=Y
 TPh0DyVGLXOojgwV+IyUrt8hvncEkn9kimFHN+StcYBtg9R0Um+7CHL1KGG5oUv6pFU+oxaGE2Sm/
 pV6E17RyxnEWB16+ntCeaXw7rY3pp/akeKcu7ERqOhJ+Q/3bOoy9eC+8v7RlVJARr1AyvSwpQCcwO
 d5hSksO39YMVWk2M=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPuZX-00499H-LY
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Mar 2022 23:09:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id DF8CACE28BB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Mar 2022 23:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B19AC340EC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Mar 2022 23:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646348952;
 bh=tWYp3HSf7a8paDWMZaKqhOSFyOKIIZSlyv0B1RCvhGY=;
 h=From:To:Subject:Date:From;
 b=dX1brni1wEEBgmAUhyfGr4a9AXKjfgijBVImWFcmMQoj+vIWpcrXL/ZQxfmzH2Euj
 /9BCRnBeejcAEA9h2k3kHK3U1TvZf+9HMJYlrb31K20+G+/O4HRlmI0zkYBq0GJLYO
 SBhxKCS7Bj4eb8byDnKUGa0IwpM22Xke8L7OZ0G4SDd161Ikq3hEHZSnIW3dCAyg7V
 Hru71V+W9LFg5qzpftU18WQrqqAkQt0+XcPj4mWatwO1qn9ome94pYDWKboxK7fUYI
 Hg/q39Axc8Dt8cHVplfMA5l+H7t9JfqC4x6kWkYQiFy7xBnRQOGXgc+Mq9ePO2f3ee
 vjvGoXvo9tNxQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 01C49C05FD0; Thu,  3 Mar 2022 23:09:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 03 Mar 2022 23:09:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wenqingliu0120@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-215657-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215657 Bug ID:
 215657 Summary: UBSAN: array-index-out-of-bounds in fs/f2fs/segment.c when
 mount and operate a corrupted image Product: File System Version: 2.5 Kernel
 Version: 5.17-rc4, 5.17-rc6 Hardware: A [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPuZX-00499H-LY
Subject: [f2fs-dev] [Bug 215657] New: UBSAN: array-index-out-of-bounds in
 fs/f2fs/segment.c when mount and operate a corrupted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215657

            Bug ID: 215657
           Summary: UBSAN: array-index-out-of-bounds in fs/f2fs/segment.c
                    when mount and operate a corrupted image
           Product: File System
           Version: 2.5
    Kernel Version: 5.17-rc4, 5.17-rc6
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: wenqingliu0120@gmail.com
        Regression: No

Created attachment 300527
  --> https://bugzilla.kernel.org/attachment.cgi?id=300527&action=edit
poc and .config

- Overview 
UBSAN: array-index-out-of-bounds in fs/f2fs/segment.c:3460:2 when mount and
operate a corrupted image

- Reproduce 
tested on kernel 5.17-rc4, 5.17-rc6

# mkdir test_crash
# cd test_crash 
# unzip tmp2.zip
# mkdir mnt
# ./single_test.sh f2fs 2

- Kernel dump
[   46.434454] loop0: detected capacity change from 0 to 131072
[   46.529839] F2FS-fs (loop0): Mounted with checkpoint version = 7548c2d9
[   46.738319]
================================================================================
[   46.738412] UBSAN: array-index-out-of-bounds in fs/f2fs/segment.c:3460:2
[   46.738475] index 231 is out of range for type 'unsigned int [2]'
[   46.738539] CPU: 2 PID: 939 Comm: umount Not tainted 5.17.0-rc6 #1
[   46.738547] Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS
1.13.0-1ubuntu1.1 04/01/2014
[   46.738551] Call Trace:
[   46.738556]  <TASK>
[   46.738563]  dump_stack_lvl+0x47/0x5c
[   46.738581]  ubsan_epilogue+0x5/0x50
[   46.738592]  __ubsan_handle_out_of_bounds+0x68/0x80
[   46.738604]  f2fs_allocate_data_block+0xdff/0xe60 [f2fs]
[   46.738819]  do_write_page+0xef/0x210 [f2fs]
[   46.738934]  f2fs_do_write_node_page+0x3f/0x80 [f2fs]
[   46.739038]  __write_node_page+0x2b7/0x920 [f2fs]
[   46.739162]  f2fs_sync_node_pages+0x943/0xb00 [f2fs]
[   46.739268]  ? __inode_wait_for_writeback+0xd1/0x120
[   46.739283]  ? iput+0xd6/0x390
[   46.739293]  f2fs_write_checkpoint+0x7bb/0x1030 [f2fs]
[   46.739405]  kill_f2fs_super+0x125/0x150 [f2fs]
[   46.739507]  deactivate_locked_super+0x60/0xc0
[   46.739517]  deactivate_super+0x70/0xb0
[   46.739524]  cleanup_mnt+0x11a/0x200
[   46.739532]  __cleanup_mnt+0x16/0x20
[   46.739538]  task_work_run+0x67/0xa0
[   46.739547]  exit_to_user_mode_prepare+0x18c/0x1a0
[   46.739559]  syscall_exit_to_user_mode+0x26/0x40
[   46.739568]  do_syscall_64+0x46/0xb0
[   46.739584]  entry_SYSCALL_64_after_hwframe+0x44/0xae
[   46.739594] RIP: 0033:0x7f7b9d28a657
[   46.739602] Code: 98 2c 00 f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00
31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01
f0 ff ff 73 01 c3 48 8b 0d 01 98 2c 00 f7 d8 64 89 01 48
[   46.739608] RSP: 002b:00007ffd5f511d68 EFLAGS: 00000246 ORIG_RAX:
00000000000000a6
[   46.739616] RAX: 0000000000000000 RBX: 0000558790c51420 RCX:
00007f7b9d28a657
[   46.739620] RDX: 0000000000000001 RSI: 0000000000000000 RDI:
0000558790c590b0
[   46.739623] RBP: 0000000000000000 R08: 0000558790c598a0 R09:
0000000000000004
[   46.739626] R10: 000000000000000b R11: 0000000000000246 R12:
0000558790c590b0
[   46.739630] R13: 00007f7b9d7ac8a4 R14: 0000558790c51600 R15:
0000000000000000
[   46.739637]  </TASK>
[   46.739711]
================================================================================

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
