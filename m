Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F15F8518A36
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 May 2022 18:41:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nlvah-00073J-Rp; Tue, 03 May 2022 16:41:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nlvag-00073D-10
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KzvnBnbQENAzH1mQZYrkZmrKlXtNvSZ4B2vopbKB8y8=; b=ZhyzMsu4wItLuaKTkV90n4t4YY
 Bp9p7m5LzoeFaw3ghmB4CaAmBQHs2UVVtItCfAghEPDty6Y/0HDzWsjYWr9BshX1YHl2uScgaKB35
 jU6AhZB/CC8DG/Qdj98RcD5SAzirqgNNqLD4jL/+ZFQD1bjfCrkNp3HExEQj4xaOdAlE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KzvnBnbQENAzH1mQZYrkZmrKlXtNvSZ4B2vopbKB8y8=; b=LV+w3i81qoViagx7kUHpzWPP7i
 u1SRVgk1wt3KPwg23TGPXJmG1c6ZJYrKaTRfyadMakmBFFSRqIKN2G6cEk3w5EN+NalamkYGZGhLR
 hK/zpyHjBbC0T1Q9rhDkiN9/zq6u0G4Gqxt98Cbv0NlkrlPeIUlsvMFqf/8CRKzR10Ww=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nlvaf-0003e5-OR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 03 May 2022 16:41:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 91FF861769
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 16:41:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 02F63C385AF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  3 May 2022 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651596087;
 bh=RL6xsIbibbtIMJAd+AR/6p8YyGIpzxw7IUVfA2AtQ7Q=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rX3Dk1p9KlivQzirs0lIqhLRXdztww3U/CmGOiMICGHiA7nGPSMdVMsqQSqrqBrv8
 /+US6s1i1/v0UDwN0br+UkIoPR6o1dnnXRywJ7bH3sv9csUzxWrxgGd7RnTyFYCxwe
 Nc6FMyyj6fJqG7WF0xVYZO3X3iVhN0PIzmLMw2MZ1Kk37tTKxlUwSN9XpkG0hqxzh7
 SBSwJ+YKwMRyPNvG9GWYXeQdCGTymcoVa456fsa2z97WZJ8EYa4SlN/5m6cKYDQloP
 LelmQF4M4HVNgmuPYjIJF2oFl58QT5ajW3i1bqtMvnMw190QOaJoGtsV/675s+Q7Rw
 tNUlJIY+iJkEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D537BC05FD0; Tue,  3 May 2022 16:41:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 03 May 2022 16:41:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-215935-202145-lJFjrWmKqY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215935-202145@https.bugzilla.kernel.org/>
References: <bug-215935-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215935 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |NEEDINFO CC|
 |chao@kernel.org 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nlvaf-0003e5-OR
Subject: [f2fs-dev] [Bug 215935] kernel hangs when invoking system calls
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

https://bugzilla.kernel.org/show_bug.cgi?id=215935

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
I can't reproduce this bug...

Can you please test on below branch which includes recent fixing patches?

https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/log/?h=bugzilla

And is there any callstack when kernel hangs?

Thanks,

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
