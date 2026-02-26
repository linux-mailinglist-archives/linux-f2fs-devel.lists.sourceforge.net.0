Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IDWhE75uoGkHjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:03:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B71171A977F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:03:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AIoWuHgEvebs06aZB88xXtX89AsbmiSScre/Ifa050c=; b=XCJe9KG/cchyYlzejuJA51OD5i
	mI1f6g4fguh1j+giHRErlqcKf0e7MqeJJywUi+fFKWaJpvQW6A8O0zh49lFRs6Hz4Q7AsuyiAOFL3
	WW0Em1k1VwNCVOvVC4Afi3kXkFQkp/IRAlRFGUug6NL81Nb4StGZNicLq+AZfQDUuVeI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdpR-00046D-EE;
	Thu, 26 Feb 2026 16:03:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdpP-00045h-8L;
 Thu, 26 Feb 2026 16:03:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nrwfkT0dxFjw57jrdCKIMIyJAT9LmgJ4Zg9Pc/AqhAc=; b=lVpWsItiepBOYr13elErQg/Ln/
 f89pfJP4BCk1qLIZJ7rVM2BloNd6VPwsu5Njc+Ocq/MMKhTaOiYfHli+t2XHQE1bM94/PE9DBoljm
 lTW3rFSluaIq/v57gvIH/wS6d12igBmZhqkc8mSNoKCzsCM9a172jNoF7ri768HdcHn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nrwfkT0dxFjw57jrdCKIMIyJAT9LmgJ4Zg9Pc/AqhAc=; b=kxzkKBtu63mnYEVWK4gsd7txFj
 EhMHP2JqUyVsoV3dwF1luWwM4DaG0FQmVSJ0hQIaQN5EqJij0JXQRpKxExb9XDoSao9Ep2cA8LvmQ
 /n3st6+o57jEdsiLa0FMXL6i4aMkSNrWW/LoLWVeheK4ALXU/2ghZsCX+Lu8Pq8qn228=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdpJ-0005TV-W5; Thu, 26 Feb 2026 16:03:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 24CC36184C;
 Thu, 26 Feb 2026 16:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 662A7C2BCB6;
 Thu, 26 Feb 2026 16:02:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121766;
 bh=fIoK69cdEWEBP2I83U9z6r8DTMmEfNeiFVnV/oaeX78=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Ji2YnR8mQ5wad/oF0jPuW9nL/OPwCpL6+zKMmv0H19n9XnotdFO3o3e3rUCEDhb9Z
 1WF/KkwzM64ExlHBH0B69S4s2meMjQx9vWjoA/AkZ80bU81SsuAlI2fXJwJraJ238b
 zH7VVtRkcRXHsnWSJaF5568UCrPS7PThaFg9NlqqN+urXCQoEZRdyaUzrdrxBCUO2E
 7I82X6Y5bVSyvS9s81e5aPbOZ1Dp3A7Hecs7W8mEzGL4plcq6VYIkCD9jx4XfbbS7i
 sO8wk3aypDF8Sqbh28vP5BmlyYB77S1ZnMG8ghlFhEhkRk5jxxg9jMGGDMylpiV/ff
 015uIipzZyWwA==
