Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98979644BE3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Dec 2022 19:38:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2cpN-0002AB-Cn;
	Tue, 06 Dec 2022 18:38:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1p2cpL-0002A5-V2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 18:37:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q/wUmBPm0Ui2S5Px1457MIbYAknAwiGGp06KD397AXw=; b=E4oVSyMw/vio0FDGn6fn8hH/u8
 dfsGH1NoGiZBCmziRtuoSzMP0BgC2/Y82/6844rku+Zv9R2Q1owHbE+tsOU8Z+vmHKMCbbg4ejF4C
 0G2jE/BMBipT7+46XFsyce2iMt9m9NRyBAIuHr72o9i+Dl2zFl0q8UfJoyPfFoYwUWiE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q/wUmBPm0Ui2S5Px1457MIbYAknAwiGGp06KD397AXw=; b=jSHTSa4uDq1AnTELh58mu3Epov
 oaZiEX8qzQNfkcZ0OpjXyqwRq82UvbDG05V+1qCp3w+smx8w7nT66nDSurSXYitUQsrTO80QS66Ul
 GPcke2aKcsyPG7fMUf/tnds73EuZLc7JmOsGT9dJL7VnBjreD0fcMVvH4VVrW1i3oPLY=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2cpL-008Ivw-8z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Dec 2022 18:37:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C9869B817C2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 18:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B281C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  6 Dec 2022 18:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1670351868;
 bh=q/wUmBPm0Ui2S5Px1457MIbYAknAwiGGp06KD397AXw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=k0R+VpkVWtTnM5oXkbRLPv/fbUS1aYGJPp7DsgqJhHRzrhHs1c/qJR82qVojenj4+
 fIVnnPEdskrV5S2pO1zIYyxVbMG4dlREelsyaLnq0+ITVic73we3fZWot8X3/umjf2
 DYyztyq7BTLWr7nX36h9T1RKsYRBfZwIYIrys6p/dr/wlajkptO2pOCPYHyfY9amY6
 vBe+5k54RPb8T+cCysGB47JOOvow973oX5cLHvDM2qPBEn2M+4dypTr+GYvymOc7qB
 dguhN0JQ5JocWco/bkI5rKwRsWnVMpZZ76kdQOypiX+6eQH/G2IRcq9/mg0O7bG6m3
 +xIMrBiNPZ/HQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 66F18C433E4; Tue,  6 Dec 2022 18:37:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 06 Dec 2022 18:37:48 +0000
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
Message-ID: <bug-216050-202145-LRSYrSd1dk@https.bugzilla.kernel.org/>
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
 #102 from Guido (guido.iodice@gmail.com) --- interesting enough, after the
 script run on the 5.15 kernel had successfully reduced the dirty segments,
 I started the system with the 6.0.11 k [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p2cpL-008Ivw-8z
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

--- Comment #102 from Guido (guido.iodice@gmail.com) ---
interesting enough, after the script run on the 5.15 kernel had successfully
reduced the dirty segments, I started the system with the 6.0.11 kernel and
relaunched the script (after waiting for the dirty segments to return above
100). The script on 6.0.11 also worked without a problem on my root partition.

As a precaution, I will run the script every 8 hours. Let's see if this will
keep the partition clean and not cause problems with kernels > 5.17

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
