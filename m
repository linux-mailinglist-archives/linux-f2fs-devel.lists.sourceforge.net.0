Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC64E5398C9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 May 2022 23:30:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nw9Rx-0002jI-S7; Tue, 31 May 2022 21:30:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nw9Rw-0002iv-1Q
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 21:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fwbxQNdSF5iKo2qS6RMvzcB0AmD8aGpVQdrCGiBrLHg=; b=hATqW3nnfJ5M6r+V+5Fr2bBP7Y
 Osa1GtCtdzp3m/DDlsJOiuHWKUjc9snTyhBqQ/RW+NbAIpPXApv5rqq3ToaVb3B+QyD4fQrm3wOeJ
 yllIqkSaX0pOKuaLoj0wvtZXxYLIgazot1rUPxlouWk5FOvK07otpW/Hj3TnQaynBOpI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fwbxQNdSF5iKo2qS6RMvzcB0AmD8aGpVQdrCGiBrLHg=; b=bA6T8PaaqpPyC5EUy+L8CihEM4
 5mQxsjNXVh+LxUZ/eOzgF2Qg8xglj2JMDOhhMvIkAS4XPpedm4Vq2qEBdgU4DDzc82xo+/dQS1p9Z
 xBz/rY7EeEFhXdZkmJ+U8Z6XLYLiYMj/d91QAuI/TfgJc+narkv/+Lf8OmQBkCD49ND4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nw9Rt-0002gd-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 May 2022 21:30:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B6E8861343
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 May 2022 21:30:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1F9B3C385A9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 May 2022 21:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654032641;
 bh=FT28mP0ZiE7UAr9Y0aAMiod8CjNhU40xsWS8eSqKPUI=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=VznlFehggtfjQx4GvGKHQ8skHR8iMyvGbuvbVPakRMBBEFX6JOAW8QzwVkikBRmCM
 lTduymwCBLvj1HcOt3Hc9fQK9l+Xu8JGB0rWs2tXSYwZS+z6iapIEssiN98m+zDlv3
 1maFsauqQpzaMah3jd6uu3I5dpBXjT1AI93d1DLPO5xPBhi5Nu6n2KLRWnSrO31Gar
 Arlab2tbfP1gPv+ZlKL1XJozYUg4kiHZYDOeFy3gOJR712CzAikZ37purc1xcFVU5X
 bKKMj8xxJqPmqrHiSxZq3qRktd+2k4Dy2I1MliBZZROU3HV5JjEKTgUKwC7x/peLB+
 eyKUl2R2dHoUQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0333AC05FD2; Tue, 31 May 2022 21:30:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 31 May 2022 21:30:40 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-216050-202145-RWFaNdg5jm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050
 plague@privacyrequired.com
 changed: What |Removed |Added CC| |plague@privacyrequired.com 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nw9Rt-0002gd-Ow
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

plague@privacyrequired.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |plague@privacyrequired.com

--- Comment #3 from plague@privacyrequired.com ---
Same for me. Every morning my system is nonoperational due to f2fs_gc takes
100% CPU... 
Mine is on LVM (2xNVMe):

/dev/mapper/vg_ssd-lv_root on / type f2fs
(rw,noatime,lazytime,background_gc=on,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,nocheckpoint_merge,fsync_mode=posix,discard_unit=block)

/dev/mapper/vg_ssd-lv_home on /home type f2fs
(rw,noatime,lazytime,background_gc=on,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,nocheckpoint_merge,fsync_mode=posix,discard_unit=block)

/dev/mapper/vg_ssd2-lv_backup on /mnt/backup type f2fs
(rw,noatime,lazytime,background_gc=on,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,discard_unit=block)

-------
I cannot see any error in the journal or dmesg, except things timeout:

May 31 21:25:10 mefisto kernel: R13: 0000000000000001 R14: 0000000000000001
R15: 0000000000000015
May 31 21:25:10 mefisto kernel: R10: 0000000000000000 R11: 0000000000000293
R12: 0000000000000015
May 31 21:25:10 mefisto kernel: RBP: 000056041c75b640 R08: 0000000000000000
R09: 00007ffdc8d378c8
May 31 21:25:10 mefisto kernel: RDX: 0000000000000000 RSI: 0000000000000000
RDI: 0000000000000015
May 31 21:25:10 mefisto kernel: RAX: ffffffffffffffda RBX: 000056041c6ff430
RCX: 00007effb2a12a5a
May 31 21:25:10 mefisto kernel: RSP: 002b:00007ffdc8d37820 EFLAGS: 00000293
ORIG_RAX: 000000000000004a
May 31 21:25:10 mefisto kernel: RIP: 0033:0x7effb2a12a5a
May 31 21:25:10 mefisto kernel:  entry_SYSCALL_64_after_hwframe+0x44/0xae
May 31 21:25:10 mefisto kernel:  ? do_syscall_64+0x6b/0x90
May 31 21:25:10 mefisto kernel:  ? syscall_exit_to_user_mode+0x26/0x50
May 31 21:25:10 mefisto kernel:  ? exit_to_user_mode_prepare+0x111/0x140
May 31 21:25:10 mefisto kernel:  ? do_syscall_64+0x6b/0x90
May 31 21:25:10 mefisto kernel:  ? syscall_exit_to_user_mode+0x26/0x50
May 31 21:25:10 mefisto kernel:  ? do_syscall_64+0x6b/0x90
May 31 21:25:10 mefisto kernel:  ? syscall_exit_to_user_mode+0x26/0x50
May 31 21:25:10 mefisto kernel:  do_syscall_64+0x5c/0x90
May 31 21:25:10 mefisto kernel:  __x64_sys_fsync+0x3b/0x60
May 31 21:25:10 mefisto kernel:  f2fs_do_sync_file+0x18b/0x920 [f2fs
b9d199b68c91f6957b9756d57ec16e8bad3561b9]
May 31 21:25:10 mefisto kernel:  f2fs_issue_checkpoint+0x143/0x200 [f2fs
b9d199b68c91f6957b9756d57ec16e8bad3561b9]
May 31 21:25:10 mefisto kernel:  ? terminate_walk+0x61/0xf0
May 31 21:25:10 mefisto kernel:  rwsem_down_write_slowpath+0x1eb/0x5c0
May 31 21:25:10 mefisto kernel:  schedule+0x4f/0xb0
May 31 21:25:10 mefisto kernel:  __schedule+0x37c/0x11f0
May 31 21:25:10 mefisto kernel:  <TASK>
May 31 21:25:10 mefisto kernel: Call Trace:
May 31 21:25:10 mefisto kernel: task:NetworkManager  state:D stack:    0 pid:
3380 ppid:     1 flags:0x00004002
May 31 21:25:10 mefisto kernel: "echo 0 >
/proc/sys/kernel/hung_task_timeout_secs" disables this message.
May 31 21:25:10 mefisto kernel:       Tainted: G     U     OE    
5.18.0-arch1-1 #1
May 31 21:25:10 mefisto kernel: INFO: task NetworkManager:3380 blocked for more
than 368 seconds.
May 31 21:23:07 mefisto kernel:  </TASK>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