Date: Thu, 26 Feb 2026 10:55:33 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-31-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7381; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=fIoK69cdEWEBP2I83U9z6r8DTMmEfNeiFVnV/oaeX78=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0MrWn95OY2IvrlnUkZNzB5OKGldbHxaeOhx
 6fnNYyqTCaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtDAAKCRAADmhBGVaC
 FTUQD/48IgCmYwuVS4Syo6OsAn79pnl/D+n76rrtbnabt+Gej6so4CnUg14EOIdtAOICigP2EiV
 LrN/eA1QXBz+cgGpZ+Bp+uYstZEXVE4wj85CNn3345fs/O8Twwy59xmFxPLabFN+2rhMKDFRUVB
 qZHd1/KAm3NDhhTnrF12i7q6W6qeY6ACZvT5gYalYp289/OgmM50p12JHBIxViZOGjK9yW9ZJ5k
 6C8j82F0K6aqnKKDaAlwZ5G4swXcYaRLDSCKLfeErd/1ggu8jObCi+H25F6gwuAsQD2TEC+bRgP
 +xT3s+NtSrG3Cf0Q/Kim3XDDQc7abwcwqij61zu07WrcrGMBJCsaUvJqb73ZKWekCHuuEurPyC2
 A60TdWIk2ox9QpZhNSdCY7UyXhyPqdBCpKB3TAPA7g8osE4Siu/sPGrhS6yaxcl72XJu6kFBODo
 y2D23z9768RuMBc07LSCgxsuYStiKlUuplXWVStRZ1nQqm5i9ktn7YPXuFtmTY4HqnsfVMaDgjY
 G3ZTx5towv6Y6QxYKbTVv3Eu/VDTdtWWHhf+o4H1YT4TtWRumFVxwiGrd712o3hs/2ccYsV2sJm
 qbvTzz3JyAjyloZygBQkSVIGL8QK+PeRmEtzUJ/e1SzB51SUxA85NK9dyRNGtX+eOX/PCgt7gVU
 oQbY/jqG9WlxSQg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update format strings and local variable types in ext2 for
 the i_ino type change from unsigned long to u64. Signed-off-by: Jeff Layton
 <jlayton@kernel.org> --- fs/ext2/dir.c | 10 +++++----- fs/ext2/ialloc.c |
 9 +++++---- fs/ext2/inode.c | 2 +- fs/ext2/xattr.c | 14 +++++++------- 4
 files changed, 18 insertio [...] 
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
X-Headers-End: 1vvdpJ-0005TV-W5
Subject: [f2fs-dev] [PATCH 31/61] ext2: update format strings for u64 i_ino
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
X-Rspamd-Queue-Id: B71171A977F
X-Rspamd-Action: no action

Update format strings and local variable types in ext2 for the
i_ino type change from unsigned long to u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ext2/dir.c    | 10 +++++-----
 fs/ext2/ialloc.c |  9 +++++----
 fs/ext2/inode.c  |  2 +-
 fs/ext2/xattr.c  | 14 +++++++-------
 4 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/fs/ext2/dir.c b/fs/ext2/dir.c
index 395fc36c089b7bb6360a8326727bd5606c7e2476..278d4be8ecbe7790204b5ba985a7ce088fadb181 100644
--- a/fs/ext2/dir.c
+++ b/fs/ext2/dir.c
@@ -141,7 +141,7 @@ static bool ext2_check_folio(struct folio *folio, int quiet, char *kaddr)
 Ebadsize:
 	if (!quiet)
 		ext2_error(sb, __func__,
-			"size of directory #%lu is not a multiple "
+			"size of directory #%llu is not a multiple "
 			"of chunk size", dir->i_ino);
 	goto fail;
 Eshort:
@@ -160,7 +160,7 @@ static bool ext2_check_folio(struct folio *folio, int quiet, char *kaddr)
 	error = "inode out of bounds";
 bad_entry:
 	if (!quiet)
