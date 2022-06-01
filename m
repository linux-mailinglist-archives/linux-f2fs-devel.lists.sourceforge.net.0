Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C1151539B9F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 05:28:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwF1v-00033z-ET; Wed, 01 Jun 2022 03:28:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nwF1t-00033s-Qb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 03:28:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Fzna7gF3oCVXxpiKMfAOh/0gGVQTQivNs7NCN4lz6E=; b=JcQhg6AwnHD6InL2wlD/qcurd+
 XRRg4348y5ixV4yV5E378au0WbdY04bAn7JpS1jqcoFankehN8RnDwNbuNlJkv9abHzN8kL+FdBR1
 gLjCrcUOQXbGcjjL4zypNQEMuMHitzkmm5gs3Ah/PjPEgKEiterHkwqW3TkaA4PpbFvc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Fzna7gF3oCVXxpiKMfAOh/0gGVQTQivNs7NCN4lz6E=; b=bS4qWCGNWMwPOkzA6Kxzr+hLYv
 QD4WFsLoVizZcoPfufeIHseibLhyY1my8BooERYabMa5BZRhm9UKaHyR/wF4RWfEaZEKasMNF/kEo
 T7pNFKsQ8JNRJGl96Llv6Vpp/PTDYF/WbAFhRuAISrN3UW07X33ga8NNac2xiKAL68Tg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwF1q-00Ehva-Ge
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 03:28:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 36085B81772
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 03:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1509FC341C7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 03:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654054086;
 bh=+Fzna7gF3oCVXxpiKMfAOh/0gGVQTQivNs7NCN4lz6E=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=dvSYveqPVj3HsXQQJakodTuPFvwXEidP2GzBPhA0FhYTI//JpXCbmUZr7zFDjD+sx
 S7PugHNrVq9z2nXziysUebsxw537osUQNnuWHMyyRlOGw5mReNAuucxCMPPZlp60CX
 6XdrlbR5RI0873OQ7zhbvO4WOqS0kjA4QBGR+RF36DDYjC1K3PryNeg1HdzD5DnvRe
 vTxk+B5kzTFIwRRaRDLQ2yKUfHMokaO7hHTkAT2HFOU/gfmE2GS9mqFcuf5OrKVV6U
 h/MzW4SR0yKNSR/aJg3aIHrnwH7tJxEGwuIzdAI6G1b406hY4agL4r1hM18jSIEo6D
 W5b9avxI4RyNg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EC729C05FD2; Wed,  1 Jun 2022 03:28:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Jun 2022 03:28:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: plague@privacyrequired.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-CUkIY4jM8R@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #9 from plague@privacyrequired.com --- Gosh, it is growing like crazy...
 After a second or tro file is already too bit to be attached... Here you have
 is shared: https://seafile.cryptohell [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nwF1q-00Ehva-Ge
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

--- Comment #9 from plague@privacyrequired.com ---
Gosh, it is growing like crazy... After a second or tro file is already too bit
to be attached...
Here you have is shared:
https://seafile.cryptohell.net/f/236fb102b26648bb97e5/?dl=1

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
