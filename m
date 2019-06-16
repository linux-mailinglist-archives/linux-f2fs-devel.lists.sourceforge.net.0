Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FCC475ED
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 16 Jun 2019 18:29:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hcY1o-00055i-3O; Sun, 16 Jun 2019 16:29:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hcY1n-00055c-2I
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 16:29:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zRGe0l5xEkEfOzhMkFWBQYRH5+d3rG0+EeNlKh77E8s=; b=BKgddRjBxM2YoNtppr1jmB8lv/
 ugctZoQ0p5ZeAl0Dj5m3jLm0KMlhxV9qAUu3eRqiRYJyL+bTEic2Cd/GVwacmemQGkGe8d2RArB8O
 L8QyAr+NpkwIi0L7//VdinP2lbSB3/xodIewwPVRwMlGFHjU5nKW3h9hXH2blieSRjgo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zRGe0l5xEkEfOzhMkFWBQYRH5+d3rG0+EeNlKh77E8s=; b=QQzvfns5ooe1Kwoeaqy4mKEyEP
 S2dnUlZ16e9l1cd1hPSzZE2CQ6ZH+GQev6hgfZPPt4LfylKUbpnbLxuH7szuoDZkw1O6awKhlg4vV
 NzY42yu+4MQhtKTsuN7B8aw/ikadMElwpIYj3vNQLlktnALUhZ5wXRSzJc1QDKB3X0ss=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hcY1i-00BEuF-UA
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 16 Jun 2019 16:29:08 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5GG6TZJ091581
 for <linux-f2fs-devel@lists.sourceforge.net>; Sun, 16 Jun 2019 12:08:18 -0400
Received: from e33.co.us.ibm.com (e33.co.us.ibm.com [32.97.110.151])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t5e1qent0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Sun, 16 Jun 2019 12:08:18 -0400
Received: from localhost
 by e33.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Sun, 16 Jun 2019 17:08:17 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e33.co.us.ibm.com (192.168.1.133) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sun, 16 Jun 2019 17:08:12 +0100
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5GG8BHB33292682
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 16 Jun 2019 16:08:12 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3F526E04C;
 Sun, 16 Jun 2019 16:08:11 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5E256E04E;
 Sun, 16 Jun 2019 16:08:07 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.102.1.181])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sun, 16 Jun 2019 16:08:07 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org
Date: Sun, 16 Jun 2019 21:38:10 +0530
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190616160813.24464-1-chandan@linux.ibm.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19061616-0036-0000-0000-00000ACC2B88
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011273; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01218855; UDB=6.00641061; IPR=6.00999987; 
 MB=3.00027334; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-16 16:08:16
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061616-0037-0000-0000-00004C3ED7B1
Message-Id: <20190616160813.24464-5-chandan@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-16_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=921 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906160155
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hcY1i-00BEuF-UA
Subject: [f2fs-dev] [PATCH V3 4/7] fs/mpage.c: Integrate read callbacks
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
Cc: hch@infradead.org, tytso@mit.edu, ebiggers@kernel.org,
 Chandan Rajendra <chandan@linux.ibm.com>, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This commit adds code to make do_mpage_readpage() to be "read callbacks"
aware i.e. for files requiring decryption, do_mpage_readpage() now
sets up the read callbacks state machine when allocating a bio and later
starts execution of the state machine after file data is read from the
underlying disk.

Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
---
 fs/mpage.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/mpage.c b/fs/mpage.c
index 436a85260394..611ad122fc92 100644
--- a/fs/mpage.c
+++ b/fs/mpage.c
@@ -30,6 +30,7 @@
 #include <linux/backing-dev.h>
 #include <linux/pagevec.h>
 #include <linux/cleancache.h>
+#include <linux/read_callbacks.h>
 #include "internal.h"
 
 /*
@@ -49,6 +50,8 @@ static void mpage_end_io(struct bio *bio)
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
 
+	if (read_callbacks_end_bio(bio))
+		return;
 	bio_for_each_segment_all(bv, bio, iter_all) {
 		struct page *page = bv->bv_page;
 		page_endio(page, bio_op(bio),
@@ -309,6 +312,12 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
 					gfp);
 		if (args->bio == NULL)
 			goto confused;
+
+		if (read_callbacks_setup(inode, args->bio, NULL)) {
+			bio_put(args->bio);
+			args->bio = NULL;
+			goto confused;
+		}
 	}
 
 	length = first_hole << blkbits;
@@ -330,7 +339,7 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
 confused:
 	if (args->bio)
 		args->bio = mpage_bio_submit(REQ_OP_READ, op_flags, args->bio);
-	if (!PageUptodate(page))
+	if (!PageUptodate(page) && !PageError(page))
 		block_read_full_page(page, args->get_block);
 	else
 		unlock_page(page);
-- 
2.19.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
