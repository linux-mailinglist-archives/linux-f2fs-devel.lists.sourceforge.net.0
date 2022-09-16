Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9AA5BB203
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Sep 2022 20:21:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oZFxw-0000U6-Iw;
	Fri, 16 Sep 2022 18:21:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1oZFxv-0000U0-BG
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Sep 2022 18:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fIH4HCpzV0laRitUSMuYPq4sWYTcEKokRLxc6URwsH8=; b=bONRmS4mM8IVUiQLkwyN1S5l0Z
 zJs2JtthjAYyQfpF+zZDK6hkdB6jIHQ0QtFl48Z4Hi25/NOiNd0Di8yDKJsMu8bB96MzKtznEZIcy
 P4/tEZYvimuBiYGNOGii6I72/2gYP69Zj4UR5aLAO+KQXSlQj51P0ghoWsZo8Bhj86RA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fIH4HCpzV0laRitUSMuYPq4sWYTcEKokRLxc6URwsH8=; b=ZUO/khlGjHulQiSWnEA2BUtuM6
 fAzeGP878pHeRzNpHXTwsezhhKEyvnuOhJjFpytzRl+f+GGh0f5B6DqdRQdma9ZKUIQGnVB6cQgxD
 8E7YvVuFX6V32X7RobfPMEuzaCoGE5pZpd780wU79hGSTX0YBjhtYgX4q4o5K8oHmaOg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oZFy5-0007Nw-Ca for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Sep 2022 18:21:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 47447B828DE;
 Fri, 16 Sep 2022 18:21:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8DF5C433C1;
 Fri, 16 Sep 2022 18:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663352484;
 bh=QSRaazKnpcvj8AxVHtAgH0r/tpYN7JP98ko1Eco340g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SYClVRLMluzxvlhl+T6Z19t/cHoFOz/nTO/jP1ibjBU/p3HOaNZsj9TJPklk+t7K4
 TrMbeMfHm7rACu5nSrHWVP1HEgAf29EdqUinVTlJSfKmeHIeRyQAMON6sVCbB6FFuz
 vTPugeEestxXSFdH3A9UCJqdaf8VuFjTc3jRNaqzOLnqHPdrGcQhmnmagVNSto9BER
 rDlUrP8I2K3T9hPMHvU1ib4/U4evB544YMdY6SlLgZUDeBORhSgM3EZB3sKozccx8X
 ekFBviH9LQCh8gVSb9SKF4F0dE9yiGOG7O2BKhBCYQewlIeRE9/+eABCSP/34zXcV4
 5KHFQtc2Nu0EA==
