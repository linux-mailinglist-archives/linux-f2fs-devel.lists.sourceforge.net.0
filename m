Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D30B53DDA0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 20:23:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxuub-0008Lh-Tq; Sun, 05 Jun 2022 18:23:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nxuua-0008Lb-MF
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 18:23:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VbW60G0Io2TlspHozLMI5SkQAbbzVkU83ar9CJKN2os=; b=gw9/Pkm6wV7SVoTicoUDmN85/e
 MyUaxJAPi56f2KWbcRltDRrfhqFPFbmec8AKrAsd2mmeboQz0bx9e/LEBoTLD5k54UUjZL7/+cp23
 wKBurr8XcKk9F0aF1+wLl9j1xqFgMgO9zF1eFsXW5yUJq0A6IOg5snC7WQukUcyB7vD8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VbW60G0Io2TlspHozLMI5SkQAbbzVkU83ar9CJKN2os=; b=mV88cbDy+7MBLX+4QzOtzCbByd
 JFD/Y/Ngt1bDy3/AAHys/ahZv1p77+OxSha0nA4LdlaKy5KTqTC7YGWeeTONLHi/gaoQq3Pf+uXZe
 +wgt5NNsbYCXymIE/6aWwPhlDyeEDRIa6pP++qjzfX1Zoll5bx6hyyWAzBDp2CZ1t7WE=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxuuT-006JvC-Iq
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 18:23:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 478D1B80B74
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  5 Jun 2022 18:23:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 17FA2C34115
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun,  5 Jun 2022 18:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654453398;
 bh=VbW60G0Io2TlspHozLMI5SkQAbbzVkU83ar9CJKN2os=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=r2JaZpcxURXk/5aB9pxJibGVLRp4i0W0nHirWBPxvxVpnZ+cPZpEAmmRkz1fSWQ3+
 7DRzkHoLuZ8egdLfxXPLIMF6me/ngPCH4KssTorLDsPMWb+hqVPRuvHqwSQdnYcSIH
 6+aV03vF23qn+fS8F+TT60swJ/bQfUkp5QA59h9tx1pKp3zVQgNF0GoZKWpRNssYSb
 U23mff//iRzpplCCI+Ls37Cfu6E/qQjs40TDYQ3dyKCB6D16N21lHwuDsxUMtDQsXm
 EWGNJNahkYnphyvzUQND9J/LynZmLst1x1CkF+tdXBtm3BCTGKGTrrGGRvrRNTYxbk
 Oqu0j7EfjZMbw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F1B87C05FD6; Sun,  5 Jun 2022 18:23:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 05 Jun 2022 18:23:17 +0000
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
Message-ID: <bug-216050-202145-4vLaTYsOlH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #21 from Guido (guido.iodice@gmail.com) --- just after my last comment on
 june 3, I set /sys/fs/f2fs/nvme0n1p3/atgc_age_threshold to 86400 (1 day) 
 Content analysis details:   (-6.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nxuuT-006JvC-Iq
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

--- Comment #21 from Guido (guido.iodice@gmail.com) ---
just after my last comment on june 3, I set
/sys/fs/f2fs/nvme0n1p3/atgc_age_threshold to 86400 (1 day)

Despite this, the problem did not occur again. I have never rebooted, only put
it to sleep overnight.

Does this make sense or am I just postponing the problem?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
