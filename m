Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79262D16C95
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 07:18:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSyeuz9UjR1cVMgTiuq8rDnw7ygrKTmHByXW9GcEfX4=; b=hnJWE0lUBxWENdPEcG6Ey14jxo
	pk/5hHOcBkrNgOI6zOANjyhnhTZXy/n7eos5JGTszGfrkIrXePn5j6Db4er082X7rOiFJLfE2Q7BD
	VhCw9pSeLVT++fDrKVUcGxsDpfVMsTSl6oMCKKLs6kMfQMunTeGw8Zy1w5UHnuyW3PmI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfXjB-0001iN-Na;
	Tue, 13 Jan 2026 06:18:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1vfXjA-0001iG-Is
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 06:18:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z4d2auHTDh7qn/wUIyiVegzVt3xBKEC8q6fSheYE0CI=; b=C4qJM15cXlbo6t79vyWS8H91vt
 A6oEA+02tqdQ58tNyXcGNHikiu48Wj3ULXOtLiBeHv8jWoOyaklArftgaLnb1LRhWIfILT6PcFKHG
 EMJBTfa6dL95bfEEi03lKM6MEkY8FKWcVErdd8AvqA+KmHLSBYdJMtZCJxaKib/3ZNMI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z4d2auHTDh7qn/wUIyiVegzVt3xBKEC8q6fSheYE0CI=; b=hqjAFdFwwnkcVTTtiI8RPfDK0N
 Re78o9TsIielgcNtNx1cgBY6FdzzBSEy18lInDDZ037O3NUfrDet9gOmZx+V5e1IRPMyrDqo2jJOC
 lJ7KjrsrWTE4yxwxaXvgqJqoDdw7+NibjTWgDWu+zD3XH4W7ZzuqiCyS06sG1D0o/woQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfXjA-0004hU-2u for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jan 2026 06:18:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B21DA43BEB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 06:17:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94254C19421
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Jan 2026 06:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768285073;
 bh=z4d2auHTDh7qn/wUIyiVegzVt3xBKEC8q6fSheYE0CI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=H4fiEp6dy7HzcrlmlBwCYYw60t3Chjvs0nHpCcyELKg/wcf4MR9sKaOMZztyg21dG
 8XZ3Lhob8wdsCou9gS3uTRSN4lzyaxvEMm9dDjW6apnHtTSt+ZT2eYTgpsBIQbvmSV
 G1k1bdDuWevmiHQBVwO7Bc+Qo7MJaEQ69zFhPxqdhmWaMg0byDT942ITwrkECl3zGH
 cyTPLMktlVUE5cLjc2miV0eLZEA8/E/cmhMzPkzt/1D7OzNp65ElSapZRofcZJ1EaM
 UNpMIIWD9WdLjMkZaDMajPgGafz+A8xZ0YqqnA5FUNLhWCzhWMvMHzSwqrWYW6KTyM
 Gn45Mg0xkp3cA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7D8A8C3279F; Tue, 13 Jan 2026 06:17:53 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Jan 2026 06:17:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220951-202145-VMUaDjxQj2@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220951-202145@https.bugzilla.kernel.org/>
References: <bug-220951-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220951 ---
 Comment
 #4 from Chao Yu (chao@kernel.org) --- Will add Reported-and-Tested-by tag
 of you in the patch, let me know if you have any concern. Thanks, 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vfXjA-0004hU-2u
Subject: [f2fs-dev] [Bug 220951] swapfile activation bug causes data
 corruption when swapfile < 2MB with fragmented extents
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

https://bugzilla.kernel.org/show_bug.cgi?id=220951

--- Comment #4 from Chao Yu (chao@kernel.org) ---
Will add Reported-and-Tested-by tag of you in the patch, let me know if you
have any concern.

Thanks,

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
