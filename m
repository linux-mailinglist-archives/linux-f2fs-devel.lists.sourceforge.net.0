Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AGZCB/n1pWmkIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:41:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F4A81E03E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:41:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgR34L0uIU2oKlx0FdGCxG/342sSWApuEFDremmbZyw=; b=KumI4YYrnMiL4yR5LklmRls4Vg
	NU7ELNWLax1mNMZ3nXzzsaP3Y50eKTs6z0d+JHCvF8ErmkbzisDBg+pWLx/9/Wbvao2Z5D2m+O7Vb
	nUOJCnTr7z4Hgv3l9ThXPAJIJuTjSjejUiS8ERBr2D0i/N0Y05atssevQMzIp1YxAiW0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA4z-000468-Vs;
	Mon, 02 Mar 2026 20:41:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA4y-00045d-AD;
 Mon, 02 Mar 2026 20:41:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qs6yjgrToUcqY+yJg4fgzeQmq1Yk4KIzI+pcCkKbq5c=; b=jY9u3H8E6RkBZRPrARSiFijSSc
 EAyleBTuJ7Gu3Skgscs+Bj6D0EtV5BV6Hc756QfNb+qiU6vljY8tkcNiEybvoSulwH7Jj+s3lANul
 yok5Kq5gJ4J2FRckqSreMnH07jzG1UbBIq2nipxl2vH1mVDmA0ndM4Hf1xbui9MdIZaA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qs6yjgrToUcqY+yJg4fgzeQmq1Yk4KIzI+pcCkKbq5c=; b=JMFCLdH+j4lIxXElXzNY6vz19h
 DLaQrtRCDi4wKHE0M/BdQiFriFnqtN3fWmNo9xgZy5R9Ea4V5w1hT5J3acdp1kTG9A223kixxCbhf
 1lvCHIOc6sH9MWtVRyIDP9Tuom/tdfHmFRaY4MMF2EQxpL/H10qFgfk4ICGmQ0c4+gko=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA4x-0006G3-BA; Mon, 02 Mar 2026 20:41:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id F402E40279;
 Mon,  2 Mar 2026 20:41:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA4D6C2BCB2;
 Mon,  2 Mar 2026 20:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484077;
 bh=7iiTK/WlallPtoG9cPNjecKgEBkMT/TeqVgQy+WopvM=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Q3lWy3v43bm+80a+0OwzqN6HO+WYZrL+cAeVzq9he36ZmAtFYTR/rzVUIOd+XPIZn
 xiciprDtyAiCVp57Nzi4tvZ8Y21cP7iDyRS6JDAwcVAjHQ3q1cgBKlwkGplcbRZtaq
 wu0ln60mDcobYuejPozOuD/SEwr5UkMfFPRnckpe33RzwKjIXJ3Jucu0Cix62ZMXir
 u+siRB/S0m7tx5nTgxL3R7ly4+L/HI3KzITee/l1HsslT8QqSzDTLx5ns5Mq4srKXf
 Ndo3CW8EU5EMBb98PjC+ney+FXVIpyqf3TaCiM/5UU3fbLTn0M67jYrBEstdade6rG
 PYLcnjlQMOWag==
