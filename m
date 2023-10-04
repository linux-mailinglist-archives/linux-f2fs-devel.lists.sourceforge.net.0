Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D91527B8B6B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Oct 2023 20:53:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qo6zh-0007Sb-RT;
	Wed, 04 Oct 2023 18:53:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1qo6zf-0007SC-Fk;
 Wed, 04 Oct 2023 18:53:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QWhhZ2HY3q6y+CdS0jBj7wQXCOI69iF98oOeRBayFwM=; b=UicPQgKiBYkt6iNldTBcdpzdT3
 9XKsN24SNNJf/mVXxXjYMMqRNtkVUpOLKhY8KEMQgSN75Bqs6NJybqHG+YqxoDr6sdtIj1G7Ey9as
 cAy3MWHEiBH/4o3Zn8HWCI1nNI47Nc2tfCX86wzPcIEXxxkubIbJLKkoad/ic+mDs8ls=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QWhhZ2HY3q6y+CdS0jBj7wQXCOI69iF98oOeRBayFwM=; b=JGWjft2bb+NQkBlu3gsFLWwvMw
 g0nFU+Yq/iyn1TXf51egcqIxhQTQgat4u5+W0W1s5cR3vu0+dQewo9NRGXsHLSjSP7Ktrfh+Zf42G
 9RvmmtJ4Vtg60lz50xQckrHpRD1mSCn4tLvd8GYSH83mQjjRYgQreorg8T6qRoThZKyo=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qo6zb-00053v-DQ; Wed, 04 Oct 2023 18:53:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8A2B8CE1DE0;
 Wed,  4 Oct 2023 18:52:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 408DBC433D9;
 Wed,  4 Oct 2023 18:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696445575;
 bh=P50VBvZT3ngOZd5GDZltcCl374+Fh0mYUNMVsQK9mlI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BecAjuFhPIlkVHiFVOjjY3Xkns4no3JWbmomh9+1c0Fh7B56ALsgl1Wvk3D7TsLmq
 wvswlVAyW4HhBMnSsy2sgrhtBP8+Arsg01ketJyqIgO8KYPb9sHEibNppcVG3X3fn7
 G2xWJuGgd+plODbbmIc/mVkBuNva0I/5VJG87hKdjtIIl0nCtU2eQS3zZYeVPKsdso
 iomUCy6ivXxV8b4V6veU8FcVKKviBhA3bGX5csMk1MhzcgNqCwCPxd4fIqJXYXFXwV
 Q0/ezJ/cGZu2/nHKsnqxHueOsyhRZB2oKflbg6PxD7hnRagtvUTcydQsxoqaGOzpop
 FmiFQ7UWuU5KA==
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
Date: Wed,  4 Oct 2023 14:52:37 -0400
Message-ID: <20231004185239.80830-1-jlayton@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231004185221.80802-1-jlayton@kernel.org>
References: <20231004185221.80802-1-jlayton@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Recently, we converted the ctime accesses in the kernel to
 use new accessor functions. Linus recently pointed out though that if we
 add accessors for the atime and mtime, then that would allow us to s [...]
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qo6zb-00053v-DQ
Subject: [f2fs-dev] [PATCH v2 01/89] fs: new accessor methods for atime and
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

Recently, we converted the ctime accesses in the kernel to use new
accessor functions. Linus recently pointed out though that if we add
accessors for the atime and mtime, then that would allow us to
seamlessly change how these timestamps are stored in the inode.

Add new accessor functions for the atime and mtime that mirror the
accessors for the ctime.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/libfs.c         | 41 ++++++++++++++++------
 include/linux/fs.h | 85 +++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 102 insertions(+), 24 deletions(-)

