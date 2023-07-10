Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBB074D52F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jul 2023 14:20:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qIps3-0001HB-Sz;
	Mon, 10 Jul 2023 12:20:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qIprv-0001GS-JP;
 Mon, 10 Jul 2023 12:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mel9TpUW8tVQGU43suJdqlMOaA7hvOUH0G4Ovm06lLc=; b=cwTtszTzRlltGTdnevYXy3isit
 CqHpZ6oCj3zOgm598a8vMLH/x1CIe0r6q1cnT1AmVZWUgTERrNbdCfCTh00qBVfikGGtk0ywp0Hmw
 oSOvc7QmP/b+vNKRaameNxp1FIvjbZO0QLQLYYXavKLRUfPJhAOTbVJglJK9nV5xHVEs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mel9TpUW8tVQGU43suJdqlMOaA7hvOUH0G4Ovm06lLc=; b=KbKfaqnfIzYtj4sz4lS8Dm6fHD
 2UoMs22HViMMxeWqJ4tW306/+3pUWh8PUrAgB9tWB15FmJ4gjZbLLKvkXoMUQPFETOq8zMVlV0BVd
 Uu+U8jbNmklCdueAjyNfp8pmsTmCHIWDHBKMO0dFTkXcmVg/sqdUQuzfMF+wFvZTBDHc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIprw-00022E-4n; Mon, 10 Jul 2023 12:19:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 78E6460FAA;
 Mon, 10 Jul 2023 12:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD76EC433C7;
 Mon, 10 Jul 2023 12:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1688991587;
 bh=2J+fX1q6zGco9Qkkut7k1oGUom0kvdTsmG/UR5nBS/g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lcZg/5Hf6Blw0S0KBVmLS7XuB4wH3HsrCXsC5h2hKYACqGAETSqwGiuAn1zv2/Rsl
 YOfRjkeYMFIcaW7p23OxWcTEiGLmzVZP8u7MfCw251UdZXm1FaRYowg+5pVNRUg4SH
 rGbxakRBAw9Je/7IcFdyUw/AWroEm+9K1nQHsFNnUlEt3jB8MrvNjS2zRswA08V8pZ
 wds+9xHOVtRXpxw7AKs0S8ikoHFutTN5KKOCQTdSntzEeWNrOBLYZvNJ58I4jWKMO4
 trOiZmcTQJEaQV42w0QGQ4l/lY6Yv8dXtuTOWkUkO0al5gZVMemGZipC4IDHXdVMiv
 89FE2RmemJaUA==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Mon, 10 Jul 2023 14:18:51 +0200
