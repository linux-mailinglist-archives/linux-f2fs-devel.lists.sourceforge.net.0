Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 321E0633774
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Nov 2022 09:50:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oxOz9-0001HS-6X;
	Tue, 22 Nov 2022 08:50:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1oxOyk-0001HB-E8
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:50:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ew1eDSG0qsUh1rSi6EmhH/c5m4mKFfsDgDmqN/j3pns=; b=DIhLmB3rJjr9Nyfu/uz/9sDCLk
 3sVC8o/ixr9m5uCOQn29p90eJD3xG/R/L+DEsijfuEV3nwoRZZD02Coh2zxKBeZ/BmFjaf4p0shQ4
 eVq7Pt2Er/ba+hZzxHdVwcBEQiLq/HLddX0UJpcwsrkBdhmbEcam/4e4l3GyepjmuPQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ew1eDSG0qsUh1rSi6EmhH/c5m4mKFfsDgDmqN/j3pns=; b=JRGpnfch1AcI03iFY3pPxrpqZv
 x8Yj3gkW+OMACvPuX24uj5FKXsjM5L6YfIIYjQ735et88DEhvrbDNYjplCcTiCAM8Oul26fjLfnt2
 16hQP3EEeqo6cCpnYMECc5bRGZfDKZiY4bqzwJ3DQfDWolMYui6GwHr9vcMJNnDnJ7fY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oxOyj-00BAS9-Mf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Nov 2022 08:50:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4CF99615AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 08:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 162AFC43144
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Nov 2022 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669106999;
 bh=Ew1eDSG0qsUh1rSi6EmhH/c5m4mKFfsDgDmqN/j3pns=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=WngBzXWO5cUQUmtr3BfFLS3zrl+4aBGFC6bIvY1jSmGa0zhavoBqqj8/3TSuGHW1F
 Iv7n2OLMF6HSZ4ElQ8yud6LkRgH4Au+IrMlzWi0SOf30vkCYy851/CuCjyjFVFssZD
 y2faGGQEWrp8i5ndxIaBploi0FWiEF1qABi4XFSBevHm6dL5hzRMICuMegXUdM22S4
 nyTCK/GhWylOCsZo/8GtxH2193BkOAqqfXcqE+XIy8mU/KGqZLO2hqD0Z6OBtsjOw1
 025lcPFhCWEheTaxXzAb15L06gY5xnILJkhzkObVbuZ0BoRSUrZ+50QaajJnrIJjyM
 X05Mw1saOEYVA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id E79F0C433E6; Tue, 22 Nov 2022 08:49:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 22 Nov 2022 08:49:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: bogdan.nicolae@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216050-202145-SbOu1vzSHR@https.bugzilla.kernel.org/>
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
 #89 from bogdan.nicolae@gmail.com --- I confirm the bug persists both with
 background_gc=on and background_gc=sync. It's especially prone to manifest
 when the machine is idle for a long ti [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oxOyj-00BAS9-Mf
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

--- Comment #89 from bogdan.nicolae@gmail.com ---
I confirm the bug persists both with background_gc=on and background_gc=sync.
It's especially prone to manifest when the machine is idle for a long time. It
almost feels like the gc hangs because it has nothing to collect and therefore
it is entering an infinite loop.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
