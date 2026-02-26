Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WKtkFZxtoGkHjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:58:20 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D89371A9471
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:58:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSfiXcenGLUYMUbGFpv1PY/SEQzgPNdyebMuKPgKuH4=; b=H9HUGMh9nQL+7/tNOwzJ2/zIRx
	fhuHcsVR96NTsm/sxl2lRn6UcQ/Yz2z+ukYhtxmWWRCF0g2cQQ/3WEyBnlNqkArGEw3bBzIVFLVDO
	sudv/H3Pl4qcqydTS/aG0KyNXctQXxWTf7sCIt0/yT6y3/Te0nPaRtYF5Kqx5APQRzCc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdko-0001u6-H8;
	Thu, 26 Feb 2026 15:58:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdkm-0001ti-OM;
 Thu, 26 Feb 2026 15:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/jgAvZj06sMP+kfafd+rUi/KM/UcAIqWvgADbdI6e9M=; b=dlJAUo5+U9qaN/7/vqEGgYP7Jc
 iPRhM+ORjKSn3L3Oc8tq58COr1IZbbDjVrbn0w7ml3BuQfxpFsMkQB6I7a+V7c/QFX4ihS5b1aepj
 rZHjEXWx+wQVIRTXa+NJqUg8IoeDKipVU478Qv1I7hWedMfY5D2QAEqkO3BjtjM3yUFg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/jgAvZj06sMP+kfafd+rUi/KM/UcAIqWvgADbdI6e9M=; b=ekMGddVYQ8fxAiBMv0VzU5gzt9
 Jj7EQztU0T3ceNZLJMikZSSjZ7hIc8SGBGmL6l3y5kP1CCQyuP4Bnx+yBk/RsdQQYxQgX4ghj0Dr7
 Qa0VIXCluAUntMIpJJblJ8hpmQU5/cC5vPoZDK1uZZ6K7QyXi6RMY5kgVdA7lbJwiYn4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdkm-0004va-7Y; Thu, 26 Feb 2026 15:58:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C6592403CA;
 Thu, 26 Feb 2026 15:58:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D41DC2BCB2;
 Thu, 26 Feb 2026 15:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121490;
 bh=ozE/lysUboEWCQ4+AsDbyvozbN/xqnJrVIKCk8YVbZ8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Tl95cpRHVEy9a69M1dPyVMNrFACinfcHkMSnrsJSJ41F1IPipWKjqo400vZ/NbQmL
 YUPeHdgF2ouooH4/jZnPdmjQPX2RSD6dAFNXEQ4tMNkFK1U5S52ZKh6MacyqQwTE26
 wtSaX+iIVp1eFKbZDh7W12pyubn8xXSAdxvT8s1HINUFUGTtKWmViGgo3to2LJ/GNZ
 x3e9HhxcQyaf3N7GJfprPRO8OPW0OeidM/kJazebnZ1I5YfZCZuocYOM79vYH//gbU
 evmOTHvoE55jR4g40jSZIXcwGHIK51p3FtqxaWtIEiTLZ9sMRLpKTTeDM+GABiHWej
 gMu4A7jJHqAHQ==
