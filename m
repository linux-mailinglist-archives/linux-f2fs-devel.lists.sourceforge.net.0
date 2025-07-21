Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0C9B0BCFC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Jul 2025 08:50:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NM/HR0F9CWYvjdp3wwzR3cvAZYqQTQE2qud3e/Wx//o=; b=g/kFs+ndjwXsETvgNd2g7EjZz2
	iFCNmSN7Z8IQMY4No3n1kGXu6MeZuKP+8PpWpu8Lkrc/WrcWCzJ5FpPq6jIfau5m2UvoynBfvRf4R
	/yEsfm2/ADV4t/S7FZ9/foAtNhDINkJSf7+ByDblRNyFgaAB6ctia3b4Tuny3M3INxsk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1udkMM-0007mp-E6;
	Mon, 21 Jul 2025 06:50:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1udkMK-0007mY-Lr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 06:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vyldZf9nLVlbByNMcY7PVmfQJvAqVy+OCCnMhWprHiw=; b=ltreT0wplV1GviKpKQxYssxFuH
 4CED49gDqNvIfaiiaLXMj3lY81BvQRemD2to3ZFGK3LkFFSA73ZHU1o89Yv+la77wWuf3jERYm5aw
 s9BvUv35XlYZHKelgRvPzPBtNwdohCwUQlRtzAs4UhDA++VbmoIoA8A0dJKkeEkdz8zY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vyldZf9nLVlbByNMcY7PVmfQJvAqVy+OCCnMhWprHiw=; b=HDHQt4J/WqXIBADDCt6Dir3bYR
 VnGSRVH9ikDLrAcIs9uOAyByoLdYt/h2sUGEhy2P4+H6Rtzj2ne0jnEzE9c4CFrJpyg4U1RAGU6ay
 eUyH0xZ6B7J8tK+tFpYa5TM1reMCBGKrrBgcTrNkq+bLPpFfDTBCxtKU7cD8RAQHpBpE=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1udkMK-000151-QQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Jul 2025 06:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 16779600AE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Jul 2025 06:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id B1F6DC4CEED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Jul 2025 06:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1753080642;
 bh=vyldZf9nLVlbByNMcY7PVmfQJvAqVy+OCCnMhWprHiw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AsohfXUGG6w7FUDDWdhjbTlZsEOs0mLL1odfs5TCuWMtrGjL6m9cjepEgU4xcEvWj
 mH5vBY7Q+G36UfejDm0bEHdzT2B7rVpNHCueP4W/MzU6gJZjOMOaSyOMReayE23Zgs
 gREXear+yPfKlooA2vNDkcsHGCp4naiQmNyMUkO7nMZSS1FpvLRrZALznGd1pvzhMj
 89f+H5BSLhcHIwsAetObKp1nLcRo2e267Sps7OeIY4pr2+4uGtea5WBbCl+oMxdaLC
 37dwIGktofIAAfBy/BCp6Sdkp8ZrpIL54BcAxsvzGAxMsz/IF69PdsrM6GqHmSGG25
 3CKIcKk+iErCQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A0543C41612; Mon, 21 Jul 2025 06:50:42 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 21 Jul 2025 06:50:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hy50.seo@samsung.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220321-202145-sg6cp4VYtG@https.bugzilla.kernel.org/>
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
 #5 from SEO HOYOUNG (hy50.seo@samsung.com) --- Hi, I uploaded to mainline
 fix patch. But I do not know it is right.
 https://lore.kernel.org/linux-scsi/20250721064024.113841-1-hy50.seo@sams
 [...] Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1udkMK-000151-QQ
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

--- Comment #5 from SEO HOYOUNG (hy50.seo@samsung.com) ---
Hi, I uploaded to mainline fix patch.
But I do not know it is right.
https://lore.kernel.org/linux-scsi/20250721064024.113841-1-hy50.seo@samsung.com/T/#u


I thought of another way, how about below it?

How about it to change "flush_delayed_work" to "cancel_work_sync" or
"cancel_delayed_work_sync".
Then it will be wait until writeback workqueue done.
And "quota_release_work" function will queueing to events_unbound.
Because if "cancel_work_sync" is called, the second argument of "__flsuh work"
is called as true, and "check_flush_dependency" will be return normally, so it
is unlikely that there will be a problem.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
