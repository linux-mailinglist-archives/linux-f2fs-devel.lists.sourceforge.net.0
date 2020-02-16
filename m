Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02D2A1605B2
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Feb 2020 20:14:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3PN4-0005ng-NB; Sun, 16 Feb 2020 19:14:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=RaUl=4E=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1j3PN3-0005nZ-3R
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Feb 2020 19:14:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GcNyMDo4ytPz4ZUyhTPe1Si/WA5TwzS2zADjDyoAFRY=; b=JhEtCnDMmc7TN5wsDahVIIn8tN
 W6kSZ9WgKKukRD4PeWLS7nzMoyOv48rem0omh+hbY/aGXFdSBMi0Lw+Uv3VzBQQi0vvJs1Z8Evys8
 CaPXMNhtSdUZxUcel5IQ3hHs6X8/ooYdG2q1XBGZYTDPLN/uzncbmT0kLmAE57ezL4so=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GcNyMDo4ytPz4ZUyhTPe1Si/WA5TwzS2zADjDyoAFRY=; b=b
 1PaB9vYqsOcqjrfSf+KniQgI7/WJl+vsT6ytG4CNxSX6ihDAioQ6JsjKqYvgv30Rm97Mh+++gdOrg
 jok9KgVWVlEnoSk2lcPwRzWfKRBAULLyAnqcW82Vb+/2/iSsIUvqkjfflze8T8GDvdg1SE53lvg9X
 qnpvDHWDYQtFa+b4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3PN1-005WI3-Hi
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Feb 2020 19:14:25 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 16 Feb 2020 19:14:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan@konink.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression attachments.created
Message-ID: <bug-206551-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: konink.de]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3PN1-005WI3-Hi
Subject: [f2fs-dev] [Bug 206551] New: Failed to initialize F2FS segment
 manager (-117)
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

https://bugzilla.kernel.org/show_bug.cgi?id=206551

            Bug ID: 206551
           Summary: Failed to initialize F2FS segment manager (-117)
           Product: File System
           Version: 2.5
    Kernel Version: 5.5.3-gentoo
          Hardware: x86-64
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: stefan@konink.de
        Regression: No

Created attachment 287423
  --> https://bugzilla.kernel.org/attachment.cgi?id=287423&action=edit
Linux boot, root fs can't be mounted.

I am aware this bug report is done on a non-vanilla Gentoo based kernel, but
since I have seen it now twice in two days on two different kernel versions
5.4.13-gentoo and 5.5.3-gentoo I would like to document it upstream as well.
Not excluding a hardware failure.

I am running Linux on a Lenovo E485 machine having a AMD Ryzen 5 2500U
processor, which is quite problematic to resume after a memory suspend.
Therefore I use hibernation to a swap partition which most of the time allows
me to resume what I was working on. The disk is a Samsung SSD 840 EVO 500GB,
EXT0CB6Q. It wasn't used for quite a while but is now in use for about two
months without issues.

The day before yesterday I again hibernated my machine which kernel paniced
after resuming, the screen was still black, so I wouldn't have any information
on the topic. After restarting, my problems with F2FS, the filesystem for my
root partition, started.

I was able to boot using an Arch Linux ISO, and ran the F2FS-tools. fsck.f2fs
was unable to succeed when I requested to write "missing" files in ./lostfound.
Only when answering "No" the partition was repaired and could be mounted. I
remember that one of the causes flags was something like "Sudden loss of
power".

Today I have completely shutdown my machine using "poweroff". When I switched
the machine back on I had a similar experience as two days ago, my root
partition would mound with the same segment manager error. I again ran the
fsck.f2fs, this time not being prompted for missing files. Neither did it
mention anything similar like loss of power.

I wonder if the partition is fixed using the fsck.f2fs tool, considering the
output. If not, is this a gap in the implementation? Should this partition be
completely be copied, and then restored on a new f2fs partition? Or is it
expected that the file structure is "OK" after running the tool, and the fact
that two days in a row this happened was a coincidence?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
