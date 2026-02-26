Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFpoGAluoGkHjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:00:09 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F7D1A95E1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AEvbfN8+yN9yV6yrLX4gITdVzfcQFNGGwhLvqZmrdUs=; b=BjbLLJDYxDHMXFe/JakVwvHs3s
	jQxx0htXTuQQBygfaLTelI0/1nmwStlCTpAnghgjO54cfRSwHaEYgpgrFnxrjfwjGDUbjMBvUIYoz
	SnHYWmq966CK174iJQu642ep8aMPtCB31ebAatg+TfS7L+/yXVgI3+5N7k+Fcw82N1Mk=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdmX-0000b0-Ec;
	Thu, 26 Feb 2026 16:00:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdmV-0000ae-Ac;
 Thu, 26 Feb 2026 16:00:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fLYlAfCr7Wgwg8RdGI5wMtP38MakqNwQ+MvPQWIW2oc=; b=XOuS4JO+fJtvtKRIume2TA2rGg
 Enf08yNyLz//v6VOD7501eFHcJXZ+pFQQJk6l93MaIScMsd3vYFtnH/d4mXHxg7/j+cEwi0ysw8eQ
 dR66cPsas9U+x9c9I926dFygW9OgYPtcl1E0nKr5j/EM+ZpmsGtubjThL0rI7mKqJBcU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fLYlAfCr7Wgwg8RdGI5wMtP38MakqNwQ+MvPQWIW2oc=; b=nDObIkPbGL6RTvRCuSJ7bHSp9l
 c/sEQ+rUAKYUx/ZVFF1nmLdGBFSiFUqi1tx39Fi06J78DZ7dnJHpFsRtu/YKsiHxHmDv/mle+uADw
 iReAuoBRDXk3PkVifaH72vWPjbJ1Ok4w1FdQA45YQHA6RToWJj16U/5ljHTjHRqARfyY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdmT-00057h-EF; Thu, 26 Feb 2026 16:00:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id EBA8640115;
 Thu, 26 Feb 2026 15:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D436C19424;
 Thu, 26 Feb 2026 15:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121590;
 bh=VTT0KHR7BbAQYop9anH+bkuQB0B7NoPjk1NTpo2tzcg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ltBuCaFEtGvQHRlHx7pSUXMJvQ2xqMGVdp2WfZjMtqntvXbs73LaqWDDb/K9Ip4UM
 WRyGhv9Bh7nqFwL3Y9NEqAa9S+7r5/WaP+0M8Vtq5KWyHP7cOFpBHkYyuYEC0EkLdW
 RNeSDZSVjQrHEVPs3VNrgT5LhT3a5BD55uNYm+lN4FCpcHKGZ1Qvt1Wcv3HZsN4478
 zMx7LgvHJGjHVaO7Jk1T3HnLLWhEenCFZPvOTaFwZ0oJiXZhe7F1QF8BVQXd7TOjF/
 Xxal7t9LtS7+l05rnICV0YN5kkfsRFxBg4nMbOsdXU/klL1SbDKKEsFyTY8fGuJG7j
 9adU9Gu3fkmRQ==
