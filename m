Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D675AF99F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Sep 2022 04:01:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVkNX-0006MW-Jb;
	Wed, 07 Sep 2022 02:01:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oVkNW-0006MP-Eq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 02:01:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HwW0kE/AWj3A+lQxrIGx6VJ3k/I+K9sQtKEEhkuxRxQ=; b=cHKM5yynWyx3DBRBoOJf4L8iXk
 k5j/2mfLRGPIDzK6/uoV4YlbPlXdltq+6FyNolihzeP54IdUGNuBnrBZcZ/8Q0Hg+GO+arkC8CSEI
 9LRXoX+QnofQjwqes4Snm1ocYYpcDXmqDGEKXlZJMItTsWVKFlXiA8SBvgMYuIVPTaCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HwW0kE/AWj3A+lQxrIGx6VJ3k/I+K9sQtKEEhkuxRxQ=; b=k8ObegddtCTs/UasG6UWBVCMUy
 79OkqilySLmm3feMwcw8gSOtOQABOo1N/t7KphVNDxs54D2uZ2afeZr/HI4GzDpeRtJd9p1uBPdam
 Oii7WRHqPCHVylA5Ru0J5w44E60NDM1TLFkY1pVbXIwPZu5Qb42p4U/yZdPyAgXi4Vl0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVk2F-000Lkc-SZ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Sep 2022 01:39:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C81CBB81ADA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Sep 2022 01:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90419C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Sep 2022 01:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662514751;
 bh=HwW0kE/AWj3A+lQxrIGx6VJ3k/I+K9sQtKEEhkuxRxQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=noCYijvXGoq1BPgKW++hjBD1Gu5saH1TftMeBEQHGNYML3/a/WmeDHf09Jb3rz/lD
 /P4G4nPj4VTMv5wXlg5x1O7/MO0Trk8oVeScQ9xkVl9XZN99JJD9iVA/E8lzIU1Rfv
 Lc518X/kl8kBLzBPF0pRWuTQWqRGB+FxMjL0vn7CzUJpbIpU8/kaBhbmNY3lffFf/R
 7z2+SJA/N5WlECfb/TrZlFOXsVn3UPOdoVtRShvLra5Bfvk6d/XBaz1qtYIvok/Kh8
 3Af44jKkNYmvDBYZm5OWQiQbod1nbPCFpPRrdVUwBSXGQud+koQe4b1KXs6wWuuWBs
 lRoGsh+2CS1jg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 713F3C433E6; Wed,  7 Sep 2022 01:39:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 07 Sep 2022 01:39:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wenqingliu0120@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216285-202145-M42OfQUl3H@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216285-202145@https.bugzilla.kernel.org/>
References: <bug-216285-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216285 ---
 Comment
 #2 from Wenqing Liu (wenqingliu0120@gmail.com) --- Thank you so much. --
 You may reply to this email to add a comment. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oVk2F-000Lkc-SZ
Subject: [f2fs-dev] [Bug 216285] KASAN: slab-out-of-bounds in mutex_lock and
 NULL pointer dereference at fs/f2fs/segment.c: f2fs_update_meta_page() when
 mount a crafted f2fs image
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

https://bugzilla.kernel.org/show_bug.cgi?id=216285

--- Comment #2 from Wenqing Liu (wenqingliu0120@gmail.com) ---
Thank you so much.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
