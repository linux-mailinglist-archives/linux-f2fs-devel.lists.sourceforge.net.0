Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2BA3D729F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jul 2021 12:10:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m8K2R-0007Ed-Oi; Tue, 27 Jul 2021 10:10:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1m8K2P-0007E9-07
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 10:10:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mu682dK6zplpV8sdesmPF8qYqwgwthVlmW7CRgs+tJU=; b=mSYeOQgXHP6xZk3ZAtQeMOD8W5
 xmXweE28U5O9RdGAkiaTgmLNAvTtDyudN4hmmbkL3sC9hqwSZA48NiwdjJXDQw0TgV04ophY9skkN
 xXQt+CkcFH0RUHE/RXa9gC/SJ8Uuv0YyxeB7K6aOGBaYTgrsLKtJyVigoh9Di9COggxM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mu682dK6zplpV8sdesmPF8qYqwgwthVlmW7CRgs+tJU=; b=DX/2y9XcR7uHoiD6bzM5SU0MX7
 yQ1nsmGRl7XF/jiZZ7UGmdglsVB0I3Wp6Q90IRzgPKAqHACmj5Av566CEg1a7yUn+r8k7sT814SZU
 BZM1pVrueJ4yPnpHn/2ScCbw3mpUyVPLicHgwkethqA4aNhjcWDvQwNjv7v5Blqn8c4U=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m8K2N-0004AY-P9
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Jul 2021 10:10:12 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 567DC61414
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Jul 2021 10:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627380606;
 bh=a+lyNxkzb7qWs/2K0r/kyKVnno4/3UOVoUrYa29A/s8=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VJ1yGDHEiKmjSdXuJVqPx39g8PsRXE0nazlo++1cyKEImUZ0cGGrJDiEMGcCIWSUB
 WIRHLcUYV2S8dq/e/7vwBq38nFeSP9YVl7PcOyfhHRAeqEyWU2+rRdLt5+XyAZTjjY
 /CPccs5BCAhdAaPPznIzH4mhVFrCnZvqYZNR/TTlt2RV+R6DeXbhRGsMz35Xo6Sdqi
 zqUIjn/1XY9Tt9dWzGWQPOeti9gAQgDzuqmNlCSr88esUPxcgwCuaOtOhSl+UsMD/v
 18StGaeaB9ya6giKfGIYg0zyqiv0uW1G40NoGb1R4sL2GZFISzn3Jcof061nLH1oZw
 8IjPbXrc70OWA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 4577A60EB7; Tue, 27 Jul 2021 10:10:06 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 27 Jul 2021 10:10:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leftzheng@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: keywords cf_kernel_version
Message-ID: <bug-213877-202145-lZ9gqIWYxe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213877-202145@https.bugzilla.kernel.org/>
References: <bug-213877-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m8K2N-0004AY-P9
Subject: [f2fs-dev] [Bug 213877] Mount multiple SMR block devices exceed
 certain number cause system non-response
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

https://bugzilla.kernel.org/show_bug.cgi?id=213877

James Z (leftzheng@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
           Keywords|                            |trivial
     Kernel Version|Linux DT1                   |Linux
                   |5.13.4-200.fc34.x86_64 #1   |5.13.4-200.fc34.x86_64 #1
                   |SMP Tue Jul 20 20:27:29 UTC |SMP Tue Jul 20 20:27:29 UTC
                   |2021 x86_64 x86_64 x86_64   |2021 x86_64 x86_64 x86_64
                   |GNU/Linux                   |GNU/Linux

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
