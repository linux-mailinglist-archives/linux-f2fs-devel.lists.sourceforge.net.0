Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5BC662C8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 02:23:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hljLA-0002R9-5j; Fri, 12 Jul 2019 00:23:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <martin.petersen@oracle.com>) id 1hljL8-0002R2-VE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 00:23:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:From:Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HYlQE+c1teU9A33RM7brccxSFdyltTyRTPhHWge3Gdg=; b=k0opqFIe3O/S+8gtZo7Z5aSQTS
 vLA4uO5/ULZFKLdLkt97IkbWOrwPhvBgU8V4GJBY+Ma8gVigRYJj7FJaje2YOw3bSa4zMe1LYetbd
 fpz0ydepMyR+A9ip2l4LzB0Ql07Qyq85fUtTOT/yvLgXD3z+n2F1qAZrRARSWfTlUsMc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HYlQE+c1teU9A33RM7brccxSFdyltTyRTPhHWge3Gdg=; b=WzoHOg/qUu7xxWHMCJ7cMsuZYf
 5I73+eEX5TjDRZCDMq/0g7e4WEzDJ6sSdoadoAG1LW4fzMsXwNkO50UVH3nE+jCBq17u70r3bdqEE
 E9YWsh8ONLUS/HlPPckXfYr7jAyTiURKyRE5z/i8xp4P8apLbgkJI5jQvTTLNE9Utsbc=;
Received: from aserp2120.oracle.com ([141.146.126.78])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hljL6-00FkS2-Ir
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 00:23:06 +0000
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C0JpFh170785;
 Fri, 12 Jul 2019 00:22:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=to : cc : subject :
 from : references : date : in-reply-to : message-id : mime-version :
 content-type; s=corp-2018-07-02;
 bh=HYlQE+c1teU9A33RM7brccxSFdyltTyRTPhHWge3Gdg=;
 b=UFSugVI/MGi4JmHKsvvE0MDnEPlJkyYH4MkkpcMuHDGBi6TX77YMUZOpW3i8AohVFzTC
 Z6+Wa1g6n5Sd8OLAGdEIhHcJXtY/ki91VL7cQFFiui25IbYli3u8i7FWGPVoyeiax3Z5
 PacAejYCiRj1ygTMyRXPVutGmAB9Xtq6ONwr453q+eqkyuGbVq7ZdDMIro/cPZvjQtH0
 9kT6BSrVUoppwmquINavE0kFe4zwa2NYFVdfW1tco0tUiyneddyEyvuapxqY8oSIOLIv
 Fo9J7ZsJkTU8Xrnt4jyqdNWiVKkRflvRr3WZ2kIlEsKhUPulj8JiRBjhkG5FwfaRaxaS lQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by aserp2120.oracle.com with ESMTP id 2tjkkq2twa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 00:22:50 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id x6C0HUOl090850;
 Fri, 12 Jul 2019 00:22:49 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by aserp3030.oracle.com with ESMTP id 2tmwgyf9q4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 12 Jul 2019 00:22:49 +0000
Received: from abhmp0013.oracle.com (abhmp0013.oracle.com [141.146.116.19])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id x6C0MlOl029885;
 Fri, 12 Jul 2019 00:22:47 GMT
Received: from ca-mkp.ca.oracle.com (/10.159.214.123)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Thu, 11 Jul 2019 17:22:46 -0700
To: Damien Le Moal <damien.lemoal@wdc.com>
From: "Martin K. Petersen" <martin.petersen@oracle.com>
Organization: Oracle Corporation
References: <20190701050918.27511-1-damien.lemoal@wdc.com>
 <20190701050918.27511-2-damien.lemoal@wdc.com>
Date: Thu, 11 Jul 2019 20:22:36 -0400
In-Reply-To: <20190701050918.27511-2-damien.lemoal@wdc.com> (Damien Le Moal's
 message of "Mon, 1 Jul 2019 14:09:15 +0900")
Message-ID: <yq15zo89k4z.fsf@oracle.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1.92 (gnu/linux)
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=720
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1810050000 definitions=main-1907120002
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9315
 signatures=668688
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 priorityscore=1501 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=776 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1810050000
 definitions=main-1907120002
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
X-Headers-End: 1hljL6-00FkS2-Ir
Subject: Re: [f2fs-dev] [PATCH V6 1/4] block: Allow mapping of vmalloc-ed
 buffers
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

> To allow the SCSI subsystem scsi_execute_req() function to issue
> requests using large buffers that are better allocated with vmalloc()
> rather than kmalloc(), modify bio_map_kern() to allow passing a buffer
> allocated with vmalloc().

Looks good to me.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen	Oracle Linux Engineering


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
