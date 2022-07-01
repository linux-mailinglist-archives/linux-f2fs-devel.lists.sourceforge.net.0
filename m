Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE51956281C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Jul 2022 03:24:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o75OK-0005kG-BU; Fri, 01 Jul 2022 01:24:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o75OI-0005kA-SP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Jul 2022 01:24:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t670pikYRzBk9FXk8AEXjq5qGOxTE6sJlxlAZ3BQw44=; b=EWJZfPdNiiLFQfYlcvVlFs6oUS
 6XoPZaa9p141l/fisjMyZOcEfC3ffg/wWIdGAam/jv05PeoGc4Blqy8qZ5UzgN1D10zUqOpjjO+2f
 taj8X35riQIYwPaXB2SRUfwZxz3S0m2JMsQFo2//7mcgrAfb3ce+pizGBK2G1X1JqqU8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t670pikYRzBk9FXk8AEXjq5qGOxTE6sJlxlAZ3BQw44=; b=mDi1zWW0oZPAOzRE7dYwnVTr2e
 P+OcAoeBl5R3uQoB2uJxyabbiRypSU7WpbNgPOLVmn2KWNWH/EaGnMJzJZfSk5TBtS81cVrEEbw0z
 KrYJ0Os3qcNydo/eZ7X7CtKjbukv4/gi8Eix2XRN7DlHvg+fHQ6LG1nAE7Bubp80RQ5c=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o75OF-0001NS-9d
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 01 Jul 2022 01:24:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3EC64B80D15
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  1 Jul 2022 01:23:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0F2D2C341C8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  1 Jul 2022 01:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656638637;
 bh=2ruy4qfM5JT1XchAkiJbbOflgo8bL3Ba0r1eS03+ONQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ajCwyrQLrUthjRsEPeCi/hTw9P6fJV6buDKGzYLYC1dyeV8cBnd/62U555eYFv1NO
 UI/F9FojltP4XOkkL7uyYUTQxBMjNHqeYfjqQTAGYurb4ABMsx+icZQJ5Z40RbAhZ5
 rjmud5M7pRLejk2IwgkoC23124q54hwGC61d9wT3Q+UG7BYOT8a44efRfKNT/CO4/D
 Ui9HDSPraJ8YwsPTh2S+G44eModU6Nyo8LK179DF6vR5Hd/U4hs9Rf2sPfIhLa/4bU
 epVQtQ/2RwqgpOy3Kv9HvWui2O9FOf7n18gR31edYIYdcOGvJYqkqFmkqGZ7ZCB9Yn
 HozEjwhzMBO6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id EC3CFCC13AD; Fri,  1 Jul 2022 01:23:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 01 Jul 2022 01:23:56 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-CBmwAbRCUR@https.bugzilla.kernel.org/>
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
 #31 from Chao Yu (chao@kernel.org) --- Created attachment 301318 -->
 https://bugzilla.kernel.org/attachment.cgi?id=301318&action=edit
 debug patch 
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
X-Headers-End: 1o75OF-0001NS-9d
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

--- Comment #31 from Chao Yu (chao@kernel.org) ---
Created attachment 301318
  --> https://bugzilla.kernel.org/attachment.cgi?id=301318&action=edit
debug patch

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
