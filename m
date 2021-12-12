Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE8C471821
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 05:03:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwG4l-00006u-EJ; Sun, 12 Dec 2021 04:03:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mwG4j-00006n-LU
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 04:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EUECYZqKApgFNwsxUK7P5vBk5dqnZEL8a5gm9v5eaQ8=; b=Aq3Kz1TJNfqB/jDP6x2kxN1/dU
 oiCHzjT/BU4Txkm0mCwf4ZPYf3DU7nyqb6DMRtoGRDHCtvoI1MgfMPbT05GnV2HXGdOqVEwgaKsbE
 5CPeZq87YRzqEmg3irVFLMjA/5thUtHb83+XltasFzcpoRLBsQZnJmH8eDVHMt8mpUgY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=EUECYZqKApgFNwsxUK7P5vBk5dqnZEL8a5gm9v5eaQ8=; b=JwVfir9pgSZbzJWofwwpdYG+OQ
 sp8xR08dkPXAdMHbXq7kTe0MeQF7Ski2Rs1lbnAN/rAdR1Wv319Qy5YBXja4v7aF7djbu4OBJabXl
 fc3sDjMpoFNbLBGFdrVZ+X8pRu6Uy5iMJGvvXgJ3QT9FvkYGfpNiQI/k6cH2Wr1FY0mM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwG4j-00073x-SO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 04:03:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 19013CE0B10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 04:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4034EC341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 04:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639281770;
 bh=YfMqBgZomWJOlS/3gOw5Zi9eCnA18aEePQbSlxUf+R0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=JEcsAaN8TFv4zUPgH2miauYBUufjHm4TD69ll68l+DOk1iv70Z+GR02vqePDTfSmA
 J0H9CMy+c/tw0HvU0WMFg+VKY9UAlCTMS+nQ37VARJk5vu8FkDIIsOaBlBbukoRFAn
 GWS11vFYirL3lLBOya+w9Yqrn0HWT38rPOopuIlFe+alDiuBJlF+GAR0gSKA02Ig95
 QpHYLuBZyPTDOzaCfS3HXMoErX51wgegMJn/fFw06OleVwF1CrRy8KD96I1zK30ez9
 E4pdw2nHZRzznl1em3ESeEa5guT8mzRGItk93DlqlERzWREULVDRIF1K+ezltxzJNx
 Nj35SM1ELbDOQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 0F6A560F41; Sun, 12 Dec 2021 04:02:50 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 12 Dec 2021 04:02:49 +0000
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
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215295-202145-JNxOeawa0G@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215295-202145@https.bugzilla.kernel.org/>
References: <bug-215295-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215295 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |DUPLICATE 
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
X-Headers-End: 1mwG4j-00073x-SO
Subject: [f2fs-dev] [Bug 215295] F2FS: BUG: KASAN: slab-out-of-bounds in
 reset_curseg+0x5ac/0x5e0 [f2fs]
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

https://bugzilla.kernel.org/show_bug.cgi?id=215295

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |DUPLICATE

--- Comment #2 from Chao Yu (chao@kernel.org) ---


*** This bug has been marked as a duplicate of bug 215293 ***

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
