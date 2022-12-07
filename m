Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 352B0644FE2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Dec 2022 01:00:31 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2hrO-0004SX-QR;
	Wed, 07 Dec 2022 00:00:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p2hrM-0004SQ-RH
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Dec 2022 00:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GE8Hl6+Ghh6VnoTOm+uRvp2KbDKWQ2wzdyvytBIN2As=; b=XVWuorHb/PQ+tOArf/yqS1cccF
 jCfRlXP0kYQILbxJEB9z+oL19e5uyMWHNJ9JU8c79FuUIUEtFRxxjVrHX2bBta4DA3owSEEyZOB6x
 L69ufsVthulh0dkcQbATOoSqRaF0bI2xpULqO7zhsqvXtvQ2Z6X6e4Ixb5cZmKHETGhA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GE8Hl6+Ghh6VnoTOm+uRvp2KbDKWQ2wzdyvytBIN2As=; b=Bzt1BUjAfs4jm+msFpoz0lSlDk
 7+dEq1OeMxX6+dV1Li/s6ASa0NZEio0z+yPrFNld3rAqpuf8JfYKGu6hFDCcFOYzMmSY8NrB1a/H+
 NyhmNYQZGHruheE4/JodTJ2QuZAY7HabazaVBgOm9khv+u+zZWLZ7BGnvgi55GwgfcuQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2hrM-008Y5a-84 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 07 Dec 2022 00:00:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9EECE61909
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Dec 2022 00:00:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DCDEC433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  7 Dec 2022 00:00:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670371215;
 bh=GE8Hl6+Ghh6VnoTOm+uRvp2KbDKWQ2wzdyvytBIN2As=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=gUwT0SGfClnUWrn3qdsP8m4uR4Kwsbom2jBISb4BPqvcevAnpE+QXC1xfz57j0eTR
 gG2u+XUS/TbmRbMN8tOIZSK7SLSdfVXrpEHBcSdaOjH5pxl6q/A9ibzD+Taw4yRSsj
 EkPbMalAfCamAt6YKDjfvF6kiUntg8znK9FNdM93fvoV3fY0KfQ/Nuh6nZhuHHkfE2
 F8H5j3fQfhXRG7uNq3U7GWvPFUEzA9pjMa5T0t+JXfrmFXeSV7L3RNqS2wxYl62Pax
 t0EgIOsEJSa9eEoSY9qKCSVEf4BDl7VA2O5GWJa/C9gkj512WT6on0JtmO35kCQ9fg
 vtMtLLFh+Jc2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id DD8D7C433E4; Wed,  7 Dec 2022 00:00:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 07 Dec 2022 00:00:14 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-w5PqmdpUwG@https.bugzilla.kernel.org/>
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
 #108 from Yuriy Garin (yuriy.garin@gmail.com) --- Thanks! How can you tell
 on what disk it happens? I have two nvme - one "plain" f2fs root, another
 is f2fs on dm-crypt - that's home, where a lot of compilation happens. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2hrM-008Y5a-84
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

--- Comment #108 from Yuriy Garin (yuriy.garin@gmail.com) ---
Thanks!

How can you tell on what disk it happens? I have two nvme - one "plain" f2fs
root, another is f2fs on dm-crypt - that's home, where a lot of compilation
happens.

From logs and stats I cannot tell where f2fs GC problem occurs. What should I
look for?

If I would know problematic disk, I would increase load on that disk.

Second question:

/sys/fs/f2fs atgc_age_threshold has 604800 value. That's 1 week. Changing it to
one day or 4 hours - will it really help to trigger problem? If it will, it
would be a "safe" way.

Thanks again.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
