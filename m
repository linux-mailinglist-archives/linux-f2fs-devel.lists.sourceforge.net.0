Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A87607980
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 16:24:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olsx6-0002B6-V4;
	Fri, 21 Oct 2022 14:24:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1olsx5-0002At-L5
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 14:24:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qzf8obafnZQ1VTDowZw5os7LYPewO//82i6zluNJp0o=; b=CKnSdRZ5zfjB+kZuk3foIb9Ta7
 wPpU23g8231aBLqsUz3PqP8wTtfUebOSh0iJzYOOdiakRfKfXy0DxXo+jAiZJ0uw0hoB+GAMgbqii
 8m75A9LQ40z9t18hMpfIC45xXr1Ds7hLSocz2jO79dLQMglbkdRubS8EwecLgcAOl6RM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qzf8obafnZQ1VTDowZw5os7LYPewO//82i6zluNJp0o=; b=h/FoKmv+hJ4/JOLWkrWXu5vOZb
 09ilJVqbuNmLaZIyl1KGAlPXpHs6QYj5LZXnw5NmM+5dsr4eOJuaTkepRI2YfXFV9jGoz/aO8RyqX
 q5m43t6UgpOhLYmaTq503sTP3Pe1z0G8a/ySOeQWamXPdw5H0HnZAUr89N1gMoFTKUYw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olsx0-0001Jp-JB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 14:24:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 83510B82C29
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Oct 2022 14:24:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 333C5C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Oct 2022 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666362270;
 bh=kRG1+08ndDItCCDLbYXcqV3818DxPUqVSx4ONgh1y4M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EkZQDfAsd8qYYvQ3pdhwFSatMn6Ni/h/UmGCiUbL0QR+j1Bi6ORs7YypotrNjrcpA
 QlxCrx8N514h6fPNxtP4Yyjm8RJlMnIW2b1g6LGwgtvzFlRVREBaCMKfelzY4/Hgh3
 EFj9RBkxIHqSwOf52VxYjV5PYBpSvuiEs0wezst+jwwk/q8F48nInviK4BNCn2Lt1I
 vauUMLv1jR+RYIbIzZXkHldMteMShfDx1MRzll0L+wgx2uLRo4vXR0OjS2dMAERFEn
 UniQnUgdXtPQu+3uvXJ+xlxOZ/G2lE3U3m4ydoF8J7poNfhgREfOA/HTFWJscho1Vp
 blCTBP6WL1VVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 15A5AC433E4; Fri, 21 Oct 2022 14:24:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Oct 2022 14:24:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexwriter2003@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215235-202145-TDufUDFPf1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215235-202145@https.bugzilla.kernel.org/>
References: <bug-215235-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215235 alexwriter
 (alexwriter2003@gmail.com) changed: What |Removed |Added CC|
 |alexwriter2003@gmail.com
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1olsx0-0001Jp-JB
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

alexwriter (alexwriter2003@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |alexwriter2003@gmail.com

--- Comment #6 from alexwriter (alexwriter2003@gmail.com) ---
Re:
- Overview 
 page fault in f2fs_setxattr(https://stemhave.com/programming-help.html)  when
mount and operate on corrupted image 

- Reproduce 
tested on kernel 5.16-rc3, 5.15.X under root

# unzip tmp7.zip 
#./single.sh f2fs 7

Sometimes need to run the script several times

---------------------------------
Thaks for fix this...

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
