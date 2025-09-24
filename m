Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D4ACEB986FB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 08:50:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qaHsrUdkgyegAIm/tuDIcM/31xe95vzeB/H8k9WGu54=; b=DRLigZOskMbSaSVrygrQ6UPHQ/
	XyXfJIZ9TT0JB8vfH7gnGKmcZFYx9LCmt3Pjgw9I8BGSsYPrytsZpU4HjjlyS9Wfs3JAxjp3sSpto
	mkmuUB4VqSnQt0+jQ1AklKJvnlHxVSfKY49iuu52epCTYyMdIPnNwMI8b0NzEeAh0xvc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1JKr-0002rN-3b;
	Wed, 24 Sep 2025 06:50:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v1JKp-0002rH-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 06:50:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EpiACrBP5imIjheB4zVIbUxsC9jMf9Vnm3a61325oHE=; b=grmlxYA7BriwVsZVOZLb5BsONE
 UXNYq9LTqegIPiEKzRzIvqjll4tZ/egHkIB9KqIZDAmjJa39tjxHs7yxSxCFeuNP+rbYjfBDPLNZO
 GudCboHB51W2ussug/5nMWCsHYtzwenE/Z6xO+mZZBhR1fK5M+JBhTNgs3dX1rTYL2m8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EpiACrBP5imIjheB4zVIbUxsC9jMf9Vnm3a61325oHE=; b=WcL3YLb+bR/RExVJGyNp2vikpI
 yVPa/gDChvRQiAIgCAZOsWx53eLrlEYNCl5bpHYSmXgnlvMgT7GN9wdIAazfia2lw00gGpbWSeiRT
 tya1sYn8k0BrMCVGKkprNWfMHB2bpWpYUp5eO6xQl7uvYCkA3j+JQ5ki704k02P4/Gi0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1JKp-0001LF-8s for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 06:50:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9B05D60051
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 06:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DB4CC4CEE7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 06:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758696628;
 bh=kdFhf0/qVYyrrr5/XWx7tytJx+VwC6YEaR8HqUYNuxA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=s7L4gY7jZrDmglBpkKi6c3iMMPNtsganI591I9NJZn2crPtqTNg0mdeqc3hs0o13v
 xAJXYXOUQcRot6X8o0xmq5ZqGAri5dYBY9lv81wGVgHzoVXlZE17b6DmmPOaTqF+Z8
 +Y13BHABSaCbL8oscy9wu914tzuODZxXAOPQvZ7RkfRqyp1arnyi16ouWRwZrmLS6s
 TjBtrDl4+eIF8Ja44KlHNkp548jHkZXp763ETloMzeujMJpY32NRW1mUkJJRYcPy6G
 p0FsCFSe3n+9f8eE923stQ8LDzWNszm5c9c9a6Tm5fFOvdg5bjmqPezpG+D3sXOKJL
 jE5sYGkHgXijQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 3A5D8C3279F; Wed, 24 Sep 2025 06:50:28 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Sep 2025 06:50:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: JY.Ho@mediatek.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-eLRXzVYrxm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220575 ---
 Comment
 #4 from JY (JY.Ho@mediatek.com) --- (In reply to Chao Yu from comment #3)
 > I meant using trace32 to dump field value of victim page, something like
 > that. :) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1JKp-0001LF-8s
Subject: [f2fs-dev] [Bug 220575] Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
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

https://bugzilla.kernel.org/show_bug.cgi?id=220575

--- Comment #4 from JY (JY.Ho@mediatek.com) ---
(In reply to Chao Yu from comment #3)
> I meant using trace32 to dump field value of victim page, something like
> that. :)

For some reasons, I can't dump the victim page with trace32.
So I'm using 'page_owner' and add new member '_private' to the struct page.
I Modified the function 'set_page_private()' in include/linux/mm_types.h
static inline void set_page_private(...)
{
        page->private = private;
+       if (!private)
+               page->_private = private;
}

