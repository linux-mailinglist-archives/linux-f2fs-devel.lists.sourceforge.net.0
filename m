Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7539A63FB7D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  2 Dec 2022 00:00:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p0sXf-0002UH-DO;
	Thu, 01 Dec 2022 23:00:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p0sXM-0002U0-N9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Dec 2022 23:00:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xlffDjZ3Qb2eijRiLevIdDSeWl8EHKE8r4fjajB64GM=; b=U72cDu0fqJ6rnVm1Jfdbp/s5cW
 lund8aJ3zNzNEQdAm0rnVQQtcrQLpMwLI9aKnHaKTkG27DfE5LrrGchoHyO6+DvzuCkP6JU7VDI1S
 YXK9uUJBeUtu49IlusGKPaPGudnHz9+Z9gyixmZY4ivszSMr5iB9xdPZDUTs5S0yFNis=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xlffDjZ3Qb2eijRiLevIdDSeWl8EHKE8r4fjajB64GM=; b=YuciBgmpdW5K8Yjx4P/ayf3KUx
 XHTEyCJ9ZrJmwlqVPilbRZ3exU74MS+5RIoN2QSd2U1lQGWESsjtICZwZF0L2058ofS5Pi0xhvGz/
 xRZIN+lZJiyb0oIfdh11XjaiOaLhO9ySsgbq/+/K5g9JJzIz8a4n7MamFe72MEuqPk5g=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p0sXH-000467-U3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Dec 2022 23:00:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7923C62183
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Dec 2022 23:00:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9F38C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Dec 2022 23:00:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669935601;
 bh=xlffDjZ3Qb2eijRiLevIdDSeWl8EHKE8r4fjajB64GM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=F/WIeXr5fY16Ed9JIWVB5yjOubrb9FKX+7P4I8DcAfSFRWla06qqsVo6RZAtuAdSD
 EX8sHseMg5FZ9u5+O12WEMAsmpnxR3wgmoDJibkA1z53jEajGzLEcmFefvvF5TqhtO
 FV58jiUwQ2Cjdb+SmOMLKcuU0iAj/M3h6ZUdlFd/OeyfFQ9kaCBZU01lKMtrymZ8Nw
 zYGmjFoWM9s5L4U+XArOThsWygGlv2TZLZE0EwvJJzZGcts1JRyFfmEvDffS3AIHsx
 gb3n21SIYInu9M0anJboTltainsemmYseNW6GM+5ucWsKSJ4DCpbPF+Nz3/BDBA2//
 h0pjbhOGzNs3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id AF7E7C433E6; Thu,  1 Dec 2022 23:00:01 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 01 Dec 2022 23:00:01 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.nicolae@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-VhMIrVUoHc@https.bugzilla.kernel.org/>
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
 #96 from bogdan.nicolae@gmail.com --- Well there's also a possibility that
 the mapping of the inode changes since it was initialized in the beginning:
 struct address_space *mapping = inode [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p0sXH-000467-U3
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

--- Comment #96 from bogdan.nicolae@gmail.com ---
Well there's also a possibility that the mapping of the inode changes since it
was initialized in the beginning:
struct address_space *mapping = inode->i_mapping;

How about printing all three: page->mapping, mapping and inode->i_mapping.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
