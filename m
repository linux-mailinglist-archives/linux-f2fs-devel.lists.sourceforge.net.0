Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B2552380
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2019 08:23:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hferh-0008RK-AE; Tue, 25 Jun 2019 06:23:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chandan@linux.ibm.com>) id 1hferf-0008R3-9s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J+kkW8Z4Lh4Jwaj5l9P4DhCem1UBtcWVZqxl9/KsKy8=; b=HAHx5aJI4dwUuPGRXRfrGZrJTC
 CTH96ZqJPSNy1R/t5VKkGvai3x3dHt7l6sImU81xq//c+/5dU26b8Aq3D6717bR480BPdi/T6ruqy
 SFQgJIP3KrQv/h/9nV9df1Yd3nC8Wij3xmGtJf2O/FwZIFWl280RqkTqmmS4hhjItrqI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:References
 :In-Reply-To:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=J+kkW8Z4Lh4Jwaj5l9P4DhCem1UBtcWVZqxl9/KsKy8=; b=GEpxnogwRddBmpGyVL6sVCUmVc
 qpRQrHJ13J0zh57htupp3avOWH4U3okipKGT53VHYJxJILZzU0g0Lx+TIBZ4HoMIhWX2pTFhUs3Dn
 NtNn15tDTmAfJDy6IXh5A0Bo1QW+jVTimzagHe3uwlwr4E0TG3/o622H7BJfncdj2Pvk=;
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hferk-008zaG-5A
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 Jun 2019 06:23:42 +0000
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5P6HJT7172418
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tbdm1satg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linux-f2fs-devel@lists.sourceforge.net>; Tue, 25 Jun 2019 02:23:33 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linux-f2fs-devel@lists.sourceforge.net> from <chandan@linux.ibm.com>;
 Tue, 25 Jun 2019 07:23:31 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 07:23:27 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5P6NHCq39584030
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 06:23:17 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DF179AE056;
 Tue, 25 Jun 2019 06:23:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 39BFAAE055;
 Tue, 25 Jun 2019 06:23:25 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.58])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 06:23:25 +0000 (GMT)
From: Chandan Rajendra <chandan@linux.ibm.com>
To: Eric Biggers <ebiggers@kernel.org>
Date: Tue, 25 Jun 2019 11:35:06 +0530
Organization: IBM
In-Reply-To: <20190621210800.GB167064@gmail.com>
References: <20190616160813.24464-1-chandan@linux.ibm.com>
 <20190616160813.24464-3-chandan@linux.ibm.com>
 <20190621210800.GB167064@gmail.com>
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19062506-0008-0000-0000-000002F6BFC0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062506-0009-0000-0000-00002263EE8F
Message-Id: <4046659.6pHPRur4YB@localhost.localdomain>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=5 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250050
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1hferk-008zaG-5A
Subject: Re: [f2fs-dev] [PATCH V3 2/7] Integrate read callbacks into Ext4
 and F2FS
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

On Saturday, June 22, 2019 2:38:01 AM IST Eric Biggers wrote:
> Hi Chandan,
> 
> On Sun, Jun 16, 2019 at 09:38:08PM +0530, Chandan Rajendra wrote:
> > This commit gets Ext4 and F2FS to make use of read callbacks API to
> > perform decryption of file data read from the disk.
> > ---
> >  fs/crypto/bio.c             |  30 +--------
> >  fs/crypto/crypto.c          |   1 +
> >  fs/crypto/fscrypt_private.h |   3 +
> >  fs/ext4/readpage.c          |  29 +++------
> >  fs/f2fs/data.c              | 124 +++++++-----------------------------
> >  fs/f2fs/super.c             |   9 +--
> >  fs/read_callbacks.c         |   1 -
> >  include/linux/fscrypt.h     |  18 ------
> >  8 files changed, 40 insertions(+), 175 deletions(-)
> > 
> 
> This patch changes many different components.  It would be much easier to
> review, and might get more attention from the other ext4 and f2fs developers, if
> it were split into 3 patches:
> 
> a. Convert ext4 to use read_callbacks.
> b. Convert f2fs to use read_callbacks.
> c. Remove the functions from fs/crypto/ that became unused as a result of
>    patches (a) and (b).  (Actually, this part probably should be merged with the
>    patch that removes the fscrypt_ctx, and the patch renamed to something like
>    "fscrypt: remove decryption I/O path helpers")
> 
> Any reason why this wouldn't work?  AFAICS, you couldn't do it only because you
> made this patch change fscrypt_enqueue_decrypt_work() to be responsible for
> initializing the work function.  But as per my comments on patch 1, I don't
> think we should do that, since it would make much more sense to put the work
> function in read_callbacks.c.

