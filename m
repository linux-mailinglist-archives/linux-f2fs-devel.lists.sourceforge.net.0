Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A0C4471827
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Dec 2021 05:05:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwG7P-0007dU-UA; Sun, 12 Dec 2021 04:05:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mwG7E-0007dI-I3
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 04:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H3PmmnCeMWeRhDDw343JQSXp551xWsmk9XTkDJ3gQlA=; b=IWhjQi1ASud2m7+4BIgqyZRN+j
 ZEY+QQS0LOQ12DfaSMaybi0xD7AvJ7llfhBjWjt/MPBwIAs+Me69c0Kt7BXQ1HH+oa32crAp6Y7j6
 qeSOgpn1gPK0SFRxfAErBrRt3/peZxcSUGrFuNwZ8qja/d/0aHjGBZZjj4Yo476F2H/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H3PmmnCeMWeRhDDw343JQSXp551xWsmk9XTkDJ3gQlA=; b=XRC1htZ39ES4H39HzWJ5Ypw3eC
 kdEsWG8Zf6V+G0j8u2x5apzHpXq7aojXJpyerbUAFSLnkpKI+RBQwyrDiWwR4e/5EhYY1pfvpzrLL
 oMjmEhdfL+lAt5eeowy6hOOoM6RMXGN1D4F+7krM9RhlE0KhosoS+GR9yOCs/ISdpA4E=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwG7D-0007Jy-RA
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 12 Dec 2021 04:05:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B6A6AB80CA4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 04:05:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E884C341C5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 12 Dec 2021 04:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639281923;
 bh=Xy05va2+MKySxhHRxI85otxWBKp43YZu17+fT0f4eP0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NRavRzfWFuAK3tH8GQjDKPEZqOH205U2bEZdeao/SH12CkQUU4e1aDfd5uaG9cUHT
 CWB8IASebKHdo2X/Sr9Wtj9vBdXLDyjYR+MpA12UPRftySE5A7eCv67SXdh08dcHgN
 VHhiG67MPxF8bZ3TsZeBikmZi4L//AHsfs3GZqTHz+Up1WPGhXKHLDkNbN56i2l9Dk
 usqvbhe/df0vEtujUSl4gW0i21AaMBWOswDYQcsPM+D4vPBmJ6OYfVr1jVvc/KfO0F
 l5s59fjvjJ391VGRsA8sJUvQXuSqqoKOI4UtvIABhbdfpBhtFakF0uTJJpTCWNj8NY
 DSUgUbsS/wylQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 7041860F41; Sun, 12 Dec 2021 04:05:23 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 12 Dec 2021 04:05:23 +0000
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
Message-ID: <bug-215231-202145-IXKshfY50z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215231-202145@https.bugzilla.kernel.org/>
References: <bug-215231-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215231 Chao Yu
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
X-Headers-End: 1mwG7D-0007Jy-RA
Subject: [f2fs-dev] [Bug 215231] kernel NULL pointer dereference triggered
 in folio_mark_dirty() when mount and operate on a crafted f2fs image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215231

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
