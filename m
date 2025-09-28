Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEF4BA7150
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Sep 2025 15:55:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FGqWmhaegY5hK+rgACIbhPuzV1FcTPyr+wy7te1kPI=; b=Ch/A6GQsjji0yFcuD1MFa/sKhd
	pgm+SsCc30xltcna4Xc9YVUfCsxqzFTp/Lz/D4nB34cqNbrtSHjWXUPN5wANSDJI+fkNpHHlSTnEd
	/MTnMDR1DxR2Gd9l70pERhBpwQXNa84k/xFwO6JB/2KAIFnksKlOK71IojeVAOLwEJf8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v2rsM-0007ZE-Uw;
	Sun, 28 Sep 2025 13:55:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v2rsL-0007Z2-1V
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 13:55:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bblf351qLtwjEXogx9V0dlZLo74JLMC5KOh2jk4Sj8Y=; b=iXM3th2hgkfX9DBET8Pt3fPiOk
 faRbvzvSGnym4i3zj/QbhPOYqwpFYIJQ9muL0neItYUhix8fxNlE0E0zMTdd8i8IdyKfzTeGn6ILX
 vUJ9bK/Q7ZwVHCMuvN2X+6RWfzGwGm+jyCr8YDhQ/vlqQmCRzftxpj2wggLo+jMiQ4wY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Bblf351qLtwjEXogx9V0dlZLo74JLMC5KOh2jk4Sj8Y=; b=CPY98dhIrPzmb/R8G/gdX9itDf
 av8WGy1qzKAHkpdmftnuJ5DlOYZH/Kx6HIWMFVOg/Y8wqP6ETCN9UqxEvTM/CT4shr4Uue5v9DKRm
 j39t1yOqAoO7orT1AGf7LTQEfyaFT8l5tcDT77XOYJS6pavsvnqj7B58JPpjW4OoR+gE=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v2rsK-0005ZT-JN for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Sep 2025 13:55:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AFF6437FB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 13:55:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1935CC4CEF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 28 Sep 2025 13:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759067730;
 bh=Bblf351qLtwjEXogx9V0dlZLo74JLMC5KOh2jk4Sj8Y=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GTdUFdB4/BeZXAI5e1uLJJOCgRQ1u+Iegfo7uID0FbKimgLHvzrxiv8/hLyQfCow7
 Yner54JyD9UgB7ZK6cUl6FgHDCt4VJKxrPcEVneNLpyYrpp2Tuj0F0rhcUit3yLfmZ
 7lyrwYhUP5dQJcVx3zfQlcbitUZt+QEJhm3J70a2af8A0Ap2KE/+d7DtvApaHK6mS2
 LMzWGltHWkrraqODBTN4C7DJ8cjqNk0apPnvK+Hf6efa9RDLf44hJF6nP1yXh015TE
 VYZ35Sjl1x7fH3iFhqi3zF2dng8uX7fhjoyEbyPiKx9rnO6Vgwubba3FtIN4AoIH9f
 xWPDQzpI0G0hg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 10A93C3279F; Sun, 28 Sep 2025 13:55:30 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 28 Sep 2025 13:55:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: JY.Ho@mediatek.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-HlRCkpgPLg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220575 ---
 Comment
 #13 from JY (JY.Ho@mediatek.com) --- Good news! Thank you :) -- You may reply
 to this email to add a comment. 
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
X-Headers-End: 1v2rsK-0005ZT-JN
Subject: [f2fs-dev] [Bug 220575] Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
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

https://bugzilla.kernel.org/show_bug.cgi?id=220575

--- Comment #13 from JY (JY.Ho@mediatek.com) ---
Good news! Thank you :)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
