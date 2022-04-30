Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02C9A515E83
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 30 Apr 2022 17:01:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkoas-0005z2-Ls; Sat, 30 Apr 2022 15:01:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkoar-0005yq-IT
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 15:01:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=69KbM8wzXo38QG/pQ0Ek9Vd9A0qhesOXkWWPKzZsf2E=; b=fe2AiTGdgCaHf8qVxwxOAUKwp2
 YZci3rgdYdCwiemOSTnv1xMA+Jo0/Ytn76LK5S+Y2qrrB0LWG3Fk1TwlJpcHbfMGv9PXBvggWTlbg
 tC1wxoyi/kgPQQBB746ccvEMHoKron+lC5kex7nJ/EhUGQsJRMwmtxMoRx7mRZc9R7EY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=69KbM8wzXo38QG/pQ0Ek9Vd9A0qhesOXkWWPKzZsf2E=; b=dYBbjzLQtYdBkXSndA7kv1ZK0d
 iIEtQCtlQEcDJn76FswG7uwkBEpOzDf8xj0/o9wBCOw96z+Z3e0gPtvfjx/WN4sF62Kc/DD7s+bwD
 A7gf98TOm/848gxgCxpeLBozmhDOqSjZiO0ET73ke9+RpkTOsibd7TCJIE+0g1PnOhfI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkoar-00059w-9N
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 30 Apr 2022 15:01:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CDE4260F93
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 15:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E0DFC385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 30 Apr 2022 15:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651330863;
 bh=4Wwdx9Yv2C0U/mRMauVWfUKE/9FByw9tpqlhx12IfFI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IViBcJotzfCvWxrCiiWsljv7uvap8YUZy9IDpNEVJbF552wjBSSMrxtD3EnUSPnNJ
 MA2iLEtFKMlaj0Ci8FzriXC/w6dHiXAUghETRvnSquQwBhN6kmfC3rOedh5poE8XOX
 7PV3bKJNURjK9TcAWgengLU7073c2xwoXbek5UIVL23DadM3lRe1g0AWvSLBi2NvMq
 eiJGgzN+MA3IcOTy4L53KYQ95/ElVzyERSqZ2mFvJOGP3nOVVo2zYbWqwr/Z1kO7C9
 SRACW37AA/gzJP13s4o0r6zFyErl2sHD+RuqBl0Mwn7apLclrMlH24gOvPaXhe929N
 pc4A2beybWR2g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1FC0EC05F98; Sat, 30 Apr 2022 15:01:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 30 Apr 2022 15:01:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-215905-202145-9zAKXYmVAN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215905-202145@https.bugzilla.kernel.org/>
References: <bug-215905-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215905 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkoar-00059w-9N
Subject: [f2fs-dev] [Bug 215905] BUG: KASAN: slab-out-of-bounds in
 f2fs_allocate_data_block+0x23d0/0x31f0
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

https://bugzilla.kernel.org/show_bug.cgi?id=215905

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
I guess this is a known issue, please verity on v5.17.5 kernel?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f41ee8b91c00770d718be2ff4852a80017ae9ab3

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
