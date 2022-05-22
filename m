Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80420530326
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 May 2022 14:47:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nskzd-0000Qr-4P; Sun, 22 May 2022 12:47:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <bugzilla-daemon@kernel.org>) id 1nskzb-0000Ql-Ke
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 12:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cf/8RGPBzi3T5w0ZYDVRSaAn9MZalDHhacnGXRw1q9U=; b=QgfS2Zt/dnR6Lpt9C/9wc6gNci
 +ckeTuXAPddV1Rpm9aHLvo/2v8+Tp8NCD2f7pg4aN9tX0Qjp2IikanRHKMMJXh65Fsm95xfa5nuQi
 Gbp2P5G6SO38xKsm++TzajRO0RW6CzH56B4P6Rs3xY/hcNtNa6OGNLce+YYWGVLybrIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cf/8RGPBzi3T5w0ZYDVRSaAn9MZalDHhacnGXRw1q9U=; b=VVR7LZ58ZLHGKqSCMJw2qbYDY2
 2CX/5HB6rOPVM85jEhGKixo1zIo4LMoXCCQfSZOyjTrF9RsvLvHtDSBiZFYlW5wCY5L7nZjs6iEgD
 oX8YwQ3xOovrdyblvyuHGakhVQQc6aJ1otWLoIjsOE+wjKJZ4uSubXUvHXeVi5HBf5nI=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nskzZ-000d58-QR
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 May 2022 12:47:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B9BBBB80B05
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 May 2022 12:47:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5F76EC385AA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 May 2022 12:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653223641;
 bh=Cf/8RGPBzi3T5w0ZYDVRSaAn9MZalDHhacnGXRw1q9U=;
 h=From:To:Subject:Date:In-Reply-To:References:From;
 b=ql0Rj8znCV5QHRZD7y7IvlSzYF4HbQqXujge3g1/JyZWRYNzw14XJMiibvk0Wby/7
 5fA/lpcxX+f8MMXx54EaPqWqPXJPovw6sbLCtOF3f07yxzmqPk5eewxdVG+OfQJ1BR
 S5o1BgX+dikcojYaInA4jGonuebIF1XSpvVC/tqOi+o6N2vlJ13NfGlNTqVuWEgyNX
 GZDksaW7Kj4tUZx5I3+LoxAHC1TjQXdv3vgRTaDb+Pi2tprnLV21TXJT17XEo20gyn
 K0dBtqrgogctLAKuoBF439Wexmu7ILR9rxTfUlZSrt+gdwRrCKvvrE0LqtXyRAHJ39
 MKgGX6w2y+MbA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix,
 from userid 48) id 43D20CC13B0; Sun, 22 May 2022 12:47:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-f2fs-devel@lists.sourceforge.net
Date: Sun, 22 May 2022 12:47:21 +0000
X-Bugzilla-Reason: CC
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: File System
X-Bugzilla-Component: Other
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: zlang@redhat.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: fs_other@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215902-202145-yCNFasV6bw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215902-202145@https.bugzilla.kernel.org/>
References: <bug-215902-202145@https.bugzilla.kernel.org/>
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
 Content preview: https://bugzilla.kernel.org/show_bug.cgi?id=215902 ---
 Comment
 #3 from Zorro Lang (zlang@redhat.com) --- (In reply to Chao Yu from comment
 #2) > FYI, the root cause of f2fs bug: > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/comm
 [...] Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1nskzZ-000d58-QR
Subject: [f2fs-dev] [Bug 215902] kernel BUG at fs/inode.c:611!
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

https://bugzilla.kernel.org/show_bug.cgi?id=215902

--- Comment #3 from Zorro Lang (zlang@redhat.com) ---
(In reply to Chao Yu from comment #2)
> FYI, the root cause of f2fs bug:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/
> ?h=dev&id=677a82b44ebf263d4f9a0cfbd576a6ade797a07b

Hmm... this bug is a f2fs specific bug? I thought this's a VFS issue... OK, if
this bug has been fixed, I'll report a new one track the CIFS issue which I
hit.

Thanks,
Zorro

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are on the CC list for the bug.

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
