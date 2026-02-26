Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KGC8GjFuoGkHjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:00:49 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB21A962B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:00:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kpKqHHx5wavDcSkBWaqhKmEj2syflQ4IRDRgXZfo6M=; b=iUgSH5jR3wmJ46lkHadPZBuIE2
	r4j/NdhzGSxp3zp6FVrQZtOGN/Bj1zHJB1i4xnoBF18tFiPorKv+b2b6kdk1OpOhEpUeUTgf+jk4x
	wP5KuKOvEXxJbpqyqJpX55ZDB/uzldgmL7qdJsFaAHpK+q0VQujXPoZKlHP2YkztR+0k=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdnC-0003vb-Av;
	Thu, 26 Feb 2026 16:00:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdn7-0003v9-I2;
 Thu, 26 Feb 2026 16:00:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lYlkEr09/aInVhLnFKkfxo6QnM4132E3DVBiWR1kRME=; b=CFx62VHT7aZfVMnpK+reek6PQE
 HV2C3VmKKWTkR/N/6gujfa8RYG0gyf60IeBuF5vlFd3gihPTpEAzMDRoFmtx3xtfdDqxqqyIizpjG
 6UOou0l4PF9DGHpMxqd9LogH3OLaXrfezVyczLJneYkKES/RLjP0e3zDsZDa4bHbcvds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lYlkEr09/aInVhLnFKkfxo6QnM4132E3DVBiWR1kRME=; b=LVZoC/MAXIiaGJdstX/jBOyFBM
 hWydV1jyuB1u1HLuEhs6Z5iwaVsAvjq98VmgnnT0vYmoc/prZr/dSc4nT63qF1CsU8mnfr+rBefx0
 540jSyy8nx4iCM77DhqZDRYC41DfRx7zt1XPJAsczqqt0n3hXbR+p4Tt/SsyhPy1nwq0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdn5-0005DC-Vs; Thu, 26 Feb 2026 16:00:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 2679F6111B;
 Thu, 26 Feb 2026 16:00:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6ADC2BCB6;
 Thu, 26 Feb 2026 16:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121628;
 bh=T4XOURJp5h6a0W+w6Slhd7r2zVOXmWLyb5oaovUOm6s=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=HYTbh8az9ttre2WoQ3PB5MGwQxAiiploAPcWAy93PIxVejigQcZDcMkTnfaGW8HgR
 lTA7Pb1/NOMO83NTvalDUDSElKXMxtvLDHgmXRvT8DZq7TWtAODghENsLgepuGwCdh
 Pb7MLLg/AFm5mEmSnA0W6cOba53KeeKBRJuWMNOtIkBDyNvU/lFp/7OHDCTFTd8izc
 YzzeIR3xEvFuqHTvzU5WZ6akTwHBiLw/lG0kXIYOcle1pKp6l2vHhl3PhbFk1DlxXI
 siJmnZMwWR2mTtQTkRDpA9w8jfwFg86GAPmVFa0vrH2ByNRt7nUjALiU7hMNSkimpP
 r7/FNozXlhnEg==
