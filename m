Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A58207076F3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 02:33:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzRZv-0004d9-3E;
	Thu, 18 May 2023 00:33:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pzRZt-0004d2-T9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 00:33:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VjrVuviN4q1eCE9CeDXncSdF5hhaXNX3JEE/CE8lslY=; b=UQAt88wM6azaV381QChwfmEe/G
 nzWwyhbZiC4OqnUCNLJG6ht56qq2Cg+hf7vUQ0vNDSDmMSGX4inqlFSeuUCxxH4OyIyCF+2Nfj+n9
 THWr0cPTilxN0INPiMKoE8mOJv96Sy0I8z0iid5Q3UgmWC8CKCfRxkhB3qvztwKF2kZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VjrVuviN4q1eCE9CeDXncSdF5hhaXNX3JEE/CE8lslY=; b=TDsrijbO9je3CdXDmN8hkqhWU7
 vxUsI5x0joby82X3jU+flgf4M+fjR9kJoCZMggNBGZQUyrfvvMfHTjBnB9GlJn7J3LUqHPKzoqMbZ
 50jNdV5lQRu9cq1LdzGhunYWiMyXi924ITsW142faansHY+OG2wH7Sq6Qw8be3R65yc4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzRZp-0000zm-LB for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 00:33:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4124764A58;
 Thu, 18 May 2023 00:33:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761B0C433EF;
 Thu, 18 May 2023 00:32:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1684369979;
 bh=SVDCwvjNWtAMtqfgwymTV3gQlOjEiooq5eDjOTBGg6A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JwyInkd/w9jK5ecH7RDsTWHzkxxEs+dYp7XJpfpE4kLspZARKAiwjlXHOgoA41f98
 EF6HYw+KMs/LtFIjx4XsS86FBktUogodPLQ0zLFChjPMQ1GWQkraPbQWAwNahfC+3i
 DY3TjGXfbhcJxIJh3m6ef0s6ydwGorGkpcUGHmkvSZhLZzZ+MJVOk3ZuQ4aY/9yLZ5
 ybR8fExC4OM13WLPoz27VNF6/uEr1Qtd1EaCcP0u7drb24i8O/W5+BFJdjzxR0QzC6
 1FCYysxIHJexIJnNlJdoyNie6rks8htMhupqGhQxEyaz8gmQuweENAvfqSsn/NxwB1
 TLZhNNr8uSGvQ==
Date: Wed, 17 May 2023 17:32:57 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Wu Bo <wubo.oduw@gmail.com>
Message-ID: <ZGVyOTqQy5ZhNvAr@google.com>
References: <45eb63c6-a147-776a-99b5-7ac06848ede8@kernel.org>
 <20230517035953.47810-1-bo.wu@vivo.com>
 <94958409-f726-9da6-3b9f-76efa022ee9d@kernel.org>
 <4a512db8-cfca-80a5-ba62-780f56d014f6@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4a512db8-cfca-80a5-ba62-780f56d014f6@gmail.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 05/17, Wu Bo wrote: > On 2023/5/17 16:36, Chao Yu wrote:
 > > On 2023/5/17 11:59, Wu Bo wrote: > > > On 2023/5/17 10:44, Chao Yu wrote:
 > > > > On 2023/5/16 20:07, Wu Bo wrote: > > > > > Modify the [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pzRZp-0000zm-LB
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: pass I_NEW flag to trace event
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
Cc: linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 05/17, Wu Bo wrote:
> On 2023/5/17 16:36, Chao Yu wrote:
> > On 2023/5/17 11:59, Wu Bo wrote:
> > > On 2023/5/17 10:44, Chao Yu wrote:
> > > > On 2023/5/16 20:07, Wu Bo wrote:
> > > > > Modify the order between 'trace_f2fs_iget' &
> > > > > 'unlock_new_inode', so the
> > > > > I_NEW can pass to the trace event when the inode initialised.
> > > > =

> > > > Why is it needed? And trace_f2fs_iget() won't print inode->i_state?
> > > =

> > > When connect a trace_probe to f2fs_iget, it will be able to
> > > determine whether
> > > the inode is new initialised in order to do different process.
> > =

> > I didn't get it, you want to hook __tracepoint_f2fs_iget() w/ your own
> > callback?
> Yes,=A0 to use 'tracepoint_probe_register ' to register a probe at
> trace_f2fs_iget

Why?

> > =

> > Thanks,
> > =

> > > =

> > > > =

> > > > Thanks,
> > > > =

> > > > > =

> > > > > Signed-off-by: Wu Bo <bo.wu@vivo.com>
> > > > > ---
> > > > > =A0=A0 fs/f2fs/inode.c | 2 +-
> > > > > =A0=A0 1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > =

> > > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > > index cf4327ad106c..caf959289fe7 100644
> > > > > --- a/fs/f2fs/inode.c
> > > > > +++ b/fs/f2fs/inode.c
> > > > > @@ -577,8 +577,8 @@ struct inode *f2fs_iget(struct super_block *s=
b,
> > > > > unsigned long ino)
> > > > > =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 file_dont_truncate(inode);
> > > > > =A0=A0=A0=A0=A0=A0 }
> > > > > =A0=A0 -=A0=A0=A0 unlock_new_inode(inode);
> > > > > =A0=A0=A0=A0=A0=A0 trace_f2fs_iget(inode);
> > > > > +=A0=A0=A0 unlock_new_inode(inode);
> > > > > =A0=A0=A0=A0=A0=A0 return inode;
> > > > > =A0=A0=A0=A0 bad_inode:
> > > > =

> > > > =

> > > > _______________________________________________
> > > > Linux-f2fs-devel mailing list
> > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > =



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