Date: Thu, 26 Feb 2026 10:55:19 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-17-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=16417; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=VTT0KHR7BbAQYop9anH+bkuQB0B7NoPjk1NTpo2tzcg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0IK3Uiz7/OGLiZ1boS/yxgMZlT/xNxGiqhR
 FULecILsxaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtCAAKCRAADmhBGVaC
 FTQLD/9IPHA4Me/91ZDcjNOI16Cy7+JCps1N405Mt0z2eytOxfFlSuDruRvCwzNwPJfCKifLm0Y
 enWqScM5706EZSgSBIEQCzQ1MwJC1DhXN66P/KNVC7QasVMV3j/Dt0dTlzJcSxfG9HrgeAZjKlP
 rK8I4ZGcI56XctLmPip7GPreUU40toONLe9BHh0bJB0WrD0eMLONPAqobOZsA4jTxGT3zBS7Ke3
 ifnQU1MlfIcght2gGch5jMKDto2dYZ4St0BVDjHAH5B77CeSa2fk9wobPM9AaQtPgH7oOZswn78
 e9G1I0GdeLc31O7pPNcwiVdFccLIcK7vrMfjqrbOxE8Xy4AafjFwvyqH/XbwgGdUVvgX3/SsU38
 9sXNl2wur+tE3cXzd9Eq61ZPpSMf9z5mEwuU9WbRKxkd0O5Zn5dtoDg4bJBkFm9GRXR1Ve4JTFX
 rMeFciaYCiQireLZ7neiQS0lCesWLXeE71w53juyXfd0udVQgOmJmnWaok6q/ggallPNp7aaD+x
 orBRW8dUEwPGWVkCC/crJ1ErfNUnT8ZGU+/RTxXTMDaZtFPL9O+pT+h7t9PYWQPWcYXCN+Fye45
 4bS4Wb43IgUmfaIozc0AKQTbJitp/56x4fYxWAv8eFOdQuj8qXp0AqY3Nr+n7JQ1JfGxAOj6+io
 7vFdF/gxNNtHu/g==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Update nilfs2 trace events and filesystem code for u64 i_ino:
 - Change __field(ino_t, ...) to __field(u64, ...) in trace events - Update
 format strings from %lu to %llu - Cast to (unsigned long long) in TP_printk
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
X-Headers-End: 1vvdmT-00057h-EF
Subject: [f2fs-dev] [PATCH 17/61] nilfs2: update for u64 i_ino
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
X-Rspamd-Queue-Id: 63F7D1A95E1
X-Rspamd-Action: no action

Update nilfs2 trace events and filesystem code for u64 i_ino:

- Change __field(ino_t, ...) to __field(u64, ...) in trace events
- Update format strings from %lu to %llu
- Cast to (unsigned long long) in TP_printk

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nilfs2/alloc.c             | 10 +++++-----
 fs/nilfs2/bmap.c              |  2 +-
 fs/nilfs2/btnode.c            |  2 +-
 fs/nilfs2/btree.c             | 12 ++++++------
 fs/nilfs2/dir.c               | 12 ++++++------
 fs/nilfs2/direct.c            |  4 ++--
 fs/nilfs2/gcinode.c           |  2 +-
 fs/nilfs2/inode.c             |  8 ++++----
 fs/nilfs2/mdt.c               |  2 +-
 fs/nilfs2/namei.c             |  2 +-
 fs/nilfs2/segment.c           |  2 +-
 include/trace/events/nilfs2.h | 12 ++++++------
 12 files changed, 35 insertions(+), 35 deletions(-)

diff --git a/fs/nilfs2/alloc.c b/fs/nilfs2/alloc.c
index e7eebb04f9a4080a39f17d4123e58ed7df6b2f4b..7b1cd2baefcf21e54f9260845b02c7c95c148c64 100644
--- a/fs/nilfs2/alloc.c
+++ b/fs/nilfs2/alloc.c
@@ -707,7 +707,7 @@ void nilfs_palloc_commit_free_entry(struct inode *inode,
 
 	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
 		nilfs_warn(inode->i_sb,
-			   "%s (ino=%lu): entry number %llu already freed",
+			   "%s (ino=%llu): entry number %llu already freed",
 			   __func__, inode->i_ino,
 			   (unsigned long long)req->pr_entry_nr);
 	else
@@ -748,7 +748,7 @@ void nilfs_palloc_abort_alloc_entry(struct inode *inode,
 
 	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
 		nilfs_warn(inode->i_sb,
-			   "%s (ino=%lu): entry number %llu already freed",
+			   "%s (ino=%llu): entry number %llu already freed",
 			   __func__, inode->i_ino,
 			   (unsigned long long)req->pr_entry_nr);
 	else
@@ -861,7 +861,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
 			if (!nilfs_clear_bit_atomic(lock, group_offset,
 						    bitmap)) {
 				nilfs_warn(inode->i_sb,
-					   "%s (ino=%lu): entry number %llu already freed",
+					   "%s (ino=%llu): entry number %llu already freed",
 					   __func__, inode->i_ino,
 					   (unsigned long long)entry_nrs[j]);
 			} else {
@@ -906,7 +906,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
 							      last_nrs[k]);
 			if (ret && ret != -ENOENT)
 				nilfs_warn(inode->i_sb,
-					   "error %d deleting block that object (entry=%llu, ino=%lu) belongs to",
+					   "error %d deleting block that object (entry=%llu, ino=%llu) belongs to",
 					   ret, (unsigned long long)last_nrs[k],
 					   inode->i_ino);
 		}
@@ -923,7 +923,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
 			ret = nilfs_palloc_delete_bitmap_block(inode, group);
 			if (ret && ret != -ENOENT)
 				nilfs_warn(inode->i_sb,
-					   "error %d deleting bitmap block of group=%lu, ino=%lu",
+					   "error %d deleting bitmap block of group=%lu, ino=%llu",
 					   ret, group, inode->i_ino);
 		}
 	}