Yes, you are right about that. I will make the changes suggested by you.

> 
> However, since you're converting ext4 to use mpage_readpages() anyway, I don't
> think we should bother with the intermediate change to ext4_mpage_readpages().
> It's useless, and that intermediate state of the ext4 code inevitably won't get
> tested very well.  So perhaps order the whole series as:
> 
> - fs: introduce read_callbacks
> - fs/mpage.c: add decryption support via read_callbacks
> - fs/buffer.c: add decryption support via read_callbacks
> - f2fs: convert to use read_callbacks
> - ext4: convert to use mpage_readpages[s]
> - ext4: support encryption with subpage-sized blocks
> - fscrypt: remove decryption I/O path helpers
> 
> That order would also give the flexibility to possibly apply the fs/ changes
> first, without having to update both ext4 and f2fs simultaneously with them.
> 
> > @@ -557,8 +511,7 @@ static struct bio *f2fs_grab_read_bio(struct inode *inode, block_t blkaddr,
> >  {
> >  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >  	struct bio *bio;
> > -	struct bio_post_read_ctx *ctx;
> > -	unsigned int post_read_steps = 0;
> > +	int ret;
> 
> Nit: 'err' rather than 'ret', since this is 0 or a -errno value.
> 
> > -int __init f2fs_init_post_read_processing(void)
> > -{
> > -	bio_post_read_ctx_cache = KMEM_CACHE(bio_post_read_ctx, 0);
> > -	if (!bio_post_read_ctx_cache)
> > -		goto fail;
> > -	bio_post_read_ctx_pool =
> > -		mempool_create_slab_pool(NUM_PREALLOC_POST_READ_CTXS,
> > -					 bio_post_read_ctx_cache);
> > -	if (!bio_post_read_ctx_pool)
> > -		goto fail_free_cache;
> > -	return 0;
> > -
> > -fail_free_cache:
> > -	kmem_cache_destroy(bio_post_read_ctx_cache);
> > -fail:
> > -	return -ENOMEM;
> > -}
> > -
> > -void __exit f2fs_destroy_post_read_processing(void)
> > -{
> > -	mempool_destroy(bio_post_read_ctx_pool);
> > -	kmem_cache_destroy(bio_post_read_ctx_cache);
> > -}
> 
> Need to remove the declarations of these functions from fs/f2fs/f2fs.h to.
> 
> > diff --git a/fs/read_callbacks.c b/fs/read_callbacks.c
> > index a4196e3de05f..4b7fc2a349cd 100644
> > --- a/fs/read_callbacks.c
> > +++ b/fs/read_callbacks.c
> > @@ -76,7 +76,6 @@ void read_callbacks(struct read_callbacks_ctx *ctx)
> >  	switch (++ctx->cur_step) {
> >  	case STEP_DECRYPT:
> >  		if (ctx->enabled_steps & (1 << STEP_DECRYPT)) {
> > -			INIT_WORK(&ctx->work, fscrypt_decrypt_work);
> >  			fscrypt_enqueue_decrypt_work(&ctx->work);
> >  			return;
> >  		}
> 
> Again, I think the work initialization should remain here as:
> 
> 	INIT_WORK(&ctx->work, decrypt_work);
> 
> rather than moving it to fs/crypto/.
> 
> Thanks!
> 
> - Eric
> 


-- 
chandan





_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
