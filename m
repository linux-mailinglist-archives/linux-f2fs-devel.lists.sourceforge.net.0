Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 343A153A409
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Jun 2022 13:27:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nwMVZ-0001Wu-Ut; Wed, 01 Jun 2022 11:27:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nwMVX-0001Wn-Uz
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 11:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gRhnN380bySxwJx87o9huzxnSFft1hyOKfAihZ0Z3mo=; b=UcDffYXXBhAo7NwwDw5YerbcoI
 OYfkM7aZkFBWteDYnff+1nSVRQC6EfV+GDdBG0pKOP7ohgl/k5UoHqzr3ErSqRAoFaUDLz79WJZWf
 gfS0ANxJh5Gdxb9zjdaaroVpJN5m696XNFZHkVnGOtQQ69ii94lPBX4U4dmVN4tvmoqM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gRhnN380bySxwJx87o9huzxnSFft1hyOKfAihZ0Z3mo=; b=jmu3jXOEBpP5J582/z9gCjZGhV
 rrhGIetoODUuSwAfIeCihkCrwaHgnWOLTSzB5QbtuildAbKBgHnB/Ufmr7bUHxDgbEm+obtRmu0xp
 JXpJa/2bELLdub5abv+KF8MahvcLyCkzKEAM9ogEIU8cuqFAchxolkvBDT6oOUrDxerA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nwMVU-0003HA-IV
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 01 Jun 2022 11:27:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id BEEF9B8180E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 11:27:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 622E4C3411D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  1 Jun 2022 11:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1654082833;
 bh=gGtc0H5MCKe1ttCOtrpqYR78lsQyg6e1pC3bELP1TVQ=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=G4byNhZBfP/Br4twtM0sA0lBpfDGsQiHX5kP+k5dgG5Gr07fIYLFCFfKf9G4gU0M8
 oE6jK0EaAhmlO/X5P5+fwFcHyLGgTeSjuAbZlkegaH8noo6I6KTp94BmtFbIMVnSQZ
 51xZobh/EP+NGKju5WT+bQeclqSf8ZtedECDzm96+hhVpuvrQtNfAeMWxnXV/jYFnm
 nrL8K5mIxqVtpfcFBxNz4ZjYkHaEuePx2Ra2VI7yQfy2CUAje1IfhqYFlq4F6z5WfI
 TSVXvJwLvS78OHgZYuctJ+/t7Yp8fhs7n4GzRQvTo+VwJ7YLPiAOnlUCQBu1pH+7Ga
 FlXhBQlOzZQsA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 4C0ABC05FF5; Wed,  1 Jun 2022 11:27:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 01 Jun 2022 11:27:13 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-216050-202145-zelh7ko7zA@https.bugzilla.kernel.org/>
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
 #10 from Guido (guido.iodice@gmail.com) --- Created attachment 301086 -->
 https://bugzilla.kernel.org/attachment.cgi?id=301086&action=edit f2fs status
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nwMVU-0003HA-IV
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

--- Comment #10 from Guido (guido.iodice@gmail.com) ---
Created attachment 301086
  --> https://bugzilla.kernel.org/attachment.cgi?id=301086&action=edit
f2fs status

I attach my f2fs_status

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
