Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FA155829AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Jul 2022 17:33:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oGj2J-000510-5B; Wed, 27 Jul 2022 15:33:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oGj2I-00050u-4V
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jul 2022 15:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wLbpKy26ljjpcdyUjFDa0vBf+LdgrtMsaiVzuSdgqd4=; b=W7l1JPUpYGfeazy3BM+CQcRUqW
 57PNqZxHjcsSsKIM0DP9tJLAz4KGuv6AQNl+t9rzV64Lmd784xFMIz6JvyVrzXut1UoVYxz9w79i2
 sC8nerhgeH6APpOfUUY7/YZuHyVDxINMv83WnQePzOOH075NTmtn88g9CcO5Uwtspy2U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wLbpKy26ljjpcdyUjFDa0vBf+LdgrtMsaiVzuSdgqd4=; b=efwJrKn7C7bsRH8iY93X+cGCDA
 NaS3I8IpibEVatDEcWXfgB3mcTCpYzD+mHm0TS/6Jd138sYj7dq3V/4TnbFXlhw0RKyiQ48znh227
 hYjSMC/JHbYO6WaPSt3gWQpxO12wmQ7v6/3qICoi1FlZc8BJct+ZfjIGa6zViD9twa8U=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oGj2G-00C6mc-90
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 27 Jul 2022 15:33:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E278861938
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jul 2022 15:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53766C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 Jul 2022 15:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658935994;
 bh=wLbpKy26ljjpcdyUjFDa0vBf+LdgrtMsaiVzuSdgqd4=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=NxsERZDJf0b8GEyTfLLrwXzX9XFuNdjhYLJaP+BMEFc0RHJ10Vrt0z7sw5V5vT1Hs
 a5AAYw+F66HMhm/LvsKiJOx0Gkkd5psGT8Gk7kmT5gvDi26iEst3ulSLlrpBsCwOxi
 UDp7qp5QT5Buza6+mf/gJGJGQt/Wwoqbqb3wWM9sAz1TSFrUrqz9mJ6BNM4xCGqt7G
 XVXxfi1cpIQqDDHiKgcX6nAex6yEm6a8qoNyRSMSmaux2HoOeCeTqzQ03s11C4l2S9
 njjXt9XfnMNbtnytCad2FO8atc2XqYaE8uWWGyAJX2g5JUz7KngBf7xqHfCd4a6m5N
 jJwebbqxY6yJg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 38164C433E6; Wed, 27 Jul 2022 15:33:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 27 Jul 2022 15:33:14 +0000
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
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-dLQGE6Jp2h@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #36 from Chao Yu (chao@kernel.org) --- Can anyone apply below debug patch?
 and once it reproduces, maybe it can provide clue....
 https://bugzilla.kernel.org/attachment.cgi?id=301318
 Content analysis details:   (-5.8 points, 6.0 required)
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
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oGj2G-00C6mc-90
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

--- Comment #36 from Chao Yu (chao@kernel.org) ---
Can anyone apply below debug patch? and once it reproduces, maybe it can
provide
clue....

https://bugzilla.kernel.org/attachment.cgi?id=301318

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
