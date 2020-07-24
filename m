Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B244F22BB8F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 03:31:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jymYd-0007cE-GI; Fri, 24 Jul 2020 01:31:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=EU6e=BD=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1jymYb-0007c5-Hw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:31:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wtT1hH1dHeOVIyvDmj/tehDsvm4ckefASR8TI4Wsbpw=; b=KjArdz0nBDK+4QznJ2MTDlJl1J
 W85nzoMLLfyQd7Yznw+2qgsn4zUSuB9XHEDee7NMFkcimOOdhiptuwniF1fgRKaO6Hx0o3dAFMWYO
 EffIzAC3anqyAao34U7jS3gElKZxFMLaawyr16EcRy87VI5tIs4ifOKl7KU3pmhAsm+o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wtT1hH1dHeOVIyvDmj/tehDsvm4ckefASR8TI4Wsbpw=; b=FYpV5jnltG4K8+rNmmHVAyQyuT
 h5vCN4awXcbiAIkU4xU0Z5PE4AU+36c3Mb8CcTmuKwwoHTIpP9kmrQ1OG8SmaGdSW6tVozQsJyTAW
 wHkLvEb2pfnLPt3TsLzSzV2HxhxpvFPz8J92dYmNQ8yEnGbFEkWz+iZ0uBTL64KMJJyI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jymYa-00FV6v-7J
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 01:31:29 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 24 Jul 2020 01:31:17 +0000
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
Message-ID: <bug-208565-202145-PxLvlH3D7N@https.bugzilla.kernel.org/>
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
X-Headers-End: 1jymYa-00FV6v-7J
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

--- Comment #7 from yuchao0@huawei.com ---
On 2020/7/17 1:15, bugzilla-daemon@bugzilla.kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=208565
> 
> Jaegeuk Kim (jaegeuk@kernel.org) changed:
> 
>             What    |Removed                     |Added
> ----------------------------------------------------------------------------
>                   CC|                            |jaegeuk@kernel.org
> 
> --- Comment #1 from Jaegeuk Kim (jaegeuk@kernel.org) ---
> Thank you for the report.
> 
> I think this is valid point that we need to fix.
> I'm testing a RFC patch like this. Thanks.


Shouldn't we revert 34c061ad85a2 ("f2fs: Avoid double lock for cp_rwsem during
checkpoint")
at the same time?

> 
> --- a/fs/f2fs/node.c
> +++ b/fs/f2fs/node.c
> @@ -1926,8 +1926,12 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>                                  goto continue_unlock;
>                          }
> 
> -                       /* flush inline_data, if it's async context. */
> -                       if (do_balance && is_inline_node(page)) {
> +                       /* flush inline_data/inode, if it's async context. */
> +                       if (!do_balance)
> +                               goto write_node;
> +
> +                       /* flush inline_data */
> +                       if (is_inline_node(page)) {
>                                  clear_inline_node(page);
>                                  unlock_page(page);
>                                  flush_inline_data(sbi, ino_of_node(page));
> @@ -1940,7 +1944,7 @@ int f2fs_sync_node_pages(struct f2fs_sb_info *sbi,
>                                  if (flush_dirty_inode(page))
>                                          goto lock_node;
>                          }
> -
> +write_node:
>                          f2fs_wait_on_page_writeback(page, NODE, true, true);
> 
>                          if (!clear_page_dirty_for_io(page))
>

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
