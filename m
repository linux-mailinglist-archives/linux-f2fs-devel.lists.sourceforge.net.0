Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC60F95126B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Aug 2024 04:32:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1se3oU-0001OA-HD;
	Wed, 14 Aug 2024 02:32:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lihongbo22@huawei.com>) id 1se3oP-0001Ne-IM
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jylNSeKTffmZ0Z3Q4ggoTp3KR9erkkQPLhntXZ1WbrE=; b=GGarB+6UlxvqGFHyR324p2YY2/
 SFnjbA+W/ac9B7jkmB3fo7Kw0dD8rXMAmNqgOlrPoEhT1SZs6Z0N4B3rvewt0zR00A87qAFRZ/ImB
 DVqh30xAAvYruQZm7GvicwPyCD13FJyEbzcHFJ/qbWx+jW5E1slU/tAbXKuYBQRumeaM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jylNSeKTffmZ0Z3Q4ggoTp3KR9erkkQPLhntXZ1WbrE=; b=P
 /8R2dxIFU5aCEd0lmAt7qACbbGYrLmgvKwN8a1EEtI4rzGM7n5jGUqfXhw1zBuQRbAnYjhtG/KGLN
 VIZvZa08VxXVu6H57AN4RJWA6jMNlf+eCFztv4TacGV7gdVAeIJQuX6mjVsxYUD+zB4IRwKjWO5uB
 FzrxC1zZaQUDMk3Y=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1se3oO-0005UU-CU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Aug 2024 02:32:33 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4WkBxM0TdPz20lPw;
 Wed, 14 Aug 2024 10:27:51 +0800 (CST)
Received: from dggpeml500022.china.huawei.com (unknown [7.185.36.66])
 by mail.maildlp.com (Postfix) with ESMTPS id A42FD1A0188;
 Wed, 14 Aug 2024 10:32:24 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpeml500022.china.huawei.com
 (7.185.36.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.2507.39; Wed, 14 Aug
 2024 10:32:24 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 14 Aug 2024 10:39:03 +0800
Message-ID: <20240814023912.3959299-1-lihongbo22@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500022.china.huawei.com (7.185.36.66)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since many filesystems have done the new mount API conversion,
 we introduce the new mount API conversion in f2fs. The series can be applied
 on top of the current mainline tree and the work is based on the patches
 from Lukas Czerner (has done this in ext4[1]). His patch give me a lot of
 ideas. Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [45.249.212.190 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1se3oO-0005UU-CU
Subject: [f2fs-dev] [PATCH 0/9] f2fs: new mount API conversion
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
Cc: linux-fsdevel@vger.kernel.org, lczerner@redhat.com, brauner@kernel.org,
 lihongbo22@huawei.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

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
  f2fs: move option validation into a separate helper

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

4. Cleanup the old unused structures and helpers.

  f2fs: remove unused structure and functions

There is still a potential to do some cleanups and perhaps
refactoring. However that can be done later after the conversion
to the new mount API which is the main purpose of the patchset.

[1] https://lore.kernel.org/all/20211021114508.21407-1-lczerner@redhat.com/

Hongbo Li (9):
  f2fs: Add fs parameter specifications for mount options
  f2fs: move the option parser into handle_mount_opt
  f2fs: move option validation into a separate helper
  f2fs: Allow sbi to be NULL in f2fs_printk
  f2fs: Add f2fs_fs_context to record the mount options
  f2fs: separate the options parsing and options checking
  f2fs: introduce fs_context_operation structure
  f2fs: switch to the new mount api
  f2fs: remove unused structure and functions

 fs/f2fs/super.c | 2211 ++++++++++++++++++++++++++++-------------------
 1 file changed, 1341 insertions(+), 870 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
