Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A19B7B192B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 13:03:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qlonq-0004Az-3p;
	Thu, 28 Sep 2023 11:03:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qlonn-0004Af-SU;
 Thu, 28 Sep 2023 11:03:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H6/PGhTnNIMn3orh6NoywiPLKzPAP9n0apXCR75yE60=; b=Il/3uLsU4EmfUzDiZi76fYGZf6
 qRFOm/eS5TMlKxm20yhMCsgXiQH9hVTrRikZFVGjkJ2a/Gbe1t62M7Y5u8xx/NnuZPc/KPUi4i5g2
 3RJ6AipSpW9BbfBuAn22n5KXiEEJzf9yPXRu2HTw+FXtsiX+mS9b0FoOsZi6YFqOYseU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=H6/PGhTnNIMn3orh6NoywiPLKzPAP9n0apXCR75yE60=; b=O
 bc8CGJUHIeMNRnZEdi1SrEt5pQ7eg7veINziTN7wLtQV3lbaBdovSyUe9v0fuAxf3ONp97jFTeZPZ
 ZJsWsq1sAST0fvafpHSgqHpsoSE0a9WZ76XozpC/LQ9m9Eoz/dZCoU+N0OSrI13NFJZSdZjgzXxgu
 4yPSnunDWDKtUxCc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qlonm-00067K-S2; Thu, 28 Sep 2023 11:03:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 117E3B81BB6;
 Thu, 28 Sep 2023 11:03:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6261C433C7;
 Thu, 28 Sep 2023 11:03:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695898996;
 bh=P/ji0vPUFbCbMgRaXGuX+mvLtN5yOsTM92SNHS8Fueo=;
 h=From:To:Cc:Subject:Date:From;
 b=ajA8TqmoJHDxZZXJB7u7BMot+JbXkx4s2BucffEwH263YJ1rAl5f3kOGlSugrXpmt
 enCVyE8I76GPL/4IwNc6Xbqia5TJMQJMD0b6VI10w4v7eGGGrt78TCsyNOegv/F9Uj
 iW/9CtFBkFT2tmshJ5jLV46fOQDVQrsOik9OnfKq3kLgtaU5yGkVbFFKWwj7owPjN5
 uKY70w3//pT9DL9Vb4zHyLQxEjU2ccCDoLvTNb0KR95R/azkiP4Qv5k+R06xTjnj5w
 k30XWG81ek4EZ/ysaVPoNTqidztW9RMKRExEC41IRtMuKvo/5O4MhdApjUIRFWMG+e
 viZeUgPDfZseg==
