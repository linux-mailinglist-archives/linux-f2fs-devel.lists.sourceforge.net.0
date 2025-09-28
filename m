Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD51DBA6F23
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 12:31:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4K/TVnr8KR9nRMH/fwFxw5Jxw+Slt65s/LULRu+GCxs=; b=Q6wWPjNsOHyUICl00WjhWad6PT
	fjSH/R/nYdvu0mfgk3W2E1XVrVmKRZ7kWy5dXq1GfxlWzlyKiw3YS3F+j9SECiW0ACZtW4qAvJXfH
	cScMUwnGWGNgEodq9nptHKsZM0MHF5GPmMciZ6sdQkagX9Yv0pv+yxLS9jVPHSTSBnpI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2ogE-0008GE-Po;
	Sun, 28 Sep 2025 10:30:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v2ogD-0008G7-Jk
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 10:30:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jk2fNPwDRqEUJlcUd5mPEdGXnBrI1eDgG0iGw8OIYCA=; b=AfcK0luODs+OD6eep5Ep2OXr8u
 EETJ2NBmDrNa8havlSCorkygcxvit3anNO3oKk4rNWHTn6fc0FCd43uMRnDulPdjFYr2wwPuIO+uI
 vjmToVtqJnnrH8pzud0L7FikjHsFiQhCYCPIxalfHCdCGoKgNMOKcOdFzDnZTMv6kuTI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jk2fNPwDRqEUJlcUd5mPEdGXnBrI1eDgG0iGw8OIYCA=; b=MFb7v9aLJvzOkYrIakuYQE5QXy
 L+HdPeyoRtQw3yk4DDMSpzf8smbKtjv/WIwkPjmhVWHpUTlAM04MHoTa2bLHqlfXICOfgwBzTbAUp
 +pGQiqTnwU+RGTSw/Y5XmX2F26jrNIceo6KCVunsnogt7lvf1MGqYS0Fp/4NpwSkfGis=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2ogD-0001Km-3v for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 10:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id ACB3D444D1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 10:30:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 898F2C4CEF7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 10:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759055451;
 bh=qkJ1UTnTKAq9IHWwNlAzf7Mr9PQxg4x4Je7Aa+jgxcU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=othqsTZCcQT6ivwX+wrxY89bp2Wo1Ujwu5+Rs9I/Xy1Ms7ywCKsBz68IcPYqvK1uJ
 J2v3ql2tUwzZwBVfIz4cAlaryZVBc0T8Xyr8BsdgF6+22PFVRr91oZ+gUAPq58tY4+
 YpNVDqJgT7FeV6EvLg5gafSZOuAibA+44Ed019r4eXzbZ9ZbsISwJJuoJBiE1Wzpkj
 sZnGz6zOVOIZDu/ygPPaF2n/vMsX9Mr1DiqnCG6TQbUxlqsybCEUiy7DgxY0bELusD
 K+uFy3qYg2SUjOqudseVxg9PVh/EzGxK9JvPrJPrVcS69vsl/ugIyCJGeIxu9UKmJK
 9HxNh6/qS/vmw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76BD6C3279F; Sun, 28 Sep 2025 10:30:51 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 28 Sep 2025 10:30:51 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status
Message-ID: <bug-220575-202145-4NV5jZmjgQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=220575 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v2ogD-0001Km-3v
Subject: [f2fs-dev] [Bug 220575] Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
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

https://bugzilla.kernel.org/show_bug.cgi?id=220575

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED

--- Comment #12 from Chao Yu (chao@kernel.org) ---
Hi JY,

I've figured out a reproducer as below:

1. mkdir /mnt/f2fs/enc & encrypt /mnt/f2fs/enc

2. Run below script in shell #1:
for ((i=1;i>0;i++)) do xfs_io -f /mnt/f2fs/enc/file \
-c "pwrite 0 32k" -c "fdatasync"

3. Run below script in shell #2:
for ((i=1;i>0;i++)) do xfs_io -f /mnt/f2fs/enc/file \
-c "pwrite 0 32k" -c "fdatasync"

Now, testing below fix.

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=bugfix/syzbot&id=1d024fd4c6fed3767f063db79746bcd2d0be49d1

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
