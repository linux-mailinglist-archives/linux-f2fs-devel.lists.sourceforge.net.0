Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EF9B57782D
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 17 Jul 2022 22:19:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oDAk1-0002Re-BA; Sun, 17 Jul 2022 20:19:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oDAk0-0002RY-EO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 20:19:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JmQyWn2RNZwydAK7uqvXp0q0wbwtnznkXTO71FjJ6Nw=; b=fC/hDt6hTrDbK/29u8lZgHDPhV
 K/cVUqi44RmcM5FCbtb6hJ3ROCT4am0dbwi746xHJmT4pR7eiXAtQndluUSgTBhxJWcFr+UTA2EXw
 KlbFHuOpGs+LO/N0ytsEbTs96egSfRTo/Liz+OMTE4fCAc639Hov+x5oYIzB0pJAFBfQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JmQyWn2RNZwydAK7uqvXp0q0wbwtnznkXTO71FjJ6Nw=; b=ii1byl/dO+uHZ8N6JarFC2d9iz
 TKOcGXpBKvxHAQXgUkrkAub3SpgyawqH5ZRssC2tHvUx8mMpqchlVdsgiqUFd59z/ruXstPKopWVW
 1149AhkXdxXERiL9NtgoHIOjFJd8NIzASmrOK2PapJO5u45J/LC4kg+h9AWyy6cjIuec=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oDAk0-0022wk-54
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 17 Jul 2022 20:19:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id BE5B7CE1041
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Jul 2022 20:19:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3401DC341C0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 17 Jul 2022 20:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658089175;
 bh=bFmeSgUBMQrI+snF0oiZAhLgTL298ZQxGqIPwnwcnf4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=AzRY2kagGsGyi/hUrFtfmDx22X99pPKvuE+EDa5PyjoAwWlGn7mdV3VCveJBcBE7I
 V4dxx1ppJTBzf3QlvzQrQjdz+LedPd0fBf2ufTThRlz1igh6OeQDJqWp/nqzxXNeu+
 3DJMVErMbXzTv4UNga/adAhz4iK70PAQg3Ik0pCZ23stBZe7WLw/EC/kULJkimtz8V
 tdSNrLTGZngsszJH1Afx+KzaRah7NfF32xN5wZGjC8qgZRtAXWGsDH/Sc7w77sSitC
 r9AxKlTXzkUjjwS29uG4bO5TK552bvKoxBeuauwlDUQGP36UK69VzlucAr+Kmh5sLf
 UFx+CihQ15yPw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1D8B7CC13AD; Sun, 17 Jul 2022 20:19:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 17 Jul 2022 20:19:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216162-202145-X2asmUYg2g@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216162 ---
 Comment
 #10 from ghtm2@protonmail.com --- Which f2fs-tools are those? On my end
 neither f2fs-tools-1.15 nor f2fs-tools-git commit
 c1144bf472f69fdfac8f3fd7634aab19b771c32e fix anything. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
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
X-Headers-End: 1oDAk0-0022wk-54
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

--- Comment #10 from ghtm2@protonmail.com ---
Which f2fs-tools are those?
On my end neither f2fs-tools-1.15 nor f2fs-tools-git commit
c1144bf472f69fdfac8f3fd7634aab19b771c32e fix anything.

This is the output:
Info: MKFS version
  "Linux version 5.13.6-arch1-1 (linux@archlinux) (gcc (GCC) 11.1.0, GNU ld
(GNU Binutils) 2.36.1) #1 SMP PREEMPT Thu, 29 Jul 2021 00:21:06 +0000"
Info: FSCK version
  from "Linux version 5.13.6-arch1-1 (linux@archlinux) (gcc (GCC) 11.1.0, GNU
ld (GNU Binutils) 2.36.1) #1 SMP PREEMPT Thu, 29 Jul 2021 00:21:06 +0000"
    to "Linux version 5.18.7-arch1-1 (linux@archlinux) (gcc (GCC) 12.1.0, GNU
ld (GNU Binutils) 2.38) #1 SMP PREEMPT_DYNAMIC Sat, 25 Jun 2022 20:22:01 +0000"
Info: superblock features = 2828 :  extra_attr inode_checksum sb_checksum
compression
Info: superblock encrypt level = 0, salt = 00000000000000000000000000000000
Info: Segments per section = 1
Info: Sections per zone = 1
Info: total FS sectors = 262144 (128 MB)
Info: CKPT version = 1a027a03
Info: Checked valid nat_bits in checkpoint
Info: checkpoint state = d5 :  nat_bits crc fsck compacted_summary unmount
[FSCK] Check node 1 / 1282 (0.08%)
[FSCK] Check node 129 / 1282 (10.08%)
[FSCK] Check node 257 / 1282 (20.08%)
[FSCK] Check node 385 / 1282 (30.08%)
[FSCK] Check node 513 / 1282 (40.08%)
[FSCK] Check node 641 / 1282 (50.08%)
[FSCK] Check node 769 / 1282 (60.08%)
[FSCK] Check node 897 / 1282 (70.08%)
[FSCK] Check node 1025 / 1282 (80.08%)
[FSCK] Check node 1153 / 1282 (90.08%)
[FSCK] Check node 1281 / 1282 (100.08%)

[FSCK] Max image size: 36 MB, Free space: 52 MB
[FSCK] Unreachable nat entries                        [Ok..] [0x0]
[FSCK] SIT valid block bitmap checking                [Ok..]
[FSCK] Hard link checking for regular file            [Ok..] [0x0]
[FSCK] valid_block_count matching with CP             [Ok..] [0x9be]
[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [0x502]
[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [0x502]
[FSCK] valid_inode_count matched with CP              [Ok..] [0x502]
[FSCK] free segment_count matched with CP             [Ok..] [0x2f]
[FSCK] next block offset is free                      [Ok..]
[FSCK] fixing SIT types
[FSCK] other corrupted bugs                           [Ok..]

Done: 0.000000 secs

I've updated the broken image attached to this bug report.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
