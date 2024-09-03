Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2F296A9F6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 23:20:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slawq-0001NZ-Vt;
	Tue, 03 Sep 2024 21:20:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1slawo-0001NK-Rp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 21:20:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VLfKLG/hmapCFEAMSQy4syA3y6h7KDPdgItryksUnmQ=; b=fn0dIIv04DiSQo2yEjMuphOU15
 xq+q0Z+d8p75QGC4s3MG8Xb2GvAfQIqSXgSZC9RIGHPZQwGWzbPOnqMOOh0WQPPCb+sjvF/Entfzm
 lliF1aLPNUR8YPAVWVecqXFawsk3JLGbQCA5/iqHYxtq1jUagv7Y3XBBwaCnfBxUvV/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VLfKLG/hmapCFEAMSQy4syA3y6h7KDPdgItryksUnmQ=; b=guvddBVTg39nIn/xUKJQ6aoIEt
 SeIqwBpXFmz4ca/1f4tW/zqyeKXAReRI4l2br33+8ljA/0oMKGMSvyfyG89ULIplW4EdUsQnJUDJ/
 VUtiOMDFTj0ukQei9EbPqAJ1vIDPNCoiNhLiBF9g16Cpxtx2HBZBYXeALauPgxDeFnjA=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slawn-0003QS-OH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 21:20:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DBD25A43E71;
 Tue,  3 Sep 2024 21:20:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79269C4CEC4;
 Tue,  3 Sep 2024 21:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1725398410;
 bh=7PR1onCvY9iwE5xcIi2zi5rBXO7y/z3Wy0kK1IlVAcc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sfWC6aO9FmwQTIdAaLOJb4FED/z5uWjdMAYRw5UNmKcfK+Q9o5xLJNp7Vj6D+70Ep
 /RwR2H/45N0+lu4KDz67dB+e26PWCtgjqzoqEXA/cQAK2FvC3iRCu/E+9HYxQksGmF
 xOHPe9NGwWv6L1pbzsFZclM19EOEZ/mkYlpUEbffm3Yu0xfQVvskdkt8Y0vm8DZP/r
 4wAkbLnLfmsgkHIKKxCn+qGINQb/B+IrUsm1WmZ9Xnw3FBQbk3jzGIHWcUrn30AO0E
 sqTY8ONvnQ/WcdlwiVhXcU6qqx8F3P4rIYFDaZ9B02sOSwwAVGv3PkL9l7HWhOkN3r
 0T/Yj3TeD4qvA==
