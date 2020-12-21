Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 753852DF9BE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Dec 2020 09:09:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1krGGK-0006eu-LS; Mon, 21 Dec 2020 08:09:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1krGGH-0006eF-Kz
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Dec 2020 08:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y1NXr4+4rtV5aJjmKVgVClsdZ4DajME0AfWxDYZLEZ8=; b=FVwGfYUPxvsspBsvw6lDmBn8+C
 WRPCTptEEeY7dOyukY6aIFlwjP0NT4M9RVKoSQUtPBFbJhNw/y4VCXNudYSg4k7EZDe9OOtP8fSCD
 wNG4Z+pQf1Actarc86kwXTFk+ZPlWhQE1yN8Eeoqq6gJETcQ6+RpiKOEmK6d0c1wN3JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y1NXr4+4rtV5aJjmKVgVClsdZ4DajME0AfWxDYZLEZ8=; b=EkDKt/hw9hKXIdErGZgHHOkdns
 ZZWjeKpGK9ASbB1W1FgXQShTXGCG5UbehvIOgElfQ+EWx+5P3+tOExr/28h5dLo8uz25w5he6Yw3d
 ZNPVn3zgade5ofuglodvw3Ypy86irb0ORPk5VtyJOYiXK5dF6tTinKJzy+UILGT/vNlM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1krGG8-003Rau-6e
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Dec 2020 08:09:45 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 21 Dec 2020 08:09:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: Zhiguo.Niu@unisoc.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-210745-202145-n5dTGYBCLN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210745-202145@https.bugzilla.kernel.org/>
References: <bug-210745-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: unisoc.com]
X-Headers-End: 1krGG8-003Rau-6e
Subject: [f2fs-dev] [Bug 210745] kernel crash during umounting a partition
 with f2fs filesystem
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

--- Comment #2 from Zhiguo.Niu (Zhiguo.Niu@unisoc.com) ---
(In reply to Chao Yu from comment #1)
> Hi,
> 
> I checked the code of 4.14.193, I don't have any clue about why this can
> happen,
> and I don't remember that there is such corruption condition occured on nid
> list, because all its update is under nat_tree_lock, let me know if I missed
> something.
> 
> Do you apply private patch on 4.14.193?


hi Chao, 

Thanks for your reply, I have checked my codebase, there is no any other
private patches in current version.

I find that local variables natvec & setvec in f2fs_destroy_node_manager may be
inited as 0xaa and 0xaaaaaaaaaaaaaaaa, just like :

void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi)
{
        struct f2fs_nm_info *nm_i = NM_I(sbi);
        struct free_nid *i, *next_i;
        struct nat_entry *natvec[NATVEC_SIZE];
        struct nat_entry_set *setvec[SETVEC_SIZE];

dis:
crash_arm64> dis f2fs_destroy_node_manager
0xffffff800842e2a8 <f2fs_destroy_node_manager>: stp     x29, x30, [sp,#-96]!
0xffffff800842e2ac <f2fs_destroy_node_manager+4>:       stp     x28, x27,
[sp,#16]
0xffffff800842e2b0 <f2fs_destroy_node_manager+8>:       stp     x26, x25,
[sp,#32]
0xffffff800842e2b4 <f2fs_destroy_node_manager+12>:      stp     x24, x23,
[sp,#48]
0xffffff800842e2b8 <f2fs_destroy_node_manager+16>:      stp     x22, x21,
[sp,#64]
0xffffff800842e2bc <f2fs_destroy_node_manager+20>:      stp     x20, x19,
[sp,#80]
0xffffff800842e2c0 <f2fs_destroy_node_manager+24>:      mov     x29, sp
0xffffff800842e2c4 <f2fs_destroy_node_manager+28>:      sub     sp, sp, #0x320
0xffffff800842e2c8 <f2fs_destroy_node_manager+32>:      adrp    x8,
0xffffff800947e000 <xt_connlimit_locks+768>
0xffffff800842e2cc <f2fs_destroy_node_manager+36>:      ldr     x8, [x8,#264]
0xffffff800842e2d0 <f2fs_destroy_node_manager+40>:      mov     x27, x0
0xffffff800842e2d4 <f2fs_destroy_node_manager+44>:      str     x8, [x29,#-16]
0xffffff800842e2d8 <f2fs_destroy_node_manager+48>:      nop
0xffffff800842e2dc <f2fs_destroy_node_manager+52>:      ldr     x20, [x27,#112]
0xffffff800842e2e0 <f2fs_destroy_node_manager+56>:      add     x0, sp, #0x110
0xffffff800842e2e4 <f2fs_destroy_node_manager+60>:      mov     w1, #0xaa      
                // #170
0xffffff800842e2e8 <f2fs_destroy_node_manager+64>:      mov     w2, #0x200     
                // #512
0xffffff800842e2ec <f2fs_destroy_node_manager+68>:      bl     
0xffffff8008be6b80 <__memset>
0xffffff800842e2f0 <f2fs_destroy_node_manager+72>:      mov     x8,
#0xaaaaaaaaaaaaaaaa         // #-6148914691236517206
0xffffff800842e2f4 <f2fs_destroy_node_manager+76>:      stp     x8, x8,
[sp,#256]
0xffffff800842e2f8 <f2fs_destroy_node_manager+80>:      stp     x8, x8,
[sp,#240]
0xffffff800842e2fc <f2fs_destroy_node_manager+84>:      stp     x8, x8,
[sp,#224]
0xffffff800842e300 <f2fs_destroy_node_manager+88>:      stp     x8, x8,
[sp,#208]
0xffffff800842e304 <f2fs_destroy_node_manager+92>:      stp     x8, x8,
[sp,#192]
0xffffff800842e308 <f2fs_destroy_node_manager+96>:      stp     x8, x8,
[sp,#176]
0xffffff800842e30c <f2fs_destroy_node_manager+100>:     stp     x8, x8,
[sp,#160]
0xffffff800842e310 <f2fs_destroy_node_manager+104>:     stp     x8, x8,
[sp,#144]
0xffffff800842e314 <f2fs_destroy_node_manager+108>:     stp     x8, x8,
[sp,#128]
0xffffff800842e318 <f2fs_destroy_node_manager+112>:     stp     x8, x8,
[sp,#112]
0xffffff800842e31c <f2fs_destroy_node_manager+116>:     stp     x8, x8,
[sp,#96]
0xffffff800842e320 <f2fs_destroy_node_manager+120>:     stp     x8, x8,
[sp,#80]
0xffffff800842e324 <f2fs_destroy_node_manager+124>:     stp     x8, x8,
[sp,#64]
0xffffff800842e328 <f2fs_destroy_node_manager+128>:     stp     x8, x8,
[sp,#48]
0xffffff800842e32c <f2fs_destroy_node_manager+132>:     stp     x8, x8,
[sp,#32]
0xffffff800842e330 <f2fs_destroy_node_manager+136>:     stp     x8, x8,
[sp,#16]

I am not sure this is the root cause about this issue, because these invalid
entry can be found in nat_root radix tree of f2fs_nm_info

thanks!

thanks!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
