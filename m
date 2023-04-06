Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1106D9CF6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 18:04:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkS5b-0008UG-7V;
	Thu, 06 Apr 2023 16:03:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1pkS5W-0008U9-Er
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 16:03:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=awd0Ix7iEcJhF6ZgB2gZ4HeO0dOk5eKLW1ZBWR25p7M=; b=dH3UWydblRyKZT3WURMOkF413C
 w21DPR//A8RGAvCNMc4ASfar/2dbT8Dl32f4/nMlGJN5f0dF+WQa771GqiaeA4GkrH8gME3EmXHR3
 91ZoThkBe592DvJ8cS006VrZP4HxdOIVi33vxtr0IOXeLpT8i5WRIqgRNI1AUdKmQo18=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=awd0Ix7iEcJhF6ZgB2gZ4HeO0dOk5eKLW1ZBWR25p7M=; b=ZUEABr9eXdNFtp8H12GLJzecuc
 MLN77l+z+Tk7WLFZUDqtEQt1jRAakm0RaMVfWp9jN02ODoCpMedwlE5tCNkvaBA1KdOjAxHx2y7cH
 Vxhqiz1MYxaeY1Wos1itgSQJNopgT75fgw7aetz1q8PK2HnOerdJoG/AKelxCeGM6dew=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkS5U-00Gz9f-02 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Apr 2023 16:03:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9550E63C97
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Apr 2023 16:03:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 041F8C433D2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  6 Apr 2023 16:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680797022;
 bh=awd0Ix7iEcJhF6ZgB2gZ4HeO0dOk5eKLW1ZBWR25p7M=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=lb8GVI4tAHnMNI573rrFB17uXrUxA/G3VziysOgMxnblXJJj11gYhEieydtS8T0NA
 uhN65tAZupbj4oEP3JoQ0+7/3N3lUREJbKb0gB13H9Ga+yMXqtAEqeRu8gVde0w7Ug
 gxdlHR4sDSiNCNNv3EvKnlcYETgL6ktKq1DxPKc/uNrDZDaWh2Pbb9SnN36S2xAsyq
 hcRMXHopDEJ21iOQI/UPAWF85p/Fpj0edOd5bLuYvnkPy2Jtiq8WnsfilF2eI0TYtz
 3WAYyQYRb/DCDXj5k5uuP3MBrf4LUaBYMrnhh0UbONml33NzTuSEfOWzFZczKlNTe9
 STKNsvvpKeBzw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D6AFCC43141; Thu,  6 Apr 2023 16:03:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 06 Apr 2023 16:03:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-x2JZGSdYgc@https.bugzilla.kernel.org/>
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
 #143 from Guido (guido.iodice@gmail.com) --- (In reply to Jaegeuk Kim from
 comment #142) > I've reviewed the refcount of the path and found one
 suspicious routine when > handling page->pri [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkS5U-00Gz9f-02
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

--- Comment #143 from Guido (guido.iodice@gmail.com) ---
(In reply to Jaegeuk Kim from comment #142)
> I've reviewed the refcount of the path and found one suspicious routine when
> handling page->private.
> 
> By any chance, can we try this patch instead of the above workaround?
> 
> https://lore.kernel.org/lkml/20230405204321.2056498-1-jaegeuk@kernel.org/T/#u

What kernel version? 6.3 RC5?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
