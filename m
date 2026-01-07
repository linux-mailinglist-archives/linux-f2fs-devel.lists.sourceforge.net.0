Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0A0CFBBAD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 07 Jan 2026 03:30:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E7OkyQhgAMi1OOFIqTHVPzlRlk5V4q5NrNHnmwUPMA4=; b=knBV+bBJfox+tF0TC+rlB4dhjG
	ZeSvHeoWsTYthHnD+/PgIMmIwN9gGBbUuG//u2SiVlJg0tnWkp4O+4EHi3hjXGiKIFhwvBCgaqpo4
	QJvsf2IJcPSjQ8thnoatFJXuITuyYooMyI+Zc/178q5ykB3UwcIcJ9NT/sO2eMbv0eug=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vdJJq-00015W-Eo;
	Wed, 07 Jan 2026 02:30:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1vdJJo-00015P-FK
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:30:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ykrBL0LgA4yx7rqqrTQzZpE1iH2tnSctNrt04wxFqbk=; b=cQnCbABm1K7hj8xzmZ9VuOjZX3
 ulrQjFIZnEJ1Joosz+c0hK0G+83NqN0vJxjrMGnuwy7VWqI1Jodd+IliQIBqi4ROKmi8t7PkB0ap8
 dZs07J3zcdsO2ii0YAmqJ60ZVJ8xpN+ELLiATgpMOX+xZ/PlJ5Ou37VAbcTFVVWpIPuE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ykrBL0LgA4yx7rqqrTQzZpE1iH2tnSctNrt04wxFqbk=; b=SEgIQ7s9zAnNRw4gR7yjMUmLDi
 /67LqfmPXi/S+ylofRi5jnEfcaPGffQtx2fTlejqKncv9b4gsby5+bMGXXyXlvFOocB/vflgQK5yg
 zLlkuaMGYhAKz8Sn2KfxxSSX8sSMUMlfzpRP5fAOnQaurKAexGhEL7fYXhKmQBnEGL7o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vdJJn-0002Rl-VE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Jan 2026 02:30:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 57BAD60007
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jan 2026 02:30:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F862C116C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Jan 2026 02:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767753029;
 bh=eRfd43i2cH6QhJAGJufZnbOQXG4YFknR1rojpE8nAfI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=qlFvL8mLjntxp6pqsn24Yo4IDMHeI2aTpxqes6Dn3pYcZ9nVR0wLVDpgzCn6HCRlt
 WYEEPvA6W/oQvJv0o0na5t7rUSjMHcLQnSaAEm8zOwgn9kU2IERQAVGKh6KZ1WmIAR
 8CbRcZIBa+djNvSDBKz+YUdLdVNkKLcu2nFoKlVRDFumxGNXtecg03dT0Fn4eUhIr5
 +ZNVCTH6NGMFCsom1TqelG4BSSykZ5F4kJ7N4FJsQ5jv0CJ0u5EgUbtFwOT91DmYmL
 DttC8hcYeJ4qMEaw8wy7yGkpk0uWzirFVSmYWRBneSJrcmKRZQJpHTYnL5I7zk6cjw
 EVRz7nsjYZXng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F09F2C433E1; Wed,  7 Jan 2026 02:30:28 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 07 Jan 2026 02:30:28 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guoxiaolong2008@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cf_kernel_version
Message-ID: <bug-220951-202145-55ajiBGhX2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220951-202145@https.bugzilla.kernel.org/>
References: <bug-220951-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220951
 guoxiaolong2008@gmail.com
 changed: What |Removed |Added Kernel Version| |6.6 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vdJJn-0002Rl-VE
Subject: [f2fs-dev] [Bug 220951] swapfile activation bug causes data
 corruption when swapfile < 2MB with fragmented extents
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

https://bugzilla.kernel.org/show_bug.cgi?id=220951

guoxiaolong2008@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.6

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
