Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 652ED515B00
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Apr 2022 09:33:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkhbq-0003Sq-99; Sat, 30 Apr 2022 07:33:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkhbp-0003Sg-DJ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 07:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KZlebltp7IPKTHyru++V49CbGA800dWn4qwy2Tr7uEY=; b=HaZRYqfuANsc4r2scc/JAhJpDc
 19BniPcDkwo+kgot6Cw+wY2I9xY1gi0csXnZSddQZ5n8UKMLH6wAtR/hjHMBi/Ik9njI2LGjwmV4L
 TweDd5Eb3RhvrLeDNF/H6160EMINvaQGQ076pUV40OC4KaMvJfG93zWI+eCX8KMopMn8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KZlebltp7IPKTHyru++V49CbGA800dWn4qwy2Tr7uEY=; b=URYFs6jhMGlBCNTOP04SNyji/w
 2mxccBPpiWSrXo6J8PZ+8nlIeBW7UwSsG0T45Ilbny+IE28R+tcbYu2gukiJRBmZnB+Q2sqIBOQmo
 PajsGRFRxLTh4dopFSlSFVmGawGKJJCufL/YH6HRmRGk+S8iZi7FpH3E3pbaJ8Tz3BmQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkhbl-00EcHs-Gr
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 07:33:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A09B4B80FA3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 07:33:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54F28C385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 07:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651304002;
 bh=E6dYffhRa0OguWkvLbqnRHxu98UIkn490Q1RMY1Pa4I=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q0rO3VBf+ymVmFJNpI653nQG1pa2NBovI6ua9NRsqIBlr0RUKAUz6z4mKpj7/k3TK
 IkBrbVxxqD/bpPQxSs3GJnwzWqBZxzbegYpvc9vGI3aeb8kR168de6wxedqCLpRHFh
 e5NlXaHv/kMdR+cJp/pqZyOwOTA/dHbmiJBIN8xP9NYVxmHg5ixLfD+iWm/a24AdRe
 LmrlZUQecVyLxK6mjg/zVatnaVZQvirQFWL2KVdZjDzti2LFP8Sd//nCpYyeWwFbeX
 9JiXIELAI4kPL5gwAwk1vMOFzlJvLwMj90RDZuQFCnMKWkJ2Fa/iUxRcnbL00v5hur
 hZPIO8d1h+yBw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0DA76C05F98; Sat, 30 Apr 2022 07:33:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 07:33:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc resolution
Message-ID: <bug-215914-202145-6ygQEC3HZH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215914-202145@https.bugzilla.kernel.org/>
References: <bug-215914-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215914 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |RESOLVED CC|
 |chao@kernel.org Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkhbl-00EcHs-Gr
Subject: [f2fs-dev] [Bug 215914] kernel hangs after mounting the image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215914

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
                 CC|                            |chao@kernel.org
         Resolution|---                         |CODE_FIX

--- Comment #2 from Chao Yu (chao@kernel.org) ---
https://lore.kernel.org/linux-f2fs-devel/20220429204631.7241-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
