Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AD2781D59
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Aug 2023 12:19:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qXfWE-0002Ty-RM;
	Sun, 20 Aug 2023 10:18:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1qXfWD-0002Ts-Fo
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 20 Aug 2023 10:18:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XpHrHg7LQxmfkh6cY/3wSRp+qTzVD2Zt76R8GmA5gJs=; b=c6Ik49fl3MxnfRE71Gd7jNn2Oz
 gLfttifZ88NRBg53kP73uuSVBJkYRYKHD0uX1kEwJzs4LN3mve2cay0zDde++bt634IuBqKiWitWi
 e8HovaaMcryTjicyufQfpGRacPsPD1fBrhc25OsDdcG2GgIkSCZ8bIb/8VgK8C7rN8ZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XpHrHg7LQxmfkh6cY/3wSRp+qTzVD2Zt76R8GmA5gJs=; b=BcWk7J3xzNNNGTN2zzFDtmBMCS
 Z4uDVfSCfsT0eZrKm9AW4SGY5/mWnduymRYiVY3YCqiWEVoLFa6HehUCbKyzLsYL2KLyglSaUr/oA
 VkqzqI+OryPm/SDTMMYFZicq8SBNoMsbNktEQXnLkcf54jMrhkpxPWDm9P/OSsT+hMbg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qXfWD-0004RA-A9 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 20 Aug 2023 10:18:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9319262045
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 20 Aug 2023 10:18:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEB15C43395
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 20 Aug 2023 10:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692526722;
 bh=XpHrHg7LQxmfkh6cY/3wSRp+qTzVD2Zt76R8GmA5gJs=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=EyP3QZS45ZOc1hVFeTouhULwDAkzmdjjlHfML2UIha4iLyM35EjpRK3tTjTTupObS
 rSpYw6qWB6nIKBhA5RCN762yLnqge0fiV8otwrxRlnKhOzhsLbAFRjTR5x8ADT1ghb
 7VcJ7pPmLsXdmYIPfVboEAxtDlZHr4Ce8csQv6X5WW2VOfW3TWbQGbSZiTFPDXkChi
 f4AtYyZurGAD4m+PX8SzBPXFOgbzjX+XZRtFdalzjZF1xMJpyPH+eNCFLPEiPmNsU0
 ug4s8DZIOJ1grDVMhdimEkjfu0Rh2WYtAIKqfoB87H3hIv/Mgc6bPxMbvkajamO9Ld
 a46EOJXJEfbMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A004FC53BCD; Sun, 20 Aug 2023 10:18:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 20 Aug 2023 10:18:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aleks_@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-m2ciJ1IMlx@https.bugzilla.kernel.org/>
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
 #180 from kelak (aleks_@gmx.net) --- (In reply to Guido from comment #179)
 > (In reply to kelak from comment #178) > > >Jaegeuk has proposed a workaround
 solution as below, it aims to enab [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qXfWD-0004RA-A9
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

--- Comment #180 from kelak (aleks_@gmx.net) ---
(In reply to Guido from comment #179)
> (In reply to kelak from comment #178)
> > >Jaegeuk has proposed a workaround solution as below, it aims to enable
> from
> > >6.6-rc1, could you please have a try with it?
> > >
> >
> >
> >https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev&id=5a47ad28e6061c8fddf5c82d49fdc3280a80b2c4
> > 
> > 
> > I'll try to build and test a 6.4.x kernel next week which has that
> > workaround-patch included.
> 
> Did it work?

I have rebuilt the arch linux kernel 6.4.6 with the mentioned patch last
weekend.
I have an uptime of one week now, and the issue has not occurred yet. So it's
too short to say anything definite.

However, before I started the patched kernel I played around with the
garbage-collect-script. I observed that After some iterations the
f2fs_gc-thread took ~25-30% CPU and the number of dirty-segments stayed
constant at around 10000. I stopped the garbage-collect-script, but
f2fs-gc-thread CPU usage stayed at ~20-30%. I rebooted after ~15 minutes.

I observed this for both kernels, the patched one and the unpatched one.

I'll leave the patched kernel running for some more weeks.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
