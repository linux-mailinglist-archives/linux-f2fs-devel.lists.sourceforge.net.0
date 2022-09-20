Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FFD5BEE0F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Sep 2022 21:55:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oajLI-00016S-Uc;
	Tue, 20 Sep 2022 19:55:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oajLH-00016M-LV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 19:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q48FyRDG14zFg2wGSeveNDZ51FomFzUmDcxlAB12/bA=; b=YgaT4gMiZ/ANW/0XHPsvoFFqLZ
 9j6LtBxDUFQN+GPEbinneu2NndESTE9c5hT14HRw9B2KFMjTtzQ0m7KlYbFbP13mh6gNbfSV2ams7
 gie++gmNbVWDiIegmGwjVgkfjU0aJuMYk+sxm5ZpleoQtlaxNgVTr0pWiyzD8l5JBy4Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q48FyRDG14zFg2wGSeveNDZ51FomFzUmDcxlAB12/bA=; b=TbBx4Y2DO/F2SRG6Nw6Oe1k4kY
 7fNiPyztTQ8SgnpiHoXH31hbLjjQ8ndIf4UDyI/t+fkkNjnBjCHcccHCe3pJdXhIvf0c4qEYx7K/N
 Lgw3HS3ZnfBS8RQ9grmo+6gHHyGmD/GnMFjpoN/+QkDm6puLasv6XmwCnHxKpQzvJZLg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oajLR-00EmbQ-Tx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 19:55:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D5D7AB810D5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Sep 2022 19:55:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90209C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Sep 2022 19:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663703737;
 bh=dRKM8Eqa+u+lT1382uOWIOFtuJeWYTaNyNWnBE8ZGSk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ny0d3MfapgRBFmaHBOak1O8oLZvusFwf0XsRTgm17Wiii33b8JFUdz6fd59wlfRU4
 M5GMB8cRIHyNfRok5fGhkvHw5H4/FZ89FNKmPPc6qDByGEsrpYvq8ircO+nMFDNeP6
 uAuliDboQdAsC278zEIIIzlIRG9Et9Hwpef+wsJ+kEKjwumW+OJG2rtsPdfH96+Abw
 EHlopS70c8lb6rho1YPiX/GLD6vkh1Wl6qZLk9fh36o0JswxJYEm/kkfMOP4ryEXwg
 0NrlPOEm4Jctl7T3eO8uUtEh6htNsyd/135GrvmhNG5I85m3J4NAQmFMsuHfhAvqtZ
 1xlNBNbR5Rhtg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 76ECDC433E6; Tue, 20 Sep 2022 19:55:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 20 Sep 2022 19:55:37 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-iosBGP6Hku@https.bugzilla.kernel.org/>
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
 #58 from Yuriy Garin (yuriy.garin@gmail.com) --- Created attachment 301840
 --> https://bugzilla.kernel.org/attachment.cgi?id=301840&action=edit f2fs
 debug patch log 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oajLR-00EmbQ-Tx
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

--- Comment #58 from Yuriy Garin (yuriy.garin@gmail.com) ---
Created attachment 301840
  --> https://bugzilla.kernel.org/attachment.cgi?id=301840&action=edit
f2fs debug patch log

Applied debug patch v2 to Arch Linux kernel at:

3245cb65fd91 2022-09-14 Linus Torvalds Merge tag 'devicetree-fixes-for-6.0-2'
...

I believe, it corresponds to f2fs master, right?

$ uname -a
Linux bonobox 6.0.0-rc5myarch-g3245cb65fd91-dirty #2 SMP PREEMPT_DYNAMIC Fri
Sep 16 23:30:54 PDT 2022 x86_64 GNU/Linux

It got 800 lines of the same address:

f2fs_get_lock_data_page i:1000, mapping(0000000018871cc7, 000000008a3c4185,
0000000018871cc7), ino:370194, i_mode:33261, flags:2147553792

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
