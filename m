Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNR2FC5woGk3jgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:09:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E04BD1A9B1E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 17:09:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xB+uTMl0O30Qf/aivoFGNTsdbRWw4w0g3eF52GnnUPg=; b=lpESdvox5q4x6lgnfqMkERHfQI
	/H1arkTPKvkvCFjgSnu+lkcComjOeKLP7PbZB5xZskjATPXPhNQQBdjp7UBP2TeE4iwzh3onnYwNJ
	3KJFtuRGg2EcfOH8BesiCxIyQlxEbHP4xCFudLfvHC2SF+ZtxGu7j9byBmC2Wn+WlF1A=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdvQ-0003Fk-Cw;
	Thu, 26 Feb 2026 16:09:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdvP-0003FL-62;
 Thu, 26 Feb 2026 16:09:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NPAQGlZWtF3twqInmv8UBV7lhOjoWbAcM+Xf1T0CoNE=; b=ZoJnbT1S0JlO68OJkz8mAICxy8
 aKX1KDKES3QvaWI78MXPO60YkxtKqOWYzcS7Ei1Oswm7UKrwK5fy9WBB0tpXWEYDC0koQ7e4qQT9t
 YRslZeZCNFsPCfq0Hy8Qz7r9HhFddKPJ5KhuI/KWBT8VcwjX1QqAuEEhsiX1GGlMhQMQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NPAQGlZWtF3twqInmv8UBV7lhOjoWbAcM+Xf1T0CoNE=; b=Gw3sHwWPe4MJBBZjXflF3vgrKH
 MkzDqheAszTTWMdex3kiFweXL3aCrUS/OuA2JtwIaInI/wzAWvK+35e1KNvo5ZOLvNt0OTPDDt8BI
 r0R+wphpvzgnknNZjoCg/M6JwaPy5jBlyPHVam+eHfLMRtrVC40B36l4oKqeQ15xfZmA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdvL-0006Ps-G8; Thu, 26 Feb 2026 16:09:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2AE95423BD;
 Thu, 26 Feb 2026 16:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFF4AC2BCB0;
 Thu, 26 Feb 2026 16:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772122141;
 bh=ohZEfeuOi4xkg2naUuFketibeULdy5VGYUJnnORD2g0=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Idts03oyKH96SfAopisoKaTLc9SLusBKptp8k/MDagLyPeOPplHCfbxiFlufDFLUc
 5K4x+4vaAaBsfCpythF7s9D8EXByli3J3u+iy7xATN3OlRJcUBEcuJN4S7kWV8Q8G4
 kOfdNs81HdEuVdL2gjffCyo3XQcO4jO4Dnwu4cYxFGG1cqCeDmWXs52Am2xXWjWgS4
 OHldjywAYIMuMJotzrCl3t6dbCEWDiOdxjpl+MI3bIDcoO73xuazQ8k66fi6Admx/j
 nWxyaEUpqRkV/SeIHZG9VWpdqkUZ5a5E8jjeNvQO8d/KJ1BO0kCzaj91GgaIrGYKnL
 sd5mww8Joksmg==
Date: Thu, 26 Feb 2026 10:56:03 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-61-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2734; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=ohZEfeuOi4xkg2naUuFketibeULdy5VGYUJnnORD2g0=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0TArPB/A14lA7MwkzhIW1OToQ0CsW6q2kMJ
 NMIT4N0RQ2JAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtEwAKCRAADmhBGVaC
 Fd2vEAC7kuwrOi18JaQDOOAKwnH+i9pcIGDqiGslLsrUPbu1STWmcsQX2/GZrZEiyYKHKP0S6Wl
 zcMnbPl3utwH6hWUgGtAY+gzzjhdicih0FDyp40jJOzpKVKjISFyGXmUR+d+WyX5NpbL6x7qZu9
 1Miz3ZXPbvTnSNhE8UDHtPJWb2LmH5aKdBmNvDuy1kUOZgpWBZN0V+Ugpt5CfHOpb07X6niHBko
 zYIXIl6b8SQvksIwttBHLHM7QD8ow6T8ami6Pv1KXGhOOsW5PIUcgKu7c6qD1Ir8/ZfUUAlgFgV
 C9+vZOR5mC4QnKJBd++VbAJ3ULe7TCMOJv3o9H2kRNMQGl5ztzX6aB9BGpF+YXEKrIeFwlVdTJs
 Wd6qjLkpJj32hltK0IEZaYfHtDb2wBvKqYxVW6nrow+NnCFN/ks1A7JF6fvNPLkiVzv6bsthwaT
 hT6eCv8yxReYIOkkcqbBpyYIyRStZuKDMahsoKkn/NLlvFbCqB06XLmdAHID33m0jXIuroMxuC5
 el7Oug4tahBPWWr4msK1xsxlFlcvwmzmYJvLsGrgik6EThKzRuz1zmh3kfJ5AOnN+pKoArTRBQK
 SunbKJEttAFl0PfaA332vCGW9ETR82ytCvG59Wew+5CiziepSNpMW6ZDKu0oYg5nww31TsjGKV6
 lhC0Z4ASG6kR0mg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Update format strings from %lu/%lx to %llu/%llx and 0UL
 literal
 to 0ULL in pipe, dcache, fserror, and eventpoll, now that i_ino is u64 instead
 of unsigned long. Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 fs/dcache.c
 | 4 ++-- fs/eventpoll.c | 2 +- fs/fserror.c | 2 +- fs/pipe.c | 2 +- 4 files
 changed, 5 insertions(+), 5 deletions(-) 
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
X-Headers-End: 1vvdvL-0006Ps-G8
Subject: [f2fs-dev] [PATCH 61/61] vfs: update core format strings for u64
 i_ino
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
X-Rspamd-Queue-Id: E04BD1A9B1E
X-Rspamd-Action: no action

