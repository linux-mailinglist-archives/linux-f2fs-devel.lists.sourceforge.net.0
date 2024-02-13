Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCB8853256
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Feb 2024 14:53:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rZtDi-0001sa-TS;
	Tue, 13 Feb 2024 13:53:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rZtDh-0001sT-9X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 13:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RbsjpZws52TdwGTvHYKP7fonq6gxj2yVIg8pDnAGRBI=; b=aFyujDOMsKiIvRALByU0iubWgN
 t7/Ck0CN/zHA+2KXlBpVe98k+11KXHPAYapLN/Z/lbSBmBBbby6UrK1/V+AD6sqyKYYqFUCvShnh6
 ZlssLLhKHuO59TsDhcao2UrBnnmgHfu2udGyzZ+7/VJkgV/W/+fDliE1pEN6P+nPz4Aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RbsjpZws52TdwGTvHYKP7fonq6gxj2yVIg8pDnAGRBI=; b=bZB/ldkzHrzG6iPXcM68rJ4BcO
 +7V177j9X7V/OZfhgHxa3dScY0Cr0x07CJGwMz5k2LviU3vHb8Lz6LcQhq/P3kEOKypOWJrYiPvz/
 fU/JI3toi7pgMSS9fy0EanVO0U8nAJY6bqKHryFhyNpLkLOAnSOsy5ZgMRryumB4sdf8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rZtDf-0006XF-3D for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Feb 2024 13:53:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 6094A61467
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Feb 2024 13:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E335C433F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Feb 2024 13:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707832377;
 bh=+alED/L09t8c9ylRCLRpogCPrZpqW9r+6ipXLUZJKBE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Cwzymak2U8ZuUrAvwNPBosDYHzXAuw/8W76G5uU+IkwmLmKA74rSNUXG6DEVlbll9
 FfAyS1+VpeeY6QFbP97XNlu63fVvIJHFnFykRnfJKDs5HU/EoleHku4RuoJK5wZjrR
 UPQnXU9UXcI+k4rb/T6Z/mnaTm/kX82Ou9HdQYPXoZ4DZ4sH+SGYlMsSuBrXbekNTL
 Kxg/GdbVsXDsBpuO4KXoitapLRJgDrKctP3PiooEP/64Bk0n2y59dML2SADjSqGTqN
 UOsi0cYpP4+SILilJ3AsbsKw4+gWUhjlelMd/OfuJeYLzo7oPsBt1FXXsdBA2Bzk6k
 qEiwkzJac+ydg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E7C1CC4332E; Tue, 13 Feb 2024 13:52:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Feb 2024 13:52:56 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218471-202145-5G1dVugPci@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218471-202145@https.bugzilla.kernel.org/>
References: <bug-218471-202145@https.bugzilla.kernel.org/>
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
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=218471 Chao Yu
 (chao@kernel.org) changed: What |Removed |Added CC| |chao@kernel.org 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rZtDf-0006XF-3D
Subject: [f2fs-dev] [Bug 218471] F2FS fails to mount rw at boot with
 "invalid zstd compress level: 6"
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

https://bugzilla.kernel.org/show_bug.cgi?id=218471

Chao Yu (chao@kernel.org) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |chao@kernel.org

--- Comment #4 from Chao Yu (chao@kernel.org) ---
(In reply to Dhya Pacifica from comment #0)
> Using Debian 12.5 "Bookworm" and updated to most-recent stable release
> kernel "linux-image-6.1.0-18-amd64" which changelog says:
>   linux-signed-amd64 (6.1.76+1) bookworm; urgency=medium
>   * Sign kernel from linux 6.1.76-1
> 
> When it boots the f2fs filesystem fails to mount read-write and the boot
> journal shows:
>   kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6
> 
> This is the fstab entry for the corresponding partition:
>   UUID=XXXXXXXXXXX   /   f2fs   
> compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime   0       1
> 
> Under the previous kernel the partition correctly mounts and the 'mount'
> command shows:
>   /dev/nvme0n1p6 on / type f2fs
> (rw,relatime,lazytime,background_gc=on,gc_merge,discard,no_heap,user_xattr,
> inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,
> mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,
> fsync_mode=posix,compress_algorithm=zstd:6,compress_log_size=2,
> compress_chksum,compress_mode=fs,atgc,discard_unit=block,memory=normal)
> 
> I was able to remount the filesystem read-write with:
>   sudo mount -o
> remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,
> inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,
> active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,
> compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,
> discard_unit=block,memory=normal /dev/nvme0n1p6 /
> 
> and from there was able to update /etc/default/grub to boot the previous
> kernel:
>   GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with
> Linux 6.1.0-17-amd64"
> 
> I believe this bug may have been introduced with this patch: 
>   https://www.spinics.net/lists/stable-commits/msg329957.html

Can you please try below fixes:

[PATCH 6.1] f2fs: add helper to check compression level
https://lore.kernel.org/linux-f2fs-devel/20240212160530.1017205-1-chao@kernel.org/T/#u

[PATCH] f2fs: compress: fix to check zstd compress level correctly in mount
option
https://lore.kernel.org/linux-f2fs-devel/20240212160818.1020903-1-chao@kernel.org/T/#u

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
