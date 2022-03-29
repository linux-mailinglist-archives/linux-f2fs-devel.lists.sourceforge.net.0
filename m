Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C4224EB2AE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Mar 2022 19:28:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nZFVU-0005SH-8T; Tue, 29 Mar 2022 17:28:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nZFVT-0005SB-U4
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 17:27:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fC8Mm3vCEbyVdPH6cpeNGQVDRI9hJWFgbwNw5kz7Ic=; b=VlB4/qZLu0WAJ2cHAYuqRFReB1
 kHv0GmpmgWhVwbRqgNcAvUBHvUEB2/yZa/bICN3vd8RduiWokv27ZSavueESQUY2zQ4m48e4k4xAS
 opJhoEj3Fi8UfvJxK+7M9BMowP6dkaDCUcjgPoRMyXneQkruqIfvwGg6rYvJbfA2TOJA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5fC8Mm3vCEbyVdPH6cpeNGQVDRI9hJWFgbwNw5kz7Ic=; b=gLR5zV1G1HIgSH/Ew87xEzEG2P
 f2aG2zw1h7oXv8WqqLF7MP8cLMv+0o9ewC3k122YSyIWxe9H3WxKEIZsGZECsFEImiWZI07KWTT2i
 TVbFvtOrmouFyC5WdPjk1CDefkdscMzyrSXDg+2Tcne8phExtCvpdyAtiqwrBU+OmH9Q=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nZFdJ-0006nR-Fs
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Mar 2022 17:27:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 72AD5614C6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Mar 2022 17:27:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D269DC2BBE4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Mar 2022 17:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648574861;
 bh=5fC8Mm3vCEbyVdPH6cpeNGQVDRI9hJWFgbwNw5kz7Ic=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=Ag4lcVGHNsEAW0XAjXYgpIJmq855jyzwm0t8xDsl8cebUODBGCK0yNXwn95f3TCOQ
 wmhNevb60Qh0Xq02DOAnFiVRDG7L/K8TsKX3beCdyIcpHhTOQULdfkxB3GhY1BKeZu
 ozXJnyC5Xx6C4AUrT/g922DoTOsFPhWNJu+x5DXGns5uwc6HbkOHE0pbuJAhfplIwK
 Sz9vpTQTTbob7ZlcfaA0KwrVNdSzP1rIVNrk3Gm+RZ0j1Bi5QllNGnqkG4RorxLw8P
 5eKPcdrQb/JFFpQjk7jQUACKe4f4BOEhtQGHFHAHR8rXCw94ly8uGmmwpdFO4PRHFU
 KRNOIhivJoo9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A91F7C05F98; Tue, 29 Mar 2022 17:27:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 29 Mar 2022 17:27:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: wenqingliu0120@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215765-202145-6OeGKEWWYO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215765-202145@https.bugzilla.kernel.org/>
References: <bug-215765-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215765 ---
 Comment
 #2 from Wenqing Liu (wenqingliu0120@gmail.com) --- (In reply to Chao Yu from
 comment #1) > Hi Wenqing, > > Thanks for the report! Could you please test
 w/ below patch? > > https://lore.ker [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nZFdJ-0006nR-Fs
Subject: [f2fs-dev] [Bug 215765] kernel NULL pointer dereference at
 fs/f2fs/dir.c:f2fs_add_regular_entry() when mount and operate on corrupted
 image
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

https://bugzilla.kernel.org/show_bug.cgi?id=215765

--- Comment #2 from Wenqing Liu (wenqingliu0120@gmail.com) ---
(In reply to Chao Yu from comment #1)
> Hi Wenqing,
> 
> Thanks for the report! Could you please test w/ below patch?
> 
> https://lore.kernel.org/linux-f2fs-devel/20220328160253.3102-1-chao@kernel.
> org/T/#u

Thanks Chao, I tested it on 5.17.1, the NULL pointer dereference didn't appear
with the patched kernel.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