Date: Thu, 26 Feb 2026 10:55:11 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-9-ccceff366db9@kernel.org>
References: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
In-Reply-To: <20260226-iino-u64-v1-0-ccceff366db9@kernel.org>
To: Alexander Viro <viro@zeniv.linux.org.uk>, 
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Matthew Wilcox <willy@infradead.org>, Eric Biggers <ebiggers@kernel.org>, 
 "Theodore Y. Ts'o" <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>, 
 Oscar Salvador <osalvador@suse.de>, David Hildenbrand <david@kernel.org>, 
 David Howells <dhowells@redhat.com>, Paulo Alcantara <pc@manguebit.org>, 
 Andreas Dilger <adilger.kernel@dilger.ca>, Jan Kara <jack@suse.com>, 
 Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>, 
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>, 
 Chuck Lever <chuck.lever@oracle.com>, NeilBrown <neil@brown.name>, 
 Olga Kornievskaia <okorniev@redhat.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Tom Talpey <tom@talpey.com>, Steve French <sfrench@samba.org>, 
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, 
 Shyam Prasad N <sprasad@microsoft.com>, 
 Bharath SM <bharathsm@microsoft.com>, 
 Alexander Aring <alex.aring@gmail.com>, 
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, 
 Viacheslav Dubeyko <slava@dubeyko.com>, 
 Eric Van Hensbergen <ericvh@kernel.org>, 
 Latchesar Ionkov <lucho@ionkov.net>, 
 Dominique Martinet <asmadeus@codewreck.org>, 
 Christian Schoenebeck <linux_oss@crudebyte.com>, 
 David Sterba <dsterba@suse.com>, Marc Dionne <marc.dionne@auristor.com>, 
 Ian Kent <raven@themaw.net>, Luis de Bethencourt <luisbg@kernel.org>, 
 Salah Triki <salah.triki@gmail.com>, 
 "Tigran A. Aivazian" <aivazian.tigran@gmail.com>, 
 Ilya Dryomov <idryomov@gmail.com>, Alex Markuze <amarkuze@redhat.com>, 
 Jan Harkes <jaharkes@cs.cmu.edu>, coda@cs.cmu.edu, 
 Nicolas Pitre <nico@fluxnic.net>, Tyler Hicks <code@tyhicks.com>, 
 Amir Goldstein <amir73il@gmail.com>, Christoph Hellwig <hch@infradead.org>, 
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, 
 Yangtao Li <frank.li@vivo.com>, 
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, 
 David Woodhouse <dwmw2@infradead.org>, Richard Weinberger <richard@nod.at>, 
 Dave Kleikamp <shaggy@kernel.org>, 
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>, 
 Mark Fasheh <mark@fasheh.com>, Joel Becker <jlbec@evilplan.org>, 
 Joseph Qi <joseph.qi@linux.alibaba.com>, 
 Mike Marshall <hubcap@omnibond.com>, 
 Martin Brandenburg <martin@omnibond.com>, 
 Miklos Szeredi <miklos@szeredi.hu>, Anders Larsen <al@alarsen.net>, 
 Zhihao Cheng <chengzhihao1@huawei.com>, Damien Le Moal <dlemoal@kernel.org>, 
 Naohiro Aota <naohiro.aota@wdc.com>, Johannes Thumshirn <jth@kernel.org>, 
 John Johansen <john.johansen@canonical.com>, 
 Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
 "Serge E. Hallyn" <serge@hallyn.com>, Mimi Zohar <zohar@linux.ibm.com>, 
 Roberto Sassu <roberto.sassu@huawei.com>, 
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, 
 Eric Snowberg <eric.snowberg@oracle.com>, Fan Wu <wufan@kernel.org>, 
 Stephen Smalley <stephen.smalley.work@gmail.com>, 
 Ondrej Mosnacek <omosnace@redhat.com>, 
 Casey Schaufler <casey@schaufler-ca.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Eric Dumazet <edumazet@google.com>, 
 Kuniyuki Iwashima <kuniyu@google.com>, Paolo Abeni <pabeni@redhat.com>, 
 Willem de Bruijn <willemb@google.com>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, Oleg Nesterov <oleg@redhat.com>, 
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 James Clark <james.clark@linaro.org>, "Darrick J. Wong" <djwong@kernel.org>, 
 Martin Schiller <ms@dev.tdt.de>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3123; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ozE/lysUboEWCQ4+AsDbyvozbN/xqnJrVIKCk8YVbZ8=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0GZ9mae1UfEzZjvJD4JiNnRPl5Nhr/tQ1B0
 m90fRG+XeKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtBgAKCRAADmhBGVaC
 FUNNEACfph9HeCWuD/qrlt/anxXHRLFJ+N55/jO9WUFZDUHVC1uWe/qFGQB4inv5lvQdKqPNVQz
 kLo8M1E4LrqRBj3bgzhpjGtBRtdmYiYiFQt2QN/RTJcbwBIijGa0Lkeld9r6/v0YlyZZAyCJfRD
 NhjnwmW+pXiLmqpSqPxIJDI//+XA3Zd7HZfWNvamWsLP7P6pRi50+mxB4gSwNuE82jNnfysQ4hr
 xNgXlVCvaQVFcnQY4nIFqDesc7HZ3I6HsZs5cugSfIC7YhrAHnHgzUX1X3F1N7EqHIvN/ETvTxT
 5Kb1+IsLgP78RH9rlvcaM4+z6gCKQ4I0LX0nhb1q+nOK0/yF0B5Wj4FIAJRtnNLtUiyUcBn2yDU
 2B1itmjUhIwUONEgxN6+sBxZsrkmEvCoxhWKbIvKEt7ouyoJPHotIkpyi4Fy6G3gVMX+D962p6U
 +MNYPcdKlUz440uTYnQ0WbFTn+gtR9UZa+8V2v+kTpWMFOlvIa5ChRPEGDqjaMEAzTtgIJJigwL
 hAJZyp1hVGDXzIakUmhDjansPNiZV5PNsqjr3VQle3FQeHZ7zFF2ts2dXb0dky9ODuyE8mmPumA
 Sq2urAsWLtVirge+Vok4tOUNhvuZqt+IVPyWX3gk0VwWIFDl/IGHt+VH4jnZFmOmgKOzkMYIVTI
 c26wc1AgzjeJcnA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that i_ino is u64, these helpers are trivial identity
 functions that just return the fileid unchanged. Remove them and use
 fattr->fileid
 directly at the two call sites. nfs_fileid_to_ino_t() had no callers at all.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvdkm-0004va-7Y
