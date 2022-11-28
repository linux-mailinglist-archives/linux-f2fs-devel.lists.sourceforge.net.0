Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CAA0663A489
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 10:16:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozaFE-00081c-Jm;
	Mon, 28 Nov 2022 09:16:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7f5f7765a4bd65a1d96c+7036+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1ozaEs-00080t-3o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9fsGliWg+Ks+MGBxAc2rfzVOJ5aTOFT80YBbjcS3kSw=; b=Q6J6aIZ2Dqj6wTZlE1bEPUwQE5
 CBhIa+d27uLAemvxUTx0h/owh1JMQnQxmbcmhkmSIy7k51lvAsg+rwxvfDO8QylF+yB3QUh27ay6S
 95uMBdedjolbTkGEslZYl+ngBY4BiLZ9uA7SLc1/Y3kfmd3u6jRnOPZ7z1qEikUwxtYI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9fsGliWg+Ks+MGBxAc2rfzVOJ5aTOFT80YBbjcS3kSw=; b=d
 llxSXhmNTionH2JywXNS/8cJGAjHTdFPLMEPWfs21TyDaWSDxN6jogkmInURqAFR1YPjyfBUDjNVk
 14fo4s42myMR06ohcBPT9MZFuN8vGET+UzIMltvA5TfV7P19T3Egp9joY9viEHCvUC22sX4e3M8yJ
 dBXIAPiofujw7+TA=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozaEn-00055y-Es for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 09:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=9fsGliWg+Ks+MGBxAc2rfzVOJ5aTOFT80YBbjcS3kSw=; b=PJMAnejt9vy8oCL/FMWt0AwItW
 cmejdvos+IXFMB5Zg/CRf6YgVqNVl/bsc8UK3v2hm3IwyQTyAFvKcpfmLTmYpslOviuHLxla+nB2r
 lWddXaChuNh2KsRbUrSbay4csSEi4859kSIkHlkuf0f5n76ZN0CXRWInA8iXJyspUCwMnuJBSxLeH
 R3FsBHm7xQy1O5azBdP1zLmUK9GO003RF+PqtFcRagtX+WH7xvEFjVvNnShPEzo5yKJX+Ydq6lhrf
 WM7Gw1XZyTx410YimGOcABT/atn7NmS7c0V+7uMR/sVQB8cV+zL5ogYvg9J65RU9gMRLxzJHWh2bu
 zc+8Ux9A==;
Received: from [2001:4bb8:192:26e7:4739:fc09:43a5:2665] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ozaEZ-000YgU-7N; Mon, 28 Nov 2022 09:15:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 28 Nov 2022 10:15:08 +0100
Message-Id: <20221128091523.1242584-1-hch@lst.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -2.1 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Jaegeuk and Chao, the first patch in this series fixes
 a warning and subsequent hang when testing zoned f2fs. The other patches are
 misc cleanups for the I/O path. Diffstat fs/f2fs/compress.c | 2 fs/f2fs/data.c
 | 544 ++++++++++++++++++++++ fs/f2fs/extent_cache.c | 19 - fs/f2fs/f2fs.h
 | 24 - fs/f2fs/file.c | 16 - fs/f2fs/gc.c | 4 include/tra [...] 
 Content analysis details:   (-2.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozaEn-00055y-Es
Subject: [f2fs-dev] a fix and a bunch of cleanups
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk and Chao,

the first patch in this series fixes a warning and subsequent hang when
testing zoned f2fs.  The other patches are misc cleanups for the I/O path.

Diffstat
 fs/f2fs/compress.c          |    2 
 fs/f2fs/data.c              |  544 ++++++++++++++++++++++----------------------
 fs/f2fs/extent_cache.c      |   19 -
 fs/f2fs/f2fs.h              |   24 -
 fs/f2fs/file.c              |   16 -
 fs/f2fs/gc.c                |    4 
 include/trace/events/f2fs.h |   11 
 7 files changed, 309 insertions(+), 311 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
