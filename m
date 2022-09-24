Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0769F5E9066
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Sep 2022 01:14:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ocELy-0004le-03;
	Sat, 24 Sep 2022 23:14:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1ocELx-0004lY-5u
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Sep 2022 23:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SQx8dYeNLpl1uywW9QJ8vpGCAvmoHqg+0PT3p5350Us=; b=k+41BeZ5hy2hucLV5S3oMwPgCA
 CEa3xfMCC9QEaIFcmGbalaNl/HWAMMNCEoJ2EwPG3weNzxtOJXwrxj+VuqjURWjeIbQ8ex88NxT65
 BI8mh2deHFLlpXKFTT4/GpQJ9KBkvj3pnH+CG3nVPGDdfns2AyupNFUUsn6Sm12lAxeI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SQx8dYeNLpl1uywW9QJ8vpGCAvmoHqg+0PT3p5350Us=; b=RFknMsCfCfn3wVEC1K2il76c2N
 faKwTaAIjAMdjZXUUHqfqvLMqPorJ7aSW6UkoAmCJQ5L8ag5VBPAKiE4LkquI3BMwiOKCzXh4xQRF
 szsss8SSSgL+/RhkNyKDIOR2bFy76C4sOLmaujjwbPIuIeWM9ujsOK/oUc9xbCvemVGw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ocELz-0007pR-2U for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 24 Sep 2022 23:14:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AE94461309
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 24 Sep 2022 23:14:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1FEA4C433C1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 24 Sep 2022 23:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664061264;
 bh=dIBlrG0sysgwgKH8cRKcmpk2nFqvPsEtdchahvo9Mew=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=MIXcU6lb++s/cnhf5ergA+0UZCJlWe1+ae+X8ig/UFL9Wx7ThizyDxOgRIUj+A9Ky
 sBNW55zIgutjrJolZbxNprAts2Oc3MR6stRCVKVdJuVWSWh++/LKN1UHpIAfwuzduU
 IrYULg7U3R3fS5GpdBmshl3IlwudE0jf5gdVX97KfBfRLmLyl0rYpFZGy6uySiuM6w
 957i47CABKcLqP+T4vn6+iM72+f5g3g6RqWh+vzGyu0KaeUQe+6rfTcEgF8o5sl3gB
 1uv3O8ZeXSu+AVQsNWl4HcvWhbSdjWYTNYZjwbIemMbD7B7zVpPfFulaiTxR8uTVxW
 nPQOlAP+FKdsQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id D4388C433E6; Sat, 24 Sep 2022 23:14:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 24 Sep 2022 23:14:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Product: File System
X-Bugzilla-Component: f2fs
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: yuriy.garin@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: filesystem_f2fs@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-7AOKHiC9at@https.bugzilla.kernel.org/>
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
 #61 from Yuriy Garin (yuriy.garin@gmail.com) --- Created attachment 301868
 --> https://bugzilla.kernel.org/attachment.cgi?id=301868&action=edit dmesg
 log Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ocELz-0007pR-2U
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

--- Comment #61 from Yuriy Garin (yuriy.garin@gmail.com) ---
Created attachment 301868
  --> https://bugzilla.kernel.org/attachment.cgi?id=301868&action=edit
dmesg log

Another 900 debug patch traces.

All on the same address:

f2fs_get_lock_data_page i:5000, mapping(0000000007c40c1c, 000000008a3c4185,
0000000007c40c1c), ino:1138081, i_mode:33261, flags:2147553792

Good thing about this debug patch is that it breaks forever loop and all this
mishap takes only couple of seconds :)

What else can we do to help?

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
