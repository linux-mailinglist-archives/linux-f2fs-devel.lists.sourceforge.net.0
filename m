Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qEt+OBj2pWmkIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:42:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA4F1E0444
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6UspT4636Dy18eQkUb7+GTnPr30yHw/h1sDIL0EArI=; b=Br8INx974KcJzcyXDVFte3te+2
	1ZwEJN9U5qglo7WTZvJ0jHTNsNhHuBYllOrH/rXXCxdqZiWG5JMclNmpSRkAn2Fh4nlFCwRe9xSHs
	oVB/jWd9qw9VkLUAgVEdpE8R0h1bjQQKRky0SbJs101Ww0ryG40+Kw6QtDukeJhSqG/s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA5U-0006ob-Rg;
	Mon, 02 Mar 2026 20:41:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA5S-0006nr-MT;
 Mon, 02 Mar 2026 20:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z4IeV0gJD0BYTgf1oQ8MZsxO0wH0GBtBt1YuxCm41Jg=; b=Uvqd4IDW5g9Q86Kq/PYZiqNGCg
 I2vwFQfmaEhDmmDN42k2df+417+bMBojQQIDoG36kZ78D56PcBHHBVwtbO40A9msGZ42VOWnmqxRc
 rMvXjULD8w9hGHflJ1sSV8eyhH4P67hXA8SBhrRsZjFhWqJb4Udhr0w4kQBxaJH7pq6o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Z4IeV0gJD0BYTgf1oQ8MZsxO0wH0GBtBt1YuxCm41Jg=; b=BIxwu9mHW53DHiZDAY4VmyWaNt
 J5xCnK7ak5r15VR3YJKCzVVe3eXG/1GK9hGYD8Q1IGB3iMvWOEKApvBHG82QYEFKzgpN441nbqqVS
 pL3I4mq5UifMk+F2+Gj+1jOaN5/Xw6YhFC45tVTYaefsTvfDgXKVBbXzmo3HTX06mcCs=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA5H-0006I9-9M; Mon, 02 Mar 2026 20:41:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D81060128;
 Mon,  2 Mar 2026 20:41:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A40BC19425;
 Mon,  2 Mar 2026 20:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484092;
 bh=z+GoXLxi9bLI354RrSKEEChGrCAoldiE2cGdeVIr/zg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=KG7Mj5pQw2C9P5boHntE0Ghr4TxhKwYJ6LSbBh9N/soeBMeuRNOiWU0wIySPbvkBQ
 2it0/WYiOK9B0OYFYMqKhnK5RXdPUm5n7x43Rdte3as/5XyfLVnahhAnS7Xu6aKrZT
 4hKezLXc71x+3b0LHl0lfdwuIN/lNoMY53fj+nF8XqpHadkMQwLewmbcgt0X0mZeBJ
 UjxPF1QFPSDBGe2r9ovenCfoJjvv+Df+c9pFt/fOQ0VlyyC2GN3pXnt/RUG633Cyp3
 OjzSFX3mH5wL6RhvSEgvlCKKf0RbtJ284iXcxQScso27VxJLQ4d9lGP/TrwYmrsyZZ
 wem4sXKZMmzZw==
