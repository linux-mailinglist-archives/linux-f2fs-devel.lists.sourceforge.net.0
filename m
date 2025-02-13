Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A69A34C1C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Feb 2025 18:38:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tidAP-0006jV-Rr;
	Thu, 13 Feb 2025 17:38:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tidAO-0006jE-7P
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 17:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOtf/Hhkb9f7FJxVZHBvn/qpDIzRA3fvICaWQNtZZFU=; b=dh+7DvqRhmMeVnCFvbBZkKEHP3
 UiCa5msWjb56HUbqfB2rSfakix9rAX96k8jOa5xExzTEc5n8IhdWpw3/6Prujhu8EFp38XIZf3F5C
 mwzwvptHFuAtLVytG5TRQ5PE3aniotN48wA5ie5pFZFZzRNLHNkF4fA13wxzZat2BAHw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IOtf/Hhkb9f7FJxVZHBvn/qpDIzRA3fvICaWQNtZZFU=; b=m5bCaqzc5Gc/iqL6/8BtADzYzC
 b2qHv8SbtAcPhO8ZP2L6MY65R1pZ0tj+wk+TdP4Vr9+qKLSgRWJ8MiOwPkFlGAcfXaIAmvA6uYwMP
 PCOHABwfsIujZo2l5dXMoaariEVisNqc0Lo48W6wzL/0TrCSY7O00T/3OkMsh1rE8fzc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tidAO-0007VE-8z for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Feb 2025 17:38:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 68A6C5C588C;
 Thu, 13 Feb 2025 17:37:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63394C4CED1;
 Thu, 13 Feb 2025 17:38:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739468293;
 bh=cnxfUNBbqbYlLFA77nUvaz5wzyMXDOOF13HQXlveTa4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BfYkO0oewUevWKucBYARTUfa0Kqd5b/FbOe7lZX+v3FSgghhfG3Xg+iNZ5NHpVumJ
 q/7oc61C6TecC+yOKTEeZWhQ1zLPrNs4UmvuJqJJuoNU01Z1Az2oS89jIV3SGyHjHy
 PeiWg6T0e+SSxPZtcZhSn2yEQ4m84HCTR/d8v0Te7dXM99AGTNCEFWNXjqFyy0kdkz
 e32oyonqTncA7Q49M4Op7Rao6izadgNcINpHj/VySJrVcy71Ah0iFKmqA5q462l51f
 FH9qNNf3x1A8K+N7FZDyYennNRWhQudwj66QhkKh6XKYHleSgePzeQeOeSvrNkFaag
 srLdi3HKuKxJg==
