Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 599E75582F8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 19:23:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4QYJ-000394-Hr; Thu, 23 Jun 2022 17:23:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o4QYI-00038x-Gt
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 17:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9l89qyGbBGPiEsudUcvyHOzT5am4ksD2gPvevcRQpKo=; b=YFMzjmTkU7ZHf208A5TRsnTvar
 Jsh7VdaMLwqDdaA9nk7H6q/HpQUZiy29ljYkMAq7uu6XYioaPekrTmD1bto/5tLsdQZtlUZRevcZH
 kBKpDj3ElsGAmhxnPKrpTmZWdDiHGEMqvrqS8FQhQosPtEfxGGQPU99fA/r+8E1UtEok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9l89qyGbBGPiEsudUcvyHOzT5am4ksD2gPvevcRQpKo=; b=g1VEWdmmcEkzmvB1yDPSoLNQ2Q
 ZAaPYq3yS//nIFnvA/LpMIZ74/kzq6IGZ/ZIzQcNoyQUTsv9wrX+zMsPbSWOzvDsPo9gcerCryEws
 MsDGmzmbgoLVSYki+HjV1YZelSWssym2OIqURzjrISYixm0hlFTdSGA1ZbIS8eDgr26I=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o4QYI-00BQV0-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 17:23:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9844E61E9D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 17:23:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812B1C3411B;
 Thu, 23 Jun 2022 17:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656005002;
 bh=wHCbmf5IRU39rWTli2nZUaGZkhlxJIj37MxQFogSdEY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PyKKn5AmJY5LA84KqOczZyyRySup5L6Azsjk02/PDhbsW5QDnbgiunWdXq6+5Hdly
 so5Jt85YlQB9yKrlKNekvT01BKoj61uSsEu/gk7IN2BYRRSZpJ27dJHNI3qqcUG7Au
 zhBqRL1Qly6dDmbG/gEgCOJOudXz40JLfL6p+bxfc6GS+W4PIbHRpxLNi83ee1O/GS
 uP5kPq9auC78LW6pOr1jPPca7r7KzTXLrrbzcVjhNuSFmJf/idfZ+iKYrqA82FALa/
 yKF7FO0a8934AaK2M+hpSsOnQSPqHVFK1nrJQcNXnJEua4rVcuQoWL5ptjezOKzdVE
 vp2zp8L/1LTLQ==
Date: Thu, 23 Jun 2022 10:23:20 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <YrShiIjNCIANjSwL@sol.localdomain>
References: <20220616201506.124209-1-ebiggers@kernel.org>
 <20220616201506.124209-2-ebiggers@kernel.org>
 <YrSNlFgW6X4pUelg@magnolia>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YrSNlFgW6X4pUelg@magnolia>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 23, 2022 at 08:58:12AM -0700, Darrick J. Wong
 wrote: > > diff --git a/include/linux/stat.h b/include/linux/stat.h > > index
 7df06931f25d8..ff277ced50e9f 100644 > > --- a/include/linux/stat [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o4QYI-00BQV0-Jq
Subject: Re: [f2fs-dev] [PATCH v3 1/8] statx: add direct I/O alignment
 information
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 23, 2022 at 08:58:12AM -0700, Darrick J. Wong wrote:
> > diff --git a/include/linux/stat.h b/include/linux/stat.h
> > index 7df06931f25d8..ff277ced50e9f 100644
> > --- a/include/linux/stat.h
> > +++ b/include/linux/stat.h
> > @@ -50,6 +50,8 @@ struct kstat {
> >  	struct timespec64 btime;			/* File creation time */
> >  	u64		blocks;
> >  	u64		mnt_id;
> > +	u32		dio_mem_align;
> > +	u32		dio_offset_align;
> 
> Hmm.  Does the XFS port of XFS_IOC_DIOINFO to STATX_DIOALIGN look like
> this?
> 
> 	struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
> 
> 	kstat.dio_mem_align = target->bt_logical_sectorsize;
> 	kstat.dio_offset_align = target->bt_logical_sectorsize;
> 	kstat.result_mask |= STATX_DIOALIGN;

Yes, I think so.

However, if we need more fields as Avi Kivity requested at
https://lore.kernel.org/r/6c06b2d4-2d96-c4a6-7aca-5147a91e7cf2@scylladb.com
that is going to complicate things.  I haven't had a chance to look
into whether those extra fields are really needed.  Your opinion on whether XFS
(and any other filesystem) needs them would be appreciated.

> 
> And I guess you're tabling the "optimal" IO discussions for now, because
> there are too many variants of what that means?
> 

Yes, that's omitted for now due to the apparent redundancy with stx_blksize.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
