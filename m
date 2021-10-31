Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEA51440DBC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 31 Oct 2021 11:13:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mh7pv-0006nJ-Ec; Sun, 31 Oct 2021 10:13:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mh7pu-0006nD-8K
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 10:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5seKTjjqrkKovQIrntUMnCap2CzGq686uETW+YP2rkI=; b=bQP74cr+3XoJTaMn+2W5eS8saC
 7+ADUYGYa6igOUgYjS3syvtEgQktbcmyPinXtbJfDe2+D4drhP5usmYvl4RC/7pTDKPkBy2jy7moD
 whK9J9M95Fkz7ArIGOlImbX8u/BOMy2QMTf7CUbGEKj04sP7HrqgH5gJlu/zIojZh+vI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5seKTjjqrkKovQIrntUMnCap2CzGq686uETW+YP2rkI=; b=fzgi/xY9q5wwdAgJ8QHEKC6iyd
 tvJ+p4fPjGhaW8skgsPipnPp4o7fwzq66CQ6ehDh3T6YJkN2ctiar2ae0GwHPGaV39AqP3KrnaN2M
 SxGE/Lv+qh4vHgF3bKwyYoGltvut+rRXzuWAOKmKeif9hMZAC1dlILP/ka4dwuVdELHw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mh7k5-0004zF-W9
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 31 Oct 2021 10:13:10 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 9DAC060EBB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 31 Oct 2021 09:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635674274;
 bh=rnVDdTD638WpYN2f6qn1p3XI7N82eTYmpDfpnh+AELI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N4IK+spHp9zGL+F+WYK18r3lMvR6nz8PlR7wJJXaw4F68435/git1y8ZT1E0JfU96
 rz5q1A4TaQKYqqmwofjYUWBus4mKmgmesVuCxYynJWikC2WmFlL788tKzOJFxShm6A
 qgKY7IolHT9dmo/jGY/AK1KBbtA8gW+iAA7uTQbKdOtvvmDFjc6xslmAXKozF/KQ0c
 xpsm0uyynkeHp2ytZ2g1LyZ1UZ99qpCkB5c85yzI9S9dxet9FOOWdC8Y3X4DsSlU5w
 RRxUm1+kzUBbPrfVeGcp/WaLBjYv+pcOm/HfmLYX1RqJuYB6gQW7z+cFeD2usI5AH0
 7/DTCFmi/SzfA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 87CB360F12; Sun, 31 Oct 2021 09:57:54 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 31 Oct 2021 09:57:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: daniel.santos@pobox.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-214895-202145-jKkd5EFh4I@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214895-202145@https.bugzilla.kernel.org/>
References: <bug-214895-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Headers-End: 1mh7k5-0004zF-W9
Subject: [f2fs-dev] [Bug 214895] F2FS BUG: KASAN: stack-out-of-bounds in
 d_shrink_add+0x17f/0x1c0
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

https://bugzilla.kernel.org/show_bug.cgi?id=214895

Daniel Santos (daniel.santos@pobox.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |daniel.santos@pobox.com

--- Comment #1 from Daniel Santos (daniel.santos@pobox.com) ---
That's a 3.5 year old kernel and 4.15 is EOLed.  Can you see if this bug still
exists in one of the current longterm releases, like 4.19.214 or 4.14.253?
https://www.kernel.org

When you have a bug like this, it's always best to check to see if it still
exists in a longterm branch, because bug fixes are regularly back-ported to
these branches.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
