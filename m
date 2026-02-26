Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MBYpIu5toGk3jgQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F45B1A9593
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XO3NaO8B2OBRWHU3UkiHBXdQInp2eSBA/VTmw3zxdBE=; b=g1lQ9Rkz4rG3G+AniE/kroyExV
	rLEWWhnziknflSJ0Y6lGBwr5sQpZV9GzaBIOygNNAHlDjiytWsPp8IwNKu9tkFzRGcsKJkRUNFsVe
	g+dzhCXInL+Gges5Zsg2JrvHjxhYZJJiZX5d3+wmJRPYqdlVKZ1WKlvFbuv87Zfe6cuM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdm8-0000Wf-Mf;
	Thu, 26 Feb 2026 15:59:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdm7-0000WI-N4;
 Thu, 26 Feb 2026 15:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u7edsg4C7ia7st6nXCys5xdk4S/5fBr8tFvDFf2zJqc=; b=eyrNcmmlbYyOniZn+bXqMNHbmw
 NnvLFvjBZZOjtQNs92UYSbTmvedBKHPHwQdZK1wmftDwIVx9uleavld7KaBx2UjvlwQWfg6PdEuRR
 XrQGsT4LQDRGCv6DXlJFowMvAP5zTMzl2SSlB4ijppx9LUHyaO6mh9yVn1bYA32sFwC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u7edsg4C7ia7st6nXCys5xdk4S/5fBr8tFvDFf2zJqc=; b=OL2YBNtjpt5pNkJ1el5IcOCn6Y
 bk1Ce1sh8FZ4/05v/bCQkrb7CIyqoxUab4VPFncJUECMfMlqj58kZcnGbjcEmYoM9JcSr7rvY9MCr
 uiQSwZDD56YREnnCQ/VsVonsqShJDUQIAFysaqIV9N3hBLQBHurjakB8ItX6GLtq9LRw=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdm0-000541-0M; Thu, 26 Feb 2026 15:59:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 304A3600AE;
 Thu, 26 Feb 2026 15:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BCBFC19424;
 Thu, 26 Feb 2026 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121565;
 bh=g5wV3nKd2fkYaUzdtAFph9msp5xwJ6RZyVnJ1pAoKXQ=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=N77oxwXzWSmqiv4n9JoAOeNfszEZBfeOgSv8Tvh6hdzfxMHzcWkg6NqzIwzXL1t9J
 lIfgR0aoySbF9TxW4bRiTuva6YbgTY7qIIkaiL0SyNKorrLDxsWZwwc77811vnw/4z
 kH1IrYSjgNM/SD7ioFxLkm0RjZqGM3zdAdSxhKHrqgU2v6KjjiZEedNO1Oay17zKYI
 m29sPyavc2gZoemVxxngEEdBgYx7vYYt6cswz+cjE+UpRoOcJEabGTgYyhStcY/9PD
 W7SiFP1Zc9ivzrBKhGK10ZSSiECGZ/2W0j3mghQNRu4TT6vd2HuPhzeOT3wYYlaDHD
 SFeO6K5okNvrQ==
