Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 29BB364BAE3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 18:20:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p58ww-00020A-Dk;
	Tue, 13 Dec 2022 17:20:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p58wu-000202-Ot
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 17:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YRfUxCbJoxCbRZlmVMidx10NipAoFHrYD2S3zIedgUM=; b=ZqBF8djHRYTW4LrcCOonoDF26a
 rmurfoRf3fl8rXh4/ZSqrKki0lVaerAS/wo4SKjn6cn80CJ10/0yLabAFi4BMAIRWA4b2MwGnpi67
 j7Svo6tb5Vl58YB7IPLGGPu6JwIWD+dXEXgKMICZwy5HARiQTT6jdiWkrgpB+B4qGLsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YRfUxCbJoxCbRZlmVMidx10NipAoFHrYD2S3zIedgUM=; b=ZBj/WqMFjHs7XR4S5LTXwh/MwX
 3K/IlTHGj87Ha9KldelIhry/n/9NI7VHLhTgnzsgmE40Ght0HtUzvS9II5xTUBasgyyd9lkff9gWB
 gX/Svzka/j8uQYCv1x+pJhCUfIL+HGGTpdgQG4xgvi+zHHl3ius29rUXdkSG37WcS+3Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p58wr-00Fym3-Dq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 17:20:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0A18A61683
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Dec 2022 17:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 66199C433F2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 13 Dec 2022 17:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670952003;
 bh=YRfUxCbJoxCbRZlmVMidx10NipAoFHrYD2S3zIedgUM=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=f3r/vjgiBEhKL3AWRmsotO7uRDO+v5FBmsLqReI/z6QoS594IvcEwAgZ2xYNntAeV
 Dh9j8C+ycfNwlqW0JOASAZB0XxKwEIZ9mlOkoaMuARsn8r6ZNwjjLNbEcQ4a2rziQg
 ixkcAXcHOVV+2Ig66kPIlEydWECEJikknwp7RoGZqWmh3wwgNJNAwhCUbV/gsxgI7N
 AuqYiLw0jUYQx8aH3RvsjlHPq+JQEL0KWyN6FJSFvz3hdKVNlY6tdBPS+P/HqO4kvv
 It5tSK6n7HbyRlM6EeBxyrtSdl3Fj88aKtdGBWfyJbTQZ2QPjFgIecblp5nAGk3b20
 ahiN8429rzEug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 2FF47C43141; Tue, 13 Dec 2022 17:20:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Dec 2022 17:20:02 +0000
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
Message-ID: <bug-216050-202145-GASGVRBagu@https.bugzilla.kernel.org/>
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
 #111 from Guido (guido.iodice@gmail.com) --- Even worse, although I reactivated
 the script to force gc, I had the problem of the cpu at 100 per cent again,
 even though I had done the 'clea [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p58wr-00Fym3-Dq
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

--- Comment #111 from Guido (guido.iodice@gmail.com) ---
Even worse, although I reactivated the script to force gc, I had the problem of
the cpu at 100 per cent again, even though I had done the 'cleaning' with the
5.15 kernel earlier.
So at the moment I'm unfortunately forced to use 5.15 all the time.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