Date: Thu, 13 Feb 2025 17:38:11 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <Z64uA2ys4nhV54lI@google.com>
References: <20250212072742.977248-1-chao@kernel.org>
 <Z6zQoyNp5td-Wgd1@google.com>
 <d8be79a2-9470-45b7-9df1-b571f2219c30@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d8be79a2-9470-45b7-9df1-b571f2219c30@kernel.org>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 02/13, Chao Yu wrote: > On 2/13/25 00:47,
 Jaegeuk Kim wrote:
 > > On 02/12, Chao Yu wrote: > >> From: Leo Stone <leocstone@gmail.com> >
 >> > >> The syzbot reproducer mounts a f2fs image, then tries [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tidAO-0007VE-8z
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add check for deleted inode
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
Cc: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, Leo Stone <leocstone@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 02/13, Chao Yu wrote:
> On 2/13/25 00:47, Jaegeuk Kim wrote:
> > On 02/12, Chao Yu wrote:
> >> From: Leo Stone <leocstone@gmail.com>
> >>
> >> The syzbot reproducer mounts a f2fs image, then tries to unlink an
> >> existing file. However, the unlinked file already has a link count of 0
> >> when it is read for the first time in do_read_inode().
> >>
> >> Add a check to sanity_check_inode() for i_nlink == 0.
> >>
> >> [Chao Yu: rebase the code and fix orphan inode recovery issue]
> >> Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
> >> Closes: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
> >> Fixes: 39a53e0ce0df ("f2fs: add superblock and major in-memory structure")
> >> Signed-off-by: Leo Stone <leocstone@gmail.com>
> >> Signed-off-by: Chao Yu <chao@kernel.org>
> >> ---
> >>  fs/f2fs/checkpoint.c | 4 ++++
> >>  fs/f2fs/f2fs.h       | 1 +
> >>  fs/f2fs/inode.c      | 6 ++++++
> >>  3 files changed, 11 insertions(+)
> >>
> >> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> >> index bd890738b94d..ada2c548645c 100644
> >> --- a/fs/f2fs/checkpoint.c
> >> +++ b/fs/f2fs/checkpoint.c
> >> @@ -751,6 +751,8 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
> >>  	if (is_sbi_flag_set(sbi, SBI_IS_WRITABLE))
> >>  		f2fs_info(sbi, "orphan cleanup on readonly fs");
> >>  
> >> +	set_sbi_flag(sbi, SBI_ORPHAN_RECOVERY);
> > 
> > What about using SBI_POR_DOING?
> 
> SBI_POR_DOING will cover most flow of f2fs_fill_super(), I think we can add a
> separated flag just covering f2fs_recover_orphan_inodes(), so that we can allow
> iget() of root_inode and all inodes during roll-forward recovery to do sanity
> check nlink w/ zero. What do you think?

Can we do this sanity check after f2fs_iget in the f2fs_unlink() only?

> 
> Thanks,
> 
> > 
> >> +
> >>  	start_blk = __start_cp_addr(sbi) + 1 + __cp_payload(sbi);
> >>  	orphan_blocks = __start_sum_addr(sbi) - 1 - __cp_payload(sbi);
> >>  
> >> @@ -778,9 +780,11 @@ int f2fs_recover_orphan_inodes(struct f2fs_sb_info *sbi)
> >>  		}
> >>  		f2fs_put_page(page, 1);
> >>  	}
> >> +
> >>  	/* clear Orphan Flag */
> >>  	clear_ckpt_flags(sbi, CP_ORPHAN_PRESENT_FLAG);
> >>  out:
> >> +	clear_sbi_flag(sbi, SBI_ORPHAN_RECOVERY);
> >>  	set_sbi_flag(sbi, SBI_IS_RECOVERED);
> >>  
> >>  	return err;
> >> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> >> index 05879c6dc4d6..1c75081c0c14 100644
> >> --- a/fs/f2fs/f2fs.h
> >> +++ b/fs/f2fs/f2fs.h
> >> @@ -1322,6 +1322,7 @@ enum {
> >>  	SBI_IS_CLOSE,				/* specify unmounting */
> >>  	SBI_NEED_FSCK,				/* need fsck.f2fs to fix */
> >>  	SBI_POR_DOING,				/* recovery is doing or not */
> >> +	SBI_ORPHAN_RECOVERY,			/* orphan inodes recovery is doing */
> >>  	SBI_NEED_SB_WRITE,			/* need to recover superblock */
> >>  	SBI_NEED_CP,				/* need to checkpoint */
> >>  	SBI_IS_SHUTDOWN,			/* shutdown by ioctl */
> >> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> >> index d6ad7810df69..02f1b69d03d8 100644
> >> --- a/fs/f2fs/inode.c
> >> +++ b/fs/f2fs/inode.c
> >> @@ -386,6 +386,12 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
> >>  		}
> >>  	}
> >>  
> >> +	if (inode->i_nlink == 0 && !is_sbi_flag_set(sbi, SBI_ORPHAN_RECOVERY)) {
> >> +		f2fs_warn(sbi, "%s: inode (ino=%lx) has a link count of 0",
> >> +			  __func__, inode->i_ino);
> >> +		return false;
> >> +	}
> >> +
> >>  	return true;
> >>  }
> >>  
> >> -- 
> >> 2.48.1.502.g6dc24dfdaf-goog


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
