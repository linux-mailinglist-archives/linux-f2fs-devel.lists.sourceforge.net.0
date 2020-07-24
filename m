Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4F522BC8A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 05:38:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyoXy-0008R6-FP; Fri, 24 Jul 2020 03:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=EU6e=BD=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1jyoXv-0008Qu-Ol
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xGa7rH8hs0s4i/u6P3aszHp2dm6wpIOOFT5XejED42M=; b=OBk7jErr8Jitw2h8NW3fe8rSLO
 Ro/YynmMH5fRYVwWOOL94uZXAY9Q4/SPO6IGZH1rLrt04PyzzmHtPjP2+WumRrFyjFI+3goRv8/5J
 lJjnJXMfqNPpbsdPDnLxCka0kWSGJoqwQJ90v/RoQwP4+0Ug6TQa78aTdEWCLAgeo6yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xGa7rH8hs0s4i/u6P3aszHp2dm6wpIOOFT5XejED42M=; b=VZx3HbHpdWcCZWxENadEQMbC3G
 5FohXJg6oMPj2Tifkp1lvpoUqFyWJk8snDK+RnHc98k3iB0Qtm0kBa2bliKYJcJbks7cglNDf+Gtj
 CYuczqiTAs/LMDuQPTeJiOYtPsN/QIszW1RWtnDrD/PNv3D1/mNdPQOiuyWl459H/ZEo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyoXu-00761s-Cw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 03:38:55 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 24 Jul 2020 03:38:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: yuchao0@huawei.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208565-202145-6LJawQi8I5@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208565-202145@https.bugzilla.kernel.org/>
References: <bug-208565-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyoXu-00761s-Cw
Subject: [f2fs-dev] [Bug 208565] There may be dead lock for cp_rwsem during
 checkpoint
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

--- Comment #9 from yuchao0@huawei.com ---
On 2020/7/24 11:21, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208565
> 
> --- Comment #8 from Jaegeuk Kim (jaegeuk@kernel.org) ---
> Chao, why do we need to revert that patch?

After applying your new patch, below race condition should no longer
happen, right?

Thread A                Thread B
f2fs_write_checkpoint()
- block_operations(sbi)
  - f2fs_lock_all(sbi);
   - down_write(&sbi->cp_rwsem);

                         - open()
                          - igrab()
                         - write() write inline data
                         - unlink()
- f2fs_sync_node_pages()

+ if (!do_balance)
+       goto write_node;        <---- this avoids running into iput().

  - if (is_inline_node(page))
   - flush_inline_data()
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

> 
> Zhiguo,
> You can see the patch here.
>
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=b0f3b87fb3abc42c81d76c6c5795f26dbdb2f04b
>

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
