Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iNgJOxxuoGk3jgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:00:28 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E531A9612
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:00:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zAuN0SnwSY9YXxjqpy0cSSz+BDLIMy0fNPAvRqgYZA=; b=kRr7HMK+cJxbUxoBUjyIGtUuw7
	3RT2e93/l0wM696g0+Ww1aQKTn3DO2sL6rdWqw1x2jIdK9DqFQGYh2lCH/9bKyrjLK3WbyYWjNrmt
	cEfouYlLqMWvMeoKYXO1KNIXMpMPNbMVV114Ht8hlFX6+REn7qL0LFDipAUY/dh51zRk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdms-0003ta-7O;
	Thu, 26 Feb 2026 16:00:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdmo-0003tB-IV;
 Thu, 26 Feb 2026 16:00:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LoyfKAbp4ehnYaDcxGzEKgCVnSF5mqP3RYxvwUEB8xk=; b=asDDnT6P2HxsCm8aeRP/4qg2DZ
 6JS0g2T79IVKJXdgL9T91wPTz5GoXGoieHmCOs6UhOlnAv/KEQTLxN7cqjWeoBAtYr5Tg1Oo6uaRE
 dxNVRU8BccOZDw/JX341fiir14U8HRQwRz0V+enQhWRFomXcRKacHEomNVqCHkDpxsdE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LoyfKAbp4ehnYaDcxGzEKgCVnSF5mqP3RYxvwUEB8xk=; b=UtNqNIAI8F+klMATQ+JsSwmQ1g
 xpicgvZVu0H/HbLKRtsIzqJvauXzH8vt8Hy84XdBatxYddWT0WoI3kAaaAGGFUsQCX2iiFAtQnOkP
 xwPNLCoW8wt+vcV504/FNRKNWxcP5i75dMIEOSfRJKZ/3935CEmWycALn9k4ij3lBDCk=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdmn-0005B8-NO; Thu, 26 Feb 2026 16:00:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5966E43888;
 Thu, 26 Feb 2026 16:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4361C4AF09;
 Thu, 26 Feb 2026 16:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121616;
 bh=PMTUPg+Vtukd7ZH3GogoOQ4MO2V415SHtzBbqVns09Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=WKYLjoM/OQ0ArET9Kvb62cUrV0wnBoZn8f2sBMFTymTNiTJV+uHPfmmiVjrLlwIYy
 BUKlRVKY5gsHWZ1bbMydTwS4nXnGHW4lWYMMbktPfa+bV8Lz9POKlMsQY7+9OxwmYT
 RmShAqP8d6HXcNHWVj7XfrCEqoFMTJc920ouIupqQglM74awJf2I4DTUEc7/oBc+Sa
 O0w6YPanA2fnHqvxpPQpkgp48mpJYdIgwJmYGEtu9bZjpZUKaGSiAsdbz+/3K1kf3p
 OKL+CNJy+lWJgr7Dd4Sjh7Lla52+3Hc2BJKSoCDfKrMuElkhtY0kdKsghB91ws07ov
 tCejBPz9D1Oiw==
Date: Thu, 26 Feb 2026 10:55:21 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-19-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11775; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=PMTUPg+Vtukd7ZH3GogoOQ4MO2V415SHtzBbqVns09Q=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0I/GZxrTrxW27NqkBzXi03S398C1gpdVKop
 G4gmAuooeaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCAAKCRAADmhBGVaC
 FZ10D/kBlG801DflhJWEuWomWZV2XI1b2h4CXXT2GzfcIMyoAtutRoW6qzaUgaJBJg1WjikH2Q8
 4y7JHoLr6eWOtVbYeE2FZFkDuiar3DRWM2FF8FrhJLaCcZE1QFgUhk0OyPqK6oo3jhL4fAoS1vG
 Y+1JK1J3GIi8VGzBw9WCHbcIG1JL4c5NiU93mZ0MpkllJ2IZPPKllEJKLY37dtRxzxEi0E7bL/e
 6/GhxrbkJ3LJ3z1SJPmokDcZmVJXb+ThUf3JbEjelMAo+BdspGLJpyNdf7oFrutUhabZDQOUr4P
 0WSKgXM0lqis4STIGE6L6p05JEd/VGFhw+kT+efbTdyxOVILq/7dZd87cA5x3snO2aZ3Ocom1lR
 zVKEmSNvtqO+stqUx1abiUcE4AYV8vODG99mnRRoWUxaX4KUSpioQgUAiSJStFPew8OpT6Mx8fo
 kkZgiz5T/MrL3uvxmwlSbHT93lBLZOsy0acH2U3fbNIpDNGvyiI7nqzCzilfuTZpAwJKGzC6JBH
 cor98pThLAMCmTfHo5wyWb5n1vB/J5ejETlHtbW/YMDj59P3xUoyTSwzxembDQBX+Q6kpSM39+S
 O6q0SEzAZUtwHzj7HIAA5iWkcP1ll15TAtfMWMvoH+N1FYW4bTsAGOBnzihcvKX0lhBj3D1OMh5
 Vij2OwHGtazlRkw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update format strings and local variable types in affs for
 the i_ino type change from unsigned long to u64. Signed-off-by: Jeff Layton
 <jlayton@kernel.org> --- fs/affs/amigaffs.c | 8 ++++---- fs/affs/bitmap.c
 | 2 +- fs/affs/dir.c | 2 +- fs/affs/file.c | 20 ++++++++++ fs/affs/inode.c
 | 12 ++++++--- [...] 
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
X-Headers-End: 1vvdmn-0005B8-NO
Subject: [f2fs-dev] [PATCH 19/61] affs: update format strings for u64 i_ino
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
X-Rspamd-Queue-Id: 60E531A9612
X-Rspamd-Action: no action

