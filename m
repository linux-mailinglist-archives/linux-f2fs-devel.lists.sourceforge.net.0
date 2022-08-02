Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A8E58786C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Aug 2022 09:53:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oImiM-000106-1D; Tue, 02 Aug 2022 07:53:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oImiK-000100-6H
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 07:53:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d6u4UDct4zUj8sDkJw2eVRoZN90c4qbJ7VzhOibLh70=; b=ha8LY26BiSxc3Q/wxuGedT8lj9
 QjskIgn9fLyDjFzxuo6Ezu4Y9Q84yPOqd2Er+TdKy2cz5MUfGQHYMZfwbi6+9HjGAZHtta8iVstml
 3m0LAaXwEYVPPll0XL/jjm3oNdfmz+agQG3KCOco8aPG/yM/WlrTSlnTUogQkQqp5nEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d6u4UDct4zUj8sDkJw2eVRoZN90c4qbJ7VzhOibLh70=; b=UyJ2SvEiKj1wlqj/BN09nVgxn6
 V1wi6duXwoj433QPJff4ofPX8EHXb7zk+ul5KSTpKlcb6/jYvXzHC8JioG4zkAYsEqSYtEKbkNjf4
 DYcXAHeDccuND34l9gvW6BDp8sbIG0TPBtUnjqC6iY8opUi+f2KYaP5FSF9sDv0fuvd8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oImiG-0005tY-KX
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 07:53:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 71C3060F7A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 07:53:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D5B34C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 07:53:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659426781;
 bh=d6u4UDct4zUj8sDkJw2eVRoZN90c4qbJ7VzhOibLh70=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=IUuhR0KKrcLSnPo9ccm7DTTZPpvU54CNynTwF9bChjMx56E/B7OqEs/0YB00AjkJT
 eTLg3jYdl+Y0mYLMAfTpGSSwJsyNndyVUp9Hvw5a00bfaCgVkD5OFYPAmBBEFujnAc
 r4Zx/vw0CgK8hljXUIVOj6HozOfXEDModG16B4uAsvMhW+uHEVW2TeVF57eM0d1MSH
 YrDLfR0CIbIQ899uE6Pi0kAwb0e0zSYvOmlflavShAwEZib56y2UTrZrehmgq5xhb6
 fB1MZbhH7zXRod1M611o9msyKdYD35ImTVMSlzK80Xe1WuGwY1HHD5bLqXuvf22IZB
 JJ5/Wsvtdx6yg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B1A51C433E4; Tue,  2 Aug 2022 07:53:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 02 Aug 2022 07:53:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bbutscheidt@yahoo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-1hFv5ebKQd@https.bugzilla.kernel.org/>
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
 #44 from bernd_b (bbutscheidt@yahoo.de) --- (In reply to Chao Yu from comment
 #43) > I have no idea why it loops > here since it's an impossible case,
 I can make a patch to skip this loop, [...] 
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
X-Headers-End: 1oImiG-0005tY-KX
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

--- Comment #44 from bernd_b (bbutscheidt@yahoo.de) ---
(In reply to Chao Yu from comment #43)
> I have no idea why it loops
> here since it's an impossible case, I can make a patch to skip this loop,
> but I'm afraid that won't fix root cause... :(

Could such a patch at least gives me/us the chance to log the event causing the
trouble? 
Otherwise, the only chance left I see is to wait for further bug reports and to
see if they bring new light into the matter?!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
