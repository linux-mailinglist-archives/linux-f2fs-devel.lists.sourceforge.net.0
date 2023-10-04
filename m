Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 89C5E7B8B70
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Oct 2023 20:53:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qo6zp-0002v3-7E;
	Wed, 04 Oct 2023 18:53:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qo6zn-0002ud-KL;
 Wed, 04 Oct 2023 18:53:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=unNUcEec+SGV+uDsnLtxSVad26ekVVI8AperL64RTOA=; b=Rjg4J2HApAOqo8yFaKaCGOHh3X
 TUzExbh6jYW4EsntBabFJ4yEaFeh8AWQedodY5QesuhfDdGJPxat9s2LgA83zoUjc48ByhyIfZE6Z
 7/VbyLaTqUvI4MD1hDY+AaJwZH4vVPqDd+C+xKl/Y4FnQZ0MWHk6MFffUQDy26ji3pyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=unNUcEec+SGV+uDsnLtxSVad26ekVVI8AperL64RTOA=; b=Sop/NDxrVpCx3sTvv+fVHyP7vE
 fuowby6M0iQXEqb/9YtlbjvCMbHcV638tLTt0/bUsPGnhPnrcYu33/QQUQbe++lpj4ps7Cw6iMZ4b
 Kn7xBtZhmCy6+TVksKgiuXTJ8QwC8wX/x/aZ4DmEmTPpwbE1sQz3UnjVTKXKbOUIbXHk=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qo6zl-00054O-TF; Wed, 04 Oct 2023 18:53:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 24AE1CE1E70;
 Wed,  4 Oct 2023 18:53:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 991D0C4AF5D;
 Wed,  4 Oct 2023 18:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696445590;
 bh=D6ZmjuGzwm6T+vyily+kDIFcQOdKBE4hFTbZ/ePB+AU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=itt8PzKJ3oWcrWlkMnCNvO4V6JTvOPUcLklZdoWmgvE5EApLHzHWrmToC24YZNaD5
 IXhfNXxqslFjk2IDoML0tgHmxZeVSse9inCpsSBFQSfTlM1ZaWIaW/14Rx1EGjZsGv
 ntPIZbb8JIR5CnQGLAz3U+Yl+EqlRJ7alNTo2vhAqP1qPDfCkGnYm9uO4hbjfLGGYe
 YEvpoo+MWSAaL6IHDgaS7acBet/4WUTpUf2h/c5f8fTK/EJTvBZGCYjPEshuHePoR6
 5qJESbj+fdqCM8yjNUYu0BZ+4eFYl4Bgrydaw45QVSAj3T6mpEPEYoifAe1zFkZy7d
 wEjqNw+7VtILg==
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
 Eric Paris <eparis@parisplace.org>,
 Kent Overstreet <kent.overstreet@linux.dev>,
 Brian Foster <bfoster@redhat.com>
