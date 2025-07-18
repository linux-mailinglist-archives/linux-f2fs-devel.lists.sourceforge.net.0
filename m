Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C1EB09EC8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Jul 2025 11:13:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OTRVDxTR3OM4ONDi60slOmcV67LcoRJjF1DTQksz6Tw=; b=P5CFshaTWUvRtaAT1iLWZAVuDD
	NgT13UHpfoV0UTS08BXQA+JuvbU++zKiv2aAEUmOTG28js8/KJ/tYr8U9XB8S9kY4S5OZpV4qpvgw
	JACSRMtXKdV8LN5meLi1jysZu6lyU/wQbeSQrUsem3gTat/fOo1qYWlS5h905zrnt+0g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uch9J-0004ze-J6;
	Fri, 18 Jul 2025 09:13:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1uch9I-0004zT-58
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 09:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C3pb85HyC1iwxrb6+nX/15ZXqM8kBktHqRPYjoN2sIE=; b=Unted7GAwJvMWbN0IUUWE4wX5z
 TbplCdp9D0+zBaq425+JOEREF0YkTEDEmO35FOlWUVJuil6X2LkI4RAiHNfUacLIsLod3NdxMK21n
 qre7PjlcqvM1/xzHxe8orDG/Ty0ow1YJlgQtMO4Is/ha+FLuaBxQ6hMQSnNfENxJA5Os=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C3pb85HyC1iwxrb6+nX/15ZXqM8kBktHqRPYjoN2sIE=; b=EOQ86bbUENluf+1BD/q6/b0HEc
 yjldKDql0LMitxcNfmy6TAUEp7O2BF6TwzlpqMumDyKWmBuHCrbqKvHcn3WfXrQuhEF/XJtKUycOA
 0Ox/BYAYupGYcZbT8IJUdp6byyHAi+JZw1+myARgAOmlm9FFot97mefOn1afjbIJZU2s=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uch9H-0003hV-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 09:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id F34A4601D3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Jul 2025 09:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AA878C4CEEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Jul 2025 09:12:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752829968;
 bh=C3pb85HyC1iwxrb6+nX/15ZXqM8kBktHqRPYjoN2sIE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cpp6gVMnaTnCA5Xvk2MINcsiBUsPjo5oaJPA5OXLPqhmu2k4wNpdxhwPV2a+1Q/lF
 JmxsBSNqt7wvBpVNFGF69rCACegLNnXnbBOnElQDAImk9T4rAXbVclWyTmyR4EZ23l
 hnXrEoRH1E4EQwSuDOkBmmMjNFuA08DdqA4T2G5tjq4Iw4fOtJL+ADCcBSChsXeG3c
 BcqaGr44zVvDUJMrQTCH/o6RHnfOWT0bCBZ36MDvnXBEuhY88x4nHTfyzHdSbx0xXp
 8dp0WEkw3cjKNbp5akjQ4wIa2FEtOI4RXAQpu3EJXaEV7j417l4Bv74B5yaWLOvOgK
 xDAt+xZNi78cg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 9BD0CC3279F; Fri, 18 Jul 2025 09:12:48 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Jul 2025 09:12:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220321-202145-HIRPgyltJV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220321-202145@https.bugzilla.kernel.org/>
References: <bug-220321-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220321 ---
 Comment
 #4 from Chao Yu (chao@kernel.org) --- Sorry for the delay. The workqueue
 is not allocated by f2fs, not sure this is a f2fs bug... 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uch9H-0003hV-M3
Subject: [f2fs-dev] [Bug 220321] F2FS: workqueue: WQ_MEM_RECLAIM
 writeback:wb_workfn is flushing !WQ_MEM_RECLAIM
 events_unbound:quota_release_workfn
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

https://bugzilla.kernel.org/show_bug.cgi?id=220321

--- Comment #4 from Chao Yu (chao@kernel.org) ---
Sorry for the delay.

The workqueue is not allocated by f2fs, not sure this is a f2fs bug...

Can you please report this issue to fsdevel mailing list:
linux-fsdevel@vger.kernel.org?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
