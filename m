Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA8A596D1B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Aug 2022 12:56:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oOGjB-0000Ce-2Y;
	Wed, 17 Aug 2022 10:56:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oOGj9-0000CP-UF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Aug 2022 10:56:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DJR3SuiPzd2IWnk9VN5sKzvxTOCGeaJdgfxHJBO0kdw=; b=VFiao9l6fzXft78yYVWU9GXpZH
 Hhw+HqQ0YZG3wKzzJn60k2SmAbKdBw3vc74s+7uGrYZK3fN1r04RXVtUPNp7Bm5cWDaQBpX620dvw
 Spjrgg5dSwtQj4C/XDRHUOwOgOLZqxJ1j0BdR0P3A5XF2N8+C9/g9ryGt3E/v3kiTCXs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DJR3SuiPzd2IWnk9VN5sKzvxTOCGeaJdgfxHJBO0kdw=; b=aKZlpjsOWlEZEcVMeQPSi+OYO8
 aUcYldEynpYUfTjfd1+Y142/BDf72aE4CgO+58+m9AC+YaVLtKxZvXHASY4O3vdEorAJXcWwRd7N/
 ZfLkJSBO/Bgy6+Dp3pcXgR+Sak5FSx1rlTlDuMSpVUyhRSGlLVfPvTS4a4457yCnC7Wk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oOGj9-005qEL-5x for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Aug 2022 10:56:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E79D8B81CCF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Aug 2022 10:56:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AFF58C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Aug 2022 10:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1660733799;
 bh=DJR3SuiPzd2IWnk9VN5sKzvxTOCGeaJdgfxHJBO0kdw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LXu2NPYnpQt4FajYpb+z6w+eHFtGIYp5p3clMI2fg2MEyBxn/ZCpREd6ZbBcuTRw+
 JMb+lUqgYNkeskz6qbSiWFUmnnLo+9QCcGwvhuke+hO4ZyFsY5foirjyfA/7Q9CY/I
 qapI8442U14G6m5chcg4Q4+fA/vnuk50j4NDdBYFgfVKIMIIbVjGiBZlrZrkn7ArD3
 B//MVIYs8Cg5IxgzNqVJsquCOnbpNJ4D9hYmrklGIJ6mFaqPyNHZT9k3WRK0ple8eJ
 hOGjVjfh526JdXxlDPsbWAKKh6Jd6Ai/SMwQElhXrGhPGbU0yeUAv5130HbXrLlCwL
 yGP4iLBE1EuNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76C47C433E4; Wed, 17 Aug 2022 10:56:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 17 Aug 2022 10:56:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bbutscheidt@yahoo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-jtcJc7IgNM@https.bugzilla.kernel.org/>
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
 #53 from bernd_b (bbutscheidt@yahoo.de) --- I'll patch kernel 4.19.1 with
 debug patch v2 and see if I'll get new debug info. So far, the safest for
 me is to run my system with kernel < 4.18.x 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oOGj9-005qEL-5x
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

--- Comment #53 from bernd_b (bbutscheidt@yahoo.de) ---
I'll patch kernel 4.19.1 with debug patch v2 and see if I'll get new debug
info.

So far, the safest for me is to run my system with kernel < 4.18.x

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
