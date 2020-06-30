Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C04520F6BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2020 16:09:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqGwU-0005yh-4s; Tue, 30 Jun 2020 14:08:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=NpI4=AL=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1jqGwS-0005yR-Ij
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 14:08:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9xypL324OQN9wPCDzwOztngLE9V7tOc99oCFoSeI5uo=; b=Jt4kZcb9OfC+JAJSQ31+ZugvbH
 GewcRr717QU3CEJVJFFEa8yR7yC6PjzwdW045BzjeJCA29AastJGYgeH5WjsSwM+NObg7FhyGX/LE
 2VSxyiqp/O9AXeCa199K54N4mMIF1XjLc4ANrCYE842IwFMUW5bzzneQr9wRG6W7cpT8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9xypL324OQN9wPCDzwOztngLE9V7tOc99oCFoSeI5uo=; b=BhcOpr7VHwnRMdrmZD1mUD/K2J
 xWAm1dz4X4uUuyokERdnhkJPe8xzL6j3B2ka2XlBgJ25SDjTsAWmIakc04n8dd3HJbojcFUhqeE/P
 Go3yGSvwzi/cokXL5a1H1RoDZKF21yJOQpOPXmks0IqF7/KERwre9TwKUKEpKm+Rp6cg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqGwR-007Srk-Bf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 30 Jun 2020 14:08:56 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 30 Jun 2020 14:08:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208325-202145-t9Slikzq2V@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208325-202145@https.bugzilla.kernel.org/>
References: <bug-208325-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqGwR-007Srk-Bf
Subject: [f2fs-dev] [Bug 208325] f2fs inconsistent node block
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

https://bugzilla.kernel.org/show_bug.cgi?id=208325

--- Comment #3 from Chao Yu (chao@kernel.org) ---
(In reply to zKqri0 from comment #2)
> Mount options are "/dev/sda2 on / type f2fs
> (rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,
> inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,
> mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix)".

It looks it's default mount options.

Did you use any special mkfs options? like -O [feature_name]?

> 
> I patched my laptop's kernel with those patches but I don't see anything in
> "trace_pipe" while I'm getting invalid argument errors. Also I noticed that
> the "nid" and "node_footer" are the same always in the error so its only one
> node block that's messed up. 
> 
> Maybe a raw copy of that node block will help find what caused it ?

Yes, please, I can parse it with dentry_block, inode or dnode structure to see
what it looks like, and what kind of fields are corrupted.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
