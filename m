Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E568A8B09BA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 14:31:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzbm9-0002FP-Ua;
	Wed, 24 Apr 2024 12:31:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1rzbm8-0002FD-Nj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:31:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ga5Oeg23zhxXirk+a0LUswoTng2kuygST5xF6aGe14c=; b=E7loB71zHC1/caAN4Uv7SYHMvg
 KDb7qK5bc9vYwoqFj869I+kG3A71eZSsy+jVO7DDPe4vrJyZN3NdfBk7m5r044M3gIFMRyl1OciCF
 BvlLlRxaOtCzvtHI3LWFIQS0ASorRWcg3t0VMLG3hBuA11qmRAEXYyMhj7nCqKwtb5VM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ga5Oeg23zhxXirk+a0LUswoTng2kuygST5xF6aGe14c=; b=YJL6ZH/NFrjJlcK8mUEKTsUMEk
 DT5f/8+Iv8wZXMV357BRcih5eGgvM4V+LObY47CTPMPxeZgx3bkeIG6+hfGiUQjZrRu/+b5qePlp/
 tImtdlw6aaaqwbADKNAFpZbGqSqkee57tX+iEoNLZct8T6Bt6piESvNJ9Tjqp5KRl8Q0=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzbm7-0002Dg-HB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Apr 2024 12:31:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 55D39CE16AC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 12:30:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B4DAC32781
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Apr 2024 12:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713961847;
 bh=ga5Oeg23zhxXirk+a0LUswoTng2kuygST5xF6aGe14c=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=rDowVH+w9r/1P2smDNmTJXK8uKRSui8aVIV9solX7PTjWttjpHmVSz8ttgQfOraXk
 VwJiudSWSJ5x07PZxRBK78UmRSCT4Z/AFVM9jr3MssPB+nBssqmGepq1NyjQ0iPob+
 m1li0oolvGiO3ELMWShZwLvtB9sPYCk9e82b+PZf6JHPNx/Pg6jcB0m3u2nL7QuSAa
 Sd+K2GUBciM5SlcDohZcDRW0ajGRL1PepNyVrl8+SkkEqlTNx41nXA/UaLRtM0rBdY
 jM6tG3jClq2S880cqv3MvSI2uF+FrGPMLYGkvgw2SG6Hn89IzOM2hIdhptB7GqMWKm
 LMTUm6UweO5pQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 69F22C433E3; Wed, 24 Apr 2024 12:30:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 24 Apr 2024 12:30:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218770-202145-zsFZHchmJ1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218770-202145@https.bugzilla.kernel.org/>
References: <bug-218770-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=218770 ---
 Comment
 #5 from Guido (guido.iodice@gmail.com) --- (In reply to Artem S. Tashkinov
 from comment #4) > On 4/24/24 12:21 PM, Tor Vic wrote: > > > > I can confirm
 the constant fsck issue, and it was [...] 
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rzbm7-0002Dg-HB
Subject: [f2fs-dev] [Bug 218770] fsck seems unable to solve corruption
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

https://bugzilla.kernel.org/show_bug.cgi?id=218770

--- Comment #5 from Guido (guido.iodice@gmail.com) ---
(In reply to Artem S. Tashkinov from comment #4)
> On 4/24/24 12:21 PM, Tor Vic wrote:
> > 
> > I can confirm the constant fsck issue, and it was fixed in my case by 
> > the following patch:
> >
> >
> >
> https://lore.kernel.org/linux-f2fs-devel/20240409203411.1885121-3-jaegeuk@kernel.org/

I have 6.9.rc5 (dated 2024-04-21 on kernel.org) Is that patch already applied
to it? If yes, it doesn't solve the bug.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