diff --git a/fs/nilfs2/bmap.c b/fs/nilfs2/bmap.c
index ccc1a7aa52d2064d56b826058554264c498d592f..824f2bd91c167965ec3a660202b6e6c5f1fe007e 100644
--- a/fs/nilfs2/bmap.c
+++ b/fs/nilfs2/bmap.c
@@ -33,7 +33,7 @@ static int nilfs_bmap_convert_error(struct nilfs_bmap *bmap,
 
 	if (err == -EINVAL) {
 		__nilfs_error(inode->i_sb, fname,
-			      "broken bmap (inode number=%lu)", inode->i_ino);
+			      "broken bmap (inode number=%llu)", inode->i_ino);
 		err = -EIO;
 	}
 	return err;
diff --git a/fs/nilfs2/btnode.c b/fs/nilfs2/btnode.c
index 56836712909201775907483887e8a0022851bbec..2e553d698d0f3980de98fced415dfd819ddbca0a 100644
--- a/fs/nilfs2/btnode.c
+++ b/fs/nilfs2/btnode.c
@@ -64,7 +64,7 @@ nilfs_btnode_create_block(struct address_space *btnc, __u64 blocknr)
 		 * clearing of an abandoned b-tree node is missing somewhere).
 		 */
 		nilfs_error(inode->i_sb,
-			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%lu)",
+			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%llu)",
 			    (unsigned long long)blocknr, inode->i_ino);
 		goto failed;
 	}
diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
index dd0c8e560ef6a2c96515025321914e0d73f41144..3c03f5a741d144d22d1ffb5acf43a035e88c00dc 100644
--- a/fs/nilfs2/btree.c
+++ b/fs/nilfs2/btree.c
@@ -353,7 +353,7 @@ static int nilfs_btree_node_broken(const struct nilfs_btree_node *node,
 		     nchildren <= 0 ||
 		     nchildren > NILFS_BTREE_NODE_NCHILDREN_MAX(size))) {
 		nilfs_crit(inode->i_sb,
-			   "bad btree node (ino=%lu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
+			   "bad btree node (ino=%llu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
 			   inode->i_ino, (unsigned long long)blocknr, level,
 			   flags, nchildren);
 		ret = 1;
@@ -384,7 +384,7 @@ static int nilfs_btree_root_broken(const struct nilfs_btree_node *node,
 		     nchildren > NILFS_BTREE_ROOT_NCHILDREN_MAX ||
 		     (nchildren == 0 && level > NILFS_BTREE_LEVEL_NODE_MIN))) {
 		nilfs_crit(inode->i_sb,
-			   "bad btree root (ino=%lu): level = %d, flags = 0x%x, nchildren = %d",
+			   "bad btree root (ino=%llu): level = %d, flags = 0x%x, nchildren = %d",
 			   inode->i_ino, level, flags, nchildren);
 		ret = 1;
 	}
