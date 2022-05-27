Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D575365EA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 May 2022 18:23:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nuck4-0005Xs-CW; Fri, 27 May 2022 16:23:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <djwong@kernel.org>) id 1nuck2-0005Xi-P8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 16:23:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zDBvnmQprD7jxgY8atjChsi7uYJY9l7EGb5ySWRzNTU=; b=Ii9c4aG0R4b7jYOXsqKNvfPcNn
 HwysmSDJ4PTRTfPYZWqVR9hJeymShk19wberKluYJTnzyrVX8qLo1wPzbTWZ11nc+CAPK7IJvF6A5
 FR7LiLyerdEJhNrX/P6MR9W5wYjVH9uSW7EeiUD3tpj5NWezYfzsn8eJlNLCNouqzqIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zDBvnmQprD7jxgY8atjChsi7uYJY9l7EGb5ySWRzNTU=; b=hBiMp3R5DszWQTPL+MXrhM+u55
 W01IjR4oBrYUlMwa28DdfURtZEYYp/KmkW9kAqPnQDeXKWw85xOUSi4dGovcdP1M3mc9KmMwSzXyM
 4iqUOyn1bxMkFtqZqCx/QVrh8L2JIHmS61d6+9wyNjqQ/yewdDZT2/Gzb2DdmcJnP+/k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nucjx-0000Ov-Sz
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 27 May 2022 16:23:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3F79861D53;
 Fri, 27 May 2022 16:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99ED1C385A9;
 Fri, 27 May 2022 16:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653668575;
 bh=8XAC02Xg3Py4hds1HUWlnnOVkjDum3hK8PsY6LQ/M1I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nbanzFw6hk+ZxmKvBYBHJvrevsjnL/H+zkSXoD9fxEqQWa7YQ/GM2r6J2flebnNPk
 NPe+mNUtTNeKCCPHpf61gVNd7xWNTcyonFkBcaeqXmsOROx2Ap0VSGkpyGvAJurXaJ
 5ajqSsKilEN0lvcbMrGl0mLjavEHF4KFROBKRTL2fVZsqYOy5Zzvi56y3UKk8c6TXn
 L6BQzUAinNqQ0mKfP7nt6aqyxJT9lbnXadeQhxBkRQRKxxjgLiIzD9tfJGcqEM4P+B
 GAlP947kLR30hrfGsg9aVcc34w4x2YXwmE8rlgwV+ki8cEbsPdRfrkMTujtXO1bTzb
 lT0LXL87H+JvQ==
Date: Fri, 27 May 2022 09:22:54 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Florian Weimer <fweimer@redhat.com>
Message-ID: <YpD63ocQmmgpZVrd@magnolia>
References: <20220518235011.153058-1-ebiggers@kernel.org>
 <20220518235011.153058-2-ebiggers@kernel.org>
 <87r14ffivd.fsf@oldenburg.str.redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87r14ffivd.fsf@oldenburg.str.redhat.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 27, 2022 at 11:02:46AM +0200,
 Florian Weimer wrote:
 > * Eric Biggers: > > > diff --git a/include/uapi/linux/stat.h
 b/include/uapi/linux/stat.h
 > > index 1500a0f58041a..f822b23e81091 100644 [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nucjx-0000Ov-Sz
Subject: Re: [f2fs-dev] [RFC PATCH v2 1/7] statx: add I/O alignment
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
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 27, 2022 at 11:02:46AM +0200, Florian Weimer wrote:
> * Eric Biggers:
> 
> > diff --git a/include/uapi/linux/stat.h b/include/uapi/linux/stat.h
> > index 1500a0f58041a..f822b23e81091 100644
> > --- a/include/uapi/linux/stat.h
> > +++ b/include/uapi/linux/stat.h
> > @@ -124,9 +124,13 @@ struct statx {
> >  	__u32	stx_dev_minor;
> >  	/* 0x90 */
> >  	__u64	stx_mnt_id;
> > -	__u64	__spare2;
> > +	__u32	stx_mem_align_dio;	/* Memory buffer alignment for direct I/O */
> > +	__u32	stx_offset_align_dio;	/* File offset alignment for direct I/O */
> >  	/* 0xa0 */
> > -	__u64	__spare3[12];	/* Spare space for future expansion */
> > +	__u32	stx_offset_align_optimal; /* Optimal file offset alignment for I/O */
> > +	__u32	__spare2;
> > +	/* 0xa8 */
> > +	__u64	__spare3[11];	/* Spare space for future expansion */
> >  	/* 0x100 */
> >  };
> 
> Are 32 bits enough?  Would it make sense to store the base-2 logarithm
> instead?

I don't think a log2 will work here, XFS will want to report things like
raid stripe sizes, which can be any multiple of the fs blocksize.

32 bits is probably enough, seeing as the kernel won't do an IO larger
than 2GB anyway.

--D

> Thanks,
> Florian
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
