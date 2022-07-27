Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 671E65835A7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jul 2022 01:35:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oGqYh-00044k-Bv; Wed, 27 Jul 2022 23:35:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oGqYg-00044e-Cw
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jul 2022 23:35:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6rUMFv/pIlZlzh/TPUp9iD8p/t//B8yPZ3dQQqAOMwY=; b=fBR+BqPVGMTbfIgvLkgaE4J0Jk
 knk64KBU2SQk9LGQqzPLbH35H5hRwSiGV8vAuqy/EaElzes81jtcBmEgFYa3Jf2Ghtw3BkSPvR36H
 R8pyvM5Y8uHAwBCRM50PwscQIO/VKfVin9PwdhtEsh0ryaX/q3Wcl5llnNvoO68SSePU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6rUMFv/pIlZlzh/TPUp9iD8p/t//B8yPZ3dQQqAOMwY=; b=kG8+gCnlo2BLNcSc4SUwgNcZ13
 b5VgSJzfU8a319t5zKCUL2nrt3tWPFhgqIc0GuIP+g4ckFuI/dHMIeMifzKpnGIE+bCQqF5pyIviz
 THFlRhiLZhn0BrMDnymKHBLfBD2I96QgzYVaTm9/a8XjeCkH+ulRSRzcEgdwXd2IK5VI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oGqYb-0006jD-On
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jul 2022 23:35:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 79506B821BD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jul 2022 23:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3131EC433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jul 2022 23:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658964906;
 bh=6rUMFv/pIlZlzh/TPUp9iD8p/t//B8yPZ3dQQqAOMwY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MNaH1fwpAeZW+S9/foxVBv3ApW5pKIiG5u/3OXAj97QumALxFKXOc+hprMoEueWIY
 rF9zzDXg6mC9Hgk7JnpHI8z5rMqejn2AjDoT71eifwNedhzOIyFe2xJ6m+Up4a6oOB
 nk1hnrZluqplLwpTx0YVdqlGxl1qR2a3SaZ74MgTvkZZ701kD5kBF0A+PtSMHFEaNb
 /x/o1QO2YAFe/9JBj7AB+2VRCPXt9pFC/TbfNjoRgs9Wd2N0VhzlOvQBsOl7mZBaq2
 40yqwYT2KMbS4zgWG+sxkKH419wq73h20sdmsSu9zRlI3+ls10s4XR87/Ipx7r4Mdr
 NtEeUOo9CjROQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 160AEC433E6; Wed, 27 Jul 2022 23:35:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Jul 2022 23:35:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rootkit85@yahoo.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-yIdjCY5BUN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #39 from Matteo Croce (rootkit85@yahoo.it) --- @38bernd_b I'm not familiar
 with the code, but I think that the patch only adds some debug output 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1oGqYb-0006jD-On
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

--- Comment #39 from Matteo Croce (rootkit85@yahoo.it) ---
@38bernd_b I'm not familiar with the code, but I think that the patch only adds
some debug output

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