also modified the function 'f2fs_is_cp_guaranteed'
bool f2fs_is_cp_guaranteed(const struct page *page)
{
        struct address_space *mapping = page->mapping;
        struct inode *inode;
        struct f2fs_sb_info *sbi;

        if (fscrypt_is_bounce_page(page)) {
+               pr_crit("bounced_page:0xpx, pp:0x%px,
fscrypt_pagecache_page(page):0x%px\n", page, page->_private,
fscrypt_pagecache_page(page));
+               if (page->_private)
+                       dump_page(page->_private, "dump _private page");
+               else
+                       dump_page(page, "dump bounce page");
                return page_private_gcing(fscrypt_pagecache_page(page));
}

And I got the log as below:

[2025-09-23 12:54:07.401] [ 2223.580361][T18170]
bounced_page:0xfffffffe82282290, pp:0x0000000000000000,
fscrypt_pagecache_page(page):0x0000000000000000

[2025-09-23 12:54:07.522] [ 2223.636124][T18170] page: refcount:1 mapcount:0
mapping:0000000000000000 index:0xc02b7 pfn:0x6e6d5

[2025-09-23 12:54:07.577] [ 2223.656779][T18170] flags: 0x0(zone=0)

[2025-09-23 12:54:07.577] [ 2223.665281][T18170] page_type: f2(table)

[2025-09-23 12:54:07.577] [ 2223.673618][T18170] raw: 0000000000000000
0000000000000000 0000000000000000 0000000000000000

[2025-09-23 12:54:07.577] [ 2223.691017][T18170] raw: 00000000000c02b7
0000000000000000 00000001f2000000 0000000000000000

[2025-09-23 12:54:07.577] [ 2223.709638][T18170] raw: 0000000000000000
0000000000000000

[2025-09-23 12:54:07.633] [ 2223.734520][T18170] page_owner tracks the page as
allocated

[2025-09-23 12:54:07.633] [ 2223.740836][T18170] page last allocated via order
0, migratetype Unmovable, gfp_mask
0x540dc0(GFP_USER|__GFP_COMP|__GFP_ZERO|__GFP_ACCOUNT), pid 23744, tgid 23744
(sync), ts 2223627020157, free_ts 2223626903324

[2025-09-23 12:54:07.690] [ 2223.760701][T18170]  post_alloc_hook+0x1d4/0x1ec

[2025-09-23 12:54:07.690] [ 2223.765688][T18170]  prep_new_page+0x30/0x154

[2025-09-23 12:54:07.690] [ 2223.770483][T18170] 
get_page_from_freelist+0x11e8/0x127c

[2025-09-23 12:54:07.690] [ 2223.776402][T18170] 
__alloc_pages_noprof+0x1b0/0x448

[2025-09-23 12:54:07.690] [ 2223.781758][T18170] 
pmd_alloc_one_noprof+0x40/0x110

[2025-09-23 12:54:07.690] [ 2223.787714][T18170]  __pmd_alloc+0x34/0x1a8

[2025-09-23 12:54:07.690] [ 2223.792274][T18170]  move_page_tables+0x868/0x928

[2025-09-23 12:54:07.690] [ 2223.797303][T18170]  relocate_vma_down+0x118/0x1f8

[2025-09-23 12:54:07.690] [ 2223.802601][T18170]  setup_arg_pages+0x204/0x33c

[2025-09-23 12:54:07.690] [ 2223.807480][T18170]  load_elf_binary+0x4f0/0xd68

[2025-09-23 12:54:07.690] [ 2223.822457][T18170]  bprm_execve+0x2c8/0x57c

[2025-09-23 12:54:07.745] [ 2223.827615][T18170] 
do_execveat_common+0x26c/0x2c4

[2025-09-23 12:54:07.745] [ 2223.832943][T18170] 
__arm64_compat_sys_execve+0x48/0x60

[2025-09-23 12:54:07.745] [ 2223.839441][T18170]  invoke_syscall+0x60/0x114

[2025-09-23 12:54:07.745] [ 2223.844123][T18170]  el0_svc_common+0xb0/0xe4

[2025-09-23 12:54:07.745] [ 2223.850297][T18170]  do_el0_svc_compat+0x24/0x30

[2025-09-23 12:54:07.745] [ 2223.856538][T18170] page last free pid 23744 tgid
23744 stack trace:

[2025-09-23 12:54:07.745] [ 2223.865252][T18170]  free_unref_page+0x828/0x978

[2025-09-23 12:54:07.801] [ 2223.870493][T18170]  __free_pages+0xe4/0x238

[2025-09-23 12:54:07.801] [ 2223.875113][T18170]  free_pages+0x80/0x9c

[2025-09-23 12:54:07.801] [ 2223.879228][T18170]  pgd_free+0x20/0x30

[2025-09-23 12:54:07.801] [ 2223.883162][T18170]  __mmdrop+0x54/0x168

[2025-09-23 12:54:07.801] [ 2223.887624][T18170]  __mmput+0x14c/0x170

[2025-09-23 12:54:07.801] [ 2223.891790][T18170]  mmput+0x38/0xd8

[2025-09-23 12:54:07.801] [ 2223.895457][T18170]  exec_mmap+0x1c4/0x238

[2025-09-23 12:54:07.801] [ 2223.899907][T18170]  begin_new_exec+0x3cc/0x654

[2025-09-23 12:54:07.801] [ 2223.905047][T18170]  load_elf_binary+0x39c/0xd68

[2025-09-23 12:54:07.801] [ 2223.909934][T18170]  bprm_execve+0x2c8/0x57c

[2025-09-23 12:54:07.801] [ 2223.914547][T18170] 
do_execveat_common+0x26c/0x2c4

[2025-09-23 12:54:07.801] [ 2223.919902][T18170] 
__arm64_compat_sys_execve+0x48/0x60

[2025-09-23 12:54:07.861] [ 2223.925625][T18170]  invoke_syscall+0x60/0x114

[2025-09-23 12:54:07.861] [ 2223.930483][T18170]  el0_svc_common+0xb0/0xe4

[2025-09-23 12:54:07.861] [ 2223.935095][T18170]  do_el0_svc_compat+0x24/0x30

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
