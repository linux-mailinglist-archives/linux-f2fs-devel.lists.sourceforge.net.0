Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 488396FDE44
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 May 2023 15:13:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pwjd1-0004aD-L1;
	Wed, 10 May 2023 13:13:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pwjd0-0004a6-Cr
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 May 2023 13:13:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kOXLRAUtWsfPIph4fB4zBArBmyrjBihfjPdEFWFVIPM=; b=iWicpgliAhdsbbvRqXM78WNPAp
 TBl0DzlApCbu83+H17FmVKdx2/1N3w5orrPxn/bqxvBCSQt86NbVFKKGGIFG1eiRtLLVoUd+DOPJC
 WY4eAsMrceVbHzAvwmf53BMyGcv1SEVlnSm4AJaCTt5yQdugSRnN2Yxlwrq7lLyEavqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kOXLRAUtWsfPIph4fB4zBArBmyrjBihfjPdEFWFVIPM=; b=JZp8U84k19jMLK9d5C8wChe40G
 2iha8NYQmQmRUVTIU5BJPJMflc2PqJRIqCTZsiMjtwNwP7c7em8m2kIjWfcewz7qJ+ZmRsA9StDDg
 fHduUQJua/WWUqjKMyaEvgpVM+UXIW3MPNhpDxf1wPBM4knWqELoHlKbo3RrXaUi/3uE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pwjcw-0005YP-5h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 May 2023 13:13:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F38163353
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 May 2023 13:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 395FFC433A4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 May 2023 13:12:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1683724377;
 bh=kOXLRAUtWsfPIph4fB4zBArBmyrjBihfjPdEFWFVIPM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=KEaWrJmngIl1yWCYqCqHPpAIzOEuZKH7X5g+ozLOiEZ1u+30aT4UO+VuouiiCiI+/
 bIZjx4bYWrnj/WN5Kmv0xlql7pBwwJm1ikSrSnZG/DxplTKqzVyFgr3kVl0PA0m/WD
 zfXzv1R393YvN3qj0mPM9cGIf587SgUqJNhh+6OqFl3eh8Ice1Cgkca/lRgL8HowGS
 j9L6d8tnsDAceZzpMUautJQ+2L96SVUWPhOHHx7AbVVUTtQIlhvhBRWih+aUrjkNNa
 7IGO7MIB86ALbTdAq+WoYuOFU607nfLRE+e/KRMUUtVPelTZ04vATJ7yc/cqPqEjK9
 cjVYkOlCRBvsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 27CF6C43142; Wed, 10 May 2023 13:12:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 10 May 2023 13:12:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: pikatenor@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-CKiRY80VIJ@https.bugzilla.kernel.org/>
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
 #170 from Ryotaro Ko (pikatenor@gmail.com) --- Since posting comment #158,
 I have been using the patched 6.2.10 kernel for a while. Initially it seemed
 stable, but in the last few days the [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pwjcw-0005YP-5h
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

--- Comment #170 from Ryotaro Ko (pikatenor@gmail.com) ---
Since posting comment #158, I have been using the patched 6.2.10 kernel for a
while.
Initially it seemed stable, but in the last few days the problem has recurred -
again f2fs_gc occupies 100% of the CPU core and blocks other kernel tasks.
I am going to switch to the 6.4-rc1 kernel from now on, however I suspect that
this bug has probably not been fully fixed.
If some kind of patch or logs are needed for debugging, please let me know so I
can help out.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
