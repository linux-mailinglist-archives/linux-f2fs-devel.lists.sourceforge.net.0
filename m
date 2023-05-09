Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4F1E6FCE85
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 May 2023 21:27:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pwSzd-0001QG-0Z;
	Tue, 09 May 2023 19:27:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pwSzb-0001Q9-E7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 19:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RYcmQbq58ZMLQSbcjrQtayzKoZhnaPqJt7XOfAJHQdg=; b=Y4TUglU/0nmd51uCWz7uPms9U3
 cITZ3c2q4kPZTmPdO/MR1Qs3NPekzTi7OIu+vUAMC/v4KuJUtJ8/+tC/5zgXZkTc+8vHDxbJOkCuF
 7duPoj89Pu8wQaHx5hEX0DhLq/PIb71SwU4xIYctYrOvBThIN3faInKeMixakdKuvO+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RYcmQbq58ZMLQSbcjrQtayzKoZhnaPqJt7XOfAJHQdg=; b=Uv/pIuaUaF9YyprMSdKHiPFy3L
 OUziBZ8EWMpkfNke5WRc9DRkJp0CrWm+5sOIuukSfu62xxIY49BDznmKG2ubNwCWaivtHiNg5R/1u
 IwY7OeNJBLgRa7MhxjeR4oCo3RneOy/XLejw0b7wR4dOPD0KfHicpRQ7FX30PZAqZegA=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pwSza-001CW0-44 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 19:27:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 51CEF62D88
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 May 2023 19:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 206CEC433A4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  9 May 2023 19:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683660433;
 bh=RYcmQbq58ZMLQSbcjrQtayzKoZhnaPqJt7XOfAJHQdg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N1fQoHH7pW//tHcr3DW2v24ELfIIRd5UtKQWI6q4Wzy0ocfIHdNoIQSrnhxXI939Y
 RCeBzUbr+7H3dS+spI22rZjfxzI+DJ5e33yCeR4B+OYqFoVbyfcawzvShS/qYpCQZ8
 esS6x1aVFqySChzBEwoo89CMCbFesVd38QoNXdiygCLiQw6C7LASAcA94v2eRreU4n
 JaM5igEHyd6YH/VBG2Zg1YYuKSUho9PHeFD1krKxxQcAiutmGTf4ST1GL9sMNb8UkJ
 jFtSih1P1hla3djgon6bxdWvbjJvBx2CcrMF8EaV2uEcRnUFykopUfQ1wFPTcT9LRY
 3Q6zaEhqfbgTw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1051FC43142; Tue,  9 May 2023 19:27:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 09 May 2023 19:27:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: lp610mh@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-bkO5b1Blv5@https.bugzilla.kernel.org/>
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
 #169 from Matias (lp610mh@gmail.com) --- (In reply to Jaegeuk Kim from comment
 #167) > Matias, you saw the issue with the f2fs updates in 6.4-rc1, right?
 If so, we > may need to consider [ [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pwSza-001CW0-44
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

--- Comment #169 from Matias (lp610mh@gmail.com) ---
(In reply to Jaegeuk Kim from comment #167)
> Matias, you saw the issue with the f2fs updates in 6.4-rc1, right? If so, we
> may need to consider [1] back..
> 
> [1]
> https://github.com/jaegeuk/f2fs/commit/
> 400dc2a4d7ec96a1fc4168652a0862e7edab3671

Since rc1 got released today, i'll try again to see if this issue cames back.
maybe it was just a regression with 6.3.x kernel but we'll see

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
