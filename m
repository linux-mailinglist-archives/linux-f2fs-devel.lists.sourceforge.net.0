Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJftNOduoGkHjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:03:51 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB2D1A97E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:03:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BRp2GTMVXrdlXLSZoMOwuQBrUd1ESug67AL0rZUOprw=; b=PcLRQ6PdO2sk2TBDtZIVDtgElL
	VOjwRHthT94QvpF1iqtfOS81xcnj43n0hiKOsdzKkX5C/3339QWAgXb8e0ih0wrKOK/guKUNQVJP/
	PN71q87xPe5SSTwJU35fLAvBc2fipD29JKa+nCqUECIO0ng9OMVSXhBOR4Qhu8kOupVo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdq8-0000vN-Ve;
	Thu, 26 Feb 2026 16:03:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdq7-0000v2-NG;
 Thu, 26 Feb 2026 16:03:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TqC9XN1OSzXVJdhQiV4JhmptihHnM3GMZGRiKcnL048=; b=U0KHGsz8GJmCZvnQtK4wp2joyS
 iWYOfmxGTnGU3hDF2mMT1lp7z+xfCuf4FDrqyohEYesfcm3wPHi7Xywt3Mlldf3hQdUUUJQ5i1EgJ
 EB3oGTep8uqmVNTgO/ujpdhf5fk79KDEAaFlbTi7EVJZwkM/RJ2wNMOCaHQ+EV/zNkv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TqC9XN1OSzXVJdhQiV4JhmptihHnM3GMZGRiKcnL048=; b=PbvaY81hxuddNsDRJ7lHBVnr9i
 Q5gjdY6f4F/P195abTZk66zGQpH7U+S6gw/qMCC3qQZfRgAQ253EWsPUjIzj+mpHigbYvivZjmWYN
 CteUuUJo1pRH8Svp6mBPl9gYvuQRQAvZdgPwdwS3Y3JAQ0kX7EIRGQ2Fo0r713mahlno=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdq7-0005bV-7V; Thu, 26 Feb 2026 16:03:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id D59BF441C3;
 Thu, 26 Feb 2026 16:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E0E9C2BC86;
 Thu, 26 Feb 2026 16:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121816;
 bh=Mm9/OP1Us2ZjMqs5yAJOCtSY+KcTrwpYMhIt9vayw6Q=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N/wtq9Yq1v9LjJEvOJcB4GqjdG6FyOkiqDeKIjlIp1hJXZG2nttGDsAuWI3sa/hUN
 XTxIAFPfrbTTj9ShQOTTox1X2bHJOkY9NB2iEz93vj4GrIzNlux88w8z407qzForZH
 1a87Kim/akMpwP6GwC22lGad82iCSV/DBT28s5v0xnEAMLmbQpLZawhGzqr5oRDcXP
 OKZtqGXtDlq7wrOjIb7ynIOkMKne58O0jsE7Tk6RIfAbw3oCLieGp+GfH8auZnKYuC
 RcyVvVHgkZo0bZrDNq0DsihqpKZkBUrLzrhhCr5gnCdOKGGzszV4WTirWYtIE/0mu9
 tFRgaJMbr07zw==
Date: Thu, 26 Feb 2026 10:55:37 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-35-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2961; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=Mm9/OP1Us2ZjMqs5yAJOCtSY+KcTrwpYMhIt9vayw6Q=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0N7kdaYrUk/5+PhJXM2cVD9G1tsSNaaeQNq
 x2+GLQgWSiJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtDQAKCRAADmhBGVaC
 FZC/D/0e/0AVhKBe5ozYYOnbgiAtc1nrTMnGaFW8Rdg/h1dux1f37tU+G8wakXQcfRJ+LTzQ9R3
 41/wptHxxGiF2TF7NuBK4AJoFJ2K/vthItVl9PKqGT3znPVGctxHrJd3/TqAUVA2HD2RnH8vZY9
 HDofY52XzY9t0Y7ozbRmq07Voi3EokGoVvYNHhU/SWRgNrp+uRfmloaN5Dd4vp4Eiei4rsblfco
 Pk3r3cTXLszGokDkB56olfZy9coVhY2zlD1E73gh1tivftXDQdZx2J0VLfslN/EXiCEcqW66stW
 PiTLj3Tl2SBExh7Wbd7PCSQHFeYWjGY5QblzfySOeHk4Qn6naqktDjXrjudaJHbIeP6VBbXVRNn
 mhxIvVpYE2rhU2EfdFxrK6gSE7N09E6aosv6yw3AkkDoEGNhsa/pxYhbI8PXXM+v1EIP7bqiF1W
 9BJRu/Z+enOQfgFZlV8n3UTqD5LMiWSqVTD1hI6oTapARo5mp9FVgCTQ35t094RRkjp1MXgZt/Q
 2RIW0w85r2dct6IHBA6UcOcFW6xn0SjsehuFmzMvyzP1ccF/AVHC+Rtu7UPC6WU+1hjq3jGJ3aD
 MUGE2bCkZFuVsXb7vZQdaAGkWhfjgvIgiglP7fQJXuqhLQ/o1NXaaxiANsHkSdpmOO21vsnp/6M
 SdxP3CWDbZzdz7Q==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update format strings and local variable types in hpfs for
 the i_ino type change from unsigned long to u64. Signed-off-by: Jeff Layton
 <jlayton@kernel.org> --- fs/hpfs/dir.c | 4 ++-- fs/hpfs/dnode.c | 4 ++--
 fs/hpfs/ea.c | 4 ++-- fs/hpfs/inode.c | 4 ++-- 4 files changed, 8 insertions(+),
 8 deletions(-) 
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
X-Headers-End: 1vvdq7-0005bV-7V
Subject: [f2fs-dev] [PATCH 35/61] hpfs: update format strings for u64 i_ino
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
X-Rspamd-Queue-Id: 5DB2D1A97E6
X-Rspamd-Action: no action

