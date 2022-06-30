Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F760562341
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Jun 2022 21:35:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6zxC-0006nE-MM; Thu, 30 Jun 2022 19:35:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o6zxA-0006n8-QM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jun 2022 19:35:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74wWf3lzdsVTs/ET3KvJAYGgGU/hlBdPwi4EAdxWPzw=; b=cw4cE0CUtTE7xpWZHDgW2c/ZFX
 LF/Rg7Fa5q1RN3WasYRb1V0ugYEOvITXPK5r/9suDmWrZoFg6T1QgBPO/U5R6+35CBaTZbdAZSv8p
 FTCGG8LZvA3t8T19XYa57bmGmmL8vH/ip50hyZXOi6IJqZXtpBXRQaitZIuDrEaevwrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=74wWf3lzdsVTs/ET3KvJAYGgGU/hlBdPwi4EAdxWPzw=; b=h8jmUwFAldHnHBDL3LUuEyJaYW
 rYE4KNTl8y3EQtWYDIbWGwrm7Z/KKbVDPJOXYdeNHtyTB9fHujCKYnmLl0atuAbtzL+xOlORvqabg
 9aGmC5NS2sZYa+h3yhqadvbLxN9ef078tSHGkQ0kR7wi0A0i9HiS015ImDkrqbGUxais=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6zx8-002f2q-FR
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jun 2022 19:35:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 66437B82CFB
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Jun 2022 19:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 034AEC341D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Jun 2022 19:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656617738;
 bh=74wWf3lzdsVTs/ET3KvJAYGgGU/hlBdPwi4EAdxWPzw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Fa7uqawMlWe3B6OirJOXX6ERvCwBZ3/lmTD6QLbgPLtDVjDVdEUV+jAVVtClAJrdu
 wcBmyVdb+WaWHOEkdCgWlk/VQLIXWYYmLf/u63BmfTOWHo7zgVwTfb8EhQ9cD0Ajwt
 CDbNbQil3HNL6ng1CJ1RuwwuizVL2DhTy2Xd98R9aWHj805dUIdO9udAjxLnVpidB3
 QbgA9QBXWYLGXFTzVGNGeE0G89T7B7/3NQ2Rvt3X8odiwz84fTHVmDetVaR/ZMsQ77
 bd5mP8FK69x6Z6MbfNZoaCEdAN4a3sUAKpsllOp7tuDEC6DRFZPY6iBihJ7TChH8uf
 vWlsfV986ob1g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id BEF24C05FD5; Thu, 30 Jun 2022 19:35:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Jun 2022 19:35:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-PS91Nu4que@https.bugzilla.kernel.org/>
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
 #28 from Guido (guido.iodice@gmail.com) --- (In reply to Jaegeuk Kim from
 comment #27) > Re 23, could you please describe one more time? Was there
 an f2fs_gc thread > running 100%? 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o6zx8-002f2q-FR
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

--- Comment #28 from Guido (guido.iodice@gmail.com) ---
(In reply to Jaegeuk Kim from comment #27)
> Re 23, could you please describe one more time? Was there an f2fs_gc thread
> running 100%?

yes, one thread occupying 100%

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
