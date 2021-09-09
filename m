Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED67406043
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 01:53:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOTrU-000132-0D; Thu, 09 Sep 2021 23:53:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mOTrS-00012w-JO
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 23:53:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tlDpyVFqh42Lw6A9AKhhsKuBLU/hfAsuePCPNJlffPE=; b=H9j+vLGn6XkqgSL03+D7f3KgdB
 EPEX4UGDK+ZeVtuwlKLbjOv26iOVnfhcpoYdLvvhaQhAXrGkjztghqlLAyQt0nlRD+e3T26LHKgSq
 E/2xtBRmFvwI36XBsuEwyk0t2p1aWmRwY4dyXuW5VLpoKJ8icbCxawfhzHLCCcbY8+m0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tlDpyVFqh42Lw6A9AKhhsKuBLU/hfAsuePCPNJlffPE=; b=aZlWc6UNEtbeg9VRAv58djGxpT
 QkGF7nY2wqyRQ1h/AvmGMHqjSvtvQkbWkaPOLmThDgDwQduq7eU6vbtOGmGz5feWEggKvE1ZiMyNg
 uoD2Nl7FUAbV98O0As7I6nZSzMph5QRRbWaX8mGsysd+xIY0hyTnDwaJwVyMX9dv7aCw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOTrS-00038E-3E
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Sep 2021 23:53:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id A9F71610E9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  9 Sep 2021 23:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631231616;
 bh=G/vqFVKiW/e5GgQb/moCqw0cbL95Ut8Mp2w5szirNVE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=BppBNafiGj9hJnEh2kNocZAQOlOBqKyYfj0+oA6dvzH8qrW6lDE+bLIwYBlF0PFMh
 hGpuRZ9Cr6zpzKy2eY0LhuQVnJYK8avQY2QJHwYc9u7IqaMlKnicikbKnjAgmEWxdk
 GPJU0hf2l1J8Lmu5pykACaMZMUaHrr41uSiuc7jbMoqfwFp375VeCD0ufa6SPvWzJl
 uJGIythSHbvKKqNAb3I1YxloxbGoacwFZdkLIfbMYP7MRwtfGkndviUgRzqdjCSTsv
 b7P0qaPi5qyxsqE0WQy3elfpndgg2E5H3lZB/f3ME82n3+DG0ZrEZpZ43P27t2gBM5
 37r1EnnJ7A7Ew==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 938CF60F6B; Thu,  9 Sep 2021 23:53:36 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 09 Sep 2021 23:53:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-214299-202145-DTl8RBY0lC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214299-202145@https.bugzilla.kernel.org/>
References: <bug-214299-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=214299 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOTrS-00038E-3E
Subject: [f2fs-dev] [Bug 214299] A deadlock problem caused by the quota_sem
 set in db6ec53b7e0
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

https://bugzilla.kernel.org/show_bug.cgi?id=214299

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
I've sent a patch for this bug, could you please test with it?

https://lore.kernel.org/linux-f2fs-devel/20210903023811.3458-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
