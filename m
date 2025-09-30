Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 988E9BAC8AD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 12:45:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYKa8E4QeUKgpcObt3TUsiE5GbYZPalZIFIGTWEoLvI=; b=E3wdbf83cFjhLhaMuCB311yV1P
	nNQDklOr2akNHNzsVxDOtuMP18YBKKeXrYy7e+AwK8N8w7SjvJQrA09UyrH4zwet/3lsxY47YwxxV
	yG60dEuVLdreEnAZyVCHeLjbtF/rF68P31LW92ZBJaL9zaTabJ3I6sgiWYkhwzmCIUno=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3XrD-0001rR-E6;
	Tue, 30 Sep 2025 10:45:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v3XrC-0001rK-Fg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 10:45:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IxGoFP+ocj1h+TmUdTSMkVZ2eIf041Qz3mcqCN0dx3M=; b=hH1n2FT1RAIR/YVodQh9yYK+ZH
 z0SU8mo2KTlvbrfqsTnEwnyQrAgA1yQanuhRwcTUBqHUdgA3uBxuqFwq1PqaAcRWk6U3BHM+H1rKi
 dnJKZaN8czi7+zBfpdk0LXUX18bMctYbt38noGkUmNfCbLqKcFDVEGNZoY6MX2qbQP+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IxGoFP+ocj1h+TmUdTSMkVZ2eIf041Qz3mcqCN0dx3M=; b=iGNSKwfhxp1aH7/uAOuTAEoivF
 T2JodeA4l0/FUSHvJM+Nfq8vscVEUDDJ9ovT9vk03EfNU1fbE4SIXMgLp2Hvw+OjlNbEF0gb6ohYz
 ajFlTpoxkYtVsvHU5MEWxQjrG2gUH+Sv/vAae+E0rdOSAw5Mt18+aO5IYAjous6FNucw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3XrB-0002fW-VB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 10:45:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 45F5543A11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 10:45:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 23086C4CEF0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Sep 2025 10:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1759229112;
 bh=IxGoFP+ocj1h+TmUdTSMkVZ2eIf041Qz3mcqCN0dx3M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WPx0vER1B4fPWAkOzioAuLsDd8Wq3CsOWt1JVdba+YDdlz8j23yeMPtC+2jP2VoG+
 JushbaSqV6fLZN2h6AkqK03WEV/YR9NXBr8i/xdxLI/wsdhx/FsQpCDx4UJqr+1ddc
 VzUwbo5evPlPAUqB8QVHmxlH3m0m3k/twqd/H7/A3cwrLCPVf+ppxsT4TG5ZD6dZZP
 oV1zpNjmw2iuTkMT22aJfIlTqFmKlJmaHAUdrYWY732BOqPEZGISSKbizwRdtFmj+f
 +sezda49v5P9zoxNArVCP6Cholj5lgt+RQpNiEpt2c4mPTJYtQaplGJwwaHMS5yub/
 rNFPzSlT0dILg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1C668C433E1; Tue, 30 Sep 2025 10:45:12 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 30 Sep 2025 10:45:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: JY.Ho@mediatek.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-ySLg8M6sMD@https.bugzilla.kernel.org/>
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
 #14 from JY (JY.Ho@mediatek.com) --- (In reply to Chao Yu from comment #12)
 > Hi JY, > > I've figured out a reproducer as below: > > 1. mkdir /mnt/f2fs/enc
 & encrypt /mnt/f2fs/enc > > 2. R [...] 
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
X-Headers-End: 1v3XrB-0002fW-VB
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

--- Comment #14 from JY (JY.Ho@mediatek.com) ---
(In reply to Chao Yu from comment #12)
> Hi JY,
> 
> I've figured out a reproducer as below:
> 
> 1. mkdir /mnt/f2fs/enc & encrypt /mnt/f2fs/enc
> 
> 2. Run below script in shell #1:
> for ((i=1;i>0;i++)) do xfs_io -f /mnt/f2fs/enc/file \
> -c "pwrite 0 32k" -c "fdatasync"
> 
> 3. Run below script in shell #2:
> for ((i=1;i>0;i++)) do xfs_io -f /mnt/f2fs/enc/file \
> -c "pwrite 0 32k" -c "fdatasync"
> 
> Now, testing below fix.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/
> ?h=bugfix/syzbot&id=1d024fd4c6fed3767f063db79746bcd2d0be49d1

Hi Chao,

In my kernel version (
https://android.googlesource.com/kernel/common/+/refs/heads/android16-6.12-2025-07/fs/f2fs/data.c#926),
Should I modify:
- inc_page_count(fio->sbi, WB_DATA_TYPE(page, false));
+ inc_page_count(fio->sbi, WB_DATA_TYPE(fio->page, false));
Is that right?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
