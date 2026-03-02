Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ACpwATXypWn6IAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:25:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0E21DF4AA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:25:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:MIME-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q/f0l02uu8y3GRsA55yk9/qwOaPHgPkR2L31Gl9yjXk=; b=SriiMygrdIuqkqz3DjhztZxXr2
	usBvdKuH/cZ3Ttw/bCegd2E6kOTqp1dkVweaJ5EC5R0x24mpMc48kK8YQQARSBCCPz/dpx9OaomQM
	1linxGWLkIPkV9LYoUgcPcY04Mh/9EXHn2Mh2olCDZE6q4Cp5EGTyywGTQjasczK7WYo=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx9pM-0003qo-3G;
	Mon, 02 Mar 2026 20:25:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vx9pJ-0003qZ-Tu;
 Mon, 02 Mar 2026 20:25:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-Id:Date:Subject:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mXh6rRb96LlNMtZtYzggQvLzGUmAXVnrsMQP585tqh0=; b=KiBDrXERUkGqaeepA1g4qpSo+x
 wDMUchlcvGNSdnABwx7SqqZeo9Z6PLtIrlq90kovw0gPPPBpzlN2f5+Vjlfk45d/PQcAPSY7gRi96
 MHFm47rLRbBpo9Xgw6Cqx7UREK1ARHBEtiGTcpyzrKlnfbD2Ox4qRri/LSpQLuWzf0lM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date
 :Subject:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mXh6rRb96LlNMtZtYzggQvLzGUmAXVnrsMQP585tqh0=; b=k
 t60rTUOu01hDIJxAr9t3lofNTE7PU9OZaBEm99rdmtSy1iUX4LJniiNkroWVnK04Opz/EuNcgFqCx
 tEWoOgyYA/CAy+9Zqqs0qfcTs2ZeaEuBZT/7ZZTxpo9ZystaJKIbeMrLJ0x+ifh9xjUeoxsu/ybHQ
 hMGFFs3R5kakks4o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx9pI-0004TY-HR; Mon, 02 Mar 2026 20:25:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1895E60128;
 Mon,  2 Mar 2026 20:25:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A61DC19423;
 Mon,  2 Mar 2026 20:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483100;
 bh=QDxKqN1aWhMFnYUc1odbHS9kXFhMLp/XyZDDA7haX3M=;
 h=From:Subject:Date:To:Cc:From;
 b=cHu2iKyXY4agdCXmzBTDMnWRsTQUGp5Gktu5PjqkGlbWkkoAeX16dS9tdaoGxdknl
 ECREpq3HSxntlz7lhfo6y0K+ACEDdjWeefDfqI25+p8tgIE+KlvY0ocOG/250z/NUd
 783P3OQ4WB9AiB5sPNyVimRd3CmDJpBirkTO5nNcE9FkcLBQJiHm047n9ry/lUhLmZ
 8VfN/gCFGYQfg/9Cc+9XjaAznMYlk0Xk8nFQRiG0XjLVZINPKn4esjjGtcPyeRU2m+
 5a/4N3NEqGX5mpRhsogEqjxcpHCl5Sx94CTDwccdE2qLMWHuWwvhIzAKGfzA+kRTXF
 4qC+K6ZAZTEXA==
Date: Mon, 02 Mar 2026 15:23:44 -0500
Message-Id: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/0XMQQrCMBCF4auUWRtJ0xjRlfeQLtJ00g5KUiYal
 JK7Gwvi8n88vhUSMmGCc7MCY6ZEMdRQuwbcbMOEgsbaoKQyUiktiEIUT6PFoLXt7FEddOeg3hd
 GT6+Nuva1Z0qPyO9Nzu13/SHmj+RWSOGcQ+87Y8bhdLkhB7zvI0/Ql1I+4af1EaEAAAA=
