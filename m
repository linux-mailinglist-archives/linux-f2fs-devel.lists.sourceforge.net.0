Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CC064486B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 16:53:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2aGV-0006sz-VE;
	Tue, 06 Dec 2022 15:53:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p2aGH-0006sL-3f
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 15:53:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e4XgHQO0zjxDEjwWK1heUkk3mg/2gInZLCBAPQP4bWM=; b=BQD9+G8s00RxoP9zDXm4zbGgnv
 O6LeBiHz2w77Q2K0d/aZXH/vSM+ift9+mOlviwIaqFfK22zDMMEqEJBKbQ2qIT6OHpKIHChQ5UeFi
 YFZHemIxMmS9GXJHUdQoBXa67K9KVLWjHcUgbnOJOuZNOYeEOpNvRMFZMrz4vXbeZcg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e4XgHQO0zjxDEjwWK1heUkk3mg/2gInZLCBAPQP4bWM=; b=RnQ7HL9BzQxj/JgBgP4+pH29ll
 DxriG2mihkX48geTq28U5UOi63SxdrBNZdJ+BySxIqoTg+3XK667qb6RpQjcZImkBqYxXjOHY4Jhp
 ORdWyvyStX35zGPja8LaAmY79kzOP2yerzLlUe3fFyIe5wOZdAM/JIwCtDF0upIdaJ9Y=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2aGG-0083Dz-Dh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 15:53:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0C232617A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 15:53:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F3D4C433D7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 15:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670342010;
 bh=e4XgHQO0zjxDEjwWK1heUkk3mg/2gInZLCBAPQP4bWM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=S6Is7pO1X84Tpylkb5iJTwvZvzOPfixgA62GzrOMBDF2+Oj+i1qTltfUAp+yxbGLP
 POifcuwCDY37T1ZAYA1PJJvaspuwF6A+PdsixmemS2VNiCNjem4MrKRvFsl0+Ep2/k
 okE+HnU3yFGr+kOlM12VE7u4OI3wVBv7cyurE0QnSPssJTAgduaPBTCuURW5PWzDkK
 +wHYgiD0Oqo8hy3qunIg9Z/J5aD6Ak/nEXi3VPEstr7/6OouvClaRH8l8L9cG03vm1
 hLL0FPY5yovrYQppE/PfG3b5cc2tCiQSGKnvRuyO+i/aXavaBFIUT+FZHx4+N2PPB+
 9ta43wXih/pSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 51386C433E6; Tue,  6 Dec 2022 15:53:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 06 Dec 2022 15:53:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-ZfnVeEoQhc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #100 from Guido (guido.iodice@gmail.com) --- And I cannot stop f2fs_gc with
 [manjaro tmp]# echo 500 > /sys/fs/f2fs/nvme0n1p3/gc_urgent_sleep_time [manjaro
 tmp]# echo 0 > /sys/fs/f2fs/nvme0n1p3/gc_urgent 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2aGG-0083Dz-Dh
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

--- Comment #100 from Guido (guido.iodice@gmail.com) ---
And I cannot stop f2fs_gc with

[manjaro tmp]# echo 500 > /sys/fs/f2fs/nvme0n1p3/gc_urgent_sleep_time 
[manjaro tmp]# echo 0 > /sys/fs/f2fs/nvme0n1p3/gc_urgent

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
