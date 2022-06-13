Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 244B4549D67
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Jun 2022 21:20:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o0pcH-0004mh-Pi; Mon, 13 Jun 2022 19:20:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o0pcD-0004mb-07
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 19:20:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QIv94Id49FtyioxtenKuEiM82kJLXpdWaw7q/lqoGtk=; b=B1BOMZLVNlhPS4O1lJiHWZhcw7
 GUiehrSKpJ6QjTBhFI0btjoArPjdUCXmg5h5nXVRXWfTszZjO4K8Y6kT3YzHMH6kZna08BV1/u3cB
 00OEAaZd4fO69YpsPKkbmZm8A0qLzZYCjXmbry80AXoN6v5se26cvIishh0hwJ1zQ1BM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QIv94Id49FtyioxtenKuEiM82kJLXpdWaw7q/lqoGtk=; b=e8AgwH9N9dtBm3Fa6REMbe8FXc
 Z7dzUISOta9ACcxgAomg9lqBvLyIXA7FsvruwP04wMnX9mLQHsRou+eYsp7jsO7+HMhk837t0UvI9
 hseXUfeB/hUS5E4HUQPbLeLkBaWUwmcJ/07gIMRrr6Eshqni34oIaDPA3mJVEIjzZ/nM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o0pcD-000UFF-42
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Jun 2022 19:20:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E7178614D9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jun 2022 19:20:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DC1DC341C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Jun 2022 19:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655148034;
 bh=QIv94Id49FtyioxtenKuEiM82kJLXpdWaw7q/lqoGtk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NYcxKE4lWZMRW64kV0N1irM9frwAzCoNJi6+vkv6DMG7hqFw5VI4TV3vYdfuXwAyg
 1Y2TfWE4x4fXJpcYZgzFOf1Rny6IdT0atwKg9re6reZCNE3v/aZ8+EZ6rc+hFMBMCI
 kvMCtBn+cAPtIF2m9aJIDUyV85NbpVW6axPWS+M6MwPNyIErW5VFs4x7fo/TOJ5j2Z
 8rdmdscJCEFIS/0MK/3d86Xz1KKNIa/41rYNTThxHUujlTeFXLHalNjZYO/FgnZDZ0
 AUn/2dmZuzkQ57INlNMMUacZx3dmkEwYzeA4HIaJVEgtXkzFwGRRzseVChVxSdSz6O
 sp/kwjaG0HKXw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E1109CC13B0; Mon, 13 Jun 2022 19:20:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 13 Jun 2022 19:20:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-FwYLhaQC4j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #22 from Guido (guido.iodice@gmail.com) --- the bug reoccurred today. --
 You may reply to this email to add a comment. 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o0pcD-000UFF-42
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

--- Comment #22 from Guido (guido.iodice@gmail.com) ---
the bug reoccurred today.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
