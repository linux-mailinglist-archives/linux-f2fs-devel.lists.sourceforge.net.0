Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 569787BE603
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Oct 2023 18:10:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qpsqB-0002Wd-W1;
	Mon, 09 Oct 2023 16:10:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1qpsq3-0002WJ-UP;
 Mon, 09 Oct 2023 16:10:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DKIztmNQcH504fteiT67Hvcb59ZRmpmLX2wFhNZjIcI=; b=dYld1uZYQ9akm+BF0ltOr1XAOh
 c7R+UtGUPLbXayj81TqXBfeyi44FhD8WY4Gdc0hpMDYKQ1i6AI601RjU5MjHg20GX8ng0mX4FbyuH
 fMpvX9rmeW5Sexa52AqK4HXxjXbbidA6AZ99IKyfbZ4T3+jCm6/9wsntKR8s23Ca4hJk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DKIztmNQcH504fteiT67Hvcb59ZRmpmLX2wFhNZjIcI=; b=Jua/mWqreMycyxkIU/c+pfwUdX
 XGmJNyXLuQdtcEgLHeSNe/7W1QxlhvPK9T89TtqGJ+kbWaaYU4tmsdDru3dYIh0S1gecXMm9c+qxH
 8O6rBhJ5q9kmXdiFtqaIL4CypftY3N7LVIUwreJ53NnAhbfvhI3gzC61fxY5h8OU15mo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qpsq0-008bRK-Nc; Mon, 09 Oct 2023 16:10:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8AAB4CE149F;
 Mon,  9 Oct 2023 16:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92FFC433C8;
 Mon,  9 Oct 2023 16:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696867824;
 bh=keW4wOj90e6SAzWHDhiijPY7xlKn91ViUXq7+ZBy/qA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uXLBAcbtT3qSJRhL/8M371BpeA1C5ljwEOv35PPhR9AAXbskswQIJClC2lj7Rj5gp
 Wf8DMgzdk7F1Im4JpcUlzudlx2J7u7qAkCKVl53l50QCMlVywy97j4Z/z6YC81cPOB
 ZEhm/bd89ThwJczgLVLfYGYQSRgf/gJFEhHLWwuJMYiWS6kKeieI6gsrdpEaduSXjN
 MyDpNqeyNgkjuA9pNpJc3RCwGGB/UZ94Td6pVCF9naF2MzsC97YBscCdHyiZxAMM7J
 TNVG7+Kfo/TbzJEmvAHe6SdjHTFA0oLVhgfu0YPY0D5YqFYWH70KP0wz8Tk3JvnzVy
 Fp4FzyfzRg4Qw==
From: Christian Brauner <brauner@kernel.org>
To: Jeff Layton <jlayton@kernel.org>
Date: Mon,  9 Oct 2023 18:09:31 +0200
Message-Id: <20231009-charmant-locken-893b11849e84@brauner>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231004185221.80802-1-jlayton@kernel.org>
References: 
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10941; i=brauner@kernel.org;
 h=from:subject:message-id; bh=IjD9jhCYjdIJ9vPkYDocQbsMoCTgovwgHUWkZ/3GCzk=;
 b=owGbwMvMwCU28Zj0gdSKO4sYT6slMaSqqLYye23auu+81JbW5Y9by59u2veoRtMoSybRa4ps7qMV
 1SnPO0pZGMS4GGTFFFkc2k3C5ZbzVGw2ytSAmcPKBDKEgYtTAG4yFyPDct4beVfC7N9kTeGsyQvesc
 LrVB9X8d5HrqtS30c2lc/vYPgrs2DPvYLs+5rO5WFr0n0CStp+xH9eLnqRR9iW68ZB+QY+AA==