X-Change-ID: 20260224-iino-u64-b44a3a72543c
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
 Martin Schiller <ms@dev.tdt.de>, Eric Paris <eparis@redhat.com>, 
 Joerg Reuter <jreuter@yaina.de>, Marcel Holtmann <marcel@holtmann.org>, 
 Johan Hedberg <johan.hedberg@gmail.com>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, David Ahern <dsahern@kernel.org>, 
 Neal Cardwell <ncardwell@google.com>, 
 Steffen Klassert <steffen.klassert@secunet.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Remi Denis-Courmont <courmisch@gmail.com>, 
 Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>, 
 Xin Long <lucien.xin@gmail.com>, 
 Magnus Karlsson <magnus.karlsson@intel.com>, 
 Maciej Fijalkowski <maciej.fijalkowski@intel.com>, 
 Stanislav Fomichev <sdf@fomichev.me>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, 
 Jesper Dangaard Brouer <hawk@kernel.org>, 
 John Fastabend <john.fastabend@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=20524; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=QDxKqN1aWhMFnYUc1odbHS9kXFhMLp/XyZDDA7haX3M=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfHvd6Xa5qPNp/iwSU34NwgPJFsY1EsbhO8Tb
 Jb0JQrC5vyJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx7wAKCRAADmhBGVaC
 FTEqEAC8R2eMoxAYPwc4rs0SZobO+TNnW2+wshdq+W5N+hB6SQHLM7D8eeK7DbkPGmwlkqmar1o
 MldSWfu0J48lOe+l2K8jhVHfsKXIwkBqFiWnz12nS7A88+2+RSFKcvwyGakxgC+q2KYigkxYuej
 FXLd/Lea5TS/2oWmUcOdQxWQn8tWGthL2xgN4TyQOzOmIhSk7eaf0qcaVRGhLv0cZfljRVlLs1A
 VuPWTsMaBTwkSM+kCDDg+FqP5m2qJTarTVChSYBDbCf2Th0vi2Flf8kid2djnAh31USP0ENvf8f
 1L5WjfZJAbsTaRy0atgpFu/6/1xXVVBOGKN41KQHdjAEdBaH7wxtUa4StjjCHPgS7072hRNMepQ
 5ZxVVkcEMbVO4fVkWJ/HGi+kKu7V2TnTvzxpuX51SGIecEGOXMG27WpQmEUBbUUt5e2nIeZlYoQ
 Xh2l+VCVvGZSO2GOoPjJYMWzpdQOz0m/SsJNKKD5I3W6abQyRZ3Bq1NcV0x9qFOTP3zgsoFHZ8D
 Q6uXGkJY/tM88Nf3ZoqNd0MuAdXY4RMkLIvw/3ctvzbnsxqpsZIxB6KGyA5RoXwI9YSOcazwOx5
 ExH9GL2ezwbsZqa+JBc7f4pB7IWs7vik2BzUiXCw8tTGMoXJii2hN6IbaaHRoU082J50be/PP6U
 OLmKwAFXV8nvtSg==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This version splits the change up to be more bisectable. It
 first adds a new kino_t typedef and a new "PRIino" macro to hold the width
 specifier for format strings. The conversion is done, and then ev [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vx9pI-0004TY-HR
Subject: [f2fs-dev] [PATCH v2 000/110] vfs: change inode->i_ino from
 unsigned long to u64
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
 linux-unionfs@vger.kernel.org, linux-mm@kvack.org, linux-sctp@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-afs@lists.infradead.org,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-x25@vger.kernel.org, linux-bluetooth@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, codalist@coda.cs.cmu.edu,
 linux-ext4@vger.kernel.org, bpf@vger.kernel.org, devel@lists.orangefs.org,
 linux-trace-kernel@vger.kernel.org, ecryptfs@vger.kernel.org,
 selinux@vger.kernel.org, autofs@vger.kernel.org, apparmor@lists.ubuntu.com,
 linux-media@vger.kernel.org, linux-can@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, ocfs2-devel@lists.linux.dev,
 linux-fscrypt@vger.kernel.org, linux-hams@vger.kernel.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 fsverity@lists.linux.dev, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 v9fs@lists.linux.dev, samba-technical@lists.samba.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 netfs@lists.linux.dev, linux-integrity@vger.kernel.org, ntfs3@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: EB0E21DF4AA
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[172];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[jlayton@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

This version splits the change up to be more bisectable. It first adds a
new kino_t typedef and a new "PRIino" macro to hold the width specifier
for format strings. The conversion is done, and then everything is
changed to remove the new macro and typedef.

I also missed a few places in the earlier set. This one hopefully does a
bit more thorough job.

My thanks and apologies to everyone who sent R-b/A-b for the v1 series.
v2 breaks a lot of the changes up into two patches so many of those
didn't carry over.  Please resend those if you're still OK with it.

The entire pile is in the "iino-u64" branch of my tree, if anyone is
interested in testing this:

    https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/

Original cover letter follows:

----------------------8<-----------------------

Christian said [1] to "just do it" when I proposed this, so here we are!

For historical reasons, the inode->i_ino field is an unsigned long,
which means that it's 32 bits on 32 bit architectures. This has caused a
number of filesystems to implement hacks to hash a 64-bit identifier
into a 32-bit field, and deprives us of a universal identifier field for
an inode.

This patchset changes the inode->i_ino field from an unsigned long to a
u64. This shouldn't make any material difference on 64-bit hosts, but
32-bit hosts will see struct inode grow by at least 4 bytes. This could
have effects on slabcache sizes and field alignment.

The bulk of the changes are to format strings and tracepoints, since the
kernel itself doesn't care that much about the i_ino field. The first
patch changes some vfs function arguments, so check that one out
carefully.

With this change, we may be able to shrink some inode structures. For
instance, struct nfs_inode has a fileid field that holds the 64-bit
inode number. With this set of changes, that field could be eliminated.
I'd rather leave that sort of cleanups for later just to keep this
simple.

Much of this set was generated by LLM, but I attributed it to myself
since I consider this to be in the "menial tasks" category of LLM usage.

[1]: https://lore.kernel.org/linux-fsdevel/20260219-portrait-winkt-959070cee42f@brauner/

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Changes in v2:
- Use a typedef and macro and do the change in two steps to make it cleanly bisectable
- Fix check_for_busy_inodes() in fscrypt
- Added patch to reorganize tracepoint structs for better packing
- Added patch to change sock.sk_ino to u64
- Added patch to clean up internal handling of inode numbers in audit subsystem
- Drop some unnecessary casts
- Link to v1: https://lore.kernel.org/r/20260226-iino-u64-v1-0-ccceff366db9@kernel.org

---
Jeff Layton (110):
      vfs: introduce kino_t typedef and PRIino format macro
      vfs: widen inode hash/lookup functions to u64
      audit: widen ino fields to u64
      net: change sock.sk_ino and sock_i_ino() to u64
      trace: store i_ino as u64 instead of ino_t/unsigned long
      trace: reorder TP_STRUCT__entry fields for better packing on 32-bit
      ext4: use PRIino format for i_ino
      jbd2: use PRIino format for i_ino
      f2fs: use PRIino format for i_ino
      lockd: use PRIino format for i_ino
      nfs: use PRIino format for i_ino
      nfsd: use PRIino format for i_ino
      locks: use PRIino format for i_ino
      proc: use PRIino format for i_ino
      nilfs2: use PRIino format for i_ino
      9p: use PRIino format for i_ino
      affs: use PRIino format for i_ino
      afs: use PRIino format for i_ino
      autofs: use PRIino format for i_ino
      befs: use PRIino format for i_ino
      bfs: use PRIino format for i_ino
      cachefiles: use PRIino format for i_ino
      ceph: use PRIino format for i_ino
      coda: use PRIino format for i_ino
      cramfs: use PRIino format for i_ino
      ecryptfs: use PRIino format for i_ino
      efs: use PRIino format for i_ino
      exportfs: use PRIino format for i_ino
      ext2: use PRIino format for i_ino
      freevxfs: use PRIino format for i_ino
      hfs: use PRIino format for i_ino
      hfsplus: use PRIino format for i_ino
      hpfs: use PRIino format for i_ino
      isofs: use PRIino format for i_ino
      jffs2: use PRIino format for i_ino
      jfs: use PRIino format for i_ino
      minix: use PRIino format for i_ino
      nsfs: use PRIino format for i_ino
      ntfs3: use PRIino format for i_ino
      ocfs2: use PRIino format for i_ino
      orangefs: use PRIino format for i_ino
      overlayfs: use PRIino format for i_ino
      qnx4: use PRIino format for i_ino
      qnx6: use PRIino format for i_ino
      ubifs: use PRIino format for i_ino
      udf: use PRIino format for i_ino
      ufs: use PRIino format for i_ino
      zonefs: use PRIino format for i_ino
      security: use PRIino format for i_ino
      drm/amdgpu: use PRIino format for i_ino
      fsnotify: use PRIino format for i_ino
      net: use PRIino format for i_ino
      uprobes: use PRIino format for i_ino
      dma-buf: use PRIino format for i_ino
      fscrypt: use PRIino format for i_ino
      fsverity: use PRIino format for i_ino
      iomap: use PRIino format for i_ino
      net: use PRIino format for i_ino
      vfs: use PRIino format for i_ino
      vfs: change kino_t from unsigned long to u64
      ext4: replace PRIino with %llu/%llx format strings
      jbd2: replace PRIino with %llu/%llx format strings
      f2fs: replace PRIino with %llu/%llx format strings
      lockd: replace PRIino with %llu/%llx format strings
      nfs: replace PRIino with %llu/%llx format strings
      nfsd: replace PRIino with %llu/%llx format strings
      proc: replace PRIino with %llu/%llx format strings
      nilfs2: replace PRIino with %llu/%llx format strings
      9p: replace PRIino with %llu/%llx format strings
      affs: replace PRIino with %llu/%llx format strings
      afs: replace PRIino with %llu/%llx format strings
      autofs: replace PRIino with %llu/%llx format strings
      befs: replace PRIino with %llu/%llx format strings
      bfs: replace PRIino with %llu/%llx format strings
      cachefiles: replace PRIino with %llu/%llx format strings
      ceph: replace PRIino with %llu/%llx format strings
      coda: replace PRIino with %llu/%llx format strings
      cramfs: replace PRIino with %llu/%llx format strings
      ecryptfs: replace PRIino with %llu/%llx format strings
      efs: replace PRIino with %llu/%llx format strings
      exportfs: replace PRIino with %llu/%llx format strings
      ext2: replace PRIino with %llu/%llx format strings
      freevxfs: replace PRIino with %llu/%llx format strings
      hfs: replace PRIino with %llu/%llx format strings
      hfsplus: replace PRIino with %llu/%llx format strings
      hpfs: replace PRIino with %llu/%llx format strings
      isofs: replace PRIino with %llu/%llx format strings
      jffs2: replace PRIino with %llu/%llx format strings
      jfs: replace PRIino with %llu/%llx format strings
      minix: replace PRIino with %llu/%llx format strings
      ntfs3: replace PRIino with %llu/%llx format strings
      ocfs2: replace PRIino with %llu/%llx format strings
      orangefs: replace PRIino with %llu/%llx format strings
      overlayfs: replace PRIino with %llu/%llx format strings
      qnx4: replace PRIino with %llu/%llx format strings
      qnx6: replace PRIino with %llu/%llx format strings
      ubifs: replace PRIino with %llu/%llx format strings
      udf: replace PRIino with %llu/%llx format strings
      ufs: replace PRIino with %llu/%llx format strings
      zonefs: replace PRIino with %llu/%llx format strings
      fscrypt: replace PRIino with %llu/%llx format strings
      fsverity: replace PRIino with %llu/%llx format strings
      iomap: replace PRIino with %llu/%llx format strings
      fsnotify: replace PRIino with %llu/%llx format strings
      security: replace PRIino with %llu/%llx format strings
      drm/amdgpu: replace PRIino with %llu/%llx format strings
      dma-buf: replace PRIino with %llu/%llx format strings
      net: replace PRIino with %llu/%llx format strings
      uprobes: replace PRIino with %llu/%llx format strings
      vfs: remove kino_t typedef and PRIino format macro

 drivers/dma-buf/dma-buf.c                  |   2 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |   4 +-
 fs/9p/vfs_addr.c                           |   4 +-
 fs/9p/vfs_inode.c                          |   6 +-
 fs/9p/vfs_inode_dotl.c                     |   6 +-
 fs/affs/amigaffs.c                         |   8 +-
 fs/affs/bitmap.c                           |   2 +-
 fs/affs/dir.c                              |   2 +-
 fs/affs/file.c                             |  20 +-
 fs/affs/inode.c                            |  12 +-
 fs/affs/namei.c                            |  14 +-
 fs/affs/symlink.c                          |   2 +-
 fs/afs/dir.c                               |  10 +-
 fs/afs/dir_search.c                        |   2 +-
 fs/afs/dynroot.c                           |   2 +-
 fs/afs/inode.c                             |   2 +-
 fs/autofs/inode.c                          |   2 +-
 fs/befs/linuxvfs.c                         |  28 +-
 fs/bfs/dir.c                               |   4 +-
 fs/cachefiles/io.c                         |   6 +-
 fs/cachefiles/namei.c                      |  12 +-
 fs/cachefiles/xattr.c                      |   2 +-
 fs/ceph/crypto.c                           |   4 +-
 fs/coda/dir.c                              |   2 +-
 fs/coda/inode.c                            |   2 +-
 fs/cramfs/inode.c                          |   2 +-
 fs/crypto/crypto.c                         |   2 +-
 fs/crypto/hooks.c                          |   2 +-
 fs/crypto/keyring.c                        |   4 +-
 fs/crypto/keysetup.c                       |   2 +-
 fs/dcache.c                                |   4 +-
 fs/ecryptfs/crypto.c                       |   6 +-
 fs/ecryptfs/file.c                         |   2 +-
 fs/efs/inode.c                             |   6 +-
 fs/eventpoll.c                             |   2 +-
 fs/exportfs/expfs.c                        |   4 +-
 fs/ext2/dir.c                              |  10 +-
 fs/ext2/ialloc.c                           |   9 +-
 fs/ext2/inode.c                            |   2 +-
 fs/ext2/trace.h                            |   8 +-
 fs/ext2/xattr.c                            |  14 +-
 fs/ext4/dir.c                              |   2 +-
 fs/ext4/ext4.h                             |   4 +-
 fs/ext4/extents.c                          |   8 +-
 fs/ext4/extents_status.c                   |  28 +-
 fs/ext4/fast_commit.c                      |   8 +-
 fs/ext4/ialloc.c                           |  10 +-
 fs/ext4/indirect.c                         |   2 +-
 fs/ext4/inline.c                           |  14 +-
 fs/ext4/inode.c                            |  22 +-
 fs/ext4/ioctl.c                            |   4 +-
 fs/ext4/mballoc.c                          |   6 +-
 fs/ext4/migrate.c                          |   2 +-
 fs/ext4/move_extent.c                      |  20 +-
 fs/ext4/namei.c                            |  10 +-
 fs/ext4/orphan.c                           |  16 +-
 fs/ext4/page-io.c                          |  10 +-
 fs/ext4/super.c                            |  22 +-
 fs/ext4/xattr.c                            |  10 +-
 fs/f2fs/compress.c                         |   4 +-
 fs/f2fs/dir.c                              |   2 +-
 fs/f2fs/extent_cache.c                     |   8 +-
 fs/f2fs/f2fs.h                             |   6 +-
 fs/f2fs/file.c                             |  12 +-
 fs/f2fs/gc.c                               |   2 +-
 fs/f2fs/inline.c                           |   4 +-
 fs/f2fs/inode.c                            |  48 ++--
 fs/f2fs/namei.c                            |   8 +-
 fs/f2fs/node.c                             |  12 +-
 fs/f2fs/recovery.c                         |  10 +-
 fs/f2fs/xattr.c                            |  10 +-
 fs/freevxfs/vxfs_bmap.c                    |   4 +-
 fs/fserror.c                               |   2 +-
 fs/hfs/catalog.c                           |   2 +-
 fs/hfs/extent.c                            |   4 +-
 fs/hfs/inode.c                             |   4 +-
 fs/hfsplus/attributes.c                    |  10 +-
 fs/hfsplus/catalog.c                       |   2 +-
 fs/hfsplus/dir.c                           |   6 +-
 fs/hfsplus/extents.c                       |   6 +-
 fs/hfsplus/inode.c                         |   8 +-
 fs/hfsplus/super.c                         |   6 +-
 fs/hfsplus/xattr.c                         |  10 +-
 fs/hpfs/dir.c                              |   4 +-
 fs/hpfs/dnode.c                            |   4 +-
 fs/hpfs/ea.c                               |   4 +-
 fs/hpfs/inode.c                            |   4 +-
 fs/inode.c                                 |  49 ++--
 fs/iomap/ioend.c                           |   2 +-
 fs/iomap/trace.h                           |   8 +-
 fs/isofs/compress.c                        |   2 +-
 fs/isofs/dir.c                             |   2 +-
 fs/isofs/inode.c                           |   6 +-
 fs/isofs/namei.c                           |   2 +-
 fs/jbd2/journal.c                          |   4 +-
 fs/jbd2/transaction.c                      |   2 +-
 fs/jffs2/dir.c                             |   4 +-
 fs/jffs2/file.c                            |   4 +-
 fs/jffs2/fs.c                              |  18 +-
 fs/jfs/inode.c                             |   2 +-
 fs/jfs/jfs_imap.c                          |   2 +-
 fs/jfs/jfs_metapage.c                      |   2 +-
 fs/lockd/svclock.c                         |   8 +-
 fs/lockd/svcsubs.c                         |   2 +-
 fs/locks.c                                 |   6 +-
 fs/minix/inode.c                           |  10 +-
 fs/nfs/dir.c                               |  20 +-
 fs/nfs/file.c                              |   8 +-
 fs/nfs/filelayout/filelayout.c             |   8 +-
 fs/nfs/flexfilelayout/flexfilelayout.c     |   8 +-
 fs/nfs/inode.c                             |   6 +-
 fs/nfs/nfs4proc.c                          |   4 +-
 fs/nfs/pnfs.c                              |  12 +-
 fs/nfsd/export.c                           |   2 +-
 fs/nfsd/nfs4state.c                        |   4 +-
 fs/nfsd/nfsfh.c                            |   4 +-
 fs/nfsd/vfs.c                              |   2 +-
 fs/nilfs2/alloc.c                          |  10 +-
 fs/nilfs2/bmap.c                           |   2 +-
 fs/nilfs2/btnode.c                         |   2 +-
 fs/nilfs2/btree.c                          |  12 +-
 fs/nilfs2/dir.c                            |  12 +-
 fs/nilfs2/direct.c                         |   4 +-
 fs/nilfs2/gcinode.c                        |   2 +-
 fs/nilfs2/inode.c                          |   8 +-
 fs/nilfs2/mdt.c                            |   2 +-
 fs/nilfs2/namei.c                          |   2 +-
 fs/nilfs2/segment.c                        |   2 +-
 fs/notify/fdinfo.c                         |   4 +-
 fs/nsfs.c                                  |   4 +-
 fs/ntfs3/super.c                           |   2 +-
 fs/ocfs2/alloc.c                           |   2 +-
 fs/ocfs2/aops.c                            |   4 +-
 fs/ocfs2/dir.c                             |   8 +-
 fs/ocfs2/dlmfs/dlmfs.c                     |  10 +-
 fs/ocfs2/extent_map.c                      |  12 +-
 fs/ocfs2/inode.c                           |   2 +-
 fs/ocfs2/quota_local.c                     |   2 +-
 fs/ocfs2/refcounttree.c                    |  10 +-
 fs/ocfs2/xattr.c                           |   4 +-
 fs/orangefs/inode.c                        |   2 +-
 fs/overlayfs/export.c                      |   2 +-
 fs/overlayfs/namei.c                       |   4 +-
 fs/overlayfs/util.c                        |   2 +-
 fs/pipe.c                                  |   2 +-
 fs/proc/fd.c                               |   2 +-
 fs/proc/task_mmu.c                         |   4 +-
 fs/qnx4/inode.c                            |   4 +-
 fs/qnx6/inode.c                            |   2 +-
 fs/ubifs/debug.c                           |   8 +-
 fs/ubifs/dir.c                             |  28 +-
 fs/ubifs/file.c                            |  28 +-
 fs/ubifs/journal.c                         |   6 +-
 fs/ubifs/super.c                           |  16 +-
 fs/ubifs/tnc.c                             |   4 +-
 fs/ubifs/xattr.c                           |  14 +-
 fs/udf/directory.c                         |  18 +-
 fs/udf/file.c                              |   2 +-
 fs/udf/inode.c                             |  12 +-
 fs/udf/namei.c                             |   8 +-
 fs/udf/super.c                             |   2 +-
 fs/ufs/balloc.c                            |   6 +-
 fs/ufs/dir.c                               |  10 +-
 fs/ufs/ialloc.c                            |   6 +-
 fs/ufs/inode.c                             |  18 +-
 fs/ufs/ufs_fs.h                            |   6 +-
 fs/ufs/util.c                              |   2 +-
 fs/verity/init.c                           |   2 +-
 fs/zonefs/super.c                          |   8 +-
 fs/zonefs/trace.h                          |  18 +-
 include/linux/audit.h                      |   2 +-
 include/linux/fs.h                         |  28 +-
 include/net/sock.h                         |   4 +-
 include/trace/events/cachefiles.h          |  18 +-
 include/trace/events/ext4.h                | 423 +++++++++++++++--------------
 include/trace/events/f2fs.h                | 172 ++++++------
 include/trace/events/filelock.h            |  34 +--
 include/trace/events/filemap.h             |  20 +-
 include/trace/events/fs_dax.h              |  20 +-
 include/trace/events/fsverity.h            |  30 +-
 include/trace/events/hugetlbfs.h           |  42 +--
 include/trace/events/netfs.h               |   8 +-
 include/trace/events/nilfs2.h              |  12 +-
 include/trace/events/readahead.h           |  18 +-
 include/trace/events/timestamp.h           |  16 +-
 include/trace/events/writeback.h           | 162 +++++------
 kernel/audit.h                             |   9 +-
 kernel/audit_fsnotify.c                    |   4 +-
 kernel/audit_watch.c                       |   8 +-
 kernel/auditsc.c                           |   2 +-
 kernel/events/uprobes.c                    |   4 +-
 net/ax25/af_ax25.c                         |   2 +-
 net/bluetooth/af_bluetooth.c               |   4 +-
 net/can/bcm.c                              |   2 +-
 net/ipv4/ping.c                            |   2 +-
 net/ipv4/raw.c                             |   2 +-
 net/ipv4/tcp_ipv4.c                        |   2 +-
 net/ipv4/udp.c                             |   2 +-
 net/ipv6/datagram.c                        |   2 +-
 net/ipv6/tcp_ipv6.c                        |   2 +-
 net/key/af_key.c                           |   2 +-
 net/netlink/af_netlink.c                   |   2 +-
 net/netlink/diag.c                         |   2 +-
 net/netrom/af_netrom.c                     |   4 +-
 net/packet/af_packet.c                     |   2 +-
 net/packet/diag.c                          |   2 +-
 net/phonet/socket.c                        |   4 +-
 net/rose/af_rose.c                         |   4 +-
 net/sctp/proc.c                            |   4 +-
 net/socket.c                               |   2 +-
 net/unix/af_unix.c                         |   2 +-
 net/unix/diag.c                            |   6 +-
 net/x25/x25_proc.c                         |   4 +-
 net/xdp/xsk_diag.c                         |   2 +-
 security/apparmor/apparmorfs.c             |   4 +-
 security/integrity/integrity_audit.c       |   2 +-
 security/ipe/audit.c                       |   2 +-
 security/lsm_audit.c                       |  10 +-
 security/selinux/hooks.c                   |  10 +-
 security/smack/smack_lsm.c                 |  12 +-
 220 files changed, 1181 insertions(+), 1181 deletions(-)
---
base-commit: 842cfe0733c5a03982a7ae496de6fdc0dd661a41
change-id: 20260224-iino-u64-b44a3a72543c

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
