Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C44F5471828
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 05:06:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwG7v-0007g4-5Z; Sun, 12 Dec 2021 04:06:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mwG7t-0007fy-L7
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 04:06:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y3/cD6gksntYjk8hBbnzI7j1661Cs+dp7X2DTa6mc3I=; b=aAUrp1fzElf4oic28ActkEiFxt
 rEPLHbFqTy62e8CY+AFAnGTEbO7CQC7JFSQZIkip+W63Atd1mDP6Kq68jxWkMvi9vY70PigvChElA
 u80hjE/R5D/gHbBgTXY4BgTIWNLXJo17iFPKK5CQIm+T46KCCmeDgCIomBqvR/lsFSAA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y3/cD6gksntYjk8hBbnzI7j1661Cs+dp7X2DTa6mc3I=; b=ENaouLOZxRwKtDlxcTHNoddQWX
 TBvUhD5ywD0vkM7EigFQkuAbzg3pJ5GwqXxEQVBnFcfKxe4r9FkwWdvqucE+qvhLA4JhcdV5306yY
 UIfTuXvaieNKydM5gSCNZncBIerpdXrNbXvZKU/auykM1Xc+EdzpNMT5WuGbx+SWK+pc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwG7s-0007NU-UM
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 04:06:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B70E2B80CA4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 04:06:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8CFF9C341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 04:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639281969;
 bh=z8tQKUD91hK5+kV/CNgmt8DAEaehtl256ZCIA9bWhs0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=e3iBFqDbIDhV4rp9EskoroJ0abtFBs+BYomaFuRlTp9MxMvTzia9yhJILucuCiGTB
 9la6JCxnQZugtsnfKts6gRqp+Ogb+tr/BltJyILBKP6XAjJRVwE0H3Xikg5/xjXu+d
 Ye2JjXZ2RXvwZtS+eSRzXRlCimWUYaoAym7Bi/wwhx9gHsPq48xb8dAph+y3yyqCTb
 hB7ukwoej/TllNz26Z/s1S9tm3SRsMrMfnDNqTKBTgnZgx0Kcs9TN4bSYozZebxcyK
 aNnnyetJ+H5cd1EBD14o0hU65/gsDJB/sfp+u4knUbkC6hrBqKrPDr0l3FtfU06PaH
 PytHFh/nM4P2Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 783FF60F41; Sun, 12 Dec 2021 04:06:09 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 12 Dec 2021 04:06:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215235-202145-pESOQOeA5A@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215235-202145@https.bugzilla.kernel.org/>
References: <bug-215235-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215235 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |CODE_FIX 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mwG7s-0007NU-UM
Subject: [f2fs-dev] [Bug 215235] page fault in f2fs_setxattr() when mount
 and operate on corrupted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215235

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #3 from Chao Yu (chao@kernel.org) ---
Thanks for the verification. :)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
