Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E174963FFDC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Dec 2022 06:40:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p0ymc-0004Fp-SE;
	Fri, 02 Dec 2022 05:40:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p0ymb-0004Fi-3r
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Dec 2022 05:40:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eoFb7Oo9ifAAyiKhyevECha5xfRcJ4BBXMe4dvQ5hMo=; b=cAhoW2xaP8tyFmuTiJyklq8OME
 rw+RF1ih6+c9dKUdjwm14XwPw3KVVXiwLqsqzTx6u4q9WV04RysGboD8k+Pg8yYOwXOHr4B99v7+K
 QJ+kOpPdS/chF/h08788uPopg4brtJaTgzA5N9Vfd0CxLd7PVi8T+gFw8YkQLZD26YSA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eoFb7Oo9ifAAyiKhyevECha5xfRcJ4BBXMe4dvQ5hMo=; b=DcfWa3qvDvTFPOt+84YYcB3dqo
 Q/znYuqwwOJLsicyRD4CV14xoiyEN/nhcr9Cdz3qzrz3HWbUTR35sj54vPwPlBNIFQV8dLSVaDboS
 yBzDwRwFUJ1taOVj8t6inPS8ZjmLykUSmmEnslbLKRiGMaXURWEScNRSQ4z37k1Fh+Dc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p0yma-003g6O-Fa for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 02 Dec 2022 05:40:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id F1979B820F5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  2 Dec 2022 05:40:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9ED85C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  2 Dec 2022 05:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669959609;
 bh=eoFb7Oo9ifAAyiKhyevECha5xfRcJ4BBXMe4dvQ5hMo=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QMay/0X6Q7nz89XHD/YNIX8g65SruAOF5naxGNlGL2Hcj4+9hzIfxs3M1NK7+axhi
 Qg1ZVkFMGtQUf7zU2rX7bD4cF/JnDe3PnZuE8ujKZUfPkRv6cHHhIqUZs+GlL7CtK8
 SNpmWSjURFeY8MRtT6xbDibRT1A21iBytC2bAECG5QyQmpA9rjLg7WsaKzH6mEekF3
 qx1+Sn+qeiaj/s6x6IugXyiXpt8Bmvicc4Jot+o5T1nKwFE+8rN1cJt7PTo0aU8x7y
 JIwDvJW7ZFvgd4oGe2MaV6n/rqYItYPgYa/fhs5ftx/yH+yL39rgWCzhNncHIfuTfF
 8VAoNJonZKJYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 81539C433E6; Fri,  2 Dec 2022 05:40:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 02 Dec 2022 05:40:09 +0000
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
Message-ID: <bug-216050-202145-iO3YTrlSAR@https.bugzilla.kernel.org/>
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
 #97 from Yuriy Garin (yuriy.garin@gmail.com) --- (In reply to bogdan.nicolae
 from comment #96) > Well there's also a possibility that the mapping of the
 inode changes since > it was initia [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p0yma-003g6O-Fa
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

--- Comment #97 from Yuriy Garin (yuriy.garin@gmail.com) ---
(In reply to bogdan.nicolae from comment #96)
> Well there's also a possibility that the mapping of the inode changes since
> it was initialized in the beginning:
> struct address_space *mapping = inode->i_mapping;
> 
> How about printing all three: page->mapping, mapping and inode->i_mapping.

Good point, thanks!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
