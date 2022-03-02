Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 425FD4CAEFA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Mar 2022 20:45:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nPUud-0000VE-9z; Wed, 02 Mar 2022 19:45:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1nPUub-0000V7-Li
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 19:45:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8y4rgBLpVIw4MjV6MLLpYDuQWTWUIccIlv3ptgZMU14=; b=FvHq3Pr+TV7hzT6UYfprNBEjYi
 +Fw1vuP95VX5AYa7jov3wxA+8l0kclSbvvOpnDPQKzDFL0RYXevUmfurK+IjsllWZllQiAaQA7qNb
 FEgaWQkQaJrsNPUKsgr5CO12lqyinC5cZR5JZ5F/2RanwgxXOfekUsCKfIksSvp9fIbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8y4rgBLpVIw4MjV6MLLpYDuQWTWUIccIlv3ptgZMU14=; b=jw7p17euCUx+bmu8QV32gowza3
 CPN7uw9ZpXxtH1t7BJOGbMxNfmgf2eTFjSuywqsg3rBd2fCuZYH8U2gp5k1rbbSVrX/FCCbvkvcbV
 ldpbq/DBCUJ+OCH0uRihiHCbaBpu410PcKKC2jin6Omz+Yx7BA1BQMtwpTWOn7aDJB8k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nPUuY-0002D7-8I
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 02 Mar 2022 19:45:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C1F10616C6;
 Wed,  2 Mar 2022 19:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06090C340ED;
 Wed,  2 Mar 2022 19:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646250316;
 bh=hETAxvTljSSwJ5OXPM0CCfq1GwnQ4dsqfLkAh1duLGk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OMQ9fysgQzC03Vuc2Lnv4krnv1NeQwKYX3oiFUZMIJNqz+V4hHeiklJsJqCv3ydC1
 oyZXJhKXhnPYDH/+P7rI/IEFGeEV7hS+yFqT+8HPIyLvkqpdSJC06cacIb9GvVf58g
 KjoyC2pNHu7Rs6pOQGZpxmheQhzZTeF6ExwPd6u61+bi+qnJQ1htJ4GfAemgc+/UU1
 Haibh/8n7/7OLfkouoRZEDQutRE5Tes/RpZx8dKyPYx/kP152A4vJtNc6K95G2ibUj
 DdMxMwctQQAl0urnuD0TiShlrl61/sDMSCUQj6/iV9l6EZhbhxaLegPl/XpZe/+jZE
 oTbak9ebwk3RQ==
Date: Wed, 2 Mar 2022 11:45:14 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <Yh/JSlaIw49gV+15@google.com>
References: <YfMVxzdhat01ca7m@google.com>
 <e434b0a4-a66a-eebc-cafc-f0bad03c3fa5@kernel.org>
 <YfSMMpj2GrYXAJK2@google.com>
 <51be77f1-6e85-d46d-d0d3-c06d2055a190@kernel.org>
 <Yfs1KRgwgzSOvocR@google.com>
 <86a175d3-c438-505b-1dbc-4ef6e8b5adcb@kernel.org>
 <5b5e20d1-877f-b321-b341-c0f233ee976c@kernel.org>
 <51826b5f-e480-994a-4a72-39ff4572bb3f@kernel.org>
 <Yh8AAOjxTItKTwPQ@google.com>
 <c0d3528b-e6b4-8557-4c2b-e26a972d8aaa@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c0d3528b-e6b4-8557-4c2b-e26a972d8aaa@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/02, Chao Yu wrote: > On 2022/3/2 13:26, Jaegeuk Kim
 wrote: > > On 03/02, Chao Yu wrote: > > > ping, > > > > > > On 2022/2/25 11:02,
 Chao Yu wrote: > > > > On 2022/2/3 22:57, Chao Yu wrote: > > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nPUuY-0002D7-8I
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to avoid potential deadlock
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
Cc: linux-kernel@vger.kernel.org, Jing Xia <jing.xia@unisoc.com>,
 Zhiguo Niu <zhiguo.niu@unisoc.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/02, Chao Yu wrote:
> On 2022/3/2 13:26, Jaegeuk Kim wrote:
> > On 03/02, Chao Yu wrote:
> > > ping,
> > > =

