Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF8696F2E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Aug 2019 04:02:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i0Fxd-00027b-1I; Wed, 21 Aug 2019 02:02:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1i0FxZ-00027L-96
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 02:02:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ooa3Gv1NxtQiXLijLxPPXifBNxk+a/KUCMJIMHkfXng=; b=OXx5ONbePRUAgkCYJ1ONObLsCQ
 /XHxpAvurkzhMUYz8263awi8yTofGhcZWWuHX/NCGpAQkG7uzLFxOK1R7n4OlBfR5AOHqQ07+zqap
 URmCvHhMXCjKqtEKloevlYqWaJPHZvWO27quN/4espWyQau48fCQt5N7Lytd1y/dGdFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ooa3Gv1NxtQiXLijLxPPXifBNxk+a/KUCMJIMHkfXng=; b=mwZkURMZyAaQ5hvkUpLaTqlaUy
 53Bt8tz3YW/3h/MWBsDEOvMTWoz75zh6hxr0q831CcdshDRahF+cBmNbHHxD70jXBG+6FKJjstWSF
 UlGjOpcLm8HRToxaR1CIq4aqT3U6e0c2SLyaskkuKPE/1A/3/RnfW9s3hxYXqU34DFQI=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i0FxX-00DxPB-Fj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 21 Aug 2019 02:02:49 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7L229wb121714
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 20 Aug 2019 22:02:39 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugup2ae4e-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 20 Aug 2019 22:02:38 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Wed, 21 Aug 2019 03:02:36 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 21 Aug 2019 03:02:32 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x7L22Vbw44958168
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Aug 2019 02:02:31 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2C13611C052;
 Wed, 21 Aug 2019 02:02:31 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CBC9511C050;
 Wed, 21 Aug 2019 02:02:28 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.102.1.207])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 21 Aug 2019 02:02:28 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Wed, 21 Aug 2019 07:34:10 +0530
Organization: IBM
In-Reply-To: <20190820173116.GA58214@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190816061804.14840-1-chandan@linux.ibm.com>
 <20190820163837.GD10232@mit.edu>
 <20190820173116.GA58214@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19082102-0008-0000-0000-0000030B4377
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082102-0009-0000-0000-00004A296C7E
Message-Id: <2592782.4KYYplS4oi@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-21_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908210018
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1i0FxX-00DxPB-Fj
Subject: Re: [f2fs-dev] [PATCH V4 5/8] f2fs: Use read_callbacks for
 decrypting file data
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
Cc: hch@infradead.org, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fscrypt@vger.kernel.org, adilger.kernel@dilger.ca,
 chandanrmail@gmail.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tuesday, August 20, 2019 11:01 PM Jaegeuk Kim wrote:
> Hi Chandan,
> 
> On 08/20, Theodore Y. Ts'o wrote:
> > On Tue, Aug 20, 2019 at 10:35:29AM +0530, Chandan Rajendra wrote:
> > > Looks like F2FS requires a lot more flexiblity than what can be offered by
> > > read callbacks i.e.
> > > 
> > > 1. F2FS wants to make use of its own workqueue for decryption, verity and
> > >    decompression.
> > > 2. F2FS' decompression code is not an FS independent entity like fscrypt and
> > >    fsverity. Hence they would need Filesystem specific callback functions to
> > >    be invoked from "read callbacks". 
> > > 
> > > Hence I would suggest that we should drop F2FS changes made in this
> > > patchset. Please let me know your thoughts on this.
> > 
> > That's probably the best way to go for now.  My one concern is that it
> > means that only ext4 will be using your framework.  I could imagine
> > that some people might argue that should just move the callback scheme
> > into ext4 code as opposed to leaving it in fscrypt --- at least until
> > we can find other file systems where we can show that it will be
> > useful for those other file systems.
> 
> I also have to raise a flag on this. Doesn't this patch series try to get rid
> of redundant work? What'd be the rationale, if it only supports ext4?

This patchset gets encryption working with subpage blocksize by making
relevant changes in the generic code (i.e. do_mpage_readpage() and
block_read_full_page()) and removing duplicate code from ext4
(i.e. ext4_readpage() and friends). Without these changes the only way to get
subpage blocksize support was to add more duplicate code into Ext4 i.e. import
a copy of block_read_full_page() into Ext4 and make necessary edits to support
encryption.

So this patchset actually does help in removing exiting duplicate code in Ext4
and also prevents addition of more such code.

> 
> How about generalizing the framework to support generic_post_read and per-fs
> post_read for fscrypt/fsverity/... selectively?

Quoting what I had said earlier,
> > > 1. F2FS wants to make use of its own workqueue for decryption, verity and
> > >    decompression.
> > > 2. F2FS' decompression code is not an FS independent entity like fscrypt and
> > >    fsverity. Hence they would need Filesystem specific callback functions to
> > >    be invoked from "read callbacks". 

I am not sure if read callbacks can be made flexible enough to support the
above use cases. fscrypt and fsverity already provide workqueues and any new
post processing code added should follow the same convention. I see
that F2FS use case is special since,
1. It uses its own workqueues.
2. Decompression code inside F2FS isn't written as an FS independent subsystem
   like how fscrypt and fsverity are implemented.

To summarize, I believe the users of read callbacks should follow the
conventions set by fscrypt/fsverity and new post processing code that needs to
be plugged into read callbacks should provide APIs similar to
fscrypt/fsverity. Otherwise the state machine logic implemented by read
callbacks will get complex/convoluted.

> 
> Thanks,
> 
> > 
> > (Perhaps a useful experiment would be to have someone implement patches
> > to support fscrypt and fsverity in ext2 --- the patch might or might
> > not be accepted for upstream inclusion, but it would be useful to
> > demonstrate how easy it is to add fscrypt and fsverity.)
> > 
> > The other thing to consider is that there has been some discussion
> > about adding generalized support for I/O submission to the iomap
> > library.  It might be that if that work is accepted, support for
> > fscrypt and fsverity would be a requirement for ext4 to use that
> > portion of iomap's functionality.  So in that eventuality, it might be
> > that we'll want to move your read callbacks code into iomap, or we'll
> > need to rework the read callbacks code so it can work with iomap.
> > 
> > But this is all work for the future.  I'm a firm believe that the
> > perfect should not be the enemy of the good, and that none of this
> > should be a fundamental obstacle in having your code upstream.
> > 
> > Cheers,
> > 
> > 					- Ted
> > 
> 

-- 
chandan





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
