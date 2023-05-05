Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 114B56F8938
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 May 2023 21:00:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pv0fa-0005Rx-F4;
	Fri, 05 May 2023 19:00:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pv0fZ-0005Rq-EZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 19:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qrgm1RkDKIvxY6oS/ZA8nn8eqWtqaBTHlzwmQg2zG6k=; b=PKwJrY4SS0w+IQyjlCZrjF0eN3
 1mvRSAlQGKfeIWAzqAhjgc4QkkyGbLCv3sIS0SK9vcLelc1egljGBQrHPMrsbeAfbYHHBGe6R87A8
 Z8bPXOJ0wY6b5XuUzNo/cEynIYIoPs9e69Oi/M5M7j/MKnYi3riBi/vEux+POJy16eRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qrgm1RkDKIvxY6oS/ZA8nn8eqWtqaBTHlzwmQg2zG6k=; b=kmY4M4Z3xFFb99+eLnvrcMK7n/
 fWSiVFFtDgm3cx2i2myCFQRNJCbY0IdughNATRzTYEI/XtuNVVJUFgrIOKYbWmam1GzAWde52PO4n
 rm2Tyrx5q5PalSgfHsMUBXuu5I8zYj8XP/oi7YibiXWe/FLpd7CH5S1JPXJnT+s94ESc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pv0fY-0006fL-GT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 May 2023 19:00:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 21236614E6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 19:00:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FD5AC433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 May 2023 19:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683313230;
 bh=qrgm1RkDKIvxY6oS/ZA8nn8eqWtqaBTHlzwmQg2zG6k=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IwbgzCeOL9GadFi5QjNj7si1hav4eBYDKiqmDZjzcNMg35/jCkzV/cDCGWR9KP64v
 XRLe3ieoxC+SnQQvo2mDLB3i0mdprfabHUjzlQRCpu7tKXaT7WoUnf/ffqCCQapLUG
 733IIQfO2F9USOOlmhGUpJEzqlje+PtzDK61ncXAqwCDW8vbhDd6v6E9q9gGRdcHXd
 5/cUDsR/Jel4T+Tx6p8+jX/XT4mYoYymwFb+/Ds6XTrRUlqrwa1tD+Zc6bYERqjT5p
 iKZ7SHYWhoZIKRmKzRdEKwQ3rYtG61KvbjulHDftMiNrUvwxu2H9PM1HQFwR6isabA
 whDefmbJD2Bmg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 556B2C43142; Fri,  5 May 2023 19:00:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 05 May 2023 19:00:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-tH1tfs0VBc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #165 from Guido (guido.iodice@gmail.com) --- Thank you, for now I'm trying
 linux-next-git 20230504.r0.g145e5cddfe8b-1 from AUR, it should have the patch
 already applied. 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pv0fY-0006fL-GT
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

--- Comment #165 from Guido (guido.iodice@gmail.com) ---
Thank you, for now I'm trying linux-next-git 20230504.r0.g145e5cddfe8b-1 from
AUR, it should have the patch already applied.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
