Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A7660539B4D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 04:36:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwEDI-0002a8-Lw; Wed, 01 Jun 2022 02:35:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nwEDH-0002a1-Ic
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 02:35:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qUwn5QuUBILVgJrzEwWuP8g+nvnlFFI0MNgpDzBD2pI=; b=dDMhi/THu+VCfYS2R2BJ3ZZFn3
 gXNp6as2aBbY+OZWk2NcfrKbJ/I3OUBGen9R+ePJTslL1wGHyvLq4voG6ja+bfsNcWpoDDYDbPYE7
 eycxiT4VuZql9rcJ8Y++cto9PhDfAoOR66vH2C9icZ7r+yx3nvBy/l8ro7iw+wADGM6A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qUwn5QuUBILVgJrzEwWuP8g+nvnlFFI0MNgpDzBD2pI=; b=N1mte78vy90Jvaw8FCtFZcHBey
 hbfRQ4HlIc8r0bOlNvRXdXVVJ/d2cQrBxZgyakzrYrJ5RZD2AvyG9/XGonRR341f4Mn1khkbq90ep
 FAsMQxBKVjQbzGHxnkf1WWIj8d16O4hdjH9MSn/FJk9t49TsyafB1XdNAnoiUF8cZ3Cs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwEDC-00EKcR-SI
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 02:35:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5FD6460DDA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 02:35:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C15C3C385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 02:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654050940;
 bh=2ZHzLc4QMMIihYc7kw0yz/ZFCHB59Lk7NDMIWbHHNgI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ZOFzXiHqT9KPtfZ4ftwolQZvVE+ooUCoKpZkX/FuIatDGnvlPHPz3XU7CR04xFSAB
 pPqXO1w8uiSMC3RSD68FgjheQc0OZeHaDMg9hKXKRdxE7VwFx1PI6XlCzAWQv15obd
 u0mPfsDEVrnyRtTNYRURMu1de0nVKLochONNoocUbgnK1bzxsMs0B3MOaXqChyKvAl
 +GXAe85/kQXMTjNS+7xrbW4pjHSNfeQWELq40/qSOa2zSHHYmkY80AfwaGGXAjMTuk
 fXMMnzq2t3LFa5DClxuqxIUCvcW1mXvqtMMycI9aUKtsvhy0gZGtd/y2cAM//M0730
 jZWxxzaikaa0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A6121C05FD2; Wed,  1 Jun 2022 02:35:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Jun 2022 02:35:40 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-bNls10Sqcl@https.bugzilla.kernel.org/>
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
 #5 from plague@privacyrequired.com --- Created attachment 301085 -->
 https://bugzilla.kernel.org/attachment.cgi?id=301085&action=edit
 cat /sys/kernel/debug/f2fs/status 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nwEDC-00EKcR-SI
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

--- Comment #5 from plague@privacyrequired.com ---
Created attachment 301085
  --> https://bugzilla.kernel.org/attachment.cgi?id=301085&action=edit
cat /sys/kernel/debug/f2fs/status

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
