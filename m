Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8766F719C6A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Jun 2023 14:46:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q4hh4-0004ym-UZ;
	Thu, 01 Jun 2023 12:46:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1q4hh3-0004yg-FM
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 12:46:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zA5zh8TUsDaNUb3Scy1bc33znf2Di66y2kPpzn7qjIA=; b=ap8p0gzm9dMQe2BX1jD4wd62uK
 8Zox7MSUYycuTliFnqV7IPYf9PqHoBO5KrAvWovoNpUY/hczY2fghYqnK3uDsu/wTs5w+0PjtbZiX
 0/sf+/YzfblbwrKjK4cX0hMafG9ly+bJCRUj71vTTF07J4zp1MJMbKYzV4XILYMe7bsU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zA5zh8TUsDaNUb3Scy1bc33znf2Di66y2kPpzn7qjIA=; b=KYqN3rMhlSiVUoarLA5B241KAo
 1YTovExM9UFy7dFNOCnz6MYEXr1qwc/pBg7llet4tfCJT+vrXWDcqBEVmsP1i1xXTspmEGfryzkuA
 p560F2rcMchOEABT9pPTd/atJSIlVsNqb8qEIGfYxWJM0kmMv63sqKPIxzeOWVF5FB0s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q4hh3-0001vj-BO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Jun 2023 12:46:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EC1F064258
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Jun 2023 12:46:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 30959C433A0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  1 Jun 2023 12:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1685623571;
 bh=zA5zh8TUsDaNUb3Scy1bc33znf2Di66y2kPpzn7qjIA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=YPZsEzXQDL19nmqxHM/5nGVu8pfj086EtGDHEMMhLPMfxa6DEeETTjIRtofBx+2mI
 LqRsZCAFinDttob8oStEx4CPQv7i5MlxlY5gSRAB1++HcsQTVqMxFPXBL2xJC2a7oD
 wvGvOE4dvcq1sJiejpG4r+7Zmiuxl9nf908XQH4n3SMZAqLac4KUF/FseR1Pq8zTQe
 VFlAmeA6wwOvcDk/vN+0W/jBsR04yP+jb5KnF9cGrzCN7HrOyY4KrusKycuQrKgW7E
 xOswQ0dL3ITmtXMjPznw1BEBwCtHTKiJCJkU83xQndoAK8DiR7NLUynaf8fUHtHc3c
 Oojt1DQqNL1sA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1B844C43143; Thu,  1 Jun 2023 12:46:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 01 Jun 2023 12:46:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-5VFpkbFEpO@https.bugzilla.kernel.org/>
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
 #171 from Guido (guido.iodice@gmail.com) --- All ok here with kernel 6.4
 since May, 5th. My mount options: 
 Content analysis details:   (-5.9 points, 6.0 required)
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
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q4hh3-0001vj-BO
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

--- Comment #171 from Guido (guido.iodice@gmail.com) ---
All ok here with kernel 6.4 since May, 5th.

My mount options:

/dev/nvme0n1p3 on / type f2fs
(rw,noatime,lazytime,background_gc=on,gc_merge,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,atgc,memory=normal)

/dev/nvme0n1p4 on /home type f2fs
(rw,noatime,lazytime,background_gc=on,gc_merge,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,atgc,memory=normal)

/dev/nvme1n1 on /run/media/guido/nvme1 type f2fs
(rw,noatime,lazytime,background_gc=on,gc_merge,nodiscard,no_heap,user_xattr,inline_xattr,acl,inline_data,inline_dentry,flush_merge,barrier,extent_cache,mode=adaptive,active_logs=6,alloc_mode=default,checkpoint_merge,fsync_mode=posix,compress_algorithm=zstd:6,compress_log_size=2,compress_chksum,compress_mode=fs,compress_cache,atgc,memory=normal)

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