Update format strings and local variable types in affs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/affs/amigaffs.c |  8 ++++----
 fs/affs/bitmap.c   |  2 +-
 fs/affs/dir.c      |  2 +-
 fs/affs/file.c     | 20 ++++++++++----------
 fs/affs/inode.c    | 12 ++++++------
 fs/affs/namei.c    | 14 +++++++-------
 fs/affs/symlink.c  |  2 +-
 7 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/fs/affs/amigaffs.c b/fs/affs/amigaffs.c
index fd669daa4e7bc951d8d7959c7a5ab1b60b75c61a..868dedbe236cfb284e88dcee3bc50fd9ea4ffe51 100644
--- a/fs/affs/amigaffs.c
+++ b/fs/affs/amigaffs.c
@@ -33,7 +33,7 @@ affs_insert_hash(struct inode *dir, struct buffer_head *bh)
 	ino = bh->b_blocknr;
 	offset = affs_hash_name(sb, AFFS_TAIL(sb, bh)->name + 1, AFFS_TAIL(sb, bh)->name[0]);
 
-	pr_debug("%s(dir=%lu, ino=%d)\n", __func__, dir->i_ino, ino);
+	pr_debug("%s(dir=%llu, ino=%d)\n", __func__, dir->i_ino, ino);
 
 	dir_bh = affs_bread(sb, dir->i_ino);
 	if (!dir_bh)
@@ -83,7 +83,7 @@ affs_remove_hash(struct inode *dir, struct buffer_head *rem_bh)
 	sb = dir->i_sb;
 	rem_ino = rem_bh->b_blocknr;
 	offset = affs_hash_name(sb, AFFS_TAIL(sb, rem_bh)->name+1, AFFS_TAIL(sb, rem_bh)->name[0]);
