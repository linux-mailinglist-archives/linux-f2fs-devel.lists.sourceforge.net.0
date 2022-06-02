Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8786853C07E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jun 2022 23:50:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwsiE-00068U-CI; Thu, 02 Jun 2022 21:50:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nwsiB-00068O-Pv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 21:50:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZyqVMt4uj7qZbQamZUC0fhNBlahMqaWmv6a3motIsyM=; b=Y7cdmLi7XZJ7daVX2RKhoe41Rs
 OSKtQwGbCI0ysPrRXo+74amys8flNr1UTniV1rzcXUa7arDkY38432ql4njzPSC8VAeQpdSY0rRUh
 5yuTbu+7bYicvF9xbYkFUqFIiC3hUiPl+tVhU4dC/2VmFU8HEwcjn5+4RRIXvxsPsqnE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZyqVMt4uj7qZbQamZUC0fhNBlahMqaWmv6a3motIsyM=; b=ZMoWHxJbtKxUlF1+4xTiSzsNQw
 ltT8OMJ2wenfksVcTu88kAJFSo5EyF7ECxBLLygTtMkVcLzIU3wBhAQbUfn9j1iNR59n8ZReEPYOZ
 GYXnmTn4yy+dla8ibRdEUz0B9VZZuEDAPomLDjnmQlB3vo8h4rmF4ZORPcK5161OxNQs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwsi7-002lul-CR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Jun 2022 21:50:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 354EC618D5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jun 2022 21:50:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9AB54C385A5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Jun 2022 21:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654206620;
 bh=ZyqVMt4uj7qZbQamZUC0fhNBlahMqaWmv6a3motIsyM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=DPaMBwvYo/sWFfdtNxs1UxcyZG3npN3x6eX71wogsVaCGW7UhrC6xUPPtLwD2Xhyc
 qYeWrz5Hu6x8jI7Or7bZbowWpTH4f6kGApHe+d5L2Al4tOiXgfaL9X5zbS841yk1RS
 T6/j3g3hYjvnStON7Zbq5Brfj0BQ0XkxnK+vgLawuvtp/07I0pstT4iwTm2znL6Y0x
 hkigTWVy4KJR6heAeC2FUtKCLIpS+zVWcyD87ecm5/lc85Ris6WormOSSuK45+P6hD
 FQuZRPMoom6TGogioyhNxrfK4KSe+85zrRiH6PUsPUNBif5PQs4uQ8OxVKYtjUlFTI
 gDR42MDmrViSw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7B993C05FD5; Thu,  2 Jun 2022 21:50:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 02 Jun 2022 21:50:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: plague@privacyrequired.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-8IhItPlMxH@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #18 from plague@privacyrequired.com --- Thank you for the WA suggested. Will
 do it and see how it goes. It looks like dm-2 in my config is lv_root. I
 am happy to assist to provide more info as needed, but will need to be help
 with that and some hand-holding may be required... 
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
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nwsi7-002lul-CR
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

--- Comment #18 from plague@privacyrequired.com ---
Thank you for the WA suggested. Will do it and see how it goes.

It looks like dm-2 in my config is lv_root. I am happy to assist to provide
more info as needed, but will need to be help with that and some hand-holding
may be required... 

1) As this is my root, can you advise on how to create an image in secure (and
private!) way? Also, I'd rather not make it publicly accessible image ;-)
2) Will need to be told step by step the procedure.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
