Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLGiERP3pWl5IQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:46:11 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F4B1E08B1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:46:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HwarC8R42j72CQCY0nXbqGceHdN/Ar23NxxaWtUdng=; b=CtvmnftTSggTfY/oe9PcM24v9L
	X+R5vpFHKNH/V4m5VdFERieooyjoJONChASk4aLG9ULBicjZQ4/I/k30BfMPk86FGGQvA4c6qfv15
	8tIr7d9VdEpxcS4r+gDGCtLjy+Z+pLp2uupIgXpvfKjGKFEtN8UDsA4FS6QeCU+Pz2Fw=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA9Z-0007VR-4c;
	Mon, 02 Mar 2026 20:46:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA9R-0007Uj-Rs;
 Mon, 02 Mar 2026 20:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ts/fmlT4bjjgqy5Gc20Au0Fvwpz1fxgRd3vfVJgyhC8=; b=Sfd6WUbjf5WGlBg/JscSIdvNTA
 mt83sVutEJoDYO+XXxZ82mlAHT9YxBYIVLxrVCywLOKm9YecY9NSSRn6L0GFY/k5FSGebKlqi8M7Q
 R6U9ppbkbBU1E/izqKToa6+ylLZNdgKZR1XQeqienyjFJhMoBU6SXugrDwthn9RqbP7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ts/fmlT4bjjgqy5Gc20Au0Fvwpz1fxgRd3vfVJgyhC8=; b=X1+Bzx93KcMHo/pP2gFC5dqX8g
 NxVoOHdoeSUZ/OFAjRuk3X3YCV4xT4sHRjv8nRkAFBm8F+34V3bagO1fKcoNSSwcuCBvQ7Yz0nDj4
 ynNtZwabEbBm9UmxZAqZfsnA5UqfK/I0UBigvTlPcTJXSMCIhLCvp1ApH3gjQ0KCsXkw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA9Q-0006iu-Tc; Mon, 02 Mar 2026 20:46:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 71897418F7;
 Mon,  2 Mar 2026 20:45:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C547C2BC87;
 Mon,  2 Mar 2026 20:45:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484350;
 bh=7Yaqcvybh/+pWSp1blOqkW5oyFHsnJR2av48Tn6jnLc=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nXSuM6cRhWdFTIU+hMmsLRYCX1vJ/QVNZgjUVeDUVAQ0g3JY2lxvUILaJao43J3kT
 sRkXNwWAxvtwAX9KcRKoX9U/e3H4NCyU1StJSBlnjx0BCtP+L1fhLpqMMnw8V/wyks
 RKdHHAS1N2b8WNX4fPf1Dd4e6j6/C5cylUfidJ33oKLNTcZ+hISHpLhNHLONdrQIEW
 I6SHbzLJHnY93Fu8gTWHjpc2W+D/vs4qzIRaeRQnBVEu9PFnrQKgP25gOUFXkg1IWV
 7fZiX0CFTAfk87fhAw+VEtIVkc15wB6uQ7Fxys52W3ZeyrzQykBn4xmX5tM1IpJAu0
 qxiPTiowROnog==
