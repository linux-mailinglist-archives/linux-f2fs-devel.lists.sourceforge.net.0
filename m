Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C2E62609A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 18:42:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otY2T-0007P3-PW;
	Fri, 11 Nov 2022 17:42:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1otY2R-0007Oo-Ll
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 17:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pLCztcZhZTdkR8lpNial1fG7y4gUlsJzCBUuQfmciq0=; b=azRzNmATaIeTb26kgSYwRsE/XK
 iSdW9aF1IcHTuMFGgPtQLZBW9m6kFEfIpKfCTqBGS/uAuoJ0hiekGUgo+uGM4F7mB748D14LRygvO
 1D+cEvaNzy4jR1omcV+2JCA7lm0i7AFiTXaD54UHdVkbJCDY45unkNWfKt6NsCJveem4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pLCztcZhZTdkR8lpNial1fG7y4gUlsJzCBUuQfmciq0=; b=Q7ktj6vRMz0UCUKB4jNwXp5EIL
 PpCDpWZNHfafrc334Eoll4zqk0VjvxAcG3pBiBnj8PWqPzVXcAYSktaosgf2QL/83wGmADt0/t/W3
 a6LDz4Mm3XCm8npDpwnoGWP+JqpQyHWtWaazy8V8vd3ERDmnPKDcusbPlHt/BjehD+O4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otY2R-004XfK-15 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 17:41:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D8C32CE28AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Nov 2022 17:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 24851C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Nov 2022 17:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668188509;
 bh=pLCztcZhZTdkR8lpNial1fG7y4gUlsJzCBUuQfmciq0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=OtUKUff/P2Hhe6i/KN4UuH46SAiwzmVeRfKvo2SBxT75aaCubqyh33BqKbdRJwYZP
 HLWBNkUwKnPftIxvNh6bPXoNLS9UucaBPLJcIphv+PWwcQaFQWsWHhNTwwifK7/1Io
 gG2ECKnoCn9BdermKRsB3n4A4MoWr/VnssqvX3n0OcoyLQw/asDifaZ8YWTbt16EzV
 nYhDt+S/+Mi2hXVpFghEdxbm3w1V+kEU8Pm7Aelu8Zgwregz8f3Gcikh4Up9VBB5ev
 9pEjrsrOihutnRgKvRbvXP8aSESaFS7YQuk1U3CeNrdcXHXGf5oFJn47S8TZUSEYm0
 DJLVYpxm8NsVg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0915EC433E4; Fri, 11 Nov 2022 17:41:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 11 Nov 2022 17:41:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-EeK3Cqwlhb@https.bugzilla.kernel.org/>
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
 #81 from Jaegeuk Kim (jaegeuk@kernel.org) --- I think 1313 would be enough
 to avoid this issue first. 3568 case is after submit IO which could have
 a chance to get another states. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1otY2R-004XfK-15
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

--- Comment #81 from Jaegeuk Kim (jaegeuk@kernel.org) ---
I think 1313 would be enough to avoid this issue first.
3568 case is after submit IO which could have a chance to get another states.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
