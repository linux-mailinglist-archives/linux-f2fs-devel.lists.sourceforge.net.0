Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17B1D6DFCF2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 19:49:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmebK-0001AD-Bt;
	Wed, 12 Apr 2023 17:49:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pmebH-0001A6-JV
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 17:49:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wJLCTU4Wy7DD7jqprl+EG8C52wSmtJ2jlTJaxr3A9g4=; b=mtgkVo9tUmuUSvYEcDV8ckvvRf
 Aerj2SMXFSZH+HM4iA9jHAO5wxKspbBucc1NLCPbCtCg7vdIPVC9Mi8ef0LEfPhuMtUGrtnJRwneg
 YBDvuYHhJrDJQOzGSDuAVsUMogGrgLhUAzr6PzaXdv+QMN1xcqStY/hL74gCTh4tJ/Zo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wJLCTU4Wy7DD7jqprl+EG8C52wSmtJ2jlTJaxr3A9g4=; b=KWY6cf2M8h815L0Ht+uC6+F+nN
 MHiBhVkPbAZZML5ZByubfrxEgg0fMrc03fmpKGiNfG6tQui54RfMciumXbpvB9vdl9pvwWM9DBHea
 dtPBcQsb3WyxvBFeZFZ9D765wDqI384jVt+WPtJG/qxsTPlX5id2ojRkCkaNSuAxDRmo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmebG-0003ri-1K for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 17:49:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9665462E23
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 17:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 08D6EC4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Apr 2023 17:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681321776;
 bh=wJLCTU4Wy7DD7jqprl+EG8C52wSmtJ2jlTJaxr3A9g4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=RXn3S5g/poSQb2eqI0pd1bwEMVqkYvxWpJtQnzTki0y7qSUP215NVeTsGKOfCbsu7
 1diDFnzdgTNYnS4OiQQv5A0p0/f5uvumjtxWGxAXtUEZeo2lvF54X51orpt/t4Lji1
 AZLikKPZyCl+lmxObde3i4G2mzO7mhNByxaIa0OWWgfBz+8OP4OJlq0yoM5+5zXBRu
 i0ChAm8YxUbkMLP8CNJRh388m71aFhz0PtLgf1b3U5W2jBel0tqjGQTTW6uAlpNy4J
 th4wCJ5KqsKXoHBUN4xM3RWs+aAHL2NQWrVHFyT7UtkoGU/JiUiwndVRkKqgkevl0N
 d66tix+UNo8Dw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D42F8C43141; Wed, 12 Apr 2023 17:49:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 12 Apr 2023 17:49:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jaegeuk@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-VMnwVLwnvt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #154 from Jaegeuk Kim (jaegeuk@kernel.org) --- Could you please reapply and
 test three patches here again?
 https://github.com/jaegeuk/f2fs-stable/commits/linux-6.2.y
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmebG-0003ri-1K
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

--- Comment #154 from Jaegeuk Kim (jaegeuk@kernel.org) ---
Could you please reapply and test three patches here again?

https://github.com/jaegeuk/f2fs-stable/commits/linux-6.2.y

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
