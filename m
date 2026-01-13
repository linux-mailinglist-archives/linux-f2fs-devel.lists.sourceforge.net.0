Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F095ED16C76
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 07:16:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bgI6l2ixM5Fplxg0da2X0Tb4RgDXBS5VGEQebOwi8hA=; b=bZn7q6utDu99Z8PZMUYCK+axmK
	Ncr7qCLGOXZVKld6uaKlqsOpfyLNpMyM66iE3JbILzK2zwpteqWrPUqFjGn7DLvMHf2H/ziHM1lI1
	MNNuF6upOlRLztRbm0+5jBWnZqx8AMp/buc8dTy5GAX6TSID+xDsRhx55oNfF1KgaXGg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfXhE-0001eg-7P;
	Tue, 13 Jan 2026 06:16:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1vfXhB-0001eY-TP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 06:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jgHQc035X2zo0eP8bntmgfSdpGl8W9Umx+reh8KGiqQ=; b=nG7hf2++J9V/c7csstKATDBPlq
 g+ksgcz+7MtTDeonYAuikIfrGfrRo50xGDAydWZCvazSA3kfdksSFF6iGkVdlRAuFbLzVRrD0JeQH
 P+fEb/aQY+RxU2lFyAU4iqRDn+DcWSLibGMXyzUADP+4eRGDyNpb7hvlevle4EViM164=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jgHQc035X2zo0eP8bntmgfSdpGl8W9Umx+reh8KGiqQ=; b=ATBzJcmI6KuUT96BzWdC/I7+y8
 A7aCA8bvb5iatP8EYB6PIpNRAerSMXrjDLwOaEmzm96KLs5jL3WDgnkrRGvRgG7X4KhqAulQB1dIG
 ShlCVmG3dD45hxnu23VXvyYdNnUzHGWwZDWCez861eom4qnutmRzpgcTRIEisUxh14H8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfXhB-0004ba-CK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 06:16:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B4FF560017
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 06:15:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EB90C19421
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 06:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768284950;
 bh=jgHQc035X2zo0eP8bntmgfSdpGl8W9Umx+reh8KGiqQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=LLKaPDrynKryjffU4opOPTrw2J9rbsj33VY+7vVvzJrHrE/RDW7MQfdD4E+SAqSYC
 EJk4dWprRWS4Gl19EyGKY5ruXQsF3iRIO3TW+jBlB0UiETiBvUnvjERsm8SJk3XKvH
 GfF+AXULW+h2DSKpU32+G+WCh5XegFNYOjP0FkRS0G9wNLwOvRMliteDO8/VLMOQau
 kpdj7NhEwjzRqn94nqeBqXOdqLsuUrO2/hd1cyxHPura/fOL+HwJvfdWN1OuMwIvX0
 YBL/PCLgslriUeba2KmtzbMEkGeyL4qRwTz29XlT/WIOESEVZkbUfBWMwwcTxxCcxh
 /UiVJ86wfnsNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5A5A9C3279F; Tue, 13 Jan 2026 06:15:50 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Jan 2026 06:15:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220951-202145-QYv8rwlzWG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220951-202145@https.bugzilla.kernel.org/>
References: <bug-220951-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220951 ---
 Comment
 #3 from Chao Yu (chao@kernel.org) --- Xiaolong, Thanks for your verfication
 on the patch! Let me upstream the patch. 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfXhB-0004ba-CK
Subject: [f2fs-dev] [Bug 220951] swapfile activation bug causes data
 corruption when swapfile < 2MB with fragmented extents
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
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=220951

--- Comment #3 from Chao Yu (chao@kernel.org) ---
Xiaolong,

Thanks for your verfication on the patch! Let me upstream the patch.

Thanks,

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
