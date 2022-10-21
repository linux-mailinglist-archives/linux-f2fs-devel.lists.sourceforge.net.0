Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC847606DFB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 04:48:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oli4p-0003ru-Bn;
	Fri, 21 Oct 2022 02:48:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oli4o-0003ro-Uu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0Pms1J3O6l01ckbLEU6pWBxOM+XKZQpXphJNUc0yWzk=; b=C09PpwNOvMzGzpFR3yBbS9hTCL
 VPMYn+XvELbvHOUrM4SM2jjoSOJJUOHhITH0bcHN+5JPxvB5EKlTzOCBmKz+bxUbNh/KGzZpQ62zG
 fSRmLiB6OXmf628Z1wdXLN9FbS74oDi6qrsNI65MT2YgZdBafLVBM7Fg0Wug60goHbKM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0Pms1J3O6l01ckbLEU6pWBxOM+XKZQpXphJNUc0yWzk=; b=cSuQjVrNSpi1Qz9m7Ek927npPr
 eCft+5dV4xm0HnZENu4uJ8GK7XvG1yHnW5Fdj/+DaWuTZG4H15EnxxPkt8vWdJvhjeaqnpT+SkXxw
 MrXRcPiSctSZZxKEV9TizIWOqDith2SEUtYGLBvjNRkgaejUrdCytfeml0DBsTNR6OPM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oli4l-00BgJl-Nr for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:48:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D20A616E3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Oct 2022 02:47:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7F738C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 21 Oct 2022 02:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666320470;
 bh=0Pms1J3O6l01ckbLEU6pWBxOM+XKZQpXphJNUc0yWzk=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g5e6jiLCRHHx6Qen5TghXIUPMPClBcGjLFd38ngPuxvLoqmaHROe7LWT0NMoMuLBq
 9E6sxK2S9vOJ4OObo/w9BoOpJgL9zC4mnXXUuzKuvte4pBQHkQnngYktgDwgFAS6i0
 NZitLRHL0neYlC7ZKTRmBl08bX77UjKYD7nyhuHVf8MZstxDkApghqwj9QjlcHwWl0
 cJk1oedXeJyS8qgaGTEBzWzDUxWo1eeaHhsJz/N/dNlzuKWKswB1VBIKLtxEQe+EHu
 sr5cvKWNmC4dKLhsu6S37Q7fU/N4BsKoigKoxt1fykbeKxZMB0caWp5KPdc8+2VHvP
 PYfmFyzEhHLww==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5C4D9C433E4; Fri, 21 Oct 2022 02:47:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 21 Oct 2022 02:47:50 +0000
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
Message-ID: <bug-216050-202145-72SvOkXA7X@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #64 from Yuriy Garin (yuriy.garin@gmail.com) --- Running 6.0.1-arch2-1 for
 a few days. So far, so good! (Previously, this problem occurred from twice
 a day to once in a two days.) 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oli4l-00BgJl-Nr
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

--- Comment #64 from Yuriy Garin (yuriy.garin@gmail.com) ---
Running 6.0.1-arch2-1 for a few days. So far, so good!
(Previously, this problem occurred from twice a day to once in a two days.)

There were quite a lot of changes in f2fs sources in 6.0. Let's hope it works!

Thanks!

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
