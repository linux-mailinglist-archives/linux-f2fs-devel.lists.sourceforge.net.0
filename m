Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5944E6CF941
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 04:49:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phiLb-00070G-QH;
	Thu, 30 Mar 2023 02:49:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1phiLa-000709-CQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 02:49:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2byGa2NSSN5ED3o+NstRmeaTgQVyNLRsw8hD6Nmpvtc=; b=nAF7GmLRfqrAZKtVDEqeWUavsO
 4BzXITrRpEgXI8sGIO7qxJXpbxANaRgqYgcMNJF3yekpbuB/FNwWicSq2h3v1hhKL/Zz9A3sQ4luM
 Rarw9o8ElHmcX+OjmcCymioBuNrbV4+OqE+v8la8dm90/GowMVyzVKOTOQQ6ts2lZoZI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2byGa2NSSN5ED3o+NstRmeaTgQVyNLRsw8hD6Nmpvtc=; b=b/8h2ilYKhunTOgDV0wCHiH/45
 NiD4I4S1wd+VPT/UHNaQnMbe0cizbXhO4EjhxE4qK0+du1u3wDArBbhNSmlgXD8aLOLX1hoIpHKsV
 GAIWwnEzDrZCPve4Itb0S/m9sUYpQsDgo+mEmfq5qvn/MmPR1cUrTSRuqKYd0UD76umQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phiLU-0000S2-D7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 02:49:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 5232AB8239E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 02:48:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1764DC433EF
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Mar 2023 02:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680144528;
 bh=2byGa2NSSN5ED3o+NstRmeaTgQVyNLRsw8hD6Nmpvtc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G8ej1VL2PdTjRCbQLwMOTE3Ff6a0s009lXQQ/+WYvEPnCvzYICVaEwvAiCxWNjIY0
 C8bOnM9a6y/FYmrKnwIxSjKyfLWnPMP8UAjEAi1gQruSzoqtq6QVixR6qzY6HLymF1
 yoOQ2l/qhNJtmWh7divNnYkxxjk4TVVbi6rHMgVxO2QiOCgeIesC1vUOKZMw/q3h5y
 UOo4UVJtKOmxWjVQwT8qjTUde4S8OV7W1hxHwPev/Cha+xne/eUrJ72ZmNri8lmPgZ
 C1Rw0E4TdbqOwuncAhN89SZx0Sq8qUsVjWQTpHTMvGlLNdKBCrj+t4sN9x9jcUQ0kW
 WAwClWjmADleA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id ECD30C43142; Thu, 30 Mar 2023 02:48:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Mar 2023 02:48:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: shilkazx@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217266-202145-lBYEimIUNZ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217266-202145@https.bugzilla.kernel.org/>
References: <bug-217266-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=217266 ---
 Comment
 #2 from shilka (shilkazx@gmail.com) --- (In reply to michalechner92 from
 comment #1) > That looks identical to what I reported last week here: > >
 https://sourceforge.net/p/linux-f2fs/mail [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1phiLU-0000S2-D7
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

--- Comment #2 from shilka (shilkazx@gmail.com) ---
(In reply to michalechner92 from comment #1)
> That looks identical to what I reported last week here:
> 
> https://sourceforge.net/p/linux-f2fs/mailman/message/37794257/
> 
> 

Yep, it seems very similar, but I do not encounter this problem until update to
kernel 6.2.8. 
Before I saw your reply, I guess there might exist some subtle conflicts
between new feature in 6.2.8 kernel and the f2fs module. With your info, it is
highly possible that the implementation of f2fs exists some bug, and new kernel
feature might frequently trigger it.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
