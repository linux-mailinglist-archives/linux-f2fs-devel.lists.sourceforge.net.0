Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46744400B32
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 13:43:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMU5I-0001tW-Pm; Sat, 04 Sep 2021 11:43:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mMU5H-0001tE-Gc
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 11:43:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yYVJxDlTX3F6q6xVcPIwk/Ahfcre1jtvYRWnbSoZLbk=; b=duPQY9oCeVScu38qE/Noxh1C9q
 Hl6AElISmArjMXozfM275b757VB+y8GklA9yyIHILFsGcmOuqzXn/nMDZrB96uaow9adY8p44U73a
 4uimXRnAfUe92++NGRY2br5+hiKZ7FUk2H8jvN2prfOWIwlOxf8bRcfZYZGVwxWWOkb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yYVJxDlTX3F6q6xVcPIwk/Ahfcre1jtvYRWnbSoZLbk=; b=bdomriabaTXL1pmbl1+foVSl0J
 MW43PdDyUEKAKzbeJ7zIGctRYuznyL/bkLoMzMuw9ElXgK1qR6naGuHH5NYb2rQ7tIcH6cMHLOn6J
 DArSgPMwGWskmICDFI77G7KnDWW+7Vyx5MjLG+wkaytsVSIXelWUGNAIn+CYmpOUyYII=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMU5D-00ETzY-2l
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 11:43:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 8226D60FDC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  4 Sep 2021 11:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630755813;
 bh=bLQG1aEqm9DpFjbt/ZdOOLbnhGpEzz7iJgF2Ppo9ZTA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=m0rhLkHilA/y2jqTmOX/P4ohFQCY2aJiNfbjocTfbNk8OubW72ZrAp+IZIROB5N6E
 sWn0wd2b4Cd34tusl0o0nv2SC8kTnLpXXsdqsbSlLC1MEVDSUHKsiCrNFT1jYKklzz
 nA6q4hZ/GCCgr9mmVRq9CLkk2UjODSFaMvE4opOFIWmECM1B/TXTys5lCUwEwsDvIJ
 +kT5U2FMeQ2RQKbUjNh1bhpXUC6WCnYqIEu7q/dHF65X6/4X41i40CPj3i8tXMM3T6
 3C8QcRKGUDiXUi9RQvYkEj/DMqG8LE5wMZTPyreSHmg9OU7tgpkApw23PkmkGsWlS2
 u9d8Mweut5LxQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 6D46060E99; Sat,  4 Sep 2021 11:43:33 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 04 Sep 2021 11:43:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-213877-202145-7o5ZTFlkw8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213877-202145@https.bugzilla.kernel.org/>
References: <bug-213877-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=213877 Jaegeuk
 Kim (jaegeuk@kernel.org) changed: What |Removed |Added CC| |jaegeuk@kernel.org
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mMU5D-00ETzY-2l
Subject: [f2fs-dev] [Bug 213877] Mount multiple SMR block devices exceed
 certain number cause system non-response
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

https://bugzilla.kernel.org/show_bug.cgi?id=213877

Jaegeuk Kim (jaegeuk@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |jaegeuk@kernel.org

--- Comment #6 from Jaegeuk Kim (jaegeuk@kernel.org) ---
https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=4f993264fe2965c344f223d854ccbb549b16ed71

in pull request for 5.15-rc1.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
