Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD691587954
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Aug 2022 10:52:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oInd7-0003F1-2P; Tue, 02 Aug 2022 08:51:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oIncp-0003Ej-92
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 08:51:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zaxgwq+gWtRM4sTgY/lWLFDTTUhNmjlA+02l+p2Secw=; b=hlEfZETG0lZV2J2ZMe8+d0OReh
 N5ouihFs49EkpCy6GEW1BZAAa7q6gpZ6RbbIohwzfHMMflcK4CdOWMndT3WqkbxCIDMwu35qNfzlR
 ZGPQGiwtCjO/UugCNi+jRfl2RuWXk0jim25/EHF3tv/o2eOv4OhoZq3049P5Tu3TnlVA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zaxgwq+gWtRM4sTgY/lWLFDTTUhNmjlA+02l+p2Secw=; b=fAn4YCGGJLBFgkCwxpSTvGktxy
 pE2Hh8Zm6Dvh/g4uN4cG1cHQbnh4MrWLQphktpYyy+xuBr49cD4DQEso/nvoz7xyqMy4QAwmTmBif
 VYB2tnw41BQAA57dEnvE9dBRKywUnsMyz8FnwSSK7u9WIDyQSbj8+C7uhns5c1xw20nY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oInck-0000lh-VG
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Aug 2022 08:51:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D0D11B819F0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 08:51:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78F66C433D6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  2 Aug 2022 08:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1659430282;
 bh=Zaxgwq+gWtRM4sTgY/lWLFDTTUhNmjlA+02l+p2Secw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=aSFMVFO/Xs+BxE38QjXQWkz+WDuz4fy3OLRM/SAiz/RrBAe6bSeF10bxmxUSnpVJl
 y5QJs6CV0y1ShDmoc+0HpgrdK5XT5rGwE3jf78m7XyPL6oHKeSyTkGZl+TU1Dqk/jq
 Y6o/SJcpCXTWwtZRxjgOTn6euvsmoMOaB5g6htozuNYvm9hOxno26cY9PiGjaV3KjS
 9alNMgqzsoI+7mQ0Y1jYLkWrnsK87YIR7En7c5i/1GGtLi3xmZFDFTjMAQEM+CDhPb
 MTH05Dw/Y/QVTsM5EIZ27YF4b/dOxm1gsuBJrhaAj7XqYKMuLe2O2loxJO9n+FYRtD
 43wiIV5ktmMuw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 5B13CC433E4; Tue,  2 Aug 2022 08:51:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 02 Aug 2022 08:51:22 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-E2FBigHPxT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216050-202145@https.bugzilla.kernel.org/>
References: <bug-216050-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=216050 ---
 Comment
 #46 from Chao Yu (chao@kernel.org) --- (In reply to bernd_b from comment
 #44) > Could such a patch at least gives me/us the chance to log the event
 causing > the trouble? > Otherwise, the [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oInck-0000lh-VG
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

--- Comment #46 from Chao Yu (chao@kernel.org) ---
(In reply to bernd_b from comment #44)
> Could such a patch at least gives me/us the chance to log the event causing
> the trouble? 
> Otherwise, the only chance left I see is to wait for further bug reports and
> to see if they bring new light into the matter?!

I added more debug info in v2, and also try to break the loop to see if gc can
move on... 

Please note that it's necessary to backup your important data before using this
patch, or you can just apply debug info part to see whether it can provide more
useful info.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
