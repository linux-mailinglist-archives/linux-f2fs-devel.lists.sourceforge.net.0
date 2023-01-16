Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8573F66CC9F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Jan 2023 18:28:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pHTHF-0003SY-Jo;
	Mon, 16 Jan 2023 17:28:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pHTHE-0003SS-Pm
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 17:28:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKiI2QHqTqjlZRtvri01PdA7twqgAxyHUFR/16e+0xw=; b=hRVPs4f0Z7pxWnhVENrXECf+GK
 JY3t0cnE8THkdkY3J9/6UhpjvPMlIQzkltmLkbxZAysl2ATAwsAMvxlxP5N2bilD5YzCH2hnIfSAM
 P3Wn4RwqUQ4zc9U6R7+t3w4ADumZ8JzB6syk9uJbCPVOy00X6Yw8J+U8m05399keDaFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wKiI2QHqTqjlZRtvri01PdA7twqgAxyHUFR/16e+0xw=; b=eWodA1b17CuIgpN+CZU9fMFgeI
 q+nYgqh8RfXqS2G0dCcyK7SAIg8fV5ykMIAa1PwTTyln6UjPzwMmQqdP8f8p/pTfgQoQwvkZz8L8n
 DpItnQ7aHISSK9LBYuTJH/gLwYrnKIpoUqEXnecIu/OHM1KLeMYaaZ3CcRiwd2T0sEvM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pHTHB-0005kC-GN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Jan 2023 17:28:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA593610A1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Jan 2023 17:27:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48231C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Jan 2023 17:27:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673890076;
 bh=wKiI2QHqTqjlZRtvri01PdA7twqgAxyHUFR/16e+0xw=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G1BJ92l6A0AqwXHZRawuTo1Vw6e2WHvm+vs9dEDYyeD4RBtv4vCKfPaQOk23T//e6
 pNBSL9M+lIVVnP2z0kByGPcw5KGxYNiPUDfTN+Vr+I4obsvns60DQ3/vUxsNL7pGyS
 lCA2ZTo6q7dRALF3+BHYnACCSlW4fvz6wQ1k81/FSxbDrNfQY15zuXP9j/H4tatiGZ
 6DBoK+G8jY9D8vkFrU+Iu+YqxUVYl5ltbK3EecZXKElSQNV2+pHXa+Yd4q5ByUsRwy
 jM6ANLImnGd5sUNLA+8c+QHNPQtcujH3+oD94+CQN8Akhuc/YY4pmGdmBP0BqiJ/SO
 jUzvdCy2uGQhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 1ABEBC43141; Mon, 16 Jan 2023 17:27:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 16 Jan 2023 17:27:55 +0000
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
Message-ID: <bug-216050-202145-i3l3mwspUK@https.bugzilla.kernel.org/>
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
 #123 from Guido (guido.iodice@gmail.com) --- (In reply to Guido from comment
 #113) > (In reply to Jaegeuk Kim from comment #112) > > Now I'm trying another
 solution: I used fstransform to [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pHTHB-0005kC-GN
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

--- Comment #123 from Guido (guido.iodice@gmail.com) ---
(In reply to Guido from comment #113)
> (In reply to Jaegeuk Kim from comment #112)
> 
> Now I'm trying another solution: I used fstransform to format the partition
> and upgrade the filesystem to f2fs 1.15. So now I'm testing kernel 6.1. If
> it work, well. If not, I'll try you kernel version.
> 
> Maybe other users can test your kernel early.

After 1 month the problem is again here wing kernel 6.1.6...

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
