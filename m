Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B22ED8B091D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 14:20:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzbbd-0002uu-Gf;
	Wed, 24 Apr 2024 12:20:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rzbba-0002uY-OW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i1cXwnafA4oAM9YgAbqLVHjgg7QHMDqaKRuPYkvykK8=; b=R/Xbs5p4+04ZWP/u3MpoH7ECbg
 c7//oH8iGPLtCtUo+06kqudRQjNtyQneKAu+yUpIutCKPBZAdhMx5BWamI0XQvc77V2s5oatxkmiN
 X6vTsu/VuN2zcASP6nkDTUYKxGtcbTZWqbT6XN105iCLZUmpD5WQEP+qtLHGX5nB/iDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i1cXwnafA4oAM9YgAbqLVHjgg7QHMDqaKRuPYkvykK8=; b=khAJeaX5ddnpfy2CoG71nnDlvw
 27MHX8imi9drbwUjTtYbIxYlWsKBZWtL9SdlxDsNuqnW/TZgIBVAMeVUUwau/lrw57ZZEDfs+ODQd
 FTmQ30OZk0SeE+w/mjNKeRr4Z8DuLa5VidFHCdWU1ALSbNttkwXnbh0e5YQ8hqWCN2Do=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzbbZ-00010l-Sf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:20:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 193CB60E26
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 12:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B60C1C32782
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 12:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713961195;
 bh=i1cXwnafA4oAM9YgAbqLVHjgg7QHMDqaKRuPYkvykK8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=pKGIKuotX2VK0tPUaYji9lVMlHp/UuMOuQGaI/ngNQaO9HP0p1+B8Wl8Fcvgo1uDU
 0iC53rDefGPzVvGeoe6sQBT2V1EwqvSXy3QVjKb4QJ/KoiVLepXkusvokpqMDDg7i7
 +tNSo7Qevwke5pfHFfn3QCYP91P3skM7F6jQ5lxaiJD5omYm5hM5+4KXjt91VEDbAR
 i0P9q6BiWiLwIxoHBGYnC+L9imSCWbQRRX71ZyThw/ueJTDTsqXEgtdr8I7cbYh3ol
 kf88+9xo3tl2vhJJo18nlEGGxbkG/OicnSHFKrdxebCINwrfGW2leiYW563Ol6R+XM
 HIHv4UFfwVNnw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9D425C433E2; Wed, 24 Apr 2024 12:19:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Apr 2024 12:19:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218770-202145-9dVDfhdtu7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218770-202145@https.bugzilla.kernel.org/>
References: <bug-218770-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218770 ---
 Comment
 #2 from Artem S. Tashkinov (aros@gmx.com) --- *** Bug 218769 has been marked
 as a duplicate of this bug. *** -- You may reply to this email to add a
 comment. Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzbbZ-00010l-Sf
Subject: [f2fs-dev] [Bug 218770] fsck seems unable to solve corruption
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

https://bugzilla.kernel.org/show_bug.cgi?id=218770

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 218769 has been marked as a duplicate of this bug. ***

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
