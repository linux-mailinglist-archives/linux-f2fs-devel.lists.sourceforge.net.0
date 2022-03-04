Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 932E04CCB6F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Mar 2022 02:52:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPx6v-000285-Mx; Fri, 04 Mar 2022 01:52:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nPx6u-00027y-Kf
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 01:51:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ks6BHIpIMAg8fcrXo0awmhA0VRPd5Kx02CU/Ocw4T9o=; b=EFkTdtdDW+2YF7plirGZ16YcLk
 rLRCIvpUc1LFvoAonJ7lpupUrnVbjUIq2/MID3Gbqu+ozW6n9thzG2abViTudh/2/kjlQKdKXj9KY
 WyZp9Z1hkNzyws/qn+18j6+ndD5zterd5SzIUJXWe4kwtivZEebw+JhHwvM4qdWC0VvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ks6BHIpIMAg8fcrXo0awmhA0VRPd5Kx02CU/Ocw4T9o=; b=NXd6L2YZA0umATnoE/FnNwV4oj
 BE2N0+YYmdS4tQT/SzroJHvHEjtteTaaS3iNTlGcADr2Op5fouu92aN1s73k6gpCO8JfLpwM+SaUm
 clDVcDdmgMpWl3g3cQZ9xA7bd2LPebvEvqrOthwqFqU3A3jJRmEzRtS9+q2XONsiIImY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPx6s-004HOj-94
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 04 Mar 2022 01:51:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 00ABEB81DB8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Mar 2022 01:51:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4681C340E9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  4 Mar 2022 01:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646358710;
 bh=P4jIQbqFep0vy01gkSvrb0qgKiKzWyT18l1nz0rfcLY=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=iW8vNY1oSDfZa9/KFst1wLz3NFKw7Tg1ZClRealDLS/Mu+ALiy5Q95jCNsx31uy5y
 GKhNoFeoyqqhIuAryYsfYydlUjZMTjzWQL7pncVKIX6wQ6A7WSptp3NKEC7A578iyU
 WxVLlq5HwxfR5l2Q/QpqhqP880V7hJsSUpPrjxfSedzTglAhfWgDJbsyN7piMv7Wox
 DDmed9HrARc9VJ6UYwC7lGYgV153LJzI3HQ0Kvgtn4FGIC+WepQw3G6Xa168ahlDRa
 0cv3Us3apna+2KzXFndYikrxxafpcyN+E897W8WuMli8PWi5If/7rjXn2iyZbi3b3w
 0ux0Rjw6OpJ9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 82448C05FD0; Fri,  4 Mar 2022 01:51:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 04 Mar 2022 01:51:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-215657-202145-aOpCwH58Ba@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215657-202145@https.bugzilla.kernel.org/>
References: <bug-215657-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215657 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPx6s-004HOj-94
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
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Hi Wenqing,

Thanks for your report.

I've posted a patch to fix this issue, could you please help to verify this?

https://lore.kernel.org/linux-f2fs-devel/20220304014913.3966369-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
