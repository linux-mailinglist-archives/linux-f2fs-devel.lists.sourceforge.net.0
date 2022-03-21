Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31D734E2C28
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Mar 2022 16:26:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nWJvS-0001kC-Gk; Mon, 21 Mar 2022 15:26:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nWJvR-0001k6-7g
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 15:26:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ph7auDOYSUbpYj+RETJ3Qpe4VEeFsWL3gnq+KX2KjeA=; b=ErBcGcoxxlru5ckaboSWWTYvNw
 hJBtDMZJ3k9Ox9+6eCmVL2duhil5E/GxjyWwiLaCmnSfajDUVCvjsoykcgvMSG7aL3bYDkagUHbvV
 0GKqZ0CwWbzN527U+krEsltMa+nVnckWyUu+YJ/gkT9ebWdQj8K5TUOieTinEeuxqeTw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ph7auDOYSUbpYj+RETJ3Qpe4VEeFsWL3gnq+KX2KjeA=; b=CVNrdM5tBMMT6k+z+Kvon0ZjUc
 BONk1r8J32A0Zn8f6ir0Ng3cbfhvHztLDIXAaYoRYzGCF81WQ+leQlJAdrIpgXYsarOdWstLjIbQm
 Q0HzCDCo9mup9T0afVEuIwcYF999GtOPe/ynOM9CY/7cEq9YnWJZHzc2lMLBvD8pyFEM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nWJvL-00014p-GG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Mar 2022 15:26:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62C25B817C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Mar 2022 15:26:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2554EC340F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Mar 2022 15:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647876375;
 bh=tHSN8HGoggMH625OF9vERCS7bJ7SW1gkiPJRELGmwWw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ouIQTvSCReX2fQvEmsJkTyw+hIFe94SnxkDc2dwvcxudFBYhbDowjT1vcVc4If8kb
 npN9acf/juernvqbbPUwKq7XthQ6OZCXn8MosmnQ/KBV9pmNNxz+0FtVb11jqk/ifh
 WHKxSqS9t0imoYtsdkbMU6uGjExa/4xzKwRFh1GLLa1BYm7Go6qxkWqmaSqJQHkd9R
 5e7A8/Dh6X+gL3K/FqOXEeMINdUDCokLkLsYTWIJVUsglZsg40uxoGD8CrhgENmWFB
 XsDd3yoHJicfFn+CJO8xsHq/HXJ4kS0mj61k0N3xN9WetYt2/hX0SS+0zsOAV6Ptjq
 PNe5UzKFlIsbQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 07D1AC05F98; Mon, 21 Mar 2022 15:26:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 21 Mar 2022 15:26:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-215709-202145-Ch3JrbW3ZW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215709-202145@https.bugzilla.kernel.org/>
References: <bug-215709-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215709 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nWJvL-00014p-GG
Subject: [f2fs-dev] [Bug 215709] kernel deadlocks while mounting the image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215709

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Hi, thanks for the report.

I've figured out a patch to fix this, could you please verify with it?

https://lore.kernel.org/linux-f2fs-devel/20220321152211.5656-1-chao@kernel.org/T/#u

Thanks,

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
