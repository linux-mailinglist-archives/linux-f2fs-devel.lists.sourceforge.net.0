Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5285F6BD2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Oct 2022 18:33:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ogTnu-0004NX-Du;
	Thu, 06 Oct 2022 16:32:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1ogTnk-0004NO-9b
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 16:32:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rd0bn9Wn97LoCejb6snsOZhRxUIBDfA6aXrBq23w6cg=; b=A6g9yKMMvIc5D/YjGeSHu9TSBL
 4cnIcN5CB+SXIkQQoeqJe9kcSeGHYuB9MnnSVb/AOnfSp/UvC/plRXjKPtwAAo8lansuq7NCS1mnY
 dF4uot47IrpDoR1o3uwDtSv6WQide+SPh2zSkmljfD35191MCN9oQNbogOUvGajZDm4M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rd0bn9Wn97LoCejb6snsOZhRxUIBDfA6aXrBq23w6cg=; b=TfOihOLq6m4hOWUBGEzig53ftD
 +QLP+NnwzbFegukiTuEqXC3EXtvn+Vo1znCTrMUrpfgzs0GM/Vrqs76A+dLXw2g7S5XHm0VxM2e2s
 R8ANfsxaW1KJozqhp/Ujb0mg/nPcPo/pLYpb73cnTxAQW7B2c4x/L07LJFa+09IdT6R0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ogTng-0003QC-1h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 06 Oct 2022 16:32:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8C1DC61A1E;
 Thu,  6 Oct 2022 16:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECF77C433D6;
 Thu,  6 Oct 2022 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1665073958;
 bh=EpiLhU9Vopf2fm0LDuMXBE1GSbO3K9x1KfL5hJfKdU0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BfWleTUhRNqsI+maojBT7rGzIWgqvXoBiV0VQVtNdYcAwLRLn3oSWOlWEokzJwW9E
 oBChMo9X78YlxVggVl19ZnLJPpMrFCvpYDdYt64FWpe2ON7JmQUcWtD/avdUgySgm/
 dbNpGVE2oOEdXvir0obKPKdFsxNRDKP1G0vg0LtXT/fvzEeo0fXvves6BZsJxLLK/h
 +2anJgh1iHcX+D0vZ2pqy+ae58mtEqUr1bAensM/YvIkoE3ifuoj4C6TXJYkZm31Fk
 SZJX80WXRMIxoYkNMIaagConJqkM70l/K4uj9BB8vk50Oh77cJ1XRbW2IwYTc7NhR8
 GwncyKKF7SAxg==
Date: Thu, 6 Oct 2022 09:32:37 -0700
From: "Darrick J. Wong" <djwong@kernel.org>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <Yz8DJROpwCcNyxVX@magnolia>
References: <20221004171351.3678194-1-daeho43@gmail.com>
 <20221004171351.3678194-2-daeho43@gmail.com>
 <Yz6S3kP4rjm5/30N@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yz6S3kP4rjm5/30N@infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Oct 06, 2022 at 01:33:34AM -0700, Christoph Hellwig
 wrote: > On Tue, Oct 04, 2022 at 10:13:51AM -0700, Daeho Jeong wrote: > >
 From: Daeho Jeong <daehojeong@google.com> > > > > introduce a new [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ogTng-0003QC-1h
Subject: Re: [f2fs-dev] [PATCH v4 2/2] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Oct 06, 2022 at 01:33:34AM -0700, Christoph Hellwig wrote:
> On Tue, Oct 04, 2022 at 10:13:51AM -0700, Daeho Jeong wrote:
> > From: Daeho Jeong <daehojeong@google.com>
> > 
> > introduce a new ioctl to replace the whole content of a file atomically,
> > which means it induces truncate and content update at the same time.
> > We can start it with F2FS_IOC_START_ATOMIC_REPLACE and complete it with
> > F2FS_IOC_COMMIT_ATOMIC_WRITE. Or abort it with
> > F2FS_IOC_ABORT_ATOMIC_WRITE.
> 
> It would be great to Cc Darrick and linux-fsdevel as there have been
> attempts to do this properly at the VFS level instead of a completely
> undocumented ioctl.

It's been a while since I sent the last RFC, but yes, it's still in my
queue as part of the xfs online fsck patchserieses.

https://lore.kernel.org/linux-fsdevel/161723932606.3149451.12366114306150243052.stgit@magnolia/

More recent git branch:
https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git/log/?h=atomic-file-updates

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
