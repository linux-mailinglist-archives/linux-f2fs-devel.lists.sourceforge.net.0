Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 303C76DB12C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Apr 2023 19:09:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkpa8-00009P-Jv;
	Fri, 07 Apr 2023 17:09:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pkpa6-00009I-Om
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 17:08:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5UO7gbnbxoWxSIhtb/89gC81y8WieBTNCnoYorZYmlc=; b=VltGQQctQQz7HgiVqm9VzOhssY
 XSEhlZQxTqx3O3hG4kBBWDixMlBwf/Qx7ruSXung3pWiRqPrGXWGcU3vBy2eR3OJPjnDoKtznfpCA
 ML4tMoR5EwLYJHTUH7dCnODjm0wPDPcbyG+ubO64YSVx0CqolLb17w9SOulEQkpIPCAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5UO7gbnbxoWxSIhtb/89gC81y8WieBTNCnoYorZYmlc=; b=YxaedPTMXbHLBVtaMCMP6vTfY1
 U1j/huKZkIuWyq1OAvc5ZmjVhFEOBTfPrZBQA0HdKvRnejXmL4EKfYKGjJCRgvnotRcMo53INJ1pe
 JLAjI6fKh6PXL6iHaYv33PGNlid/YphsDATqIj7GUXybTxe/JmGWiJDMo5xPcM//qp7o=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkpa6-000KEq-IB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 17:08:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3146D652CF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Apr 2023 17:08:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66334C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 Apr 2023 17:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680887332;
 bh=5UO7gbnbxoWxSIhtb/89gC81y8WieBTNCnoYorZYmlc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EtEBUaYhXNKTDyRDSE8g9gDAUgF0eQc7KyFNsqwcGfuSUpLRtjkaF++sOrhUIKbMR
 VqlumFjG+bzHp50/hHFCa3PO+9SKcUwFxAEClXK/+4WTQv2GElyBdtONLiHMCm/YaC
 u6ncD/bJYkqkMH+26PTwZoXFedLLSIxvA3xt+Ii60QCJGOMNJFYwfM1DRO8Dw3R0Ip
 BcDzSB8jaKJH7dpa7nk8YfL2vgRyNtGTX4VOVh5wtALHl62AaLS9Sv5AtUc7oG4rAb
 Cg/l1E/hqDa6emUS1y0+ks/cmJwUPROLcLj2VFsxW8msU80jbFHYD+L8VfEdlbaJS6
 vMagH6lupbZmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 43E17C43142; Fri,  7 Apr 2023 17:08:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 07 Apr 2023 17:08:52 +0000
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
Message-ID: <bug-216050-202145-ijJHBpzCLK@https.bugzilla.kernel.org/>
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
 #152 from Guido (guido.iodice@gmail.com) --- Done. I built it against my
 current kernel (6.2.7), then rebuild the initramfs and reboot the system.
 Then I forced gc with a script and it wor [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkpa6-000KEq-IB
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

--- Comment #152 from Guido (guido.iodice@gmail.com) ---
Done. I built it against my current kernel (6.2.7), then rebuild the initramfs
and reboot the system. 
Then I forced gc with a script and it works without problems. I will test this
kernel in next days and weeks.
Hope other people can do the same.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
