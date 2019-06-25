Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF1D5237D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 08:23:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hfere-0008Qj-81; Tue, 25 Jun 2019 06:23:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hferQ-0008QA-Nd
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QcxVoFkGMAwLTFdxgj5z/CExq0NE6OPHxUy8bUSVLTM=; b=BmUZGArIR5TaPy6HjxgECZsjkH
 gheQMyJTFNQOAynzishhApTxZR8IBTur4FQBk3mgLxFpXFBYtqXjW05DbCLOTi5Iadf+SZe0kvxN7
 n+jBFABXxM2I8U6A3TCW7dF0aLiUtRINkh7l1WmnFTkWYIj/a33sE0fa4e8iC+77TJ3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QcxVoFkGMAwLTFdxgj5z/CExq0NE6OPHxUy8bUSVLTM=; b=AVqwYC6Twt+mFGY0dIj2NjiZ61
 esYf7Qlift1L+d5TsQo+HuK8O+lonLL5DZo5BvQOhGfDk8bYQgwb1PTv0E/6kASG0rdMOyryvORk3
 vOPTu+1VtDYPw7EpI1SAfBP9Zdb3O47/etl9z2sMHUyw0+iL5BsBW0+TDGH5+cOVGpso=;
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hferV-00CiMb-TR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:27 +0000
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P6I39E040675
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:20 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbagtqj76-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:20 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Tue, 25 Jun 2019 07:23:17 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 07:23:14 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5P6NDtI51708146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 06:23:13 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AAD5AE045;
 Tue, 25 Jun 2019 06:23:13 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83F5CAE057;
 Tue, 25 Jun 2019 06:23:11 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.58])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 06:23:11 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 25 Jun 2019 11:52:43 +0530
Organization: IBM
In-Reply-To: <20190621212916.GD167064@gmail.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
 <20190616160813.24464-7-chandan@linux.ibm.com>
 <20190621212916.GD167064@gmail.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062506-0008-0000-0000-000002F6BFB8
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062506-0009-0000-0000-00002263EE89
Message-Id: <3201150.UV5xBNPoiD@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250050
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hferV-00CiMb-TR
Subject: Re: [f2fs-dev] [PATCH V3 6/7] Add decryption support for
 sub-pagesized blocks
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

On Saturday, June 22, 2019 2:59:17 AM IST Eric Biggers wrote:
> On Sun, Jun 16, 2019 at 09:38:12PM +0530, Chandan Rajendra wrote:
> > To support decryption of sub-pagesized blocks this commit adds code to,
> > 1. Track buffer head in "struct read_callbacks_ctx".
> > 2. Pass buffer head argument to all read callbacks.
> > 3. Add new fscrypt helper to decrypt the file data referred to by a
> >    buffer head.
> > 
> > Signed-off-by: Chandan Rajendra <chandan@linux.ibm.com>
> > ---
> >  fs/buffer.c                    |  55 +++++++++------
> >  fs/crypto/bio.c                |  21 +++++-
> >  fs/f2fs/data.c                 |   2 +-
> >  fs/mpage.c                     |   2 +-
> >  fs/read_callbacks.c            | 118 +++++++++++++++++++++++++--------
> >  include/linux/buffer_head.h    |   1 +
> >  include/linux/read_callbacks.h |  13 +++-
> >  7 files changed, 158 insertions(+), 54 deletions(-)
> > 
> 
> This is another patch that unnecessarily changes way too many components at
> once.  My suggestions elsewhere would resolve this, though:
> 
> - This patch changes fs/f2fs/data.c and fs/mpage.c only to pass a NULL
>   buffer_head to read_callbacks_setup().  But as per my comments on patch 1,
>   read_callbacks_setup() should be split into read_callbacks_setup_bio() and
>   read_callbacks_end_bh().
> 
> - This patch changes fs/crypto/ only to add support for the buffer_head
>   decryption work.  But as per my comments on patch 1, that should be in
>   read_callbacks.c instead.
> 
> And adding buffer_head support to fs/read_callbacks.c should be its own patch,
> *or* should simply be folded into the patch that adds fs/read_callbacks.c.
> 
> Then the only thing remaining in this patch would be updating fs/buffer.c to
> make it use the read_callbacks, which should be retitled to something like
> "fs/buffer.c: add decryption support via read_callbacks".
> 

I agree.

-- 
chandan





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
