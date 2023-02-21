Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD8C69DE51
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Feb 2023 11:58:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pUQLt-00081F-3I;
	Tue, 21 Feb 2023 10:58:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pUQLe-0007zE-CF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 10:58:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d3oE2AiGLxDPRijKxlhT+iQvhgNBGLskwFIT7rwQxJ8=; b=Yn+xjNwOJdJCVgtQcotUw1Oz2T
 +dBmTKA+Dg2NIPzzG5EWZO8HYwf5egSIeoCzjQwJtwvZNfBG9bCbmw4T7gp0/OULb1GAPCcZfNKY6
 JqJHQYg+JV9eEZ5x/R9mq2aTUaCVWxzRjKyq1uIvBkk5L4vWJej+bJrbHwtOQc3e8ShM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d3oE2AiGLxDPRijKxlhT+iQvhgNBGLskwFIT7rwQxJ8=; b=jMpQ5J0Sa33e/ZrWy4UUEcceIh
 tZcGtoIAoCRnPs1qHWjgQvjP+BixjaNTlIHrCm4mnGE54dmoAS8UAOch5CyGEBygQBdz/cPHEHROy
 6LrlmAmFQPKEU+ZMOZxqukVdgZfoOvUz1qynfDroCG+9qd/X5bc/9U/BBPr9TuZdWMe0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pUQLd-00CBoR-2e for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Feb 2023 10:58:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 15CC360F80
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 10:58:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7806AC433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 21 Feb 2023 10:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1676977085;
 bh=d3oE2AiGLxDPRijKxlhT+iQvhgNBGLskwFIT7rwQxJ8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gNj8sCeF+SUJyNJUN9Q8GwDU0gOrY00ctKhYcMRFG1WQI2Ifpwp8n500CBv/OXbhz
 KvTw0nrvbswtOHf0aQvwDh3w8qW4JL+6jSuBDNSVMPHIgVHmba4nmY2ICla8SKZoVE
 Hy8lWtKE5vYutcfuoN7M/lmO4uBqutMuDRKOlaIsbApQ431Zi7aB3FGYRzXYvKEu0V
 8p5kRzMvRtrahb0fwvvVLzDOA2Sc3PlSEMwBH8Z54+fT1uxULAf6OsVlPYY0+GKVxd
 AehHCCit6U59g3JZP6L78YBhzShjlQSVJ0KRH6qPJFgATe5kOcQmDmu1dzjid2k5lT
 UJw94btvIobFw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5A866C43142; Tue, 21 Feb 2023 10:58:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 Feb 2023 10:58:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: bogdan.nicolae@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-EsKjYIHLyy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #134 from bogdan.nicolae@gmail.com --- Well lines got shifted a bit. It's
 now #1336 instead of #1325. -- You may reply to this email to add a comment.
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pUQLd-00CBoR-2e
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

--- Comment #134 from bogdan.nicolae@gmail.com ---
Well lines got shifted a bit. It's now #1336 instead of #1325.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