Date: Fri, 16 Sep 2022 11:21:22 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YyS+otPNtdnztfao@google.com>
References: <20220908105334.98572-1-chao@kernel.org>
 <Yx9SVsxVzNErMDpv@google.com>
 <a03417f6-e4fa-2b1a-34f8-bd5d52c1e853@kernel.org>
 <YyAdapWpgTIXa2R5@google.com>
 <c29df38b-18d7-506b-59a1-d471f2769667@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c29df38b-18d7-506b-59a1-d471f2769667@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 09/14, Chao Yu wrote: > On 2022/9/13 14:04, Jaegeuk Kim
 wrote: > > On 09/13, Chao Yu wrote: > > > On 2022/9/12 23:37, Jaegeuk Kim
 wrote: > > > > On 09/08, Chao Yu wrote: > > > > > Sometimes we can [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oZFy5-0007Nw-Ca
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to detect obsolete inner inode
 during fill_super()
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
Cc: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/14, Chao Yu wrote:
> On 2022/9/13 14:04, Jaegeuk Kim wrote:
> > On 09/13, Chao Yu wrote:
> > > On 2022/9/12 23:37, Jaegeuk Kim wrote:
> > > > On 09/08, Chao Yu wrote:
> > > > > Sometimes we can get a cached meta_inode which has no aops yet. Let's set it
> > > > > all the time to fix the below panic.
> > > > > 
> > > > > Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> > > > > Mem abort info:
> > > > >     ESR = 0x0000000086000004
> > > > >     EC = 0x21: IABT (current EL), IL = 32 bits
> > > > >     SET = 0, FnV = 0
> > > > >     EA = 0, S1PTW = 0
> > > > >     FSC = 0x04: level 0 translation fault
> > > > > user pgtable: 4k pages, 48-bit VAs, pgdp=0000000109ee4000
> > > > > [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
> > > > > Internal error: Oops: 86000004 [#1] PREEMPT SMP
> > > > > Modules linked in:
> > > > > CPU: 1 PID: 3045 Comm: syz-executor330 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
> > > > > Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
> > > > > pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> > > > > pc : 0x0
> > > > > lr : folio_mark_dirty+0xbc/0x208 mm/page-writeback.c:2748
> > > > > sp : ffff800012783970
> > > > > x29: ffff800012783970 x28: 0000000000000000 x27: ffff800012783b08
> > > > > x26: 0000000000000001 x25: 0000000000000400 x24: 0000000000000001
> > > > > x23: ffff0000c736e000 x22: 0000000000000045 x21: 05ffc00000000015
> > > > > x20: ffff0000ca7403b8 x19: fffffc00032ec600 x18: 0000000000000181
> > > > > x17: ffff80000c04d6bc x16: ffff80000dbb8658 x15: 0000000000000000
> > > > > x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
> > > > > x11: ff808000083e9814 x10: 0000000000000000 x9 : ffff8000083e9814
> > > > > x8 : 0000000000000000 x7 : 0000000000000000 x6 : 0000000000000000
> > > > > x5 : ffff0000cbb19000 x4 : ffff0000cb3d2000 x3 : ffff0000cbb18f80
> > > > > x2 : fffffffffffffff0 x1 : fffffc00032ec600 x0 : ffff0000ca7403b8
> > > > > Call trace:
> > > > >    0x0
> > > > >    set_page_dirty+0x38/0xbc mm/folio-compat.c:62
> > > > >    f2fs_update_meta_page+0x80/0xa8 fs/f2fs/segment.c:2369
> > > > >    do_checkpoint+0x794/0xea8 fs/f2fs/checkpoint.c:1522
> > > > >    f2fs_write_checkpoint+0x3b8/0x568 fs/f2fs/checkpoint.c:1679
> > > > > 
> > > > > The root cause is, quoted from Jaegeuk:
> > > > > 
> > > > > It turned out there is a bug in reiserfs which doesn't free the root
> > > > > inode (ino=2). That leads f2fs to find an ino=2 with the previous
> > > > > superblock point used by reiserfs. That stale inode has no valid
> > > > > mapping that f2fs can use, result in kernel panic.
> > > > > 
> > > > > This patch adds sanity check in f2fs_iget() to avoid finding stale
> > > > > inode during inner inode initialization.
> > > > > 
> > > > > Cc: stable@vger.kernel.org
> > > > > Reported-by: syzbot+775a3440817f74fddb8c@syzkaller.appspotmail.com
> > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > ---
> > > > >    fs/f2fs/inode.c | 11 +++++++++++
> > > > >    1 file changed, 11 insertions(+)
> > > > > 
> > > > > diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
> > > > > index ccb29034af59..df1a82fbfaf2 100644
> > > > > --- a/fs/f2fs/inode.c
> > > > > +++ b/fs/f2fs/inode.c
> > > > > @@ -493,6 +493,17 @@ struct inode *f2fs_iget_inner(struct super_block *sb, unsigned long ino)
> > > > >    	struct inode *inode;
> > > > >    	int ret = 0;
> > > > > +	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi) ||
> > > > > +					ino == F2FS_COMPRESS_INO(sbi)) {
> > > > > +		inode = ilookup(sb, ino);
> > > > > +		if (inode) {
> > > > > +			iput(inode);
> > > > > +			f2fs_err(sbi, "there is obsoleted inner inode %lu cached in hash table",
> > > > > +					ino);
> > > > > +			return ERR_PTR(-EFSCORRUPTED);
> > > > 
> > > > Well, this does not indicate f2fs is corrupted. I'd rather expect to fix
> > > > reiserfs instead of f2fs workaround which hides the bug.
> > > 
> > > Well, is there a fixing patch for reiserfs? If not, how about applying this
> > > patch first, later, we can revert it after reiserfs has been fixed.
> > 
> > I don't feel this is a right way to deal with that. If we think it'd be worth
> > checking any stale inode object during f2fs_fill_super, we'd better check any
> > cached inode given superblock pointer rather than our inner inodes only.
> 
> Well, something like this?

Any chance to get a better way?

> 
> f2fs_fill_super()
> 
> 	for (ino = root_ino; ino < max_nid; ino++) {
> 		inode = iget_locked(sb, ino);
> 		if (!inode)
> 			continue;
> 		iput(inode);
> 		ret = -EFSCORRUPTED;
> 		goto error_handling;
> 	}
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > +		}
> > > > > +	}
> > > > > +
> > > > >    	inode = iget_locked(sb, ino);
> > > > >    	if (!inode)
> > > > >    		return ERR_PTR(-ENOMEM);
> > > > > -- 
> > > > > 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
