Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79FA25B5D63
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Sep 2022 17:39:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXlX9-0007my-Ch;
	Mon, 12 Sep 2022 15:39:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oXlX8-0007ms-GU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 15:39:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DVx7N1LW77HIxs/flUStTiE767E+nPAPjSfgWipI76k=; b=V2I4TW8toxEA4M3C10aeNy+KWM
 B6EZe684fFjka76i7fFTH4M+GFmXBw8fpfNzcGhmfa42GVB7CjmTe2c1eZS9uLhxtkHzX44hp/4uW
 WIm9vh7pu1HInb9qP/8t2XUHJWyfVGrnqYCFeGBfn0jxv0OwSsYnYzwVHRrAQzcvLdu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DVx7N1LW77HIxs/flUStTiE767E+nPAPjSfgWipI76k=; b=gnzueenT9k5YLY7LI4Jwu2n6FZ
 YnzSUaEb31sK9XLgb0J6SxJMlb4w5CAnGB1+BIGpMM48lZsYUdPkOAepbFEy0GAvSZPc7X7ymhbDK
 5Ci8ZB35cLmGW3rQNwyHE5Necpkn77OEGj/pkaiFs5MK4e8Q0X9NawkcKP7AR48t76eo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXlXF-005xgM-S7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Sep 2022 15:39:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7F71661224;
 Mon, 12 Sep 2022 15:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3513C433C1;
 Mon, 12 Sep 2022 15:39:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1662997179;
 bh=MOdzIQtvwZrIZeYWgAorj/0pcEr85t2z2V/ng6h3GaM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nzQ4GL23rZMxIiI2gcwNbRbd8TvZRoW1fHAwN/x4hHh127TrVyb5+RssRnmHnwBpG
 MmpeAOpBWaBK0YhOmVELUzWgEztt13h6zaBzvEGquyKEUHO7PTk7dRI1/J2nQi+1dP
 sHANhxec5hrC9+XYAQPdEnwUtQoVHLPkC2kEGsJSXna3i3TxMlD8Z4/jEncU8BLyHn
 2i2CX+okl7DKNkR7HqiXphjPsAUDTjPTzc8m2D0xwnPODkZhm/I0Soui+xqgHy888f
 q6yrjozRZ9Fj9KKnewiYADQGgaJboafdNDDq5kw5+2aAkt2k+Rs+rl1IWK9/vBiF2e
 5S8vMTZRCGT3g==
Date: Mon, 12 Sep 2022 08:39:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yx9SulcDlMfO/hiW@google.com>
References: <20220830225358.300027-1-chao@kernel.org>
 <YxlNGeh6Sr4isEFf@google.com>
 <0af788ed-8797-22a2-ae0c-433fdd6a2188@kernel.org>
 <YxlRMRA7AVIusfav@google.com>
 <e5abac5f-433b-62d4-b2fa-974b5f978d61@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5abac5f-433b-62d4-b2fa-974b5f978d61@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/08, Chao Yu wrote: > On 2022/9/8 10:19, Jaegeuk Kim
 wrote: > > On 09/08, Chao Yu wrote: > > > On 2022/9/8 10:02, Jaegeuk Kim wrote:
 > > > > On 08/31, Chao Yu wrote: > > > > > From: Chao Yu <chao [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oXlXF-005xgM-S7
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to disallow getting inner inode
 via f2fs_iget()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/08, Chao Yu wrote:
> On 2022/9/8 10:19, Jaegeuk Kim wrote:
> > On 09/08, Chao Yu wrote:
> > > On 2022/9/8 10:02, Jaegeuk Kim wrote:
> > > > On 08/31, Chao Yu wrote:
> > > > > From: Chao Yu <chao.yu@oppo.com>
> > > > > 
> > > > > Introduce f2fs_iget_inner() for f2fs_fill_super() to get inner inode:
> > > > > meta inode, node inode or compressed inode, and add f2fs_check_nid_range()
> > > > > in f2fs_iget() to avoid getting inner inode from external interfaces.
> > > > 
> > > > So, we don't want to check the range of inner inode numbers? What'd be the
> > > > way to check it's okay?
> > > 
> > > For node_ino, meta_ino, root_ino, we have checked them in sanity_check_raw_super()
> > > as below:
> > > 
> > > 	/* check reserved ino info */
> > > 	if (le32_to_cpu(raw_super->node_ino) != 1 ||
> > > 		le32_to_cpu(raw_super->meta_ino) != 2 ||
> > > 		le32_to_cpu(raw_super->root_ino) != 3) {
> > > 		f2fs_info(sbi, "Invalid Fs Meta Ino: node(%u) meta(%u) root(%u)",
> > > 			  le32_to_cpu(raw_super->node_ino),
> > > 			  le32_to_cpu(raw_super->meta_ino),
> > > 			  le32_to_cpu(raw_super->root_ino));
> > > 		return -EFSCORRUPTED;
> > > 	}
> > > 
> > > compressed_ino should always be NM_I(sbi)->max_nid, it can be checked in
> > > f2fs_init_compress_inode()?
> > 
> > Hmm, I'm not sure whether we really need this patch, since it'd look better
> > to handle all the iget with single f2fs_iget?
> 
> Well, the main concern is previously f2fs_iget() won't check validation for inner
> inode due to it will skip do_read_inode() - f2fs_check_nid_range(), so that in a
> fuzzed image, caller may pass inner ino into f2fs_iget(), result in incorrect use
> of inner inode. So I add f2fs_check_nid_range() in prior to f2fs_iget_inner() in
> f2fs_iget() as below to detect and avoid this case.

FWIW, sanity_check_raw_super() checked the inode numbers.

> 
> > > > > +struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
> > > > > +{
> > > > > +	int ret;
> > > > > +
> > > > > +	ret = f2fs_check_nid_range(F2FS_SB(sb), ino);
> > > > > +	if (ret)
> > > > > +		return ERR_PTR(ret);
> > > > > +
> > > > > +	return f2fs_iget_inner(sb, ino);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
