Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAAE35729E9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Jul 2022 01:29:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oBPKH-0001QO-1x; Tue, 12 Jul 2022 23:29:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oBPK8-0001Q5-CL
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 23:29:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9phkYjP/37HfWg4O7yfdl+auYDYv44MfkVT0MQMAUis=; b=QluY0UnviHugKMfLeenR9u+zOi
 5TP6kCG82sOuYGzpr7e7eFpxgda5H0XTBtNDppNdxDHovn5fKQS9Wz7+YMTf3cs6iNtNh6rrzpE1p
 mpQuOKEc1oA30ngtzoL3nc6BaIXlmbChjdXapX3IPKKtY+eM6KMD+Ehl6YEtxWiDNFvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9phkYjP/37HfWg4O7yfdl+auYDYv44MfkVT0MQMAUis=; b=DmjrRDxVQ2klkQQjzM7GN71K8g
 9P6ophqMXnQgFVlZGX7mioEI8LW8XnJ4XjO592F8986JSGiehPQ11EGALCi5bvxs87jF+W3VB/BB6
 Nqhsi9cFZJ4+PycVx/iholBjCiT2rq0HtDwNqZ0tZdw2ns5QZ9nTXNtoPjZFVma7bAlA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oBPJz-00078K-Bh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Jul 2022 23:29:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7BB75B81C1D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Jul 2022 23:29:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2B616C3411C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Jul 2022 23:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1657668565;
 bh=Gs+/nvwWgngialrFhfbgpe7ecJb/RJL4WlmY3yEydyQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MT7PdM1MAOglruhE0Uas+CNhz9boePf/I3XAtJjWtjbnQMwSvs/w08ThhLyOYAzCC
 wjpnIiNorWanbPwgGSceX2Wyf10ErbOmJGF+A0L30YFCis0CyablS/AluUq03unA3v
 bXRyNJuFNOJMiIgb7QfPsaSoPvP7hfWDyEPGM1oTZijP1U8a34rtb2DUwo1IhNaXYE
 p7hM4T9RmvgJGiVVbUS051qj2TXPO6a610J+3Wsfpp4pm9rmMEVH0rPWJqW3Tx8F6L
 +f7dNiJ401wq8N1Kn+fz1HB+b9iRbyZ7K5lgX3E7Phjv7PrHnp/zdwPJpeOc0Wuz1m
 wVC8aU2kUQTxA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 11267CC13B0; Tue, 12 Jul 2022 23:29:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 12 Jul 2022 23:29:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rootkit85@yahoo.it
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215916-202145-0I1jxuvBhP@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215916-202145@https.bugzilla.kernel.org/>
References: <bug-215916-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215916 Matteo
 Croce (rootkit85@yahoo.it) changed: What |Removed |Added CC|
 |rootkit85@yahoo.it
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1oBPJz-00078K-Bh
Subject: [f2fs-dev] [Bug 215916] kernel BUG at fs/f2fs/segment.c:2560!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215916

Matteo Croce (rootkit85@yahoo.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rootkit85@yahoo.it

--- Comment #5 from Matteo Croce (rootkit85@yahoo.it) ---
I hit this with kernel 5.18.5

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
