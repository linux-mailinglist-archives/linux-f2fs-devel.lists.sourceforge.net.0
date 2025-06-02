Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1736BACAB0C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jun 2025 11:03:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lxi3Xp2ZehUrQERPOqnZe+hwcZFIGFKqgo7Pj8denR4=; b=BVoIKBKyXlVzhGSktEKg67ICsf
	A0uM1ECt8kqOvtVqKR72ZU3eOcmbv7+3IHKaIitiYUfj0E5tZGcxwSTKLXsZN8ROcW4PgslbH+A/q
	lkE2eWGQf+a8yeivyqJvigTi0AYbIABK/uUAHrbycNT3c3+Rc1fzkTOR2ybNOl1o89pQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uM14W-00041X-QN;
	Mon, 02 Jun 2025 09:03:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uM14T-00041P-E3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 09:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VIuzWWcUSwHrlFYhNeZb81nI01//LiBOlAId6/mQhPU=; b=Kfx1ZfVo37HH/DaO/AMiZ84nLU
 7QuHbKKdluT3RF7BpVQVl64gcBhqzT/xA+a5Ur+khWu54bHXWwiZw8EOXQ+591cuDGukH5ATy2fbJ
 3QuV18Fc+ErQ3djKovI0PAqxMz1y3G5A+x6axdEJ/sy70V+IgNc0aoEBcRgbA+OiDPkw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VIuzWWcUSwHrlFYhNeZb81nI01//LiBOlAId6/mQhPU=; b=m
 e1ie0CdLwyzpsQRphdQh9IYdKbgnz7n049a2mWm8FDl3ryBHrhuSKa7iWqniA9KSYXOQRX5d8ZVIz
 pHI3MDiAzCsa5n6ZJWg8v8UqOyr0jPKuWldevwVsr8CPuHYJBxJ2C0TgaLJ6GVt9/poYYsCvqOheA
 7kAG4mgBu2e8ebp4=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uM14L-0007vZ-38 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jun 2025 09:03:05 +0000
Received: from mail.maildlp.com (unknown [172.19.162.254])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4b9nnx0hZZzCtYY;
 Mon,  2 Jun 2025 16:59:01 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id 8500D180239;
 Mon,  2 Jun 2025 17:02:48 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 2 Jun
 2025 17:02:47 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 2 Jun 2025 09:02:17 +0000
Message-ID: <20250602090224.485077-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.162]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In this version, we have finished the issues pointed in v3.
 First, I'd like to express my sincere thanks to Jaegeuk and Chao for reviewing
 this patch series and providing corrections. I also appreciat [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.189 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.189 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1uM14L-0007vZ-38
Subject: [f2fs-dev] [PATCH v4 0/7] f2fs: new mount API conversion
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
From: Hongbo Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Hongbo Li <lihongbo22@huawei.com>
Cc: linux-fsdevel@vger.kernel.org, sandeen@redhat.com, lihongbo22@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In this version, we have finished the issues pointed in v3.
First, I'd like to express my sincere thanks to Jaegeuk and Chao
for reviewing this patch series and providing corrections. I also
appreciate Eric for rebasing the patches onto the latest branch to
ensure forward compatibility.

The latest patch series has addressed all the issues mentioned in
the previous set. For modified patches, I've re-added Signed-off-by
tags (SOB) and uniformly removed all Reviewed-by tags.

v4:
  - Change is_remount as bool type in patch 2.
  - Remove the warning reported by Dan for patch 5.
  - Enhance sanity check and fix some coding style suggested by
    Jaegeuk in patch 5.
  - Change the log info when compression option conflicts in patch 5.
  - Fix the issues reported by code-reviewing in patch 5.
  - Context modified in patch 7.

V3: https://lore.kernel.org/all/20250423170926.76007-1-sandeen@redhat.com/
- Rebase onto git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
  dev branch
- Fix up some 0day robot warnings

(Here is the origianl cover letter:)

Since many filesystems have done the new mount API conversion,
we introduce the new mount API conversion in f2fs.

The series can be applied on top of the current mainline tree
and the work is based on the patches from Lukas Czerner (has
done this in ext4[1]). His patch give me a lot of ideas.

Here is a high level description of the patchset:

1. Prepare the f2fs mount parameters required by the new mount
API and use it for parsing, while still using the old API to
get mount options string. Split the parameter parsing and
validation of the parse_options helper into two separate
helpers.

  f2fs: Add fs parameter specifications for mount options
  f2fs: move the option parser into handle_mount_opt

2. Remove the use of sb/sbi structure of f2fs from all the
parsing code, because with the new mount API the parsing is
going to be done before we even get the super block. In this
part, we introduce f2fs_fs_context to hold the temporary
options when parsing. For the simple options check, it has
to be done during parsing by using f2fs_fs_context structure.
For the check which needs sb/sbi, we do this during super
block filling.

  f2fs: Allow sbi to be NULL in f2fs_printk
  f2fs: Add f2fs_fs_context to record the mount options
  f2fs: separate the options parsing and options checking

3. Switch the f2fs to use the new mount API for mount and
remount.

  f2fs: introduce fs_context_operation structure
  f2fs: switch to the new mount api

[1] https://lore.kernel.org/all/20211021114508.21407-1-lczerner@redhat.com/

Hongbo Li (7):
  f2fs: Add fs parameter specifications for mount options
  f2fs: move the option parser into handle_mount_opt
  f2fs: Allow sbi to be NULL in f2fs_printk
  f2fs: Add f2fs_fs_context to record the mount options
  f2fs: separate the options parsing and options checking
  f2fs: introduce fs_context_operation structure
  f2fs: switch to the new mount api

 fs/f2fs/super.c | 2108 +++++++++++++++++++++++++++--------------------
 1 file changed, 1197 insertions(+), 911 deletions(-)

-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
