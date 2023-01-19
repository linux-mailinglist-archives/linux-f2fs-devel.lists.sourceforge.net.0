Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 110B5674133
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 19:45:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIZux-0007wI-7e;
	Thu, 19 Jan 2023 18:45:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pIZuv-0007w3-NA
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 18:45:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HdXViYsYgPs9hrtEVy9JFklzJV4/Rq1+j9zV+jbHNS8=; b=bb7xGsy+dUcXF1Q7ONamL/oWnP
 IhXxrxuiNa28EnADwRaHEh+PH/Eg/LbhEL8hq+ECUMbBOIrn68z/JZCtU6pEfJoEGKCiYXEsSYKnn
 N1rYg1yEG/coY6GMMQ0gCLNw9CY4QoukCfnCSg+/j7UxuKxs3VPSe4BAgighfLGHxtzk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HdXViYsYgPs9hrtEVy9JFklzJV4/Rq1+j9zV+jbHNS8=; b=I2YbF5vDhZmIEVkXKCY6cBmddO
 tDW/uxl6yHPcDfUTs9BYi32r5ElH05dRDViyYCYiZ36gE7C38asd2N0ViSTcrsGLgv6DWrEOJwRtj
 NvPscJZDE17F2TjShQFk7T5sDeUF4OW6dr0+bDfWps6x7Kf3Q2TSOBgcAsKhdI7Sa0mg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIZut-0007k9-Hx for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 18:45:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 42130B826FD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Jan 2023 18:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2EB3C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Jan 2023 18:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674153932;
 bh=nhIOjSTE/jYgQMeo/hUxUndXoFKxI6wJWKcPu5y9Wqc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BXJhT1XNRz40NKosE75aIfjkfVnnghCKjerYpCjFhJVl8Okyj0ytrSsrFuZPC2LvV
 3b/F+4CCKrMunq1Wy9fqfTvLw1+ZYIaFcHtj5vIaoA8evDCdGl+/gp03+Q9mHU+pxb
 sv5MwYL9E8RpDHdqOraHhxPl+gQZmU9ixSBvg/p3OvqGOM/Yv05ET6AYrT03sSfuNU
 49JRkn2tpNv4uEmuOO43RWHSSoSfdp50+oct86Xczm7cVYL7R+qKs+5RDWMIi2QI73
 LC5kyiTyPTNaBFWKFgxFM/L8gNLdZUIfAL/Jci+a3h1gAnIkhc2awr1RJ2geE7P8vP
 wKgUvaJEzYyzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D7CB4C43142; Thu, 19 Jan 2023 18:45:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 Jan 2023 18:45:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-1fLEQcnLiz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #131 from Jaegeuk Kim (jaegeuk@kernel.org) --- Re Comment #122, By any chance, 
 could you add a code to print "page->mapping->host->i_ino" if
 page->mapping->host
 exists, and the status of PageUptodate(page)? 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pIZut-0007k9-Hx
Subject: [f2fs-dev] [Bug 216050] f2fs_gc occupies 100% cpu
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

https://bugzilla.kernel.org/show_bug.cgi?id=216050

--- Comment #131 from Jaegeuk Kim (jaegeuk@kernel.org) ---
Re Comment #122,

By any chance, could you add a code to print "page->mapping->host->i_ino" if
page->mapping->host exists, and the status of PageUptodate(page)?

When GC tries to move the valid block, if the block was truncated and somehow
MM gives a stale page, we may hit a loop?

How about this to report the error to GC? GC will skip this migration and will
do it later or skip it, if the block was really truncated.

--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1325,18 +1325,14 @@ struct page *f2fs_get_lock_data_page(struct inode
*inode, pgoff_t index,
 {
        struct address_space *mapping = inode->i_mapping;
        struct page *page;
-repeat:
+
        page = f2fs_get_read_data_page(inode, index, 0, for_write, NULL);
        if (IS_ERR(page))
                return page;

        /* wait for read completion */
        lock_page(page);
-       if (unlikely(page->mapping != mapping)) {
-               f2fs_put_page(page, 1);
-               goto repeat;
-       }
-       if (unlikely(!PageUptodate(page))) {
+       if (unlikely(page->mapping != mapping || !PageUptodate(page))) {
                f2fs_put_page(page, 1);
                return ERR_PTR(-EIO);
        }

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
