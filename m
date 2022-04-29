Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE947515084
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 18:14:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkTFp-0003Uw-HE; Fri, 29 Apr 2022 16:14:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkTFn-0003Up-Ln
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 16:13:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OQ+jDYJbGBk2tLx9niW39mq4NCoR6iL6C2Y8ZB2POBA=; b=BP0M0j8hMctznnVap4aY0sU12q
 MfA25JG66QU+C/AzboVAqkF8b4rZw+qC/H0KV+PitBTBOUcwt3AE3kdM3bRWpdm2MA62dDUqJDlPn
 sd1aGDJUJ3RIV2EqJAIn7kNcVE57txrzveMM5bnmqWOsmZPVoxmiShbff2UBmW1HtF4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OQ+jDYJbGBk2tLx9niW39mq4NCoR6iL6C2Y8ZB2POBA=; b=mDAa2LcFtuVPJdxuf+ahaSfFVg
 1INQ20f2+HHHbAEysCHk6Vtf4dUWalGMrFR1Euo1L5zPJWO7FRN124zLLS6h24W7iGoayGRXFO1wO
 FlulVzEyAYqmHKFa6wzkuZ3sGR+nh2Ar/DaWiQsABhZvBImuf52S9OuO2cD0RQUr9n+8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkTFg-00Dxbe-Vi
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 16:13:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 1A92BB835DE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Apr 2022 16:13:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DEA41C385A4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Apr 2022 16:13:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651248818;
 bh=OQ+jDYJbGBk2tLx9niW39mq4NCoR6iL6C2Y8ZB2POBA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=nbm8ZLFITaQAUCnSwk5RX2ulZfN9OphyLBjSm50iVfKjW/R6iGlRbhWfqj2AQ9/t2
 RkjO22aP6Gd8V03nRkHL7Ms7eEumTjoFX9E5Wr6XXDpk+dB2V86/ZVcQDuQ12HkNIf
 /h4gl8ili+XZW8YANpwseVA8/aXResekqXEeBV+TGrACJAWtyFBnLwc3GjmuBbZoR+
 Q9MsK2LXHJ38m2Ze7TE6TT3Q2H8mdlXghzF0LTGUOsuYkjYcsMs8/VhLrka8IdjkOS
 Ad+5q96SQhVWiv2u4z/5aIc2kPORGEUakDdjGMbb46Q8VM9Y+R20jvHqjIMNuvM4qT
 33eQaNvrQtmzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id C4037C05FD0; Fri, 29 Apr 2022 16:13:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 29 Apr 2022 16:13:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yanming@tju.edu.cn
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215916-202145-TMVw2AyDQj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215916-202145@https.bugzilla.kernel.org/>
References: <bug-215916-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215916 ---
 Comment
 #2 from bughunter (yanming@tju.edu.cn) --- I've tried this patch, but it
 seems that this bug still exists :( -- You may reply to this email to add
 a comment. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nkTFg-00Dxbe-Vi
Subject: [f2fs-dev] [Bug 215916] kernel BUG at fs/f2fs/segment.c:2560!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215916

--- Comment #2 from bughunter (yanming@tju.edu.cn) ---
I've tried this patch, but it seems that this bug still exists :(

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
