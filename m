Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3976A470303
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Dec 2021 15:41:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mvh5S-0004eG-GP; Fri, 10 Dec 2021 14:41:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mvh5R-0004e8-Ex
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dYHBfTSaKjYe70bHhDmETwJhRNMgmq/E9/DdmQcq+OM=; b=lYJKdzf6KzziIMqlBq3TLpAYVb
 9REugMgHq0wBKroRT4cB9LVGaxl4zFMAFQl9dZLGgjYxQsA69Od5EUO44+lYXdBbyfA59RqPO7SW3
 jhA9u6lot9bbdi/mvI4oFSb+tMl7XDuXMelLMHKMYu3q6fil3rxVyZQm1qbvvrZB+eCA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dYHBfTSaKjYe70bHhDmETwJhRNMgmq/E9/DdmQcq+OM=; b=FSzRfSUsgTpTCQTwDKg+KMB+HU
 7xMMR8Mcb+UGLERWXtx/DU21vk3lNig1jaxTnb0j7sN4f5dRaafL2VTEKOO0NkGo9iaxS7uan6r+y
 mB1AGQ+zfq8I47G8VyDtyTcrB+K75R5KPYdDdBcDRl96iEP0wWGn8JrFtGeSDwxEb2ew=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mvh5Q-0007mp-OR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Dec 2021 14:41:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 4EF0ECE2AFF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:41:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7ED23C341C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 10 Dec 2021 14:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1639147271;
 bh=kemfnt9B49hv2AIOMiC+WP0U8V1bQto7uE0QdQVIBQQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oHiGb2QcPH1Yu2rUxUMe4U9s3xfHEhYzXW+nPyfsE197Bd7JH8wX2Gl82IPK8xG+C
 nSuKzNFp0Uqwb9r9gjQjvfEWnLcp+23nSD6A5ekc5cj6bENceoMwEb/5P9Xxuci1QM
 40IzBKEpub5z8o8uZp64wD/EbKKAvx6hTIlRx7TiKkCfswbVRKo5Iypxd2FXhzwsZ7
 /bKmitlILbaY7yEEzoWaUKFi2/nu1oNRhrG8Z/1EMyvSQzdou8o3c0G0HCe6HUiCoZ
 JSfu6N93//nPI17UATO+lRSgTakT+96F5uQtlWyxT8ZhXqmNFyrEkkTKf5MIWHD/h3
 WxkFPQx89dKFA==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 5882960F38; Fri, 10 Dec 2021 14:41:11 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 10 Dec 2021 14:41:11 +0000
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
Message-ID: <bug-215293-202145-JYFuhVf9PF@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215293-202145@https.bugzilla.kernel.org/>
References: <bug-215293-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=215293 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added Status|NEW |ASSIGNED CC|
 |chao@kernel.org 
 Content analysis details:   (-0.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mvh5Q-0007mp-OR
Subject: [f2fs-dev] [Bug 215293] F2FS: kernel bug at fs/f2fs/segment.c:2543
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

https://bugzilla.kernel.org/show_bug.cgi?id=215293

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Thanks for the report, can you please provider more info about this bug:
- kernel config
- mkfs.f2fs parameter
- image size
- mountoption
- testcase (operation you performed)

BTW, is this bug reproducible?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
