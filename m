Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 002B6210456
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jul 2020 08:55:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jqWer-0004Xa-Ou; Wed, 01 Jul 2020 06:55:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <SRS0=hiTD=AM=bugzilla.kernel.org=bugzilla-daemon@kernel.org>)
 id 1jqWer-0004XT-4U
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 06:55:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pdBM73Nf45uHGYFB5U8JvLxFPtpGXXWNus+nP81k7Js=; b=atEWPXja2FsdEYTW6ahtL8Hbvd
 BjayVOYs8aNPnwyoNlxtzfOC3pwbcH5Kip+8C1Wj24pQlKL/p4bgD0iucWpiCD2uGoI6gPYwvZveG
 n8BEi6u+FWIcc/Ooa977dKlWuW0xFT6Ekcv6EK8V+XXp7F9RgnHIUZFmeJXfse6FoNOI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pdBM73Nf45uHGYFB5U8JvLxFPtpGXXWNus+nP81k7Js=; b=nTnfJxSZrtmlIYWL1WM8KhO1en
 aNOHqfH87lVSMOWbZdOK3k9nE7JPEyFae32CtxCqMSdZwST6kh6dHPeWsFn8yc97FPIKKH0FPEXFB
 A9lOfAZSZd9gMe9BwVa/FpXz4EE9OFGDpnNknycczEyajwEzz6fVzSlUPdaPY9tW7C+Q=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jqWep-003nSV-T0
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jul 2020 06:55:49 +0000
From: bugzilla-daemon@bugzilla.kernel.org
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Jul 2020 06:55:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-208325-202145-nSN9Rs5k7N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-208325-202145@https.bugzilla.kernel.org/>
References: <bug-208325-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jqWep-003nSV-T0
Subject: [f2fs-dev] [Bug 208325] f2fs inconsistent node block
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

https://bugzilla.kernel.org/show_bug.cgi?id=208325

--- Comment #5 from Chao Yu (chao@kernel.org) ---
(In reply to zKqri0 from comment #4)
> >[print_node_info: 271] Node ID [0x203a7962:540703074] is direct node or
> >>indirect node.
> >[0]                    [0x5452202c : 1414668332]
> >[1]                    [0x45445f4d : 1162108749]
> >[2]                    [0x4444414c : 1145323852]
> >[3]                    [0x202c2952 : 539765074]
> >[4]                    [0x6e657665 : 1852143205]
> >[5]                    [0x6f687420 : 1869116448]
> >[6]                    [0x20686775 : 543713141]
> >[7]                    [0x69207469 : 1763734633]
> >[8]                    [0x6f6e2073 : 1869488243]
> >[9]                    [0x46202e74 : 1176514164]
> >[10]                   [0x69207869 : 1763735657]
> >Invalid (i)node block

I don't see any valid information from this, could you please upload the raw
block if possible?

-- 
You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
