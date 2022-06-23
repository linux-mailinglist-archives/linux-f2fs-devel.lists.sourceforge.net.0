Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E52A5587FF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Jun 2022 20:59:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o4S2m-0006pq-IP; Thu, 23 Jun 2022 18:59:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o4S2b-0006pM-Fb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pB7SxGSd5WKP87TngJdTexlGcH8J2U/dUFt26/9kiRk=; b=WWKQMNtsKRcsrUtHLdTsNIvTVx
 gOswlmqtXGnqlxnOqgHi5Vb8wsWBLaapkKVRFouaxW7RmO8w3xmCKukLzZzDlxefy6SAFzWmMJjkv
 Zw+6rJc/enI/ESQPWAth5QqCB3Vns1/38c+oLYTLxYAyQCLRt8QBUTBJjB1BE6WBCQOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pB7SxGSd5WKP87TngJdTexlGcH8J2U/dUFt26/9kiRk=; b=Abiva3fkh6eb2TxfqFfOXYG+9W
 TnYJwj5JYNes77gBAkfUhPDlQA4dJojQ0+H76QpJ8PXyRfLrdVFx1VVwTmueeZhNvYiySisPXBklh
 sAgBdBOxUzRxuqA+IgZ5untz0TKTRywAuuZJUg2mOQ9vI+2KCP0lQGsmJrwembiLLrqQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o4S2X-0007Nf-T8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 Jun 2022 18:58:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8729A62033
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 Jun 2022 18:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AFD1C341C6;
 Thu, 23 Jun 2022 18:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656010717;
 bh=wcnDAE6efCkUyOu/9igfaJxsfWfaKPG9S7OSaniKuNc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WQKN03GKc3xjYJxrsDtPtPxj231mXmv+7HUl8K06cmI4vPswygum9iBmiIotv8v90
 52rc4x9HRdRewYOwGiyXOd3rhywelcFJr2iYHAoabwJYYXpDoTRMC2FLTai+k5zgI9
 7i6eyhzRLhm5Jr8hLHbXBkAqdk7C6goKP9bUshzNgYJjlJD+zDv+9b5kQDtecRd/Ce
 t8fpkXqpbiixPzTW5oPjxXMiuK437eriEXT6TYL800O3vpnoqZAoWFtYB9m6CCJo+K
 rFl4YJnqmgCEZXzdgvHJSYa98bPNv8IagXucwatIdOPgtrQ2tk/ji5B9/eYJxuVn7g
 2AK0Q9WEjXRGg==
Date: Thu, 23 Jun 2022 11:58:35 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <YrS322LwMpQwiMT2@sol.localdomain>
References: <20220616201506.124209-1-ebiggers@kernel.org>
 <20220616201506.124209-2-ebiggers@kernel.org>
 <YrSNlFgW6X4pUelg@magnolia> <YrShiIjNCIANjSwL@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YrShiIjNCIANjSwL@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jun 23, 2022 at 10:23:20AM -0700, Eric Biggers wrote:
 > On Thu, Jun 23, 2022 at 08:58:12AM -0700, Darrick J. Wong wrote: > > >
 diff --git a/include/linux/stat.h b/include/linux/stat.h > > > in [...] 
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
X-Headers-End: 1o4S2X-0007Nf-T8
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
Cc: linux-xfs@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jun 23, 2022 at 10:23:20AM -0700, Eric Biggers wrote:
> On Thu, Jun 23, 2022 at 08:58:12AM -0700, Darrick J. Wong wrote:
> > > diff --git a/include/linux/stat.h b/include/linux/stat.h
> > > index 7df06931f25d8..ff277ced50e9f 100644
> > > --- a/include/linux/stat.h
> > > +++ b/include/linux/stat.h
> > > @@ -50,6 +50,8 @@ struct kstat {
> > >  	struct timespec64 btime;			/* File creation time */
> > >  	u64		blocks;
> > >  	u64		mnt_id;
> > > +	u32		dio_mem_align;
> > > +	u32		dio_offset_align;
> > 
> > Hmm.  Does the XFS port of XFS_IOC_DIOINFO to STATX_DIOALIGN look like
> > this?
> > 
> > 	struct xfs_buftarg	*target = xfs_inode_buftarg(ip);
> > 
> > 	kstat.dio_mem_align = target->bt_logical_sectorsize;
> > 	kstat.dio_offset_align = target->bt_logical_sectorsize;
> > 	kstat.result_mask |= STATX_DIOALIGN;
> 
> Yes, I think so.
> 

By the way, the patchset "[PATCHv6 00/11] direct-io dma alignment"
(https://lore.kernel.org/linux-block/20220610195830.3574005-1-kbusch@fb.com/T/#u),
which is currently queued in linux-block/for-next for 5.20, will relax the user
buffer alignment requirement to the dma alignment for all filesystems using the
iomap direct I/O implementation.  If that goes in, the XFS implementation of
STATX_DIOALIGN, as well as the ext4 and f2fs ones, will need to be changed
accordingly.  Also, the existing XFS_IOC_DIOINFO will need to be changed.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
