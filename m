Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 677FB400A7D
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  4 Sep 2021 12:18:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mMSkF-0000xR-Gf; Sat, 04 Sep 2021 10:17:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mMSkD-0000x0-LY
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 10:17:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5oLhgTS1dsq7tSQVjoHijWrlyEKohl/1FG4lJl5GAU4=; b=muquBGe80mNoKof71+qm2Ml8k8
 dWImBgf9yNmYQzcTlIoYTko/EYWd0jvEa9aj+34/IPkJ7myj9HnpOYIjbEvBqkpC/C5Z7ipmCmF+H
 UKoe7YVEcwfJpPKaPaewgsRpY1/l/YVczkXXLv2YUJtP1/S8r1vq/vgB463468wx+VZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5oLhgTS1dsq7tSQVjoHijWrlyEKohl/1FG4lJl5GAU4=; b=LyXnnjLtsFws/s+TW54rYKvfWE
 Nqyf1CUI05IEe8eec3o8/E8V52NFrmzq7o0IuLguao0voZ3lEfwpmiTdAkxe3srx8jOm1B42kMYIG
 vVHmTkH8rr5Oai1PGf2yPq/E7RkUvzJH2x4GQ5jJgVhfja7iI2nYPzCD2gku/t1V0B8E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mMSkD-00EPjB-5Q
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 04 Sep 2021 10:17:53 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id B8C8461054
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat,  4 Sep 2021 10:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630750667;
 bh=5oLhgTS1dsq7tSQVjoHijWrlyEKohl/1FG4lJl5GAU4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VlskMHJKdOLdQN4PABZGkGFOEgd9/Df1rjVlcMPQ1vrZxUszpU19cmj+Gcj1pzlEs
 ks4K0W2eWaqBaHGmExO9S76llmx7sdb6KG+TLDSznJTf7sFN2tvI8D1OEqxtAyjTsH
 VW6+KtYkN7K1nJvhilVqt2KADEn9WQgkhSQk23H7igDhIwnLDcOgwc+/Fj5j4U2KG3
 aNiTTRyY1ZGYBT1xBZucqfxHXz3SZAIEZUQyMjXVf6w4RzJSzCaCx9JG+r1sDT0U3/
 IgbnjVfxg7VCWxL7DXC/bjQQCwDZ16etAaoc1ixVbySWveOJ/Z0dG/x7rz5Rd9Y87F
 Kop7rNoienEhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id A3D1660E99; Sat,  4 Sep 2021 10:17:47 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 04 Sep 2021 10:17:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leftzheng@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213877-202145-P9ucNwE8wX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213877-202145@https.bugzilla.kernel.org/>
References: <bug-213877-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=213877 ---
 Comment
 #5 from James Z (leftzheng@gmail.com) --- Could you please provide an
 available link to this patch? The above one is out of date. 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mMSkD-00EPjB-5Q
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

--- Comment #5 from James Z (leftzheng@gmail.com) ---

Could you please provide an available link to this patch? The above one is out
of date.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