> > > On 2022/2/25 11:02, Chao Yu wrote:
> > > > On 2022/2/3 22:57, Chao Yu wrote:
> > > > > On 2022/2/3 9:51, Jaegeuk Kim wrote:
> > > > > > On 01/29, Chao Yu wrote:
> > > > > > > On 2022/1/29 8:37, Jaegeuk Kim wrote:
> > > > > > > > On 01/28, Chao Yu wrote:
> > > > > > > > > On 2022/1/28 5:59, Jaegeuk Kim wrote:
> > > > > > > > > > On 01/27, Chao Yu wrote:
> > > > > > > > > > > Quoted from Jing Xia's report, there is a potential d=
eadlock may happen
> > > > > > > > > > > between kworker and checkpoint as below:
> > > > > > > > > > > =

> > > > > > > > > > > [T:writeback]=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 [T:checkpoint]
> > > > > > > > > > > - wb_writeback
> > > > > > > > > > >  =A0=A0=A0 - blk_start_plug
> > > > > > > > > > > bio contains NodeA was plugged in writeback threads
> > > > > > > > > > =

> > > > > > > > > > I'm still trying to understand more precisely. So, how =
is it possible to
> > > > > > > > > > have bio having node write in this current context?
> > > > > > > > > =

> > > > > > > > > IMO, after above blk_start_plug(), it may plug some inode=
's node page in kworker
> > > > > > > > > during writebacking node_inode's data page (which should =
be node page)?
> > > > > > > > =

> > > > > > > > Wasn't that added into a different task->plug?
> > > > > > > =

> > > > > > > I'm not sure I've got your concern correctly...
> > > > > > > =

> > > > > > > Do you mean NodeA and other IOs from do_writepages() were plu=
gged in
> > > > > > > different local plug variables?
> > > > > > =

> > > > > > I think so.
> > > > > =

> > > > > I guess block plug helper says it doesn't allow to use nested plu=
g, so there
> > > > > is only one plug in kworker thread?
> > =

> > Is there only one kworker thread that flushes node and inode pages?
> =

> IIRC, =3Done kworker per block device?

If there's one kworker only, f2fs_write_node_pages() should have flushed its
plug?

> =

> Thanks,
> =

> > =

> > > > > =

> > > > > void blk_start_plug_nr_ios(struct blk_plug *plug, unsigned short =
nr_ios)
> > > > > {
> > > > >  =A0=A0=A0=A0=A0struct task_struct *tsk =3D current;
> > > > > =

> > > > >  =A0=A0=A0=A0=A0/*
> > > > >  =A0=A0=A0=A0=A0 * If this is a nested plug, don't actually assig=
n it.
> > > > >  =A0=A0=A0=A0=A0 */
> > > > >  =A0=A0=A0=A0=A0if (tsk->plug)
> > > > >  =A0=A0=A0=A0=A0=A0=A0=A0 return;
> > > > > ...
> > > > > }
> > > > =

> > > > Any further comments?
> > > > =

> > > > Thanks,
> > > > =

> > > > > =

> > > > > Thanks,
> > > > > =

> > > > > > =

> > > > > > > =

> > > > > > > Thanks,
> > > > > > > =

> > > > > > > > =

> > > > > > > > > =

> > > > > > > > > Thanks,
> > > > > > > > > =

> > > > > > > > > > =

> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0 - do_writepages=A0 -- sync write inodeB, inc wb_sync_req[DATA]
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0 - f2fs_write_data_pages
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0 - f2fs_write_single_data_page -- write last dirty page
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 - f2fs_do_write_data_page
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 - set_page_writeback=A0 -- clear page dirty flag and
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 PAGECACHE_TAG_DIRTY tag in radix tree
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0 - f2fs_outplace_write_data
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0 - f2fs_update_data_blkaddr
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0 - f2fs_wait_on_page_writeback -- wait NodeA to wri=
teback here
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 - inode_dec_dirty_pages
> > > > > > > > > > >  =A0=A0=A0 - writeback_sb_inodes
> > > > > > > > > > >  =A0=A0=A0=A0 - writeback_single_inode
> > > > > > > > > > >  =A0=A0=A0=A0=A0 - do_writepages
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0 - f2fs_write_data_pages -- skip w=
ritepages due to wb_sync_req[DATA]
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 - wbc->pages_skipped +=3D get_=
dirty_pages() -- PAGECACHE_TAG_DIRTY is not set but get_dirty_pages() retur=
ns one
> > > > > > > > > > >  =A0=A0=A0=A0 - requeue_inode -- requeue inode to wb-=
>b_dirty queue due to non-zero.pages_skipped
> > > > > > > > > > >  =A0=A0=A0 - blk_finish_plug
> > > > > > > > > > > =

