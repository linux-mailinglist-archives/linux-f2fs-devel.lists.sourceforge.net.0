Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C7E6D9F4D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 19:54:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkTob-0007Mv-DX;
	Thu, 06 Apr 2023 17:54:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pkToa-0007Mp-G8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 17:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5RBpv+0hz6EJiCjXgl6D5jq0d/INR9pBw4bvi0WBzmc=; b=GpL13aMRGO6Zhgqteb8ddlk69Q
 vtpz5mIMF3mXNGv91Yq/BgKLe/UgpaWr03dVeJUub85tQmNxH7KDisaTTxkIQ5NbKQwhiN/QpIwt5
 bDkeIxVmtKVHVY/iGzvmEZvRanUSnFMMWazF6DKx6ZfcXdn2FC/Ujfh9jcOYrbk8xmiw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5RBpv+0hz6EJiCjXgl6D5jq0d/INR9pBw4bvi0WBzmc=; b=jAEMLqlulxQybUln1ugqRAnlgh
 LLLjPGnm4VjERVG6kvvmSwUvOKA292ukBdQ3uFq+NX6SjbHQ88LrbJPYqns0WCEIx3gnjSdp/ENdl
 vaG728V17xFiVhOljAKx5f168bRA/PKvXLkiqkdGOfd2KtxawxwrvG8BPmDZGos8mkn4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkToZ-00H3ty-4U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 17:54:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BBA7462CA6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Apr 2023 17:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B773C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Apr 2023 17:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680803661;
 bh=5RBpv+0hz6EJiCjXgl6D5jq0d/INR9pBw4bvi0WBzmc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=XQ/F3rVCjmReLll4OxCcXWqv5GmKW6KigQphIidi2tZ/1KaC4XwLs+aaIXMx0Nh7D
 jdCnAKx7052615AsNQAyaN2UTL2QBglsKN4XNv/6Oxx68cUpS2CJOAWy0CWfUHKXpQ
 TJgfQVYlssnPRDBT+KET4C89AJn9N9XRziJ8R1qtXVN+3SklCFzJrCnxaIiBjROhZT
 Bx/EOyMvgqWfeCMJ9djsYo8SGWL2JKKgtnC9ftk9zwpDrnRJ0gfjV2ol+hhBedSNcE
 Ow6X/k3bBCMi/d74H9I8mGmA6ZEfRlL+ih5L0jQXapO8e4mYGTJjJXIpHRlWMDitxZ
 AbJi8YZYeyPPA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 100EEC43141; Thu,  6 Apr 2023 17:54:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 06 Apr 2023 17:54:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-jzANiwvwir@https.bugzilla.kernel.org/>
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
 #148 from Guido (guido.iodice@gmail.com) --- Thank you, I'm building 6.2.10
 with both patches and I will try it in next days/weeks -- You may reply to
 this email to add a comment. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkToZ-00H3ty-4U
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

--- Comment #148 from Guido (guido.iodice@gmail.com) ---
Thank you, I'm building 6.2.10 with both patches and I will try it in next
days/weeks

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
