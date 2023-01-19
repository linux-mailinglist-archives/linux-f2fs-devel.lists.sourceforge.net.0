Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0363A67411F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Jan 2023 19:41:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIZqn-0002QR-OF;
	Thu, 19 Jan 2023 18:41:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pIZql-0002QJ-6q
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 18:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ta0BuiIsTa9UzVwKyAix9RGRtdd3lHM4x8m27+Q+IOc=; b=fwfLVEqi5gVe8JwUhJDdv7XNJj
 0tIIQqETqqeveghxx5U36Be8Qsvi9N/Rb8lSNPB+YrQ0sg2iHyIsCgRxj/959l9ZNPRjahpXi5TtM
 t9kPg7iIRVppuDED5fC62fGOaeAaC0OJo1FpTWVy+YJZ8fopDbWQQzz0vh4804/Sh/H4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ta0BuiIsTa9UzVwKyAix9RGRtdd3lHM4x8m27+Q+IOc=; b=XupDoP63jBDlrWUtmwlsqkm39V
 cFScxUzdwH8bDo1YE1vsi2Q/jUMfYzUsJwXG274/L+jNRju95i9f9qQVF/XnbTfaGlfsyA+vyIWok
 VtMHuV8rft+Os8i0Jdf7A3GYErLoBQfXdcXp/D02YH+ofH5K1SozXYPs8SPWTXL9lSBA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIZqj-009PBX-M3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Jan 2023 18:41:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 63A08B82699
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Jan 2023 18:41:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0D1A2C433F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 19 Jan 2023 18:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1674153674;
 bh=Ta0BuiIsTa9UzVwKyAix9RGRtdd3lHM4x8m27+Q+IOc=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=g9MkTm8xIt5IfLYecMmfvt8YervTc7aMq483hfevPVw84NV05UkY8lxuFWdptq03f
 o4kQQRmainXdki7ibh14hJIsPxJizdePLnragjrhfs4/r4wXIe4TDQuumXdvfyNXGm
 SMPQAyRP469U3rdiGjA/uidnGYCs9JQtEHAHqgG+2DAy8VAVOcEuRSB1EsJWURvU/2
 byprfhbGhaSFS2ppmJsoXqFn4Ol0wBcB/C9FUPb0+MReu6NQi97V52ju81M8DZtgJo
 TvSsZMGQ2yXDeZEoLnxmW5HWRzUzQH7bfqu0KoejU3iQf3NXDOXwOPaTw7baZe+QS0
 5Ghj7d+RBkCHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E49D6C43142; Thu, 19 Jan 2023 18:41:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 19 Jan 2023 18:41:13 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: v10lator@myway.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-GHwIi6Ss1v@https.bugzilla.kernel.org/>
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
 #130 from Thomas (v10lator@myway.de) --- (In reply to Matteo Croce from
 comment
 #129) > > Bisecting this is impossible: There are 16205 commits between 5.17
 and > 5.18. > > This will take [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pIZqj-009PBX-M3
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

--- Comment #130 from Thomas (v10lator@myway.de) ---
(In reply to Matteo Croce from comment #129)
> > Bisecting this is impossible: There are 16205 commits between 5.17 and
> 5.18.
> 
> This will take roughly 14 steps. Long but not impossible.

Exactly: 14 steps * 2 months = 28 months = 2 years and 4 months. This ofc
assumes you're bisecting 24/7...

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
