Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2BEC3E4797
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Aug 2021 16:36:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mD6Nk-0002j7-Lb; Mon, 09 Aug 2021 14:36:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mD6Nj-0002im-0K
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:35:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A/K80+Jc0yJ2smK2vus5xmz1SUWk3GLci9dJe5oa2go=; b=WGDv6/3N/syYDjBI2Glqp6LrgT
 uocxl4TqP5nXwCz7Y1neKyuGKe3LEELSgqlHkJIxiJH/D1fJNWl65NfmxvXQRjU8Nspc8Egh1u/eS
 90kp07Z/LKN+fxSS7UQPtOp6WUbtwbfJnSUd447+vfKjeJA4aOBJWyuoSsvLUhBEDCpo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A/K80+Jc0yJ2smK2vus5xmz1SUWk3GLci9dJe5oa2go=; b=EtAYjxJvW9T+Q4W4GCycN8mHOi
 dT+zsd7/9/jleVMDlUyCLFKvxUpj9jDcf0E3v9Odkp+aeQ6eEwbDYYzX4YLF7EU/Wsr72jGYIkT29
 aX5YaI/kvvwZxAe0cQWChNSAXI53h+sphU7FsM0Qm4O5Zj1E4SLQyhDRmK1ElncGpkmU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mD6Nb-000fUq-MW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Aug 2021 14:35:58 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4ABC86101E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  9 Aug 2021 14:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628519746;
 bh=6O45Ybr8g2Fkv3UPcV6LtUpT8BgrDytZcT3iKSdBv2M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=oqqCDiuEcle4WpnoxG8lsfaJfskRc1i2LWJFIIBRG9mABB5WUpXjAUXINXhXgvPvk
 7ZXfnTPp8Hbgk3vbgT3ZMn94O9lr59+xIBRJb2RyhMWG1/F/PU/YwbMHq/JaIdvvsl
 HScj4g7d6/trekLpdkObnf4pISScCURDfwsl7kWeoT7TyGNDTyLMJ5J7tdUYaswSlE
 /HCYGV/Jy/dTSykKxFaKdkFHIzJHtRRxtkwK9Yzup43QAfwgZ0JTDCPXfbuWZ8SGkB
 PQtzK4lcUGwXiM5Mew2S+Bg7ZLaakYxRM0Au2kI68+xJGpVPvUI7f7kXETU43EgVEe
 Yjai/+SsBAFrQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 3939460E4D; Mon,  9 Aug 2021 14:35:46 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 09 Aug 2021 14:35:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cc
Message-ID: <bug-214009-202145-ck9xvsVUic@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214009-202145@https.bugzilla.kernel.org/>
References: <bug-214009-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mD6Nb-000fUq-MW
Subject: [f2fs-dev] [Bug 214009] Compression has no real effect in disk usage
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

https://bugzilla.kernel.org/show_bug.cgi?id=214009

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |ASSIGNED
                 CC|                            |chao@kernel.org

--- Comment #1 from Chao Yu (chao@kernel.org) ---
Could you please check below documentation?

https://elixir.bootlin.com/linux/latest/source/Documentation/filesystems/f2fs.rst#L824

We've added three ioctl interfaces to query/release/reserve saved block of
compressed file:
- F2FS_IOC_GET_COMPRESS_BLOCKS
- F2FS_IOC_RELEASE_COMPRESS_BLOCKS
- F2FS_IOC_RESERVE_COMPRESS_BLOCKS

f2fs_io command has supported these ioctls with below sub-command:
  get_cblocks          get number of reserved blocks on compress inode
  release_cblocks      release reserved blocks on compress inode
  reserve_cblocks      reserve blocks on compress inode

You can use ioctls directly in your apps, or use f2fs_io in the script to
operate the space compression saved, let me know if you have further question.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
