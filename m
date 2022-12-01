Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63A1863FAA9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Dec 2022 23:38:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p0sCT-00025x-Nk;
	Thu, 01 Dec 2022 22:38:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p0sCT-00025q-04
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Dec 2022 22:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wA9ht6DD7XcPHX3RWCmJ0LgeqY7dIEAHnV3OF2WgOkA=; b=LMEt2zOKjePJZPqvXv6z7hDTrM
 YdD4jNIDLoFeFnQHvbeb+qcnc3iRSMqFP7xKQwbDfaKXl8gpxZ7JciO5im7SH4o6AVBsxkI8e8rwT
 Qhx3iwvUx9T46Sz3ni9BG2IYvQWb0njUHhqxZO2hi0TMQegc5WgaLZ6CpNilZo9DEFrU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wA9ht6DD7XcPHX3RWCmJ0LgeqY7dIEAHnV3OF2WgOkA=; b=LV6274J/LVFFxeTM1JESOPvn8H
 TrKrtAUyzAY3IbUfIL8+OdNK8ffN2Gwq4lgeAIdUUfk7NpAPJobVM/f514SJPLocAtWYTw+y1z/Hk
 095vS9KDAb/lM4U74wyI2eRvo5AsPZmqpZRjGP9O4kPO35SINiD4uHEjG8CrVm6FjVLU=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p0sCO-0003KG-JS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Dec 2022 22:38:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 69B9CCE1DD5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Dec 2022 22:38:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC801C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Dec 2022 22:38:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669934300;
 bh=wA9ht6DD7XcPHX3RWCmJ0LgeqY7dIEAHnV3OF2WgOkA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KX2n3L042401TICG7D0aINZpopEY6kjZqR9L/tckSVHEKYj3Tzelf3Fl+Bd1Vzc//
 svI5OsXDs5Xml17M4lE/TpTum/6P8/LYUqFdtFkzMjommzc6uP4S4cpAUqnhIK1ZzE
 bnV8gNXHZkxdL017HxcI5gNCDwb3QcrbeFyOI/0tQRlOTL6sn4HMBJgDEYm7Nfehgj
 ahJRjgWAK2JINr0t1dqy/ZD08vIvUuGvay0hMMAPNuqgmQxutEaXP+Hx3ihR90ZzUB
 YrxjuSCW94D1a/yYEI0jXvq7QlqIwcTLucrXrAtz+cgWgdLzEqkQd9lmjg/eb22GwC
 r0Rn2mZ9WIRVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 97552C433E6; Thu,  1 Dec 2022 22:38:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 01 Dec 2022 22:38:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-X6MBg6e4VW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #94 from Yuriy Garin (yuriy.garin@gmail.com) --- (In reply to Yuriy Garin
 from comment #93) > It's running on 6.0.9-arch1-1: > > $ uname -a > Linux
 ... 6.0.9-arch1-1 #2 SMP PREEMPT_DYNAMIC [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p0sCO-0003KG-JS
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

--- Comment #94 from Yuriy Garin (yuriy.garin@gmail.com) ---
(In reply to Yuriy Garin from comment #93)
> It's running on 6.0.9-arch1-1:
> 
> $ uname -a
> Linux ... 6.0.9-arch1-1 #2 SMP PREEMPT_DYNAMIC Wed, 23 Nov 2022 05:14:08
> +0000 x86_64 GNU/Linux

Got the same result on 6.0.10-arch2-1.

See timing, may be it helps. Once problems occurs, it goes every 4 minute for 1
1/2 hour.

[Wed Nov 30 15:54:15 2022] f2fs_get_lock_data_page: bad: 1032147,
00000000be98c3cd, 00000000d0321d1e
[Wed Nov 30 15:58:08 2022] f2fs_get_lock_data_page: bad: 1032147,
00000000be98c3cd, 00000000d0321d1e
[Wed Nov 30 16:02:02 2022] f2fs_get_lock_data_page: bad: 1032147,
00000000be98c3cd, 00000000d0321d1e
[Wed Nov 30 16:05:55 2022] f2fs_get_lock_data_page: bad: 1032147,
00000000be98c3cd, 00000000d0321d1e
[Wed Nov 30 16:09:48 2022] f2fs_get_lock_data_page: bad: 1032147,
00000000be98c3cd, 00000000d0321d1e
...
[Wed Nov 30 17:27:35 2022] f2fs_get_lock_data_page: bad: 1032147,
00000000be98c3cd, 00000000d0321d1e
[Wed Nov 30 17:31:29 2022] f2fs_get_lock_data_page: bad: 1032147,
00000000be98c3cd, 00000000d0321d1e

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