-		ext2_error(sb, __func__, "bad entry in directory #%lu: : %s - "
+		ext2_error(sb, __func__, "bad entry in directory #%llu: : %s - "
 			"offset=%llu, inode=%lu, rec_len=%d, name_len=%d",
 			dir->i_ino, error, folio_pos(folio) + offs,
 			(unsigned long) le32_to_cpu(p->inode),
@@ -170,7 +170,7 @@ static bool ext2_check_folio(struct folio *folio, int quiet, char *kaddr)
 	if (!quiet) {
 		p = (ext2_dirent *)(kaddr + offs);
 		ext2_error(sb, "ext2_check_folio",
-			"entry in directory #%lu spans the page boundary"
+			"entry in directory #%llu spans the page boundary"
 			"offset=%llu, inode=%lu",
 			dir->i_ino, folio_pos(folio) + offs,
 			(unsigned long) le32_to_cpu(p->inode));
@@ -281,7 +281,7 @@ ext2_readdir(struct file *file, struct dir_context *ctx)
 
 		if (IS_ERR(kaddr)) {
 			ext2_error(sb, __func__,
-				   "bad page in #%lu",
+				   "bad page in #%llu",
 				   inode->i_ino);
 			ctx->pos += PAGE_SIZE - offset;
 			return PTR_ERR(kaddr);
@@ -383,7 +383,7 @@ struct ext2_dir_entry_2 *ext2_find_entry (struct inode *dir,
 		/* next folio is past the blocks we've got */
 		if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
 			ext2_error(dir->i_sb, __func__,
-				"dir %lu size %lld exceeds block count %llu",
+				"dir %llu size %lld exceeds block count %llu",
 				dir->i_ino, dir->i_size,
 				(unsigned long long)dir->i_blocks);
 			goto out;
diff --git a/fs/ext2/ialloc.c b/fs/ext2/ialloc.c
index fdf63e9c6e7caa6d5267c25faa6c293622f00627..bf21b57cf98cd5f90e1177454a8fd5cca482c2f8 100644
--- a/fs/ext2/ialloc.c
+++ b/fs/ext2/ialloc.c
@@ -169,9 +169,10 @@ static void ext2_preread_inode(struct inode *inode)
 	unsigned long block_group;
 	unsigned long offset;
 	unsigned long block;
+	unsigned int ino = inode->i_ino;
 	struct ext2_group_desc * gdp;
 
-	block_group = (inode->i_ino - 1) / EXT2_INODES_PER_GROUP(inode->i_sb);
+	block_group = (ino - 1) / EXT2_INODES_PER_GROUP(inode->i_sb);
 	gdp = ext2_get_group_desc(inode->i_sb, block_group, NULL);
 	if (gdp == NULL)
 		return;
@@ -179,7 +180,7 @@ static void ext2_preread_inode(struct inode *inode)
 	/*
 	 * Figure out the offset within the block group inode table
 	 */
-	offset = ((inode->i_ino - 1) % EXT2_INODES_PER_GROUP(inode->i_sb)) *
+	offset = ((ino - 1) % EXT2_INODES_PER_GROUP(inode->i_sb)) *
 				EXT2_INODE_SIZE(inode->i_sb);
 	block = le32_to_cpu(gdp->bg_inode_table) +
 				(offset >> EXT2_BLOCK_SIZE_BITS(inode->i_sb));
@@ -381,7 +382,7 @@ static int find_group_other(struct super_block *sb, struct inode *parent)
 	 *
 	 * So add our directory's i_ino into the starting point for the hash.
 	 */
-	group = (group + parent->i_ino) % ngroups;
+	group = (group + (unsigned int)parent->i_ino) % ngroups;
 
 	/*
 	 * Use a quadratic hash to find a group with a free inode and some
@@ -589,7 +590,7 @@ struct inode *ext2_new_inode(struct inode *dir, umode_t mode,
 		goto fail_free_drop;
 
 	mark_inode_dirty(inode);
-	ext2_debug("allocating inode %lu\n", inode->i_ino);
+	ext2_debug("allocating inode %llu\n", inode->i_ino);
 	ext2_preread_inode(inode);
 	return inode;
 
diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index dbfe9098a1245d97ba97cff24395754197043c33..819fa81901b79e0ef4e01e428445bd8d8cc01e68 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -1152,7 +1152,7 @@ static void ext2_free_branches(struct inode *inode, __le32 *p, __le32 *q, int de
 			 */ 
 			if (!bh) {
 				ext2_error(inode->i_sb, "ext2_free_branches",
-					"Read failure, inode=%ld, block=%ld",
+					"Read failure, inode=%lld, block=%ld",
 					inode->i_ino, nr);
 				continue;
 			}
diff --git a/fs/ext2/xattr.c b/fs/ext2/xattr.c
index c885dcc3bd0d180c4c3f0945ca23ed8ce569ef10..e7f87d1514458f14252702119e1c065a28ea3d73 100644
--- a/fs/ext2/xattr.c
+++ b/fs/ext2/xattr.c
@@ -227,7 +227,7 @@ ext2_xattr_get(struct inode *inode, int name_index, const char *name,
 	if (!ext2_xattr_header_valid(HDR(bh))) {
 bad_block:
 		ext2_error(inode->i_sb, "ext2_xattr_get",
-			"inode %ld: bad block %d", inode->i_ino,
+			"inode %llu: bad block %d", inode->i_ino,
 			EXT2_I(inode)->i_file_acl);
 		error = -EIO;
 		goto cleanup;
@@ -313,7 +313,7 @@ ext2_xattr_list(struct dentry *dentry, char *buffer, size_t buffer_size)
 	if (!ext2_xattr_header_valid(HDR(bh))) {
 bad_block:
 		ext2_error(inode->i_sb, "ext2_xattr_list",
-			"inode %ld: bad block %d", inode->i_ino,
+			"inode %llu: bad block %d", inode->i_ino,
 			EXT2_I(inode)->i_file_acl);
 		error = -EIO;
 		goto cleanup;
@@ -454,7 +454,7 @@ ext2_xattr_set(struct inode *inode, int name_index, const char *name,
 		if (!ext2_xattr_header_valid(header)) {
 bad_block:
 			ext2_error(sb, "ext2_xattr_set",
-				"inode %ld: bad block %d", inode->i_ino, 
+				"inode %llu: bad block %d", inode->i_ino,
 				   EXT2_I(inode)->i_file_acl);
 			error = -EIO;
 			goto cleanup;
@@ -833,7 +833,7 @@ ext2_xattr_delete_inode(struct inode *inode)
 
 	if (!ext2_data_block_valid(sbi, EXT2_I(inode)->i_file_acl, 1)) {
 		ext2_error(inode->i_sb, "ext2_xattr_delete_inode",
-			"inode %ld: xattr block %d is out of data blocks range",
+			"inode %lld: xattr block %d is out of data blocks range",
 			inode->i_ino, EXT2_I(inode)->i_file_acl);
 		goto cleanup;
 	}
@@ -841,14 +841,14 @@ ext2_xattr_delete_inode(struct inode *inode)
 	bh = sb_bread(inode->i_sb, EXT2_I(inode)->i_file_acl);
 	if (!bh) {
 		ext2_error(inode->i_sb, "ext2_xattr_delete_inode",
-			"inode %ld: block %d read error", inode->i_ino,
+			"inode %llu: block %d read error", inode->i_ino,
 			EXT2_I(inode)->i_file_acl);
 		goto cleanup;
 	}
 	ea_bdebug(bh, "b_count=%d", atomic_read(&(bh->b_count)));
 	if (!ext2_xattr_header_valid(HDR(bh))) {
 		ext2_error(inode->i_sb, "ext2_xattr_delete_inode",
-			"inode %ld: bad block %d", inode->i_ino,
+			"inode %llu: bad block %d", inode->i_ino,
 			EXT2_I(inode)->i_file_acl);
 		goto cleanup;
 	}
@@ -952,7 +952,7 @@ ext2_xattr_cache_find(struct inode *inode, struct ext2_xattr_header *header)
 		bh = sb_bread(inode->i_sb, ce->e_value);
 		if (!bh) {
 			ext2_error(inode->i_sb, "ext2_xattr_cache_find",
-				"inode %ld: block %ld read error",
+				"inode %lld: block %ld read error",
 				inode->i_ino, (unsigned long) ce->e_value);
 		} else {
 			lock_buffer(bh);

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