diff --git a/fs/libfs.c b/fs/libfs.c
index 37f2d34ee090..abe2b5a40ba1 100644
--- a/fs/libfs.c
+++ b/fs/libfs.c
@@ -541,7 +541,8 @@ void simple_recursive_removal(struct dentry *dentry,
 				dput(victim);		// unpin it
 			}
 			if (victim == dentry) {
-				inode->i_mtime = inode_set_ctime_current(inode);
+				inode_set_mtime_to_ts(inode,
+						      inode_set_ctime_current(inode));
 				if (d_is_dir(dentry))
 					drop_nlink(inode);
 				inode_unlock(inode);
@@ -582,7 +583,7 @@ static int pseudo_fs_fill_super(struct super_block *s, struct fs_context *fc)
 	 */
 	root->i_ino = 1;
 	root->i_mode = S_IFDIR | S_IRUSR | S_IWUSR;
-	root->i_atime = root->i_mtime = inode_set_ctime_current(root);
+	simple_inode_init_ts(root);
 	s->s_root = d_make_root(root);
 	if (!s->s_root)
 		return -ENOMEM;
@@ -638,8 +639,8 @@ int simple_link(struct dentry *old_dentry, struct inode *dir, struct dentry *den
 {
 	struct inode *inode = d_inode(old_dentry);
 
-	dir->i_mtime = inode_set_ctime_to_ts(dir,
-					     inode_set_ctime_current(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_set_ctime_current(inode)));
 	inc_nlink(inode);
 	ihold(inode);
 	dget(dentry);
@@ -673,8 +674,8 @@ int simple_unlink(struct inode *dir, struct dentry *dentry)
 {
 	struct inode *inode = d_inode(dentry);
 
-	dir->i_mtime = inode_set_ctime_to_ts(dir,
-					     inode_set_ctime_current(inode));
+	inode_set_mtime_to_ts(dir,
+			      inode_set_ctime_to_ts(dir, inode_set_ctime_current(inode)));
 	drop_nlink(inode);
 	dput(dentry);
 	return 0;
@@ -709,9 +710,10 @@ void simple_rename_timestamp(struct inode *old_dir, struct dentry *old_dentry,
 {
 	struct inode *newino = d_inode(new_dentry);
 
-	old_dir->i_mtime = inode_set_ctime_current(old_dir);
+	inode_set_mtime_to_ts(old_dir, inode_set_ctime_current(old_dir));
 	if (new_dir != old_dir)
-		new_dir->i_mtime = inode_set_ctime_current(new_dir);
+		inode_set_mtime_to_ts(new_dir,
+				      inode_set_ctime_current(new_dir));
 	inode_set_ctime_current(d_inode(old_dentry));
 	if (newino)
 		inode_set_ctime_current(newino);
@@ -926,7 +928,7 @@ int simple_fill_super(struct super_block *s, unsigned long magic,
 	 */
 	inode->i_ino = 1;
 	inode->i_mode = S_IFDIR | 0755;
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 	inode->i_op = &simple_dir_inode_operations;
 	inode->i_fop = &simple_dir_operations;
 	set_nlink(inode, 2);
@@ -952,7 +954,7 @@ int simple_fill_super(struct super_block *s, unsigned long magic,
 			goto out;
 		}
 		inode->i_mode = S_IFREG | files->mode;
-		inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+		simple_inode_init_ts(inode);
 		inode->i_fop = files->ops;
 		inode->i_ino = i;
 		d_add(dentry, inode);
@@ -1520,7 +1522,7 @@ struct inode *alloc_anon_inode(struct super_block *s)
 	inode->i_uid = current_fsuid();
 	inode->i_gid = current_fsgid();
 	inode->i_flags |= S_PRIVATE;
-	inode->i_atime = inode->i_mtime = inode_set_ctime_current(inode);
+	simple_inode_init_ts(inode);
 	return inode;
 }
 EXPORT_SYMBOL(alloc_anon_inode);
@@ -1912,3 +1914,20 @@ ssize_t direct_write_fallback(struct kiocb *iocb, struct iov_iter *iter,
 	return direct_written + buffered_written;
 }
 EXPORT_SYMBOL_GPL(direct_write_fallback);
+
+/**
+ * simple_inode_init_ts - initialize the timestamps for a new inode
+ * @inode: inode to be initialized
+ *
+ * When a new inode is created, most filesystems set the timestamps to the
+ * current time. Add a helper to do this.
+ */
+struct timespec64 simple_inode_init_ts(struct inode *inode)
+{
+	struct timespec64 ts = inode_set_ctime_current(inode);
+
+	inode_set_atime_to_ts(inode, ts);
+	inode_set_mtime_to_ts(inode, ts);
+	return ts;
+}
+EXPORT_SYMBOL(simple_inode_init_ts);
diff --git a/include/linux/fs.h b/include/linux/fs.h
index 7b8c6a9d52ec..3ca610d42176 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -1515,24 +1515,81 @@ static inline bool fsuidgid_has_mapping(struct super_block *sb,
 struct timespec64 current_time(struct inode *inode);
 struct timespec64 inode_set_ctime_current(struct inode *inode);
 
-/**
- * inode_get_ctime - fetch the current ctime from the inode
- * @inode: inode from which to fetch ctime
- *
- * Grab the current ctime from the inode and return it.
- */
+static inline time64_t inode_get_atime_sec(const struct inode *inode)
+{
+	return inode->i_atime.tv_sec;
+}
+
+static inline long inode_get_atime_nsec(const struct inode *inode)
+{
+	return inode->i_atime.tv_nsec;
+}
+
+static inline struct timespec64 inode_get_atime(const struct inode *inode)
+{
+	return inode->i_atime;
+}
+
+static inline struct timespec64 inode_set_atime_to_ts(struct inode *inode,
+						      struct timespec64 ts)
+{
+	inode->i_atime = ts;
+	return ts;
+}
+
+static inline struct timespec64 inode_set_atime(struct inode *inode,
+						time64_t sec, long nsec)
+{
+	struct timespec64 ts = { .tv_sec  = sec,
+				 .tv_nsec = nsec };
+	return inode_set_atime_to_ts(inode, ts);
+}
+
+static inline time64_t inode_get_mtime_sec(const struct inode *inode)
+{
+	return inode->i_mtime.tv_sec;
+}
+
+static inline long inode_get_mtime_nsec(const struct inode *inode)
+{
+	return inode->i_mtime.tv_nsec;
+}
+
+static inline struct timespec64 inode_get_mtime(const struct inode *inode)
+{
+	return inode->i_mtime;
+}
+
+static inline struct timespec64 inode_set_mtime_to_ts(struct inode *inode,
+						      struct timespec64 ts)
+{
+	inode->i_mtime = ts;
+	return ts;
+}
+
+static inline struct timespec64 inode_set_mtime(struct inode *inode,
+						time64_t sec, long nsec)
+{
+	struct timespec64 ts = { .tv_sec  = sec,
+				 .tv_nsec = nsec };
+	return inode_set_mtime_to_ts(inode, ts);
+}
+
+static inline time64_t inode_get_ctime_sec(const struct inode *inode)
+{
+	return inode->__i_ctime.tv_sec;
+}
+
+static inline long inode_get_ctime_nsec(const struct inode *inode)
+{
+	return inode->__i_ctime.tv_nsec;
+}
+
 static inline struct timespec64 inode_get_ctime(const struct inode *inode)
 {
 	return inode->__i_ctime;
 }
 
-/**
- * inode_set_ctime_to_ts - set the ctime in the inode
- * @inode: inode in which to set the ctime
- * @ts: value to set in the ctime field
- *
- * Set the ctime in @inode to @ts
- */
 static inline struct timespec64 inode_set_ctime_to_ts(struct inode *inode,
 						      struct timespec64 ts)
 {
@@ -1557,6 +1614,8 @@ static inline struct timespec64 inode_set_ctime(struct inode *inode,
 	return inode_set_ctime_to_ts(inode, ts);
 }
 
+struct timespec64 simple_inode_init_ts(struct inode *inode);
+
 /*
  * Snapshotting support.
  */
-- 
2.41.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
