Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B49F124CC9B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Aug 2020 06:23:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k8yaa-00044R-Hr; Fri, 21 Aug 2020 04:23:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <dan@dlrobertson.com>) id 1k8yaY-00044J-N5
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Aug 2020 04:23:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HRkFGsgkQ9FqQvyDIxNzkUcnu+l2LajC/lH21HFOpXA=; b=TooyxiVBv0JhpZ2GLIYjhY3oQS
 XtWD/39yKS8aQnMAxOjCm38fLEP8bW9kfOpWOz0R82Lc4wwW8pzZZI0W5GwHbbcCUOUvr3ZcJwXDB
 dC/so08oDNfdiYlK5vEvv7LniSQIK7ytPVUjXHnPQmA+zxETuN4c4AK3zkHw4tjwhtYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Date:Subject:Message-ID:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HRkFGsgkQ9FqQvyDIxNzkUcnu+l2LajC/lH21HFOpXA=; b=Zrnsqxd5xryvcTLWbtYgJTgtz7
 faOL6e5oGJViL+eljHIMN4NWxWMh35id5BcvRwmjZQRhd40BiRicH7YA+xKOtdtUMEXnNCP3jx96i
 fjqCrjM6MMjT3GagWRWAh/ISVJaboYCZxPVh/5LnUEC48hn4RGUePDPO11TWCk3ELifg=;
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA384:256) (Exim 4.92.2)
 id 1k8yaW-00E7do-N1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Aug 2020 04:23:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1597982876; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=i1CZnU0iqhpzE1jrhl0Xg4oAvLnOl6lx82oSyC/P8BkDsrtJkOOUytSpdyGPsonQipCeFGfFzeiN+tBi0XtAKFZgRbLqp0x0H5fEhxuOyxlpU4Fvp5/nwEZu1/HZmgfhLi3v4013zihEBzJmJgciIsbbaYwyM3ASK71l5Das90o=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1597982876;
 h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To;
 bh=HRkFGsgkQ9FqQvyDIxNzkUcnu+l2LajC/lH21HFOpXA=; 
 b=ZqP+XtgYeNXFSbx0FsQywbyaBAl4Px19I1dzS7HQLteE2CvnrbZNCpf/CObUNkq7eAiwhtpNK6tis9H9JVctH3M01VLtGmsImqV5OCqad2o8oiYiwzHOz4/maKKDh483ryPqXZ9pIHSbo8fbP942Q31NsqsuJNRppUA5T1g6q44=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 spf=pass  smtp.mailfrom=dan@dlrobertson.com;
 dmarc=pass header.from=<dan@dlrobertson.com> header.from=<dan@dlrobertson.com>
Received: from localhost (pool-108-28-30-30.washdc.fios.verizon.net
 [108.28.30.30]) by mx.zohomail.com
 with SMTPS id 1597982872103315.1741309858347;
 Thu, 20 Aug 2020 21:07:52 -0700 (PDT)
From: Dan Robertson <dan@dlrobertson.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Message-ID: <20200821034732.18182-2-dan@dlrobertson.com>
Date: Fri, 21 Aug 2020 03:47:32 +0000
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200821034732.18182-1-dan@dlrobertson.com>
References: <20200821034732.18182-1-dan@dlrobertson.com>
MIME-Version: 1.0
X-ZohoMailClient: External
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [136.143.188.14 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: dlrobertson.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [136.143.188.14 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k8yaW-00E7do-N1
Subject: [f2fs-dev] [PATCH 1/1] f2fs: check output position in move range
 ioctl
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

When the move range ioctl is used, check the output position and ensure
that it is a non-negative value. Without this check f2fs_get_dnode_of_data
may hit a memmory bug.

Signed-off-by: Dan Robertson <dan@dlrobertson.com>
---
 fs/f2fs/file.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8a422400e824..62f9625299ca 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2798,6 +2798,8 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 
 	ret = -EINVAL;
+	if (pos_out < 0)
+		goto out_unlock;
 	if (pos_in + len > src->i_size || pos_in + len < pos_in)
 		goto out_unlock;
 	if (len == 0)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
