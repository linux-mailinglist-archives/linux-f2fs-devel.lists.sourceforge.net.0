Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 786415773F0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 06:04:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oCvVe-0003h6-PC; Sun, 17 Jul 2022 04:03:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oCvVR-0003gu-1r
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 04:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pJn6BtaJQ2LjRv5Tt0BZumKFAsqRACbvfhnOmvR5Pcc=; b=NgalEj/iNGS8Q8TukYCpn831VG
 u+YIIoy+fu7YasAjarYmAldbAnsoTGZOETh+sy7K/qMjHVhmv8VI+tlrzGPpLJUTeUMPRvq8ncWEV
 BQrWTgIleFPvEka3l3iI9wc031elTeif+671gF4ygmhlPvqGYnIhYCrh+pi8HKGsQDnQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pJn6BtaJQ2LjRv5Tt0BZumKFAsqRACbvfhnOmvR5Pcc=; b=kmEnnW76mB94aZLruHL/OUj6q+
 FcDZQ8bgAF9m6+jhWM4ZIUSnM1FDku002YxNY85uuPuJVThyikdg0cLfuXDE0j3eHcexMpnkoItlz
 sjiWzQ1wOQHLJ9nHfqsNfDxgvMDAIkXlgIQ/4ozzzM7t5L/Lg5VkCgN9XDqK/yyGwNo0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oCvVP-001XoK-1N
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 04:03:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A813860F98
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Jul 2022 04:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 10BFBC341CA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Jul 2022 04:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658030617;
 bh=VhZWgnI6Sl64SyVEUySnwBJehn28ngX2rH5r8Dd9OdA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=QzacU8DUvSw/PbtScQB4AZJspBwhMh5xuv8LId0CQ006KEfwiglRmFdfKrn0IeS5C
 GS2Wuojb6um9dQ0hSOX9hs/uVCmSTTR/1TxoCxTyIvtZ0WueEPN0yOKxc+N25quHfx
 yemSEYGUriac06vRpZFix21sURdeXSAFeTbTubjM9U0Ko7X0fSFr5Wyp4GuNn11YAr
 PCmXykONzmYORUFGh1k/kdneVsJZCqIHcob8ulVkAEalTcGfwnQH9NV9gKkJYY77mi
 K3ZhMORn9sso2Hm+Q7akOIgSRz+BiCC3ePvmBGU1MlULRUtC4PzgAGH7eU6E5VAnPf
 Gqbqo90vFV02A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EC7CCCC13B7; Sun, 17 Jul 2022 04:03:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 17 Jul 2022 04:03:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216162-202145-wOHtfuePvW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216162-202145@https.bugzilla.kernel.org/>
References: <bug-216162-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216162 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added CC| |chao@kernel.org 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oCvVP-001XoK-1N
Subject: [f2fs-dev] [Bug 216162] F2FS filesystem with compression broken
 after kernel version 5.18.1
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

https://bugzilla.kernel.org/show_bug.cgi?id=216162

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chao@kernel.org

--- Comment #8 from Chao Yu (chao@kernel.org) ---
(In reply to ghtm2 from comment #5)
> According to git bisect that I just ran,
> 198fd9faa271dd54dca6fc8eb6873f42dfd3b4d8 is the first bad commit.
> "f2fs: fix to do sanity check for inline inode"
> 
> I reverted that on linux-stable v5.18.9 and the problem is indeed no longer
> present.
> 
> Wile doing that I've found that my initial description as well es the
> attached image were missing a command:
>     chattr -R +c /mnt/etc
> Without it the compression wouldn't be enabled and the errors wouldn't be
> visible.

I can reproduce your issue and repair this w/ last f2fs-tools:

[reproduce]
mount -o loop ./broken.img /mnt/f2fs/
touch /mnt/f2fs/file
lsattr /mnt/f2fs/file 
-----------------N-- /mnt/f2fs/file
chattr +c /mnt/f2fs/file 
lsattr /mnt/f2fs/file 
--------c--------N-- /mnt/f2fs/file
umount /mnt/f2fs 
mount -o loop ./broken.img /mnt/f2fs/
lsattr /mnt/f2fs/file 
lsattr: Structure needs cleaning while trying to stat /mnt/f2fs/file

[repair]
fsck.f2fs ./broken.img

output:

[FIX] (fsck_chk_inode_blk: 728)  --> [0x505] i_flags=0x4 -> 0x0
[ASSERT] (fsck_chk_inode_blk:1182)  --> ino: 0x505 chksum:0xe7b707a8, but
calculated one is: 0x3f6daf58
[FIX] (fsck_chk_inode_blk:1188)  --> ino: 0x505 recover, i_inode_checksum=
0xe7b707a8 -> 0x3f6daf58

[verify]
mount -o loop ./broken.img /mnt/f2fs/
stat /mnt/f2fs/file 
  File: /mnt/f2fs/file
  Size: 0               Blocks: 0          IO Block: 4096   regular empty file
Device: 70fh/1807d      Inode: 1285        Links: 1
Access: (0644/-rw-r--r--)  Uid: (    0/    root)   Gid: (    0/    root)
Access: 2022-07-17 11:51:41.705230802 +0800
Modify: 2022-07-17 11:51:41.705230802 +0800
Change: 2022-07-17 11:51:57.641110482 +0800
 Birth: -
lsattr /mnt/f2fs/file 
-----------------N-- /mnt/f2fs/file         ---- compressed flag was removed by
fsck.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
