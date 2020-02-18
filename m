Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F449162172
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2020 08:19:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3xAG-0008Sx-F3; Tue, 18 Feb 2020 07:19:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=z2qo=4G=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1j3xAE-0008So-Vo
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 07:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cDaavKLafchoKGGlPD9YY8j/Eko5IuVzuyjWrJVPPhM=; b=DmUqBAhySHuavrKLOLukF3NdUF
 dNkOuedg31G5aBiACezUPH/QAmBMEy0rcFer7ITyD3WV7fF3qPQFiN3vtHBQEsJomUkX+clBJjE7s
 8vlx1HC9ri0RbwAejG5E7GtlwwEEaRo8lvcEBfyWcqyIiu9uzxLI9XYFVy/s7ETwxz50=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cDaavKLafchoKGGlPD9YY8j/Eko5IuVzuyjWrJVPPhM=; b=dwZh6sHoTEtBry0sjtxu4TTNuE
 7ACUXp/dvwtkLm1AS3Ovg1zj5crpDyQgmxfkDJqxMXK9gmGCPHr4lFsu6g0tz4kiDpMF58MgHhz2o
 G9A31g7/JOy16HRPOP4lun2lBP7E1NWyJ4ElkZlNwjFQ1+OMVRrlnvHO7PZphJc8YNQI=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3xAD-0076VW-Ij
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 18 Feb 2020 07:19:26 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 18 Feb 2020 07:19:19 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stefan@konink.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-206551-202145-dPXTK2Cskb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-206551-202145@https.bugzilla.kernel.org/>
References: <bug-206551-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: konink.de]
X-Headers-End: 1j3xAD-0076VW-Ij
Subject: [f2fs-dev] [Bug 206551] Failed to initialize F2FS segment manager
 (-117)
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

--- Comment #5 from Stefan de Konink (stefan@konink.de) ---
[    1.404552] F2FS-fs (sda4): Found nat_bits in checkpoint
[    1.638356] F2FS-fs (sda4): Mounted with checkpoint version = 68992090

I don't have the dmesg of the 'recovery' attempts.

/dev/sda4 on / type f2fs
(rw,noatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,fsync_mode=posix)

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