Date: Thu, 26 Feb 2026 10:55:17 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-15-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=g5wV3nKd2fkYaUzdtAFph9msp5xwJ6RZyVnJ1pAoKXQ=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0HH319jkE4Yrl34DaunuDnGYZ75BXLH9h46
 zoQskxUz6GJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtBwAKCRAADmhBGVaC
 FUwjEAC2ZD0qhNxn0eTdG9w5L7ZFtQ6MZt/PduR8tBc3steDLPNlVr1HlkztvzNhjEOjeFzGNPU
 4noqHrsD5fArwVU/hc6LnjXeQ8RAy/6Hlf3azXhaKWbWbrzkh13zrEYDIdOJ14A9y6jY3+xttky
 D8J0Zr1cBS+Fea9EypNUH9iUbsMWzobZMoFdR0QuVJKHuORdhQcCVeBdduppG5CLBlz8mDe9fO4
 fl87CAf8I8SWWGbHr+Ci6+/7Cr8hK6ED5HB2IDSeilxnKXdaHNFgGNGNGzYwowpMPX6H/JlrNSN
 EanbpucgYZEbZp8Q5AP8enVYbOCx8iesoQSTsYqhB4YbEZyRXe/HyQcclJ+1cKiT+/mKW7y8Krc
 M0+g4XeUfCV28zdM/SRcop8nhoVyuv4ZR9JNdA9pb4+iiVb41A9l8m9vkxO/uFsXMfaG2sPRjk3
 l3rQ2itrahMP9pU9pjjJ3pO6wU4VI1O8I3iw87/ngaPXuWbRUxWm+ZQ3BLLijixSs2EGPRHP0s1
 FP/nnlD54YoVMLF9vPr4rvBWgP4pY2pJsjAOTLFpNvYzfvlVpGWBUhJwm6vSBhfysRhoV3ME84C
 9U+FefjqnYIccrpU9UZdDviywXX3E9g8/fiSYVJTayZJdkBeH4Qdvg+hgVcv3BrX1XcZxdljHr4
 zqhW1CQyEOF9qKA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Update the seq_printf format string in lock_get_status() from
 %lu to %llu for printing inode->i_ino, since i_ino is now u64. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/locks.c | 6 +++--- 1 file changed,
 3 insertions(+), 3 deletions(-) 
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
X-Headers-End: 1vvdm0-000541-0M
Subject: [f2fs-dev] [PATCH 15/61] locks: update /proc/locks format for u64
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
X-Rspamd-Queue-Id: 0F45B1A9593
X-Rspamd-Action: no action

Update the seq_printf format string in lock_get_status() from %lu to
%llu for printing inode->i_ino, since i_ino is now u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/locks.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/locks.c b/fs/locks.c
index d13ec930b7bb03905df50bdce30b84749edab8d0..d8b066fb42108971f6b3c7449dbc9b5f8df16b13 100644
--- a/fs/locks.c
+++ b/fs/locks.c
@@ -234,7 +234,7 @@ locks_check_ctx_lists(struct inode *inode)
 	if (unlikely(!list_empty(&ctx->flc_flock) ||
 		     !list_empty(&ctx->flc_posix) ||
 		     !list_empty(&ctx->flc_lease))) {
-		pr_warn("Leaked locks on dev=0x%x:0x%x ino=0x%lx:\n",
+		pr_warn("Leaked locks on dev=0x%x:0x%x ino=0x%llx:\n",
 			MAJOR(inode->i_sb->s_dev), MINOR(inode->i_sb->s_dev),
 			inode->i_ino);
 		locks_dump_ctx_list(&ctx->flc_flock, "FLOCK");
@@ -251,7 +251,7 @@ locks_check_ctx_file_list(struct file *filp, struct list_head *list, char *list_
 
 	list_for_each_entry(flc, list, flc_list)
 		if (flc->flc_file == filp)
-			pr_warn("Leaked %s lock on dev=0x%x:0x%x ino=0x%lx "
+			pr_warn("Leaked %s lock on dev=0x%x:0x%x ino=0x%llx "
 				" fl_owner=%p fl_flags=0x%x fl_type=0x%x fl_pid=%u\n",
 				list_type, MAJOR(inode->i_sb->s_dev),
 				MINOR(inode->i_sb->s_dev), inode->i_ino,
@@ -2896,7 +2896,7 @@ static void lock_get_status(struct seq_file *f, struct file_lock_core *flc,
 			     (type == F_RDLCK) ? "READ" : "UNLCK");
 	if (inode) {
 		/* userspace relies on this representation of dev_t */
-		seq_printf(f, "%d %02x:%02x:%lu ", pid,
+		seq_printf(f, "%d %02x:%02x:%llu ", pid,
 				MAJOR(inode->i_sb->s_dev),
 				MINOR(inode->i_sb->s_dev), inode->i_ino);
 	} else {

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
