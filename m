Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF1E52964C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 May 2022 02:57:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nqlWZ-00070Z-8j; Tue, 17 May 2022 00:57:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nqlWY-00070T-3L
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 00:57:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=55MN5zvwleyKtxtmiRQW7GZfgf9HRnaP2FvgypHreE8=; b=TeF8aTCbmbqFXEvchd6MEdobZQ
 ca3+gTvRUS/K6U9FMwVkUaugS2NV/7c5q2KfZH8r8zYP1eRKgRSiatZoaod1+MsDiStYNHM8rjUx9
 Uh41mbaD8LGT/fi/o2vZcZBmSjES4RQ841qvqJWEZW2+pYgeZwsaqg8AmB9TRrWv0q88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=55MN5zvwleyKtxtmiRQW7GZfgf9HRnaP2FvgypHreE8=; b=W8WHkChiP8r20ZQwHYtfTKiQJA
 2siCjxVCYpoz5I+LRkwQ4wU9NifewDWFpa6oL6RTIAJ41LUHwsMNJo0KG/TzEkBsUMbSOYWx7JtLJ
 ZjpHpN5Twn4k3BCpR20uxeYb4BM07Kb9rjCpDrElXsKsnrww5JDlYYj9axkBTiTvZqhI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nqlWU-001RCr-Mf
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 17 May 2022 00:57:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 835F06117D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 00:57:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ECE4AC385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 May 2022 00:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652749023;
 bh=zXF8WfGrlh+C39rJ4LFAaz7fAqtaINxnM3dkoyVvQ8E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=jCWGJ9GAegFs3+CyYYmTRBEHzoO0zdB645A1WlHA/bh57iuG9GxHmy6XUk8QGVQIJ
 y+Z1x+cSAjLSsBBchZBIXrmuuA6Myy/bJgLjmTxUfm1cAfZHk+rKnigrvz4SCLO8g+
 iqrgETo7Ou/7Nssi+9o7GHnn2HxrUC5Hf0sVxAZw1ttWJx0I9ECYGAT5buBGFVRr/+
 Wru9G+OmIFXL5rQ9xAfbLkkZd8/OXGGiK4RlVM2simiHrw4TQ+56VapbuyF8rVf9Uh
 jBiqYtBjZD8fTWu6sovhOdri6zyEJ79LIDlnoWANdsv/3a2qSKioHBgg/9NnomPvLm
 upvzOcvtYs4gw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DB4BFC05FD0; Tue, 17 May 2022 00:57:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 17 May 2022 00:57:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Zhiguo.Niu@unisoc.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: INVALID
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215984-202145-U92R3V9aA2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215984-202145@https.bugzilla.kernel.org/>
References: <bug-215984-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215984 Zhiguo.Niu
 (Zhiguo.Niu@unisoc.com) changed: What |Removed |Added Status|NEW |RESOLVED
 Resolution|--- |INVALID 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nqlWU-001RCr-Mf
Subject: [f2fs-dev] [Bug 215984] Is there a f2fs_sload tool used on windows?
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

https://bugzilla.kernel.org/show_bug.cgi?id=215984

Zhiguo.Niu (Zhiguo.Niu@unisoc.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |INVALID

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
