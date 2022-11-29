Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A99063C5A8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 17:51:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p03pc-0008UE-1M;
	Tue, 29 Nov 2022 16:51:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1p03pH-0008So-1j
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 16:51:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E+tbc2lDiBogvZ7rT9cVbNRViYXZGcr4VvihH/NIDFI=; b=LxnStjW0m8mc0lU3tHJJCRaONn
 suZuQaMOtr6rZkWOb3/n42czAayBg6gR0KqBpv0heqOOwe97xpGF7GkgvZamTNDi7NdcVKjIF/BLN
 1zMRaCmLfr8FBzHFqwWxcfPC9P/5TYRsImMFA4nKxRetqtmW81qFusr0bkm5eY/kP10w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=E+tbc2lDiBogvZ7rT9cVbNRViYXZGcr4VvihH/NIDFI=; b=aSf/LWPtqjc4hW4E7sitcDO18F
 loyVw7mgjZ2EURu7MC7j+8YNLhyWVT1CvIEOwH7anQwCBJld694c2LlRl36YweLDbgOQ4gsqZ99eg
 UkehH7FUyKjjti9a98WxJvXf6/Kf3QsphUAjZCT7sD03CX3FpMIwIGoHKadNCFkHNjVg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p03pD-0000Zs-N9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 16:51:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E13E1617F5;
 Tue, 29 Nov 2022 16:51:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B39C433D6;
 Tue, 29 Nov 2022 16:51:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1669740667;
 bh=LYZJsu1DOlRQkmkTy7jSyaGxwY1+2mNBCvXV9Xgev8I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YOLogoxhcyZA3N5S2zyPuNJoGHUstbKWRioer7l/SCiUpR522WqAdEk1LE8tJxYPW
 9FAYyVMlIW4Of/Y23n1jkPzgyTc+QLOT04hID5rcJzrjRz543axOVHzO0wiMoLalCW
 k9yVOoOQP+yqKyDY+jXefpZ9BtPiesiu35bIrNfe2vX62DBtvMdtMj98Sue/qiH2zz
 T1AdNXDXjJk/T9Dq2FnVDKqxiQtJLL7HnqX35f16fpq7dHPnp65lQ5zECBC01tsS92
 rOj7snaNP+UryAUECK0o9EFBb0PugZ5nLrM+d/cQIcoe3SIz0a5+W/NI8UBEsjQ0BL
 keZ0N/w1jhtbQ==
Date: Tue, 29 Nov 2022 08:51:05 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <Y4Y4eaMvCBZMgig0@google.com>
References: <20221125190642.12787-1-ebiggers@kernel.org>
 <Y4WrSeIf+E6+tL1y@google.com> <Y4WxUZesKJ79mI9e@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y4WxUZesKJ79mI9e@sol.localdomain>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/28, Eric Biggers wrote: > On Mon, Nov 28,
 2022 at 10:48:41PM
 -0800, Jaegeuk Kim wrote: > > > static void f2fs_finish_read_bio(struct bio
 *bio, bool in_task) > > > { > > > struct bio_vec *bv; > > [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p03pD-0000Zs-N9
Subject: Re: [f2fs-dev] [PATCH v4] fsverity: stop using PG_error to track
 error status
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
Cc: Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/28, Eric Biggers wrote:
> On Mon, Nov 28, 2022 at 10:48:41PM -0800, Jaegeuk Kim wrote:
> > >  static void f2fs_finish_read_bio(struct bio *bio, bool in_task)
> > >  {
> > >  	struct bio_vec *bv;
> > >  	struct bvec_iter_all iter_all;
> > > +	struct bio_post_read_ctx *ctx = bio->bi_private;
> > >  
> > > -	/*
> > > -	 * Update and unlock the bio's pagecache pages, and put the
> > > -	 * decompression context for any compressed pages.
> > > -	 */
> > >  	bio_for_each_segment_all(bv, bio, iter_all) {
> > >  		struct page *page = bv->bv_page;
> > >  
> > >  		if (f2fs_is_compressed_page(page)) {
> > > -			if (bio->bi_status)
> > > +			if (!ctx->decompression_attempted)
> > 
> > If seems this causes a panic due to the ctx nullified by f2fs_verify_bio.
> > 
> 
> Thanks for catching that!  I've sent out v5 that checks for 'ctx &&
> !ctx->decompression_attempted' here.  That's the right thing to do, since if ctx
> is NULL then decompression must have been attempted.
> 
> I'd like to get rid of freeing the bio_post_read_ctx in f2fs_verify_bio().
> But I believe it's still needed, at least in theory.
> 
> Do you have a suggestion for testing f2fs compression + verity with xfstests?
> I missed this because compression isn't covered by the "verity" group tests.
> Maybe there should be an "f2fs/compress" config in xfstests-bld that uses mkfs
> and mount options that cause all files to be automatically compressed, similar
> to how f2fs/encrypt automatically encrypts all files with test_dummy_encryption.

I used for fsstress+fault_injection+shutdown loop with compressed and
non-compressed directories with:

# mkfs.f2fs -f -O extra_attr -O project_quota -O compression -g android /dev/$DEV
# mount -t f2fs -o discard,fsync_mode=nobarrier,reserve_root=32768,checkpoint_merge,atgc,compress_cache /dev/$DEV $TESTDIR
# mkdir $TESTDIR/comp
# f2fs_io setflags compression $TESTDIR/comp
# fsstress [options] -d $TESTDIR/comp

I think you can simply mount with "-o compress_extension=*" to compress
everything.

> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