Date: Mon, 02 Mar 2026 15:24:52 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-68-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=14594; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=7iiTK/WlallPtoG9cPNjecKgEBkMT/TeqVgQy+WopvM=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfIByzPBKN+6Lr3DkJlbKoKDXSsmMjh2nWOjA
 OenDfFcRDKJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXyAQAKCRAADmhBGVaC
 FcVzD/0a3wbbo/lvqeGMdK9SeYLF3NTrj3JCtWkiw1CiLf06TkanPBZN4g21uciz8A3bhypmKQm
 ur1miF+4oxMw995RrTSwqIFlhBTSOlbgi88+V9KV6ir1SaXotaYRHWTnkhmEazGKyQ4e15gUV7d
 4EtAAK2sojRlcY+0Zn002f1amXr5goGrtuQcMx3mLOVglOIlAi0k/n8GyW+N6kNeMV6wxKokXiE
 yfkwZMenwOROw3SG3fLOtneaSgawXku/m2Jtt/Q4ch0tGmrbNq1ZCyOczLh6zQt8U/h660/LhkZ
 EZSjYQqYUc7519xck4rS9esm9Dae6T7ihTSgSQOy08KoX+EgqqxqWIObPtH7FPpWdZeZMTiEdra
 xbOHVgxCqFJfLvM4c5G2PsIFVCXcIBiQF7jnORE0Y1wUdL9xEHUUA2eeEkwv2px+oI+R0P4Az0h
 mQ2V1Zjafq9RxYAZhPoaBr8TsqNQPach7sdWbxhTPgQzZjTbHZwsdROvQlBAdznlxLzIRbkzByX
 n4VnP/+pP+U2Xp7ibTRbYfdhtRyJoa6MqjOfrpZGaBGVI0BfQ9a41R3xYDUif/ioKhDEoxEfud1
 NbBFix+eq/ukXY+6Dz/20Ixoih4nKZOD868lCfiF/gOalbvoZZlWsu3VLzKMUgSj2Cab4Zk0v2z
 dBKhS6EU8pUW1VA==
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
 replace all uses in nilfs2 with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/nilfs2/alloc.c | 10 +++++-----
 fs/nilfs2/bmap.c
 | 2 +- fs/nilfs2/btnode.c | 2 +- fs/nilfs2/btree.c | 12 ++++++------
 fs/nilfs2/dir.c | 12 ++++++- [...] 
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
X-Headers-End: 1vxA4x-0006G3-BA
Subject: [f2fs-dev] [PATCH v2 068/110] nilfs2: replace PRIino with %llu/%llx
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
X-Rspamd-Queue-Id: 1F4A81E03E0
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
replace all uses in nilfs2 with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nilfs2/alloc.c   | 10 +++++-----
 fs/nilfs2/bmap.c    |  2 +-
 fs/nilfs2/btnode.c  |  2 +-
 fs/nilfs2/btree.c   | 12 ++++++------
 fs/nilfs2/dir.c     | 12 ++++++------
 fs/nilfs2/direct.c  |  4 ++--
 fs/nilfs2/gcinode.c |  2 +-
 fs/nilfs2/inode.c   |  8 ++++----
 fs/nilfs2/mdt.c     |  2 +-
 fs/nilfs2/namei.c   |  2 +-
 fs/nilfs2/segment.c |  2 +-
 11 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/fs/nilfs2/alloc.c b/fs/nilfs2/alloc.c
index a3c559c86e5a4c63b1c9dd4ca137f24749c3ee87..7b1cd2baefcf21e54f9260845b02c7c95c148c64 100644
--- a/fs/nilfs2/alloc.c
+++ b/fs/nilfs2/alloc.c
@@ -707,7 +707,7 @@ void nilfs_palloc_commit_free_entry(struct inode *inode,
 
 	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
 		nilfs_warn(inode->i_sb,
-			   "%s (ino=%" PRIino "u): entry number %llu already freed",
+			   "%s (ino=%llu): entry number %llu already freed",
 			   __func__, inode->i_ino,
 			   (unsigned long long)req->pr_entry_nr);
 	else
@@ -748,7 +748,7 @@ void nilfs_palloc_abort_alloc_entry(struct inode *inode,
 
 	if (!nilfs_clear_bit_atomic(lock, group_offset, bitmap))
 		nilfs_warn(inode->i_sb,
-			   "%s (ino=%" PRIino "u): entry number %llu already freed",
+			   "%s (ino=%llu): entry number %llu already freed",
 			   __func__, inode->i_ino,
 			   (unsigned long long)req->pr_entry_nr);
 	else
@@ -861,7 +861,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
 			if (!nilfs_clear_bit_atomic(lock, group_offset,
 						    bitmap)) {
 				nilfs_warn(inode->i_sb,
-					   "%s (ino=%" PRIino "u): entry number %llu already freed",
+					   "%s (ino=%llu): entry number %llu already freed",
 					   __func__, inode->i_ino,
 					   (unsigned long long)entry_nrs[j]);
 			} else {
@@ -906,7 +906,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
 							      last_nrs[k]);
 			if (ret && ret != -ENOENT)
 				nilfs_warn(inode->i_sb,
-					   "error %d deleting block that object (entry=%llu, ino=%" PRIino "u) belongs to",
+					   "error %d deleting block that object (entry=%llu, ino=%llu) belongs to",
 					   ret, (unsigned long long)last_nrs[k],
 					   inode->i_ino);
 		}
@@ -923,7 +923,7 @@ int nilfs_palloc_freev(struct inode *inode, __u64 *entry_nrs, size_t nitems)
 			ret = nilfs_palloc_delete_bitmap_block(inode, group);
 			if (ret && ret != -ENOENT)
 				nilfs_warn(inode->i_sb,
-					   "error %d deleting bitmap block of group=%lu, ino=%" PRIino "u",
+					   "error %d deleting bitmap block of group=%lu, ino=%llu",
 					   ret, group, inode->i_ino);
 		}
 	}
