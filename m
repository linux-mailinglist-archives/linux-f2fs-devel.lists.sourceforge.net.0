Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CABB95AA3B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:29:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgwe8-0004XE-G4;
	Thu, 22 Aug 2024 01:29:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgwe7-0004Wz-Jg
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/E1EdSnEqcUrea/+qRtjS4RUVDtEritYh8SDXfz9bTo=; b=TSUpRIUT+XJHsLiPs+c40NTmXl
 vPGlT3kw5GM+4Fp7/eL6gS6jPEjnDdo3+bkCI1OzpBH4Q96yN+C0eW9+JVw/J8T8dQw9BZj3XVVg/
 TKh5tt1urDJGeuuX5GoNZMNjl9TCKTOMV4Zg7wlvjLlwReq5fHpBNfW8Ec+345kqonqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/E1EdSnEqcUrea/+qRtjS4RUVDtEritYh8SDXfz9bTo=; b=W
 dsv+mJEVD6K0DDV1NT86/wffyQDcmhLJYphCW1Rnt6fTkfhzEvsY+o1xghY0BbcbjH81Y6zlhogwr
 wHrTrzSsq/dBiEpfSY/+zc3cSRox5btT8syGHYbknKM+AR5UI445+mjcgY9OLB7Nk1V1f2iJwQCJH
 GdwFg9ffN33jQitE=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgwe7-0006bw-AN for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:52 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Wq59410qJz69LQ;
 Thu, 22 Aug 2024 09:24:56 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id DEB5A14037B;
 Thu, 22 Aug 2024 09:29:38 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:38 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:00 +0800
Message-ID: <20240822013714.3278193-1-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, In btrfs, because there are some interfaces that do
 not use folio, there is page-folio-page mutual conversion. This patch set
 should clean up folio-page conversion as much as possible and use folio di
 [...] Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [45.249.212.189 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.189 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.189 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.189 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sgwe7-0006bw-AN
Subject: [f2fs-dev] [PATCH -next 00/14] btrfs: Cleaned up folio->page
 conversion
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: linux-btrfs@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

In btrfs, because there are some interfaces that do not use folio,
there is page-folio-page mutual conversion. This patch set should
clean up folio-page conversion as much as possible and use folio
directly to reduce invalid conversions.

This patch set starts with the rectification of function parameters,
using folio as parameters directly. And some of those functions have
already been converted to folio internally, so this part has little
impact. 

I have tested with fsstress more than 10 hours, and no problems were
found. For the convenience of reviewing, I try my best to only modify
a single interface in each patch.

Josef also worked on converting pages to folios, and this patch set was
inspired by him:
https://lore.kernel.org/all/cover.1722022376.git.josef@toxicpanda.com/

Thanks,
Li Zetao

Li Zetao (14):
  btrfs: convert clear_page_extent_mapped() to take a folio
  btrfs: convert get_next_extent_buffer() to take a folio
  btrfs: convert try_release_subpage_extent_buffer() to take a folio
  btrfs: convert try_release_extent_buffer() to take a folio
  btrfs: convert read_key_bytes() to take a folio
  btrfs: convert submit_eb_subpage() to take a folio
  btrfs: convert submit_eb_page() to take a folio
  btrfs: convert try_release_extent_state() to take a folio
  btrfs: convert try_release_extent_mapping() to take a folio
  btrfs: convert zlib_decompress() to take a folio
  btrfs: convert lzo_decompress() to take a folio
  btrfs: convert zstd_decompress() to take a folio
  btrfs: convert btrfs_decompress() to take a folio
  btrfs: convert copy_inline_to_page() to use folio

 fs/btrfs/compression.c | 14 +++----
 fs/btrfs/compression.h |  8 ++--
 fs/btrfs/disk-io.c     |  2 +-
 fs/btrfs/extent_io.c   | 92 ++++++++++++++++++++----------------------
 fs/btrfs/extent_io.h   |  6 +--
 fs/btrfs/inode.c       |  8 ++--
 fs/btrfs/lzo.c         | 12 +++---
 fs/btrfs/reflink.c     | 35 ++++++++--------
 fs/btrfs/verity.c      | 14 +++----
 fs/btrfs/zlib.c        | 14 +++----
 fs/btrfs/zstd.c        | 16 ++++----
 11 files changed, 109 insertions(+), 112 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
