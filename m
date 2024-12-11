Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67B859EBFCD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 01:08:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLAHP-0001Mt-Sf;
	Wed, 11 Dec 2024 00:08:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tLAHN-0001MW-Ol
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 00:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ahj7oLcZR5oSlIOYvYkVlHmMkc1BWtQZgb7CuL32mB0=; b=UzFBVCuvUE5X2KBbsTu/qaVDsN
 JF7fBOINclf7aNlqnTQeHxatPNz1zXdnVcoaR6+u1mwBrLTS1z9xH10tr+EflLE+rLYIgeyhacIPb
 DOq/eV5ZsZADJWZv1wrLdIoFKqDDWBVGjZ02hnvkREV/3tZW6JJgtPSoAqBoG0eBep3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ahj7oLcZR5oSlIOYvYkVlHmMkc1BWtQZgb7CuL32mB0=; b=MOSKVAuowQgFJsgBUFTVsMVQo3
 HtNzuMewtVMsibUfQz2RxTrnNaGV3o69zCaBaLG6dTApxc2ad+GiV3l3daeA7PQaUOMegADHK+4Bv
 lrbE8FHXmcRBUnywVRGvDZV443XuMjZa/b9MJCIE8T1zePvK5KnPiLJGjRSYjzlnmt64=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLAHL-0001DW-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 00:08:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 19F1F5C617A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Dec 2024 00:07:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4970DC4CED6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Dec 2024 00:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733875705;
 bh=ahj7oLcZR5oSlIOYvYkVlHmMkc1BWtQZgb7CuL32mB0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Kax+oyz1V/8841G8C61lCEWWjOL5JDrpxTavPHT6qfE0rlm1n66357K/hkaz1suym
 WnoNJ7srgHn4WKT6l22sf0kiZu+1BpPC/5Yhv7uSPQSIoXlem36VPWYvQJ8yCctFOS
 b4NfLwXHI+rv0FTzC0LPCMOb8cZKlGXio1siUU9gL4Rlp1nt8rprZiiDEfa5B9FfXA
 7cv5zd8ynvWukpRZXqJ3ekv2DQXvumrnLGZWRduLPBp3pImtSVig129zhMWz7TfXKY
 26NV0ePebvE+S1CFwdROJWCvfsCRrZlWTDBI46zh5tjpoHE0IHjBTlMQi/AjGHWqRA
 oU3ogbjfpkS7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 36F1CC3279F; Wed, 11 Dec 2024 00:08:25 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 11 Dec 2024 00:08:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219586-202145-glXUgzdXwR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219586-202145@https.bugzilla.kernel.org/>
References: <bug-219586-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219586 ---
 Comment
 #1 from Jaegeuk Kim (jaegeuk@kernel.org) --- Hi, I think that unicode patch
 introduced a regression, as old and new paths gives a different file length.
 Wasn't that broken to fix? 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLAHL-0001DW-UJ
Subject: [f2fs-dev] [Bug 219586] Unable to find file after unicode change
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

https://bugzilla.kernel.org/show_bug.cgi?id=219586

--- Comment #1 from Jaegeuk Kim (jaegeuk@kernel.org) ---
Hi,

I think that unicode patch introduced a regression, as old and new paths gives
a different file length. Wasn't that broken to fix?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
