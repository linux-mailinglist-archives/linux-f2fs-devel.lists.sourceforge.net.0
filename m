Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE2119C3353
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Nov 2024 16:42:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tAA59-000672-1Z;
	Sun, 10 Nov 2024 15:42:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tAA58-00066w-0P
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Nov 2024 15:42:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j/+DidcH3oRFovT97jP013agDcW2C2gxfN7UeouZMo4=; b=h9S4LBsm7T32zB+l///i0Niael
 jaetVXBQ9X6gKh2+fyfkqI1L8ZpVJOvm0jkYmyNQ+X8uzpAL9CTzXH7/ViCgeu6TPUPbz4ItEjPPr
 moLRnltY0DnyIEKb3IF91cux1nwitHN5qu+MHK8HFsikConhXPctMZcRJgvI/GiSxFHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j/+DidcH3oRFovT97jP013agDcW2C2gxfN7UeouZMo4=; b=GC/lsSGNJusXSMKgnvPF531+cu
 U+hw/XQBp04L/lAVDoEX5hzhVaGuyvc9e21PR8tWwLUpy+CJIC2xh+afyrUMbiVC8kvjbzVODQYA2
 nVtXOMv6oqzBfWRcUO5gixlU1UcexPtvzWSMRnCE8W3+rtohbyplDllbbGzeYGEjjB0M=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tAA58-0001tS-4H for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Nov 2024 15:42:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 01F25A40DF2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Nov 2024 15:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20220C4CECD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Nov 2024 15:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731253344;
 bh=j/+DidcH3oRFovT97jP013agDcW2C2gxfN7UeouZMo4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jt82xENhzDQFZd/1PNP35iHOgQA/BptOYxJXuxf3g0eUBSMzJD23NYqFlNYOYkveo
 2/iGNtCJqxvnqYEnnVHQTk+vNxp4RkzGQPjiLhqLvmTwwk+T7nAk9EzQ/M9wi4KiVK
 k/9aHBDnce15r4/97KBR2xl8fS7r88J6QTirwpdy5pjeAm9FUEI0BJfXzJLs/5uBod
 I0GQf+aPmFSkUHhzHe1w/sax7dQkyT/PBzvUBzDQd6Qqy9M6/cIokvhy6SIy5K1B4I
 J864anjZLdNY7mvPbPAOC1yL2QPKvSDKDXXU2opkod0hqy+sNFENiMMWztPMeyth5W
 a/e+4RpcepifA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0C9DBC53BBF; Sun, 10 Nov 2024 15:42:24 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 10 Nov 2024 15:42:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: piergiorgio.sartor@nexgo.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219484-202145-pgqZYpKUBJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment
 #5 from piergiorgio.sartor@nexgo.de --- Thanks for the support. Difficult
 to check the patch, I'll have to see with this PC what can I do (not so free
 to use). Which kernel would be this 6.11.5/6/7? 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tAA58-0001tS-4H
Subject: [f2fs-dev] [Bug 219484] f2fs discard causes kernel NULL pointer
 dereferencing
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

https://bugzilla.kernel.org/show_bug.cgi?id=219484

--- Comment #5 from piergiorgio.sartor@nexgo.de ---
Thanks for the support.

Difficult to check the patch, I'll have to see with this PC what can I do (not
so free to use).
Which kernel would be this 6.11.5/6/7?

Any other way to test?
For example, using sysfs interface?
What about the difference with 6.9.12 (working) with this not working?

I cannot promise, but I'll have a look on patching.

Thanks again,

bye,

pg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
