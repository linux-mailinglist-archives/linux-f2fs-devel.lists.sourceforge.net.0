Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE3AE471192
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 11 Dec 2021 05:55:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvuQ6-0001GL-Tc; Sat, 11 Dec 2021 04:55:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mvuQ4-0001GC-So
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Dec 2021 04:55:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RWrsRlDC/hph5kbSk4Xp3GWxFMzZ3QByMV8QVmue7rE=; b=irv62+KBNbEFg6jiIiqRgfmAAQ
 /Pqrlq0WAtb0UVLjXACMM5FM/+Ro/j1HALrH/Skh55OshjuNLIyu7RLcc+AVybTsX+J4AXaAwuSxZ
 JhPG5Mne4k0B9UnfW28OsI+RpEK++lthu+UrX6F0KLQNd420FHJjZDmy/XHSPXm6uDoM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RWrsRlDC/hph5kbSk4Xp3GWxFMzZ3QByMV8QVmue7rE=; b=m10moYijbHWdJu6AVSY03Ji4O5
 DyhFxArX38R2FOOtWRVThdXhbVezCf9GeRpTDQtvCHI5qPuVDcBhxeOzz8EbuLWX53y5VqGvfJlOF
 A+cFvfi04U6qDkLkVNId1JU6JVucwWo2Ec3bZP1/E7gr8yfDWA+v6BemNflCwsykRGaE=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvuQ3-0008EK-Br
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 11 Dec 2021 04:55:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id F0E74CE2BB6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Dec 2021 04:55:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2EFF8C004DD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Dec 2021 04:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639198521;
 bh=wbPD8XAJo/dIU+zYb5elNftWxy23FKgI07i4NnjYbJA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fManL+wwQWynCFflLGxZVgT/Vu/+MCBashXKGJrXLG0UXU5MvRyaumrP3PdaYjuyE
 p7VHpYsoVqToIFeUEQGYG6e5lYctETsP7kexLahjNX0030IYh0n2eBhxw2ztTU8Isn
 h6lj0EIOAj05bbqVREcjpTbgsWd7UbOR5Hwg4JRpZMKHocPdVMgT0o0Yo4Kyp4ZNec
 oF3LlBpPwYdFCA8ZrtEKxHF9TlRJ4aOhA3VyYiizQwD3NT8VPS5eM/VJU6kf9Gfnxi
 OlaC4PCce6FlOo0OyIc5rErrRi44w5HAfd0WJ/1eiG2PXBGS7U7PmtV8Q8820rA2yC
 BmCwBgHz+I0mQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 1D4BF60F4F; Sat, 11 Dec 2021 04:55:21 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 11 Dec 2021 04:55:20 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-215293-202145-c9TaWxFaX1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215293-202145@https.bugzilla.kernel.org/>
References: <bug-215293-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215293 ---
 Comment
 #3 from bughunter (yanming@tju.edu.cn) --- Created attachment 299993 -->
 https://bugzilla.kernel.org/attachment.cgi?id=299993&action=edit a.c 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mvuQ3-0008EK-Br
Subject: [f2fs-dev] [Bug 215293] F2FS: kernel bug at fs/f2fs/segment.c:2543
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

https://bugzilla.kernel.org/show_bug.cgi?id=215293

--- Comment #3 from bughunter (yanming@tju.edu.cn) ---
Created attachment 299993
  --> https://bugzilla.kernel.org/attachment.cgi?id=299993&action=edit
a.c

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
