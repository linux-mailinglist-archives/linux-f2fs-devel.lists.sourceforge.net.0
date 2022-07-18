Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 577105779AF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Jul 2022 05:02:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oDH1R-00019C-Ig; Mon, 18 Jul 2022 03:02:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oDH1P-000195-RQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Jul 2022 03:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=robGwztjHk/zo47Vuq496CNHQkP3dSzP3h5zWSRplpw=; b=Kc1akxmaN3XF7TVDfbtGhPTNKd
 5VzYjusyWQMD7TehLpQvqEG4EMxnGSvpBF2CZP2tsTaHiBVaT36Y/w+gPvm6o6V//dADQr5MCuApZ
 K/6lt+2lMLNulDw0PKEmlukKNWYI5iqqJaoYer2awEFLzbq0c1qTjzQWAZg1WU3nh8XU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=robGwztjHk/zo47Vuq496CNHQkP3dSzP3h5zWSRplpw=; b=R0Ci2OWld+5FvBxjrqjF0EajjY
 mDGrpwcsrrTkw7RYCvGj6KgbTYqdgMX7GzRzgqEFMeCq+fb3pM5h07wfoJilmtNk4wdTyJKKfaGZm
 dUM+P4WoTYBL+sHb3Li35tHXu1HPoK56itKubKhKv3rHVyhqQcgidxz7w/k5QfeDGp6c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oDH1L-0000BO-1z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Jul 2022 03:02:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB82CB80EB9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Jul 2022 03:01:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FB51C341C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 18 Jul 2022 03:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658113314;
 bh=robGwztjHk/zo47Vuq496CNHQkP3dSzP3h5zWSRplpw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=clhhabWY+4QQ5PMD5X0ZfTQa7UZV7jIL4yvaryiz1lFTm2JLDCJ1mFrVlNQyAP5vA
 tTqA4e2TPDXu7IKaq8kxvGkodrYDjUGMEDJzWVgIRPPu88UdlT2NHOka9uExNh4f4P
 O8cRRobMjU2zOnTpl3jQyM4jqgwg5A0Ow7pOOSZXxWBMKUEmi7ori2zqNbyBYSuXIY
 t5c0pFWCCAYfE4RQkCWI2IZ58qK0huPorL8zh3e7yljw/Dr68aYCl1ViCeT834F/75
 ljrGmfB01dfjykIrJa3fZjGJG3uylqy2/dCc1NEEcfSXcYoI5gVo9hGm7dpOERf/aK
 Xa16azWhTCDzg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 87D86CC13B0; Mon, 18 Jul 2022 03:01:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 18 Jul 2022 03:01:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216162-202145-q01BQXHDaN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216162-202145@https.bugzilla.kernel.org/>
References: <bug-216162-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216162 ---
 Comment
 #11 from Chao Yu (chao@kernel.org) --- Please switch to dev-test/dev branch,
 due to fixing patch has not been committed to master branch now... 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oDH1L-0000BO-1z
Subject: [f2fs-dev] [Bug 216162] F2FS filesystem with compression broken
 after kernel version 5.18.1
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

https://bugzilla.kernel.org/show_bug.cgi?id=216162

--- Comment #11 from Chao Yu (chao@kernel.org) ---
Please switch to dev-test/dev branch, due to fixing patch has not been
committed to master branch now...

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/log/?h=dev-test

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
