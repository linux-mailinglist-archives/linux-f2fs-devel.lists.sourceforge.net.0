Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA568515B04
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Apr 2022 09:34:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkhce-0003zh-VC; Sat, 30 Apr 2022 07:34:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkhcd-0003zb-Hg
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 07:34:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=28sFm3rnn8U5wRgsZF5o6edNquHW5ulOgPm5bRV84zQ=; b=MgKh42hfTAr1XOTlU8jBeSMuXD
 jN6atPDQ8s7FoJ/o8L/Y4mCbr9I4CPJ7GYHnBn7o7WudtDPlTWRfxNVLHEKyhZ8X5ViuL+ueV3q70
 RvcvuFk+9kGNSh0shuJKokR1LgeRlS5G6j3N2hzXlJnH/eKR5MXLgB7MPL63NeRLBvdQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=28sFm3rnn8U5wRgsZF5o6edNquHW5ulOgPm5bRV84zQ=; b=gWVcZ5pP5ymQdtpYULV/OJHOsk
 yDGReII/EeayZXhOjDyuUTuZ2yRtrt1fyNZUzO18bkEY/GE2IJsKl7n49VKRGPnUOzJN/Jm1nrRbJ
 NtF+c3lwSFHKTPUNtpZ5WVqv8+rfWAvYFPgQZK0kv9FEOirDXJ5sZaHQlkYVjedhNMHQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkhcd-0008W1-9g
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 07:34:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9A92A60B5B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 07:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FEC9C385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 07:34:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651304065;
 bh=WZVZ2CI253MrElMFFVOnnn7NpvRvbeQfQHragTGayCA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RB3El4e5vLMwOa8QCU1Ohn3hcfHN6k7gxXx1aPF1tV2udhtJcTQvyCkxg4/BEf6hV
 aCH3iimM6+RFsyBLTts1E2FYZnhhjOD51VyhCbqJPfT/47Ms28SlTwUJX9VWT/Jg4g
 T06EmqP1NGi7bmfvQj0p19RNBhr6nWP3oXAmyC5wGCiEO9qNS1xXilbWfo8rcjyvji
 JOwcsnxHc3IpuLKd7h4sWVVCqD9S1VqSNb2AAmfbAqztl8c0QKeA72heloeOiuTsXM
 kwQ/wL2Hq8UOvjhENQCE59ne8CleRwx1qDbpAER5aAcI07U9vkwjuZJa7jWjm0f0Ne
 YWczP+YfLaYng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D87C4C05FD2; Sat, 30 Apr 2022 07:34:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 07:34:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215916-202145-lpvg6SllsT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215916-202145@https.bugzilla.kernel.org/>
References: <bug-215916-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215916 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkhcd-0008W1-9g
Subject: [f2fs-dev] [Bug 215916] kernel BUG at fs/f2fs/segment.c:2560!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215916

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
