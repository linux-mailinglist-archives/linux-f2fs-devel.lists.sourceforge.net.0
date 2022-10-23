Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AE06609168
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Oct 2022 08:12:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1omUDU-0000IQ-P0;
	Sun, 23 Oct 2022 06:12:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1omUDN-0000IK-4d
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 23 Oct 2022 06:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Trk2b8TW8AHrVEuypU5PP+Po6n8aWlYJqHNNRr9gIAQ=; b=nNuazmQaHR/iT2o/0LoIdBGe2v
 t5Ca3l6A9hfPAlKPyhmIhPXyOAWhmJhoIcbUhobtqt2del8iXHR3WIouR7JLBN/LtgOKbsVciqrYH
 cmD8OXn+oewiKWQNmNnJLjEhI3gFNQDKAoKukeLNLlW3e6t4jE3y+51SwGUSnzab0JwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Trk2b8TW8AHrVEuypU5PP+Po6n8aWlYJqHNNRr9gIAQ=; b=OfvGmrwyzAc8zOuKQ4oUlEGIk+
 13wuxqcD3DetQUdsoLpGSqRCPXdXkcqLSIAmMceQZ2boivOj5zyhDLNuM/tsixuHYwexdOKLS3z2o
 uBsBI8jnN+XjQ6OZjlABeficTsQcu+OdsuHnxZfW9xyTPM5pufunPLVbAmEZvN/xrzXg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1omUDI-00ENNR-Os for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 23 Oct 2022 06:12:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 88755B8006F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Oct 2022 06:11:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4956CC433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Oct 2022 06:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666505503;
 bh=Trk2b8TW8AHrVEuypU5PP+Po6n8aWlYJqHNNRr9gIAQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Jl9PS27fTDjF2fmdHNFPjsnsfA6Irs5VkuYPJXBeKVrVPNopVxcLXkC8Or1iaXI5f
 YT4J3SNjcq9uxe5eQK81bFMlXfAE7FOCeGVvmY+q+AerJm82nHwyFLHV794vy3q/AL
 DVDv6cOSHJoKGYNvHXyn7MW5apV1jNBCHqPycEzA80IcZVU76O5oWw3Egag62hsBxC
 LNRRfRRz8mzdZoRhtefDAa3SlB8VQAOuxjsR7a7SlM+2geXU6Z+xrWowpLDMU0cECY
 TCqRGsA7UQNjU1f/1QRTygR2ssqkvji5rdmzXmzUECztT4TetFeWTVmr6TCdXCT9d/
 2Yp7yq9L4vXYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 33191C433E6; Sun, 23 Oct 2022 06:11:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 23 Oct 2022 06:11:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-nxQxeU9B9J@https.bugzilla.kernel.org/>
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
 #66 from Yuriy Garin (yuriy.garin@gmail.com) --- (In reply to bogdan.nicolae
 from comment #65) > Unfortunately 6.0.1-arch2-1 didn't do the trick for me.
 I'm still > experiencing this bug, [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: archlinux.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1omUDI-00ENNR-Os
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

--- Comment #66 from Yuriy Garin (yuriy.garin@gmail.com) ---
(In reply to bogdan.nicolae from comment #65)
> Unfortunately 6.0.1-arch2-1 didn't do the trick for me. I'm still
> experiencing this bug, especially when my laptop is coming out of sleep.

That sucks. I really hoped that it's gone.

Well, when previous months it become unbearable, I did this - "palliative"
workaround:

1. Read and try https://wiki.archlinux.org/title/Kernel/Traditional_compilation
and https://wiki.archlinux.org/title/Kernel/Arch_Build_System, especially
latter.

2. Using "Arch Build System", apply one of the debug patches, mentioned
earlier, e.g. #62 - the good thing about those debug patches is that they break
"dead loop". (Or just edit code in data.c - it's a couple of lines.)

3. Replace kernel by patched. Reboot.

4. On every reboot, before mount f2fs, run fsck.f2fs (though, so far, it never
reported anything bad).

Do this after running Arch 'pacman -Syu', when kernel was changed, ~ once a
week.

Once you got familiar with "Arch Build System", it takes ~30 minutes.

(Naturally, stating the obvious, save your work, in the case if you loose
computer.)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
