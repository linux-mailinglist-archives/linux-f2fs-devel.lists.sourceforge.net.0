Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 70924511818
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Apr 2022 15:02:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1njhJF-0001zB-Lv; Wed, 27 Apr 2022 13:02:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1njhIx-0001yy-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 13:02:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Eeu7/d8us1OTN4Gn2/ubEkC0HeqUdLmBtEv1XFvcQQ=; b=bZUPoHiAF9zV61gymsDxlQirSE
 azBuEKfYLuk7ZR1SJgXx1iP8Vlehe7+szJ3RGvHZRZkEsGoSljOJARECsQTgme5WBKVFZrASibH22
 tUQSjnB5rj/GrpPdkFumctL40h+wXSgYcy+kEx/AYL6zqCXlgOgV/tOQ6TWmkwEA+dc8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Eeu7/d8us1OTN4Gn2/ubEkC0HeqUdLmBtEv1XFvcQQ=; b=loz5GR3erEy2suOvfODoV6tFu3
 z0IreGgqeqhLeC1QObLJAVks2kuiOQl5Oav1KUeMXWYbxC6lbJeeNj0MWPhq4sTLKnHbroGUp7K+M
 Jz+Mnt7iEE6D2G0wecRCmzV2PzlyMLlJnRwQXW3UxNCTG3P5cDlfRlvdx1ML1hqktudc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1njhIy-0004Fe-1i
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Apr 2022 13:02:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BFB2AB824EA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 13:01:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 86B0FC385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Apr 2022 13:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651064516;
 bh=+Eeu7/d8us1OTN4Gn2/ubEkC0HeqUdLmBtEv1XFvcQQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HQxSl5zNuOEyFv7XW3dbCNy0czIfCmo5xl9h0gQJD8eP8hBGO0LOuF4sh0AAaT14F
 cgSrLXpjV3YCJ5Wb/0QxHXLTi8NbriRZKfqG3A0Lmn4q4dhCARee8pAQLhvIZM5SUG
 RVBUbDvJzmklnTeklrSovK5V/AFAW9ADMxZlCzq2eCqQyTLztAT8j2TFIa2zYWRu6i
 wJpbaJLxK+Z0EdpSFvNoAyFe0b8TkWx2VWjQOgdVEe9bfdf54Ek9toxvg8pUOykU6V
 7YEzJIrgt3HzrUhDfbplJiIpO8LMQE3gbfiiVp1TkzYlqQT27su3nIzvJr+iVhEh6n
 ovrc/c31UU/Mg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 73C3AC05FD0; Wed, 27 Apr 2022 13:01:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Apr 2022 13:01:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215897-202145-2yMIOLYIZR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215897-202145@https.bugzilla.kernel.org/>
References: <bug-215897-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215897 ---
 Comment
 #1 from bughunter (yanming@tju.edu.cn) --- Thank you for the prompt reply
 :) this bug has been fixed after adding the patch! -- You may reply to this
 email to add a comment. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1njhIy-0004Fe-1i
Subject: [f2fs-dev] [Bug 215897] kernel BUG at fs/f2fs/f2fs.h:2511!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215897

--- Comment #1 from bughunter (yanming@tju.edu.cn) ---
Thank you for the prompt reply :) this bug has been fixed after adding the
patch!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