From: Jeff Layton <jlayton@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 David Sterba <dsterba@suse.cz>, Amir Goldstein <amir73il@gmail.com>,
 Theodore Ts'o <tytso@mit.edu>, Eric Biederman <ebiederm@xmission.com>,
 Kees Cook <keescook@chromium.org>, Jeremy Kerr <jk@ozlabs.org>,
 Arnd Bergmann <arnd@arndb.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?= <arve@android.com>,
 Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>,
 Joel Fernandes <joel@joelfernandes.org>,
 Carlos Llamas <cmllamas@google.com>,
 Suren Baghdasaryan <surenb@google.com>, Mattia Dongili <malattia@linux.it>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Leon Romanovsky <leon@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Jiri Slaby <jirislaby@kernel.org>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Latchesar Ionkov <lucho@ionkov.net>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 David Sterba <dsterba@suse.com>, David Howells <dhowells@redhat.com>,
 Marc Dionne <marc.dionne@auristor.com>, Ian Kent <raven@themaw.net>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Salah Triki <salah.triki@gmail.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, Chris Mason <clm@fb.com>,
 Josef Bacik <josef@toxicpanda.com>, Xiubo Li <xiubli@redhat.com>,
 Ilya Dryomov <idryomov@gmail.com>, Jan Harkes <jaharkes@cs.cmu.edu>,
 coda@cs.cmu.edu, Joel Becker <jlbec@evilplan.org>,
 Christoph Hellwig <hch@lst.de>, Nicolas Pitre <nico@fluxnic.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Gao Xiang <xiang@kernel.org>, Chao Yu <chao@kernel.org>,
 Yue Hu <huyue2@coolpad.com>, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Namjae Jeon <linkinjeon@kernel.org>, Sungjong Seo <sj1557.seo@samsung.com>,
 Jan Kara <jack@suse.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Jaegeuk Kim <jaegeuk@kernel.org>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Christoph Hellwig <hch@infradead.org>, Miklos Szeredi <miklos@szeredi.hu>,
 Bob Peterson <rpeterso@redhat.com>,
 Andreas Gruenbacher <agruenba@redhat.com>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Muchun Song <muchun.song@linux.dev>, Jan Kara <jack@suse.cz>,
 David Woodhouse <dwmw2@infradead.org>, Dave Kleikamp <shaggy@kernel.org>,
 Tejun Heo <tj@kernel.org>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anna Schumaker <anna@kernel.org>, Chuck Lever <chuck.lever@oracle.com>,
 Neil Brown <neilb@suse.de>, Olga Kornievskaia <kolga@netapp.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Tom Talpey <tom@talpey.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Anton Altaparmakov <anton@tuxera.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Mark Fasheh <mark@fasheh.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Bob Copeland <me@bobcopeland.com>, Mike Marshall <hubcap@omnibond.com>,
 Martin Brandenburg <martin@omnibond.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Iurii Zaikin <yzaikin@google.com>,
 Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Anders Larsen <al@alarsen.net>, Steve French <sfrench@samba.org>,
 Paulo Alcantara <pc@manguebit.com>, Ronnie Sahlberg <lsahlber@redhat.com>,
 Shyam Prasad N <sprasad@microsoft.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Evgeniy Dushistov <dushistov@mail.ru>,
 Chandan Babu R <chandan.babu@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>,
 Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@google.com>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Hugh Dickins <hughd@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>,
 John Johansen <john.johansen@canonical.com>,
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Stephen Smalley <stephen.smalley.work@gmail.com>,
 Eric Paris <eparis@parisplace.org>
