Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C522DF76A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Dec 2020 02:19:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kr9qc-0007Xt-Kz; Mon, 21 Dec 2020 01:18:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1kr9qa-0007Xl-Tt
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Dec 2020 01:18:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=slNtMFxNBwlZqwJ2Iss0n16RGkKarOfTm+GqH3tnC7U=; b=Zzq6QmoZLhYjDmobGpKGWSBzN+
 LoJlGGPf8K0OEfUEQvbf1yLnDOOHV96PZ1a51vK9Ks3/3xKd2CgdzX7QrZRV8q+6lspwIgDzudaSu
 51nUCuNULmZQD8hxe3FX7DrNqj6AFaydcq1ZcKbbalxClJL3zCbJbWDqHUgVF4Qmhz2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=slNtMFxNBwlZqwJ2Iss0n16RGkKarOfTm+GqH3tnC7U=; b=Syi88tgtOhacm/YUlkCAOWETHX
 03Hfqa80Pal3n8Z/Uh43ODC5q6Wi3r0CJjy2UObrv8LNkPPNlTm5cDv9X9NIwXcsDjvoR5VWyEfI2
 nbnDbJAbtaQod37449as8pwkI9Ja82nGIHe17KrYyaW6+67gVhimculKq6f13tZsXURk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kr9qR-003G2E-MQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Dec 2020 01:18:48 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 21 Dec 2020 01:18:21 +0000
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
Message-ID: <bug-210795-202145-qeOfe8HDG4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-210795-202145@https.bugzilla.kernel.org/>
References: <bug-210795-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kr9qR-003G2E-MQ
Subject: [f2fs-dev] [Bug 210795] fsck.f2fs - 1.14.0 - error when not
 /dev/vgXX/lvYYY path provided - [ASSERT] (init_sb_info:1017) !strcmp((char
 *)sb->devs[i].path, (char *)c.devices[i].path)
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

https://bugzilla.kernel.org/show_bug.cgi?id=210795

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
> Info: Device[0] : /dev/vgftp1a/VIRTUALa blkaddr = 0--13fffff
> Info: [/dev/vgftp1b/VIRTUALb] Disk Model: SanDisk SDSSDXPS
> Info: Device[1] : /dev/vgftp1b/VIRTUALb blkaddr = 1400000--27fffff

You can see that in f2fs superblock, we record original paths of multipath
instead of paths symlinks point to, when you use fsck.f2fs /dev/xxx to check
multiple devices of f2fs image, fsck can only compare paths stored in
superblock with parameters we passed, otherwise it will trigger ASSERT warning.

So we can only use

fsck.f2fs  --dry-run /dev/vgftp1a/VIRTUALa

to check f2fs image, rather than using

fsck.f2fs  --dry-run /dev/dm-15

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
