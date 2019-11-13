Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 02457FA074
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Nov 2019 02:48:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iUhlq-0005na-Gy; Wed, 13 Nov 2019 01:48:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <martin.petersen@oracle.com>) id 1iUhlp-0005nP-0w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 01:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:From:Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3YrFERbsr0dX0JOQWz/1uKzLQS6DAn/XlnRevr39op0=; b=BCpwripNjJ8UbIqlJpgMehi2NB
 InANEvEgkJHeTSkCQztruDxDRADLNCzNA2wbZwceMCkJkOnGguPiBZ1N0c5tg80cLC7d+Me+vLBSA
 NMWk/ds7hkXG4xU4IPkVOfOJ5rnCYu4UzjDG0sRCfrjsyfruPlOnAIrRCzNVdkxIwamA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3YrFERbsr0dX0JOQWz/1uKzLQS6DAn/XlnRevr39op0=; b=SXjXaLK4g+qcjJQyoIDYaSJ2NI
 dv+cnVIX5fq5NOfm31Qv9WFLwD1aOQtTwTh4j5P2dpFVm7pGdgWtVpR5Qt1Rp3OM62ibN4jXgWEy8
 UuwjnQaBCtygdQrQYovwP6nOBPGq6vFQ9vAhF1sCkkHMl6yiWrhRQfYhTfNMWwyb5klU=;
Received: from userp2120.oracle.com ([156.151.31.85])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iUhlk-00EB1I-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 13 Nov 2019 01:48:32 +0000
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAD1jUxi010736;
 Wed, 13 Nov 2019 01:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2019-08-05;
 bh=3YrFERbsr0dX0JOQWz/1uKzLQS6DAn/XlnRevr39op0=;
 b=ixDJXdjzvKV7mWJdrgXv+tqaBIgjLvGjT2AuuY/uWMeuPyNBYXWZ0NpHLD+7UElXHYE6
 1j38dPKL0ge5dzPCaQHo+wYfjpIqtCy3RqnY1CYMce9Rkq62UVH/bPDxQC8xR+N9AT7K
 sGY9sbV9L51N8+beWW/PhAEVth3hS1hlcsJxHBVZ3eTgNgzY104nFFL1cFBT4A3yaiea
 5rAFN2iwMryr5TPo4cQsf8AKq35A9ACRzGuRrDPsFUiMAi2WxoS1NrQmzykAinymF1TX
 6sYX7BGSezWtnaTArDZOOpAWy39mGlij63npGDjXgxa+GnO4sdC1WlZBJs34Hcf2RYp3 7g== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by userp2120.oracle.com with ESMTP id 2w5p3qrqu5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 01:48:12 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.0.27/8.16.0.27) with SMTP id xAD1cJue070559;
 Wed, 13 Nov 2019 01:46:12 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by aserp3020.oracle.com with ESMTP id 2w7j046fan-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Nov 2019 01:46:12 +0000
Received: from abhmp0018.oracle.com (abhmp0018.oracle.com [141.146.116.24])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id xAD1k9Vu012008;
 Wed, 13 Nov 2019 01:46:09 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 12 Nov 2019 17:46:09 -0800
To: Damien Le Moal <damien.lemoal@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20191111023930.638129-1-damien.lemoal@wdc.com>
 <20191111023930.638129-9-damien.lemoal@wdc.com>
Date: Tue, 12 Nov 2019 20:46:06 -0500
In-Reply-To: <20191111023930.638129-9-damien.lemoal@wdc.com> (Damien Le Moal's
 message of "Mon, 11 Nov 2019 11:39:29 +0900")
Message-ID: <yq1woc4r1k1.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=932
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1910280000 definitions=main-1911130009
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9439
 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=998 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1910280000
 definitions=main-1911130010
X-Spam-Score: -0.7 (/)
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
 -0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iUhlk-00EB1I-Tg
Subject: Re: [f2fs-dev] [PATCH v2 8/9] scsi: sd_zbc: Cleanup
 sd_zbc_alloc_report_buffer()
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
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Damien,

> There is no need to arbitrarily limit the size of a report zone to the
> number of zones defined by SD_ZBC_REPORT_MAX_ZONES. Rather, simply
> calculate the report buffer size needed for the requested number of
> zones without exceeding the device total number of zones. This buffer
> size limitation to the hardware maximum transfer size and page mapping
> capabilities is kept unchanged. Starting with this initial buffer size,
> the allocation is optimized by iterating over decreasing buffer size
> until the allocation succeeds (each iteration is allowed to fail fast
> using the __GFP_NORETRY flag). This ensures forward progress for zone
> reports and avoids failures of zones revalidation under memory pressure.

Acked-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
