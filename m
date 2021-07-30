Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC38E3DB1EF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Jul 2021 05:26:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m9JAc-00022J-D8; Fri, 30 Jul 2021 03:26:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <bugzilla-daemon@bugzilla.kernel.org>)
 id 1m9JAa-00022D-NU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 03:26:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mU/jWC0ZnF90dlrNb1OIM44YA+I74d8gtxwTjzOgVUg=; b=BRtcNxbQ0eQw6iP2pf4LZ6HyLx
 p5A4EDO8uxyeqNDaf9E9go+Q60z/vUdl4S5zwEb1YS5MqTP0eePsqZKMUHORRU9optbsPMRZedT/z
 GSCZZiRCT2GDWo3cQK8KBb7sWVRL877kqwb9+XZxe5lOfhmLQc+raDbxcdfypCjRuEME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mU/jWC0ZnF90dlrNb1OIM44YA+I74d8gtxwTjzOgVUg=; b=ESOhjYF9gUrZjQmsg2Wgg7zL9/
 /r7q8eRAe0SAn4vMveBTqWMeowYYcmriSou8sTO7onX/AXFdEp+agyKiR7VrP5YMsE5Q/OSdl0t6V
 KEYxu2HdacshL85oD5HLd95/uK5Th9OObZvrtvzRqGlhGM6P556HcCEEpprHbE6B3FSA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m9JAO-007GNf-9v
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Jul 2021 03:26:44 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id DE4ED60F0F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 Jul 2021 03:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627615586;
 bh=mU/jWC0ZnF90dlrNb1OIM44YA+I74d8gtxwTjzOgVUg=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=T+X6SF5/5uCTo+rlQbUDWY8heIQLtIZgCTMOOo1nMb9gwYfdSkg6gsSN6uHv2aFS7
 7BxLvMlcq4LdpWGYPgnk/W2Wcwp+4ra8PF77rUcK+0EYxfwewnJYRLlqeDf65Lo2o0
 d+Vb4L3mGTT+q+nZYDsa2ZKjLEtI7pHgg4hAezVLll1DLb21QjIf0H2/3uSfnzQVHV
 eu7ZGLb2Ta/QFEdYBcIzaV/LB4XU/4D0Dm0kWm8OW99dwdE98hqtCeNoTMusyhGmzO
 UrALwhUgH8VlCQtniO866/uyGfwOOx26AAROkW+JAEVWca7UDH59QBeLtj4OFO3xfQ
 RtvGvKajo677Q==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
 id C9A6660EE0; Fri, 30 Jul 2021 03:26:26 +0000 (UTC)
From: bugzilla-daemon@bugzilla.kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 30 Jul 2021 03:26:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: trivial
X-Bugzilla-Severity: normal
X-Bugzilla-Who: leftzheng@gmail.com
X-Bugzilla-Status: ASSIGNED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213877-202145-4krQTPKF2u@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213877-202145@https.bugzilla.kernel.org/>
References: <bug-213877-202145@https.bugzilla.kernel.org/>
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1m9JAO-007GNf-9v
Subject: [f2fs-dev] [Bug 213877] Mount multiple SMR block devices exceed
 certain number cause system non-response
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

https://bugzilla.kernel.org/show_bug.cgi?id=213877

--- Comment #3 from James Z (leftzheng@gmail.com) ---
However, on a near-full disk, *write* operations cause panic.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
