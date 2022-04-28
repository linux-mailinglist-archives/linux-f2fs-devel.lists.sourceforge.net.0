Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA5C512F40
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Apr 2022 11:05:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nk05t-0007zW-GF; Thu, 28 Apr 2022 09:05:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nk05s-0007zQ-Hz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 09:05:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HxlcFk9tFDyoioL6PxieE+SD91ec7ONlhM03xTmmmd8=; b=G7Zvhd8QJrpRZnwMKJcMrPsv1A
 U/PsTZgEsx8At1071XyyxlaLarwKSpV/NPy6+Q7vp/qOePFtcfZnD8G4awTQP2Dmv5feG4KkZZRNm
 enftLEJ5vS80/4b02LavNSvxHBhCD+CGZV7ObQCi7gT7fPFYHTArynOwdDxuv5/HuVU0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HxlcFk9tFDyoioL6PxieE+SD91ec7ONlhM03xTmmmd8=; b=NaN6dgVU3aLN3QblY8aMiAKFoj
 FJGNkTuZEASxW9FXIANcIvKmWnJdRorHiytqdO8IkxldBR5d9LyaO8pGPfQ0pyeuWm8juZYf7RHv6
 D/X1g/kLgNK/CF1V1ge8O3ybPHGyZbEjbgJKkzetR/hvcum5N3y4dZObMhzdcyKHcklk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nk05s-00CeB5-In
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Apr 2022 09:05:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4FBA5B82AE0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 09:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 18042C385A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Apr 2022 09:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651136741;
 bh=wHq0Lok+3OHtGOAvWFmYEpqZFOKcVxh1cnklhFjtUNM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rugDv/Mks42azV+OzbOjfVOy9hozmaS7/YuOZrF/pbf9rl9qjaYSSB/99JcjZ9Qyw
 VmYbMp8mDdNFTCVS3Wc7GAiUO9QIniq9orayhPN9x49OoceUHBKYWRgjr0zL8wt6oG
 gCO7Km6/iJKHqkQn2iQvKvBUdDKK/21mdZunMwNRlLmnygVzlFly72r4sEH0qoE9T3
 mVn1BuFZIzc7b+ZjlOOmCvRnPr52IGGiGRaQPDh5Ea7zybENiwMgMY5/dtVpH9ier/
 U7OFOh1KRzqUi4KN5usekKAIMoKTJJ6EVnVB3lI0hisX5PdfMmAMD69qGvdOm4dDJV
 a9OPRJt+Ipk0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F051CC05F98; Thu, 28 Apr 2022 09:05:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Apr 2022 09:05:40 +0000
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
Message-ID: <bug-215657-202145-atZv747QjZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215657-202145@https.bugzilla.kernel.org/>
References: <bug-215657-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215657 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|ASSIGNED |RESOLVED
 Resolution|--- |CODE_FIX 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nk05s-00CeB5-In
Subject: [f2fs-dev] [Bug 215657] UBSAN: array-index-out-of-bounds in
 fs/f2fs/segment.c when mount and operate a corrupted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215657

Chao Yu (chao@kernel.org) changed:

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