Update format strings and local variable types in hpfs for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/hpfs/dir.c   | 4 ++--
 fs/hpfs/dnode.c | 4 ++--
 fs/hpfs/ea.c    | 4 ++--
 fs/hpfs/inode.c | 4 ++--
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/hpfs/dir.c b/fs/hpfs/dir.c
index ceb50b2dc91a9da02997a40836d6543786d883d3..3398b3417a4966450e8e070ddb7a45a19c442d3c 100644
--- a/fs/hpfs/dir.c
+++ b/fs/hpfs/dir.c
@@ -96,8 +96,8 @@ static int hpfs_readdir(struct file *file, struct dir_context *ctx)
 		}
 		if (!fnode_is_dir(fno)) {
 			e = 1;
-			hpfs_error(inode->i_sb, "not a directory, fnode %08lx",
-					(unsigned long)inode->i_ino);
+			hpfs_error(inode->i_sb, "not a directory, fnode %08llx",
+					(unsigned long long)inode->i_ino);
 		}
 		if (hpfs_inode->i_dno != le32_to_cpu(fno->u.external[0].disk_secno)) {
 			e = 1;
diff --git a/fs/hpfs/dnode.c b/fs/hpfs/dnode.c
index dde764ebe24673c339d4602172618dbf6ca0b5c9..a89c5b795c4bcee590bb9200296ce78c64211bef 100644
--- a/fs/hpfs/dnode.c
+++ b/fs/hpfs/dnode.c
@@ -550,9 +550,9 @@ static void delete_empty_dnode(struct inode *i, dnode_secno dno)
 			if (hpfs_sb(i->i_sb)->sb_chk)
 				if (up != i->i_ino) {
 					hpfs_error(i->i_sb,
-						   "bad pointer to fnode, dnode %08x, pointing to %08x, should be %08lx",
+						   "bad pointer to fnode, dnode %08x, pointing to %08x, should be %08llx",
 						   dno, up,
-						   (unsigned long)i->i_ino);
+						   (unsigned long long)i->i_ino);
 					return;
 				}
 			if ((d1 = hpfs_map_dnode(i->i_sb, down, &qbh1))) {
diff --git a/fs/hpfs/ea.c b/fs/hpfs/ea.c
index 2149d3ca530b6f635ff884988383bdde21be5e7a..7440d31d2821fabb3e2cf4327281c20d16773225 100644
--- a/fs/hpfs/ea.c
+++ b/fs/hpfs/ea.c
@@ -245,8 +245,8 @@ void hpfs_set_ea(struct inode *inode, struct fnode *fnode, const char *key,
 		fnode->ea_offs = cpu_to_le16(0xc4);
 	}
 	if (le16_to_cpu(fnode->ea_offs) < 0xc4 || le16_to_cpu(fnode->ea_offs) + le16_to_cpu(fnode->acl_size_s) + le16_to_cpu(fnode->ea_size_s) > 0x200) {
-		hpfs_error(s, "fnode %08lx: ea_offs == %03x, ea_size_s == %03x",
-			(unsigned long)inode->i_ino,
+		hpfs_error(s, "fnode %08llx: ea_offs == %03x, ea_size_s == %03x",
+			(unsigned long long)inode->i_ino,
 			le16_to_cpu(fnode->ea_offs), le16_to_cpu(fnode->ea_size_s));
 		return;
 	}
diff --git a/fs/hpfs/inode.c b/fs/hpfs/inode.c
index 93d528f4f4f28d5070162faacd65d3fc2341248a..cbde82a53066c5d467173b67b5e1c445fe3c9101 100644
--- a/fs/hpfs/inode.c
+++ b/fs/hpfs/inode.c
@@ -250,8 +250,8 @@ void hpfs_write_inode_nolock(struct inode *i)
 			hpfs_brelse4(&qbh);
 		} else
 			hpfs_error(i->i_sb,
-				"directory %08lx doesn't have '.' entry",
-				(unsigned long)i->i_ino);
+				"directory %08llx doesn't have '.' entry",
+				(unsigned long long)i->i_ino);
 	}
 	mark_buffer_dirty(bh);
 	brelse(bh);

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
