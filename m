Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3229C31CB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Nov 2024 12:36:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tA6FN-0003tA-Ei;
	Sun, 10 Nov 2024 11:36:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tA6FL-0003t0-Pf
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Nov 2024 11:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cQ1TCaCutB2lneZQkCiDuFSVI6ZoLtgRG0FxpFvg0bs=; b=FjOAc7/vpmoTxvR3+AOL6I0Zci
 cx9lzWyPLGB0ZDHjSKN7Yl9Cp6b6mpfKfeZO3W34ZqFi9ZHq0FHBWT3vnLRh7MeF2DDepSBdJADGH
 MkhhsREhYgzw2GResObSaa20hTr+UKjrspeFrXojatoAd/UnFE5LD0s8CJQJ4+2VsVMA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cQ1TCaCutB2lneZQkCiDuFSVI6ZoLtgRG0FxpFvg0bs=; b=h1VHrmoRrwQlQZ5ScPFvrOvo/M
 q8iIyt84pG6shozN5+8Ic0ED8lAOmg3avz5Lr7R0juTmD6PbHIauhHgvBcKZfh18lKuYI1+WcIEle
 86/ZyyxcjUqTbjgmJ6oFzwiH4oLbwMXVyYJTdjNFr+Vnv1FySzvCMglUPkkl5srMw9xU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tA6FL-0006Rb-6d for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 10 Nov 2024 11:36:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 52FC45C46E0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Nov 2024 11:35:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 528BEC4CECD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 10 Nov 2024 11:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1731238596;
 bh=cQ1TCaCutB2lneZQkCiDuFSVI6ZoLtgRG0FxpFvg0bs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ml+b9KjpPx2b/FtGmdZuwpYLEhG/W9UzukBUYwSeS2XzioPHP5TE8c5FadXuUEc5R
 HrvTHMhnbVwLCWb+cmIA4t/eYCkKLroM+fW0FaOScLpxbCjuReFzqqhqIzN7AFmtcJ
 FuQ1ncQTrlLaKEkrLzXiwda6ETzIk2+XcnW3sTopC/yXBpEbV3ma5fVBdiLhzTY3Ah
 TBA9+cKIsWzBV8EtoSpkNxJt5cZXmIyR57MSSST+9mNzX/9LtM468YvsJN2QEUW5zG
 jW/haJh+3ZjzfrHtN8Egsm2CAwnRtoRVw9uvP3oMnOl/kI78ue1IU/beKyXZstUzDe
 Ul+DOufx7+ddg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 425CDC53BC5; Sun, 10 Nov 2024 11:36:36 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 10 Nov 2024 11:36:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: piergiorgio.sartor@nexgo.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219484-202145-1KPk5KVlDM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment
 #3 from piergiorgio.sartor@nexgo.de --- One more thing, possibly important.
 When I create the snapshot, with the working kernel,
 while "max_discard_segments"
 is still "1", the other two, "discard_max_bytes" and "discard_max_hw_bytes"
 are both "0", instead of "2147450880". 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tA6FL-0006Rb-6d
Subject: [f2fs-dev] [Bug 219484] f2fs discard causes kernel NULL pointer
 dereferencing
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

https://bugzilla.kernel.org/show_bug.cgi?id=219484

--- Comment #3 from piergiorgio.sartor@nexgo.de ---
One more thing, possibly important.

When I create the snapshot, with the working kernel, while
"max_discard_segments" is still "1", the other two, "discard_max_bytes" and
"discard_max_hw_bytes" are both "0", instead of "2147450880".

Hope this helps,

bye,

pg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
