Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BEAB98F73
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Sep 2025 10:47:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NocJGoCtSaPkuSLyuLXq2g4SeHM4QbC+eU7pfA+9EJU=; b=WPdnRMN8G46wu1fK35GAGpX0cp
	gV8NTC5T1sB3DqMEPjBeiDd3/sw89efnu52Wo8UGSzlDDXN0dwwIl7qV4glWestcbjmsAy5fYbVEE
	V089iW4+uGgNGkjPTJjthWO1ElROk2uW3+NwkLLj8RB68ZN+9MmWQMgWmdtZxq/09AN8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1LA3-0005oq-Sp;
	Wed, 24 Sep 2025 08:47:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1v1LA0-0005og-CC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 08:47:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=olcolpqAiN8qZPZtP/mPsyQcj6Zg71M/+3wpCRsR8tA=; b=H4hzlBOae/cWqa6kojftvaxekP
 l6P9NIiBdYP0bd2TXrlwaK2/yhlyqL7LqPbdKB0NlrYbLzHilf7TRcwAk7tRcUm/ziQBaqjnB7tOZ
 YLL5J6YA+2IwgqPR4Oo1r1hRa+qq3oOkQeheTcBExev4MsRn79hQDA7Gqa15SSP2NY7k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=olcolpqAiN8qZPZtP/mPsyQcj6Zg71M/+3wpCRsR8tA=; b=WlnZDOAIy0DlheO6ByiD6EeP1A
 0/M+lrBXgW13pw5fVykHtEja9s3Axkv0kk35DCxCx2CcLQ7XXbTr5eCSG5YUXB5VERtb+p22Y+lBP
 lyn+P+wjsty7DJ9wUSm/5kkiKCXcqcTnAX/Np3c2kNzQI33YiGEu76PIiQibpeT8CBpo=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1L9z-0001dC-Qi for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Sep 2025 08:47:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 23B8360007
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 08:47:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB23AC4CEE7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Sep 2025 08:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1758703644;
 bh=8B9Ckag/Z185TLVMZaRAa6qAYGM0YiWqVzrwNjLGPCU=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MXxOc0rcFtT3CE3m8BcB7S/caWK2aRg/ks+AiQpMb6RLV22pXho0/wejUHJfvn1cI
 A2AmCxkCvySHBGdzMu1Yuw91GMLSwtUaEKWHjWNxXz3kTG87Vz6bQC04odsHFM60fE
 /ljW/A11jgeP7dfJVdyZneaoUK1byrW7bgdctuszAjsU5gdRsGdyzZooA5nqkrzpM6
 tEbvovwz0cE83EruhCHFNp+zboej+n3hB1w7n5CaAju1erA8M8xMqhTpO+xUdY0eMo
 d+Zrb6WyEDX0TX9qov9LJrCG7zQMT8rE47YdQtolHMXbyV17js7iJw+7mvaaKQOYbT
 A5l6n8Yg2RS0w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B84A4C3279F; Wed, 24 Sep 2025 08:47:24 +0000 (UTC)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Sep 2025 08:47:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220575-202145-WNjU8jHkhC@https.bugzilla.kernel.org/>
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
 #5 from Chao Yu (chao@kernel.org) --- If this is reproducible, could you
 check whether we're suffer panic in f2fs_submit_page_bio()? if it is, could
 you please have a try w/ below fix: 
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
X-Headers-End: 1v1L9z-0001dC-Qi
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

--- Comment #5 from Chao Yu (chao@kernel.org) ---
If this is reproducible, could you check whether we're suffer panic in
f2fs_submit_page_bio()? if it is, could you please have a try w/ below fix:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 82ae31b8ecc4..959614de878f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -716,7 +716,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
                wbc_account_cgroup_owner(fio->io_wbc, fio_folio, PAGE_SIZE);

        inc_page_count(fio->sbi, is_read_io(fio->op) ?
-                       __read_io_type(data_folio) : WB_DATA_TYPE(fio->folio,
false));
+                       __read_io_type(data_folio) : WB_DATA_TYPE(data_folio,
false));

        if (is_read_io(bio_op(bio)))
                f2fs_submit_read_bio(fio->sbi, bio, fio->type);

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
