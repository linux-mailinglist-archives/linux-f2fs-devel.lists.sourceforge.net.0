Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 322F115251E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Feb 2020 04:09:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1izB3m-0005BZ-R1; Wed, 05 Feb 2020 03:09:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1izB3m-0005BT-5o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 03:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B9LDa0XPjCzIKceODg69dXaRY5vDVy2Yt+cLAsHZ2iE=; b=OKgPy6XtSDs+RMO9NPwCRao5uD
 SUlQ9X7WlgOW8cwS0LY5/FYtpTwCdQflrD+E41IMAK0mN9QYfP7WY9R6fuUV9OuGQuF8jl1HPZKsH
 Sh1apRoX4AkwC9YhV2YmPVdNGKzSq8/tX+LPDImhnfz/huJaE+NWptcOpu4wLRzUu2fI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B9LDa0XPjCzIKceODg69dXaRY5vDVy2Yt+cLAsHZ2iE=; b=SmVAjZsbOms9cC7cJTcVntxF7R
 BxGVJfDGPIFy5GlKQ9t/RNJ9vWLCCpp8gV0f4NWQrrctqYNaPiApWGrRBIi/sZdagFPrQXjaVoJdP
 4lqMbBjGyIGKONiafIiy3DBfOeni9HkCt53xIArbXCz+pFhvUwbaTuUYvOY5WvNHBw8o=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1izB3k-00HIow-Mx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Feb 2020 03:09:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=B9LDa0XPjCzIKceODg69dXaRY5vDVy2Yt+cLAsHZ2iE=; b=PQCpAoMYAzYAXkWKSEO3RGZF4s
 AK6ojSEAycRh8cHHpUbZtVb7KM0F/ojyKZAZKrn7EBESGSRqa/T6/DnaZMEFk+Y1TRw4fo+iTeEg/
 AiRolVywUugJMf867i8TU7jcgVi/Cb3WzTHOaxrEeDR25uQxgNtyA6p5vyxiL8MD6DY8cG7TxK6uL
 iYTl5wvvDyvzqdgU/6DCi8FDWVcB2GZC3kI49PLkwZ8adicSn4VdToOOVrMRIlc2qLaAjUYpsSaKa
 1Yjyvignnce2OK8Ng0b/D/7aWKtJlLdLoU3V4H/W5zdAN4SpOCZw0vuIVUWByWc/kHmlF7sCJKyA9
 r/sGtZ2g==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1izB3V-0000ZM-OD; Wed, 05 Feb 2020 03:08:45 +0000
Date: Tue, 4 Feb 2020 19:08:45 -0800
From: Matthew Wilcox <willy@infradead.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200205030845.GP8731@bombadil.infradead.org>
References: <20200201150807.17820-1-willy@infradead.org>
 <20200203033903.GB8731@bombadil.infradead.org>
 <bd08bf56-f901-33b1-5151-f77fd823e343@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bd08bf56-f901-33b1-5151-f77fd823e343@huawei.com>
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1izB3k-00HIow-Mx
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Make f2fs_readpages readable again
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
Cc: linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Feb 05, 2020 at 09:58:29AM +0800, Chao Yu wrote:
> On 2020/2/3 11:39, Matthew Wilcox wrote:
> > 
> > Remove the horrendous ifdeffery by slipping an IS_ENABLED into
> > f2fs_compressed_file().
> 
> I'd like to suggest to use
> 
> if (IS_ENABLED(CONFIG_F2FS_FS_COMPRESSION) && f2fs_compressed_file(inode))
> 
> here to clean up f2fs_readpages' codes.
> 
> Otherwise, f2fs module w/o compression support will not recognize compressed
> file in most other cases if we add IS_ENABLED() condition into
> f2fs_compressed_file().

If we need to recognise them in order to deny access to them, then I
suppose we need two predicates.  Perhaps:

	f2fs_unsupported_attributes(inode)
and
	f2fs_compressed_file(inode)

where f2fs_unsupported_attributes can NACK any set flag (including those
which don't exist yet), eg encrypted.  That seems like a larger change
than I should be making, since I'm not really familiar with f2fs code.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
