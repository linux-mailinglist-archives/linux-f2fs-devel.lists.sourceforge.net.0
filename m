Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5090A5705D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 19:22:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqcKk-0007AY-Vy;
	Fri, 07 Mar 2025 18:22:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tqcKj-0007AQ-9e
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5IGKT7Tj99B1l/SXMBRRKAeDecLd+n5G67AdXVwCQts=; b=jVLncv+7d4RXV6+TFgQXhXCVFE
 qr/Tb7XMruwDoUXi5tmuTennqiI35Fe50sbrhxT4keJbgd5wRDUZo6vGR2zkph5OV9Ha6DNVFyQ16
 8vHR2ddNeETc4KC720KPWiKZX3CMb3ScMw4NViC7bOzN/NQctps3QMlwjsyAyQfgEtHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=5IGKT7Tj99B1l/SXMBRRKAeDecLd+n5G67AdXVwCQts=; b=P
 CZWovWpXfa6J2tqy2tBxkEcXjFN7Y4r9LdpX3NPOc38ctzt4I9Z6BP7bwZUhxlojYARqIJhO4eA95
 4+Ua7wrc9R5fYtSlidKMajDCIT0z/6eQGbFZPdiUGbiW7mLaKfBjbEZWPrirTuMDelKhgoVR7fpa6
 JiuiVeNAKuIUjPUs=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqcKi-0004XP-DX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 18:22:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=5IGKT7Tj99B1l/SXMBRRKAeDecLd+n5G67AdXVwCQts=; b=Pg65gzzN9aBRmOwclW1AkAgnvU
 BGnIiDdL9KZvFfemV9EPXNq3r45UtEG8w06S+cyNNIjYphNcJYyrvLFdt0BNmxIDnmx27FMgPFVN/
 pJPEEZXdxjXlQvC6mT/EC5NSO69oRGxcpljS5T8p03uhKsHzaqEItvs48Us8l7ucnXUNGcYPLclBD
 jQH9K6x9l/4Ay0xk0zvgPqQS1yip3Z+WICEXHGIdHcCoa7XaBMSKrYRbKAOknaE8IknXR5UKDBkey
 FGjrcgCCd4lJ19X8Ch9igo5xjKnbqaicF9wY3opr+209kgQUcyYNmMx9JuaaMhiX1NQmVVAN2irz0
 8h19xXBQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tqcKX-0000000EFie-03og; Fri, 07 Mar 2025 18:21:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri,  7 Mar 2025 18:21:46 +0000
Message-ID: <20250307182151.3397003-1-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  I was planning on sending this next cycle, but maybe there's
 time to squeeze these patches into the upcoming merge window? f2fs already
 implements writepages and migrate_folio for all three address_space_operations,
 so either ->writepage will never be called (by migration) or it will only
 be harmful (if called from pageou [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tqcKi-0004XP-DX
Subject: [f2fs-dev] [PATCH 0/4] f2fs: Remove uses of writepage
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

I was planning on sending this next cycle, but maybe there's time to
squeeze these patches into the upcoming merge window?

f2fs already implements writepages and migrate_folio for all three
address_space_operations, so either ->writepage will never be called (by
migration) or it will only be harmful (if called from pageout()).

The only remaining filesystem with ->writepage defined in next-20250307
is vboxsf, so the concept of removing ->writepage is well proven.  I
have some follow-up patches which simplify f2fs writeback afterwards,
but I think we can postpone them to next cycle.

See
https://lore.kernel.org/linux-fsdevel/20250307135414.2987755-1-willy@infradead.org/
for where we're going; the first four patches in that series are the
same as the four patches in this series, and I've split them out here
for your convenience.

Matthew Wilcox (Oracle) (4):
  f2fs: Remove check for ->writepage
  f2fs: Remove f2fs_write_data_page()
  f2fs: Remove f2fs_write_meta_page()
  f2fs: Remove f2fs_write_node_page()

 fs/f2fs/checkpoint.c |  7 -------
 fs/f2fs/data.c       | 28 ----------------------------
 fs/f2fs/node.c       |  8 --------
 3 files changed, 43 deletions(-)

-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
