Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 84EF82570D2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Aug 2020 00:06:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kCVSf-000497-US; Sun, 30 Aug 2020 22:06:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan@dlrobertson.com>) id 1kCVSe-00048j-Gg
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 22:06:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xpDw36wm/RX6lDjlQF7146TJygm8dCdK0BYIVTLOuug=; b=YVWGvBuEDqc4MxNkQ+Uz6+u1Us
 dhsb1oDldNb5Z16J+CRX5V5QvHg8quKJKdLgIYPnC7hUXzwW9JDrlkqbDG9XvYUdEu49DD8ARJNXe
 a3Z1e0vhrb372viQ9xtn/L01Gym/5rJCqtPNlAwzxUx7RefDVgtyZ1oj8EN1KCV/tXoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xpDw36wm/RX6lDjlQF7146TJygm8dCdK0BYIVTLOuug=; b=A9dyA+0yYQj6PAQP8yLi4+KIki
 hOnIcyFmt7VKoE2sKNFKxiiEVKR2o+m3/dpTafUd9rkxrYpZtr8xwMEiuy4jMG0qtN7DE6vO1sxSs
 A1MuLfWlUt+d+oLhj+csWMQcMhW5/iro+rx721agbXN6ZLEV81L4hTnEuAlo70lP4hwc=;
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1kCVSd-005qVQ-5T
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 30 Aug 2020 22:06:04 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1598825145; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=cjznEXiUEHG7BQdQCzvlJJ9hbF4OdTRNPrXP1m/ELZq7USbPl6kA6233wB7n3/W235TOoyI+F+AXwd1X/4zk1JhAkhISyPujGw4HeV9yR2rHj0RueWOiawkfqBkxt45L4jcXpEMXI/ptDBSY/OPDH1g0diz8BuxinZE2vWvqsrg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1598825145;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=xpDw36wm/RX6lDjlQF7146TJygm8dCdK0BYIVTLOuug=; 
 b=Xg1Fu26BhRiCqNdz7fwILRIRHb1IdEXa5d7WGpzEGQCusqUNqHsD41VXWnwur8KTaLHrkD4oGYM0bvy8bSmbFlzjTAgVf26XlpaVrHOVwfYdq1lgWgfwWCBVHFG213UpQc+5PQi+J/VfhC6fLnEsIMDeGLVgyepRdQ4KKNcknus=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from nessie.verizon.net (pool-108-28-30-30.washdc.fios.verizon.net
 [108.28.30.30]) by mx.zohomail.com
 with SMTPS id 159882514425772.99770431022637;
 Sun, 30 Aug 2020 15:05:44 -0700 (PDT)
From: Dan Robertson <dan@dlrobertson.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Message-ID: <20200830214523.7417-2-dan@dlrobertson.com>
Date: Sun, 30 Aug 2020 21:45:23 +0000
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200830214523.7417-1-dan@dlrobertson.com>
References: <20200830214523.7417-1-dan@dlrobertson.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [136.143.188.14 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [136.143.188.14 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dlrobertson.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1kCVSd-005qVQ-5T
Subject: [f2fs-dev] [PATCH v3 1/1] f2fs: check position in move range ioctl
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
Cc: Dan Robertson <dan@dlrobertson.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When the move range ioctl is used, check the input and output position and
ensure that it is a non-negative value. Without this check
f2fs_get_dnode_of_data may hit a memmory bug.

Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8a422400e824..f679fb015ee8 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2783,6 +2783,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	if (IS_ENCRYPTED(src) || IS_ENCRYPTED(dst))
 		return -EOPNOTSUPP;
 
+	if (pos_out < 0 || pos_in < 0)
+		return -EINVAL;
+
 	if (src == dst) {
 		if (pos_in == pos_out)
 			return 0;



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