Date: Thu, 28 Sep 2023 07:02:59 -0400
Message-ID: <20230928110300.32891-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  While working on the multigrain timestamp changes,
 Linus suggested
 adding some similar wrappers for accessing the atime and mtime that we have
 for the ctime. With that, we could then move to using dis [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1qlonm-00067K-S2
Subject: [f2fs-dev] [PATCH 00/87] fs: new accessor methods for atime and
 mtime
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
Cc: jfs-discussion@lists.sourceforge.net, linux-efi@vger.kernel.org,
 platform-driver-x86@vger.kernel.org, gfs2@lists.linux.dev, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 linux-afs@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-unionfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 linux-serial@vger.kernel.org, linux-ext4@vger.kernel.org,
 devel@lists.orangefs.org, linux-trace-kernel@vger.kernel.org,
 linux-cifs@vger.kernel.org, selinux@vger.kernel.org, apparmor@lists.ubuntu.com,
 autofs@vger.kernel.org, linux-um@lists.infradead.org,
 reiserfs-devel@vger.kernel.org, ocfs2-devel@lists.linux.dev,
 ceph-devel@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, linuxppc-dev@lists.ozlabs.org,
 v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

While working on the multigrain timestamp changes, Linus suggested
adding some similar wrappers for accessing the atime and mtime that we
have for the ctime. With that, we could then move to using discrete
integers instead of timespec64 in struct inode, and shrink it.

Linus suggested using macros for the new accessors, but the existing
ctime wrappers were static inlines and since there are only 3 different
timestamps, I didn't see that trying to fiddle with macros would gain us
anything.

The first patches start with some new infrastructure, and then we move
to converting different subsystems to use it. The second to last patch
makes the conversion to discrete integers, which shaves 8 bytes off of
struct inode on my x86_64 kernel. The last patch reshuffles things a
bit more, to keep the i_lock in the same cacheline as the fields it
protects (at least on x86_64).

About 75% of this conversion was done with coccinelle, with the rest
done by hand with vim.

Jeff Layton (87):
  fs: new accessor methods for atime and mtime
  fs: convert core infrastructure to new {a,m}time accessors
  arch/powerpc/platforms/cell/spufs: convert to new inode {a,m}time
    accessors
  arch/s390/hypfs: convert to new inode {a,m}time accessors
  drivers/android: convert to new inode {a,m}time accessors
  drivers/char: convert to new inode {a,m}time accessors
  drivers/infiniband/hw/qib: convert to new inode {a,m}time accessors
  drivers/misc/ibmasm: convert to new inode {a,m}time accessors
  drivers/misc: convert to new inode {a,m}time accessors
  drivers/platform/x86: convert to new inode {a,m}time accessors
  drivers/tty: convert to new inode {a,m}time accessors
  drivers/usb/core: convert to new inode {a,m}time accessors
  drivers/usb/gadget/function: convert to new inode {a,m}time accessors
  drivers/usb/gadget/legacy: convert to new inode {a,m}time accessors
  fs/9p: convert to new inode {a,m}time accessors
  fs/adfs: convert to new inode {a,m}time accessors
  fs/affs: convert to new inode {a,m}time accessors
  fs/afs: convert to new inode {a,m}time accessors
  fs/autofs: convert to new inode {a,m}time accessors
  fs/befs: convert to new inode {a,m}time accessors
  fs/bfs: convert to new inode {a,m}time accessors
  fs/btrfs: convert to new inode {a,m}time accessors
  fs/ceph: convert to new inode {a,m}time accessors
  fs/coda: convert to new inode {a,m}time accessors
  fs/configfs: convert to new inode {a,m}time accessors
  fs/cramfs: convert to new inode {a,m}time accessors
  fs/debugfs: convert to new inode {a,m}time accessors
  fs/devpts: convert to new inode {a,m}time accessors
  fs/efivarfs: convert to new inode {a,m}time accessors
  fs/efs: convert to new inode {a,m}time accessors
  fs/erofs: convert to new inode {a,m}time accessors
  fs/exfat: convert to new inode {a,m}time accessors
  fs/ext2: convert to new inode {a,m}time accessors
  fs/ext4: convert to new inode {a,m}time accessors
  fs/f2fs: convert to new inode {a,m}time accessors
  fs/fat: convert to new inode {a,m}time accessors
  fs/freevxfs: convert to new inode {a,m}time accessors
  fs/fuse: convert to new inode {a,m}time accessors
  fs/gfs2: convert to new inode {a,m}time accessors
  fs/hfs: convert to new inode {a,m}time accessors
  fs/hfsplus: convert to new inode {a,m}time accessors
  fs/hostfs: convert to new inode {a,m}time accessors
  fs/hpfs: convert to new inode {a,m}time accessors
  fs/hugetlbfs: convert to new inode {a,m}time accessors
  fs/isofs: convert to new inode {a,m}time accessors
  fs/jffs2: convert to new inode {a,m}time accessors
  fs/jfs: convert to new inode {a,m}time accessors
  fs/kernfs: convert to new inode {a,m}time accessors
  fs/minix: convert to new inode {a,m}time accessors
  fs/nfs: convert to new inode {a,m}time accessors
  fs/nfsd: convert to new inode {a,m}time accessors
  fs/nilfs2: convert to new inode {a,m}time accessors
  fs/ntfs: convert to new inode {a,m}time accessors
  fs/ntfs3: convert to new inode {a,m}time accessors
  fs/ocfs2: convert to new inode {a,m}time accessors
  fs/omfs: convert to new inode {a,m}time accessors
  fs/openpromfs: convert to new inode {a,m}time accessors
  fs/orangefs: convert to new inode {a,m}time accessors
  fs/overlayfs: convert to new inode {a,m}time accessors
  fs/proc: convert to new inode {a,m}time accessors
  fs/pstore: convert to new inode {a,m}time accessors
  fs/qnx4: convert to new inode {a,m}time accessors
  fs/qnx6: convert to new inode {a,m}time accessors
  fs/ramfs: convert to new inode {a,m}time accessors
  fs/reiserfs: convert to new inode {a,m}time accessors
  fs/romfs: convert to new inode {a,m}time accessors
  fs/smb/client: convert to new inode {a,m}time accessors
  fs/smb/server: convert to new inode {a,m}time accessors
  fs/squashfs: convert to new inode {a,m}time accessors
  fs/sysv: convert to new inode {a,m}time accessors
  fs/tracefs: convert to new inode {a,m}time accessors
  fs/ubifs: convert to new inode {a,m}time accessors
  fs/udf: convert to new inode {a,m}time accessors
  fs/ufs: convert to new inode {a,m}time accessors
  fs/vboxsf: convert to new inode {a,m}time accessors
  fs/xfs: convert to new inode {a,m}time accessors
  fs/zonefs: convert to new inode {a,m}time accessors
  ipc: convert to new inode {a,m}time accessors
  kernel/bpf: convert to new inode {a,m}time accessors
  mm: convert to new inode {a,m}time accessors
  net/sunrpc: convert to new inode {a,m}time accessors
  security/apparmor: convert to new inode {a,m}time accessors
  security/selinux: convert to new inode {a,m}time accessors
  security: convert to new inode {a,m}time accessors
  fs: rename i_atime and i_mtime fields to __i_atime and __i_mtime
  fs: switch timespec64 fields in inode to discrete integers
  fs: move i_blocks up a few places in struct inode

 arch/powerpc/platforms/cell/spufs/inode.c |  2 +-
 arch/s390/hypfs/inode.c                   |  4 +-
 drivers/android/binderfs.c                |  8 +--
 drivers/char/sonypi.c                     |  2 +-
 drivers/infiniband/hw/qib/qib_fs.c        |  4 +-
 drivers/misc/ibmasm/ibmasmfs.c            |  2 +-
 drivers/misc/ibmvmc.c                     |  2 +-
 drivers/platform/x86/sony-laptop.c        |  2 +-
 drivers/tty/tty_io.c                      | 10 +++-
 drivers/usb/core/devio.c                  | 26 ++++++---
 drivers/usb/gadget/function/f_fs.c        |  4 +-
 drivers/usb/gadget/legacy/inode.c         |  2 +-
 fs/9p/vfs_inode.c                         |  6 +-
 fs/9p/vfs_inode_dotl.c                    | 16 +++---
 fs/adfs/inode.c                           | 13 +++--
 fs/affs/amigaffs.c                        |  4 +-
 fs/affs/inode.c                           | 17 +++---
 fs/afs/dynroot.c                          |  2 +-
 fs/afs/inode.c                            |  8 +--
 fs/afs/write.c                            |  2 +-
 fs/attr.c                                 |  4 +-
 fs/autofs/inode.c                         |  2 +-
 fs/autofs/root.c                          |  6 +-
 fs/bad_inode.c                            |  2 +-
 fs/befs/linuxvfs.c                        | 10 ++--
 fs/bfs/dir.c                              |  9 +--
 fs/bfs/inode.c                            | 10 ++--
 fs/binfmt_misc.c                          |  2 +-
 fs/btrfs/delayed-inode.c                  | 16 +++---
 fs/btrfs/file.c                           | 18 +++---
 fs/btrfs/inode.c                          | 39 ++++++-------
 fs/btrfs/reflink.c                        |  2 +-
 fs/btrfs/transaction.c                    |  3 +-
 fs/btrfs/tree-log.c                       |  8 +--
 fs/ceph/addr.c                            | 10 ++--
 fs/ceph/caps.c                            |  4 +-
 fs/ceph/file.c                            |  2 +-
 fs/ceph/inode.c                           | 60 +++++++++++---------
 fs/ceph/mds_client.c                      |  8 ++-
 fs/ceph/snap.c                            |  4 +-
 fs/coda/coda_linux.c                      |  6 +-
 fs/coda/dir.c                             |  2 +-
 fs/coda/file.c                            |  2 +-
 fs/configfs/inode.c                       |  8 +--
 fs/cramfs/inode.c                         |  4 +-
 fs/debugfs/inode.c                        |  2 +-
 fs/devpts/inode.c                         |  6 +-
 fs/efivarfs/file.c                        |  2 +-
 fs/efivarfs/inode.c                       |  2 +-
 fs/efs/inode.c                            |  5 +-
 fs/erofs/inode.c                          |  3 +-
 fs/exfat/exfat_fs.h                       |  1 +
 fs/exfat/file.c                           |  7 +--
 fs/exfat/inode.c                          | 31 ++++++-----
 fs/exfat/misc.c                           |  8 +++
 fs/exfat/namei.c                          | 31 ++++++-----
 fs/exfat/super.c                          |  4 +-
 fs/ext2/dir.c                             |  6 +-
 fs/ext2/ialloc.c                          |  2 +-
 fs/ext2/inode.c                           | 11 ++--
 fs/ext2/super.c                           |  2 +-
 fs/ext4/ext4.h                            | 20 +++++--
 fs/ext4/extents.c                         | 11 ++--
 fs/ext4/ialloc.c                          |  4 +-
 fs/ext4/inline.c                          |  4 +-
 fs/ext4/inode.c                           | 19 ++++---
 fs/ext4/ioctl.c                           | 13 ++++-
 fs/ext4/namei.c                           | 10 ++--
 fs/ext4/super.c                           |  2 +-
 fs/ext4/xattr.c                           |  6 +-
 fs/f2fs/dir.c                             |  6 +-
 fs/f2fs/f2fs.h                            | 10 ++--
 fs/f2fs/file.c                            | 14 ++---
 fs/f2fs/inline.c                          |  2 +-
 fs/f2fs/inode.c                           | 20 +++----
 fs/f2fs/namei.c                           |  4 +-
 fs/f2fs/recovery.c                        |  8 +--
 fs/f2fs/super.c                           |  2 +-
 fs/fat/inode.c                            | 25 ++++++---
 fs/fat/misc.c                             |  6 +-
 fs/freevxfs/vxfs_inode.c                  |  6 +-
 fs/fuse/control.c                         |  2 +-
 fs/fuse/dir.c                             |  6 +-
 fs/fuse/inode.c                           | 25 ++++-----
 fs/fuse/readdir.c                         |  6 +-
 fs/gfs2/bmap.c                            | 10 ++--
 fs/gfs2/dir.c                             | 10 ++--
 fs/gfs2/glops.c                           | 11 ++--
 fs/gfs2/inode.c                           |  7 ++-
 fs/gfs2/quota.c                           |  2 +-
 fs/gfs2/super.c                           |  8 +--
 fs/hfs/catalog.c                          |  8 +--
 fs/hfs/inode.c                            | 16 +++---
 fs/hfs/sysdep.c                           | 10 ++--
 fs/hfsplus/catalog.c                      |  8 +--
 fs/hfsplus/inode.c                        | 22 ++++----
 fs/hostfs/hostfs_kern.c                   | 12 ++--
 fs/hpfs/dir.c                             | 10 ++--
 fs/hpfs/inode.c                           | 12 ++--
 fs/hpfs/namei.c                           | 20 +++----
 fs/hpfs/super.c                           | 10 ++--
 fs/hugetlbfs/inode.c                      | 10 ++--
 fs/inode.c                                | 35 +++++++-----
 fs/isofs/inode.c                          |  4 +-
 fs/isofs/rock.c                           | 18 +++---
 fs/jffs2/dir.c                            | 35 +++++++-----
 fs/jffs2/file.c                           |  4 +-
 fs/jffs2/fs.c                             | 20 +++----
 fs/jffs2/os-linux.h                       |  4 +-
 fs/jfs/inode.c                            |  2 +-
 fs/jfs/jfs_imap.c                         | 16 +++---
 fs/jfs/jfs_inode.c                        |  2 +-
 fs/jfs/namei.c                            | 20 ++++---
 fs/jfs/super.c                            |  2 +-
 fs/kernfs/inode.c                         |  6 +-
 fs/libfs.c                                | 41 ++++++++++----
 fs/minix/bitmap.c                         |  2 +-
 fs/minix/dir.c                            |  6 +-
 fs/minix/inode.c                          | 15 +++--
 fs/minix/itree_common.c                   |  2 +-
 fs/nfs/callback_proc.c                    |  2 +-
 fs/nfs/fscache.h                          |  4 +-
 fs/nfs/inode.c                            | 30 +++++-----
 fs/nfsd/blocklayout.c                     |  3 +-
 fs/nfsd/nfs3proc.c                        |  4 +-
 fs/nfsd/nfs4proc.c                        |  8 +--
 fs/nfsd/nfsctl.c                          |  2 +-
 fs/nilfs2/dir.c                           |  6 +-
 fs/nilfs2/inode.c                         | 16 +++---
 fs/nsfs.c                                 |  2 +-
 fs/ntfs/inode.c                           | 25 +++++----
 fs/ntfs/mft.c                             |  2 +-
 fs/ntfs3/file.c                           |  6 +-
 fs/ntfs3/frecord.c                        | 11 ++--
 fs/ntfs3/inode.c                          | 22 +++++---
 fs/ntfs3/namei.c                          |  4 +-
 fs/ocfs2/alloc.c                          |  2 +-
 fs/ocfs2/aops.c                           |  6 +-
 fs/ocfs2/dir.c                            |  5 +-
 fs/ocfs2/dlmfs/dlmfs.c                    |  4 +-
 fs/ocfs2/dlmglue.c                        | 29 +++++-----
 fs/ocfs2/file.c                           | 26 +++++----
 fs/ocfs2/inode.c                          | 24 ++++----
 fs/ocfs2/namei.c                          |  8 +--
 fs/ocfs2/refcounttree.c                   |  4 +-
 fs/omfs/inode.c                           |  8 +--
 fs/openpromfs/inode.c                     |  4 +-
 fs/orangefs/orangefs-utils.c              | 16 +++---
 fs/overlayfs/file.c                       |  9 ++-
 fs/overlayfs/inode.c                      |  3 +-
 fs/overlayfs/util.c                       |  4 +-
 fs/pipe.c                                 |  2 +-
 fs/proc/base.c                            |  2 +-
 fs/proc/inode.c                           |  2 +-
 fs/proc/proc_sysctl.c                     |  2 +-
 fs/proc/self.c                            |  2 +-
 fs/proc/thread_self.c                     |  2 +-
 fs/pstore/inode.c                         |  5 +-
 fs/qnx4/inode.c                           |  6 +-
 fs/qnx6/inode.c                           |  6 +-
 fs/ramfs/inode.c                          |  7 ++-
 fs/reiserfs/inode.c                       | 22 +++-----
 fs/reiserfs/namei.c                       |  8 +--
 fs/reiserfs/stree.c                       |  5 +-
 fs/reiserfs/super.c                       |  2 +-
 fs/romfs/super.c                          |  3 +-
 fs/smb/client/file.c                      | 18 +++---
 fs/smb/client/fscache.h                   |  6 +-
 fs/smb/client/inode.c                     | 17 +++---
 fs/smb/client/smb2ops.c                   |  6 +-
 fs/smb/server/smb2pdu.c                   |  8 +--
 fs/squashfs/inode.c                       |  6 +-
 fs/stack.c                                |  4 +-
 fs/stat.c                                 |  4 +-
 fs/sysv/dir.c                             |  6 +-
 fs/sysv/ialloc.c                          |  2 +-
 fs/sysv/inode.c                           | 10 ++--
 fs/sysv/itree.c                           |  2 +-
 fs/tracefs/inode.c                        |  2 +-
 fs/ubifs/debug.c                          |  8 +--
 fs/ubifs/dir.c                            | 23 +++++---
 fs/ubifs/file.c                           | 16 +++---
 fs/ubifs/journal.c                        |  8 +--
 fs/ubifs/super.c                          |  8 +--
 fs/udf/ialloc.c                           |  4 +-
 fs/udf/inode.c                            | 38 +++++++------
 fs/udf/namei.c                            | 16 +++---
 fs/ufs/dir.c                              |  6 +-
 fs/ufs/ialloc.c                           |  2 +-
 fs/ufs/inode.c                            | 36 +++++++-----
 fs/vboxsf/utils.c                         | 15 ++---
 fs/xfs/libxfs/xfs_inode_buf.c             | 10 ++--
 fs/xfs/libxfs/xfs_rtbitmap.c              |  6 +-
 fs/xfs/libxfs/xfs_trans_inode.c           |  2 +-
 fs/xfs/xfs_bmap_util.c                    |  7 ++-
 fs/xfs/xfs_inode.c                        |  4 +-
 fs/xfs/xfs_inode_item.c                   |  4 +-
 fs/xfs/xfs_iops.c                         |  8 +--
 fs/xfs/xfs_itable.c                       |  8 +--
 fs/xfs/xfs_rtalloc.c                      | 30 +++++-----
 fs/zonefs/super.c                         | 10 ++--
 include/linux/fs.h                        | 68 +++++++++++++++++++++--
 include/linux/fs_stack.h                  |  6 +-
 ipc/mqueue.c                              | 19 ++++---
 kernel/bpf/inode.c                        |  5 +-
 mm/shmem.c                                | 20 +++----
 net/sunrpc/rpc_pipe.c                     |  2 +-
 security/apparmor/apparmorfs.c            |  7 ++-
 security/apparmor/policy_unpack.c         |  4 +-
 security/inode.c                          |  2 +-
 security/selinux/selinuxfs.c              |  2 +-
 211 files changed, 1115 insertions(+), 906 deletions(-)

-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