Message-Id: <20230710-stift-flexibel-0867d393e8fa@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230705185812.579118-1-jlayton@kernel.org>
References: <20230705185812.579118-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11283; i=brauner@kernel.org;
 h=from:subject:message-id; bh=2J+fX1q6zGco9Qkkut7k1oGUom0kvdTsmG/UR5nBS/g=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSs/vZNcyJHQ0Srmfqv55c3nchaqnLhiXDZo5JbRxU5e1cl
 n+5y6yhlYRDjYpAVU2RxaDcJl1vOU7HZKFMDZg4rE8gQBi5OAZiIeSLDPw3jLbFNd8SdNfmWvzKRN5
 4i/XfC34/Ccjwx+uq6O0V4vRgZbnS7HzHcMNt5f8KEj277edSLOHh1Hm9NW7nW7fLG/4kybAA=
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, 05 Jul 2023 14:58:09 -0400, Jeff Layton wrote: > v2:
 > - prepend patches to add missing ctime updates > - add
 simple_rename_timestamp
 helper function > - rename ctime accessor functions as ino [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qIprw-00022E-4n
Subject: Re: [f2fs-dev] [PATCH v2 00/92] fs: new accessors for inode->i_ctime
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
Cc: lucho@ionkov.net, rafael@kernel.org, djwong@kernel.org, al@alarsen.net,
 cmllamas@google.com, andrii@kernel.org, hughd@google.com,
 john.johansen@canonical.com, agordeev@linux.ibm.com, hch@lst.de,
 hubcap@omnibond.com, pc@manguebit.com, linux-xfs@vger.kernel.org,
 bvanassche@acm.org, jeffxu@chromium.org, mpe@ellerman.id.au,
 john@keeping.me.uk, yi.zhang@huawei.com, jmorris@namei.org,
 christophe.leroy@csgroup.eu, code@tyhicks.com, stern@rowland.harvard.edu,
 borntraeger@linux.ibm.com, devel@lists.orangefs.org, mirimmad17@gmail.com,
 sprasad@microsoft.com, jaharkes@cs.cmu.edu, linux-um@lists.infradead.org,
 npiggin@gmail.com, viro@zeniv.linux.org.uk, ericvh@kernel.org,
 surenb@google.com, trond.myklebust@hammerspace.com, anton@tuxera.com,
 Christian Brauner <brauner@kernel.org>, wsa+renesas@sang-engineering.com,
 gregkh@linuxfoundation.org, stephen.smalley.work@gmail.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, lsahlber@redhat.com,
 senozhatsky@chromium.org, arve@android.com, chuck.lever@oracle.com,
 svens@linux.ibm.com, jolsa@kernel.org, jack@suse.com, tj@kernel.org,
 akpm@linux-foundation.org, linux-trace-kernel@vger.kernel.org,
 xu.xin16@zte.com.cn, shaggy@kernel.org, dhavale@google.com,
 penguin-kernel@I-love.SAKURA.ne.jp, zohar@linux.ibm.com, linux-mm@kvack.org,
 joel@joelfernandes.org, edumazet@google.com, sdf@google.com, jomajm@gmail.com,
 linux-s390@vger.kernel.org, linux-nilfs@vger.kernel.org, paul@paul-moore.com,
 leon@kernel.org, john.fastabend@gmail.com, mcgrof@kernel.org,
 chi.minghao@zte.com.cn, codalist@coda.cs.cmu.edu, selinux@vger.kernel.org,
 zhangpeng362@huawei.com, quic_ugoswami@quicinc.com, yhs@fb.com,
 yzaikin@google.com, linkinjeon@kernel.org, mhiramat@kernel.org,
 ecryptfs@vger.kernel.org, tkjos@android.com, madkar@cs.stonybrook.edu,
 gor@linux.ibm.com, yuzhe@nfschina.com, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, miklos@szeredi.hu, huyue2@coolpad.com,
 jaegeuk@kernel.org, gargaditya08@live.com, maco@android.com,
 hirofumi@mail.parknet.co.jp, haoluo@google.com, tony.luck@intel.com,
 tytso@mit.edu, nico@fluxnic.net, linux-ntfs-dev@lists.sourceforge.net,
 muchun.song@linux.dev, roberto.sassu@huawei.com,
 linux-f2fs-devel@lists.sourceforge.net, yang.yang29@zte.com.cn,
 gpiccoli@igalia.com, ebiederm@xmission.com, anna@kernel.org,
 quic_uaggarwa@quicinc.com, bwarrum@linux.ibm.com, mike.kravetz@oracle.com,
 jingyuwang_vip@163.com, linux-efi@vger.kernel.org, error27@gmail.com,
 martin@omnibond.com, trix@redhat.com, ocfs2-devel@lists.linux.dev,
 ast@kernel.org, sebastian.reichel@collabora.com, clm@fb.com,
 linux-mtd@lists.infradead.org, willy@infradead.org, marc.dionne@auristor.com,
 linux-afs@lists.infradead.org, raven@themaw.net, naohiro.aota@wdc.com,
 daniel@iogearbox.net, dennis.dalessandro@cornelisnetworks.com,
 linux-rdma@vger.kernel.org, quic_linyyuan@quicinc.com, coda@cs.cmu.edu,
 slava@dubeyko.com, idryomov@gmail.com, pabeni@redhat.com, adobriyan@gmail.com,
 serge@hallyn.com, axboe@kernel.dk, amir73il@gmail.com, linuszeng@tencent.com,
 keescook@chromium.org, arnd@arndb.de, autofs@vger.kernel.org,
 rostedt@goodmis.org, yifeliu@cs.stonybrook.edu, dlemoal@kernel.org,
 eparis@parisplace.org, ceph-devel@vger.kernel.org, xiang@kernel.org,
 yijiangshan@kylinos.cn, dhowells@redhat.com, linux-nfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, kolga@netapp.com, song@kernel.org,
 samba-technical@lists.samba.org, sfrench@samba.org, jk@ozlabs.org,
 netdev@vger.kernel.org, rpeterso@redhat.com, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 davem@davemloft.net, jfs-discussion@lists.sourceforge.net,
 princekumarmaurya06@gmail.com, ebiggers@google.com, neilb@suse.de,
 asmadeus@codewreck.org, linux_oss@crudebyte.com, me@bobcopeland.com,
 kpsingh@kernel.org, okanatov@gmail.com,
 almaz.alexandrovich@paragon-software.com, joseph.qi@linux.alibaba.com,
 hayama@lineo.co.jp, adilger.kernel@dilger.ca, mikulas@artax.karlin.mff.cuni.cz,
 shaozhengchao@huawei.com, chenzhongjin@huawei.com, ardb@kernel.org,
 anton.ivanov@cambridgegreys.com, agruenba@redhat.com, richard@nod.at,
 mark@fasheh.com, shr@devkernel.io, Dai.Ngo@oracle.com,
 cluster-devel@redhat.com, jgg@ziepe.ca, kuba@kernel.org, riel@surriel.com,
 salah.triki@gmail.com, dushistov@mail.ru, linux-cifs@vger.kernel.org,
 hca@linux.ibm.com, apparmor@lists.ubuntu.com, josef@toxicpanda.com,
 Liam.Howlett@Oracle.com, tom@talpey.com, hdegoede@redhat.com,
 linux-hardening@vger.kernel.org, aivazian.tigran@gmail.com,
 dchinner@redhat.com, dsterba@suse.com, xiubli@redhat.com,
 konishi.ryusuke@gmail.com, jgross@suse.com, jth@kernel.org,
 rituagar@linux.ibm.com, luisbg@kernel.org, martin.lau@linux.dev,
 v9fs@lists.linux.dev, fmdefrancesco@gmail.com, linux-unionfs@vger.kernel.org,
 lrh2000@pku.edu.cn, linux-security-module@vger.kernel.org,
 ezk@cs.stonybrook.edu, jefflexu@linux.alibaba.com, linux@treblig.org,
 hannes@cmpxchg.org, phillip@squashfs.org.uk, johannes@sipsolutions.net,
 sj1557.seo@samsung.com, dwmw2@infradead.org,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 jlbec@evilplan.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, 05 Jul 2023 14:58:09 -0400, Jeff Layton wrote:
> v2:
> - prepend patches to add missing ctime updates
> - add simple_rename_timestamp helper function
> - rename ctime accessor functions as inode_get_ctime/inode_set_ctime_*
> - drop individual inode_ctime_set_{sec,nsec} helpers
> 
> I've been working on a patchset to change how the inode->i_ctime is
> accessed in order to give us conditional, high-res timestamps for the
> ctime and mtime. struct timespec64 has unused bits in it that we can use
> to implement this. In order to do that however, we need to wrap all
> accesses of inode->i_ctime to ensure that bits used as flags are
> appropriately handled.
> 
> [...]

Applied to the vfs.ctime branch of the vfs/vfs.git tree.
Patches in the vfs.ctime branch should appear in linux-next soon.

Please report any outstanding bugs that were missed during review in a
new review to the original patch series allowing us to drop it.

It's encouraged to provide Acked-bys and Reviewed-bys even though the
patch has now been applied. If possible patch trailers will be updated.

Note that commit hashes shown below are subject to change due to rebase,
trailer updates or similar. If in doubt, please check the listed branch.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
branch: vfs.ctime

[01/92] ibmvmc: update ctime in conjunction with mtime on write
        https://git.kernel.org/vfs/vfs/c/ead310563ad2
[02/92] bfs: update ctime in addition to mtime when adding entries
        https://git.kernel.org/vfs/vfs/c/f42faf14b838
[03/92] efivarfs: update ctime when mtime changes on a write
        https://git.kernel.org/vfs/vfs/c/d8d026e0d1f2
[04/92] exfat: ensure that ctime is updated whenever the mtime is
        https://git.kernel.org/vfs/vfs/c/d84bd8fa48d7
[05/92] apparmor: update ctime whenever the mtime changes on an inode
        https://git.kernel.org/vfs/vfs/c/73955caedfae
[06/92] cifs: update the ctime on a partial page write
        https://git.kernel.org/vfs/vfs/c/c2f784379c99
[07/92] fs: add ctime accessors infrastructure
        https://git.kernel.org/vfs/vfs/c/64f0367de800
[08/92] fs: new helper: simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/54ced54a0239
[09/92] btrfs: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/218e0f662fee
[10/92] ubifs: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/caac4f65568d
[11/92] shmem: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/d3d11e9927b6
[12/92] exfat: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/71534b484c63
[13/92] ntfs3: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/140880821ce0
[14/92] reiserfs: convert to simple_rename_timestamp
        https://git.kernel.org/vfs/vfs/c/1a1a4df5e8fc
[15/92] spufs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/784e5a93c9cf
[16/92] s390: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/1cece1f8e5c2
[17/92] binderfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/0bcd830a76f3
[18/92] infiniband: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/811f97f80b01
[19/92] ibm: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/b447ed7597f0
[20/92] usb: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/2557dc7f2dde
[21/92] 9p: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/4cd4b11385ef
[22/92] adfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e257d7ade66e
[23/92] affs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/770619f19a77
[24/92] afs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/758506e44668
[25/92] fs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/a0a5a9810b37
[26/92] autofs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d7d1363cc3f6
[27/92] befs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d6218773de2d
[28/92] bfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/368b313ac2ab
[29/92] btrfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d3d15221956a
[30/92] ceph: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/818fc6e0129a
[31/92] coda: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/4e0b22fbc012
[32/92] configfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/69c977798a6a
[33/92] cramfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/911f086eae23
[34/92] debugfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/634a50390dbb
[35/92] devpts: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/92bb29a24707
[36/92] ecryptfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/16d21856dfd6
[37/92] efivarfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/cfeee05a50e1
[38/92] efs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/3a30b097319f
[39/92] erofs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e3594996216f
[40/92] exfat: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/8bd562d6f46d
[41/92] ext2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/7483252e8894
[42/92] ext4: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f2ddb05870fb
[43/92] 9afc475653af f2fs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f2ddb05870fb
[44/92] fat: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/8a0c417b695b
[45/92] freevxfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/7affaeb5b914
[46/92] fuse: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/688279761436
[47/92] gfs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/9e5b114b5ee4
[48/92] hfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d41f5876a177
[49/92] hfsplus: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/147f3dd171d2
[50/92] hostfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/2ceaa835b4f5
[51/92] hpfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e6fd7f49daa7
[52/92] hugetlbfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f5950f079b1a
[53/92] isofs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/53f2bb3567f0
[54/92] jffs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/7e8dc4ab1afb
[55/92] jfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/77737373dbb3
[56/92] kernfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/8b0e3c2e9900
[57/92] nfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/12844cb15dc6
[58/92] nfsd: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/f297728268bf
[59/92] nilfs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/1e9f083bc9cd
[60/92] ntfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/3cc66672eaa5
[61/92] ntfs3: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/9438de01396e
[62/92] ocfs2: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/da5b97da32e7
[63/92] omfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/563d772c8d70
[64/92] openpromfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/5f0978a6f0a6
[65/92] orangefs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/6a83804b4325
[66/92] overlayfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/60dcee636746
[67/92] procfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/85e0a6b3b8cf
[68/92] pstore: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/2b8125b5e7c6
[69/92] qnx4: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/77eb00659cb5
[70/92] qnx6: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/af1acd38df36
[71/92] ramfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/0eb8012f4b0b
[72/92] reiserfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e3e5f5f70292
[73/92] romfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/b6058a9af143
[74/92] smb: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d5c263f2187d
[75/92] squashfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/eaace9c73ba8
[76/92] sysv: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/41b6f4fbbe32
[77/92] tracefs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/5f69a5364568
[78/92] ubifs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/5bb225ba81c0
[79/92] udf: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/e251f0e98433
[80/92] ufs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/376ef9f6cab1
[81/92] vboxsf: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/9f06612951d5
[82/92] xfs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/4e8c1361146f
[83/92] zonefs: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/cbdc6aa5f65d
[84/92] linux: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ff12abb4a71a
[85/92] mqueue: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/a6b5a0055142
[86/92] bpf: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/d2b6a0a3863a
[87/92] shmem: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ffcd778237d3
[88/92] sunrpc: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ccf1c9002d71
[89/92] apparmor: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/ff91aaa76f1a
[90/92] security: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/701071f9ad33
[91/92] selinux: convert to ctime accessor functions
        https://git.kernel.org/vfs/vfs/c/cb6dfffdc7e9
[92/92] fs: rename i_ctime field to __i_ctime
        https://git.kernel.org/vfs/vfs/c/c06d4bf5e207


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
