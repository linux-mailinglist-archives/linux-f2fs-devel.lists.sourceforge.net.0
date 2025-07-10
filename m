Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C7FDB0015E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Jul 2025 14:15:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=v42NBWkb9StRcxNjpCC9jPoi+P9mctlzmvG7Slj3WLs=; b=T/aOKf7dgoxzHQ+erZlRVdrIZf
	HcP5ua3wmnmV4bL5xp4b6bfy8j7LR6p02OGOMgWjYQhnc0YCkgdM8MQacDRMyCHls8nLZ4wFuVfGB
	+2F6FnvhzPeIO1uM/qrlTYpxzGXghigckj0kqmxtVFZGmCQYKPi8b6e264InKPGmCoSQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZqBq-0002rh-Or;
	Thu, 10 Jul 2025 12:15:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1uZqBo-0002rZ-Ms
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 12:15:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K9mqva2bzAIeEhOL0q303ZBittTWFkck414HnoAipeA=; b=F3agOlW+VAT110DEgvoMemRv38
 +tmfKRaBwGvYRrJpt5bd8Wsk8vdoqm4yghSu1sLTeA7SRrSTMPq9u3J1rmiFQtLfybjP8ihQsgiuT
 WBoIrCGTh3bzcZAaASF4aqjTiTpcAqbZ5BlQcKLuqAWd04h3/bIHiNkf6+687CKqbM8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=K9mqva2bzAIeEhOL0q303ZBittTWFkck414HnoAipeA=; b=P
 /glGltgygPSfwzk22x7690saammnqFLwb3KVyOrXRVGSgXg0Ckn3Gztn+UaTH1ecbRLyVorZTErnd
 tFtgsOziMYw9G4fY0c0XF0qBH6qz/XzqV8w4GfHJXp6JrIN5+45IuaedfSsmMU9zW7pehss1Aq+oj
 MOOdhHPS0ugiMxZs=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZqBm-000200-1l for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Jul 2025 12:15:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4bdDG73tTyzXf6s;
 Thu, 10 Jul 2025 20:11:11 +0800 (CST)
Received: from kwepemo500009.china.huawei.com (unknown [7.202.194.199])
 by mail.maildlp.com (Postfix) with ESMTPS id CBC6F180B3F;
 Thu, 10 Jul 2025 20:15:37 +0800 (CST)
Received: from huawei.com (10.67.174.162) by kwepemo500009.china.huawei.com
 (7.202.194.199) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 10 Jul
 2025 20:15:37 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Thu, 10 Jul 2025 12:14:08 +0000
Message-ID: <20250710121415.628398-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Originating-IP: [10.67.174.162]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemo500009.china.huawei.com (7.202.194.199)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In this version, we have finished the issues pointed in v4.
 First, I'd like to express my sincere thanks to Jaegeuk and Chao for reviewing
 this patch series and providing corrections. I also appreciat [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [45.249.212.188 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uZqBm-000200-1l
Subject: [f2fs-dev] [PATCH v5 0/7] f2fs: new mount API conversion
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

In this version, we have finished the issues pointed in v4.
First, I'd like to express my sincere thanks to Jaegeuk and Chao
for reviewing this patch series and providing corrections. I also
appreciate Eric for rebasing the patches onto the latest branch to
ensure forward compatibility.

The latest patch series has addressed all the issues mentioned in
the previous set. For modified patches, I've re-added Signed-off-by
tags (SOB) and uniformly removed all Reviewed-by tags.

v5:
  - Add check for bggc_mode(off) with sb blkzone case.
  - Fix the 0day-ci robot reports.

v4: https://lore.kernel.org/all/20250602090224.485077-1-lihongbo22@huawei.com/
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

 fs/f2fs/super.c | 2101 +++++++++++++++++++++++++++--------------------
 1 file changed, 1190 insertions(+), 911 deletions(-)

-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
