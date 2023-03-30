Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A31126CF997
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 05:31:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phj0Q-0007XM-Cr;
	Thu, 30 Mar 2023 03:31:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1phj0N-0007XG-MS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 03:31:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TLgZPTVMN0LvTmH5TMV20T4pZfNc0F7HKieGx5nppVQ=; b=mvkKEE7cIJO4jT/I2mWelH8xUn
 vD5+tze9g37E53aidyhP63aWZigamqOG87cY8OweQUUJGhn7pfH5G4Ptb8otgsM0V5GVKAxpMlH6B
 22aRb1DE5zNGVm7h+SPgnjCBoJwGLF68T1ezrC8jkcDGaYDN7waa9s7QnU0IwJh/0j7Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TLgZPTVMN0LvTmH5TMV20T4pZfNc0F7HKieGx5nppVQ=; b=S7sBQ++a1WCWasNvRSENEWlsLA
 /1eXS3wXgE0DsdjoztUZGk2zGtrDMO+LhveGdaEXO/F1QDoQO4J37ZTRktQtUJ/i5dLKP8d+vAac0
 TCborD07GZ9QERJodQXzSNQFqxbqsZqfSV+CTzSfmiET0/cr2k3TH/C/XvyiBJUWjfnY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phj0M-0095Gt-4d for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 03:31:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DAA36B82580
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 03:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A04FDC4339B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 03:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680147066;
 bh=TLgZPTVMN0LvTmH5TMV20T4pZfNc0F7HKieGx5nppVQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=uJzz1letYUGy8sio+1SKDvY5Vf8s5/h7OEhIyOsTzOti6eGMyn4xw0phNo05jKOqI
 UOgIugJEG9t2jIFHv/SxWENDCb5tQKdq9YRga2PXAcv7H+pG5tFTw8VD9ENc3vMnJj
 dTAnhaYL23F6vHrLxiHafDyGM24AJgeKY1DsXZnsHt7qADcUm+bKpB9iCZ7YfQ/S5t
 1C3qfDnQW8kXuEoYiIkhnmIMe21ORQMPfj94Uj0VG5BauWBNRMyJB7fMSNMH2ReJeN
 kmVl0nJzvHren7T0jYyHD6HwFQddh/mtqNso1V0QO3yQwjCzF0UyrHiWEpHehpbyOe
 b5dmTF4LC1K7w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 89B1AC43143; Thu, 30 Mar 2023 03:31:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Mar 2023 03:31:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217266-202145-Uzcihil2Te@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217266-202145@https.bugzilla.kernel.org/>
References: <bug-217266-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=217266 ---
 Comment
 #3 from Chao Yu (chao@kernel.org) --- On 2023/3/30 10:48,
 bugzilla-daemon@kernel.org
 wrote: > https://bugzilla.kernel.org/show_bug.cgi?id=217266 > > --- Comment
 #2 from shilka (shilkazx@gm [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1phj0M-0095Gt-4d
Subject: [f2fs-dev] [Bug 217266] kernel panic on f2fs filesystem when
 f2fs_commit_atomic_write
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

https://bugzilla.kernel.org/show_bug.cgi?id=217266

--- Comment #3 from Chao Yu (chao@kernel.org) ---
On 2023/3/30 10:48, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=217266
> 
> --- Comment #2 from shilka (shilkazx@gmail.com) ---
> (In reply to michalechner92 from comment #1)
>> That looks identical to what I reported last week here:
>>
>> https://sourceforge.net/p/linux-f2fs/mailman/message/37794257/

Could you please have a try w/ below patch?

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=a46bebd502fe1a3bd1d22f64cedd93e7e7702693

>>
>>
> 
> Yep, it seems very similar, but I do not encounter this problem until update
> to
> kernel 6.2.8.
> Before I saw your reply, I guess there might exist some subtle conflicts
> between new feature in 6.2.8 kernel and the f2fs module. With your info, it
> is
> highly possible that the implementation of f2fs exists some bug, and new
> kernel
> feature might frequently trigger it.
>

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
