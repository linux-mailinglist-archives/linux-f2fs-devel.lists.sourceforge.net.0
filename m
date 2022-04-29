Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF625150F2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 18:34:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkTZw-000659-12; Fri, 29 Apr 2022 16:34:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nkTZu-000653-2X
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 16:34:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e2G8HYlCOvXHYYnxFYCtf+kkypTUR5E4fyxa4b0+hHA=; b=fZMJBaUrFuN4VpC5uputrvg08I
 63OBzZVS0Ie2tTE9Rfp8ToQ/Asx2maA5a5acuslSw0vz5zT9RAMmJtZSj4M9xlru6BWvjpuZ6DrLy
 6yMMPd+GqK1HLH7qFlAnsEg98HsjGke5IwAn7LAEkus5lxFPsAd0YlfSAW3u5G36r5as=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e2G8HYlCOvXHYYnxFYCtf+kkypTUR5E4fyxa4b0+hHA=; b=Sr1l514dALiFOOcm/2yVRjHsYn
 JhI3Y2cr6tJZq4/Fbz3tiR/jPQQHzpxvCB+Ixy13SMGQAajB3J5xfar82ZhfA3FPrCcbIY10ueacL
 OxP5x8LVoWmSgDkyq2kH4SvBVov0Rcjm0uux7WulkICIpgzJpqVdNDXEm8gKqrqrOpWE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkTZq-00DyM2-L3
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 16:34:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6C1236231A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Apr 2022 16:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1641C385A7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 Apr 2022 16:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651250075;
 bh=e2G8HYlCOvXHYYnxFYCtf+kkypTUR5E4fyxa4b0+hHA=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=h3ws4nGbx0LrNLOmsQpMcRK+j5O2yrR1QzywGOyWm7xzefmF2ouuJmcr5vueCYpa/
 9vjgi47v8xfyXnxdErYRJ2TgIgxj89o/LRMwTORczDBNPz61y51nY0PoOMoxWx98Yx
 SuqCwTcbDSBsB3+NlX39pnlnMEdY+cRaQuO7pIJS+HKFDoh/UQW/0bI8I6Ck4od1d6
 PtK4kS/N9Hu9XROf8I8QIi7arNmLRbfDvpUNnSFWF703w2r80kXlVN0SmDWAuB6/FW
 WcmT/ICjVE5G/gopwQeiyWIf3hSptbJJOSNBdMiqP0POysQYcg1CpG5HAWWrIgxvqn
 qHLoke3mI5rHA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id B439AC05FCE; Fri, 29 Apr 2022 16:34:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 29 Apr 2022 16:34:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: chao@kernel.org
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215916-202145-yWkrISlage@https.bugzilla.kernel.org/>
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
 #3 from Chao Yu (chao@kernel.org) --- Could you please check your testcase?
 The testcase won't panic system and there is no failure log printed.... and
 then I try to mount it again, it fails mount() and prints newly added log
 in my patch. 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nkTZq-00DyM2-L3
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

--- Comment #3 from Chao Yu (chao@kernel.org) ---
Could you please check your testcase?

The testcase won't panic system and there is no failure log printed....
and then I try to mount it again, it fails mount() and prints newly added log
in my patch.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
