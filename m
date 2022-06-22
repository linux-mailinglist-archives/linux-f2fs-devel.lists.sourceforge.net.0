Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC435543BB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jun 2022 10:03:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o3vKC-00046A-IY; Wed, 22 Jun 2022 08:02:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o3vKB-000464-KX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 08:02:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d5Q20aS5c53nkW6taVs9l41cwTh7YMr7Fd/EO0mlgRg=; b=ZSiL8mRd1qFW9ozp3EH3poA7g6
 vsBoM+XWMOcnF5PtZCnJ0qgzHP0xwW94ndYH/DVEhuKuE9hsaWzwA3VK3Cds7WTkA7pnF/esC66nt
 TdL1zUW5U45J1qeegdrqklE7zcPSE9yGjDYvkLhyKsLsA6cMIWCQC6v2CnwjlgDKubtA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d5Q20aS5c53nkW6taVs9l41cwTh7YMr7Fd/EO0mlgRg=; b=N
 v0Q6UnQ/vkHNX2wuTNeOOPfAV+P/ujUlAU+HpdIvr4BGSlWBVJb6YNAQE83tT5AQTECHP0PCwtL54
 DPZ2ZxioMu7wgITyhXHEjiL/ZeS4dsD4MoiiJ3vDzZlKwRiGxX6XctDZozikjNkEl+3vYKMuxDcI7
 jN4QaDQvTLtuUKRw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o3vK6-00A7XH-0V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jun 2022 08:02:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D122261705
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Jun 2022 08:02:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4499FC34114
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Jun 2022 08:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655884959;
 bh=MxFCkSvFnRp4EvenLTZOHpp8fnufY3grP7701COduPg=;
 h=From:To:Subject:Date:From;
 b=Mtwbgn8LLZH71DEfYTu5B+lVcve9wahQbUsQgjb2UPwdmoY3HYZNg69umYFe0md86
 hwNycCyeMo2LemlmT8mXSBpnsFDB0OkOqAEbxqbJ2v5vFYfZzjzT8kj8coTiQKbIey
 PejFMhMvSuKVh2/FomNm8RR6O/L4ixHTUTyXfxrTWZmQ3Kga0WGQtyEBGu1Tkq5ZUT
 AhFUJ66Ju50XCiCkD/PDXDjovtx4OY1qpvtnrY8IArceL/1tcCM6s3tO/iR9HobjPj
 me53jL3K5WAggxbSIKVPV2lu5aPqwgKllTWdp1XaOPsygPzbc7Kfm0wXYXm4Nc2DgD
 ULqlooJsTHKiA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 21767C05FD2; Wed, 22 Jun 2022 08:02:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 22 Jun 2022 08:02:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: ghtm2@protonmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version
 cf_kernel_version rep_platform op_sys cf_tree bug_status bug_severity
 priority component assigned_to reporter cf_regression
Message-ID: <bug-216162-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  https://bugzilla.kernel.org/show_bug.cgi?id=216162 Bug ID:
 216162 Summary: F2FS filesystem with compression broken after kernel version
 5.18.1 Product: File System Version: 2.5 Kernel Version: 5.18.3+ Hardware:
 All OS: Linux Tree: Mainline Status: NE [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o3vK6-00A7XH-0V
Subject: [f2fs-dev] [Bug 216162] New: F2FS filesystem with compression
 broken after kernel version 5.18.1
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

            Bug ID: 216162
           Summary: F2FS filesystem with compression broken after kernel
                    version 5.18.1
           Product: File System
           Version: 2.5
    Kernel Version: 5.18.3+
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: high
          Priority: P1
         Component: f2fs
          Assignee: filesystem_f2fs@kernel-bugs.kernel.org
          Reporter: ghtm2@protonmail.com
        Regression: No

I've been unable to boot two of my systems after upgrading past kernel version
5.18.1.
Both of them are using F2FS with compression enabled.

This was the command used to create them back on 5.13.6:
mkfs.f2fs -l root -O extra_attr,inode_checksum,sb_checksum,compression
/dev/sda3

The command used to mount:
mount -o compress_algorithm=lz4,compress_chksum,atgc,gc_merge,noatime /dev/sda3
/mnt

A simple 
ls /mnt/usr/bin will report "Structure needs cleaning" on almost all of the
critical system files on kernels past 5.18.1.
Downgrading to 5.18.1 fixes everything.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
