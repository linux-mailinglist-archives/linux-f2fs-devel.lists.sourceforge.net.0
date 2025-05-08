Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F02FAAF2B3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 May 2025 07:15:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xPr4K0sO1vRxmfEqCai8+4YYwimjsdaU9fQkMSJBN6U=; b=YwtejT8Q6y5ouoVnuDYQIPrw3B
	D7oCpKl/FLAyjWz7c/cpeebqpdWoOAbbvz4HfoovDDPQREq9fWSx8Nd3Bn8BUr9q/TpimvJ6FdF9F
	tM5jfLFPBYeckNSB6VcKQV5nJZO+PALluv9RpA3wJU0zXkNfmXBIYXTcejge5bE/ch3E=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uCtbj-0003Fz-Hm;
	Thu, 08 May 2025 05:15:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+b29930b5fa9b2b8daadf+7928+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uCtbi-0003Fj-2e for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pjw6YWsk0efYji0LlHk8VhgxhNm4WKtk4AAmmmvIayA=; b=IBPJfc8i7yalI5ENevOVLXH4+y
 XzDMrkAs7vEPKeSsVQhd8GIUh8dcimqhAuo4E4pNnIHMv2UccM+X9whlE97OLEBw2q7CCFtyJOuxc
 vW3Ridp6jSDM8ps+nG4CQrzZ7tmCrglkg1ShM0uEoKPj2q9HTy2/cQugO7U3vpqwU4gw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Pjw6YWsk0efYji0LlHk8VhgxhNm4WKtk4AAmmmvIayA=; b=U
 JOHRLQmACwnhQ6dErsZvWFB7oWjbLxU6F3B8ozu9agyEI8+UD2gRASwanIzbJpjDCZoceCKqmD9NO
 toPOyfxM1NfFvIJp36IMr1t1lNQXgFecvKk/pFgUtbdTjtvv7DcX9a2gLIV9iElI+fCaU16R1wGaO
 yd+8qIGyQMCxBArs=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uCtbe-0003cS-7p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 May 2025 05:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Pjw6YWsk0efYji0LlHk8VhgxhNm4WKtk4AAmmmvIayA=; b=wOfMyt0MehTzL2oR5WGNyFQaXJ
 Uh3Z5lVUqcBvEbz8e3KC/jZ5oWQjDcmeLtG6VVDcsXLqzKG9gZeEZ4w0LFvWNZMyHjhJpZgzNBUQp
 +ZnnhAuZOTJLYh7UOFduq1JQ3hQnKfA8cqF/oIGyZDKqWqpiugzRXEr4NY6LtjGH0kUBd2CkqCimN
 zUFRhXVQkoC5Xq8iKjZxMCIru3mLDf8p9pJkxzLZq5LEGNG9F3bQ/yWh37ASEgSQqtXgUGs6DFhRp
 PiH3JmRX2kZF1IETFdLBLAigi0HRsJrk/Plr4EDodv8i18AtON4dnsEYpVP3sUzSDuVhu5fTCqpOc
 AOAdh2Mg==;
Received: from
 2a02-8389-2341-5b80-2368-be33-a304-131f.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:2368:be33:a304:131f] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uCtbR-0000000HLfg-1zgp; Thu, 08 May 2025 05:15:26 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu,  8 May 2025 07:14:26 +0200
Message-ID: <20250508051520.4169795-1-hch@lst.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software, running on the system "6901ab67b84d", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all,
 this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE
 in f2fs. Changes since v1: - pick up the bug fix from Chao as patch 1 -
 release
 the folio batch on early exit - remove the dead for_reclaim handling - keep
 the ability of the caller to exit early for the redit [...] 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uCtbe-0003cS-7p
Subject: [f2fs-dev] cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs v2
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi all,

this almost entirely cleans up usage of AOP_WRITEPAGE_ACTIVATE in f2fs.

Changes since v1:
 - pick up the bug fix from Chao as patch 1
 - release the folio batch on early exit
 - remove the dead for_reclaim handling
 - keep the ability of the caller to exit early for the redity case

Diffstat:
 fs/f2fs/checkpoint.c        |   36 ++++++++----------------
 fs/f2fs/compress.c          |    3 --
 fs/f2fs/data.c              |   23 ++-------------
 fs/f2fs/file.c              |    1 
 fs/f2fs/node.c              |   65 ++++++++++++++++++--------------------------
 include/trace/events/f2fs.h |    5 ---
 6 files changed, 46 insertions(+), 87 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
