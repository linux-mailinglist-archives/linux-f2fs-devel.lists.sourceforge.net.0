Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E8155BB1D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jun 2022 18:25:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o5rYG-0001Wn-Ny; Mon, 27 Jun 2022 16:25:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o5rYE-0001Wg-Q8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 16:25:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LRyhpP6B9Hi40w2BsezsE08xTDwvEaMysoqwqWJKlcc=; b=eYZVWRlE8vO+kAW7NNfc1pkOBp
 9ewVRVDYdMyMy8xqE5EMFuT+KvTuAQc7fPsPioeaBMIG6D1K3IKx7y6H6skAv4teKUo8C98hDEVlq
 inH0o3jKlgK/zeJdqQtqnoB/6A1poUjtc0ANDmUQXCunRm/jqwDx8Q5D0Z88NX/ty5ho=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LRyhpP6B9Hi40w2BsezsE08xTDwvEaMysoqwqWJKlcc=; b=XOh2NSsSXhOmziT8CvrWx2dWpo
 6lKPnye3XzMlmLRr71f/sGsAFAUBzsH3kcO/SUPAGx3I7v5WyaRRVWPbsWMoaD9x10ZuHHy9Qwny8
 w2QowoGPPIXofPxxoeh9MYGI/YwwxoGJpoPSm4+548YH64UzOuHb6Te1KKXp0FSSUcc8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o5rYB-00FnJy-7w
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Jun 2022 16:25:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5B6BFB810AB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Jun 2022 16:25:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 20239C341CB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Jun 2022 16:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656347114;
 bh=LRyhpP6B9Hi40w2BsezsE08xTDwvEaMysoqwqWJKlcc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ubBY3afVVBUFMaaQJCR2RuF2sYIjOXZtoUahEKErMSip48IVtSyjoJzwQIbWu4oTf
 qBc+0H7/Gjw90lkEP7iFYB1dNwSDpf0nYuEczFKoHnPyq1ESpzs3onfyVe41y+d9a7
 +nsy1Aia4Y8PgvI5OEaL0QELgw9moPYEGvuZ5V819iDqzbo4ExcZ3tHtsQbNRk8bOE
 7GXZDPyqOEFBDnjVDwHrH/dENFYboTp7C7r8TeMpZ5Y+B1+71nrJaKDjyXxfu4qmwW
 bmRaAf/k8c7XNYXruyG5v3gM6t7hWcKkpHX/zg6vTHLgOG0nS2lUstbogpm0t7hAQa
 WtH2l5PXmpH3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id F1875CC13AD; Mon, 27 Jun 2022 16:25:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 27 Jun 2022 16:25:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-gODhzuupmm@https.bugzilla.kernel.org/>
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
 #23 from Guido (guido.iodice@gmail.com) --- I setted background_gc=off to
 all the f2fs partitions. Nonetheless now I have f2fs_gc at 100% 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o5rYB-00FnJy-7w
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

--- Comment #23 from Guido (guido.iodice@gmail.com) ---
I setted background_gc=off to all the f2fs partitions. Nonetheless now I have
f2fs_gc at 100%

/dev/nvme0n1p3 on / type f2fs
(rw,noatime,lazytime,background_gc=off,gc_merge,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,atgc,discard_unit=block)
/dev/nvme0n1p4 on /home type f2fs
(rw,noatime,lazytime,background_gc=off,gc_merge,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,atgc,discard_unit=block)
/dev/nvme1n1 on /run/media/guido/nvme1 type f2fs
(rw,noatime,lazytime,background_gc=off,gc_merge,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=zstd:6,compress_log_size=2,compress_chksum,compress_mode=fs,compress_cache,atgc,discard_unit=block)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
