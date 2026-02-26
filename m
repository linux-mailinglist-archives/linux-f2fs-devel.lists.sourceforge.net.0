Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mOIkH89toGkHjwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7121A9514
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 16:59:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9qkMKitTtryCLu92VcO8oxFNEg0TGcjeDqok5vIeB8=; b=H44Bygm2HveKNQENt9pC13e/+f
	nkY6lTlAZbMzyvlb41b7UuixZm/1Kaik8yCwawAIybcN0Jy6LmlllqYWuEZUXsbhENkQsrqGYYfv9
	6wXTbN4R8UKvvDV/8Elfwg3Vco8PXVN0av/U28f/eb72K3vOL52MQW9DDqw1VRkp7Y4U=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvdld-00020u-Md;
	Thu, 26 Feb 2026 15:59:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vvdlb-00020U-OJ;
 Thu, 26 Feb 2026 15:59:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tYvMnqYYGJrgx3nCuVQdb2rOZ0tIhWDeI0hsrrzbkW0=; b=XvJ0iY+EqPoWnR0cN89tFnOCOM
 KjxaXUpNwTNvkuMI24mER5KqfUhHSBMeQFkfcrlESTLXsSCF3gAYbuNUgXfqXEk1OTLN5SZsCy+pj
 MF0EVCx4LyOv9D76it1l448omPo7jo0/5z+JXPVkDh+qIWXWH9Blx9CbRAdndyjq9Boo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tYvMnqYYGJrgx3nCuVQdb2rOZ0tIhWDeI0hsrrzbkW0=; b=UG9B4KMuTi+Nf9VC7rXqShcsjj
 6A67mHHDZTNkUu99ZazSkvAKePf5R4f6ZBOOpjiUmgE1jZEJ5AQQ8zJN5dZ5fRBuTZ6NSDlrphprY
 jdtyoRg4hx8SlL07uRc8PhYwC1X/2oKna/H3pQYRNb+ilZZpTnfkhW+Mw6lolyW6qk3g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvdla-00050i-AH; Thu, 26 Feb 2026 15:59:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 067DF4458D;
 Thu, 26 Feb 2026 15:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7611EC2BCB1;
 Thu, 26 Feb 2026 15:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772121540;
 bh=L7XUWaooTPJJGvd9q6jSAUTNKJML0XZHotIv5n8H4j4=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=LDYCUhykrUdWv3Pvas2rdur0i6GL1s/gViKIjWTYOQk415nXtcRy1qub/d8XbSUUM
 D+/aIzVlWqyiVLePUBCzKm79lnQ1Xr/wPlu8hJz+p30Ci3TFMeSOk2X8J6c0Q6CD4P
 wqxpbdVNoiUFgiqF3pP6i9tkGZpZiFsHB2ZNh7AULTRNWpNsa6ywW5AUy1dN2Kcfe/
 Vx5kFsXJbZRj/SIYHdOcyOOJCt2ZrUoavPeoIuA6h1ix26kDvpcIxPd9hWIadzGtzi
 je2BpQkmmncKfavwQ3rkUY8N8k7blVwDs4zRekpa7E2wuHdmSCgnhha8D4eMzH/c5i
 ELYCW2P9Sj9NQ==
