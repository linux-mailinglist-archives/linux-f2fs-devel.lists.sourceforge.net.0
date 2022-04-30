Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 967E6515E2F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Apr 2022 16:25:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nko2c-0006Jo-0K; Sat, 30 Apr 2022 14:25:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nko2a-0006Ji-1B
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 14:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z7jZWU69Z6v5zurEQPWqcbbJNA272EqA7IS8lYV7OSI=; b=FlR8UulR/yvFFWsUUxamktKKsy
 zWs0EQX+wm2WZeCyzaIfuQ3QOsujoJmwdEGeWaetl4Hx8rC6uCfqRRMdxpEdG059r6CzWU/Dok9OU
 k0FiL4pXvjCjEy1qZUzfo9OA62fP11dVO2F76pPwogzx9WRmek0EJd4y2k7pqaal8pMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z7jZWU69Z6v5zurEQPWqcbbJNA272EqA7IS8lYV7OSI=; b=XCO0loCEYsVzal795ZGJ3/OdSu
 lC8Mj3kED0xoeMyp84nbvMZbJlFxrpy6orLEERj96TdpJSceLJRRw9lv9qZQX2rOIteMx3tHRgDBZ
 vv3U/029QmUMMDR35CCRzd5zj8w/bexvdujR3HeqOkCUWMZVaT2gYkPnuOswdOnMuQu8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nko2U-00042v-21
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 14:25:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C5604B8308E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 14:25:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 88ED2C385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 14:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651328729;
 bh=z7jZWU69Z6v5zurEQPWqcbbJNA272EqA7IS8lYV7OSI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Q0MzhmWIUT9CS1s9Z/4LTWv6yDQJSncMXOpHuVhkjyPlPFUheEXh1zFJfWvgnih0l
 FcR0ECkoYf5Djp+fVcy0GFsqDfjA2JRub0Ig9+WGu0dAB54BeBTssupabjKn5tDhVs
 W2UNpaHWM01SBaCY9AElCxITod9q53KEhvTS9PTTfbt5cwlcP3ZY0QZS00xrViXD1r
 5/9huc9DoFiN+fYXcGTk5QsE5uEX9g1D5j3ZUVVFhgyhTfLWycbTFaBNzV/LxDELG9
 4isR0GK+C76S99funM19IChD9hTd0ClFl9IyEzhd0PwGRXUzBPhNGzPCgTTNJ1TxyO
 k4VEjkB2WcVqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 6D957C05F98; Sat, 30 Apr 2022 14:25:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 14:25:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215904-202145-l7b1J25aFC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215904-202145@https.bugzilla.kernel.org/>
References: <bug-215904-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215904 ---
 Comment
 #4 from bughunter (yanming@tju.edu.cn) --- I also forgot to umount the
 image... Finally, this bug disappears :) Thank you very much! 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1nko2U-00042v-21
Subject: [f2fs-dev] [Bug 215904] kernel BUG at fs/f2fs/inode.c:825!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215904

--- Comment #4 from bughunter (yanming@tju.edu.cn) ---
I also forgot to umount the image...

Finally, this bug disappears :) Thank you very much!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
