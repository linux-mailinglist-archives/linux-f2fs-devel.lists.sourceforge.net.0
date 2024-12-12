Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F34B9EFBD1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Dec 2024 19:57:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLoN6-0006E1-Es;
	Thu, 12 Dec 2024 18:57:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1tLoN5-0006Dv-7X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 18:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lizXmmElrwpgJJFA8ucnUXU8UCQzbMk0kNwUz3kG6Sw=; b=IQPA2UdEhmL62NnDy9bnwTH2A+
 0f6pXyZVjDWH+5ROJ8TcHCNDmw+QjGXEwsABWQDnJ1lAknV7GEid2oi6PA1awtEQMJ1DDR2ZIQxuo
 EPi7WUUrwGrobEcTgHlK2x2GkSHecmFoJ6fIni7nA8YXVa9kIT5zZA9PcjMbnabQo+gs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lizXmmElrwpgJJFA8ucnUXU8UCQzbMk0kNwUz3kG6Sw=; b=FcZkQ1p+t9snapquG8b7qkZp1U
 WmidL6C9Sq9YR19F1PwTguY4w2/micJvQcjwdRivTIPz6831B3zA0JIOoG8IIVoBvHHdOGsMKbC67
 YqUHtVc9A8Q/0OrpBCufIBjlNMtRBI44szNcZeWBL5OocV2veBgbZ+H/c+DX0UAibGgU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLoN4-0008VQ-1I for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Dec 2024 18:57:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4C3A05C6898
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Dec 2024 18:56:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F587C4CED0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Dec 2024 18:57:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1734029824;
 bh=lizXmmElrwpgJJFA8ucnUXU8UCQzbMk0kNwUz3kG6Sw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Lu/juHegBIvDgO7S1PHuSQr/7Fqb8h7kkwGSzQ+J2f+Thb4tefgz3tOttagkPyLOe
 XNYM38BffNRT712xjumHomKm1Bvq7j/RU93rRTDGauY1NcRBHSVIiVgEThmmSea3JL
 NG16GPX0D9U0Zfdy4apyKZRbP/g2oFttdUadLFOrr+vgLFw6KJrT5zU2O6ZNdVBuCj
 cIsIHmibSI2NutuN1IFXpWk90to6JYL4ePuCnGLa9asqRKZHsVlmbnVvLeMz/6AG9g
 JS8kq0m5hlBaYcN2y6YyY7HVMz3s9WSgqSlaSbK1eRowSIXL5QKdRamZxFngJlX3i2
 IS8guioBnxYag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4D552C3279F; Thu, 12 Dec 2024 18:57:04 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 12 Dec 2024 18:57:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: piergiorgio.sartor@nexgo.de
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219484-202145-WQlevM0tFZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219484-202145@https.bugzilla.kernel.org/>
References: <bug-219484-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=219484 ---
 Comment #9 from piergiorgio.sartor@nexgo.de --- Hi all,
 I tested kernel-6.12.4-100.fc40.x86_64.rpm
 (Fedora 40, Koji build). This is supposed to include the patch and, for what
 I tested, it seems to work fine. No NULL pointer de-referencing, no crash,
 every [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tLoN4-0008VQ-1I
Subject: [f2fs-dev] [Bug 219484] f2fs discard causes kernel NULL pointer
 dereferencing
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
From: bugzilla-daemon--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: bugzilla-daemon@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

https://bugzilla.kernel.org/show_bug.cgi?id=219484

--- Comment #9 from piergiorgio.sartor@nexgo.de ---
Hi all,

I tested kernel-6.12.4-100.fc40.x86_64.rpm (Fedora 40, Koji build).
This is supposed to include the patch and, for what I tested, it seems to work
fine. No NULL pointer de-referencing, no crash, everything good as before.

I think you can close the bug, in case something else will pop up in the
future, I can re-open.

Thanks for the support!

Merry Christmas & Happy New Year!

bye,

pg

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
