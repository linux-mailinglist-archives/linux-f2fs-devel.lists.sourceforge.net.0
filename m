Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 283C2AA9113
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 May 2025 12:26:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EM+hcO1fy7DmXG2uHwg/9fT/udIPPqNNj0LU8vE3bbY=; b=YOv5cOaD5NvHE5qMxbOlYfeq8p
	VlXU/A8YvSsVupcu1Vcaj7m9Ucvi94uD7NVwFEskfmAHjibp/RkJ6iaN2Bk40l381DoMnQzV1RQCc
	45PlxD2qHnvLOPNrDyiIE6KPlzVm1jxKDuqLxiYX7qYLIEj2Y/XOlGaiHMhMrnfny5cU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uBt1f-0004GS-OA;
	Mon, 05 May 2025 10:26:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+9b9d72b124a21f5aaaac+7925+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uBt1d-0004GJ-Ky for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 10:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f1sTMSOBzu0B7rohGVf8pLqnRhw+Xj/rENtZqkY8DwQ=; b=Q+u1F0n/xj1AC48X5V7KlnOWLJ
 kh79bXxjSKa/PCnSNVNUlEjXwrmmGBhpPOJV2wgNFViYFs73OgeNEGQAX7voRFYgoT7Bv7GMd0Ght
 tzXnHVUyLa41NejQ5lT+tVXxHU2+w6A7NpPdR0CksOMXPE0O3u9qsAhVnMNMX6jKDJFQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=f1sTMSOBzu0B7rohGVf8pLqnRhw+Xj/rENtZqkY8DwQ=; b=a
 sSavgCxrMTTqvaYeiSV9vZyTSxWEkK/Yd6j45ZcbulFOGFKt2Q94+C6n/ibrp0OnqvSWj2jjGcs1b
 OVdbf9BU1by7BOYGyW8nS+CGsbgoyOl0E/HFARgimjIaYUjmkojLHXXqUD1XkC10zqoFxG/1OwyTH
 pcjxUskadIXSqyKU=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uBt1N-0002fk-BB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 May 2025 10:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=f1sTMSOBzu0B7rohGVf8pLqnRhw+Xj/rENtZqkY8DwQ=; b=JNHUwpIZHPEPY+YOqZgFuhj1PM
 IulJ4W5KSjTNyTntfJEuKCKrtRsOHzVxPdZaiMhooiE2cE0UF3GuaBanT8a+wHnfxp/ptQlywliZK
 vkHwEvwXKUkqxfWoV/4YT4Qckiap6nFqhzR4x/dFLpX3ZkeuCTRpKMnpBWqN45yCOeKVHCH+A5Hr8
 TQHAl2oRl0Rpqd65APR6z1h6ZBhVw31j6iLESEd2pJ5vYy8OOVVE4HF7K0zN1TrMOwu1P1xa+Xkwg
 IRXbL50M9JCscIQ2YD5Le1imjSIPUylmqQO1hxikkHQ0pYYYRa3PWWs842OilnyPvXVfOvWjyODDm
 EZqvLwLg==;
Received: from
 2a02-8389-2341-5b80-c9f7-77ec-522e-47ca.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:c9f7:77ec:522e:47ca] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1uBs5X-00000006ukh-17FO; Mon, 05 May 2025 09:26:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon,  5 May 2025 11:25:57 +0200
Message-ID: <20250505092613.3451524-1-hch@lst.de>
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
 in f2fs. f2fs_sync_node_pages can still return it in a way that is not handled
 by any caller and eventually is propagated to userspace. This does look like
 a bug and needs attention by someone who actually kno [...] 
 Content analysis details:   (-2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The query to
 Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.137.202.133 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1uBt1N-0002fk-BB
Subject: [f2fs-dev] cleanup AOP_WRITEPAGE_ACTIVATE use in f2fs
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

f2fs_sync_node_pages can still return it in a way that is not handled
by any caller and eventually is propagated to userspace.  This does look
like a bug and needs attention by someone who actually knows the code.

Diffstat:
 checkpoint.c |   22 +++++++++++-----------
 compress.c   |    5 +----
 data.c       |   13 ++++---------
 node.c       |   43 ++++++++++++++++++++-----------------------
 4 files changed, 36 insertions(+), 47 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
