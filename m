Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6D2379B61
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 May 2021 02:21:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lgG9l-00063a-Ts; Tue, 11 May 2021 00:21:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lgG9j-00063S-FW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 00:21:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pVD109YQP66zpRyqEqfxdySVgnrFmb0t09GsRTtxVO4=; b=KOUMR/oEZi+Kcn6bwQWdzYIFKh
 FtNwY7UrA3MNKlBu5jSW1Cr64F3o2rmzfCScPfRdcgplIm+VRVw+Z0YOPh6uDP/P+7eLQxmVYjzO8
 LmDoAhxpYtPpnGqPYracEnO1LZ6eO8DG5MbBkRhqRVUJXrljohmUyl77OZAHxvHHkY9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pVD109YQP66zpRyqEqfxdySVgnrFmb0t09GsRTtxVO4=; b=IQu0EILr/jIQLO/AInUMn98lGh
 a2MOsQ7Z2PomCELbSIPT/+bi1URR5wDnZn3tpKKzMC9A4QSnq50u3b1+gUuIraaN7f7adwdRRioZU
 9qNwehZLamPntVpY04dzQFX+ywkgsxt6/1oWcGpyGUN3c/w9uPYlJx05RqpxfebjZfTQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lgG9c-003CEy-2p
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 May 2021 00:21:49 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7F28A61076;
 Tue, 11 May 2021 00:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620692494;
 bh=D7+FwB6wNN0y7dvFP+IevrpYhvlfmJwLrmX2r+rCwDE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UCXWIZy4TrRnCP1EkRT4CWaXC+/SMGJWlqplUeXY8l1cA9TOUxiP68X7bOE/vDGYR
 o/W+bl9Y+919fZU+OUi+73a4GjLMt6iSwefA6Gi1Ng+k/H5xGRtvLLW/pAHodXnh/p
 0ZteAzCxRFkdWvT4ECp30MtuT2cAqQv8nX+FN+sHQpoaTjNgByqSmJXrw85MtdzQha
 Pa32btRkDKsWq7ru/sAJXiW0Kb9eWsar9Po7c+y5vDT8gNb+tNwZ9O27xtXJ+JcNw0
 2HmAj0KklstW+SqSGjyHnp6zw1sgGPfOOywb5k+LUgow8sljxscNyq3qOdexKtlsy5
 yUnmYDzdDw+iw==
Date: Mon, 10 May 2021 17:21:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <YJnODYIke6E5i5TY@google.com>
References: <20210506191347.1242802-1-jaegeuk@kernel.org>
 <YJlGU+STYD5geyIc@google.com> <YJmznEhGCZTaER0+@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YJmznEhGCZTaER0+@gmail.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lgG9c-003CEy-2p
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: support iflag change given the mask
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

On 05/10, Eric Biggers wrote:
> On Mon, May 10, 2021 at 07:42:27AM -0700, Jaegeuk Kim wrote:
> > In f2fs_fileattr_set(),
> > 
> > 	if (!fa->flags_valid)
> > 		mask &= FS_COMMON_FL;
> > 
> > In this case, we can set supported flags by mask only instead of BUG_ON.
> > 
> > /* Flags shared betwen flags/xflags */
> > 	(FS_SYNC_FL | FS_IMMUTABLE_FL | FS_APPEND_FL | \
> > 	 FS_NODUMP_FL |	FS_NOATIME_FL | FS_DAX_FL | \
> > 	 FS_PROJINHERIT_FL)
> > 
> > Fixes: 4c5b47997521 ("vfs: add fileattr ops")
> 
> Shouldn't it be:
> 
> Fixes: 9b1bb01c8ae7 ("f2fs: convert to fileattr")

Heh, thank you. I applied this change in the git. :)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
