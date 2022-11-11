Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6286263AC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 22:31:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otbcD-0004Bf-4b;
	Fri, 11 Nov 2022 21:31:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1otbcB-0004BY-02
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 21:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d9/IWd/jkMVJBN/eIJNWQd7qntLBPxYPIMQDqUmV0+s=; b=JomOVGS11+5SVk2wCokz+AiscC
 A2Im0JEZb7RSNA6oFoaqgJGlkxj2dHjMgdTf3t9vH2RJWiDvHHIQTAGaDNf1CuWesp6ispsgb4bTc
 mbnsfpL1CUXKplho1KbzligpPb2vUM2oksiExAYpuFzHJ5whHf5jywGTthpheCUDPmBE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d9/IWd/jkMVJBN/eIJNWQd7qntLBPxYPIMQDqUmV0+s=; b=ma/nBhiPNaPkIJIksjpUdVcABU
 sHtGROUZyXCBBlK+Ibn0iYF4U1el64ZalaE04G8XJl0g8FVeBJ2h8Z27+OdVjfKuP8Bo402X30pQ1
 7KTr9f2nVECkCI2MG483djC4RtrX7mNbXToUkt++/ADQKXWY8GOsy8TkzErA1hK7XFbM=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otbc6-004hzZ-KT for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 21:31:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 22B98B827EE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Nov 2022 21:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C6A28C43470
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 11 Nov 2022 21:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668202247;
 bh=d9/IWd/jkMVJBN/eIJNWQd7qntLBPxYPIMQDqUmV0+s=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=hcG8QzjMRvK1VgUle1TvAtb4bUZT2157nOmG48EdIzUEvQ8Xy3Cu1UnGPWNno2iSr
 dXoU8eW/NLjx3SxXPokDtx80BSO1353yrynyqfxROExD4ftqxdhXcDlhcYzuHKl5Y+
 fH019JLCeYD2cDvBPKpO2WzB3NY4kCUDK0GchJXYUBoBaKZ29GnSLDr8GLec5EdRPG
 DjRNRcz8eQ7PoclW6X66WJBvXqJseg6hkq8aqKcvMP1BE/j81cslvTHQCMBpIUuLKa
 FUXL8a7iu5WDVUhS9/J40LujH8yEvXQ/KVyF8k9koY5MAlcMRnTcz4a6BhJi6T+4SW
 aMX9XP39CHnMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id A1BC4C433E4; Fri, 11 Nov 2022 21:30:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 11 Nov 2022 21:30:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-gR1Dr2PR2j@https.bugzilla.kernel.org/>
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
 #85 from Guido (guido.iodice@gmail.com) --- I modified the script to run
 it on the partition on my choice. No problem with the home and other
 partitions. It looks like something in root pa [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1otbc6-004hzZ-KT
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

--- Comment #85 from Guido (guido.iodice@gmail.com) ---
I modified the script to run it on the partition on my choice. No problem with
the home and other partitions. It looks like something in root partition. May
be it is related to the bug?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
