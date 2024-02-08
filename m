Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88D9784DC6D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Feb 2024 10:09:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rY0PX-0007L7-Vo;
	Thu, 08 Feb 2024 09:09:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rY0PW-0007Ku-OJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 09:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q4iiopoLX9Ki+YI0Nyv9r9imiFgWvxHIH6w1gsKa0Dg=; b=Es8XLr/L4PEr8KCGMXRd55PUzQ
 XJ/VSnNiSL5HIjc6atooUeHkg/uh34N+48w3KResIBn1ja4U+IC2hFwGk+wItMkABj3aDR0YW1P3w
 al6ImNY4E1ilNPRnSK7heO+DkX8Io+Kol0ydzwtZ2lES8nVIRFsgXLzcEIse5jll7WKg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Q4iiopoLX9Ki+YI0Nyv9r9imiFgWvxHIH6w1gsKa0Dg=; b=j
 iBLyHRed21y3qAyfZaiY1pO0yZeY13GgX0JWX5Ih2V617Ss9EgHdWET5xaZUcpxUv6RR9EVY/gZy3
 Ex+ATYwlWGadzUwkXhDTIVsDzzF8yj06ReidSHtb5T++XUe8ZTUzUOtPV7qDhC61QfHWar8TZS8VI
 clJ9fcA/zEhNIdk0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rY0PS-0001h5-DI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 09:09:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3E549CE1B9F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Feb 2024 09:09:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 79F09C433F1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  8 Feb 2024 09:09:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1707383358;
 bh=I+Fjse8lI3pSnqeweUdmGY+nLl1ramc5xUpVCWULdI4=;
 h=From:To:Subject:Date:From;
 b=adv+FpC9bHdSdE2S1qllIWgHU2uV6ZKPz74+xdHy9wsrXoi6asxolIstWWkINIjYa
 TxjRHHSIv8Q6DXHcViCHO6phbSYO5My1T1aqcAgTT0JuApt2nnQgAQbxZtV+9IG9K5
 wjybwbgl3l6pRd0NxUlAGx86wcKnV3HODLmFStGFzS0qttTbINY5yNUKHiCuXliBuL
 g4RY2Ek7QPYED2SKgtfb9xfSuIkNxdDxUwfqCsNM9uS7E53IeNQUD/LoEsYJWcZsTT
 VVzPziU20MdIAMrQU+puEd+DfnW6MVm/ukm333q+TGxzPTlxg9IxbRtLVjH1sCZ0pJ
 USrePjoS94ZbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5ED9FC4332E; Thu,  8 Feb 2024 09:09:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 08 Feb 2024 09:09:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: dhya@picorealm.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218471-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=218471 Bug ID:
 218471 Summary: F2FS fails to mount rw at boot with "invalid zstd compress
 level: 6" Product: File System Version: 2.5 Hardware: All OS: Linux Status:
 NEW Severity: high Priority: P3 Componen [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rY0PS-0001h5-DI
Subject: [f2fs-dev] [Bug 218471] New: F2FS fails to mount rw at boot with
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

            Bug ID: 218471
           Summary: F2FS fails to mount rw at boot with "invalid zstd
                    compress level: 6"
           Product: File System
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: high
          Priority: P3
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: dhya@picorealm.net
        Regression: No

Using Debian 12.5 "Bookworm" and updated to most-recent stable release kernel
"linux-image-6.1.0-18-amd64" which changelog says:
  linux-signed-amd64 (6.1.76+1) bookworm; urgency=medium
  * Sign kernel from linux 6.1.76-1

When it boots the f2fs filesystem fails to mount read-write and the boot
journal shows:
  kernel: F2FS-fs (nvme0n1p6): invalid zstd compress level: 6

This is the fstab entry for the corresponding partition:
  UUID=XXXXXXXXXXX   /   f2fs   
compress_algorithm=zstd:6,compress_chksum,atgc,gc_merge,lazytime   0       1

Under the previous kernel the partition correctly mounts and the 'mount'
command shows:
  /dev/nvme0n1p6 on / type f2fs
(rw,relatime,lazytime,background_gc=on,gc_merge,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=zstd:6,compress_log_size=2,compress_chksum,compress_mode=fs,atgc,discard_unit=block,memory=normal)

I was able to remount the filesystem read-write with:
  sudo mount -o
remount,rw,relatime,lazytime,background_gc=on,discard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=lz4,compress_log_size=2,compress_mode=fs,atgc,discard_unit=block,memory=normal
/dev/nvme0n1p6 /

and from there was able to update /etc/default/grub to boot the previous
kernel:
  GRUB_DEFAULT="Advanced options for Debian GNU/Linux>Debian GNU/Linux, with
Linux 6.1.0-17-amd64"

I believe this bug may have been introduced with this patch: 
  https://www.spinics.net/lists/stable-commits/msg329957.html

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
