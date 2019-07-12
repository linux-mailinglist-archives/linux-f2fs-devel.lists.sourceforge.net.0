Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9E2662D2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 02:28:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hljPr-0002cX-2t; Fri, 12 Jul 2019 00:27:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <martin.petersen@oracle.com>) id 1hljPp-0002cQ-Pc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 00:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:From:Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MhocDkjZbIggx8U9U8vvBLlYm4zvgD6O5M+9P0cqzBs=; b=NZAgGBzq33HBneVsObqNfdtdeS
 lW9YS2U6Kb9Cse9wribI6OiQ9BE9xufcYTq0FHeevQgn40HePmwBFw8+S4yhUAoVIaKTEXYMIqNWi
 Xwsr1WRLQ9eqaUxO39cY4qeFHfA0C9aeutBEKJJgcZ6MFg18SgUZF2EnH6d7rO81HBWU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MhocDkjZbIggx8U9U8vvBLlYm4zvgD6O5M+9P0cqzBs=; b=CX8YC4vfh8sZBSSNFPmEfilFxG
 5W3tc5JqzvnpKBubsGIIA3zfVp6EAc72OqHqiWt07rKk27N3Uk5hU1oll1V1wjtLoY5DoVNY482XU
 ZgJ3zI7TDCZ+aUqz0RHKp7xqAK2+kVUZNiNtAreq9OfiyoBEtrh54BhYNjIRhfF3YEck=;
Received: from userp2130.oracle.com ([156.151.31.86])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hljPk-00G8BN-Pr
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 00:27:57 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C0PpU8076404;
 Fri, 12 Jul 2019 00:27:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=MhocDkjZbIggx8U9U8vvBLlYm4zvgD6O5M+9P0cqzBs=;
 b=3NRufK/fF1sOhF7KPVo2t6eOdyLDVH+lIqaC+YhvSqAJfR2hFDctFRalwh0Bm1frkusW
 NrnIPp0q6gKPYATEzzJNPZPuuHIpHYnfnRBLxJCRmNxx8AGGwvipoZUnyKzlDsnlg2PE
 8aw4+rTeY5EdDqGoBGnMC2H8rHklUy9xvQfULZzKAxlu/qsMoC04o1blg0MWh0FJ9xhl
 PIdvLul9JlLLT1sk8NVAYM1CfugxZS/KO7/lYS4R3upy0PNC2dWFXO80JK93jhi9EGep
 SYPuI/px/eG97NoH1D872b8sbnhkN9zeDmGbRkhWlALvJU1iGMQRpfOHqBdZik9G+E60 Fg== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2130.oracle.com with ESMTP id 2tjk2u2wgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 00:27:42 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C0RWMH057569;
 Fri, 12 Jul 2019 00:27:42 GMT
Received: from aserv0122.oracle.com (aserv0122.oracle.com [141.146.126.236])
 by userp3020.oracle.com with ESMTP id 2tnc8tu5x3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 00:27:42 +0000
Received: from abhmp0003.oracle.com (abhmp0003.oracle.com [141.146.116.9])
 by aserv0122.oracle.com (8.14.4/8.14.4) with ESMTP id x6C0Re3P001187;
 Fri, 12 Jul 2019 00:27:41 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 11 Jul 2019 17:27:40 -0700
To: Damien Le Moal <damien.lemoal@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
 <20190701050918.27511-4-damien.lemoal@wdc.com>
Date: Thu, 11 Jul 2019 20:27:37 -0400
In-Reply-To: <20190701050918.27511-4-damien.lemoal@wdc.com> (Damien Le Moal's
 message of "Mon, 1 Jul 2019 14:09:17 +0900")
Message-ID: <yq1wogo85c6.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=793
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120004
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=843 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120003
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hljPk-00G8BN-Pr
Subject: Re: [f2fs-dev] [PATCH V6 3/4] sd_zbc: Fix report zones buffer
 allocation
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Mike Snitzer <snitzer@redhat.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, dm-devel@redhat.com, linux-scsi@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Bart Van Assche <bvanassche@acm.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Damien,

> During disk scan and revalidation done with sd_revalidate(), the zones
> of a zoned disk are checked using the helper function
> blk_revalidate_disk_zones() if a configuration change is detected
> (change in the number of zones or zone size). The function
> blk_revalidate_disk_zones() issues report_zones calls that are very
> large, that is, to obtain zone information for all zones of the disk
> with a single command. The size of the report zones command buffer
> necessary for such large request generally is lower than the disk
> max_hw_sectors and KMALLOC_MAX_SIZE (4MB) and succeeds on boot (no
> memory fragmentation), but often fail at run time (e.g. hot-plug
> event). This causes the disk revalidation to fail and the disk
> capacity to be changed to 0.

Probably easiest to funnel this through block with the rest of the
series.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