> > > > > > > > > > > Let's try to avoid deadlock condition by forcing unpl=
ugging previous bio via
> > > > > > > > > > > blk_finish_plug(current->plug) once we'v skipped writ=
eback in writepages()
> > > > > > > > > > > due to valid sbi->wb_sync_req[DATA/NODE].
> > > > > > > > > > > =

> > > > > > > > > > > Fixes: 687de7f1010c ("f2fs: avoid IO split due to mix=
ed WB_SYNC_ALL and WB_SYNC_NONE")
> > > > > > > > > > > Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
> > > > > > > > > > > Signed-off-by: Jing Xia <jing.xia@unisoc.com>
> > > > > > > > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > > > > > > > ---
> > > > > > > > > > >  =A0=A0=A0 fs/f2fs/data.c | 6 +++++-
> > > > > > > > > > >  =A0=A0=A0 fs/f2fs/node.c | 6 +++++-
> > > > > > > > > > >  =A0=A0=A0 2 files changed, 10 insertions(+), 2 delet=
ions(-)
> > > > > > > > > > > =

> > > > > > > > > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > > > > > > > > index 76d6fe7b0c8f..932a4c81acaf 100644
> > > > > > > > > > > --- a/fs/f2fs/data.c
> > > > > > > > > > > +++ b/fs/f2fs/data.c
> > > > > > > > > > > @@ -3174,8 +3174,12 @@ static int __f2fs_write_data_p=
ages(struct address_space *mapping,
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 /* to avoid spliting IOs due t=
o mixed WB_SYNC_ALL and WB_SYNC_NONE */
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 if (wbc->sync_mode =3D=3D WB_S=
YNC_ALL)
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 atomic_inc(&sbi->w=
b_sync_req[DATA]);
> > > > > > > > > > > -=A0=A0=A0 else if (atomic_read(&sbi->wb_sync_req[DAT=
A]))
> > > > > > > > > > > +=A0=A0=A0 else if (atomic_read(&sbi->wb_sync_req[DAT=
A])) {
> > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 /* to avoid potential deadlock=
 */
> > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (current->plug)
> > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 blk_finish_plug(cu=
rrent->plug);
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto skip_write;
> > > > > > > > > > > +=A0=A0=A0 }
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 if (__should_serialize_io(inod=
e, wbc)) {
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 mutex_lock(&sbi->w=
ritepages);
> > > > > > > > > > > diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
> > > > > > > > > > > index 556fcd8457f3..69c6bcaf5aae 100644
> > > > > > > > > > > --- a/fs/f2fs/node.c
> > > > > > > > > > > +++ b/fs/f2fs/node.c
> > > > > > > > > > > @@ -2106,8 +2106,12 @@ static int f2fs_write_node_pag=
es(struct address_space *mapping,
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 if (wbc->sync_mode =3D=3D WB_S=
YNC_ALL)
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 atomic_inc(&sbi->w=
b_sync_req[NODE]);
> > > > > > > > > > > -=A0=A0=A0 else if (atomic_read(&sbi->wb_sync_req[NOD=
E]))
> > > > > > > > > > > +=A0=A0=A0 else if (atomic_read(&sbi->wb_sync_req[NOD=
E])) {
> > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 /* to avoid potential deadlock=
 */
> > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0 if (current->plug)
> > > > > > > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 blk_finish_plug(cu=
rrent->plug);
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 goto skip_write;
> > > > > > > > > > > +=A0=A0=A0 }
> > > > > > > > > > >  =A0=A0=A0=A0=A0=A0=A0 trace_f2fs_writepages(mapping-=
>host, wbc, NODE);
> > > > > > > > > > > -- =

> > > > > > > > > > > 2.32.0
> > > > > =

> > > > > =

> > > > > _______________________________________________
> > > > > Linux-f2fs-devel mailing list
> > > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > =

> > > > =

> > > > _______________________________________________
> > > > Linux-f2fs-devel mailing list
> > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
