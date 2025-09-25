Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEFFEB9E18F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 10:40:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Fbaz9revG+Hkqf6TRgDJzfuRKC7dQq1XyLNfi8Nt3Q=; b=GZF6JBFyL1bQ7aK6qynTtU/RYW
	wtnTr4pFt4CAnpKdeVDKGhlta6Brpgw3pswcE3gJ+yZt42khuZhsgbplieRUBrGByDmPLCZSnOF8p
	pqA+jaJXMVbrq7wDU9gGVvKfUp4dMsnkG/VsT7JxDSp7tSXv6ZjXrf5w4BWgtx6TaSkw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1hWj-0002O4-6R;
	Thu, 25 Sep 2025 08:40:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v1hWh-0002Nw-LL
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 08:40:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xTDySY+ES/FJFipx5A+CFyxLYaCKwXUyWa9t4h1rtN0=; b=cGqQ0AGsxsvYHJL3xoY6soeFtG
 nZApyMkIICtLtLOjy0nK/G876uKwe8hEQb/beBKoH2IFmYJMf+kBaLweCu1TX7OLFDcRVTlv4qg6I
 4/X5nsShugNBGZe+sqyLtRF/xg0DJwrEQPiw7bm2/HqMuzHYdOJmBpVDBiCC6SDB9zAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xTDySY+ES/FJFipx5A+CFyxLYaCKwXUyWa9t4h1rtN0=; b=PSHCk5M8FKSiIX2JNaTZHsLOhw
 9pdNtCjFXf/VuYZK5XAMn4mhg9ZT2+e/Vztg1GQRW3FSwbcfnjROezdqbTxeO6foNXI5AdzNrLI2G
 wKWzZRewnXMee94EPKyPEt0tZrkw6dsUhhYa3LKuaO94k/Evf2mlpnxKYFOX1zyPEv4g=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1hWh-0008Vc-TA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 08:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1DA8D6042E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 08:40:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4198C4CEF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Sep 2025 08:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758789625;
 bh=xTDySY+ES/FJFipx5A+CFyxLYaCKwXUyWa9t4h1rtN0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=quF4gV9yUdlBV8mqmoF+J/eJJs57aemDUQCXiIfrj/wKFvuv5apkz0Kvdl4ogFI8O
 71Dw9B0/YG9Iic0jGsgeRi48Z0fLfGsMiGncJn4qSFBxYENbAEDcoCM7EVd0kFYuAR
 4kfpgifdR6YqrNq/XoVRElnzTqSiS2ZqvlIjpYhmoURDHxi1PmFxYiH3Px5l8Kraen
 Wfy4q34JIyi6PSszDH4gnHGQVyZ8FV1uCpgBAEH8kRJ2wcQ4KGJagx8UdmfI/Mnxdn
 Yc0OlyQrwwVrtO7rOKJkeHWhPjSy4dLa8c9o4sYcaGGLgsRnLsM2/1ahC2VBSmDPIh
 i5SQIj6zb11kQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B4E28C4160E; Thu, 25 Sep 2025 08:40:25 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 25 Sep 2025 08:40:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-vYllEC2DzM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220575-202145@https.bugzilla.kernel.org/>
References: <bug-220575-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=220575 ---
 Comment
 #10 from Chao Yu (chao@kernel.org) --- Your device is using software
 encryption, 
 right? If so, page will point to fio->encrypted_page which is a bounced page.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1hWh-0008Vc-TA
Subject: [f2fs-dev] [Bug 220575] Unable to handle kernel NULL pointer
 dereference at virtual address 0000000000000000
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

https://bugzilla.kernel.org/show_bug.cgi?id=220575

--- Comment #10 from Chao Yu (chao@kernel.org) ---
Your device is using software encryption, right? If so, page will point to
fio->encrypted_page which is a bounced page.

https://android.googlesource.com/kernel/common/+/e0e2f78243385e7188a57fcfceb6a19f723f1dff/fs/f2fs/data.c#890

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
