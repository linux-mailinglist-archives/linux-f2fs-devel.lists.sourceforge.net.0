Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E27AE57AAD4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Jul 2022 02:10:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oDxIV-0002UL-Bu; Wed, 20 Jul 2022 00:10:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oDxIT-0002UE-6g
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Jul 2022 00:10:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/BjYzML1emNjF4V7I84cliagruEtMx7wcjC3lvQqqn8=; b=DWLV9MP5mymK02QRAQoGqdWnUs
 ssgYMUeZRGoASMIavspxGpmNAk8c5Yt/bn8OoBvbhiFUCPyaE8CuHtbRbV3GjPA5UuwvYi0aYlLIk
 SSQ7DGHlB0gvOLicjo4kZv5PfiS6VY2flVJLU7bifasD3HUvVDTBAfXrKbieNX9x2sLE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/BjYzML1emNjF4V7I84cliagruEtMx7wcjC3lvQqqn8=; b=Ke8vEOrnYGFhJaraVCIIyTjILL
 rJ7HdUgryjSrGuJ5pnc0Sye524DAGI0InmUL25Iz78mjAKxCvqVtIzl8H2nOTwPMHirDD0zoiELCB
 kxoTsXgGoVsEtkRzJx7DRS/nc7+tHGONmSmP4g+fQI/S/cjO/FskpKVIpUvwKGPF1dfk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oDxIO-004Y3s-Lm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Jul 2022 00:10:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8CDA5B81DB0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Jul 2022 00:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51EF0C341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Jul 2022 00:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658275820;
 bh=sk4fYvHOdBmzIeWL4jRBkyvYgTnXXaTsPYjrq4bdcfc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=fQq3cVNEjg8tnmqpye3W0t/SSPYNFLlV+eMxnV1Q1YaWXI4jJAjMTknnFoH3ca+3g
 iA40UuqYqZdx3nfi1nGCdmYMJNvKu0woV4GegKTnvZPXiRY8egr3r02pd72QxgIl3B
 ubMKH3YwhyVatNk6NQJhyNLH3vXbsC4E1gF1zmEgoJ/86wQe80BLl6Gs8ABGotIySR
 Ko7g+VbNyJj5sG8aqoVDqzPqZZ5yP/kp4H71Ys3UOIoANiOk+R7nPhsZm+Ky4zB0N/
 td0kvQILhdrAJxy+Af37fhtBNvQZ0GtZ8lm+cqL3A5p7IH5LpVaXTaDuOca05DSYZb
 6hW2Ec2M5KktA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2D7D5C05FD6; Wed, 20 Jul 2022 00:10:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 20 Jul 2022 00:10:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rootkit85@yahoo.it
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-BQKSWLONfI@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216050 Matteo
 Croce (rootkit85@yahoo.it) changed: What |Removed |Added CC|
 |rootkit85@yahoo.it
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oDxIO-004Y3s-Lm
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

Matteo Croce (rootkit85@yahoo.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rootkit85@yahoo.it

--- Comment #34 from Matteo Croce (rootkit85@yahoo.it) ---
I have the issue on an eMMC drive.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