Date: Tue, 3 Sep 2024 21:20:08 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Ztd9iJI4ubmpc0_T@google.com>
References: <20240828165425.324845-1-sunjunchao2870@gmail.com>
 <0f1e5069-7ff0-4d5f-8a3a-3806c8d21487@kernel.org>
 <8edbc0b87074fb9adcccb8b67032dc3a693c9bfa.camel@gmail.com>
 <b20810a7-e8b3-4478-9805-624a33d70b09@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b20810a7-e8b3-4478-9805-624a33d70b09@kernel.org>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/03, Chao Yu wrote: > On 2024/9/2 21:01,
 Julian Sun wrote:
 > > On Mon, 2024-09-02 at 16:13 +0800, Chao Yu wrote: > > > > On 2024/8/29
 0:54, Julian Sun wrote: > > > > > > Hi, all. > > > > > > > > [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1slawn-0003QS-OH
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Do not check the FI_DIRTY_INODE
 flag when umounting a ro fs.
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Julian Sun <sunjunchao2870@gmail.com>,
 syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/03, Chao Yu wrote:
> On 2024/9/2 21:01, Julian Sun wrote:
> > On Mon, 2024-09-02 at 16:13 +0800, Chao Yu wrote:
> > > > On 2024/8/29 0:54, Julian Sun wrote:
> > > > > > Hi, all.
> > > > > > =

> > > > > > Recently syzbot reported a bug as following:
> > > > > > =

> > > > > > kernel BUG at fs/f2fs/inode.c:896!
> > > > > > CPU: 1 UID: 0 PID: 5217 Comm: syz-executor605 Not tainted
> > > > > > 6.11.0-rc4-syzkaller-00033-g872cf28b8df9 #0
> > > > > > RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
> > > > > > Call Trace:
> > > > > >  =A0 <TASK>
> > > > > >  =A0 evict+0x532/0x950 fs/inode.c:704
> > > > > >  =A0 dispose_list fs/inode.c:747 [inline]
> > > > > >  =A0 evict_inodes+0x5f9/0x690 fs/inode.c:797
> > > > > >  =A0 generic_shutdown_super+0x9d/0x2d0 fs/super.c:627
> > > > > >  =A0 kill_block_super+0x44/0x90 fs/super.c:1696
> > > > > >  =A0 kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4898
> > > > > >  =A0 deactivate_locked_super+0xc4/0x130 fs/super.c:473
> > > > > >  =A0 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
> > > > > >  =A0 task_work_run+0x24f/0x310 kernel/task_work.c:228
> > > > > >  =A0 ptrace_notify+0x2d2/0x380 kernel/signal.c:2402
> > > > > >  =A0 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
> > > > > >  =A0 ptrace_report_syscall_exit include/linux/ptrace.h:477
> > > > > > [inline]
> > > > > >  =A0 syscall_exit_work+0xc6/0x190 kernel/entry/common.c:173
> > > > > >  =A0 syscall_exit_to_user_mode_prepare kernel/entry/common.c:200
> > > > > > [inline]
> > > > > >  =A0 __syscall_exit_to_user_mode_work kernel/entry/common.c:205
> > > > > > [inline]
> > > > > >  =A0 syscall_exit_to_user_mode+0x279/0x370
> > > > > > kernel/entry/common.c:218
> > > > > >  =A0 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
> > > > > >  =A0 entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > > > > > =

> > > > > > The syzbot constructed the following scenario: concurrently
> > > > > > creating directories and setting the file system to read-only.
> > > > > > In this case, while f2fs was making dir, the filesystem
> > > > > > switched to
> > > > > > readonly, and when it tried to clear the dirty flag, it
> > > > > > triggered
> =

> Go back to the root cause, I have no idea why it can leave dirty inode
> while mkdir races w/ readonly remount, due to the two operations should
> be exclusive, IIUC.

Wait, we can think of writable disk mounted as fs-readonly. In that case,
IIRC, we allow to recover files/data by roll-forward and so on, which can
make some dirty inodes. Can we check if there's any missing path which does
not flush dirty inode?

> =

> - mkdir
>  - do_mkdirat
>   - filename_create
>    - mnt_want_write
>     - mnt_get_write_access
> 				- mount
> 				 - do_remount
> 				  - reconfigure_super
> 				   - sb_prepare_remount_readonly
> 				    - mnt_hold_writers
>   - vfs_mkdir
>    - f2fs_mkdir
> =

> But when I try to reproduce this bug w/ reproducer provided by syzbot,
> I have found a clue in the log:
> =

> "skip recovering inline_dots inode..."
> =

> So I doubt the root cause is __recover_dot_dentries() in f2fs_lookup()
> generates dirty data/meta, in this path, we will not grab related lock
> to exclude readonly remount.
> =

> Let me try to verify below patch:
> =

> https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git/commit/?h=
=3Dwip&id=3D69dc8fbbbb39f85f9f436ca562c98afbcc2a48d2
> =

> Thanks,
> =

> > > > > > this
> > > > > > code path: f2fs_mkdir()-> f2fs_sync_fs()-
> > > > > > > f2fs_write_checkpoint()
> > > > > > ->f2fs_readonly(). This resulted FI_DIRTY_INODE flag not being
> > > > > > cleared,
> > > > > > which eventually led to a bug being triggered during the
> > > > > > FI_DIRTY_INODE
> > > > > > check in f2fs_evict_inode().
> > > > > > =

> > > > > > In this case, we cannot do anything further, so if filesystem
> > > > > > is
> > > > > > readonly,
> > > > > > do not trigger the BUG. Instead, clean up resources to the best
> > > > > > of
> > > > > > our
> > > > > > ability to prevent triggering subsequent resource leak checks.
> > > > > > =

> > > > > > If there is anything important I'm missing, please let me know,
> > > > > > thanks.
> > > > > > =

> > > > > > Reported-by:
> > > > > > syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com
> > > > > > Closes:
> > > > > > https://syzkaller.appspot.com/bug?extid=3Debea2790904673d7c618
> > > > > > Fixes: ca7d802a7d8e ("f2fs: detect dirty inode in evict_inode")
> > > > > > CC: stable@vger.kernel.org
> > > > > > Signed-off-by: Julian Sun <sunjunchao2870@gmail.com>
> > > > > > ---
> > > > > >  =A0 fs/f2fs/inode.c | 3 ++-
> > > > > >  =A0 1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > > =

> > > > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > > > index aef57172014f..ebf825dba0a5 100644
> > > > > > --- a/fs/f2fs/inode.c
> > > > > > +++ b/fs/f2fs/inode.c
> > > > > > @@ -892,7 +892,8 @@ void f2fs_evict_inode(struct inode *inode)
> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0atomic_read(&fi->i_compr_blocks));
> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0if (likely(!f2fs_cp_error(sbi) &&
> > > > > > -=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0!is_sbi_flag_set(sbi,
> > > > > > SBI_CP_DISABLED)))
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0!is_sbi_flag_set(sbi,
> > > > > > SBI_CP_DISABLED)) &&
> > > > > > +=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0!f2fs_readonly(sbi->sb))
> > > > =

> > > > Is it fine to drop this dirty inode? Since once it remounts f2fs as
> > > > rw one,
> > > > previous updates on such inode may be lost? Or am I missing
> > > > something?
> > =

> > The purpose of calling this here is mainly to avoid triggering the
> > f2fs_bug_on(sbi, 1); statement in the subsequent f2fs_put_super() due
> > to a reference count check failure.
> > I would say it's possible, but there doesn't seem to be much more we
> > can do in this scenario: the inode is about to be freed, and the file
> > system is read-only. Or do we need a mechanism to save the inode that
> > is about to be freed and then write it back to disk at the appropriate
> > time after the file system becomes rw again? But such a mechanism
> > sounds somewhat complex and a little bit of weird... Do you have any
> > suggestions?
> =

> =

> =

> =

> > > > =

> > > > Thanks,
> > > > =

> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f2fs_bug_on(sb=
i, is_inode_flag_set(inode,
> > > > > > FI_DIRTY_INODE));
> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0else
> > > > > >  =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0f2fs_inode_syn=
ced(inode);
> > > > =

> > =

> > =

> > Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
