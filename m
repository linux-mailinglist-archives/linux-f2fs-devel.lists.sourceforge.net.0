Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (unknown [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D205C6C6B1A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Mar 2023 15:34:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pfM18-0007BN-J7;
	Thu, 23 Mar 2023 14:34:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pfM16-0007BH-OV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ha6Y5F9AQG0GQDvcwxfLd4IxxUqU7cyGTy3kGa4dNjo=; b=N1Z4elDuLsynt4idNXYg5g2AdQ
 tzYhCSB2auDeI9Eu1CYN1wPNvisuEgo+4OMuAnd3nX8z6LMz19QfCe2vX4PJa0aF0dqAmPnv9xaPy
 vIIhJEX4x3wJAGrAOIwUGbBG8mLhLI55MrIaNs7e1d+NcTONFuqVHcdzlyQAHILUUy3c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ha6Y5F9AQG0GQDvcwxfLd4IxxUqU7cyGTy3kGa4dNjo=; b=mwnY5facyD8tZv8Md2Lk8THIfd
 GE1AvAuAK7Ay0Woqzqx/v5wvOQbxDpyOTmeQzSikLwYZMKmixstIGEczXB/tUaVgdMfTpl5onL292
 HHMZLHrdtgVUxfB6afQEHRjK0h1E1/p8LuaxJvJCmYYnaYeq4QalGX+oQaFy21DETLjQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pfM16-000I9b-Ki for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Mar 2023 14:34:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62DA2B81DE5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Mar 2023 14:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D0BBC4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Mar 2023 14:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679582045;
 bh=Ha6Y5F9AQG0GQDvcwxfLd4IxxUqU7cyGTy3kGa4dNjo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gLHt7KWtxd6qNp0mtdASA3RcRMbnG3Qzk42Ps0V5NU3yuAmFtIXyAM25kscTcIvJ3
 Zi0S+qA/d7XFolGDb/jW2aSgGuBspqxnjscdxrFCdYp8NxX/fmuwTfz6a2LfOGpx0j
 hX/KEgYcyvCGEnHu1daQNpIXBGNrxGPtzW3MpP4pDs/CvOhV0JsBqSLojvaNqhXUSV
 AUacIiC9aK6GcUpJLU5pQ5g5PTVo9nQWOHbCi9HdyXDy1yf3obdAIQyr2FtTj4YxxL
 Lh/TtHGBbxwN08NqZu0iXt1DVtlvSQKal2fLDIlI2kIK0ccusLFMi2dyjCntrQBVeV
 klCMdKU+3ZYrg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0AA1FC43141; Thu, 23 Mar 2023 14:34:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 23 Mar 2023 14:34:04 +0000
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
Message-ID: <bug-216050-202145-DQubByjD9F@https.bugzilla.kernel.org/>
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
 #139 from Guido (guido.iodice@gmail.com) --- I have been using the kernel
 with this patch for a month now and so far no problems. Out of superstition
 (I am Italian!), I'm afraid to say tha [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pfM16-000I9b-Ki
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

--- Comment #139 from Guido (guido.iodice@gmail.com) ---
I have been using the kernel with this patch for a month now and so far no
problems. Out of superstition (I am Italian!), I'm afraid to say that the bug
is fixed, but it seems plausible

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
