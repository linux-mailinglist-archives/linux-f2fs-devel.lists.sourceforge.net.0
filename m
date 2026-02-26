Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uAXEHoVtoGkHjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:57:57 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DA41A941F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:57:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C+BGFhT65QMtMqt8tdVkPsx26nE+ucqurZvflESq3jA=; b=P9Yhg8VnhSkSAjHKKIhmiMG4oQ
	FeZQXuhBYIH65+/k5ybNEk66QbeP2TR/c6+fMSnJaOicRZaDuR79aj3C/ypWYTntqvMsspfe2Jlgh
	L/xBqeeHBhbY3+Ll5gnB2uCoBhEk4XXdqWYL1CJrXEhrD0RNHlKYuJO+8R1YiIZOuboY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdkP-00005A-VC;
	Thu, 26 Feb 2026 15:57:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdkN-0008Tc-S0;
 Thu, 26 Feb 2026 15:57:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mJyZsz+fohmAK08AHNG3YfkKVqQB04kAr1yiroxeWic=; b=hS5S+2RDlI4IzjBNs6CyNDefA2
 a9QQ3NvOqrVNu+yjkhA1wxQe0fHqiZ1zsQLkNI2PYmPs2PUBBTeWfHe+3SEGHMUFKseNIP0yoyr0G
 +5ITdTZ9vBIsOSrbmKWZHg3EnfbAaaQuNGKiQWpbQ6bXYPSGcIG6KUeflpRYaQK3ZsY0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mJyZsz+fohmAK08AHNG3YfkKVqQB04kAr1yiroxeWic=; b=m15bHiOHY6OwRCY4ZGrKXVt7jM
 QfclFXb0EXU4hntRISiROBWxkp8pmnCgq+NMH2xLy6IEEjVF6NRPfMhsoiCTbjeF22YvOYn11zc6U
 Hkc+aWKk+4QZcJSBkyv7BwjwoBf7UDLTQbw60FQE1iFhw1SgWlqkJtClMX/J0r3eFrp8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdkN-0004tt-9A; Thu, 26 Feb 2026 15:57:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id ABD9460133;
 Thu, 26 Feb 2026 15:57:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4DD4C116C6;
 Thu, 26 Feb 2026 15:57:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121465;
 bh=rqDfmaeFpGOy4VkjgclW6jgD7R3a4RjPLNoq+iXmqNo=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LJXC1eWLdW+kIB4X8lOCU/EpF3XTuwVxtrLXCs55vGYXVupOf+KL3L2L+q2tiYjvC
 3dGLmzfnqmFpcV6WdQ8flsofhG0yk/Ik+yDyh3yJXW3Qk7FCinqCXM2KZhprmvvGQX
 mW6pgwzsrU7f53HRrW+mVUBISH6yFB8lnMStsipd3ikUfRuZRo18wuPfpq9fHM9TUs
 jYMUVJ3A6AzeZbvc13rZQUg/EbK4wXwGUYq68MYtC0txZ9VD/ThnjQHWRlusrcGsPG
 pPNuzw0e6kfq5znVj9qg92Q7+uWLX7SJV6LESzdKLEB4B5mRzJnloIUHTU77bO2OSG
 A7M0GEkbB3c6g==
Date: Thu, 26 Feb 2026 10:55:09 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-7-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2384; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=rqDfmaeFpGOy4VkjgclW6jgD7R3a4RjPLNoq+iXmqNo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0FDtA0+C6/aacY18hSs3tG9QS+JeAuKU/CG
 0hy0qQFbZGJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtBQAKCRAADmhBGVaC
 FUa1D/9GH2hkiSXfB7S7SQT/ha26yA51x5dACbfc2/2SkZdxavqWkpUuU12zApAkI98BUxetYA6
 TKlfhePH3sHcJNb9e1bY5++qI8AYnq8cBEPpT1fjL+eq0Zg60ohLYQ/dYYlZ63rnf6w4nDgbgDR
 fi6djbGB6rucuL6hi1S6GFooDk83+cPQlNIgySQ3LsGKkJKgNpIxA8YN42QalTglkXfvCsZa5kU
 uwLRyfW1/1QaPVMp8In8X7YWWjBUEj/3FPxcG/4uU1sgUHwnJt7Vh0nAwqxILt2zmi7PteHywqL
 yMM9qfC6FspSrpezY51Vr9xdXdJ4A5IkdpoS0LqVYGDxPXhU6yDUhwuLEKuHTLgKzE/Jo7VGA1+
 hKsjlR6cY1FytpszplGuyCLO8onq+dEXwr1bi1jw+7DYQBzF8PzvEFfS2MszZxWFTLSNIcWRpH0
 H8onuTb1Iezgx7XYE5Os7wMBcGMtLNS7fUUOjnkRGIkr2+fuP3KprM/jFzIpnq4XrmWDaoK8LKc
 nyvQiFC2abPkmxQSNCUMCoxi/bAaLa6fJzGyd2s/df9Hex083Yc+mtVhXGVtc+zGF0RXZfrkHJ2
 tkl38FVieOkapgXsgzGNfycthwS+HXN5mBd/eoZOT6369g8471AQdUNZsgDTVduODC8xXx4yeJQ
 J1jwyINglHn6a8g==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Update format strings from %ld/%lu to %lld/%llu for i_ino,
 which is now a u64. Signed-off-by: Jeff Layton <jlayton@kernel.org> ---
 fs/lockd/svclock.c
 | 8 ++++---- fs/lockd/svcsubs.c | 2 +- 2 files changed, 5 insertions(+),
 5 deletions(-) 
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
X-Headers-End: 1vvdkN-0004tt-9A
Subject: [f2fs-dev] [PATCH 07/61] lockd: update format strings for u64 i_ino
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
X-Rspamd-Queue-Id: F1DA41A941F
X-Rspamd-Action: no action

