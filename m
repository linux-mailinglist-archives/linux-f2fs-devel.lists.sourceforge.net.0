Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D16652AAD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 01:58:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7nR4-0004fS-QC;
	Wed, 21 Dec 2022 00:58:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p7nR3-0004fM-FP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 00:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1lpcg33RWe8C7l8uSKraQWIZEJh1EoD9Ag/lTz+bow0=; b=lWUXw6U90dNWLy4gp8zcBF5Rsp
 UUIoYXX06fel0t9Osahpf90g7NU5fvQ3zHSM/QmwoH6sbpoGLwXTXZ4Or7iLsWTxLbtlUdI8JrdPL
 Zqrw+V66M7jdultA52T60vsd12XnOyuTg0FIyFzmwgQYgSIiYMqHbUe610dmltvQPgtQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1lpcg33RWe8C7l8uSKraQWIZEJh1EoD9Ag/lTz+bow0=; b=V6PCBpdXIegz5Wc7GNL3qJIplB
 Hc1rH3c/62xK+96KanSCV5qG7VzN9R0JLEP02dcp68Ej+xA4UxAPeXe7yfDTqEphHymkI7xLXBmsN
 diELO/UR2I0bkkrxgAKmfzlAd3acKsvIaw2/61kt7fv2OMjG3SA7LO61CVZPC4iYHFhE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7nR2-006GMb-TK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 00:58:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F1476162C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 00:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC7EFC433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 00:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671584290;
 bh=1lpcg33RWe8C7l8uSKraQWIZEJh1EoD9Ag/lTz+bow0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lNzhjocM6Cal7QoxhVf3tM+rIBiIEpLbVCYArp3y8l0j79AfXiYxlXZJtD7+eSc65
 NqhrazaNhPpcX0LMMT+HOFZffMRf2m7TxPGvlflvHODPWKLkyw7Ks6nFsm/6JDdWOa
 cJov9HuzpGxA2Nz4artLBYB8QCq4gKZ5Y793i+sHs9NMvALPwdmej3f3+i5HFj4mLY
 lQNPwYspfNI5tzLstnOgILYBnNnOKZbTwudzTcpidcJSqbtZx1I2YJ1TaXUIXU5Hgi
 swRr7hDV/RuaA40lWKSlOoZXOELUJ/twqNLkXYZDKDi9DXua+Rr/bJlvq96b6hQdb9
 imPpSJFSrqolA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C205AC43142; Wed, 21 Dec 2022 00:58:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Dec 2022 00:58:10 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-5tzGya8tob@https.bugzilla.kernel.org/>
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
 #120 from Yuriy Garin (yuriy.garin@gmail.com) --- What's I'm saying, it is,
 as was pointed in #112: "I feel that this may be a subtle page cache issue".
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7nR2-006GMb-TK
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

--- Comment #120 from Yuriy Garin (yuriy.garin@gmail.com) ---
What's I'm saying, it is, as was pointed in #112:

"I feel that this may be a subtle page cache issue".

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
