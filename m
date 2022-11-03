Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 14855618469
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Nov 2022 17:30:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oqd6P-0001Nu-DS;
	Thu, 03 Nov 2022 16:30:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oqd6O-0001No-BD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 16:30:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ldhw0tk+wbHtjrsLuQSW5xcm2SKMP7xsbYxjWsaQ9nw=; b=S0eoL5gtR2wzm4vcjDjsjJGBO6
 c40LUI0jzr9n6Sfv4jMvXfcuu37xbYlONFpGlPAsZtXo2CQPYvbIAHntwQeX9xa1XhgswoDs9Wn8F
 Tk2/DYh8chJjH/KfPL/+osgs5YGQnCdRttwkmDyCGeZSAxszeeLgdWputkti4ZvZspcY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ldhw0tk+wbHtjrsLuQSW5xcm2SKMP7xsbYxjWsaQ9nw=; b=anSgZfYgUwW7o9EwcCP212gaCw
 jJalfmCQStkC+JYJWdfuGf012PoW86rGHk8HxQpLYFkYUZszk1PRZFpIq6KIhV4/OAb7HfnO/T1kq
 ZkXkiMoAb8cI9HqTz2zCMwshkwnjK9mRkazI9ziukwIRLcOBbffLUuudWfMNGNdxLATk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oqd6N-00Apml-Nj for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Nov 2022 16:30:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99FA1B82927
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Nov 2022 16:29:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F208C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  3 Nov 2022 16:29:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667492987;
 bh=Ldhw0tk+wbHtjrsLuQSW5xcm2SKMP7xsbYxjWsaQ9nw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=c/q5D8svKfPA+BdZkGd81vPL8TR8+JYsS+ES35lFiUIo3bhOAGb4j0pC4fRk+4f2F
 XVY65mskZf7TLl0p9Hh55KjSpupPAdYVRW2naRvHva/GcpKIVsWtwFcJRoboYblXhu
 lB4QvE+NqR1bchuhBvSJueyho/MRMcUaAf+LiyVGavUk6ZQVx0440433w/FG92odi0
 wWZQzS4m34jCVq6dvp3tbmjyBx8/YeXjCFPmbcndyNi8eAD4wtWcbvWHOy+/TqtW+P
 ykxqEG1bOVyKhNMwUDMXSFNuAjnBS0XDhZ0rxEojPEEvmtGGe6XMPy7+79ChIe3zo8
 dBzzSiNjAO7Fg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2DA78C433E6; Thu,  3 Nov 2022 16:29:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 03 Nov 2022 16:29:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-27lPs5AVc8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #73 from Guido (guido.iodice@gmail.com) --- just to try it out, I will now
 give background_gc=sync a chance -- You may reply to this email to add a
 comment. 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oqd6N-00Apml-Nj
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

--- Comment #73 from Guido (guido.iodice@gmail.com) ---
just to try it out, I will now give background_gc=sync a chance

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