Update format strings from %lu/%lx to %llu/%llx and 0UL literal to
0ULL in pipe, dcache, fserror, and eventpoll, now that i_ino is u64
instead of unsigned long.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/dcache.c    | 4 ++--
 fs/eventpoll.c | 2 +-
 fs/fserror.c   | 2 +-
 fs/pipe.c      | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/dcache.c b/fs/dcache.c
index 24f4f3acaa8cffd6f98124eec38c1a92d6c9fd8e..9e8425ecd88955c72027d21591b1d12c87e7e8aa 100644
--- a/fs/dcache.c
+++ b/fs/dcache.c
@@ -1637,11 +1637,11 @@ static enum d_walk_ret umount_check(void *_data, struct dentry *dentry)
 	if (dentry == _data && dentry->d_lockref.count == 1)
 		return D_WALK_CONTINUE;
 
-	WARN(1, "BUG: Dentry %p{i=%lx,n=%pd} "
+	WARN(1, "BUG: Dentry %p{i=%llx,n=%pd} "
 			" still in use (%d) [unmount of %s %s]\n",
 		       dentry,
 		       dentry->d_inode ?
-		       dentry->d_inode->i_ino : 0UL,
+		       dentry->d_inode->i_ino : 0ULL,
 		       dentry,
 		       dentry->d_lockref.count,
 		       dentry->d_sb->s_type->name,
diff --git a/fs/eventpoll.c b/fs/eventpoll.c
index 5714e900567c499739bb205f43bb6bf73f7ebe54..4ccd4d2e31adf571f939d2e777123e40302e565f 100644
--- a/fs/eventpoll.c
+++ b/fs/eventpoll.c
@@ -1080,7 +1080,7 @@ static void ep_show_fdinfo(struct seq_file *m, struct file *f)
 		struct inode *inode = file_inode(epi->ffd.file);
 
 		seq_printf(m, "tfd: %8d events: %8x data: %16llx "
-			   " pos:%lli ino:%lx sdev:%x\n",
+			   " pos:%lli ino:%llx sdev:%x\n",
 			   epi->ffd.fd, epi->event.events,
 			   (long long)epi->event.data,
 			   (long long)epi->ffd.file->f_pos,
diff --git a/fs/fserror.c b/fs/fserror.c
index 06ca86adab9b769dfb72ec58b9e51627abee5152..1e4d11fd9562fd158a23b64ca60e9b7e01719cb8 100644
--- a/fs/fserror.c
+++ b/fs/fserror.c
@@ -176,7 +176,7 @@ void fserror_report(struct super_block *sb, struct inode *inode,
 lost:
 	if (inode)
 		pr_err_ratelimited(
- "%s: lost file I/O error report for ino %lu type %u pos 0x%llx len 0x%llx error %d",
+ "%s: lost file I/O error report for ino %llu type %u pos 0x%llx len 0x%llx error %d",
 		       sb->s_id, inode->i_ino, type, pos, len, error);
 	else
 		pr_err_ratelimited(
diff --git a/fs/pipe.c b/fs/pipe.c
index b44a756c0b4165edc2801b2290bf35480245d7a6..9841648c9cf3e8e569cf6ba5c792624fe92396f5 100644
--- a/fs/pipe.c
+++ b/fs/pipe.c
@@ -873,7 +873,7 @@ static struct vfsmount *pipe_mnt __ro_after_init;
  */
 static char *pipefs_dname(struct dentry *dentry, char *buffer, int buflen)
 {
-	return dynamic_dname(buffer, buflen, "pipe:[%lu]",
+	return dynamic_dname(buffer, buflen, "pipe:[%llu]",
 				d_inode(dentry)->i_ino);
 }
 

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
