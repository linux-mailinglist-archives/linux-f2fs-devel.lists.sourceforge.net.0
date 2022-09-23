Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B815E81F5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Sep 2022 20:46:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1obngW-0000RC-B7;
	Fri, 23 Sep 2022 18:46:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1obngU-0000R6-Qd
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 18:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=weXmXwa5AXDc1rmC9qlksdTDErsfwJm/Iitf2AvXW78=; b=ivbTFVti3F8rYk7GXI5HVA4sTe
 KPzVJgL8Rh2DSqYRLbPpW4qzENT/o5u0Qn6n5LFo8onafqSwWpbKhzoWevyb7GvojdCxgBEx4vGhY
 yAR1ZwzBl2iTkQi5nrHbPihkPkd0a1K9WbuLphN+N/I+dAOto6QotuJ1x2xAsPl+1xn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=weXmXwa5AXDc1rmC9qlksdTDErsfwJm/Iitf2AvXW78=; b=nGvcvitQ8BXMMTEsCAoc4/q9Iu
 RuqXf9FfqceD7sQMqtSewxp86dmW12fII0anyqwJwkXsifomUVkHX/BkiSI74PDpoNIgXKJc49/0x
 g3KE5Yue5orSfkfI7na3YRHneFenH/Sx8fU9rmMX8g28I2LYkKLnJ7DfLnft0iiuCiYw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1obngV-00007c-BH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Sep 2022 18:46:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 3E8E2B8239A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Sep 2022 18:45:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E34D1C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 23 Sep 2022 18:45:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663958746;
 bh=0oV6HSsIMLcvPRpZlkxDFf+zL9KCU/c108V1ZEQH1c0=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hmFb4l1Ly0Jl61ZZr3McddDUP3dOIkZzPGack6KwLcGmbh4mtyT7hVLR9LQx86Bp3
 Reb7YOkmL4NSrIkxqrPk6mTopflvLCscFcXxZqK19EaSgW8ChTpMK9NSdRXay+hrfr
 JNJupPHzRBOb+EcWv8acH3iCAVSz9XABqc7fBEkfM6jpZRg7W/f6lgy74t5HaiUTqb
 oUtULgpF/3HfRAMRfi26Eaap5nXVRCLla3MyGyMUS7ZevwXj4MthekFUUMkUjQ5qnP
 MKFNlbe6uYHVBVzxyZpGSrBclD/HTMMFW0bV2BYEbiICeyITaCb0HjO0TtCdLjfdqM
 RuLrUPdSv9CAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C6F9FC433E6; Fri, 23 Sep 2022 18:45:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 23 Sep 2022 18:45:46 +0000
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
Message-ID: <bug-216050-202145-MUwtnLT6dk@https.bugzilla.kernel.org/>
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
 #60 from Yuriy Garin (yuriy.garin@gmail.com) --- Created attachment 301856
 --> https://bugzilla.kernel.org/attachment.cgi?id=301856&action=edit dmesg
 log Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1obngV-00007c-BH
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

--- Comment #60 from Yuriy Garin (yuriy.garin@gmail.com) ---
Created attachment 301856
  --> https://bugzilla.kernel.org/attachment.cgi?id=301856&action=edit
dmesg log

Another debug v2 output. Continuation of #58 - without rebooting.
This one has a bit more variety.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
