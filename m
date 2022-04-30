Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 433EB515C51
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Apr 2022 12:37:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkkTl-0000MK-9L; Sat, 30 Apr 2022 10:37:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkkTk-0000ME-9m
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 10:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jr5XyYJ8JyS7ELfLAAX8stmaEIcY767o6m1DiNKxQFk=; b=iBsinnD85iVA9wxhEeLm1irMDt
 iW69CBgViPLciJqZ+E5zMskCZdErXVcmHVchsgHxhOA3fAUJrSGY+VcHlDSVS46DO8UXdFPYeBoH1
 OiZj/ga4XKi1lyViwG2aLIWVsqAhewlDj6ZGt9bVE/HvDBkGEpAgWXHrB/6q9MhdxdLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jr5XyYJ8JyS7ELfLAAX8stmaEIcY767o6m1DiNKxQFk=; b=ICJKWvkDuTzGXjlWlTdOTC9Vmb
 cvZ++VWXUmlmeCxpKqDrCCljAQq7p35KCyb+a8WikkfHfpHxh16S4OpBvD8SNEXzostoNbrIteZr8
 pmbmOSUk02129TueANFlEvsXiA2weyIIbIFxEu8z70j5xA4k7LvIeIbzV3faZH5DYWDw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkkTf-0002gf-0f
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 10:37:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D051160F71
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 10:37:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 410FCC385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 10:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651315036;
 bh=jr5XyYJ8JyS7ELfLAAX8stmaEIcY767o6m1DiNKxQFk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HuypOtq12Ij+Ra/cF/XqZdEMpHZcLHc5MOjfgW6jY+ada5L6aWtgHatofZksriut1
 XWQFT9MTu6BIARI+5gM4CrYYklzzHoLCB5lJcpDlHnHJU8AijV5P6igLNDOtDt6VLX
 5x31c7hszYClrNfNljVUfGlftHaPmysAvLyHDbe2TAIgCv1IXA7cpjbqrFlhftrHLF
 5v6CrvkGYPrl7BBruzArwV/l+VQJuIwrnKrLwwt4w+pNy0KL347gN+hI4+XoFkWn53
 qty7V09ABsoQfac+beHDE7GzzoLXsrwIYyWaXty8IzizL3e8l99USGMWtc/6PT5aNY
 lS0wDXi4FiPug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1F809C05F98; Sat, 30 Apr 2022 10:37:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 10:37:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215904-202145-1dxh9J9uNY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215904-202145@https.bugzilla.kernel.org/>
References: <bug-215904-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215904 ---
 Comment
 #2 from bughunter (yanming@tju.edu.cn) --- Yes, you're right! This bug is
 caused by the same reason as the previous one. -- You may reply to this email
 to add a comment. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkkTf-0002gf-0f
Subject: [f2fs-dev] [Bug 215904] kernel BUG at fs/f2fs/inode.c:825!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215904

--- Comment #2 from bughunter (yanming@tju.edu.cn) ---
Yes, you're right! This bug is caused by the same reason as the previous one.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