Date: Mon, 02 Mar 2026 15:24:53 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-69-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3846; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=z+GoXLxi9bLI354RrSKEEChGrCAoldiE2cGdeVIr/zg=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfIBlRioLxetKmbe/+123D2axdZMP7yB1p5AP
 ZIwIMFWYBKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXyAQAKCRAADmhBGVaC
 FUQ6EAClP2DTcxhoC0jLOwHAMWTN2Bu1WeWsZp+kIjvAmvXgTjXTlST7dTUKrgqeJXcZmI47Hb7
 QoZFAK6/+WsQmjE3V1zEd8dvPwukz8eoan+h8TJE0/4lYSbQgbcsunSbPqtVOUNmBRfnklBF0pg
 JYYxPNAYNkNIcIRut76MiM9XlvEpZ3Rr5SopWqYV94xe3nz56AIheTXBdIu9K2gQU3wBJrPhjfF
 2gx8oQAUUlaJS4fzKIvRJxJ3h5QKmY6lHTJ8rOcYE6k6kojUezVcQuvj2JJ3RmfMleGLYeYtwu4
 P460bajwaIQKQ94ZfscMnu49KRuV5cpybNFBObKOwoedpxajH175lEuk9dZMEqzzPboTXQDVcgo
 9CwmBJuUdDs2tg44a78wXyopgLHtBNiDIOAUVdf43BhooUigMVnFyQaE3xSZCk6JIhwgV9wCYx7
 kEWqVPbvbIBKgvU22URbypE76XP1UcK1nGdraGeVkSNrohPO0YGPOKHNjRGdg3yEG9npp02Tgkp
 ohKkfwv+CNOYbH49WOghlrhGfCuYK+PTywMmczTX88MhpFD2wr0fiRtWDGhKBFE2o8eHxFtz4B4
 I13e/2vkayBZiAUHUK8aGamLFdzKfStgZfP8ppeA3w3G+dPmen4J1tYgrpRwthvxLw/pgZpqryc
 EGi0Af3D/fYukcQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now that i_ino is u64 and the PRIino format macro has been
 removed,
 replace all uses in 9p with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/9p/vfs_addr.c | 4 ++--
 fs/9p/vfs_inode.c
 | 6 +++--- fs/9p/vfs_inode_dotl.c | 6 +++--- 3 files changed, 8 insertions(+), 
 8 deletions(-) 
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
X-Headers-End: 1vxA5H-0006I9-9M
Subject: [f2fs-dev] [PATCH v2 069/110] 9p: replace PRIino with %llu/%llx
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
X-Rspamd-Queue-Id: 2DA4F1E0444
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
replace all uses in 9p with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/9p/vfs_addr.c       | 4 ++--
 fs/9p/vfs_inode.c      | 6 +++---
 fs/9p/vfs_inode_dotl.c | 6 +++---
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/9p/vfs_addr.c b/fs/9p/vfs_addr.c
index 59c1d3f3c45300f5c796a2a441842a1a781e7291..c21d33830f5f021904f490ab6185db5fd40f736d 100644
--- a/fs/9p/vfs_addr.c
+++ b/fs/9p/vfs_addr.c
@@ -36,7 +36,7 @@ static void v9fs_begin_writeback(struct netfs_io_request *wreq)
 
 	fid = v9fs_fid_find_inode(wreq->inode, true, INVALID_UID, true);
 	if (!fid) {
-		WARN_ONCE(1, "folio expected an open fid inode->i_ino=%" PRIino "x\n",
+		WARN_ONCE(1, "folio expected an open fid inode->i_ino=%llx\n",
 			  wreq->inode->i_ino);
 		return;
 	}
@@ -133,7 +133,7 @@ static int v9fs_init_request(struct netfs_io_request *rreq, struct file *file)
 	return 0;
 
 no_fid:
-	WARN_ONCE(1, "folio expected an open fid inode->i_ino=%" PRIino "x\n",
+	WARN_ONCE(1, "folio expected an open fid inode->i_ino=%llx\n",
 		  rreq->inode->i_ino);
 	return -EINVAL;
 }
diff --git a/fs/9p/vfs_inode.c b/fs/9p/vfs_inode.c
index c3eee0d7a70dfe07ba09ce36458228fb00c5855f..d1508b1fe10929d8d847af313f7661d693167d96 100644
--- a/fs/9p/vfs_inode.c
+++ b/fs/9p/vfs_inode.c
@@ -1245,7 +1245,7 @@ static int
 v9fs_vfs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 		 struct dentry *dentry, const char *symname)
 {
-	p9_debug(P9_DEBUG_VFS, " %" PRIino "u,%pd,%s\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd,%s\n",
 		 dir->i_ino, dentry, symname);
 
 	return v9fs_vfs_mkspecial(dir, dentry, P9_DMSYMLINK, symname);
@@ -1269,7 +1269,7 @@ v9fs_vfs_link(struct dentry *old_dentry, struct inode *dir,
 	char name[1 + U32_MAX_DIGITS + 2]; /* sign + number + \n + \0 */
 	struct p9_fid *oldfid;
 
-	p9_debug(P9_DEBUG_VFS, " %" PRIino "u,%pd,%pd\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd,%pd\n",
 		 dir->i_ino, dentry, old_dentry);
 
 	oldfid = v9fs_fid_clone(old_dentry);
@@ -1305,7 +1305,7 @@ v9fs_vfs_mknod(struct mnt_idmap *idmap, struct inode *dir,
 	char name[2 + U32_MAX_DIGITS + 1 + U32_MAX_DIGITS + 1];
 	u32 perm;
 
-	p9_debug(P9_DEBUG_VFS, " %" PRIino "u,%pd mode: %x MAJOR: %u MINOR: %u\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd mode: %x MAJOR: %u MINOR: %u\n",
 		 dir->i_ino, dentry, mode,
 		 MAJOR(rdev), MINOR(rdev));
 
diff --git a/fs/9p/vfs_inode_dotl.c b/fs/9p/vfs_inode_dotl.c
index 18a3792afb4fedcc870a6090ad364a7ed3c5e9a6..71796a89bcf4745363b59af1047ecfd7e3f4d956 100644
--- a/fs/9p/vfs_inode_dotl.c
+++ b/fs/9p/vfs_inode_dotl.c
@@ -691,7 +691,7 @@ v9fs_vfs_symlink_dotl(struct mnt_idmap *idmap, struct inode *dir,
 	struct p9_fid *fid = NULL;
 
 	name = dentry->d_name.name;
-	p9_debug(P9_DEBUG_VFS, "%" PRIino "u,%s,%s\n", dir->i_ino, name, symname);
+	p9_debug(P9_DEBUG_VFS, "%llu,%s,%s\n", dir->i_ino, name, symname);
 
 	dfid = v9fs_parent_fid(dentry);
 	if (IS_ERR(dfid)) {
@@ -734,7 +734,7 @@ v9fs_vfs_link_dotl(struct dentry *old_dentry, struct inode *dir,
 	struct p9_fid *dfid, *oldfid;
 	struct v9fs_session_info *v9ses;
 
-	p9_debug(P9_DEBUG_VFS, "dir ino: %" PRIino "u, old_name: %pd, new_name: %pd\n",
+	p9_debug(P9_DEBUG_VFS, "dir ino: %llu, old_name: %pd, new_name: %pd\n",
 		 dir->i_ino, old_dentry, dentry);
 
 	v9ses = v9fs_inode2v9ses(dir);
@@ -798,7 +798,7 @@ v9fs_vfs_mknod_dotl(struct mnt_idmap *idmap, struct inode *dir,
 	struct p9_qid qid;
 	struct posix_acl *dacl = NULL, *pacl = NULL;
 
-	p9_debug(P9_DEBUG_VFS, " %" PRIino "u,%pd mode: %x MAJOR: %u MINOR: %u\n",
+	p9_debug(P9_DEBUG_VFS, " %llu,%pd mode: %x MAJOR: %u MINOR: %u\n",
 		 dir->i_ino, dentry, omode,
 		 MAJOR(rdev), MINOR(rdev));
 

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