@@ -453,7 +453,7 @@ static int nilfs_btree_bad_node(const struct nilfs_bmap *btree,
 	if (unlikely(nilfs_btree_node_get_level(node) != level)) {
 		dump_stack();
 		nilfs_crit(btree->b_inode->i_sb,
-			   "btree level mismatch (ino=%lu): %d != %d",
+			   "btree level mismatch (ino=%llu): %d != %d",
 			   btree->b_inode->i_ino,
 			   nilfs_btree_node_get_level(node), level);
 		return 1;
@@ -521,7 +521,7 @@ static int __nilfs_btree_get_block(const struct nilfs_bmap *btree, __u64 ptr,
  out_no_wait:
 	if (!buffer_uptodate(bh)) {
 		nilfs_err(btree->b_inode->i_sb,
-			  "I/O error reading b-tree node block (ino=%lu, blocknr=%llu)",
+			  "I/O error reading b-tree node block (ino=%llu, blocknr=%llu)",
 			  btree->b_inode->i_ino, (unsigned long long)ptr);
 		brelse(bh);
 		return -EIO;
@@ -2104,7 +2104,7 @@ static int nilfs_btree_propagate(struct nilfs_bmap *btree,
 	if (ret < 0) {
 		if (unlikely(ret == -ENOENT)) {
 			nilfs_crit(btree->b_inode->i_sb,
-				   "writing node/leaf block does not appear in b-tree (ino=%lu) at key=%llu, level=%d",
+				   "writing node/leaf block does not appear in b-tree (ino=%llu) at key=%llu, level=%d",
 				   btree->b_inode->i_ino,
 				   (unsigned long long)key, level);
 			ret = -EINVAL;
@@ -2146,7 +2146,7 @@ static void nilfs_btree_add_dirty_buffer(struct nilfs_bmap *btree,
 	    level >= NILFS_BTREE_LEVEL_MAX) {
 		dump_stack();
 		nilfs_warn(btree->b_inode->i_sb,
-			   "invalid btree level: %d (key=%llu, ino=%lu, blocknr=%llu)",
+			   "invalid btree level: %d (key=%llu, ino=%llu, blocknr=%llu)",
 			   level, (unsigned long long)key,
 			   btree->b_inode->i_ino,
 			   (unsigned long long)bh->b_blocknr);
diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
index b243199036dfa1ab2299efaaa5bdf5da2d159ff2..3653db5cdb65137d1e660bb509c14ec4cbc8840b 100644
--- a/fs/nilfs2/dir.c
+++ b/fs/nilfs2/dir.c
@@ -150,7 +150,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
 
 Ebadsize:
 	nilfs_error(sb,
-		    "size of directory #%lu is not a multiple of chunk size",
+		    "size of directory #%llu is not a multiple of chunk size",
 		    dir->i_ino);
 	goto fail;
 Eshort:
@@ -169,7 +169,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
 	error = "disallowed inode number";
 bad_entry:
 	nilfs_error(sb,
-		    "bad entry in directory #%lu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
+		    "bad entry in directory #%llu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
 		    dir->i_ino, error, (folio->index << PAGE_SHIFT) + offs,
 		    (unsigned long)le64_to_cpu(p->inode),
 		    rec_len, p->name_len);
@@ -177,7 +177,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
 Eend:
 	p = (struct nilfs_dir_entry *)(kaddr + offs);
 	nilfs_error(sb,
-		    "entry in directory #%lu spans the page boundary offset=%lu, inode=%lu",
+		    "entry in directory #%llu spans the page boundary offset=%lu, inode=%lu",
 		    dir->i_ino, (folio->index << PAGE_SHIFT) + offs,
 		    (unsigned long)le64_to_cpu(p->inode));
 fail:
@@ -251,7 +251,7 @@ static int nilfs_readdir(struct file *file, struct dir_context *ctx)
 
 		kaddr = nilfs_get_folio(inode, n, &folio);
 		if (IS_ERR(kaddr)) {
-			nilfs_error(sb, "bad page in #%lu", inode->i_ino);
+			nilfs_error(sb, "bad page in #%llu", inode->i_ino);
 			ctx->pos += PAGE_SIZE - offset;
 			return -EIO;
 		}
@@ -336,7 +336,7 @@ struct nilfs_dir_entry *nilfs_find_entry(struct inode *dir,
 		/* next folio is past the blocks we've got */
 		if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
 			nilfs_error(dir->i_sb,
-			       "dir %lu size %lld exceeds block count %llu",
+			       "dir %llu size %lld exceeds block count %llu",
 			       dir->i_ino, dir->i_size,
 			       (unsigned long long)dir->i_blocks);
 			goto out;
@@ -382,7 +382,7 @@ struct nilfs_dir_entry *nilfs_dotdot(struct inode *dir, struct folio **foliop)
 	return next_de;
 
 fail:
-	nilfs_error(dir->i_sb, "directory #%lu %s", dir->i_ino, msg);
+	nilfs_error(dir->i_sb, "directory #%llu %s", dir->i_ino, msg);
 	folio_release_kmap(folio, de);
 	return NULL;
 }
diff --git a/fs/nilfs2/direct.c b/fs/nilfs2/direct.c
index 2d8dc6b35b5477947ca12a70288d3a3cce858aab..8bd0b1374e25f8ff510f3b36dbde2acc01aafc1e 100644
--- a/fs/nilfs2/direct.c
+++ b/fs/nilfs2/direct.c
@@ -338,7 +338,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
 	key = nilfs_bmap_data_get_key(bmap, *bh);
 	if (unlikely(key > NILFS_DIRECT_KEY_MAX)) {
 		nilfs_crit(bmap->b_inode->i_sb,
-			   "%s (ino=%lu): invalid key: %llu",
+			   "%s (ino=%llu): invalid key: %llu",
 			   __func__,
 			   bmap->b_inode->i_ino, (unsigned long long)key);
 		return -EINVAL;
@@ -346,7 +346,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
 	ptr = nilfs_direct_get_ptr(bmap, key);
 	if (unlikely(ptr == NILFS_BMAP_INVALID_PTR)) {
 		nilfs_crit(bmap->b_inode->i_sb,
-			   "%s (ino=%lu): invalid pointer: %llu",
+			   "%s (ino=%llu): invalid pointer: %llu",
 			   __func__,
 			   bmap->b_inode->i_ino, (unsigned long long)ptr);
 		return -EINVAL;
diff --git a/fs/nilfs2/gcinode.c b/fs/nilfs2/gcinode.c
index 561c220799c7aee879ad866865e377799c8ee6bb..62d4c1b787e95c961a360a4214d621d564ad8b4c 100644
--- a/fs/nilfs2/gcinode.c
+++ b/fs/nilfs2/gcinode.c
@@ -137,7 +137,7 @@ int nilfs_gccache_wait_and_mark_dirty(struct buffer_head *bh)
 		struct inode *inode = bh->b_folio->mapping->host;
 
 		nilfs_err(inode->i_sb,
-			  "I/O error reading %s block for GC (ino=%lu, vblocknr=%llu)",
+			  "I/O error reading %s block for GC (ino=%llu, vblocknr=%llu)",
 			  buffer_nilfs_node(bh) ? "node" : "data",
 			  inode->i_ino, (unsigned long long)bh->b_blocknr);
 		return -EIO;
diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 51bde45d586509dda3ef0cb7c46facb7fb2c61dd..51f7e125a311b868860e3e111700d49d4cb98fa6 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -108,7 +108,7 @@ int nilfs_get_block(struct inode *inode, sector_t blkoff,
 				 * be locked in this case.
 				 */
 				nilfs_warn(inode->i_sb,
-					   "%s (ino=%lu): a race condition while inserting a data block at offset=%llu",
+					   "%s (ino=%llu): a race condition while inserting a data block at offset=%llu",
 					   __func__, inode->i_ino,
 					   (unsigned long long)blkoff);
 				err = -EAGAIN;
@@ -789,7 +789,7 @@ static void nilfs_truncate_bmap(struct nilfs_inode_info *ii,
 		goto repeat;
 
 failed:
-	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%lu)",
+	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%llu)",
 		   ret, ii->vfs_inode.i_ino);
 }
 
@@ -1026,7 +1026,7 @@ int nilfs_set_file_dirty(struct inode *inode, unsigned int nr_dirty)
 			 * this inode.
 			 */
 			nilfs_warn(inode->i_sb,
-				   "cannot set file dirty (ino=%lu): the file is being freed",
+				   "cannot set file dirty (ino=%llu): the file is being freed",
 				   inode->i_ino);
 			spin_unlock(&nilfs->ns_inode_lock);
 			return -EINVAL; /*
@@ -1057,7 +1057,7 @@ int __nilfs_mark_inode_dirty(struct inode *inode, int flags)
 	err = nilfs_load_inode_block(inode, &ibh);
 	if (unlikely(err)) {
 		nilfs_warn(inode->i_sb,
-			   "cannot mark inode dirty (ino=%lu): error %d loading inode block",
+			   "cannot mark inode dirty (ino=%llu): error %d loading inode block",
 			   inode->i_ino, err);
 		return err;
 	}
diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
index 946b0d3534a5f22f34ac44a91fb121541881c548..09adb40c65e505d92012a3d2f5fe8a5696e10056 100644
--- a/fs/nilfs2/mdt.c
+++ b/fs/nilfs2/mdt.c
@@ -203,7 +203,7 @@ static int nilfs_mdt_read_block(struct inode *inode, unsigned long block,
 	err = -EIO;
 	if (!buffer_uptodate(first_bh)) {
 		nilfs_err(inode->i_sb,
-			  "I/O error reading meta-data file (ino=%lu, block-offset=%lu)",
+			  "I/O error reading meta-data file (ino=%llu, block-offset=%lu)",
 			  inode->i_ino, block);
 		goto failed_bh;
 	}
diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
index 40f4b1a28705b6e0eb8f0978cf3ac18b43aa1331..40ac679ec56e400b1df98e9be6fe9ca338a9ba51 100644
--- a/fs/nilfs2/namei.c
+++ b/fs/nilfs2/namei.c
@@ -292,7 +292,7 @@ static int nilfs_do_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (!inode->i_nlink) {
 		nilfs_warn(inode->i_sb,
-			   "deleting nonexistent file (ino=%lu), %d",
+			   "deleting nonexistent file (ino=%llu), %d",
 			   inode->i_ino, inode->i_nlink);
 		set_nlink(inode, 1);
 	}
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 098a3bd103e04cd09b0689fe2017380d74664496..4b1bf559f3524b1cc3965dae9fd3e5745718569d 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2024,7 +2024,7 @@ static int nilfs_segctor_collect_dirty_files(struct nilfs_sc_info *sci,
 				ifile, ii->vfs_inode.i_ino, &ibh);
 			if (unlikely(err)) {
 				nilfs_warn(sci->sc_super,
-					   "log writer: error %d getting inode block (ino=%lu)",
+					   "log writer: error %d getting inode block (ino=%llu)",
 					   err, ii->vfs_inode.i_ino);
 				return err;
 			}
diff --git a/include/trace/events/nilfs2.h b/include/trace/events/nilfs2.h
index 8880c11733dd307c223cc62ee34ebeff650ecb12..86a0011c9eeaf031cfa0b79875b2b106ef8b7cfd 100644
--- a/include/trace/events/nilfs2.h
+++ b/include/trace/events/nilfs2.h
@@ -165,14 +165,14 @@ TRACE_EVENT(nilfs2_segment_usage_freed,
 
 TRACE_EVENT(nilfs2_mdt_insert_new_block,
 	    TP_PROTO(struct inode *inode,
-		     unsigned long ino,
+		     u64 ino,
 		     unsigned long block),
 
 	    TP_ARGS(inode, ino, block),
 
 	    TP_STRUCT__entry(
 		    __field(struct inode *, inode)
-		    __field(unsigned long, ino)
+		    __field(u64, ino)
 		    __field(unsigned long, block)
 	    ),
 
@@ -182,7 +182,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
 		    __entry->block = block;
 		    ),
 
-	    TP_printk("inode = %p ino = %lu block = %lu",
+	    TP_printk("inode = %p ino = %llu block = %lu",
 		      __entry->inode,
 		      __entry->ino,
 		      __entry->block)
@@ -190,7 +190,7 @@ TRACE_EVENT(nilfs2_mdt_insert_new_block,
 
 TRACE_EVENT(nilfs2_mdt_submit_block,
 	    TP_PROTO(struct inode *inode,
-		     unsigned long ino,
+		     u64 ino,
 		     unsigned long blkoff,
 		     enum req_op mode),
 
@@ -198,7 +198,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
 
 	    TP_STRUCT__entry(
 		    __field(struct inode *, inode)
-		    __field(unsigned long, ino)
+		    __field(u64, ino)
 		    __field(unsigned long, blkoff)
 		    /*
 		     * Use field_struct() to avoid is_signed_type() on the
@@ -214,7 +214,7 @@ TRACE_EVENT(nilfs2_mdt_submit_block,
 		    __entry->mode = mode;
 		    ),
 
-	    TP_printk("inode = %p ino = %lu blkoff = %lu mode = %x",
+	    TP_printk("inode = %p ino = %llu blkoff = %lu mode = %x",
 		      __entry->inode,
 		      __entry->ino,
 		      __entry->blkoff,

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
