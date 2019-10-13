Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5415FD56CA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Oct 2019 18:19:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iJgan-0006xl-13; Sun, 13 Oct 2019 16:19:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=/New=YG=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1iJgal-0006xe-6z
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Oct 2019 16:19:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4RSuoLj5Dx40MZHHq8r03aQikg0sBXJ8TzVOV3drwXI=; b=A3w0lKUz1Wc49Ij8Pb8RQhOQBs
 zvOqlb+8MMzPq9vQyL9o9pIAgs3OeYNy4UhLYQsgL3f7k4VECq9h/imqv0bSIuw15EFchS5SOVtbL
 8iCfOxH9QxBaEtAT+v+tXwqb9EdDgclPOU9Xa9YNGHR61wWBlsTfH8RhI8u+86BhPOI4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4RSuoLj5Dx40MZHHq8r03aQikg0sBXJ8TzVOV3drwXI=; b=VMWgK+m0Y3AN1EnBEm/lKkg8gA
 OFQLqNkLi6pv0r6C55wbgGVKQ1dhORVWTIJoq99+F4/f5doYz4VlZ/l9breMibIdvooLY2SdzGT7Q
 KLlzHcJbaV2XzxbuoXn2vf650hmALaNYrTPdDBFJ5nNhrgMvc0aLZQeDZ/HaJAolrTPE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iJgah-00GtK4-CQ
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 13 Oct 2019 16:19:35 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 13 Oct 2019 16:19:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: rogan6710@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-205181-202145-3UOrhzLdRJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-205181-202145@https.bugzilla.kernel.org/>
References: <bug-205181-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iJgah-00GtK4-CQ
Subject: [f2fs-dev] [Bug 205181] kernel panic when accessing btrfs root
 device with f2fs in kernel
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

https://bugzilla.kernel.org/show_bug.cgi?id=205181

--- Comment #3 from Roger (rogan6710@gmail.com) ---
Thanks for the reply.
This is a real mess for Slackware since we use "huge" kernels with support
for nearly every file system as default installation kernels. This particular
flavour often remain as system default as it gets upgraded. This is how it was
discovered, when someone upgraded his server with a btrfs root fs and a "huge"
kernel.

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
