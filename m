Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6162252383
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 08:23:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfers-0001FG-0M; Tue, 25 Jun 2019 06:23:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hferq-0001F5-RT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/V+ifMcWxEpYSQ0UTgWm8ZC5H0K+rgdh5XDKn7lep5o=; b=HrTbz06QF2B68at7DXA5ip0s+Z
 xRj375MLuwYRdZdaX6/iLZLF6rB0XecvhAo9EOuFQYOFmuaa50IIao/2dLy58BXqUiaHSrHFi+3/J
 V+WQS8ySJqIAeMBVSXh9Qp6jg24fgUcZl7uh+bMB1EsgN2+CIi5Cy42JaVYyTrckruEY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/V+ifMcWxEpYSQ0UTgWm8ZC5H0K+rgdh5XDKn7lep5o=; b=E1yUp0rt42bqj8IIdysxLeoniz
 lOttkJYYvQtkgcCFLJd+R38ncpYUDqteImgR5N1QFjSfyUs8bYFjebX6ucjZNk5kHZfTObmZBMcgj
 W7knDS55/CrXcXPtF4sqMj6OZEeIACwQPkVjx/fz2h4N8XzLAZHwdRPt1IADhf38Ibls=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hferq-00D5t4-WF
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:50 +0000
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P6HZfR056053
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:39 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tbdd59txn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:39 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Tue, 25 Jun 2019 07:23:37 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 07:23:34 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5P6NNGB39322076
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 06:23:23 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 330E1AE045;
 Tue, 25 Jun 2019 06:23:33 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8EC1FAE055;
 Tue, 25 Jun 2019 06:23:31 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.58])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 06:23:31 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 25 Jun 2019 11:51:14 +0530
Organization: IBM
In-Reply-To: <20190621211454.GC167064@gmail.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
 <20190616160813.24464-5-chandan@linux.ibm.com>
 <20190621211454.GC167064@gmail.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062506-0016-0000-0000-0000028C17A4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062506-0017-0000-0000-000032E987C1
Message-Id: <1847149.B8S3WBCFIi@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=924 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250050
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hferq-00D5t4-WF
Subject: Re: [f2fs-dev] [PATCH V3 4/7] fs/mpage.c: Integrate read callbacks
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Saturday, June 22, 2019 2:44:55 AM IST Eric Biggers wrote:
> On Sun, Jun 16, 2019 at 09:38:10PM +0530, Chandan Rajendra wrote:
> > This commit adds code to make do_mpage_readpage() to be "read callbacks"
> > aware i.e. for files requiring decryption, do_mpage_readpage() now
> > sets up the read callbacks state machine when allocating a bio and later
> > starts execution of the state machine after file data is read from the
> > underlying disk.
> > 
> > Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
> > ---
> >  fs/mpage.c | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/mpage.c b/fs/mpage.c
> > index 436a85260394..611ad122fc92 100644
> > --- a/fs/mpage.c
> > +++ b/fs/mpage.c
> > @@ -30,6 +30,7 @@
> >  #include <linux/backing-dev.h>
> >  #include <linux/pagevec.h>
> >  #include <linux/cleancache.h>
> > +#include <linux/read_callbacks.h>
> >  #include "internal.h"
> >  
> >  /*
> > @@ -49,6 +50,8 @@ static void mpage_end_io(struct bio *bio)
> >  	struct bio_vec *bv;
> >  	struct bvec_iter_all iter_all;
> >  
> > +	if (read_callbacks_end_bio(bio))
> > +		return;
> >  	bio_for_each_segment_all(bv, bio, iter_all) {
> >  		struct page *page = bv->bv_page;
> >  		page_endio(page, bio_op(bio),
> > @@ -309,6 +312,12 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
> >  					gfp);
> >  		if (args->bio == NULL)
> >  			goto confused;
> > +
> > +		if (read_callbacks_setup(inode, args->bio, NULL)) {
> > +			bio_put(args->bio);
> > +			args->bio = NULL;
> > +			goto confused;
> > +		}
> >  	}
> >  
> >  	length = first_hole << blkbits;
> > @@ -330,7 +339,7 @@ static struct bio *do_mpage_readpage(struct mpage_readpage_args *args)
> >  confused:
> >  	if (args->bio)
> >  		args->bio = mpage_bio_submit(REQ_OP_READ, op_flags, args->bio);
> > -	if (!PageUptodate(page))
> > +	if (!PageUptodate(page) && !PageError(page))
> >  		block_read_full_page(page, args->get_block);
> >  	else
> >  		unlock_page(page);
> 
> Why is the !PageError() check needed here?
> 

Sorry, Its a remnant from when I was debugging the patchset. I will remove
this.

-- 
chandan





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
