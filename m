Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F86E512D59
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 09:52:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njywh-00013l-NE; Thu, 28 Apr 2022 07:52:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njywg-00013f-9S
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 07:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A6RpKHhPuauMp1WmlcK67mC0cA1Wox+3X06d3BQ+UDg=; b=XcXhwAxpyy0QXwIribTFO+pSch
 KFKSo0LNmZ7cZV9GtCh1t7Y3sIX8BUthFYUiwphas+mQ4aGRdGdWvAgFkNotdtRBKxNyLpIE6wYgg
 7P4EaDO+/bHcmYzLT1YG9kz8wMvYzLmEUOq3Fr9f+In3VOx2BdKOKfU/TuWKD8vwxQas=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A6RpKHhPuauMp1WmlcK67mC0cA1Wox+3X06d3BQ+UDg=; b=Qc1qtx+Uq/j7dA6MZ4x1oSvp2A
 xQyC37UPktZ0LXWP1zX3QhAlJmArvMbrmpIS9QKkoWpD7hOObHYJpRJnKz8qCZYkO+YakdRgfMAQl
 37f2dWTLBRKF4y3uNRb7gpjBGXeVAM68rjno7eCUjtfD3kj3mU3BfTuY78Nq+3PDQSvo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njywe-0003P2-Jg
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 07:52:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8E78A61F16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 07:52:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CDEDFC385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 07:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651132324;
 bh=1I7Zbe9HmSkMEksMepXWeTDNSEbi/3ihAcuLM5FLafY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=kT5z4Vuf2c/RikvgUOlYv47j1lCAhcMFFmYOdMz3TrbQ+GavHQ/AkMOuDPcX/16Gn
 NPphCXbEfSlTIWazPIcXSgLV6+/gOed6xOkW3bIGRLV9olf2YUWLjNd3dpmfYgKZTC
 rrizhfm0Rl7fu3AU+XWTCE6jMpz8D4RYD1lWLwyu5gOANjrJQiKzZeVMyFqYVgi+zV
 +8ur9wPJZ1yyLswhdQwApnW4Y27U9HGz694eqpWyQ+uVzO0AcfbfMukFmR2mg16MKd
 LZacJ4wYQErdFOh8x9zAp2Ua958FVbATxB6Hga+8f8si6e/ZG1NKHfEjWICffPZVvr
 MlzO8Xl7bIbqg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AB400C05FCE; Thu, 28 Apr 2022 07:52:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Apr 2022 07:52:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215894-202145-Vg0FmCOELt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215894-202145@https.bugzilla.kernel.org/>
References: <bug-215894-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215894 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |RESOLVED
 Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njywe-0003P2-Jg
Subject: [f2fs-dev] [Bug 215894] kernel BUG at fs/f2fs/segment.c:2291!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215894

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
