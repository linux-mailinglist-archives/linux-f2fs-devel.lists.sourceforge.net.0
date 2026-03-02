Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OK6VFWr1pWkxIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:39:06 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 831721E00A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:39:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bU1OU/EUhmF4nWuQelRjRe35tD/R0uHdm826OBGCC+Y=; b=ay5ib215bMtB9p4PPUrK2gKj0U
	78MA0FcDwniTMLNpATwq1NGiky+Mb5rt/8GOI0T+8aB3rkagF8umYdzGMEP3pHaMhxtoF0/8hMP+k
	FHMJPgQ91FJKDXFLg/8QE1QbwyTw7OD1trxfx3hWHJipYZ/v0Wkx4o5ejhM542qGas4Y=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA2h-00039K-0N;
	Mon, 02 Mar 2026 20:39:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA2e-00038r-Ia;
 Mon, 02 Mar 2026 20:39:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YAq58+KAK9+s0j9E9XgQ6Gq6nZuHLh7Fj3B5ZV9Ehvo=; b=kiZlejhfZQhAAevIpsXeWH5UDf
 kApLpMGzK31cFOmGglmPUgJdfcstH/BwecJpUEJ6ttHYDpeMhMoawXeWyFBfuF/gzaSxn6wYb67r7
 Nn1s2ZB2sAILjqxf2Jzm4WsFnq4ZzZIjq0EHaIwwUCc7QEZGcmEgYZXi3WmbIblhLdJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YAq58+KAK9+s0j9E9XgQ6Gq6nZuHLh7Fj3B5ZV9Ehvo=; b=grRudFEujxacq5pqL+VSscx/T4
 tJOV9r8Qy7l0Sk6d7VNBlaqBh3a3XjMSZZioyJsgaffyfhJ+pN5/xPhsLeDKfjW5m3FwLqhxl3ubN
 Af3oP1QbUsth0Fz6wzoOS7mfx6c8UoJdGWuKBxWDnMVR0zs1z/1l7PyqzNQIid7Ts0Os=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA2d-0005xc-Rq; Mon, 02 Mar 2026 20:39:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 8460C44238;
 Mon,  2 Mar 2026 20:38:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 475B2C19425;
 Mon,  2 Mar 2026 20:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483934;
 bh=EkVY4OzCxoV1B6JjTU1CxpHxdOMuJb7GCMDpICOoKnM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=cw6fYKRxkA/2qSg00XWLZ3vREeGKcKpXCr2z3otf7bkXJULLwvJXZFBTr8QeEXtnl
 O3cBxE5aiqKSM1aXOiGIip6+rT4A0MrUQH9aqQU83yhz8xx/h9TGq8qEhmouP0c+Aj
 /6PXUjtDxSwGSliUzbksOagSQR4xwcd/yRfOL2tsDICH2gl+uLTlfAbxk5gSrdPWHv
 xw/4aJ3ejktiyiV+amJL/6JM1R2kuUkhC7Yjo7k09FiJfXJg5p5pScgxdBJr7BV8uO
 5575ABTf8Qasm1xofy9cIyMwaj8Va59trON8+cvaXZLEJLXGYR/KR9qJUlavo5ClzX
 fXp6LnsikOCag==
