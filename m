Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA762DCC92
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Dec 2020 07:43:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kpn0d-0006zS-B3; Thu, 17 Dec 2020 06:43:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1kpn0Y-0006z5-1J
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:43:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KOUWfWMkY+1u47+hpLX89g0knlRZS9Rnf+K7vA5xgTk=; b=UqBVHjAMUoB/Ey/jk1ruCkASAY
 TktUCN7VLn/UsNzC9NHWGvbq/MaS0Ss4YQUqponT3mFx8o2k9gg+wvc/oV1rbwvE7jkouiCkxvIQm
 E19RGvxWX6glzZBqiVTbGfClY6QPAlI0sSnSALrHZm0ncaukkjaHzqjZ+P2YZzYe4Ffo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KOUWfWMkY+1u47+hpLX89g0knlRZS9Rnf+K7vA5xgTk=; b=g
 RvQ5nnXI6N1xro/Nwpu30vSAgI5lHCieEPb0twJ6wXlGY1kMHGr7RUQqAD1gqrHigaylVVx6pOCQ8
 uAdh0+1UWXJtAAE4ONCgON9UeBVZ82E6BndckdvT+idHVV4t5liFEHxjjAIp5eAbSufQTlgo2lm95
 aOqhny7I4c9JAhvQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kpn0O-00H0Go-FK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Dec 2020 06:43:25 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 17 Dec 2020 06:43:10 +0000
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
Message-ID: <bug-210745-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: unisoc.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kpn0O-00H0Go-FK
Subject: [f2fs-dev] [Bug 210745] New: kernel crash during umounting a
 partition with f2fs filesystem
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

https://bugzilla.kernel.org/show_bug.cgi?id=210745

            Bug ID: 210745
           Summary: kernel crash during umounting a partition with f2fs
                    filesystem
           Product: File System
           Version: 2.5
    Kernel Version: 4.14.193
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

Hi,
When we do the reboot stress test in a device, we may encounter the following
kernel crash occasionally.


[   42.035226] c6 Unable to handle kernel NULL pointer dereference at virtual
address 0000000a
[   43.437464] c6  __list_del_entry_valid+0xc/0xd8
[   43.441962] c6  f2fs_destroy_node_manager+0x218/0x398
[   43.446984] c6  f2fs_put_super+0x19c/0x2b8
[   43.451052] c6  generic_shutdown_super+0x70/0xf8
[   43.455635] c6  kill_block_super+0x2c/0x5c
[   43.459702] c6  kill_f2fs_super+0xac/0xd8
[   43.463684] c6  deactivate_locked_super+0x5c/0x124
[   43.468442] c6  deactivate_super+0x5c/0x68
[   43.472512] c6  cleanup_mnt+0x9c/0x118
[   43.476231] c6  __cleanup_mnt+0x1c/0x28
[   43.480043] c6  task_work_run+0x88/0xa8
[   43.483850] c6  do_notify_resume+0x39c/0x1c88
[   43.488174] c6  work_pending+0x8/0x14

the code of crash point is:
f2fs/node.c

void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)

        while ((found = __gang_lookup_nat_cache(nm_i,
                                        nid, NATVEC_SIZE, natvec))) {
                unsigned idx;

                nid = nat_get_nid(natvec[found - 1]) + 1;
                for (idx = 0; idx < found; idx++) {
                        spin_lock(&nm_i->nat_list_lock);
>                       list_del(&natvec[idx]->list);
                        spin_unlock(&nm_i->nat_list_lock);

                        __del_from_nat_cache(nm_i, natvec[idx]);
                }
        }

because of the current nat entry in natvec[idx] is a invalid pointer or its
member list has null next member.

We have encountered this issue for several times in both Andoird Q & R version

I analyze these issue as following:

1. the current nat can be found in stack, like as "a"
ffffff800806b8d0:  ffffffc0af33cbc0 ffffffc0af4869a0 
> ffffff800806b8e0:  ffffffc0f49baa00 000000000000000a 
ffffff800806b8f0:  ffffffc0af33c040 ffffffc0c69f0e20 
ffffff800806b900:  ffffffc0c695abc0 ffffffc01e2a4460 

2.these invalid entry can be found in nat_root radix tree of f2fs_nm_info

3. I have reviewed the codes about nat_tree_lock, and has not any clues

please let me know if you need any other information
thanks a lot.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
