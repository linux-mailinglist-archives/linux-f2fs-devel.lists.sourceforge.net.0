Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2FCC21AC71
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 03:15:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jthdS-0005tS-VY; Fri, 10 Jul 2020 01:15:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jthdR-0005tL-OZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 01:15:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JxxwoPnSIemMXsucFg/Ydz6/sOOz0t7FDmFTYz0AnSk=; b=itJDQdC1awkX4cdaHsDPfeCTBu
 XJCAgZxZ70uGubmwebB5dEPUiEqTFTqdojFxrbA1oVNClqTNP+Hy81KTboNbnbKoOtK3W8LDuZmfE
 WSXWEA/vyqwiQnPS8z7QbQE3uhuhuem3NUBMl4T/E1J+vNLlCExs7FpacTAgt3pMZ6Go=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JxxwoPnSIemMXsucFg/Ydz6/sOOz0t7FDmFTYz0AnSk=; b=k25A6pvqJG0CUNZ5yaDfvqMPtO
 cDflzJgWxNovpsIiBWLUxwFSXqFFExqRAFsx5q7GNoCbq4bIPmc+NhcnkPctyZzwIWn15xvCAA2RY
 X+U395bSLbQM5jEPQlP+16rAqZtb8hzejvRnxUM7DgGQ8r+8c/1z6tfJ3IqZSx0+EbnE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jthdN-00Fk1f-Qs
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 01:15:29 +0000
Received: from gmail.com (unknown [104.132.1.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3A79B20708;
 Fri, 10 Jul 2020 01:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594343715;
 bh=C8cT75MIlGM04Tub/VRAl3jRDWJvMsg87Gf2nf6feWo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y5dVuYqU9lL7VJJavhFYRgeK1C7CXj9pDwiZxDeHvV6G5lJMyfNbRV7FNeAsTH8Vn
 yPWTht3cItkkWnhW3hh+gNE4zGFsfZRqBBLm1cgWtwCbA9xUnA8V/s735zsk1pZQ6e
 7DPyUEVeX1bPi8+BJ9PP9hJuiki1L5HrnlZcVVxU=
Date: Thu, 9 Jul 2020 18:15:13 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200710011513.GA4037751@gmail.com>
References: <20200709194751.2579207-1-satyat@google.com>
 <20200709194751.2579207-6-satyat@google.com>
 <560266ca-0164-c02e-18ea-55564683d13e@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <560266ca-0164-c02e-18ea-55564683d13e@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jthdN-00Fk1f-Qs
Subject: Re: [f2fs-dev] [PATCH 5/5] f2fs: support direct I/O with fscrypt
 using blk-crypto
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Satya Tangirala <satyat@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 10, 2020 at 09:05:23AM +0800, Chao Yu wrote:
> On 2020/7/10 3:47, Satya Tangirala wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Wire up f2fs with fscrypt direct I/O support.
> > 
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > Signed-off-by: Satya Tangirala <satyat@google.com>
> > ---
> >  fs/f2fs/f2fs.h | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index b35a50f4953c..6d662a37b445 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -4082,7 +4082,9 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
> >  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> >  	int rw = iov_iter_rw(iter);
> >  
> > -	if (f2fs_post_read_required(inode))
> > +	if (!fscrypt_dio_supported(iocb, iter))
> > +		return true;
> > +	if (fsverity_active(inode))
> 
> static inline bool f2fs_post_read_required(struct inode *inode)
> {
> 	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
> 		f2fs_compressed_file(inode);
> }
> 
> That's not correct, missed to check compression condition.
> 

Thanks Chao, great catch.  This used to be correct, but we missed that the
second f2fs_compressed_file() check got removed by commit b5f4684b5f5f
("f2fs: remove redundant compress inode check").

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
