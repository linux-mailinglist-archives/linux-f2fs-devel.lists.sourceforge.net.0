Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A23E9561FFE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Jun 2022 18:11:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o6wlH-0006qc-5V; Thu, 30 Jun 2022 16:11:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1o6wlG-0006qW-5N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jun 2022 16:11:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vsC16K7h+woPuVZpUoieHxs+VPT7hqdu8vlcxOSAwDw=; b=YysE39KC+qk6SN5J810v+0qISa
 PxKyjOLp995Sllws3gco1WWpCF5gOJpxQh1b8WzrmWiVGfzNHbN7twpy2TdBqG9zyrgkLrEuABOgs
 0S8fGhtjYqp+zH9SVEBv9VlpjwXj0ICrvd8KXw4nePdeprladNLErMt2dagyJuzNwZpY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vsC16K7h+woPuVZpUoieHxs+VPT7hqdu8vlcxOSAwDw=; b=OMorxHd5u7GhGpeaXFhnrpMoNh
 MbpiUEkFlIavEnOX9qj04HbsonLC+fd/R2uCCQw3V54rBYBnnABb9g6AfRKtYoa5WGZP3Zar7I1DE
 x9cmKv3psDMoG7XmL/3D+jb6wDPqURueEHTkvIRBDC+7y1rosN5prlvf0exoZTR6wo0s=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o6wl9-002Usv-3f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Jun 2022 16:11:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CCF96B82AE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Jun 2022 16:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8A093C341CD
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Jun 2022 16:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656605467;
 bh=/S/ZQVlfM9lO3eLdOUFCbo3Vj6eclqbdaQHr07xlyJE=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=N/JndJ6H3cUWiP/0cft3Nvvguy+0ozmSf8M6LRX66+J5filLHWNfCHiqHmEV5yjdp
 Wm2DBBDqO55BzFzWuYt6FId9NlqzZ33wT2y8+FVCIerRnqqFipoHv5KWBoEgxEFdRl
 plQQnsMHEYwhtQ0Agw4i1/2bAO5Skj2TStI+bV3lPKIk7AzfM4BPFoe20ZDOwMsOhS
 qrls9xKo8ATEKsX+xOjj1EjQCgp+j2NF+M7jDxOOJeBmORwdAWbXrlZTDlYKfLPZEZ
 4+4apBjKZtkq09DjNAQuRd6a+VqCogbi1itv5PxLI+gb1s/DnAR8S2mI1+6i4SV7hx
 4uVhbbxyxe5ag==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 7418ECC13AD; Thu, 30 Jun 2022 16:11:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Jun 2022 16:11:07 +0000
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
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-216050-202145-CYRSmbl0te@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 Yuriy
 Garin (yuriy.garin@gmail.com) changed: What |Removed |Added CC|
 |yuriy.garin@gmail.com
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
X-Headers-End: 1o6wl9-002Usv-3f
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

Yuriy Garin (yuriy.garin@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |yuriy.garin@gmail.com

--- Comment #26 from Yuriy Garin (yuriy.garin@gmail.com) ---
Created attachment 301315
  --> https://bugzilla.kernel.org/attachment.cgi?id=301315&action=edit
f2f blocked problems f2fs/status

Attaching f2fs/status

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
