Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6FAC84DA47
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Feb 2024 07:45:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXy9w-0004UX-RD;
	Thu, 08 Feb 2024 06:45:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <eugen.hristev@collabora.com>) id 1rXy9q-0004UQ-Bu
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 06:45:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f+FcTbIEv56Dj6aX2RKWItIsNCgw6/TPuqj19j/LdyQ=; b=KbYd7x64xtOrMeYQ+dFtpqxbOf
 H7yGvvuLfdqG/KoE4hbiPnsjMV+YftCnRBbJAV6uARkQLC7p4SckpP/zOvTOsxRDHlqfc8VMj+ag/
 RoYVNuKW3f5MLV5nfCt2XZ5waygmuzJNPcolj5/w7lMMkUkmjkOepkJSP1T6elQoZFQ8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f+FcTbIEv56Dj6aX2RKWItIsNCgw6/TPuqj19j/LdyQ=; b=X
 7d6umvADFLNXEuHZ2WNsTra9JM0O0MvdybbmocvZKUWn3A4o+BHmVAnsNSf8wwsUkwIEudDXToR4h
 XsiheAbSIKqeTKvF0MM0JgwdbzK/mSVODp5dAdkhsStbR0dpzhZAI/zkUqEq5XCH4UE/ch/Dt/R0s
 MRtm8fUUJd/zKjTI=;
Received: from madrid.collaboradmins.com ([46.235.227.194])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rXy9n-0000tK-0W for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Feb 2024 06:45:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1707374705;
 bh=g2xl39Fa4di9f+3GPmwdIPXkJ7s4ZyhPFbxxlwIu4U4=;
 h=From:To:Cc:Subject:Date:From;
 b=YdLmn1bfBfLUHw2MtKB7I1RRU6nmsLLkxjeiIjdUbpWZCnP6TDjYGRb85PHRPoV1s
 V3SZb6bDJpB8TZcP6K08NrO1TQAXpt8wvRQxZ++/AYZxULaMQ+QayQ7/+d1SO431iL
 oBw0GTjmvGuBN3/BgjxNDdNVoQ1huQISJrU6ahqhpd7AGo4oGIvnfTwIEzLJWCNWl/
 ng7q1LzSNyo0vfPjFwB5cLwWoRzu7qLWSrfvV6SJDIZnUrfKOxKQF4uSd0VZf231dS
 ld9F38ipankNIsTQn5zFFJ3w+FlrNI1FiwtBoWs2WD5IrGrye/SEWT6A47v88JWqvE
 6CoUPLncVg/DA==
Received: from eugen-station.. (cola.collaboradmins.com [195.201.22.229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: ehristev)
 by madrid.collaboradmins.com (Postfix) with ESMTPSA id C4817378045F;
 Thu,  8 Feb 2024 06:45:00 +0000 (UTC)
To: tytso@mit.edu, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 chao@kernel.org, viro@zeniv.linux.org.uk, brauner@kernel.org,
 linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  8 Feb 2024 08:43:31 +0200
Message-Id: <20240208064334.268216-1-eugen.hristev@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, I am trying to respin the series here :
 https://www.spinics.net/lists/linux-ext4/msg85081.html
 To make it easier to apply I split it into smaller chunks which address one
 single thing. This series is based on top of the first series here:
 https://marc.info/?l=linux-ext4&m=170728813912935&w=2
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXy9n-0000tK-0W
Subject: [f2fs-dev] [RESEND PATCH v9 0/3] Introduce case-insensitive string
 comparison helper
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
From: Eugen Hristev via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eugen Hristev <eugen.hristev@collabora.com>
Cc: linux-fsdevel@vger.kernel.org, kernel@collabora.com, jack@suse.cz,
 linux-kernel@vger.kernel.org, eugen.hristev@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

I am trying to respin the series here :
https://www.spinics.net/lists/linux-ext4/msg85081.html

To make it easier to apply I split it into smaller chunks which address
one single thing.
This series is based on top of the first series here:
https://marc.info/?l=linux-ext4&m=170728813912935&w=2

This series commonizes on the string comparison match for casefolded
strings.


Gabriel Krisman Bertazi (3):
  libfs: Introduce case-insensitive string comparison helper
  ext4: Reuse generic_ci_match for ci comparisons
  f2fs: Reuse generic_ci_match for ci comparisons

 fs/ext4/namei.c    | 91 ++++++++++++++--------------------------------
 fs/f2fs/dir.c      | 58 ++---------------------------
 fs/libfs.c         | 68 ++++++++++++++++++++++++++++++++++
 include/linux/fs.h |  4 ++
 4 files changed, 103 insertions(+), 118 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
