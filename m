Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6BFD6185BB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Nov 2022 18:05:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqdez-0005bE-Fv;
	Thu, 03 Nov 2022 17:05:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oqdex-0005b8-GJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 17:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7JxtKbRIlvBnYf/mq/cTZT0MHBaYtRvjzVUZ/7J4KLE=; b=DyFDHLbDxN0ok1iFVwAN7kd8Oq
 SvgZEIPN90SMlDduyQlWZRlWFQGsDxcV6dB1Qw5el+L/gNJxyI7y7SxOig6j0PxZof/6JnET+RXEP
 u/rIcaeJuwKNobrCcU6nECG9NXIe2A+jLe95sNnV/BLw1+AfKUbvXWytGTkTcOk0tjPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7JxtKbRIlvBnYf/mq/cTZT0MHBaYtRvjzVUZ/7J4KLE=; b=WtKvZf+rFfjp7opv7jldjTMAFG
 A1Q/EjLXm30pzUhR83laa7+DS/++es43qFyctxdxLprba1Mbz57NhM+XsMzfKkQZKofXTpv2AN1yQ
 zLqLfSv3n6+ymjod7EBZ+O04UV4ATlg/62bQjAeFgzr3Ux0Eqt1cm3KrMfYblNrzgyhk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqdeu-0003lu-EP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 17:05:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F13E7B82965
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Nov 2022 17:05:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90EFFC433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Nov 2022 17:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667495132;
 bh=7JxtKbRIlvBnYf/mq/cTZT0MHBaYtRvjzVUZ/7J4KLE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cp8O7OcLi4Yt6QlGaLalZixK1+uHOSyyHKUrPm2trFzdjx1cmchOsr0bM1kM84aav
 rRqY7N3UfMVP8Nq+nnf45ielOuxBWc0GG5M5bY+NnPuiYBzXaUaTTVUD1/CJmwL4r6
 a+1Q0E+ytzNpR90HNYGn6c0COxXMYI7W7SjX2kjuHOO4nnfP4JedpHaTr/HgGUZzvl
 CHmbeyJ6iepnK4vwsjBdgflYRN32BdWb0fMHQZsXRLdF1szFqa6skxddmdFznVeaIn
 fD2n23usOUyprCW9tbvCoQh6MeSzK3YJx0Sve5OJbUIrRAJzixJu3E1QGs97dh6Hj8
 mpPazGcFLBnjQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 79362C433E4; Thu,  3 Nov 2022 17:05:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 03 Nov 2022 17:05:32 +0000
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
Message-ID: <bug-216050-202145-yV0fxgCR54@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #77 from Matteo Croce (rootkit85@yahoo.it) --- Great. If you do a bisect,
 you will find the problem in, let's say, 14 steps. Really worth a try. 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oqdeu-0003lu-EP
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

--- Comment #77 from Matteo Croce (rootkit85@yahoo.it) ---
Great. If you do a bisect, you will find the problem in, let's say, 14 steps.
Really worth a try.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