Date: Thu, 26 Feb 2026 10:55:22 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-20-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3827; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=T4XOURJp5h6a0W+w6Slhd7r2zVOXmWLyb5oaovUOm6s=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0Jd3rTJKBznl41a30r5qtD/z0aeq/r47sgP
 CVEl5KncpyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCQAKCRAADmhBGVaC
 FfTFD/91T+jSkWFt3wxt6E+853oG/5gpw6xS6mUwZV8IgcoYswcYSqbkTpqsCPaikzV0xFXpX+p
 92d/7BN9iTdm3au3BsH44pHnkX7XObNAg9sdTQP52K6DjP4Ufwz7XbXpPc0tQ2fThZjUWNGiOJ6
 bme3H1hM/w0HUxB2616Sz0uqNvSQGjvaUnUv72hTiXrsEkZ4m3tYZDBBP/Uiq9vEV4vgQn99aMC
 JrQDxxuyEz5xnv9psyVOfUi7H8UCZmc0rqJDf7njZ/Qf9W1K1iSTJiCAmz8prECctblCpvbBewD
 ue7i7WUwkbgbb8INumtZy3sWluypc5dMkD1zRITFM7W4trbEHZx2P3g2pJbplJ4SlgpS0ahhVsk
 Shfnhfm7R3smVsVJBsM9s3OmcMuTO8LFbLFyVK6q/6RO5qnx45HwHHsP4oLAs79iBQLqFt93DOa
 iO3Z6XuLlcEM7M2hi90gY2GAKLbiLs6G/QWEpfFC+IVSoCJqXFcBv8vbp5JGPSPrlubPwc1myaF
 TS5RtvR/iXMmTfsM7ypKOkxmThIMIFh/phF4TckHqHH7B8FfxJC+36v9VFeimnBDc92ZfkCM1Ae
 R070EpuJNv/2J3/k9D2zcnmnuhcgE5roc4eEEVayPUeRtrDZkWkX6QNUOAsKz2oJ97LwFSIPkWZ
 xjAju7Q478qpNxQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update format strings and local variable types in afs for
 the i_ino type change from unsigned long to u64. Signed-off-by: Jeff Layton
 <jlayton@kernel.org> --- fs/afs/dir.c | 10 +++++----- fs/afs/dir_search.c
 | 2 +- fs/afs/dynroot.c | 2 +- fs/afs/inode.c | 2 +- 4 files changed,
 8 insertions(+), 8 deletions( [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvdn5-0005DC-Vs
Subject: [f2fs-dev] [PATCH 20/61] afs: update format strings for u64 i_ino
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
X-Rspamd-Queue-Id: AEEB21A962B
X-Rspamd-Action: no action

Update format strings and local variable types in afs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/afs/dir.c        | 10 +++++-----
 fs/afs/dir_search.c |  2 +-
 fs/afs/dynroot.c    |  2 +-
 fs/afs/inode.c      |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/afs/dir.c b/fs/afs/dir.c
index 78caef3f13388c5f604e4970bc0874de168b57f3..aaaa55878ffd28691777668261f577d7a9472d6d 100644
--- a/fs/afs/dir.c
+++ b/fs/afs/dir.c
@@ -148,7 +148,7 @@ static bool afs_dir_check_block(struct afs_vnode *dvnode, size_t progress,
 				union afs_xdr_dir_block *block)
 {
 	if (block->hdr.magic != AFS_DIR_MAGIC) {
-		pr_warn("%s(%lx): [%zx] bad magic %04x\n",
+		pr_warn("%s(%llx): [%zx] bad magic %04x\n",
 		       __func__, dvnode->netfs.inode.i_ino,
 		       progress, ntohs(block->hdr.magic));
 		trace_afs_dir_check_failed(dvnode, progress);
@@ -214,7 +214,7 @@ static int afs_dir_check(struct afs_vnode *dvnode)
  */
 static int afs_dir_open(struct inode *inode, struct file *file)
 {
-	_enter("{%lu}", inode->i_ino);
+	_enter("{%llu}", inode->i_ino);
 
 	BUILD_BUG_ON(sizeof(union afs_xdr_dir_block) != 2048);
 	BUILD_BUG_ON(sizeof(union afs_xdr_dirent) != 32);
@@ -523,7 +523,7 @@ static int afs_dir_iterate(struct inode *dir, struct dir_context *ctx,
 	int retry_limit = 100;
 	int ret;
 
-	_enter("{%lu},%llx,,", dir->i_ino, ctx->pos);
+	_enter("{%llu},%llx,,", dir->i_ino, ctx->pos);
 
 	do {
 		if (--retry_limit < 0) {
@@ -610,7 +610,7 @@ static int afs_do_lookup_one(struct inode *dir, const struct qstr *name,
 	};
 	int ret;
 
-	_enter("{%lu},{%.*s},", dir->i_ino, name->len, name->name);
+	_enter("{%llu},{%.*s},", dir->i_ino, name->len, name->name);
 
 	/* search the directory */
 	ret = afs_dir_iterate(dir, &cookie.ctx, NULL, _dir_version);
@@ -783,7 +783,7 @@ static struct inode *afs_do_lookup(struct inode *dir, struct dentry *dentry)
 	long ret;
 	int i;
 
-	_enter("{%lu},%p{%pd},", dir->i_ino, dentry, dentry);
+	_enter("{%llu},%p{%pd},", dir->i_ino, dentry, dentry);
 
 	cookie = kzalloc_obj(struct afs_lookup_cookie);
 	if (!cookie)
diff --git a/fs/afs/dir_search.c b/fs/afs/dir_search.c
index d2516e55b5edb273677c9cedb6f15524bc56348d..104411c0692f570a217d8f0e6fd35818eaa02932 100644
--- a/fs/afs/dir_search.c
+++ b/fs/afs/dir_search.c
@@ -194,7 +194,7 @@ int afs_dir_search(struct afs_vnode *dvnode, const struct qstr *name,
 	struct afs_dir_iter iter = { .dvnode = dvnode, };
 	int ret, retry_limit = 3;
 
-	_enter("{%lu},,,", dvnode->netfs.inode.i_ino);
+	_enter("{%llu},,,", dvnode->netfs.inode.i_ino);
 
 	if (!afs_dir_init_iter(&iter, name))
 		return -ENOENT;
diff --git a/fs/afs/dynroot.c b/fs/afs/dynroot.c
index aa56e8951e037b2e3fa9fc452b43e7bd2d61b926..1d5e33bc750224d063446ea952d5ef97a2481010 100644
--- a/fs/afs/dynroot.c
+++ b/fs/afs/dynroot.c
@@ -59,7 +59,7 @@ static struct inode *afs_iget_pseudo_dir(struct super_block *sb, ino_t ino)
 		return ERR_PTR(-ENOMEM);
 	}
 
-	_debug("GOT INODE %p { ino=%lu, vl=%llx, vn=%llx, u=%x }",
+	_debug("GOT INODE %p { ino=%llu, vl=%llx, vn=%llx, u=%x }",
 	       inode, inode->i_ino, fid.vid, fid.vnode, fid.unique);
 
 	vnode = AFS_FS_I(inode);
diff --git a/fs/afs/inode.c b/fs/afs/inode.c
index dde1857fcabb302cc6b06cc018fb1e4108ec6284..a5173434f7862e92a127994c56b89f530ad4c298 100644
--- a/fs/afs/inode.c
+++ b/fs/afs/inode.c
@@ -683,7 +683,7 @@ int afs_getattr(struct mnt_idmap *idmap, const struct path *path,
 	struct key *key;
 	int ret, seq;
 
-	_enter("{ ino=%lu v=%u }", inode->i_ino, inode->i_generation);
+	_enter("{ ino=%llu v=%u }", inode->i_ino, inode->i_generation);
 
 	if (vnode->volume &&
 	    !(query_flags & AT_STATX_DONT_SYNC) &&

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
