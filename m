Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A135C512D58
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 09:52:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njywS-00059e-Qr; Thu, 28 Apr 2022 07:51:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njywR-00059Y-Qr
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 07:51:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1hUpc3aNU5pZ7UUkYzSPUD8xcN455VSwaNEFs1o/iog=; b=TpbTXAV+4has7ebP+KfYYA9+EE
 Gn92WDzBJzfIXkKK96/7giIVpL2wmBKyg4OdNhjIRZ5MQ1ypJyOPMb3FGV+dnvFjvX4onASSNp7O9
 MVEgyVlLAKF2fIQPJKh99Rb7mbJDNjSjHhPxRoO3S2yr6phb/ZgXTvhV4BZt3X8SzNes=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1hUpc3aNU5pZ7UUkYzSPUD8xcN455VSwaNEFs1o/iog=; b=XsSOCUmyH3YYIrCpRKb1ReM4rc
 uDuXCAx8uqUJVZZK035e5DPYzPhJteBgCL8PlJRctgEItWFgYsfEhoB/ET4zgnD6sQoszeHOtaEES
 5kDgsBAbfpdDFaldLsyJLmI+xFula8GEDrHIeydzHITm3zZPU6cFUheysraOQ219MvuM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njywO-0003O8-18
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 07:51:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 515B6B82B32
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 07:51:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24957C385A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 07:51:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651132303;
 bh=S7wQBec3sx+mu6xX4r0yXD3wXzdKU93aMdqIyxiC/xA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DjyVHYnYU0kPGXi73Z+xn61pY42/h/f9HV0sPmX4zh5Sktv+TMIMmgDZRrQ2C/ch+
 Fha4NXzu1MKH+iCu6Tf2j7uDUx2+JVRunqyyXmOXPP7j7dsNRtS76HltvCQZqKdQEj
 02mt28Q0cpz9QwYni9nLROADh8Eeoj1nBdvHWZeSEfdyBXz5QSKLfuoAw1l27yCCJY
 xRdwwzWk59+r8MIxNN1tezgEaEurytB8s7el6RiQ09hHOap2jK6J1jmB9ud6WQpG94
 BEeICQwdTepjorP8Eiwv9a+kE3bpH0sdg508U0UVur9aOTE4e77GiLsLTcTdPvUtCe
 Cm7PKhzhf5X9w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F4205C05FCE; Thu, 28 Apr 2022 07:51:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Apr 2022 07:51:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215894-202145-a60b7uARdE@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215894-202145@https.bugzilla.kernel.org/>
References: <bug-215894-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215894 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added CC| |chao@kernel.org 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njywO-0003O8-18
Subject: [f2fs-dev] [Bug 215894] kernel BUG at fs/f2fs/segment.c:2291!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215894

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chao@kernel.org

--- Comment #2 from Chao Yu (chao@kernel.org) ---
https://lore.kernel.org/linux-f2fs-devel/20220427095140.227316-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
