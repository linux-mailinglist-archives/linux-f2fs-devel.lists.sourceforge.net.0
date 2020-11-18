Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E402B7EC4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Nov 2020 15:02:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cv0R2fB3zOCkn9dWKicU+6v1v9sZqwTM3x2w8a4nc3g=; b=Gsbf6wKXvz4vPFYh5+UjSj4z/p
	Bit+rnA1P7rUhAK2ObyAqQ//RVl8ZxHd6lQlQAkmgzc/UMJYIihHryK3cVF65SwOxC1JuT2X44QTR
	Ufl72OSYYpMwig3J4zCzHzgvcpu9jgE8QUy4Lk7+wTVUhM2OxseIZTqQUi7ObwYLK/sQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kfO26-0004Rv-LA; Wed, 18 Nov 2020 14:02:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <fishland@aliyun.com>) id 1kfO25-0004RU-75
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 14:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2cK3POkRoMmd9NaytJqQBdbsZEDeXBt2l8OGtTa6OHQ=; b=Ewvey3XaEZECoqwVf3yKnxe2h+
 xaRR/1m1jLAv6RcQoSQETSJulT2Fkro+ZL5Cj2LBVO068PocKAf8Gtda+ffwy52+cYqNOgfZIfZNp
 uLAxgxzJvo8dpjQYMI8ZAkNhbub9uugdNO5+sxTOi1OPFM1mMPWUDEGFr1qqisFWNHeY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2cK3POkRoMmd9NaytJqQBdbsZEDeXBt2l8OGtTa6OHQ=; b=C
 rV657ZT6Ackn87Hu5MNDZRPlgE7MWxu5CdLkuUmLb5qqNdEGLXO58ACuWfSq9qny+0K6LbxdUdpzB
 AunZkmOteLqlsp0xYwFjLVqsp7hnlh2ZurvZvZh8B6Q75idHBgE88SJwy1v9NfsMANmrLlMAXKT5C
 kcf689XAzDsxfau8=;
Received: from out30-15.freemail.mail.aliyun.com ([115.124.30.15])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kfO1v-00Dios-1t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Nov 2020 14:02:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aliyun.com; s=s1024;
 t=1605708073; h=From:To:Subject:Date:Message-Id:MIME-Version;
 bh=2cK3POkRoMmd9NaytJqQBdbsZEDeXBt2l8OGtTa6OHQ=;
 b=VwcGk4ubsUJQS1nBzdZf44hnzdXnb3GT1adR61GPKi0qdRb3xldB3LP75AdXVf1rnDD8ehoDpXUDDpEQe4HyF8NgwCg7kK48nu0iT40ILdcF7WhCIG8YbhJ4Nx0uxpQuopXO8rna7XQIExXYQViVBvmrxIf3ncUg7yMX0pYbniA=
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.3141203|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0229817-0.000331268-0.976687;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01e01424; MF=fishland@aliyun.com; NM=1; PH=DS; RN=5;
 RT=5; SR=0; TI=SMTPD_---0UFocXgQ_1605708067; 
Received: from localhost.localdomain(mailfrom:fishland@aliyun.com
 fp:SMTPD_---0UFocXgQ_1605708067) by smtp.aliyun-inc.com(127.0.0.1);
 Wed, 18 Nov 2020 22:01:12 +0800
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 18 Nov 2020 22:01:04 +0800
Message-Id: <20201118140104.5825-1-fishland@aliyun.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (fishland[at]aliyun.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: zte.com.cn]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [115.124.30.15 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [115.124.30.15 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1kfO1v-00Dios-1t
Subject: [f2fs-dev] [PATCH] f2fs: remove writeback_inodes_sb in f2fs_remount
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
From: Liu Song via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liu Song <fishland@aliyun.com>
Cc: liu.song11@zte.com.cn, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Liu Song <liu.song11@zte.com.cn>

Since sync_inodes_sb has been used, there is no need to
use writeback_inodes_sb, so remove it.

Signed-off-by: Liu Song <liu.song11@zte.com.cn>
---
 fs/f2fs/super.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index be5050292caa..4d8cb17ce48b 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1874,7 +1874,6 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 
 	if (*flags & SB_RDONLY ||
 		F2FS_OPTION(sbi).whint_mode != org_mount_opt.whint_mode) {
-		writeback_inodes_sb(sb, WB_REASON_SYNC);
 		sync_inodes_sb(sb);
 
 		set_sbi_flag(sbi, SBI_IS_DIRTY);
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
