Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA33E6D1ED0
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 13:13:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piChd-0003zm-5e;
	Fri, 31 Mar 2023 11:13:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1piChb-0003zg-5H
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 11:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DF6kow94XVEq4U7961qmdSDRzqK77q3VQnLa4wP5pfs=; b=iys1pccyHycxqFst/sEFioC1M1
 BA870FR7tA5U3L2q6iE9wfZmhX0RCumbeAIdsv5izhreZW2zxpAC3wuP40gDp8dpVATzSYmswW2u/
 3EUOgorcCeLHhcebiFRVrbxWOeUcy9CXd5Xgg0h4nYP5KzrCvFVofsSOaWdDyvrXCKBQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DF6kow94XVEq4U7961qmdSDRzqK77q3VQnLa4wP5pfs=; b=lAx+rO6pNjwGPr9d5SctcbzNsu
 ObrXac4DaVjxhDK+cnQNkAQcHZXsBXXEq4QZXqX/lpWhYHCRkYOK2hGdgiwvcGYge3BYapTy/W6qP
 ylnaS1G0JCOwIEuZF7roxxTFOSnEIP8QvFmKUvPYhkqtldm83TWXGRHS7A2CRRVl2OjI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piChZ-0000JL-Pn for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 11:13:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C62E262790
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 Mar 2023 11:13:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A427C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 31 Mar 2023 11:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680261222;
 bh=DF6kow94XVEq4U7961qmdSDRzqK77q3VQnLa4wP5pfs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=deGXKYP3i1Hu1XXHl74q5jtFbY4rMLbY9B3UnHiYSax6GBqaGHaptOIeek6xHCCnP
 7+WtdaP8jL79H12V952XbkjNyueJRwMkgW7zmXjUU3gMRglG/8Eicyf4DxMYkUHtXC
 AJkTgvFA8EsYSv3C6Qh9DS9PtoeyMB58p7hfOEbv8O22j5RLS3TQESlyIjLRxKw0P3
 /7B6DZnS/NflYQWH6hukW5OG72k3se2OYfrmUmvrK6QBb/TsR9DIYsARm/8dnwq3s1
 LMgwQ2K9267wu+alriCCwlVPUZtVNRblK1bKy9P7kESotFXKQriqyPnHY+N323GLd0
 3BGGf343HvuAA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1245DC43141; Fri, 31 Mar 2023 11:13:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 31 Mar 2023 11:13:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-toD6t3eo6q@https.bugzilla.kernel.org/>
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
 #141 from Guido (guido.iodice@gmail.com) --- Today I forced the gc on all
 partitions. No problem at all. -- You may reply to this email to add a
 comment. Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1piChZ-0000JL-Pn
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

--- Comment #141 from Guido (guido.iodice@gmail.com) ---
Today I forced the gc on all partitions. No problem at all.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
