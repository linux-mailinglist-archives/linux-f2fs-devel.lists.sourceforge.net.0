Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F05665178F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 May 2022 23:16:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nldPU-00035o-Gg; Mon, 02 May 2022 21:16:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nldPT-00035i-QY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 May 2022 21:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BdAPSjPWFjinTWXz23PHXeWUCxmZPA8lN34xzD8zxvs=; b=kLJU5GmtryRVzqRYzeNYQE2/Gh
 PBedyUpZbpy84RCbItfmMj0YZGtVRPaQnGGYF8Ccx2vVEW/Q5bQCvOBkrkA8P46AoP5qZerC6DUE8
 9yNrJPG9SKQ5yihU3w0+ej+BjZT20QzpqY3VX+JSta21jkt9i2m4AXdMOOjhmJJ44Z90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BdAPSjPWFjinTWXz23PHXeWUCxmZPA8lN34xzD8zxvs=; b=fcIJkBZEe70nx7qVBvA8XLPQY1
 Kh6z4gF81ovt1nPf5bIR2/v1z7Kirz5qq4ZPHk26uE+utp2SebLc3aWOOVNARv7/eITnzYKTs+X5I
 knhDpKW9N+vWfPFicl6KShvhMTxjbshx13b/NADS8DhwoE8Nu0AVdwUAOKaSH4/SMXM4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nldPS-00GvuZ-4x
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 May 2022 21:16:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 74DCFB81A1C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 May 2022 21:16:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16466C385AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 May 2022 21:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651526193;
 bh=2fH8TilhxYgunjufV3QDCHCVV97XtG+h9h91okr2sEA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VlWGtv/VRGbrWnR+1p4rX7IuPQQwIB+RBdvkDJxrhLowU6Ni6eA1/TkCevX8y4IdT
 TTlGpwkUB17TpRvX+OiaOIJ8zxjTw4IS/b4KUdzk7n58Ck4hLLKbyAR8jR6txas8RH
 eLuZL47bghAdeagyhjn8k88Jw6qremgB/Bx16+U+GnbEC9CXfeyiIjHxJm+Srn12T3
 F3pgPgLyarCYJT3pgXQrXIsAtgZAGEPVxcqVLtxcOhd/YJ2cjWqe+x/vpeuxaNGTeT
 7/B62ikXXnj4D9eoncENNFYpzdtTB2CrCQ1mY2B5Mz/IWCvi7dIOLuJiWXaILbQxTd
 tghn3/VjpZtmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D7A77C05FD0; Mon,  2 May 2022 21:16:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 02 May 2022 21:16:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215929-202145-zIwmaox2Yu@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215929-202145@https.bugzilla.kernel.org/>
References: <bug-215929-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215929 Artem S.
 Tashkinov (aros@gmx.com) changed: What |Removed |Added Status|ASSIGNED
 |RESOLVED Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nldPS-00GvuZ-4x
Subject: [f2fs-dev] [Bug 215929] kernel deadlocks while performing file
 operations
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

https://bugzilla.kernel.org/show_bug.cgi?id=215929

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|ASSIGNED                    |RESOLVED
         Resolution|---                         |CODE_FIX

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