Date: Thu, 26 Feb 2026 10:55:15 -0500
MIME-Version: 1.0
Message-Id: <20260226-iino-u64-v1-13-ccceff366db9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2164; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=L7XUWaooTPJJGvd9q6jSAUTNKJML0XZHotIv5n8H4j4=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpoG0HunOlD0IWmS5NY8qKmprauVZ/+4AaY/kFb
 2frMDh17OOJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaBtBwAKCRAADmhBGVaC
 FWspD/9kh7G8p9Lzfl68UqO9nfBVJdbhEa18mWKyCpykfsHfHVCWcZlNY8T54jBx2zYSKQAm200
 1Z0WRIhfDjcGIOJIuO1X9JkMJk74ESENbCRK1QIf+n2vy9a5+cGUx1mEKpvq0E5TqwAXHAOoFC6
 3NSHGd431TY35kp8fNX9Pv8z2qXr/BrZtf64mNkWZ+/pgmbU4lwAMmANpFvRPRnZqDD4h55PgKa
 lRo93MwRT/GFVpdhyvySZu0ylZqlFqaKbT+XlbjplF26+5RjXAyunICxi6rDIPXVGD+aibZ7EPn
 dM3dAr+QTk+c4IRV6A1q2wP27vVBRHznWmq5Z7eCnNBGaaIG8v+XzuAkLBejSZi7qst5JE4qtvd
 CC2R1LYEW6s5Jgvz/eOxoK3G4Fr/Lbqcn2BVBH5846qvSmHY/tv+80Svxawf31ts+zo8j3TcCyA
 3Bb3UAA6oh6ycWf79FO6g6bY5UQpB1HNGB0wUIW7DiG2qplnSGUTlZQuhos0ulGYVhDfOziO0by
 eGvFmxwnDmQm47WJ3l6yO+WZ865DhG4wuBmhoMjmQ/e8qkfYmrpArIHr2WNzFK9Hl+9tCXAz3oN
 +BFn6v+B/UueV6kf5rFpJzAJiyu3TKMJH4KK2uGs1vnYofltFVpo96fk1iXzdofYRCPQa9M4uut
 SbvrPRHyi0Vl/Dw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  With i_ino now u64,
 CIFS/SMB can store the full 64-bit uniqueid
 in i_ino without the XOR-folding hack previously needed on 32-bit
 architectures.
 - Simplify cifs_uniqueid_to_ino_t() to return u64 directly - Update hash
 variable type in cifs_get_inode_info() - Update format strings from %lu to
 %llu Content analysis details:   (-0.2 points, 5.0 required)
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
X-Headers-End: 1vvdla-00050i-AH
Subject: [f2fs-dev] [PATCH 13/61] smb: store full 64-bit uniqueid in i_ino
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
X-Rspamd-Queue-Id: 0F7121A9514
X-Rspamd-Action: no action

With i_ino now u64, CIFS/SMB can store the full 64-bit uniqueid in
i_ino without the XOR-folding hack previously needed on 32-bit
architectures.

- Simplify cifs_uniqueid_to_ino_t() to return u64 directly
- Update hash variable type in cifs_get_inode_info()
- Update format strings from %lu to %llu

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/smb/client/cifsfs.h | 12 +++---------
 fs/smb/client/inode.c  |  4 ++--
 2 files changed, 5 insertions(+), 11 deletions(-)

diff --git a/fs/smb/client/cifsfs.h b/fs/smb/client/cifsfs.h
index e320d39b01f5eca8033cc516f6f1a2f07276676c..4a1f18022c711a7ff5b141d08ec6cac8483a6b6a 100644
--- a/fs/smb/client/cifsfs.h
+++ b/fs/smb/client/cifsfs.h
@@ -14,18 +14,12 @@
 #define ROOT_I 2
 
 /*
- * ino_t is 32-bits on 32-bit arch. We have to squash the 64-bit value down
- * so that it will fit. We use hash_64 to convert the value to 31 bits, and
- * then add 1, to ensure that we don't end up with a 0 as the value.
+ * With i_ino being u64, we can store the full 64-bit uniqueid directly.
  */
-static inline ino_t
+static inline u64
 cifs_uniqueid_to_ino_t(u64 fileid)
 {
-	if ((sizeof(ino_t)) < (sizeof(u64)))
-		return (ino_t)hash_64(fileid, (sizeof(ino_t) * 8) - 1) + 1;
-
-	return (ino_t)fileid;
-
+	return fileid;
 }
 
 static inline void cifs_set_time(struct dentry *dentry, unsigned long time)
diff --git a/fs/smb/client/inode.c b/fs/smb/client/inode.c
index d4d3cfeb6c90ee6dc71fcd9a8de31a1785cbb9ef..102e7615b658726551e9b01ba25065d1f0c505ac 100644
--- a/fs/smb/client/inode.c
+++ b/fs/smb/client/inode.c
@@ -1611,13 +1611,13 @@ inode_has_hashed_dentries(struct inode *inode)
 struct inode *
 cifs_iget(struct super_block *sb, struct cifs_fattr *fattr)
 {
-	unsigned long hash;
+	u64 hash;
 	struct inode *inode;
 
 retry_iget5_locked:
 	cifs_dbg(FYI, "looking for uniqueid=%llu\n", fattr->cf_uniqueid);
 
-	/* hash down to 32-bits on 32-bit arch */
+	/* With u64 i_ino, we can use the full uniqueid */
 	hash = cifs_uniqueid_to_ino_t(fattr->cf_uniqueid);
 
 	inode = iget5_locked(sb, hash, cifs_find_inode, cifs_init_inode, fattr);

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