Subject: [f2fs-dev] [PATCH 09/61] nfs: remove nfs_fattr_to_ino_t() and
 nfs_fileid_to_ino_t()
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
From: Jeff Layton via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jeff Layton <jlayton@kernel.org>
Cc: nvdimm@lists.linux.dev, jfs-discussion@lists.sourceforge.net,
 Jeff Layton <jlayton@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 codalist@coda.cs.cmu.edu, linux-ext4@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 ocfs2-devel@lists.linux.dev, linux-fscrypt@vger.kernel.org,
 linux-hams@vger.kernel.org, ceph-devel@vger.kernel.org,
 linux-xfs@vger.kernel.org, fsverity@lists.linux.dev, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, linux-security-module@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, netfs@lists.linux.dev,
 linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[146];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: D89371A9471
X-Rspamd-Action: no action

Now that i_ino is u64, these helpers are trivial identity functions that
just return the fileid unchanged. Remove them and use fattr->fileid
directly at the two call sites.

nfs_fileid_to_ino_t() had no callers at all.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfs/inode.c         | 17 +++--------------
 include/linux/nfs_fs.h |  6 ------
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/fs/nfs/inode.c b/fs/nfs/inode.c
index 38c7b79e76b3f9eb21d325b98708fe67d159076f..d88f5689548bcb4e27d6087a49b525762fbaa9e2 100644
--- a/fs/nfs/inode.c
+++ b/fs/nfs/inode.c
@@ -66,12 +66,6 @@ static int nfs_update_inode(struct inode *, struct nfs_fattr *);
 
 static struct kmem_cache * nfs_inode_cachep;
 
-static inline u64
-nfs_fattr_to_ino_t(struct nfs_fattr *fattr)
-{
-	return fattr->fileid;
-}
-
 int nfs_wait_bit_killable(struct wait_bit_key *key, int mode)
 {
 	if (unlikely(nfs_current_task_exiting()))
@@ -413,14 +407,12 @@ nfs_ilookup(struct super_block *sb, struct nfs_fattr *fattr, struct nfs_fh *fh)
 		.fattr	= fattr,
 	};
 	struct inode *inode;
-	unsigned long hash;
 
 	if (!(fattr->valid & NFS_ATTR_FATTR_FILEID) ||
 	    !(fattr->valid & NFS_ATTR_FATTR_TYPE))
 		return NULL;
 
-	hash = nfs_fattr_to_ino_t(fattr);
-	inode = ilookup5(sb, hash, nfs_find_actor, &desc);
+	inode = ilookup5(sb, fattr->fileid, nfs_find_actor, &desc);
 
 	dprintk("%s: returning %p\n", __func__, inode);
 	return inode;
@@ -456,7 +448,6 @@ nfs_fhget(struct super_block *sb, struct nfs_fh *fh, struct nfs_fattr *fattr)
 	};
 	struct inode *inode = ERR_PTR(-ENOENT);
 	u64 fattr_supported = NFS_SB(sb)->fattr_valid;
-	unsigned long hash;
 
 	nfs_attr_check_mountpoint(sb, fattr);
 
@@ -467,9 +458,7 @@ nfs_fhget(struct super_block *sb, struct nfs_fh *fh, struct nfs_fattr *fattr)
 	if ((fattr->valid & NFS_ATTR_FATTR_TYPE) == 0)
 		goto out_no_inode;
 
-	hash = nfs_fattr_to_ino_t(fattr);
-
-	inode = iget5_locked(sb, hash, nfs_find_actor, nfs_init_locked, &desc);
+	inode = iget5_locked(sb, fattr->fileid, nfs_find_actor, nfs_init_locked, &desc);
 	if (inode == NULL) {
 		inode = ERR_PTR(-ENOMEM);
 		goto out_no_inode;
@@ -481,7 +470,7 @@ nfs_fhget(struct super_block *sb, struct nfs_fh *fh, struct nfs_fattr *fattr)
 
 		/* We set i_ino for the few things that still rely on it,
 		 * such as stat(2) */
-		inode->i_ino = hash;
+		inode->i_ino = fattr->fileid;
 
 		/* We can't support update_atime(), since the server will reset it */
 		inode->i_flags |= S_NOATIME|S_NOCMTIME;
diff --git a/include/linux/nfs_fs.h b/include/linux/nfs_fs.h
index 0e6d03c10c3de91cac4cd4d08c961e171cbf9a41..816670562d17b3f46ec2d22d4f9412e42f7e1a3b 100644
--- a/include/linux/nfs_fs.h
+++ b/include/linux/nfs_fs.h
@@ -667,12 +667,6 @@ static inline loff_t nfs_size_to_loff_t(__u64 size)
 	return min_t(u64, size, OFFSET_MAX);
 }
 
-static inline u64
-nfs_fileid_to_ino_t(u64 fileid)
-{
-	return fileid;
-}
-
 static inline void nfs_ooo_clear(struct nfs_inode *nfsi)
 {
 	nfsi->cache_validity &= ~NFS_INO_DATA_INVAL_DEFER;

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
