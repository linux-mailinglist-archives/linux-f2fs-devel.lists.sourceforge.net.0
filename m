Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B0F164485A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 16:50:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2aDO-0006kL-Kj;
	Tue, 06 Dec 2022 15:50:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p2aDM-0006kB-MQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 15:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7qYOrTfMVY2hYNizFBeZZl2RVWhr4JorrAeNSZGIARI=; b=bXKuPiMkAf8ECPJzdgMYNzQPFz
 sjvGrRruBzP3RqjqF9oN1EFAYQvK+T3KvIXftjaRN0eHIJ+/3fz1rUIyzsfsEXNCba/gVp8EOpsh6
 aoglpw5SQFSX/1IXUGYnxzv7awxmvmTQ45MIqouHG2BtSaL+lBv1l6jKdmgN27xHEnDM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7qYOrTfMVY2hYNizFBeZZl2RVWhr4JorrAeNSZGIARI=; b=RsOa1uOnT0D+8BDiDQaWY5isrK
 fT22574Mt5on4az86jg5O4YZhQaWDLnxjT3Hp15h2rmXF5+62zf2qqmdOkrJAbiDT5WzsJ70X2h4f
 h9cmtEDgfEqUB4aUpUoHioSRQfUICucvJSABO8eBc+DsWVCI/FVeRMCkSta/rTZZqVEc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2aDJ-0007uz-Fc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 15:50:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 32D30B81AA1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 15:50:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E10F5C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 15:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670341821;
 bh=7qYOrTfMVY2hYNizFBeZZl2RVWhr4JorrAeNSZGIARI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=O0TFRynQ3JZZKufQrlBCegFfa1qG/srajBHTNQcYowBHPPESPQohnOnR7snIRJafI
 4UpS69gWFs5iFg0a42ONJKvpgAdV+FdUA8SKiEOAEabGOcYDjLyRKVWYp0uMCKf+Cq
 J9IM0xkZXkDKe7b100+i5UGovzvMxuyamdY96ywmG7vlCwvGHsCX1Fv37/Gyv113XR
 3jn/5UMBYdB5eyUYZ9n1uMzC8rfmcFt4D0+0oXDfTKlAWHEnXdImwGOpikw+/fDDhP
 bXL7uHx+bxc/A2wdiMoHkfROWZf8Jn943ukD5p8ehqhRTb4nqoe0iCRf1h2ODG7q4N
 ZEuqHeIcBps8Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BFEF6C433E4; Tue,  6 Dec 2022 15:50:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 06 Dec 2022 15:50:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-3NOzKi7FAP@https.bugzilla.kernel.org/>
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
 #99 from Guido (guido.iodice@gmail.com) --- Well, I tried to foce f2fs_gc
 on my partitions (with unpatched 6.0.11 kernel) It seems that the problem
 of 100% cpu occupation arises only on nvme0n1p3 (my root). The dirty sectors
 remains 1417 and do not go down and cpu is 100% occupied (since the start,
 not only when it is at [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2aDJ-0007uz-Fc
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

--- Comment #99 from Guido (guido.iodice@gmail.com) ---
Well, I tried to foce f2fs_gc on my partitions (with unpatched 6.0.11 kernel)

It seems that the problem of 100% cpu occupation arises only on nvme0n1p3 (my
root). The dirty sectors remains 1417 and do not go down and cpu is 100%
occupied (since the start, not only when it is at 1417)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
