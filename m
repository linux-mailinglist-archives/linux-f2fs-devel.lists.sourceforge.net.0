Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F5D4D0637
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Mar 2022 19:18:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRHvn-0005wk-Pg; Mon, 07 Mar 2022 18:18:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nRHvj-0005wS-R8
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 18:17:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=++lNHsm7VoLdTEJ67hLCXcs6k/itw5jjWZvaVfoVJ6o=; b=Hg2F7VqHqr4htcVYDg1Glq9LDQ
 SNLE9pPZuUKbe1873HX+9gM0oQl3hQYTql/JwNQXNFcmIA1kY9z4+8Ypk1fPEOPpTKxt0/aSjsuSO
 B1A83RBQWsMFQMfFaIFAIgUU4xCbpu8ac7KN+LDZffz4SETGsqByGJGUwdTTuo/6O2L8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=++lNHsm7VoLdTEJ67hLCXcs6k/itw5jjWZvaVfoVJ6o=; b=hnxvhfW8G0bLQSvXF03P6evHEU
 p/eX+58nV9NcAfc4uUxlOT2ou12iE23j4U4KEVWfJdS0AO2LZIBr6FZG3ezZQ7OKZ+YENhTvAN8N5
 5HQ9JmN/BNpGLDO5nrJD1pCCpiuk+C+lQuuj3cigRmV00G5hsxxaxp4f/67bVoptrna8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRHve-00024B-3z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Mar 2022 18:17:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B05BA612A1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Mar 2022 18:17:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82555C340E9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Mar 2022 18:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646677064;
 bh=++lNHsm7VoLdTEJ67hLCXcs6k/itw5jjWZvaVfoVJ6o=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=saO0jxILW1bG+zqr5/2GpLd7lDYSHgcu7cvMZF5pPvmXPvwzV4bZBHQk9smEs013i
 SK6bzCZiJqHVY62RMge8zNeMAngDuZVZygSDM7MVS+mGHECDtvNUGn6L1pW7ohDVSA
 FsHtsNMw1+/iYYNgs+Mqz5oGlHJn11hJdIVKS8NPm1we1jt6XZFpYrPp28K99zebFE
 jWokJ3LbQkdUl+vwOhOBS1GDwRYzCXAg7DmNa1vTJSqvqgJ37WUyRGA39y/QYAx2Zw
 2G1KrKX2CLtRfzWIwaFp7RhuiSwvUF20bOjDqAdEMEseV7PdnhYkq0I6TBrEYw2P8I
 /iXUpPSxEMl/A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5CBDFC05FD0; Mon,  7 Mar 2022 18:17:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 07 Mar 2022 18:17:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wenqingliu0120@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215657-202145-C6NDBuEg4c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215657-202145@https.bugzilla.kernel.org/>
References: <bug-215657-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215657 ---
 Comment
 #2 from Wenqing Liu (wenqingliu0120@gmail.com) --- (In reply to Chao Yu from
 comment #1) > Hi Wenqing, > > Thanks for your report. > > I've posted a patch
 to fix this issue, could you plea [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRHve-00024B-3z
Subject: [f2fs-dev] [Bug 215657] UBSAN: array-index-out-of-bounds in
 fs/f2fs/segment.c when mount and operate a corrupted image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215657

--- Comment #2 from Wenqing Liu (wenqingliu0120@gmail.com) ---
(In reply to Chao Yu from comment #1)
> Hi Wenqing,
> 
> Thanks for your report.
> 
> I've posted a patch to fix this issue, could you please help to verify this?
> 
> https://lore.kernel.org/linux-f2fs-devel/20220304014913.3966369-1-
> chao@kernel.org/T/#u

Hi, Chao,

Thanks for the fix, I tested it on 5.17-rc6 and the array-index-out-of-bounds
wouldn't be triggered anymore.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
