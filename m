Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FFCF58C6B8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Aug 2022 12:47:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oL0I5-00074P-CE; Mon, 08 Aug 2022 10:47:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oL0I4-00074I-0o
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Aug 2022 10:47:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=I0tPJztXSRM2B4MCtohysOahW4mZ6w68W9qEINX1OuE=; b=Vfbu6j+Rv+YHhxDbWtUcXNwov7
 ovtF0Zw2YzLKUA7hAO/x/IKxQcGPN60cECze0eVzMBbeNoUdyvhTaVZFo2LRYaWPmM+0bOpvotMz+
 NH1TAV2GP3CRMBRah/QNcHxzSFOqMsGytSzenYgAv8bV0MM1RqXCobv4VKCBHhT74sXM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=I0tPJztXSRM2B4MCtohysOahW4mZ6w68W9qEINX1OuE=; b=dYkIVWNKxlPBeu8t4bP+adjBpg
 zyhJDOVq5AQLDs6WyXD7bDYYZYz5Al4yQ2ShZ31j7mMGKia3IiJezYVvQX6Blcpl9L51PMpYRD8Cy
 mJ3Xm9tapWCDaIDirsg4NunPdg0c1hamJA+j5gPNJ36peQT90SFKEyKHZfyW2kMKO6NM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oL0Hy-0003xv-9p
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Aug 2022 10:47:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0AAFAB80E2A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 Aug 2022 10:47:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5523C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  8 Aug 2022 10:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659955626;
 bh=I0tPJztXSRM2B4MCtohysOahW4mZ6w68W9qEINX1OuE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=A7zaBlWHdkTjrX8liSKmsmSfYX+rBar4Hr5Es11EGcRjTI9+LClr3KJB1HaJvAnyF
 ixtuYOK56sYL4ujWN/DasqGGxrUxHo8zMtEkEpqluU52PU/KzgAkz1ifx1abSk0/+O
 hOe9vUTdmf6hZFyRCoYBzBvkexANi2CwdVsuGmUYAicFQllQ9/sJ1Z27uP1Z7c8+GV
 3m4/uUYXeJXBdU3DrZYbdolYuM7OFuMBDhRVN7tw4JC2Aepl9T8xKW+dz/kXBF6Qf/
 mWadxq/u9XzlgfF5KI7Mh4UWDSUa2UOmHsTWMTojvi6jsSD5VoxyqIS1VojHdfoEbZ
 3SeJ9lN89XXvA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 88B67C433E6; Mon,  8 Aug 2022 10:47:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 08 Aug 2022 10:47:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mtwget@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-atnJLhBwZ7@https.bugzilla.kernel.org/>
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
 #49 from YuDong Zhang (mtwget@gmail.com) --- This problem doesn't seem to
 appear anymore after 5.18.15 -- You may reply to this email to add a comment.
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oL0Hy-0003xv-9p
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

--- Comment #49 from YuDong Zhang (mtwget@gmail.com) ---
This problem doesn't seem to appear anymore after 5.18.15

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
