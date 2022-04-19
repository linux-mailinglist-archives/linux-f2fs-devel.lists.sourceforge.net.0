Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C6822506FCE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Apr 2022 16:09:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngoXf-0001Ee-Tg; Tue, 19 Apr 2022 14:09:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <brauner@kernel.org>) id 1ngoXe-0001EP-9i
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BB2IpWnzuFZn4xjY5LqgD0JYmq9st+rHwRg6o1MR5Us=; b=NLoiGEUSgjv0P4ekVigdoiH9FP
 /ldJMVuQ1fZyYhBO+9tXisHfTmf71CXfbH6PFN4DcITQ/ersIS2NaByyca84znFgJxWtThL8XYgvi
 D/cNqznwRLJeOoPiZH1M1X3FqqBIaLVyVJ3EGxbsiNT/lE8TpgvYloinpucd1cMMWzI0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BB2IpWnzuFZn4xjY5LqgD0JYmq9st+rHwRg6o1MR5Us=; b=WQ/CPTL7DXV3D8xe6uT6cyRLPo
 +Ql2PA2ZN8MOSfcuYwZ+AAgERRA5qhtOkeai39Eq78vn1z14HbR4HeJCIr+v+sENW3gZClDxni6NX
 d+y+VIJMFiVHZb5yj9fb5HUrEMKUD4Is8zplJ5ga4abJDFck/8+/EXND9IBA4mpqMg40=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngoXc-003xez-IS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 19 Apr 2022 14:09:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1FA4C616AB;
 Tue, 19 Apr 2022 14:09:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F82C385A8;
 Tue, 19 Apr 2022 14:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650377350;
 bh=ehE0f+n6BW1o04+JVmVR3SUS0NOx6+AaaAJridegsTk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qXsCj/Cs8DmBGHQyYiSqiVEAbepBjzRlZKZxNVmvrexWE4j6UVGOtBZDdJofYPojk
 B2gV83VdxCaYw4/qFM8pUYmZ6eZNG/odJZrNTzmweGf+gUJIo3NQEWQUZeyJskvFZ7
 6hmQLgHiJDNOWj5TzIYaJyRd+JJA7ujd6/PjDarlreo+FG/OFBumMH4yLVEqI9gxTR
 iJDrVdj1K5i8U7PfJ1BgpGkFNzgG+xvGOOHR+8qjt9MICSDq3VhKmBK031lDqaxIaR
 YcWG6xx26MmBeHCd0Ul7MLG18QGbQd/yuau267Hg9YEim6zcCcTHcx5qLPJqgOcQuc
 hlB8ZSrq6QsNw==
