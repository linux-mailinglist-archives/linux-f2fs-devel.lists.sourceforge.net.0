Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6E42D1FF0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 02:26:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmRlx-0002hT-9g; Tue, 08 Dec 2020 01:26:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kmRlw-0002hI-JE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:26:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zka+vNdRYl/Cn8BWdxR/4B0nEebd3VHj+GCnBZTaz4k=; b=PaMBF4swNBsfItdZ8bJ8lLucY3
 zewUMkTrxkleccpnELAB1X9V5b4i/Sz0slaJoCbXX3AZhfvDduRijDFZETIZifxeMMlQH8Pe9iBBX
 t783TNjE20TpkoAhjsLeN2zvwGVnHq1iWOaHOMi5R4DXuGE7Jsr374uWWi6gKBGwM/Ak=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zka+vNdRYl/Cn8BWdxR/4B0nEebd3VHj+GCnBZTaz4k=; b=U8jY2Rv3vRX9xKO2NfWv8tOR1p
 xaQQvV7jLUe4HyzcPoy7kUHkNFT9KMIbhdnTKxPs5F5eZEQ0YO62DwD3Rk4I+5qVLOCvJe8B/2I79
 HGLQ9vyVcK5R2rF7buhXCK/ggT7BFq+wuUi5hqWLCjYfNmCHHi4axonULrHDzIbyYP6w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmRlp-0060Lw-23
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 01:26:32 +0000
Date: Mon, 7 Dec 2020 17:26:03 -0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607390765;
 bh=dKxMYGEJk/qsfEljvMrUx1suvymwSnTOX+Nd8kkjqAU=;
 h=From:To:Cc:Subject:References:In-Reply-To:From;
 b=lU3x0KdOCyqLG0bPUqEzQKEK6FINx4Paat/QU4vCgl2l6XPe/G3mIHZEWKXCsLA4S
 Xqshe2PrpSSIwniVht2EnpD6EZClKo8wjvWa2UItV/0bZUs8JzOAK2wOCkXI203DgZ
 HOXs8HjeblvoAOT8eovsvqpwgxVtKkcWB5OQRaIyhreM2UmzHagvFmCRjKjTNSQRhG
 QCcNuRlIBUMz2rv95yJL5nXsain7p73KwTPYy5dgTfmdLSHQDexWIanSZiY81TQNRU
 JpRT12rSlNmCUuvGaLWWuzkA64nlbB+ol4hIE1pTuwmyLmYx5pWGAImV4Ji21Td/GT
 dUQg/XZ2sK8IQ==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <X87WK9SOoJ8cn14T@google.com>
References: <20201126103209.67985-1-yuchao0@huawei.com>
 <X86Sb2pvD53MzO5+@gmail.com>
 <e6bc842d-90a2-d4ce-56be-594bcebaea37@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e6bc842d-90a2-d4ce-56be-594bcebaea37@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kmRlp-0060Lw-23
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: compress: support chksum
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
Cc: Eric Biggers <ebiggers@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/08, Chao Yu wrote:
> On 2020/12/8 4:37, Eric Biggers wrote:
> > On Thu, Nov 26, 2020 at 06:32:09PM +0800, Chao Yu wrote:
> > > +	if (!ret && fi->i_compress_flag & 1 << COMPRESS_CHKSUM) {
> > 
> > This really could use some parentheses.  People shouldn't have to look up a
> > C operator precedence table to understand the code.
> 
> Will add parentheses to avoid misread.
> 
> > 
> > > +		u32 provided = le32_to_cpu(dic->cbuf->chksum);
> > > +		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
> > > +
> > > +		if (provided != calculated) {
> > > +			if (!is_inode_flag_set(dic->inode, FI_COMPRESS_CORRUPT)) {
> > > +				set_inode_flag(dic->inode, FI_COMPRESS_CORRUPT);
> > > +				printk_ratelimited(
> > > +					"%sF2FS-fs (%s): checksum invalid, nid = %lu, %x vs %x",
> > > +					KERN_INFO, sbi->sb->s_id, dic->inode->i_ino,
> > > +					provided, calculated);
> > > +			}
> > > +			set_sbi_flag(sbi, SBI_NEED_FSCK);
> > > +			WARN_ON_ONCE(1);
> > 
> > WARN, WARN_ON_ONCE, BUG, BUG_ON, etc. are only for kernel bugs, not for invalid
> > inputs from disk or userspace.
> > 
> > There is already a log message printed just above, so it seems this WARN_ON_ONCE
> > should just be removed.
> 
> Jaegeuk wants to give WARN_ON and marking a FSCK flag without returning EFSCORRUPTED,

I think above printk_ratelimited should be enough.

> 
> Jaegeuk, thoughts?
> 
> Thanks,
> 
> > 
> > - Eric
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