Date: Mon, 02 Mar 2026 15:24:42 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-58-e5388800dae0@kernel.org>
References: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
In-Reply-To: <20260302-iino-u64-v2-0-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3590; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=EkVY4OzCxoV1B6JjTU1CxpHxdOMuJb7GCMDpICOoKnM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH+Mnc8nVtv6Lm/omX/kUloGe5xdlARw0dWD
 Dkf72ua1PiJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx/gAKCRAADmhBGVaC
 FV7ND/9cbF3xOXUXzNKgQSMwCY/Z6EDC24GChRkdNAAl2jLMVrNdA7SH+rUX8wS/Xb+ecl0XjLI
 HFbdQ8UNLvQUahhf1pRfQXjDDizfsBxDz0duLiApUFVBwsiAaoWrQYbIHfWhlzdAJepp/UtQJ/D
 GIQwokNyeDXWkaggAVnPkm2d3COjH83H2J8ccxPeLu9l9zDOBvWyDLkGlOjkscwb/iR7xJr2fXc
 0CEWI9jtoEP3GEivF0SjoIc5i2h3SQEBoAYj0t8+IcbpZ90X/s/MK2k+HwpUCjvSFSNbI5BV8Tg
 3Ouof1vHdnLHBn+12oiFIs1tadfwHNStEOM7OcrKXaXrJXXLUmXy74caMCsgJ2gnR7wgeRtE/Vk
 JwqHwo3E8d5x8cbXVL+202F3p5BdjJ2kOorBQTzRHYE5ivZlttgpSL4sgvE4Gm+JK2ID7EWPdh+
 pFWKqlh0cEgynItMvOkQ5UpsXIW4ApzelXba3f60fUeLkuqQnB+ub2aeVlMhM9ohXSul6YNT6v6
 xJt3BmT7UVPe3ytZX6eKnsmRaA32wHZD71biGWWoWDE/2JSKC0IHCVBEi2BWWvHErfhWEARE7uC
 cx+k76sD2N1X1CWyiiJjpWD04bpl8Jzg6bd+yv+OkmZkJk38rrUw8X5C0qzK+ZUYfxWKya/Ufq2
 ER0lcckWB4Db/Aw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert i_ino format strings in x25, netrom, and rose /proc
 output to use the PRIino format macro. Also correct the format specifiers
 from signed (%ld) to unsigned, and change 0L fallback literals to [...] 
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
X-Headers-End: 1vxA2d-0005xc-Rq
Subject: [f2fs-dev] [PATCH v2 058/110] net: use PRIino format for i_ino
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
X-Rspamd-Queue-Id: 831721E00A1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[zeniv.linux.org.uk,kernel.org,suse.cz,goodmis.org,efficios.com,intel.com,infradead.org,mit.edu,linux.dev,suse.de,redhat.com,manguebit.org,dilger.ca,suse.com,oracle.com,brown.name,talpey.com,samba.org,gmail.com,microsoft.com,dubeyko.com,ionkov.net,codewreck.org,crudebyte.com,auristor.com,themaw.net,cs.cmu.edu,fluxnic.net,tyhicks.com,physik.fu-berlin.de,vivo.com,artax.karlin.mff.cuni.cz,nod.at,paragon-software.com,fasheh.com,evilplan.org,linux.alibaba.com,omnibond.com,szeredi.hu,alarsen.net,huawei.com,wdc.com,canonical.com,paul-moore.com,namei.org,hallyn.com,linux.ibm.com,schaufler-ca.com,amd.com,ffwll.ch,linaro.org,google.com,davemloft.net,arm.com,linux.intel.com,dev.tdt.de,yaina.de,holtmann.org,hartkopp.net,pengutronix.de,secunet.com,gondor.apana.org.au,fomichev.me,iogearbox.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[172];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jlayton@kernel.org]
X-Rspamd-Action: no action

Convert i_ino format strings in x25, netrom, and rose /proc output to
use the PRIino format macro. Also correct the format specifiers from
signed (%ld) to unsigned, and change 0L fallback literals to (kino_t)0,
since inode numbers are unsigned. Update the local ino variable type
from unsigned long to kino_t.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 net/netrom/af_netrom.c | 4 ++--
 net/rose/af_rose.c     | 4 ++--
 net/x25/x25_proc.c     | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/net/netrom/af_netrom.c b/net/netrom/af_netrom.c
