Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E31AEB09C4C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Jul 2025 09:22:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mUo12ZsSTYG8giyZw+Kln4xr5n/yXqULuzoVOBKr6Io=; b=LtDRcGBQ9KtyZZ3TSPDag13kbs
	HZY/aWB5EA/cEq07Yo65622+wQxVtHpoqrf17g+ijMG4Je3SOPwH1pxGq8jNtlrpGCyXhOcNbq3he
	Wx7cb1bAE8PuVijnkW0FG1VBGPuAlkyg8F/G9oRXXL5QEF1W9qJyIeeUW4B1JlsiUq0Y=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ucfQX-00071c-C9;
	Fri, 18 Jul 2025 07:22:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1ucfQV-00071N-V3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 07:22:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aSl37PZ5OaaAOunb2ieb5zyjM3MWZZx1w1E7CgCHwg4=; b=lgdKcorNqIM9C6/5Oap6vEUaGc
 xUa0cftylXTi/fzVF4wMoJyL/nqMKIevy0PftDfALvezWI7gGB2Fmg2J9VFIL5Dx09DdAPO1vNe6E
 /sZ84Sj9GaFzhLnDSwmKUxOcQs0d2z6GFAYkD2k+W1yqKZpRa4eDrID4n8wzCUdv6y5w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aSl37PZ5OaaAOunb2ieb5zyjM3MWZZx1w1E7CgCHwg4=; b=gGwAvyJLivzw4MGGVnAEoUcphh
 q8+aLkrY+XZrR0dlKdvMZ5UWHr7J3Gd+qkg2UhaPS8rM8keOl+h1lVxRHfNYde3vZN/kc4LB+gpWn
 +A4wvzc4IJGlQsHckR08/aHwvP1nzJ4V1KJfmgJduPoctoqG7u3dXmBo+q8/wWcvQ5eM=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ucfQW-0008Iy-6y for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 18 Jul 2025 07:22:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 8735B601D3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Jul 2025 07:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3D838C4CEED
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 18 Jul 2025 07:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1752823354;
 bh=nU8Eudp2I2J/KnrTn/DvUYFAl21lZvEvVAi3j0JrGQI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GaS3xudW5FPE4T1yqG5sM3lgycmMqficRucOYKp2E3E6TmMwCMT5PycAwXDADDX3H
 mMAGdUEO59NTCKIVwrBsVmcofGLaqR3TsouPwXHupjy45MprLpuYTbBljQcwX++UMq
 2EPi3p4J6K/6I1H51ZrhJzn9kmae8tr6+vNY9LRIpLMgzrRrxUUTfRj+1LWr86qxbn
 eTRw6ZKg75Y1f+cSK90NoXOIBt7oBNuRdhGPZxVXzv/WB1l3LaQmuLo7kcULw/6i7o
 WKXF64bDhtX+R4jExeZPkEbnwyJmnEQclnxMSC7y7NeD1B0Jx6OyDY+6hNzFVsrke5
 HwWmFAK2kN5rA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 36A29C433E1; Fri, 18 Jul 2025 07:22:34 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 18 Jul 2025 07:22:34 +0000
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
Message-ID: <bug-220321-202145-6PBprASWvU@https.bugzilla.kernel.org/>
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
 #3 from SEO HOYOUNG (hy50.seo@samsung.com) --- Our development system occurred
 this problem again. It seems that write data to f2fs using write back option.
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
X-Headers-End: 1ucfQW-0008Iy-6y
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

--- Comment #3 from SEO HOYOUNG (hy50.seo@samsung.com) ---
Our development system occurred this problem again.
It seems that write data to f2fs using write back option.

The wb_wrokfn function use writeback workqueue.
And the writeback workqueue created using WQ_MEM_RECLAIM option.

 static int __init default_bdi_init(void)
 {
         bdi_wq = alloc_workqueue("writeback", WQ_MEM_RECLAIM | WQ_UNBOUND |
                                  WQ_SYSFS, 0);
         if (!bdi_wq)
                 return -ENOMEM;
         return 0;
 }

So it occurred kernel panic when insert quota_release_work to system_unbound_wq
during wb_workfn working.
But it seems that could not add WQ_MEM_RECLAIM to system_unbound_wq.
Therefore, it would be better to remove the WQ_MEM_RECLAIM flag from the bdi_wq
workcue.
Is it possible?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