-	pr_debug("%s(dir=%lu, ino=%d, hashval=%d)\n", __func__, dir->i_ino,
+	pr_debug("%s(dir=%llu, ino=%d, hashval=%d)\n", __func__, dir->i_ino,
 		 rem_ino, offset);
 
 	bh = affs_bread(sb, dir->i_ino);
@@ -147,7 +147,7 @@ affs_remove_link(struct dentry *dentry)
 	u32 link_ino, ino;
 	int retval;
 
-	pr_debug("%s(key=%ld)\n", __func__, inode->i_ino);
+	pr_debug("%s(key=%lld)\n", __func__, inode->i_ino);
 	retval = -EIO;
 	bh = affs_bread(sb, inode->i_ino);
 	if (!bh)
@@ -279,7 +279,7 @@ affs_remove_header(struct dentry *dentry)
 	if (!inode)
 		goto done;
 
-	pr_debug("%s(key=%ld)\n", __func__, inode->i_ino);
+	pr_debug("%s(key=%lld)\n", __func__, inode->i_ino);
 	retval = -EIO;
 	bh = affs_bread(sb, (u32)(long)dentry->d_fsdata);
 	if (!bh)
diff --git a/fs/affs/bitmap.c b/fs/affs/bitmap.c
index 5ba9ef2742f6ee5e903b3df04c5f627fc4fc00ae..40bc4ce6af4ac9d8dba81809e22516a58f0aaf15 100644
--- a/fs/affs/bitmap.c
+++ b/fs/affs/bitmap.c
@@ -125,7 +125,7 @@ affs_alloc_block(struct inode *inode, u32 goal)
 	sb = inode->i_sb;
 	sbi = AFFS_SB(sb);
 
-	pr_debug("balloc(inode=%lu,goal=%u): ", inode->i_ino, goal);
+	pr_debug("balloc(inode=%llu,goal=%u): ", inode->i_ino, goal);
 
 	if (AFFS_I(inode)->i_pa_cnt) {
 		pr_debug("%d\n", AFFS_I(inode)->i_lastalloc+1);
diff --git a/fs/affs/dir.c b/fs/affs/dir.c
index 5c8d83387a394146f8df2e97af3b65723a076be1..11e2bac2e391896a32109335530a6af5543a0abe 100644
--- a/fs/affs/dir.c
+++ b/fs/affs/dir.c
@@ -90,7 +90,7 @@ affs_readdir(struct file *file, struct dir_context *ctx)
 	u32			 ino;
 	int			 error = 0;
 
-	pr_debug("%s(ino=%lu,f_pos=%llx)\n", __func__, inode->i_ino, ctx->pos);
+	pr_debug("%s(ino=%llu,f_pos=%llx)\n", __func__, inode->i_ino, ctx->pos);
 
 	if (ctx->pos < 2) {
 		data->ino = 0;
diff --git a/fs/affs/file.c b/fs/affs/file.c
index 6c9258359ddb9ba344976dd5a9a435f71f3fabc1..a51dee9d7d7ec3724c642725812415bd33c76273 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -24,7 +24,7 @@ static struct buffer_head *affs_get_extblock_slow(struct inode *inode, u32 ext);
 static int
 affs_file_open(struct inode *inode, struct file *filp)
 {
-	pr_debug("open(%lu,%d)\n",
+	pr_debug("open(%llu,%d)\n",
 		 inode->i_ino, atomic_read(&AFFS_I(inode)->i_opencnt));
 	atomic_inc(&AFFS_I(inode)->i_opencnt);
 	return 0;
@@ -33,7 +33,7 @@ affs_file_open(struct inode *inode, struct file *filp)
 static int
 affs_file_release(struct inode *inode, struct file *filp)
 {
-	pr_debug("release(%lu, %d)\n",
+	pr_debug("release(%llu, %d)\n",
 		 inode->i_ino, atomic_read(&AFFS_I(inode)->i_opencnt));
 
 	if (atomic_dec_and_test(&AFFS_I(inode)->i_opencnt)) {
@@ -301,7 +301,7 @@ affs_get_block(struct inode *inode, sector_t block, struct buffer_head *bh_resul
 	struct buffer_head	*ext_bh;
 	u32			 ext;
 
-	pr_debug("%s(%lu, %llu)\n", __func__, inode->i_ino,
+	pr_debug("%s(%llu, %llu)\n", __func__, inode->i_ino,
 		 (unsigned long long)block);
 
 	BUG_ON(block > (sector_t)0x7fffffffUL);
@@ -534,7 +534,7 @@ static int affs_do_read_folio_ofs(struct folio *folio, size_t to, int create)
 	size_t bidx, boff, bsize;
 	u32 tmp;
 
-	pr_debug("%s(%lu, %ld, 0, %zu)\n", __func__, inode->i_ino,
+	pr_debug("%s(%llu, %ld, 0, %zu)\n", __func__, inode->i_ino,
 		 folio->index, to);
 	BUG_ON(to > folio_size(folio));
 	bsize = AFFS_SB(sb)->s_data_blksize;
@@ -566,7 +566,7 @@ affs_extent_file_ofs(struct inode *inode, u32 newsize)
 	u32 size, bsize;
 	u32 tmp;
 
-	pr_debug("%s(%lu, %d)\n", __func__, inode->i_ino, newsize);
+	pr_debug("%s(%llu, %d)\n", __func__, inode->i_ino, newsize);
 	bsize = AFFS_SB(sb)->s_data_blksize;
 	bh = NULL;
 	size = AFFS_I(inode)->mmu_private;
@@ -634,7 +634,7 @@ static int affs_read_folio_ofs(struct file *file, struct folio *folio)
 	size_t to;
 	int err;
 
-	pr_debug("%s(%lu, %ld)\n", __func__, inode->i_ino, folio->index);
+	pr_debug("%s(%llu, %ld)\n", __func__, inode->i_ino, folio->index);
 	to = folio_size(folio);
 	if (folio_pos(folio) + to > inode->i_size) {
 		to = inode->i_size - folio_pos(folio);
@@ -658,7 +658,7 @@ static int affs_write_begin_ofs(const struct kiocb *iocb,
 	pgoff_t index;
 	int err = 0;
 
-	pr_debug("%s(%lu, %llu, %llu)\n", __func__, inode->i_ino, pos,
+	pr_debug("%s(%llu, %llu, %llu)\n", __func__, inode->i_ino, pos,
 		 pos + len);
 	if (pos > AFFS_I(inode)->mmu_private) {
 		/* XXX: this probably leaves a too-big i_size in case of
@@ -710,7 +710,7 @@ static int affs_write_end_ofs(const struct kiocb *iocb,
 	 * due to write_begin.
 	 */
 
-	pr_debug("%s(%lu, %llu, %llu)\n", __func__, inode->i_ino, pos,
+	pr_debug("%s(%llu, %llu, %llu)\n", __func__, inode->i_ino, pos,
 		 pos + len);
 	bsize = AFFS_SB(sb)->s_data_blksize;
 	data = folio_address(folio);
@@ -854,7 +854,7 @@ affs_free_prealloc(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
 
-	pr_debug("free_prealloc(ino=%lu)\n", inode->i_ino);
+	pr_debug("free_prealloc(ino=%llu)\n", inode->i_ino);
 
 	while (AFFS_I(inode)->i_pa_cnt) {
 		AFFS_I(inode)->i_pa_cnt--;
@@ -874,7 +874,7 @@ affs_truncate(struct inode *inode)
 	struct buffer_head *ext_bh;
 	int i;
 
-	pr_debug("truncate(inode=%lu, oldsize=%llu, newsize=%llu)\n",
+	pr_debug("truncate(inode=%llu, oldsize=%llu, newsize=%llu)\n",
 		 inode->i_ino, AFFS_I(inode)->mmu_private, inode->i_size);
 
 	last_blk = 0;
diff --git a/fs/affs/inode.c b/fs/affs/inode.c
index 0bfc7d151dcd383af31d1fa41723e7391ec9d4c0..561fc0185e89c47947c83bd1a56cdc8be46f8d0e 100644
--- a/fs/affs/inode.c
+++ b/fs/affs/inode.c
@@ -32,7 +32,7 @@ struct inode *affs_iget(struct super_block *sb, unsigned long ino)
 	if (!(inode_state_read_once(inode) & I_NEW))
 		return inode;
 
-	pr_debug("affs_iget(%lu)\n", inode->i_ino);
+	pr_debug("affs_iget(%llu)\n", inode->i_ino);
 
 	block = inode->i_ino;
 	bh = affs_bread(sb, block);
@@ -171,14 +171,14 @@ affs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	uid_t			 uid;
 	gid_t			 gid;
 
-	pr_debug("write_inode(%lu)\n", inode->i_ino);
+	pr_debug("write_inode(%llu)\n", inode->i_ino);
 
 	if (!inode->i_nlink)
 		// possibly free block
 		return 0;
 	bh = affs_bread(sb, inode->i_ino);
 	if (!bh) {
-		affs_error(sb,"write_inode","Cannot read block %lu",inode->i_ino);
+		affs_error(sb, "write_inode", "Cannot read block %llu", inode->i_ino);
 		return -EIO;
 	}
 	tail = AFFS_TAIL(sb, bh);
@@ -219,7 +219,7 @@ affs_notify_change(struct mnt_idmap *idmap, struct dentry *dentry,
 	struct inode *inode = d_inode(dentry);
 	int error;
 
-	pr_debug("notify_change(%lu,0x%x)\n", inode->i_ino, attr->ia_valid);
+	pr_debug("notify_change(%llu,0x%x)\n", inode->i_ino, attr->ia_valid);
 
 	error = setattr_prepare(&nop_mnt_idmap, dentry, attr);
 	if (error)
@@ -260,7 +260,7 @@ void
 affs_evict_inode(struct inode *inode)
 {
 	unsigned long cache_page;
-	pr_debug("evict_inode(ino=%lu, nlink=%u)\n",
+	pr_debug("evict_inode(ino=%llu, nlink=%u)\n",
 		 inode->i_ino, inode->i_nlink);
 	truncate_inode_pages_final(&inode->i_data);
 
@@ -353,7 +353,7 @@ affs_add_entry(struct inode *dir, struct inode *inode, struct dentry *dentry, s3
 	u32 block = 0;
 	int retval;
 
-	pr_debug("%s(dir=%lu, inode=%lu, \"%pd\", type=%d)\n", __func__,
+	pr_debug("%s(dir=%llu, inode=%llu, \"%pd\", type=%d)\n", __func__,
 		 dir->i_ino, inode->i_ino, dentry, type);
 
 	retval = -EIO;
diff --git a/fs/affs/namei.c b/fs/affs/namei.c
index f883be50db122d3b09f0ae4d24618bd49b55186b..8705321926007f559bac1af42fbadca8da67afcc 100644
--- a/fs/affs/namei.c
+++ b/fs/affs/namei.c
@@ -235,7 +235,7 @@ affs_lookup(struct inode *dir, struct dentry *dentry, unsigned int flags)
 int
 affs_unlink(struct inode *dir, struct dentry *dentry)
 {
-	pr_debug("%s(dir=%lu, %lu \"%pd\")\n", __func__, dir->i_ino,
+	pr_debug("%s(dir=%llu, %llu \"%pd\")\n", __func__, dir->i_ino,
 		 d_inode(dentry)->i_ino, dentry);
 
 	return affs_remove_header(dentry);
@@ -249,7 +249,7 @@ affs_create(struct mnt_idmap *idmap, struct inode *dir,
 	struct inode	*inode;
 	int		 error;
 
-	pr_debug("%s(%lu,\"%pd\",0%ho)\n",
+	pr_debug("%s(%llu,\"%pd\",0%ho)\n",
 		 __func__, dir->i_ino, dentry, mode);
 
 	inode = affs_new_inode(dir);
@@ -280,7 +280,7 @@ affs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	struct inode		*inode;
 	int			 error;
 
-	pr_debug("%s(%lu,\"%pd\",0%ho)\n",
+	pr_debug("%s(%llu,\"%pd\",0%ho)\n",
 		 __func__, dir->i_ino, dentry, mode);
 
 	inode = affs_new_inode(dir);
@@ -306,7 +306,7 @@ affs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 int
 affs_rmdir(struct inode *dir, struct dentry *dentry)
 {
-	pr_debug("%s(dir=%lu, %lu \"%pd\")\n", __func__, dir->i_ino,
+	pr_debug("%s(dir=%llu, %llu \"%pd\")\n", __func__, dir->i_ino,
 		 d_inode(dentry)->i_ino, dentry);
 
 	return affs_remove_header(dentry);
@@ -323,7 +323,7 @@ affs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	int			 i, maxlen, error;
 	char			 c, lc;
 
-	pr_debug("%s(%lu,\"%pd\" -> \"%s\")\n",
+	pr_debug("%s(%llu,\"%pd\" -> \"%s\")\n",
 		 __func__, dir->i_ino, dentry, symname);
 
 	maxlen = AFFS_SB(sb)->s_hashsize * sizeof(u32) - 1;
@@ -395,7 +395,7 @@ affs_link(struct dentry *old_dentry, struct inode *dir, struct dentry *dentry)
 {
 	struct inode *inode = d_inode(old_dentry);
 
-	pr_debug("%s(%lu, %lu, \"%pd\")\n", __func__, inode->i_ino, dir->i_ino,
+	pr_debug("%s(%llu, %llu, \"%pd\")\n", __func__, inode->i_ino, dir->i_ino,
 		 dentry);
 
 	return affs_add_entry(dir, inode, dentry, ST_LINKFILE);
@@ -511,7 +511,7 @@ int affs_rename2(struct mnt_idmap *idmap, struct inode *old_dir,
 	if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE))
 		return -EINVAL;
 
-	pr_debug("%s(old=%lu,\"%pd\" to new=%lu,\"%pd\")\n", __func__,
+	pr_debug("%s(old=%llu,\"%pd\" to new=%llu,\"%pd\")\n", __func__,
 		 old_dir->i_ino, old_dentry, new_dir->i_ino, new_dentry);
 
 	if (flags & RENAME_EXCHANGE)
diff --git a/fs/affs/symlink.c b/fs/affs/symlink.c
index 094aec8d17b88bab9392abdd497ed687cd85584e..de31ed2e71dfcb71b770a98c9b43a248de8d7041 100644
--- a/fs/affs/symlink.c
+++ b/fs/affs/symlink.c
@@ -21,7 +21,7 @@ static int affs_symlink_read_folio(struct file *file, struct folio *folio)
 	char			 c;
 	char			 lc;
 
-	pr_debug("get_link(ino=%lu)\n", inode->i_ino);
+	pr_debug("get_link(ino=%llu)\n", inode->i_ino);
 
 	bh = affs_bread(inode->i_sb, inode->i_ino);
 	if (!bh)

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
