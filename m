Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBB32A2EFA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Nov 2020 17:04:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZcJx-0002ZX-S7; Mon, 02 Nov 2020 16:04:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1kZcJu-0002Z1-N0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 16:04:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=440LF7n2Bf9HGEn3kO8yspecT4kUp4QBErKhhPYrnt4=; b=YR1Nx47Uvc6JTAJnYVDiVs+SmG
 YGtVtpJoHv5AQ+MMVMMC0gny1fGM2R+TWJWYCphOE2cSuWlk06NyGGD7DmVv25Fzz2kEysmc0TEgH
 2CMF6hsCyw+o6092JFTsQMqhdjIG+OSuESzTAN9Od4EbkZz+3w8bbUB5a4fgbu9CGFGY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=440LF7n2Bf9HGEn3kO8yspecT4kUp4QBErKhhPYrnt4=; b=eV+C9y5kpxVymyXRO4AmZ+emYe
 gsNjt0aJnSkjMJ6DwORD7b5z8AWJV+4UBVoTMwchsGEN18PNUdW2ttiIo4XWpzDwf4YhpiPprwIy4
 Ospn2vOlDa3erDxs5d/o793wqrkbI+K6HYtd6hhe4/3/1X1RtbNN0cPdSdri0+fZhnmg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kZcJi-006ZCD-J0
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Nov 2020 16:04:34 +0000
Received: from google.com (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E7CA722258;
 Mon,  2 Nov 2020 16:04:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604333057;
 bh=tVohfFBTtH9c03mxq87KcS+M4OoWC2fUgilvtZakins=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l84mpCESr4G+w08fzQoi94q5qzvapz8SfypsWyim6lX5mdEMRvYPJQljIjZ9VHbrm
 RM//Ggdrr1iBHQot6sxecTjI3X12XlICjRvaQJNdJaH+pCIMyD3dmqit4zSGG4ponx
 vRdBUGVEbf1atunVZ5wahs0iH+vDnAq9u7VpEmfs=
Date: Mon, 2 Nov 2020 08:04:15 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20201102160415.GA529594@google.com>
References: <20200407100107.4356-1-yuchao0@huawei.com>
 <20200407100107.4356-2-yuchao0@huawei.com>
 <20201031234848.GC936@sol.localdomain>
 <95ba132f-0dc0-d391-26b4-68eef132f931@huawei.com>
 <20201102023922.GA1419858@sol.localdomain>
 <951032c7-0419-921e-876c-8c8e5c59c52a@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <951032c7-0419-921e-876c-8c8e5c59c52a@huawei.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kZcJi-006ZCD-J0
Subject: Re: [f2fs-dev] [PATCH 2/2] fsck.f2fs: fix to check validation of
 i_xattr_nid
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
Cc: Eric Biggers <ebiggers@kernel.org>, kilobyte@angband.pl,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/02, Chao Yu wrote:
> On 2020/11/2 10:39, Eric Biggers wrote:
> > On Mon, Nov 02, 2020 at 09:31:09AM +0800, Chao Yu wrote:
> > > On 2020/11/1 7:48, Eric Biggers wrote:
> > > > Hi Chao,
> > > > 
> > > > On Tue, Apr 07, 2020 at 06:01:07PM +0800, Chao Yu wrote:
> > > > > Otherwise, fsck.f2fs will access invalid memory address as below:
> > > > > 
> > > > > - fsck_verify
> > > > >    - dump_node
> > > > >     - dump_file
> > > > >      - dump_inode_blk
> > > > >       - dump_xattr
> > > > >        - read_all_xattrs
> > > > >          - get_node_info
> > > > >           access &(F2FS_FSCK(sbi)->entries[nid])
> > > > > 
> > > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > > ---
> > > > >    fsck/dump.c  |  2 ++
> > > > >    fsck/fsck.c  |  8 ++++++++
> > > > >    fsck/fsck.h  |  3 +++
> > > > >    fsck/mount.c |  8 +++++---
> > > > >    fsck/xattr.c | 20 ++++++++++++++++++--
> > > > >    5 files changed, 36 insertions(+), 5 deletions(-)
> > > > > 
> > > > 
> > > > This commit caused a regression where 'dump.f2fs -i <inode> <device>'
> > > > now segfaults if the inode has any extended attributes.
> > > > 
> > > > It's because read_all_xattrs() now calls fsck_sanity_check_nid(), which
> > > > eventually dereferences f2fs_fsck::main_area_bitmap, which is NULL.
> > > > 
> > > > I'm not sure what was intended here.
> > > 
> > > Eric, could you please have a try with below commit:
> > > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/chao/f2fs-tools.git/commit/?h=dev-test&id=aad80ed0099fb9530ae3af9789362353ff580252
> > > 
> > 
> > Works for me.  I was wondering whether the fix would be more than that, but
> > maybe not.
> 
> Thanks for both report and test.
> 
> I don't have any other concern on current solution, let's ask for Jaegeuk's
> opinion anyway.
> 
> Jaegeuk, could you please check previous buggy fix and current fix?

Thanks. I applied the new fix.

> 
> Thanks,
> 
> > 
> > - Eric
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
