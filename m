Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F50A140D4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jan 2025 18:24:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tYTbx-0002NP-If;
	Thu, 16 Jan 2025 17:24:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tYTbw-0002NI-GG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 17:24:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6HvHWpigxqukTYq2bJCH66ZzPL4RmewNoh8kVi6nfJk=; b=PZ30hpwX+eu3Tr2MAS/U/guGDB
 QegPMT+LZ+Y3+q3mOBIh7As7F9aJeygNlEo11Q0ybyvnQHE2bAZg5vJC8Zl0RU/0/Qty+HwCK3/Uf
 53mq7DmOtTId/U+nMaNDgIVOxW7JP2/yt0cLMH007MtaEURZcUOgwh1eSnjc5oJMZVeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=6HvHWpigxqukTYq2bJCH66ZzPL4RmewNoh8kVi6nfJk=; b=M
 DYIC4vAMAjVvaJIRyEUDfbr4QzuDErIYRpySr/wdjKvnF0xHhmPlcemkOqpbFrV6Sj3xxut4eSzUy
 k1ekjaAV42ixoRsLonC2mKZ+cN87xvwRcAnVodYd1OQyNn54rueE3/rxL6PDMvmNlRdlXmRTIhAKh
 XVICO9lOibB7B1ew=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tYTbv-0002r9-Ae for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Jan 2025 17:24:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44D9C5C54CE
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jan 2025 17:24:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982B1C4CED6;
 Thu, 16 Jan 2025 17:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737048280;
 bh=6oWoeFipBJAo5PN4YQJn255TPCp58SkFq27ebvx9C9Q=;
 h=From:To:Cc:Subject:Date:From;
 b=VaN7yTVAw619MefQZDhFvpbcHnkv4cIEbP85S6ViCIK726hvAiE/h7KcU5YDBLghy
 wkDKcVbRf2qM9XhpDzOAN2LJs8HZkOqR06akpVWlN+EdaBSxsz1IWLs3/H5jWGsvaX
 Y1mgm2qwsE7cifv3IQ+3sN0DbQZv0MP5/ofH86PVMJ1C96fhvMMGK3tLl38J2M3gb7
 rfRetIiQu5GSMb2di8Jqrzh3M97ZqvegcHyMq6+zULUPRvVnJrD2Lwjvpw+KG1f83/
 ujMhYYR56huC/3xtzZZwP0/JjnGz5DL3pDn8aHY7ELLSLc35wmK/4jcYXfvsfZIxqx
 ms9cn8vrI+Inw==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 16 Jan 2025 17:19:42 +0000
Message-ID: <20250116172438.2143971-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.48.0.rc2.279.g1de40edade-goog
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If users clearly know which file-backed pages to reclaim in
 system view, they can use this ioctl() to register in advance and reclaim
 all at once later. Change log from v4: - fix range handling Change log from
 v3: - cover partial range 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tYTbv-0002r9-Ae
Subject: [f2fs-dev] [PATCH 0/2 v5] add ioctl/sysfs to donate file-backed
 pages
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If users clearly know which file-backed pages to reclaim in system view, they
can use this ioctl() to register in advance and reclaim all at once later.

Change log from v4:
 - fix range handling

Change log from v3:
 - cover partial range

Change log from v2:
 - add more boundary checks
 - de-register the range, if len is zero

Jaegeuk Kim (1):
  f2fs: add a sysfs entry to request donate file-backed pages

Yi Sun (1):
  f2fs: Optimize f2fs_truncate_data_blocks_range()

 Documentation/ABI/testing/sysfs-fs-f2fs |  7 ++++++
 fs/f2fs/f2fs.h                          |  2 ++
 fs/f2fs/file.c                          | 29 +++++++++++++++++++++----
 fs/f2fs/shrinker.c                      | 27 +++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  8 +++++++
 5 files changed, 69 insertions(+), 4 deletions(-)

-- 
2.48.0.rc2.279.g1de40edade-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