Update format strings from %ld/%lu to %lld/%llu for i_ino, which is
now a u64.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/lockd/svclock.c | 8 ++++----
 fs/lockd/svcsubs.c | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/lockd/svclock.c b/fs/lockd/svclock.c
index 255a847ca0b6b9f7ab5a99c3aaa6856044ac0535..e29cbf8baf21a4ad61f4c55f7664e2063f0afcda 100644
--- a/fs/lockd/svclock.c
+++ b/fs/lockd/svclock.c
@@ -487,7 +487,7 @@ nlmsvc_lock(struct svc_rqst *rqstp, struct nlm_file *file,
 	int			async_block = 0;
 	__be32			ret;
 
-	dprintk("lockd: nlmsvc_lock(%s/%ld, ty=%d, pi=%d, %Ld-%Ld, bl=%d)\n",
+	dprintk("lockd: nlmsvc_lock(%s/%lld, ty=%d, pi=%d, %Ld-%Ld, bl=%d)\n",
 				inode->i_sb->s_id, inode->i_ino,
 				lock->fl.c.flc_type,
 				lock->fl.c.flc_pid,
@@ -617,7 +617,7 @@ nlmsvc_testlock(struct svc_rqst *rqstp, struct nlm_file *file,
 	int			mode;
 	__be32			ret;
 
-	dprintk("lockd: nlmsvc_testlock(%s/%ld, ty=%d, %Ld-%Ld)\n",
+	dprintk("lockd: nlmsvc_testlock(%s/%lld, ty=%d, %Ld-%Ld)\n",
 				nlmsvc_file_inode(file)->i_sb->s_id,
 				nlmsvc_file_inode(file)->i_ino,
 				lock->fl.c.flc_type,
@@ -676,7 +676,7 @@ nlmsvc_unlock(struct net *net, struct nlm_file *file, struct nlm_lock *lock)
 {
 	int	error = 0;
 
-	dprintk("lockd: nlmsvc_unlock(%s/%ld, pi=%d, %Ld-%Ld)\n",
+	dprintk("lockd: nlmsvc_unlock(%s/%lld, pi=%d, %Ld-%Ld)\n",
 				nlmsvc_file_inode(file)->i_sb->s_id,
 				nlmsvc_file_inode(file)->i_ino,
 				lock->fl.c.flc_pid,
@@ -716,7 +716,7 @@ nlmsvc_cancel_blocked(struct net *net, struct nlm_file *file, struct nlm_lock *l
 	int status = 0;
 	int mode;
 
-	dprintk("lockd: nlmsvc_cancel(%s/%ld, pi=%d, %Ld-%Ld)\n",
+	dprintk("lockd: nlmsvc_cancel(%s/%lld, pi=%d, %Ld-%Ld)\n",
 				nlmsvc_file_inode(file)->i_sb->s_id,
 				nlmsvc_file_inode(file)->i_ino,
 				lock->fl.c.flc_pid,
diff --git a/fs/lockd/svcsubs.c b/fs/lockd/svcsubs.c
index dd0214dcb69503006181a1533c440fc04a329d73..79f3dd2fd3666d835161a54a6b3d2b69e7741dd5 100644
--- a/fs/lockd/svcsubs.c
+++ b/fs/lockd/svcsubs.c
@@ -47,7 +47,7 @@ static inline void nlm_debug_print_file(char *msg, struct nlm_file *file)
 {
 	struct inode *inode = nlmsvc_file_inode(file);
 
-	dprintk("lockd: %s %s/%ld\n",
+	dprintk("lockd: %s %s/%llu\n",
 		msg, inode->i_sb->s_id, inode->i_ino);
 }
 #else

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