Date: Mon, 02 Mar 2026 15:25:11 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-87-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3540; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=7Yaqcvybh/+pWSp1blOqkW5oyFHsnJR2av48Tn6jnLc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfIHSlmbS586IDrOOOEqQZtQI/Z2+zAR5lHJd
 78usd0crveJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXyBwAKCRAADmhBGVaC
 FVD8EACNshWBBeX04wM44HuTFupoTtw6nDoXa5sxvVoQw3ZqUVhTZcysodTV4o7fBAafvTADc2M
 453eWiBpQO3xZ0J+c9wnS8Jt29iGen6P1BpCm73AGV14xG6xWfxmSwPHLM1JrivyqoxZKYiC1sO
 hU7DEIPdbTIH3X83w7VOet9XzHnlCmAZpd/+F0VRTsa5dZndOzT+YBRIvCx27APYMwmC7Icv9XQ
 lwPeqcMzseE2kggAa1yu5/PvA6VhzWQDC5LPOqZECQFupxF4AvskTIeaQSz6hYo1UNxcBUy2QFD
 glWJF5l4mIUgJQyPidLRm4uOwlnM/OMN/VCwgLqFDoiOAKaGZdH4zQgBFitJ1gAY4o5BOWTZ++v
 0LJpO0II7noEnl3UdbkGww36amRn99U3qifqGRSVuKwA5nfnFWjqHO+vL4rn7oE+KCccl1XpGHY
 qLeW98RKpdCaF5QuR70By4fIg24w/VKB9yKRE7JmbczXXRI33LsoP2nVLz0Nf0lgkBwBE9IndOg
 gqP2Zx1J1UEo66s7sAiu+v1DTidPgC+jrEM2IWZYCAFc9MY1Ki3veP956T36zVCISOKz+hydm6H
 1A3sm4SxqrspBa7d0cvcUNA0OZbVbslphQZyN2RC42GndLkYgjqpKpWNTkfP1Puwe9OP7VHpUnH
 KkgktuBEm1G8yBw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that i_ino is u64 and the PRIino format macro has been
 removed,
 replace all uses in isofs with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/isofs/compress.c | 2 +- fs/isofs/dir.c
 | 2 +- fs/isofs/inode.c | 6 +++--- fs/isofs/namei.c | 2 +- 4 files changed,
 6 insertions(+), 6 deletions(- [...] 
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
X-Headers-End: 1vxA9Q-0006iu-Tc
Subject: [f2fs-dev] [PATCH v2 087/110] isofs: replace PRIino with %llu/%llx
 format strings
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
X-Rspamd-Queue-Id: 80F4B1E08B1
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

Now that i_ino is u64 and the PRIino format macro has been removed,
replace all uses in isofs with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/isofs/compress.c | 2 +-
 fs/isofs/dir.c      | 2 +-
 fs/isofs/inode.c    | 6 +++---
 fs/isofs/namei.c    | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/isofs/compress.c b/fs/isofs/compress.c
index dc6c7d247cf880720be47cd26d23206d25a4e453..397568b9c7e7d3e28873be02c8a4befcddaec7b5 100644
--- a/fs/isofs/compress.c
+++ b/fs/isofs/compress.c
@@ -156,7 +156,7 @@ static loff_t zisofs_uncompress_block(struct inode *inode, loff_t block_start,
 				else {
 					printk(KERN_DEBUG
 					       "zisofs: zisofs_inflate returned"
-					       " %d, inode = %" PRIino "u,"
+					       " %d, inode = %llu,"
 					       " page idx = %d, bh idx = %d,"
 					       " avail_in = %ld,"
 					       " avail_out = %ld\n",
diff --git a/fs/isofs/dir.c b/fs/isofs/dir.c
index 0a8f9e411c23425a6919b7a4fa3fb387eb2c3209..2fd9948d606e9c92f3003bfbaa4f0271c750a93d 100644
--- a/fs/isofs/dir.c
+++ b/fs/isofs/dir.c
@@ -152,7 +152,7 @@ static int do_isofs_readdir(struct inode *inode, struct file *file,
 		    de_len < de->name_len[0] +
 					sizeof(struct iso_directory_record)) {
 			printk(KERN_NOTICE "iso9660: Corrupted directory entry"
-			       " in block %lu of inode %" PRIino "u\n", block,
+			       " in block %lu of inode %llu\n", block,
 			       inode->i_ino);
 			brelse(bh);
 			return -EIO;
diff --git a/fs/isofs/inode.c b/fs/isofs/inode.c
index 678d7363e157d893e005152e64e922d9170468d0..3593e02e75fef8567643137e0ff992019d2b6fbb 100644
--- a/fs/isofs/inode.c
+++ b/fs/isofs/inode.c
@@ -1261,7 +1261,7 @@ static int isofs_read_level3_size(struct inode *inode)
 
 out_toomany:
 	printk(KERN_INFO "%s: More than 100 file sections ?!?, aborting...\n"
-		"isofs_read_level3_size: inode=%" PRIino "u\n",
+		"isofs_read_level3_size: inode=%llu\n",
 		__func__, inode->i_ino);
 	goto out;
 }
@@ -1380,7 +1380,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 	/* I have no idea what file_unit_size is used for, so
 	   we will flag it for now */
 	if (de->file_unit_size[0] != 0) {
-		printk(KERN_DEBUG "ISOFS: File unit size != 0 for ISO file (%" PRIino "u).\n",
+		printk(KERN_DEBUG "ISOFS: File unit size != 0 for ISO file (%llu).\n",
 			inode->i_ino);
 	}
 
@@ -1450,7 +1450,7 @@ static int isofs_read_inode(struct inode *inode, int relocated)
 		/* XXX - parse_rock_ridge_inode() had already set i_rdev. */
 		init_special_inode(inode, inode->i_mode, inode->i_rdev);
 	} else {
-		printk(KERN_DEBUG "ISOFS: Invalid file type 0%04o for inode %" PRIino "u.\n",
+		printk(KERN_DEBUG "ISOFS: Invalid file type 0%04o for inode %llu.\n",
 			inode->i_mode, inode->i_ino);
 		ret = -EIO;
 		goto fail;
diff --git a/fs/isofs/namei.c b/fs/isofs/namei.c
index 494d2ae4c0955123335a97f23672b959dcc9e0bd..8dd3911717e0cc221f60fb6447e1bf26cc2223dd 100644
--- a/fs/isofs/namei.c
+++ b/fs/isofs/namei.c
@@ -100,7 +100,7 @@ isofs_find_entry(struct inode *dir, struct dentry *dentry,
 		/* Basic sanity check, whether name doesn't exceed dir entry */
 		if (de_len < dlen + sizeof(struct iso_directory_record)) {
 			printk(KERN_NOTICE "iso9660: Corrupted directory entry"
-			       " in block %lu of inode %" PRIino "u\n", block,
+			       " in block %lu of inode %llu\n", block,
 			       dir->i_ino);
 			brelse(bh);
 			return 0;

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