Date: Tue, 19 Apr 2022 16:09:05 +0200
From: Christian Brauner <brauner@kernel.org>
To: Yang Xu <xuyang2018.jy@fujitsu.com>
Message-ID: <20220419140905.7pbfqrzmyczyhneh@wittgenstein>
References: <1650368834-2420-1-git-send-email-xuyang2018.jy@fujitsu.com>
 <1650368834-2420-7-git-send-email-xuyang2018.jy@fujitsu.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1650368834-2420-7-git-send-email-xuyang2018.jy@fujitsu.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Apr 19, 2022 at 07:47:13PM +0800, Yang Xu wrote: >
 Currently, vfs only passes mode argument to filesystem,
 then use inode_init_owner()
 > to strip S_ISGID. Some filesystem(ie ext4/btrfs) will c [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngoXc-003xez-IS
Subject: Re: [f2fs-dev] [PATCH v4 7/8] fs: strip file's S_ISGID mode on vfs
 instead of on underlying filesystem
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
Cc: linux-nfs@vger.kernel.org, djwong@kernel.org, david@fromorbit.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jlayton@kernel.org,
 ceph-devel@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Apr 19, 2022 at 07:47:13PM +0800, Yang Xu wrote:
> Currently, vfs only passes mode argument to filesystem, then use inode_init_owner()
> to strip S_ISGID. Some filesystem(ie ext4/btrfs) will call inode_init_owner
> firstly, then posxi acl setup, but xfs uses the contrary order. It will affect
> S_ISGID clear especially we filter S_IXGRP by umask or acl.
> 
> Regardless of which filesystem is in use, failure to strip the SGID correctly is
> considered a security failure that needs to be fixed. The current VFS infrastructure
> requires the filesystem to do everything right and not step on any landmines to
> strip the SGID bit, when in fact it can easily be done at the VFS and the filesystems
> then don't even need to be aware that the SGID needs to be (or has been stripped) by
> the operation the user asked to be done.
> 
> Vfs has all the info it needs - it doesn't need the filesystems to do everything
> correctly with the mode and ensuring that they order things like posix acl setup
> functions correctly with inode_init_owner() to strip the SGID bit.
> 
> Just strip the SGID bit at the VFS, and then the filesystems can't get it wrong.
> 
> Also, the inode_sgid_strip() api should be used before IS_POSIXACL() because
> this api may change mode.
> 
> Only the following places use inode_init_owner
> "
> arch/powerpc/platforms/cell/spufs/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode | S_IFDIR);
> arch/powerpc/platforms/cell/spufs/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode | S_IFDIR);
> fs/9p/vfs_inode.c:      inode_init_owner(&init_user_ns, inode, NULL, mode);
> fs/bfs/dir.c:   inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/btrfs/inode.c:       inode_init_owner(mnt_userns, inode, dir, mode);
> fs/btrfs/tests/btrfs-tests.c:   inode_init_owner(&init_user_ns, inode, NULL, S_IFREG);
> fs/ext2/ialloc.c:               inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/ext4/ialloc.c:               inode_init_owner(mnt_userns, inode, dir, mode);
> fs/f2fs/namei.c:        inode_init_owner(mnt_userns, inode, dir, mode);
> fs/hfsplus/inode.c:     inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/hugetlbfs/inode.c:           inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/jfs/jfs_inode.c:     inode_init_owner(&init_user_ns, inode, parent, mode);
> fs/minix/bitmap.c:      inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/nilfs2/inode.c:      inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/ntfs3/inode.c:       inode_init_owner(mnt_userns, inode, dir, mode);
> fs/ocfs2/dlmfs/dlmfs.c:         inode_init_owner(&init_user_ns, inode, NULL, mode);
> fs/ocfs2/dlmfs/dlmfs.c: inode_init_owner(&init_user_ns, inode, parent, mode);
> fs/ocfs2/namei.c:       inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/omfs/inode.c:        inode_init_owner(&init_user_ns, inode, NULL, mode);
> fs/overlayfs/dir.c:     inode_init_owner(&init_user_ns, inode, dentry->d_parent->d_inode, mode);
> fs/ramfs/inode.c:               inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/reiserfs/namei.c:    inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/sysv/ialloc.c:       inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/ubifs/dir.c: inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/udf/ialloc.c:        inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/ufs/ialloc.c:        inode_init_owner(&init_user_ns, inode, dir, mode);
> fs/xfs/xfs_inode.c:             inode_init_owner(mnt_userns, inode, dir, mode);
> fs/zonefs/super.c:      inode_init_owner(&init_user_ns, inode, parent, S_IFDIR | 0555);
> kernel/bpf/inode.c:     inode_init_owner(&init_user_ns, inode, dir, mode);
> mm/shmem.c:             inode_init_owner(&init_user_ns, inode, dir, mode);
> "
> 
> They are used in filesystem init new inode function and these init inode functions are used
> by following operations:
> mkdir
> symlink
> mknod
> create
> tmpfile
> rename
> 
> We don't care about mkdir because we don't strip SGID bit for directory except fs.xfs.irix_sgid_inherit.
> But we even call it in do_mkdirat() since inode_sgid_strip() will skip directories anyway. This will
> enforce the same ordering for all relevant operations and it will make the code more uniform and
> easier to understand by using new helper prepare_mode().
> 
> symlink and rename only use valid mode that doesn't have SGID bit.
> 
> We have added inode_sgid_strip api for the remaining operations.
> 
> In addition to the above six operations, four filesystems has a little difference
> 1) btrfs has btrfs_create_subvol_root to create new inode but used non SGID bit mode and can ignore
> 2) ocfs2 reflink function should add inode_sgid_strip api manually because we don't add it in vfs
> 3) spufs which doesn't really go hrough the regular VFS callpath because it has separate system call
> spu_create, but it t only allows the creation of directories and only allows bits in 0777 and can ignore
> 4)bpf use vfs_mkobj in bpf_obj_do_pin with "S_IFREG | ((S_IRUSR | S_IWUSR) & ~current_umask()) mode and
> use bpf_mkobj_ops in bpf_iter_link_pin_kernel with S_IFREG | S_IRUSR; , so bpf is also not affected
> 
> This patch also changed grpid behaviour for ext4/xfs because the mode passed to them may been
> changed by inode_sgid_strip.
> 
> Also as Christian Brauner said"
> The patch itself is useful as it would move a security sensitive operation that is currently burried in
> individual filesystems into the vfs layer. But it has a decent regression  potential since it might strip
> filesystems that have so far relied on getting the S_ISGID bit with a mode argument. So this needs a lot
> of testing and long exposure in -next for at least one full kernel cycle."
> 
> Suggested-by: Dave Chinner <david@fromorbit.com>
> Signed-off-by: Yang Xu <xuyang2018.jy@fujitsu.com>
> ---

I think we're getting closer but please focus the patch series. This has
morphed into an 8 patch series where 4 or 5 of these patches are fixes
that a) I'm not sure are worth it or fix anything b) they are filesystem
specific and can be independently upstreamed and c) have nothing to do
with the core of this patch series.

So I'd suggest you'd just make this about sgid stripping and then this
doesn't have to be more than 3 maybe 4 patches, imho.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
