Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E155C4EA62B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Mar 2022 05:41:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nZ2jI-0007my-9K; Tue, 29 Mar 2022 03:41:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nZ2jG-0007mn-4t
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 03:41:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=j5pg+j6kw+nC9GlAMCOSQCyGSV3SNyIck1hzy24JXZs=; b=RY9rD66sIe1yXOtjYGSLOumAWJ
 zKW6TR2RANtAy650SFihXKoNqwP4QOJj21gCviBklvJJCpkl03Uv1Ulh+9oiYTVQNBAZYFg7qh40U
 cuyb1Sxfr3M4iw/KJPmVq/hCTV5rTjEHWh9X9k31nRWSOCxnHT58UF4qKkPo01+64CIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=j5pg+j6kw+nC9GlAMCOSQCyGSV3SNyIck1hzy24JXZs=; b=LRDun7SjaB8hMPuYBXp8FCkqK4
 4VvYGK9wTWAXuC4P3+Gty/ba4pmisH+Jl1LuIM3xtQixBYogURcZMy5lifFW7BEWp6+CvDI9w6b46
 oAEhEg4aEMxBzU30lyWMRnhuFhgJ8vyZR6Wp5MIVcdwqDAAjqalmnzfzjJrGmv5Ex2fM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nZ2j8-00FHTr-EH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 03:41:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0E138613C5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Mar 2022 03:40:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 746B2C340F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Mar 2022 03:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648525256;
 bh=13UY20IC82PNOngj6H87SqPzXC+IDShZEQBRZctuU6c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=cTVA+T/MYD7XOlFi30tMrL3fLw33twBCmMSCtCSMYc0MkKyrjuViSax20Tf7THJPl
 RYFMlz3s3Gyrk7Gmo89pOfLshzx9uvBFjHGifwAeFQdbheSxLjBtEooyZGL/4LBpsP
 ydOmEkiGDiwh1xpUK5EM3eDbnbuWxmLangjRIl5I2u7pvQroPfbNDRrjjCfAEL8zCw
 k1OmhCUcUQGAAnjd2Qsrngy0D0SKgRCJKs7dW2q6qWl+K46PH8mfTxrat6Mh/bck1D
 i9Uh1CzADcxnCXpv/UAtbUcW0nQPuREuMLffE82aaR6GVtY+V4Ebql4SdObGQHqhb2
 831g/l+3RFAOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 50336C05F98; Tue, 29 Mar 2022 03:40:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 29 Mar 2022 03:40:56 +0000
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
Message-ID: <bug-215765-202145-T9Iu5n1aXz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215765-202145@https.bugzilla.kernel.org/>
References: <bug-215765-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215765 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nZ2j8-00FHTr-EH
Subject: [f2fs-dev] [Bug 215765] kernel NULL pointer dereference at
 fs/f2fs/dir.c:f2fs_add_regular_entry() when mount and operate on corrupted
 image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215765

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Hi Wenqing,

Thanks for the report! Could you please test w/ below patch?

https://lore.kernel.org/linux-f2fs-devel/20220328160253.3102-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
