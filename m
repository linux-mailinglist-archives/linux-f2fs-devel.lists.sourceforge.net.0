Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0D3877A2B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Mar 2024 04:43:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rjWZO-0004Aa-OC;
	Mon, 11 Mar 2024 03:43:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rjWZN-0004AT-1e
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 03:43:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=63QC3Qfdw0JL6Ofrsg8gKvu4PcI5Cm0yLtCFqCyXnmk=; b=lvxY+xJwLs1WzrzzwUQGZe40nK
 m58RaizQ+wuOnxYRmxkYyPvSxGs3knLmixnB8uvYg0XGBzwBuZeDuZGg8ZVZHxSHXscUF54dYqN6E
 Hlgy32OnkG6RCxTvpYJqkeXWVdWRIxvxM7jky+0i9oqh01i7pvsYitvLQLSGOxRg2bKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=63QC3Qfdw0JL6Ofrsg8gKvu4PcI5Cm0yLtCFqCyXnmk=; b=UlvNnp8/sEzFK8FzuPaKdfzn9g
 ES3J586Vee8ktXONPwlVDft5aq+vlLV3wHRqQCWuB8lb1BsCdH169Ok/RCIiFWiXxklmU/ADdFFgv
 y2M1O30VK+qWk4hQ4Dfm2NWX2rWVLmgroNl90X+kOKUDhTwwva3ZVsY+XMz9yHl/Nsg4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rjWZC-00031F-Ji for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Mar 2024 03:43:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E2788CE0CF3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Mar 2024 03:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2A2FFC433C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Mar 2024 03:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1710128583;
 bh=63QC3Qfdw0JL6Ofrsg8gKvu4PcI5Cm0yLtCFqCyXnmk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=bfqtNU73H38xGkUfJIkn1aiTMWWW4txzElTL6nnugmrZZZtUN4iknGWVDGySd9ZDC
 IwNf1tgtQ7CcGjICxHFZ4nz839L7/uY290RnN1wVM6Ozp030ncFJoP/I0P6hgzalrD
 aqNWbTx/KojWcblKMDJybKtrNA79G+XiJC1GhdjEDHI8hziTiCNk/zUdLQBlp64RvF
 W9LTLBbnNd2Zvg7ol6MkQHMx4U9Jv+3EwzKPdwO+LLaZr1docl84ZzcAMv1aWtcILh
 hKzlohjj1kZfjFZk+yNJ4bZDLqRXSYJmSG6CSDoqCpE8TemGN5L7dPryfDBzoA9y9N
 WpMMrrt9m7cEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0EEDCC53BCD; Mon, 11 Mar 2024 03:43:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 11 Mar 2024 03:43:02 +0000
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
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218349-202145-eEZJn59uy0@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218349-202145@https.bugzilla.kernel.org/>
References: <bug-218349-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218349 ---
 Comment
 #3 from Chao Yu (chao@kernel.org) --- (In reply to Kane Ch'in from comment
 #2) > That works! Thank you for your efforts. Thank you for the confirmation!
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rjWZC-00031F-Ji
Subject: [f2fs-dev] [Bug 218349] f2fs partitions corrupted during power
 failures and cannot be fixed with fsck.
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

https://bugzilla.kernel.org/show_bug.cgi?id=218349

--- Comment #3 from Chao Yu (chao@kernel.org) ---
(In reply to Kane Ch'in from comment #2)
> That works! Thank you for your efforts.

Thank you for the confirmation!

I found above link is expired, let me attach the lore one for who wants check
it later.

https://lore.kernel.org/linux-f2fs-devel/20240114182118.38596-1-chao@kernel.org

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