diff --git a/fs/nilfs2/bmap.c b/fs/nilfs2/bmap.c
index e12979bac3c3ee5eb7fcc2bf156fe6e48fc65a7d..824f2bd91c167965ec3a660202b6e6c5f1fe007e 100644
--- a/fs/nilfs2/bmap.c
+++ b/fs/nilfs2/bmap.c
@@ -33,7 +33,7 @@ static int nilfs_bmap_convert_error(struct nilfs_bmap *bmap,
 
 	if (err == -EINVAL) {
 		__nilfs_error(inode->i_sb, fname,
-			      "broken bmap (inode number=%" PRIino "u)", inode->i_ino);
+			      "broken bmap (inode number=%llu)", inode->i_ino);
 		err = -EIO;
 	}
 	return err;
diff --git a/fs/nilfs2/btnode.c b/fs/nilfs2/btnode.c
index 3d64f3a9223e5601dc2332ae6e1007edd5b4827b..2e553d698d0f3980de98fced415dfd819ddbca0a 100644
--- a/fs/nilfs2/btnode.c
+++ b/fs/nilfs2/btnode.c
@@ -64,7 +64,7 @@ nilfs_btnode_create_block(struct address_space *btnc, __u64 blocknr)
 		 * clearing of an abandoned b-tree node is missing somewhere).
 		 */
 		nilfs_error(inode->i_sb,
-			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%" PRIino "u)",
+			    "state inconsistency probably due to duplicate use of b-tree node block address %llu (ino=%llu)",
 			    (unsigned long long)blocknr, inode->i_ino);
 		goto failed;
 	}
diff --git a/fs/nilfs2/btree.c b/fs/nilfs2/btree.c
index 57163e991fbc49e2bfba2fa543f1b8dbd77718f4..3c03f5a741d144d22d1ffb5acf43a035e88c00dc 100644
--- a/fs/nilfs2/btree.c
+++ b/fs/nilfs2/btree.c
@@ -353,7 +353,7 @@ static int nilfs_btree_node_broken(const struct nilfs_btree_node *node,
 		     nchildren <= 0 ||
 		     nchildren > NILFS_BTREE_NODE_NCHILDREN_MAX(size))) {
 		nilfs_crit(inode->i_sb,
-			   "bad btree node (ino=%" PRIino "u, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
+			   "bad btree node (ino=%llu, blocknr=%llu): level = %d, flags = 0x%x, nchildren = %d",
 			   inode->i_ino, (unsigned long long)blocknr, level,
 			   flags, nchildren);
 		ret = 1;
@@ -384,7 +384,7 @@ static int nilfs_btree_root_broken(const struct nilfs_btree_node *node,
 		     nchildren > NILFS_BTREE_ROOT_NCHILDREN_MAX ||
 		     (nchildren == 0 && level > NILFS_BTREE_LEVEL_NODE_MIN))) {
 		nilfs_crit(inode->i_sb,
-			   "bad btree root (ino=%" PRIino "u): level = %d, flags = 0x%x, nchildren = %d",
+			   "bad btree root (ino=%llu): level = %d, flags = 0x%x, nchildren = %d",
 			   inode->i_ino, level, flags, nchildren);
 		ret = 1;
 	}