Date: Wed,  4 Oct 2023 14:52:38 -0400
Message-ID: <20231004185239.80830-2-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004185239.80830-1-jlayton@kernel.org>
References: <20231004185221.80802-1-jlayton@kernel.org>
 <20231004185239.80830-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert the core vfs code to use the new timestamp accessor
 functions. Signed-off-by: Jeff Layton <jlayton@kernel.org> --- fs/attr.c
 | 4 ++-- fs/bad_inode.c | 2 +- fs/binfmt_misc.c | 2 +- fs/inode.c | 35
 +++++++++++++++++++++ fs/nsfs.c | 2 +- fs/pipe.c | 2 [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qo6zl-00054O-TF
Subject: [f2fs-dev] [PATCH v2 02/89] fs: convert core infrastructure to new
 timestamp accessors
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
 linux-bcachefs@vger.kernel.org, linux-serial@vger.kernel.org,
 linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, linux-cifs@vger.kernel.org,
 selinux@vger.kernel.org, apparmor@lists.ubuntu.com, autofs@vger.kernel.org,
 linux-um@lists.infradead.org, reiserfs-devel@vger.kernel.org,
 ocfs2-devel@lists.linux.dev, ceph-devel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net,
 linuxppc-dev@lists.ozlabs.org, v9fs@lists.linux.dev, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-security-module@vger.kernel.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, bpf@vger.kernel.org, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert the core vfs code to use the new timestamp accessor functions.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/attr.c        |  4 ++--
 fs/bad_inode.c   |  2 +-
 fs/binfmt_misc.c |  2 +-
 fs/inode.c       | 35 +++++++++++++++++++++--------------
 fs/nsfs.c        |  2 +-
 fs/pipe.c        |  2 +-
 fs/stack.c       |  4 ++--
 fs/stat.c        |  4 ++--
 8 files changed, 31 insertions(+), 24 deletions(-)

diff --git a/fs/attr.c b/fs/attr.c
index a8ae5f6d9b16..bdf5deb06ea9 100644
--- a/fs/attr.c
+++ b/fs/attr.c
@@ -308,9 +308,9 @@ void setattr_copy(struct mnt_idmap *idmap, struct inode *inode,
 	i_uid_update(idmap, attr, inode);
 	i_gid_update(idmap, attr, inode);
 	if (ia_valid & ATTR_ATIME)
-		inode->i_atime = attr->ia_atime;
+		inode_set_atime_to_ts(inode, attr->ia_atime);
 	if (ia_valid & ATTR_MTIME)
-		inode->i_mtime = attr->ia_mtime;
+		inode_set_mtime_to_ts(inode, attr->ia_mtime);
 	if (ia_valid & ATTR_CTIME)
 		inode_set_ctime_to_ts(inode, attr->ia_ctime);
 	if (ia_valid & ATTR_MODE) {
diff --git a/fs/bad_inode.c b/fs/bad_inode.c
index 83f9566c973b..316d88da2ce1 100644
--- a/fs/bad_inode.c
+++ b/fs/bad_inode.c
@@ -208,7 +208,7 @@ void make_bad_inode(struct inode *inode)
 	remove_inode_hash(inode);
 
 	inode->i_mode = S_IFREG;
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 	inode->i_op = &bad_inode_ops;	
 	inode->i_opflags &= ~IOP_XATTR;
 	inode->i_fop = &bad_file_ops;	
diff --git a/fs/binfmt_misc.c b/fs/binfmt_misc.c
index e0108d17b085..5d2be9b0a0a5 100644
--- a/fs/binfmt_misc.c
+++ b/fs/binfmt_misc.c
@@ -547,7 +547,7 @@ static struct inode *bm_get_inode(struct super_block *sb, int mode)
 	if (inode) {
 		inode->i_ino = get_next_ino();
 		inode->i_mode = mode;
-		inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+		simple_inode_init_ts(inode);
 	}
 	return inode;
 }
diff --git a/fs/inode.c b/fs/inode.c
index 3bb6193f436c..4f8984b97df0 100644
--- a/fs/inode.c
+++ b/fs/inode.c
@@ -1837,27 +1837,29 @@ EXPORT_SYMBOL(bmap);
 static int relatime_need_update(struct vfsmount *mnt, struct inode *inode,
 			     struct timespec64 now)
 {
-	struct timespec64 ctime;
+	struct timespec64 atime, mtime, ctime;
 
 	if (!(mnt->mnt_flags & MNT_RELATIME))
 		return 1;
 	/*
 	 * Is mtime younger than or equal to atime? If yes, update atime:
 	 */
-	if (timespec64_compare(&inode->i_mtime, &inode->i_atime) >= 0)
+	atime = inode_get_atime(inode);
+	mtime = inode_get_mtime(inode);
+	if (timespec64_compare(&mtime, &atime) >= 0)
 		return 1;
 	/*
 	 * Is ctime younger than or equal to atime? If yes, update atime:
 	 */
 	ctime = inode_get_ctime(inode);
-	if (timespec64_compare(&ctime, &inode->i_atime) >= 0)
+	if (timespec64_compare(&ctime, &atime) >= 0)
 		return 1;
 
 	/*
 	 * Is the previous atime value older than a day? If yes,
 	 * update atime:
 	 */
-	if ((long)(now.tv_sec - inode->i_atime.tv_sec) >= 24*60*60)
+	if ((long)(now.tv_sec - atime.tv_sec) >= 24*60*60)
 		return 1;
 	/*
 	 * Good, we can skip the atime update:
@@ -1888,12 +1890,13 @@ int inode_update_timestamps(struct inode *inode, int flags)
 
 	if (flags & (S_MTIME|S_CTIME|S_VERSION)) {
 		struct timespec64 ctime = inode_get_ctime(inode);
+		struct timespec64 mtime = inode_get_mtime(inode);
 
 		now = inode_set_ctime_current(inode);
 		if (!timespec64_equal(&now, &ctime))
 			updated |= S_CTIME;
-		if (!timespec64_equal(&now, &inode->i_mtime)) {
-			inode->i_mtime = now;
+		if (!timespec64_equal(&now, &mtime)) {
+			inode_set_mtime_to_ts(inode, now);
 			updated |= S_MTIME;
 		}
 		if (IS_I_VERSION(inode) && inode_maybe_inc_iversion(inode, updated))
@@ -1903,8 +1906,10 @@ int inode_update_timestamps(struct inode *inode, int flags)
 	}
 
 	if (flags & S_ATIME) {
-		if (!timespec64_equal(&now, &inode->i_atime)) {
-			inode->i_atime = now;
+		struct timespec64 atime = inode_get_atime(inode);
+
+		if (!timespec64_equal(&now, &atime)) {
+			inode_set_atime_to_ts(inode, now);
 			updated |= S_ATIME;
 		}
 	}
@@ -1963,7 +1968,7 @@ EXPORT_SYMBOL(inode_update_time);
 bool atime_needs_update(const struct path *path, struct inode *inode)
 {
 	struct vfsmount *mnt = path->mnt;
-	struct timespec64 now;
+	struct timespec64 now, atime;
 
 	if (inode->i_flags & S_NOATIME)
 		return false;
@@ -1989,7 +1994,8 @@ bool atime_needs_update(const struct path *path, struct inode *inode)
 	if (!relatime_need_update(mnt, inode, now))
 		return false;
 
-	if (timespec64_equal(&inode->i_atime, &now))
+	atime = inode_get_atime(inode);
+	if (timespec64_equal(&atime, &now))
 		return false;
 
 	return true;
@@ -2106,17 +2112,18 @@ static int inode_needs_update_time(struct inode *inode)
 {
 	int sync_it = 0;
 	struct timespec64 now = current_time(inode);
-	struct timespec64 ctime;
+	struct timespec64 ts;
 
 	/* First try to exhaust all avenues to not sync */
 	if (IS_NOCMTIME(inode))
 		return 0;
 
-	if (!timespec64_equal(&inode->i_mtime, &now))
+	ts = inode_get_mtime(inode);
+	if (!timespec64_equal(&ts, &now))
 		sync_it = S_MTIME;
 
-	ctime = inode_get_ctime(inode);
-	if (!timespec64_equal(&ctime, &now))
+	ts = inode_get_ctime(inode);
+	if (!timespec64_equal(&ts, &now))
 		sync_it |= S_CTIME;
 
 	if (IS_I_VERSION(inode) && inode_iversion_need_inc(inode))
diff --git a/fs/nsfs.c b/fs/nsfs.c
index 647a22433bd8..9a4b228d42fa 100644
--- a/fs/nsfs.c
+++ b/fs/nsfs.c
@@ -84,7 +84,7 @@ static int __ns_get_path(struct path *path, struct ns_common *ns)
 		return -ENOMEM;
 	}
 	inode->i_ino = ns->inum;
-	inode->i_mtime = inode->i_atime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 	inode->i_flags |= S_IMMUTABLE;
 	inode->i_mode = S_IFREG | S_IRUGO;
 	inode->i_fop = &ns_file_operations;
diff --git a/fs/pipe.c b/fs/pipe.c
index 485e3be8903c..8916c455a469 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -908,7 +908,7 @@ static struct inode * get_pipe_inode(void)
 	inode->i_mode = S_IFIFO | S_IRUSR | S_IWUSR;
 	inode->i_uid = current_fsuid();
 	inode->i_gid = current_fsgid();
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 
 	return inode;
 
diff --git a/fs/stack.c b/fs/stack.c
index b5e01bdb5f5f..f18920119944 100644
--- a/fs/stack.c
+++ b/fs/stack.c
@@ -66,8 +66,8 @@ void fsstack_copy_attr_all(struct inode *dest, const struct inode *src)
 	dest->i_uid = src->i_uid;
 	dest->i_gid = src->i_gid;
 	dest->i_rdev = src->i_rdev;
-	dest->i_atime = src->i_atime;
-	dest->i_mtime = src->i_mtime;
+	inode_set_atime_to_ts(dest, inode_get_atime(src));
+	inode_set_mtime_to_ts(dest, inode_get_mtime(src));
 	inode_set_ctime_to_ts(dest, inode_get_ctime(src));
 	dest->i_blkbits = src->i_blkbits;
 	dest->i_flags = src->i_flags;
diff --git a/fs/stat.c b/fs/stat.c
index d43a5cc1bfa4..24bb0209e459 100644
--- a/fs/stat.c
+++ b/fs/stat.c
@@ -57,8 +57,8 @@ void generic_fillattr(struct mnt_idmap *idmap, u32 request_mask,
 	stat->gid = vfsgid_into_kgid(vfsgid);
 	stat->rdev = inode->i_rdev;
 	stat->size = i_size_read(inode);
-	stat->atime = inode->i_atime;
-	stat->mtime = inode->i_mtime;
+	stat->atime = inode_get_atime(inode);
+	stat->mtime = inode_get_mtime(inode);
 	stat->ctime = inode_get_ctime(inode);
 	stat->blksize = i_blocksize(inode);
 	stat->blocks = inode->i_blocks;
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
