Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC41414033
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Sep 2021 05:53:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mStKR-0004xt-7w; Wed, 22 Sep 2021 03:53:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1mStKP-0004xm-PX
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 03:53:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QilUNyLdjnQWOUyEw+qKyGcHvY3j3q1Lwwt6sJiCFPE=; b=jHi61piOGsI3YTgbYazT27MlIk
 /AlzAWyT0uX3FVxmwmZ/ujrM+3hHQai8SC366xqk56jae041m5uj3mFakixFxs8D8E7gL0r3lJH1i
 WYZDiZUkMQr/JSKzpvcYRqUL91qjUqlSW8+JAqYQmHLETuZrMAM0mjjSot/dLlWUrEs4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QilUNyLdjnQWOUyEw+qKyGcHvY3j3q1Lwwt6sJiCFPE=; b=gzyq13FN31RwBJrcNWgJXrotlo
 r9uo8m1heKPPdwJk1kfpo1CIjdakFZgFr4MtkF9kwEUGufxnB66HbGb1dXViXAmiAYlgqg5K1wUiP
 bIKVhgMLeQqEOm/5aHtAZmMhg3Lr6lkD0CXbCN2H5UcZYkaV6+y0/gXfY+7yZ67KPhjA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mStKL-00021S-Gx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Sep 2021 03:53:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 59C5561178
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 22 Sep 2021 03:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632282814;
 bh=QilUNyLdjnQWOUyEw+qKyGcHvY3j3q1Lwwt6sJiCFPE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=HOPrd2gs0ThRBNEjsggplULQAiLnR6u5lwee99sWxMAz+wzLdD2vcLhICWyojm8j4
 n1LO3ymlfWprGoRAEF12bcGAo1MPeq4CbF4lNPwzAoC2GiIMHGrmSWk4yyGioZcc7M
 4Xa8wUI268GMBRuoM8fV2tCddnwAErUZPisWvuG+n1vW25DDRn5leFIUOP18dJx0p4
 RCVI9wByyBoFrMtNesJNlEmCwu3lZFqx+IwpSutlQPsLZ8JmL/67hEJPtQhjJDgwiZ
 A0kplLHRD+SpNOyR00V2IVtU/1XSvlLPZIqYe61hDLah0mdjw2WZ/aj+QJZIbIOc49
 2s8ltbr2v1cuQ==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id 44A9360F50; Wed, 22 Sep 2021 03:53:34 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 22 Sep 2021 03:53:34 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: zhuangyi1@huawei.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214299-202145-iVcXlGqNpH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214299-202145@https.bugzilla.kernel.org/>
References: <bug-214299-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -6.6 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=214299 ---
 Comment
 #2 from zhuangyi1@huawei.com --- (In reply to Chao Yu from comment #1) >
 I've sent a patch for this bug,
 could you please test with it? > >
 https://lore.kernel.org/linux-f2fs-devel/2021090 [...] 
 Content analysis details:   (-6.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mStKL-00021S-Gx
Subject: [f2fs-dev] [Bug 214299] A deadlock problem caused by the quota_sem
 set in db6ec53b7e0
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

https://bugzilla.kernel.org/show_bug.cgi?id=214299

--- Comment #2 from zhuangyi1@huawei.com ---
(In reply to Chao Yu from comment #1)
> I've sent a patch for this bug, could you please test with it?
> 
> https://lore.kernel.org/linux-f2fs-devel/20210903023811.3458-1-chao@kernel.
> org/T/#u

Thanks, I will verify this patch as soon as possible.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
