Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E82C55FB55
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jun 2022 11:07:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6Tfq-0001zn-SS; Wed, 29 Jun 2022 09:07:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o6Tfp-0001zg-Hx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jun 2022 09:07:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2mAUbVd51phdpgbN8MYFfGo95LrCZQ84GrPfc9ScT4c=; b=Zi+n0MwSfuoI5IAqXXUuGQfBt6
 mGnb6DrEaGkJDmKRfJloJynV8Eo+pqG8EXJgRATnyo4FlyPDp133tIb7im5STqgwXNNv1O0qYKmpO
 O0afxinPhBNxt6qFwvc3Rrxz0ePeQfwTFvBJGwtwDh/+eyeQSYh6uRzA8eZrKtvP4NJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2mAUbVd51phdpgbN8MYFfGo95LrCZQ84GrPfc9ScT4c=; b=gXLIjhYMQy+t+uKjHcHIxV5wH9
 0mJty9otKHGYhVwUECBHZbz5ATZJtf2qYnIMrkCcMrP/lkn/ydOPfYZVilNFR4Pfp51pdToPnpiuf
 lkLXNT3+Gn9v43Xkvh2sL5sxh5eyZF6RfF7dcDnskJ3PXwXNJbyj+NVMGw4ZIBE/uTCw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6Tfl-0000r6-O2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jun 2022 09:07:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 18789CE248C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jun 2022 09:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57066C3411E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 29 Jun 2022 09:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656493653;
 bh=2mAUbVd51phdpgbN8MYFfGo95LrCZQ84GrPfc9ScT4c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IaXLz/Zk8qMqzSRXQPCcpS29q44s3mtIdZkrF239Ze7uT1VvO3ND3femtGVFRbml2
 7dMmX9yKB2HCW+as53FdCH9gVcO9oqg7mCBwwUD7v9GYnFeKXBUTuO5gDgGrRThtLy
 a/WuLXG7DIj9N3F7SuMOhhFKmd0sTh98UWIhZM97d9HzmyRL7F5tQBX8c1VDLg4BBn
 Hy993VylbYWdsXzH1yQ5BhQGl/3J2TOA9+DwzCa9uYlhZkdWLmvbkCdJgEQ0LiJCCX
 jRWQU8taJdppYaIm0hHkdpXFakQ2naDvC6huyNiqz2vZQVtU+eXIBusTeQUYtjuvpe
 JDs1v0r1GaSlA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0DA05CC13AD; Wed, 29 Jun 2022 09:07:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 29 Jun 2022 09:07:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-FhWngszUuA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #24 from Guido (guido.iodice@gmail.com) --- Linux 5.19 rc4 doesn't solve
 the problem -- You may reply to this email to add a comment. 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o6Tfl-0000r6-O2
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

--- Comment #24 from Guido (guido.iodice@gmail.com) ---
Linux 5.19 rc4 doesn't solve the problem

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