@@ -453,7 +453,7 @@ static int nilfs_btree_bad_node(const struct nilfs_bmap *btree,
 	if (unlikely(nilfs_btree_node_get_level(node) != level)) {
 		dump_stack();
 		nilfs_crit(btree->b_inode->i_sb,
-			   "btree level mismatch (ino=%" PRIino "u): %d != %d",
+			   "btree level mismatch (ino=%llu): %d != %d",
 			   btree->b_inode->i_ino,
 			   nilfs_btree_node_get_level(node), level);
 		return 1;
@@ -521,7 +521,7 @@ static int __nilfs_btree_get_block(const struct nilfs_bmap *btree, __u64 ptr,
  out_no_wait:
 	if (!buffer_uptodate(bh)) {
 		nilfs_err(btree->b_inode->i_sb,
-			  "I/O error reading b-tree node block (ino=%" PRIino "u, blocknr=%llu)",
+			  "I/O error reading b-tree node block (ino=%llu, blocknr=%llu)",
 			  btree->b_inode->i_ino, (unsigned long long)ptr);
 		brelse(bh);
 		return -EIO;
@@ -2104,7 +2104,7 @@ static int nilfs_btree_propagate(struct nilfs_bmap *btree,
 	if (ret < 0) {
 		if (unlikely(ret == -ENOENT)) {
 			nilfs_crit(btree->b_inode->i_sb,
-				   "writing node/leaf block does not appear in b-tree (ino=%" PRIino "u) at key=%llu, level=%d",
+				   "writing node/leaf block does not appear in b-tree (ino=%llu) at key=%llu, level=%d",
 				   btree->b_inode->i_ino,
 				   (unsigned long long)key, level);
 			ret = -EINVAL;
@@ -2146,7 +2146,7 @@ static void nilfs_btree_add_dirty_buffer(struct nilfs_bmap *btree,
 	    level >= NILFS_BTREE_LEVEL_MAX) {
 		dump_stack();
 		nilfs_warn(btree->b_inode->i_sb,
-			   "invalid btree level: %d (key=%llu, ino=%" PRIino "u, blocknr=%llu)",
+			   "invalid btree level: %d (key=%llu, ino=%llu, blocknr=%llu)",
 			   level, (unsigned long long)key,
 			   btree->b_inode->i_ino,
 			   (unsigned long long)bh->b_blocknr);
diff --git a/fs/nilfs2/dir.c b/fs/nilfs2/dir.c
index b182da076c58c4813145bc3e501a1e9a188bce85..3653db5cdb65137d1e660bb509c14ec4cbc8840b 100644
--- a/fs/nilfs2/dir.c
+++ b/fs/nilfs2/dir.c
@@ -150,7 +150,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
 
 Ebadsize:
 	nilfs_error(sb,
-		    "size of directory #%" PRIino "u is not a multiple of chunk size",
+		    "size of directory #%llu is not a multiple of chunk size",
 		    dir->i_ino);
 	goto fail;
 Eshort:
@@ -169,7 +169,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
 	error = "disallowed inode number";
 bad_entry:
 	nilfs_error(sb,
-		    "bad entry in directory #%" PRIino "u: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
+		    "bad entry in directory #%llu: %s - offset=%lu, inode=%lu, rec_len=%zd, name_len=%d",
 		    dir->i_ino, error, (folio->index << PAGE_SHIFT) + offs,
 		    (unsigned long)le64_to_cpu(p->inode),
 		    rec_len, p->name_len);
@@ -177,7 +177,7 @@ static bool nilfs_check_folio(struct folio *folio, char *kaddr)
 Eend:
 	p = (struct nilfs_dir_entry *)(kaddr + offs);
 	nilfs_error(sb,
-		    "entry in directory #%" PRIino "u spans the page boundary offset=%lu, inode=%lu",
+		    "entry in directory #%llu spans the page boundary offset=%lu, inode=%lu",
 		    dir->i_ino, (folio->index << PAGE_SHIFT) + offs,
 		    (unsigned long)le64_to_cpu(p->inode));
 fail:
@@ -251,7 +251,7 @@ static int nilfs_readdir(struct file *file, struct dir_context *ctx)
 
 		kaddr = nilfs_get_folio(inode, n, &folio);
 		if (IS_ERR(kaddr)) {
-			nilfs_error(sb, "bad page in #%" PRIino "u", inode->i_ino);
+			nilfs_error(sb, "bad page in #%llu", inode->i_ino);
 			ctx->pos += PAGE_SIZE - offset;
 			return -EIO;
 		}
@@ -336,7 +336,7 @@ struct nilfs_dir_entry *nilfs_find_entry(struct inode *dir,
 		/* next folio is past the blocks we've got */
 		if (unlikely(n > (dir->i_blocks >> (PAGE_SHIFT - 9)))) {
 			nilfs_error(dir->i_sb,
-			       "dir %" PRIino "u size %lld exceeds block count %llu",
+			       "dir %llu size %lld exceeds block count %llu",
 			       dir->i_ino, dir->i_size,
 			       (unsigned long long)dir->i_blocks);
 			goto out;
@@ -382,7 +382,7 @@ struct nilfs_dir_entry *nilfs_dotdot(struct inode *dir, struct folio **foliop)
 	return next_de;
 
 fail:
-	nilfs_error(dir->i_sb, "directory #%" PRIino "u %s", dir->i_ino, msg);
+	nilfs_error(dir->i_sb, "directory #%llu %s", dir->i_ino, msg);
 	folio_release_kmap(folio, de);
 	return NULL;
 }
diff --git a/fs/nilfs2/direct.c b/fs/nilfs2/direct.c
index 1084d4d586e078ab6825167976dd2a71d52bc8aa..8bd0b1374e25f8ff510f3b36dbde2acc01aafc1e 100644
--- a/fs/nilfs2/direct.c
+++ b/fs/nilfs2/direct.c
@@ -338,7 +338,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
 	key = nilfs_bmap_data_get_key(bmap, *bh);
 	if (unlikely(key > NILFS_DIRECT_KEY_MAX)) {
 		nilfs_crit(bmap->b_inode->i_sb,
-			   "%s (ino=%" PRIino "u): invalid key: %llu",
+			   "%s (ino=%llu): invalid key: %llu",
 			   __func__,
 			   bmap->b_inode->i_ino, (unsigned long long)key);
 		return -EINVAL;
@@ -346,7 +346,7 @@ static int nilfs_direct_assign(struct nilfs_bmap *bmap,
 	ptr = nilfs_direct_get_ptr(bmap, key);
 	if (unlikely(ptr == NILFS_BMAP_INVALID_PTR)) {
 		nilfs_crit(bmap->b_inode->i_sb,
-			   "%s (ino=%" PRIino "u): invalid pointer: %llu",
+			   "%s (ino=%llu): invalid pointer: %llu",
 			   __func__,
 			   bmap->b_inode->i_ino, (unsigned long long)ptr);
 		return -EINVAL;
diff --git a/fs/nilfs2/gcinode.c b/fs/nilfs2/gcinode.c
index 714962d010da4a23e9b5f40de8aaaca8b95a74da..62d4c1b787e95c961a360a4214d621d564ad8b4c 100644
--- a/fs/nilfs2/gcinode.c
+++ b/fs/nilfs2/gcinode.c
@@ -137,7 +137,7 @@ int nilfs_gccache_wait_and_mark_dirty(struct buffer_head *bh)
 		struct inode *inode = bh->b_folio->mapping->host;
 
 		nilfs_err(inode->i_sb,
-			  "I/O error reading %s block for GC (ino=%" PRIino "u, vblocknr=%llu)",
+			  "I/O error reading %s block for GC (ino=%llu, vblocknr=%llu)",
 			  buffer_nilfs_node(bh) ? "node" : "data",
 			  inode->i_ino, (unsigned long long)bh->b_blocknr);
 		return -EIO;
diff --git a/fs/nilfs2/inode.c b/fs/nilfs2/inode.c
index 0bc1c5141ec596b3c31e7d18e4ba3541bf618406..51f7e125a311b868860e3e111700d49d4cb98fa6 100644
--- a/fs/nilfs2/inode.c
+++ b/fs/nilfs2/inode.c
@@ -108,7 +108,7 @@ int nilfs_get_block(struct inode *inode, sector_t blkoff,
 				 * be locked in this case.
 				 */
 				nilfs_warn(inode->i_sb,
-					   "%s (ino=%" PRIino "u): a race condition while inserting a data block at offset=%llu",
+					   "%s (ino=%llu): a race condition while inserting a data block at offset=%llu",
 					   __func__, inode->i_ino,
 					   (unsigned long long)blkoff);
 				err = -EAGAIN;
@@ -789,7 +789,7 @@ static void nilfs_truncate_bmap(struct nilfs_inode_info *ii,
 		goto repeat;
 
 failed:
-	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%" PRIino "u)",
+	nilfs_warn(ii->vfs_inode.i_sb, "error %d truncating bmap (ino=%llu)",
 		   ret, ii->vfs_inode.i_ino);
 }
 
@@ -1026,7 +1026,7 @@ int nilfs_set_file_dirty(struct inode *inode, unsigned int nr_dirty)
 			 * this inode.
 			 */
 			nilfs_warn(inode->i_sb,
-				   "cannot set file dirty (ino=%" PRIino "u): the file is being freed",
+				   "cannot set file dirty (ino=%llu): the file is being freed",
 				   inode->i_ino);
 			spin_unlock(&nilfs->ns_inode_lock);
 			return -EINVAL; /*
@@ -1057,7 +1057,7 @@ int __nilfs_mark_inode_dirty(struct inode *inode, int flags)
 	err = nilfs_load_inode_block(inode, &ibh);
 	if (unlikely(err)) {
 		nilfs_warn(inode->i_sb,
-			   "cannot mark inode dirty (ino=%" PRIino "u): error %d loading inode block",
+			   "cannot mark inode dirty (ino=%llu): error %d loading inode block",
 			   inode->i_ino, err);
 		return err;
 	}
diff --git a/fs/nilfs2/mdt.c b/fs/nilfs2/mdt.c
index 8629c72b62db33217d4747124885b6f727f182be..09adb40c65e505d92012a3d2f5fe8a5696e10056 100644
--- a/fs/nilfs2/mdt.c
+++ b/fs/nilfs2/mdt.c
@@ -203,7 +203,7 @@ static int nilfs_mdt_read_block(struct inode *inode, unsigned long block,
 	err = -EIO;
 	if (!buffer_uptodate(first_bh)) {
 		nilfs_err(inode->i_sb,
-			  "I/O error reading meta-data file (ino=%" PRIino "u, block-offset=%lu)",
+			  "I/O error reading meta-data file (ino=%llu, block-offset=%lu)",
 			  inode->i_ino, block);
 		goto failed_bh;
 	}
diff --git a/fs/nilfs2/namei.c b/fs/nilfs2/namei.c
index 29edb84a0663caa4b29fa488c0495fc53358ca00..40ac679ec56e400b1df98e9be6fe9ca338a9ba51 100644
--- a/fs/nilfs2/namei.c
+++ b/fs/nilfs2/namei.c
@@ -292,7 +292,7 @@ static int nilfs_do_unlink(struct inode *dir, struct dentry *dentry)
 
 	if (!inode->i_nlink) {
 		nilfs_warn(inode->i_sb,
-			   "deleting nonexistent file (ino=%" PRIino "u), %d",
+			   "deleting nonexistent file (ino=%llu), %d",
 			   inode->i_ino, inode->i_nlink);
 		set_nlink(inode, 1);
 	}
diff --git a/fs/nilfs2/segment.c b/fs/nilfs2/segment.c
index 9a8bc3fa35ce9b447abbc2fb56cbd2b0cc5f76de..4b1bf559f3524b1cc3965dae9fd3e5745718569d 100644
--- a/fs/nilfs2/segment.c
+++ b/fs/nilfs2/segment.c
@@ -2024,7 +2024,7 @@ static int nilfs_segctor_collect_dirty_files(struct nilfs_sc_info *sci,
 				ifile, ii->vfs_inode.i_ino, &ibh);
 			if (unlikely(err)) {
 				nilfs_warn(sci->sc_super,
-					   "log writer: error %d getting inode block (ino=%" PRIino "u)",
+					   "log writer: error %d getting inode block (ino=%llu)",
 					   err, ii->vfs_inode.i_ino);
 				return err;
 			}

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
