Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21419583968
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Jul 2022 09:24:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oGxsY-0001Nj-8O; Thu, 28 Jul 2022 07:24:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oGxsO-0001NY-LT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jul 2022 07:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+Son5teh1MVVLRrPIC03IUJkGdzZZZCyYDwCCg4uz/M=; b=Yrq5gur44VJEREPae/mZHIBeTr
 qO2rcjw0AgpInVh5TeSel3VV0sTNBSxmCXjfajmK4TIzoM7dHXUMJifimp09H56JH3feACBBjiV3X
 llNwD+pjd4MTP1F8F+Q/bxpaalStKdtnH32iyHOcVgCsDfIbrPsoAC6P17VsFrIKxy64=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+Son5teh1MVVLRrPIC03IUJkGdzZZZCyYDwCCg4uz/M=; b=J1xom+rlFTdHcdwUYyxzi0s2CU
 DK6gJmnBPJJKykH+mZoB99TtVBQk2/GSffnQCiakqk9/K6A32CuxW+Vh3UEhZfX6MCjK2Xn62BtdM
 jj98lrLjy+uU5JFdDN+r7GdoqIEOtAABJMBsFYuQFk6O2FjHyMprFZeMB7lI0TF62gEU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oGxsL-0005gc-GV
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 28 Jul 2022 07:24:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4D6D261B04
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Jul 2022 07:23:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A8663C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Jul 2022 07:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658993038;
 bh=+Son5teh1MVVLRrPIC03IUJkGdzZZZCyYDwCCg4uz/M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MhR9s91f3tMMz5k6SuH09tJpR8GOTXXg2us/DHqxPS1Ip9zDmetRi08SxtHZmf06y
 95iifrgf1iJ+AF1/+Xt9RYANXNQhQ+g3I7ct73Jmn+eeop1450Xl5DFahmjNNgJVSx
 GGsU8ye2RYSk1QIfpYPoStOFrvQVei5VY33MQmYCIYOpF+h9VeaclzkEbc0fQlKCvy
 Gdh4pITbI5JGTbd+RwzG9+i52cpIgX/KYS7hsGNQ9lZGjFxfTsPWjntXulV/wG9uOn
 w7ZDJd7AwpQt8QL19BI1a3zlvjyq4e79HQlr4Sgs3kPsxKu0udfAj8CSKebUFQOL2N
 iDt3OpZhIG8ZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 8B39DC433E6; Thu, 28 Jul 2022 07:23:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 28 Jul 2022 07:23:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bbutscheidt@yahoo.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-mkjEF4lfBT@https.bugzilla.kernel.org/>
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
 #40 from bernd_b (bbutscheidt@yahoo.de) --- That was what I expected when
 reading "debug patch". I will observe. I can expect the additional debug
 output to be shown with "dmesg"? 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oGxsL-0005gc-GV
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

--- Comment #40 from bernd_b (bbutscheidt@yahoo.de) ---
That was what I expected when reading "debug patch". I will observe. I can
expect the additional debug output to be shown with "dmesg"?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
