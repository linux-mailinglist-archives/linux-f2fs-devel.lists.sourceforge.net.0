Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB88B652AA9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 01:56:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7nPT-0000Vm-Bv;
	Wed, 21 Dec 2022 00:56:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p7nPS-0000Vc-8W
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 00:56:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CRm1Nc+RBKFWu1UkrN705Hh7qLH7V8KocPVx5FNQVDM=; b=kb+Re+Sz85OxgOlmzQFi2JCgSq
 IG40mmlMWTlqgKpGMEaZ6KZnJ4uf8i4DwI2uAbjBTMvK645WA3M/NQBdXk0RTJC8TqjLlkrn/5vrC
 gZxvfpvGghjhHKizc4drr+mYyrqxrmKkVVJcl5mArOvRMmQPUW9jtpXP+LgpgV8Dgwe4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CRm1Nc+RBKFWu1UkrN705Hh7qLH7V8KocPVx5FNQVDM=; b=Ta3g5qzMwTelibYiu6zVZBM75L
 7Q1xd3zKphjMgbB5AakJgHVzhwf5OwDlkIXH5tQpMoltt4hP3FY8HukJzo27Cd4twy4JzGpEHfy7f
 kBfOPhyAdJ3AeECXOh+wtKxjp1X0pGhfBUTpHoG6vswQht1Ma5UgEaUiUEIly6PzuMVU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7nPR-006GGd-Jz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 00:56:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 64569B81ACB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 00:56:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 29A28C433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 00:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671584188;
 bh=jbvuqMfAGBP0gXDXlwubkWjBOfFKRZWgIpkVsbE50ik=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=f9YVLxdlc4o2/T3lkX06EjGKMO9cA3JiQGtV77pRJwMfxgKhUTegeZCQ4RtQsvx1P
 0/KElMYet7/80wiiV+PuqWw8Untl3hrGZlXnzvLsN5/0zyvCyY3fFPmW1mrOSGmD7G
 TeuiwC2Vbx6L1CgIx2c+YlEsDALyMlvQZIkbmwsgbv29U8YsuzQNxLHocJOtMXUNid
 Ugm9r8FCJ0d4HWCXyBvOjILqpxU7Gh+VLYVS0QVjsSSNhedVB8Xs+/ZRv0uEEuOijc
 aVOHFZU2AIxXGOQB3TMJByF3eOmF748c68zU+Fi9uGTVMlpe7YQ60G6J17xvPB6TNL
 5elhoVTDj6C1A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 0B71CC43142; Wed, 21 Dec 2022 00:56:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 21 Dec 2022 00:56:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-jmFJp91wh3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #119 from Yuriy Garin (yuriy.garin@gmail.com) --- Created attachment 303440
 --> https://bugzilla.kernel.org/attachment.cgi?id=303440&action=edit debug
 patch log - page, folio and ref count 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p7nPR-006GGd-Jz
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

--- Comment #119 from Yuriy Garin (yuriy.garin@gmail.com) ---
Created attachment 303440
  --> https://bugzilla.kernel.org/attachment.cgi?id=303440&action=edit
debug patch log - page, folio and ref count

As you see, folio pointer is valid.

And, ref_count is not 1 before going to f2fs_put_page() - I guess, that's why
it does not work.

Silly thought :)

Interestingly, ref count is 514, which looks suspiciously as a binary flag
1000000010. Is it possible that during 5.17/5.18 implementation of a "pin",
somehow binary flag was written to ref count, or something like '1 << ...'
happens?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