X-Developer-Key: i=brauner@kernel.org; a=openpgp;
 fpr=4880B8C9BD0E5106FC070F4F7B3C391EFEA93624
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Oct 04, 2023 at 02:52:21PM -0400, Jeff Layton wrote:
 > v2: > - bugfix in mtime handling > - incorporate _sec and _nsec accessor
 functions (Chuck Lever) > - move i_generation to plug hole after [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qpsq0-008bRK-Nc
Subject: Re: [f2fs-dev] [PATCH v2 00/89] fs: new accessor methods for inode
 atime and mtime
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
Cc: Latchesar Ionkov <lucho@ionkov.net>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Darrick J. Wong" <djwong@kernel.org>,
 Anders Larsen <al@alarsen.net>, Carlos Llamas <cmllamas@google.com>,
 Andrii Nakryiko <andrii@kernel.org>, Mattia Dongili <malattia@linux.it>,
 Hugh Dickins <hughd@google.com>, John Johansen <john.johansen@canonical.com>,
 Yonghong Song <yonghong.song@linux.dev>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christoph Hellwig <hch@lst.de>,
 Mike Marshall <hubcap@omnibond.com>, Paulo Alcantara <pc@manguebit.com>,
 linux-xfs@vger.kernel.org, linux-bcachefs@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, James Morris <jmorris@namei.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Christoph Hellwig <hch@infradead.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, devel@lists.orangefs.org,
 Shyam Prasad N <sprasad@microsoft.com>, linux-um@lists.infradead.org,
 Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>,
 Trond Myklebust <trond.myklebust@hammerspace.com>,
 Anton Altaparmakov <anton@tuxera.com>, Christian Brauner <brauner@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Stephen Smalley <stephen.smalley.work@gmail.com>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ronnie Sahlberg <lsahlber@redhat.com>,
 Sergey Senozhatsky <senozhatsky@chromium.org>, arve@android.com,
 Chuck Lever <chuck.lever@oracle.com>, Sven Schnelle <svens@linux.ibm.com>,
 Jiri Olsa <jolsa@kernel.org>, Jan Kara <jack@suse.com>,
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-trace-kernel@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Dave Kleikamp <shaggy@kernel.org>, linux-mm@kvack.org,
 Joel Fernandes <joel@joelfernandes.org>, Eric Dumazet <edumazet@google.com>,
 Stanislav Fomichev <sdf@google.com>, linux-s390@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Paul Moore <paul@paul-moore.com>,
 Leon Romanovsky <leon@kernel.org>, John Fastabend <john.fastabend@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, codalist@coda.cs.cmu.edu,
 Iurii Zaikin <yzaikin@google.com>, Namjae Jeon <linkinjeon@kernel.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Todd Kjos <tkjos@android.com>,
 Vasily Gorbik <gor@linux.ibm.com>, selinux@vger.kernel.org,
 Brian Foster <bfoster@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, Miklos Szeredi <miklos@szeredi.hu>,
 Yue Hu <huyue2@coolpad.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Martijn Coenen <maco@android.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, Hao Luo <haoluo@google.com>,
 Tony Luck <tony.luck@intel.com>, Theodore Ts'o <tytso@mit.edu>,
 Nicolas Pitre <nico@fluxnic.net>, linux-ntfs-dev@lists.sourceforge.net,
 Muchun Song <muchun.song@linux.dev>, linux-f2fs-devel@lists.sourceforge.net,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, gfs2@lists.linux.dev,
 Eric Biederman <ebiederm@xmission.com>, Anna Schumaker <anna@kernel.org>,
 Brad Warrum <bwarrum@linux.ibm.com>, Mike Kravetz <mike.kravetz@oracle.com>,
 linux-efi@vger.kernel.org, Martin Brandenburg <martin@omnibond.com>,
 ocfs2-devel@lists.linux.dev, Alexei Starovoitov <ast@kernel.org>,
 platform-driver-x86@vger.kernel.org, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, linux-hardening@vger.kernel.org,
 Marc Dionne <marc.dionne@auristor.com>, Jiri Slaby <jirislaby@kernel.org>,
 linux-afs@lists.infradead.org, Ian Kent <raven@themaw.net>,
 Naohiro Aota <naohiro.aota@wdc.com>, Daniel Borkmann <daniel@iogearbox.net>,
 Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>,
 linux-rdma@vger.kernel.org, coda@cs.cmu.edu, ilpo.jarvinen@linux.intel.com,
 Ilya Dryomov <idryomov@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "Serge E. Hallyn" <serge@hallyn.com>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 autofs@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 Mark Gross <markgross@kernel.org>, Damien Le Moal <dlemoal@kernel.org>,
 Eric Paris <eparis@parisplace.org>, ceph-devel@vger.kernel.org,
 Gao Xiang <xiang@kernel.org>, Jan Harkes <jaharkes@cs.cmu.edu>,
 linux-nfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 Olga Kornievskaia <kolga@netapp.com>, Song Liu <song@kernel.org>,
 samba-technical@lists.samba.org, Steve French <sfrench@samba.org>,
 Jeremy Kerr <jk@ozlabs.org>, netdev@vger.kernel.org,
 Bob Peterson <rpeterso@redhat.com>, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, ntfs3@lists.linux.dev, linux-erofs@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Chandan Babu R <chandan.babu@oracle.com>, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, Neil Brown <neilb@suse.de>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Amir Goldstein <amir73il@gmail.com>, Bob Copeland <me@bobcopeland.com>,
 KP Singh <kpsingh@kernel.org>, linux-unionfs@vger.kernel.org,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 Ard Biesheuvel <ardb@kernel.org>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Salah Triki <salah.triki@gmail.com>,
 Evgeniy Dushistov <dushistov@mail.ru>, linux-cifs@vger.kernel.org,
 Heiko Carstens <hca@linux.ibm.com>, apparmor@lists.ubuntu.com,
 Josef Bacik <josef@toxicpanda.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>,
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 Johannes Thumshirn <jth@kernel.org>, Ritu Agarwal <rituagar@linux.ibm.com>,
 Luis de Bethencourt <luisbg@kernel.org>,
 Martin KaFai Lau <martin.lau@linux.dev>, v9fs@lists.linux.dev,
 Kent Overstreet <kent.overstreet@linux.dev>, David Sterba <dsterba@suse.cz>,
 linux-security-module@vger.kernel.org, Jeffle Xu <jefflexu@linux.alibaba.com>,
 Phillip Lougher <phillip@squashfs.org.uk>,
 Johannes Berg <johannes@sipsolutions.net>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-karma-devel@lists.sourceforge.net, linux-btrfs@vger.kernel.org,
 Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 04, 2023 at 02:52:21PM -0400, Jeff Layton wrote:
> v2:
> - bugfix in mtime handling
> - incorporate _sec and _nsec accessor functions (Chuck Lever)
> - move i_generation to plug hole after changing timestamps (Amir Goldstein)
> 
> While working on the multigrain timestamp changes, Linus suggested
> adding some similar wrappers for accessing the atime and mtime that we
> have for the ctime. With that, we could then move to using discrete
> integers instead of struct timespec64 in struct inode and shrink it.
> 
> This patch implements this. Linus suggested using macros for the new
> accessors, but the existing ctime wrappers were static inlines and since
> there are only 3 different timestamps, I didn't see that trying to
> fiddle with macros would gain us anything (other than less verbosity in
> fs.h).
> 
> [...]

This was applied on top of -next but vfs.ctime is now based on v6.6-rc3
as stable tag otherwise this is too much of a moving target with other
stuff in -next. Anything that had to be dropped and requires fixups
should just be explained in the pr. The sooner this sees some -next, the
better, I think.

---

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

[01/86] fs: new accessor methods for atime and mtime
        https://git.kernel.org/vfs/vfs/c/22f45fee808d
[02/86] fs: convert core infrastructure to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/6ac95fb71485
[03/86] spufs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/9953073d5f20
[04/86] hypfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/1d64bfe22112
[05/86] android: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/a8a74b6b4f2c
[06/86] char: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/671ffa0775a7
[07/86] qib: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/ebd5458f3b52
[08/86] ibmasm: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/1d4257d57a41
[09/86] misc: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/d4bf8378b9cb
[10/86] x86: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/070601b1e496
[11/86] tty: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/5c9f26b87bed
[12/86] function: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/092f46404245
[13/86] legacy: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/5c51d80e51d0
[14/86] usb: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/4707a33afd6f
[15/86] 9p: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/20fc454b4493
[16/86] adfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/3e8d59046f6d
[17/86] affs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/60d4d0d37086
[18/86] afs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/6471772aa6fe
[19/86] autofs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/3eaad981548b
[20/86] befs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/21d0433caf69
[21/86] bfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/06e502c123a6
[22/86] btrfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/f62049d7838d
[23/86] ceph: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/ac7750d84e38
[24/86] coda: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/5c4bf2507baa
[25/86] configfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/3b930e187f16
[26/86] cramfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/bb0bf9d3bda8
[27/86] debugfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/7dc950e659d6
[28/86] devpts: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/a1eb5c26d5a1
[29/86] efivarfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/17b5652aa824
[30/86] efs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/a3cfbea29e7d
[31/86] erofs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/2beccde96d66
[32/86] exfat: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/522f3c42c9e7
[33/86] ext2: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/07be81fce412
[34/86] ext4: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/2ff285d78c4d
[35/86] f2fs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/c495130561ae
[36/86] fat: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/e57260ae3226
[37/86] freevxfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/a83513cd029e
[38/86] fuse: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/5f1e57582b4e
[39/86] gfs2: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/a5f1a9296668
[40/86] hfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/7ee8d53576e9
[41/86] hfsplus: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/2179ad3569f6
[42/86] hostfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/c3e1be490207
[43/86] hpfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/e08a2ea26b41
[44/86] hugetlbfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/a9701db0ca64
[45/86] isofs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/362d327da07e
[46/86] jffs2: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/36a8a5a63218
[47/86] jfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/acd529413de5
[48/86] kernfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/05acde68936b
[49/86] minix: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/34c1ca111ec1
[50/86] nfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/77e808456854
[51/86] nfsd: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/a800ed7ebbbf
[52/86] nilfs2: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/4ddc9518c2fa
[53/86] ntfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/0d15c2118b1a
[54/86] ntfs3: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/82f8d5fde753
[55/86] ocfs2: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/45251ebaca70
[56/86] omfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/e7c1ff814326
[57/86] openpromfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/cb62db1d3c61
[58/86] orangefs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/68e257a49aed
[59/86] overlayfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/d482d98dc1bd
[60/86] proc: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/8c8afe8a25fa
[61/86] pstore: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/b0be548328a2
[62/86] qnx4: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/c28589f2d838
[63/86] qnx6: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/ae0f3d29e728
[64/86] ramfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/6315fd97a8fc
[65/86] reiserfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/8eceb9b75a5b
[66/86] romfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/6d3dd456da31
[67/86] client: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/b14d4c14f51b
[68/86] server: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/bec3d7ffcecd
[69/86] squashfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/d7d5ff75af52
[70/86] sysv: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/39f012d8743e
[71/86] tracefs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/22ada3856de8
[72/86] ubifs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/af8b66e1d4b7
[73/86] udf: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/1da45142f95a
[74/86] ufs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/41c46d3bb9b3
[75/86] vboxsf: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/cc36ec7935eb
[76/86] xfs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/ee3be90b2ba7
[77/86] zonefs: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/8c798cc16b17
[78/86] linux: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/dd53b64b6f51
[79/86] ipc: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/f132b3723b71
[80/86] bpf: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/448a018f67a3
[81/86] mm: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/b6f5b3d5ffc9
[82/86] sunrpc: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/fc9db028b8d7
[83/86] apparmor: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/794ef2a745ec
[84/86] selinux: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/3d57ee3686d7
[85/86] security: convert to new timestamp accessors
        https://git.kernel.org/vfs/vfs/c/71f6d9ebaf43
[86/86] fs: rename inode i_atime and i_mtime fields
        https://git.kernel.org/vfs/vfs/c/fea0e8fc7829


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
