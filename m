Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A194610648
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 01:16:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooC75-0000y3-1d;
	Thu, 27 Oct 2022 23:16:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1ooC72-0000xr-VC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 23:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4Znt8VmKM4vA0HmBUcKk5zGXkOfo/E1Y7xCIsoVDfEs=; b=SYAhHAwr3Gto4I2CuEEbZODlGk
 SRX77TPBZ7Qye9RvMyd3PISSkDF8AEIT4HBkd+IgtzVmPy+6F6YNOXCTU55+c2NA0HsSE3HB3r5U+
 U+BdO/NSUEUagOCKJj82FKtALVOVOqpGhbAUYxf/Tt78SP2vuP6g7Oybu/s2sAz24udE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4Znt8VmKM4vA0HmBUcKk5zGXkOfo/E1Y7xCIsoVDfEs=; b=KW1qBkz7pRXLRGZu7WMy1XoX9h
 0VnWVE+F9cAHKW9eyUKTqEMxptZtnSIKTcaSozb8y1sH+NmYUCznk8k95YZbb+j/aQXJgKcki8bbz
 pLu7I0RvLPcQfSr8QNt/3QnK2WizYZ8GVOpE1xttGAMGKX/IJDYpNxfyalJlMPHtVbxA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooC70-0008TD-9v for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 23:16:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 67568B8280A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Oct 2022 23:16:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23CD0C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Oct 2022 23:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666912585;
 bh=4Znt8VmKM4vA0HmBUcKk5zGXkOfo/E1Y7xCIsoVDfEs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IB+MvUp9AwTKNuiAiUx8Txzbgii48PONGCauHitluSN0yP5n1TDLJwYBy6Y+egxA2
 XMOSRg33tQvw7IgNTlKwRtrCjzju+KruF4sYFBABV5NBQh+386eAOOhF5HmUVh+GNO
 EVuQTSb9yD1nY/EW5YIohQbT+UKdwDL1vn+ufRawUkydc26F0DUuD91OKZRqlcXm5A
 6Kt7D0nCUX2q/dLE3mdqXL0DYyejf7u24GJMtYh0R2VBZnWS5x+9QQTOp2PnvF0GQT
 hw71uUFeH8bg7IQggTSbbrEwNJfBRikHIToSBqp4Qx1ox/zAcyMkqg4tlvgE8H3ZOd
 +5gJQ/aF474Xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 02224C433E4; Thu, 27 Oct 2022 23:16:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 27 Oct 2022 23:16:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rootkit85@yahoo.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-RI0xRo9RpM@https.bugzilla.kernel.org/>
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
 #69 from Matteo Croce (rootkit85@yahoo.it) --- That's a terrible workaround.
 Does it impact the SSD wear leveling algoritmh? Can a periodic fstrim mitigate
 this? Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ooC70-0008TD-9v
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

--- Comment #69 from Matteo Croce (rootkit85@yahoo.it) ---
That's a terrible workaround.

Does it impact the SSD wear leveling algoritmh?
Can a periodic fstrim mitigate this?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
