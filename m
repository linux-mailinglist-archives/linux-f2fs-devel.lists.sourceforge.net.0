Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D0D564BFE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Jul 2022 05:13:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o8CW7-0006kP-Az; Mon, 04 Jul 2022 03:12:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o8CW5-0006kJ-MO
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jul 2022 03:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ozYbhJvegCm6cytGI3UTEZSu2IEBrnNk35rSUt2NH0g=; b=OgzH+NvIFfcbX0oiUIT7gD24Tr
 S8TSsU7GSq8XJMW2ZuHb/km7ieeYwAMSiBKanroLOlO7L5KAfNgRaWM7I7yFhM4TQ/ITCKqnCyyaX
 DuqwD5iSxWEapOz4gvTtnfMAvv2iGwVy5g6kafnFPuiuK3hR4uoDNxW/wZ8GzIqvi224=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ozYbhJvegCm6cytGI3UTEZSu2IEBrnNk35rSUt2NH0g=; b=NXyq5rSWEX0C46nd/6s4jp6XML
 erx25aAvtE2ph/lRsNmD5BaZEGST0mkntWjnD6H6m5aAQKr2rNyFkIhcgk6XFECC0xwM9uzPssbbW
 Sw9Kh44NBB/XYM+SY/QTtDlotf9cpocx8BYBRZcHK91oeGyNnShUM46C/X4J92g1kGI8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o8CW2-0000AP-4R
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 04 Jul 2022 03:12:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C998B6144F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Jul 2022 03:12:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3335BC341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  4 Jul 2022 03:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656904359;
 bh=bvcBiPSpdY6CLGw6d93a0sA8+t/1D6Rc/XSJvENSSsY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=GB8d/Afvv82khVka6annT7AdltsgTV+KXB8wKl7Gz/D6JkqiOFQU04wyMVmftSGfG
 iiTEMtKuIaXWSE5Mqe+SH9UwlfloWXVwdbz8XlM8N6rhcldhlOL9s+0gOn5IIhYjlD
 tBZriUJJiFLQf1Epken07NJHTcNpnWJ+7I+n52OOHmZwt6OmVNWTbcUoouuo+hF8gH
 WRrN7cfc7TvF4aglSACee3n3dWgrAl10K6yD/ke5TheEK7gGFu9RPyluMpVhcgO9ii
 Fpom9g2fcIqOUmIxd5/Ii3CrW/a6aE0Ju1jA2y6I1u3qqwHBtc8QIqCr6p3SCLpBRi
 3A5rDa8Dj3hrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0EB2EC05FD6; Mon,  4 Jul 2022 03:12:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 04 Jul 2022 03:12:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mtwget@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-UKPFgsVwiU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216050 YuDong
 Zhang (mtwget@gmail.com) changed: What |Removed |Added CC| |mtwget@gmail.com
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o8CW2-0000AP-4R
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

YuDong Zhang (mtwget@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mtwget@gmail.com

--- Comment #33 from YuDong Zhang (mtwget@gmail.com) ---
This only seems to happen with PCIe NVMe, not SATA SSD

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
