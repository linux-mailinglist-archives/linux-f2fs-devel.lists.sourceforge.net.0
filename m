Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2418CD353
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 15:14:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sA8GV-00087n-NV;
	Thu, 23 May 2024 13:13:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1sA8GU-00087Z-Af
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eY7p5u7v/ESs9DtIT4JeRYYDXvsmg0OFzJCzl/DbG3s=; b=jhoe3i1XTWxa2goYQHsABPnNHo
 CNPeqNID9kb4quusnRWWJU3WO9bG23Pnh+XHHMFADekY+u6lc1nFhSJME7Kq3mVoNb98TYrhX58RG
 M0FodhDE1JOdFO0EiZJmYY5wP09UKIseSlezeGjnPD572IF14SxpSpS/BsBEERaVy9bs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eY7p5u7v/ESs9DtIT4JeRYYDXvsmg0OFzJCzl/DbG3s=; b=VNTlfESfFGGuJG4Z137Y2df7RN
 +pGMUSASpi5nFwsio3irIyVPd1g/ror89g+1ATdP5t2w1R44yzcuA6f9C9mUaKnKR2HXi3BovgbCG
 VDK8Uh8IWefyphHBtWitIkpEzqjHIsm9OgiBVBOGIrTAg+gUqnih9KUz1kyy6KTK983A=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sA8GU-0001yF-Ks for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 13:13:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id C6D7FCE1732
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 13:13:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B6A89C3277B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 13:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716470015;
 bh=CSMlFjZZ0dZXjeFiMLUyrHKcNMrT8pY3VfywTNoY9u0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ctHiRFaRoCF0C3naR3911GpSRpFH2tBQNxPDupwHyOMMBHog0tXZr60yR18A8SAlC
 iTF9sBpjMOJvtl4Ncrvy2+CyJyxxITZLg2fvb1TF9wYPZZdCe3snlN7lkInFxrus4g
 uOk5H0zSNSIzSCl4CpUHp/ImQ6O2ToMQV92/19JFNt9N0ylxvrsqDf0hbcdhZSuyuW
 57hMSrjjMj6DcWiRz7TLMLekcktzeZIGv5Cx1DQ+6SwmbrbA9K69wyZ7i/MNUji5Tm
 3m0eCv1C1YQPPeWcgBxO7p3BInJhhuIRiH9uKeRz0OARKBbkW8Ve1rnl1PHWm9LWP3
 gcq59Be+TTSiw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A4377C53B7F; Thu, 23 May 2024 13:13:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 May 2024 13:13:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmw.gover@yahoo.co.uk
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218870-202145-voB1yIJkJ6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218870-202145@https.bugzilla.kernel.org/>
References: <bug-218870-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218870 Paul Gover
 (pmw.gover@yahoo.co.uk) changed: What |Removed |Added CC|
 |pmw.gover@yahoo.co.uk
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sA8GU-0001yF-Ks
Subject: [f2fs-dev] [Bug 218870] F2FS mount/unmount results in
 invalid_blkaddr
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

https://bugzilla.kernel.org/show_bug.cgi?id=218870

Paul Gover (pmw.gover@yahoo.co.uk) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmw.gover@yahoo.co.uk

--- Comment #2 from Paul Gover (pmw.gover@yahoo.co.uk) ---
I can confirm the problem on my Gentoo system with a custom kernel.
As above, with the 6.8.9 kernel , no problems, but with the 6.9.1 kernel (same
configuration apart from a couple of new items resulting from "make oldconfig")
I get the invalid_blkaddr message and a full fsck.  That full fsck fails to fix
the problem, so the long boot occurs on all subsequent boots.

In my case I'm running "fsck.f2fs -f /dev/nvme0n1p3" from a shell script in my
home-rolled initramfs, using sys-fs/f2fs-tools-1.16.0-r1.

I'll put my log in an attachment.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