index b816c56124ab8b7e59689e612d36007bb11aacaa..883c8aa90235d746a688c5f38b812c20faa7c770 100644
--- a/net/netrom/af_netrom.c
+++ b/net/netrom/af_netrom.c
@@ -1305,7 +1305,7 @@ static int nr_info_show(struct seq_file *seq, void *v)
 		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->user_addr));
 		seq_printf(seq, "%-9s ", ax2asc(buf, &nr->dest_addr));
 		seq_printf(seq,
-"%-9s %-3s  %02X/%02X %02X/%02X %2d %3d %3d %3d %3lu/%03lu %2lu/%02lu %3lu/%03lu %3lu/%03lu %2d/%02d %3d %5d %5d %ld\n",
+"%-9s %-3s  %02X/%02X %02X/%02X %2d %3d %3d %3d %3lu/%03lu %2lu/%02lu %3lu/%03lu %3lu/%03lu %2d/%02d %3d %5d %5d %" PRIino "u\n",
 			ax2asc(buf, &nr->source_addr),
 			devname,
 			nr->my_index,
@@ -1329,7 +1329,7 @@ static int nr_info_show(struct seq_file *seq, void *v)
 			nr->window,
 			sk_wmem_alloc_get(s),
 			sk_rmem_alloc_get(s),
-			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0L);
+			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : (kino_t)0);
 
 		bh_unlock_sock(s);
 	}
diff --git a/net/rose/af_rose.c b/net/rose/af_rose.c
index 841d62481048def8d800779efb6e4ea8cbe419fe..ceef3e801030d4782b3d05374b6ef48a9d544b14 100644
--- a/net/rose/af_rose.c
+++ b/net/rose/af_rose.c
@@ -1479,7 +1479,7 @@ static int rose_info_show(struct seq_file *seq, void *v)
 			callsign = ax2asc(buf, &rose->source_call);
 
 		seq_printf(seq,
-			   "%-10s %-9s %-5s %3.3X %05d  %d  %d  %d  %d %3lu %3lu %3lu %3lu %3lu %3lu/%03lu %5d %5d %ld\n",
+			   "%-10s %-9s %-5s %3.3X %05d  %d  %d  %d  %d %3lu %3lu %3lu %3lu %3lu %3lu/%03lu %5d %5d %" PRIino "u\n",
 			rose2asc(rsbuf, &rose->source_addr),
 			callsign,
 			devname,
@@ -1498,7 +1498,7 @@ static int rose_info_show(struct seq_file *seq, void *v)
 			rose->idle / (60 * HZ),
 			sk_wmem_alloc_get(s),
 			sk_rmem_alloc_get(s),
-			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0L);
+			s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : (kino_t)0);
 	}
 
 	return 0;
diff --git a/net/x25/x25_proc.c b/net/x25/x25_proc.c
index 0412814a2295bba5e26f4c95697ef7b7ba5fb34f..196e1850e925e4034b2ac71df151b9b953fb2570 100644
--- a/net/x25/x25_proc.c
+++ b/net/x25/x25_proc.c
@@ -96,7 +96,7 @@ static int x25_seq_socket_show(struct seq_file *seq, void *v)
 		devname = x25->neighbour->dev->name;
 
 	seq_printf(seq, "%-10s %-10s %-5s %3.3X  %d  %d  %d  %d %3lu %3lu "
-			"%3lu %3lu %3lu %5d %5d %ld\n",
+			"%3lu %3lu %3lu %5d %5d %" PRIino "u\n",
 		   !x25->dest_addr.x25_addr[0] ? "*" : x25->dest_addr.x25_addr,
 		   !x25->source_addr.x25_addr[0] ? "*" : x25->source_addr.x25_addr,
 		   devname, x25->lci & 0x0FFF, x25->state, x25->vs, x25->vr,
@@ -104,7 +104,7 @@ static int x25_seq_socket_show(struct seq_file *seq, void *v)
 		   x25->t21 / HZ, x25->t22 / HZ, x25->t23 / HZ,
 		   sk_wmem_alloc_get(s),
 		   sk_rmem_alloc_get(s),
-		   s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : 0L);
+		   s->sk_socket ? SOCK_INODE(s->sk_socket)->i_ino : (kino_t)0);
 out:
 	return 0;
 }

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
