Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KFbcDmbzpWkxIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:30:30 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50AED1DF84E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:30:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J21WhORaJn9uf4g+S/1nIFJqvRszusi0RdfBTk1r+4M=; b=chMsQOrwXxkhT+zbcCaF8XI3UJ
	9i2EuBoCKwVsnsBkis3eAmb6DWfiYw69u3WCHrEV7aTRA7k52m72NFwoQVz5VOXe5/61cH0ityzAV
	pfS7bNQ/a4M4xh2Pi97EXtlsyURG7aPc5W4MKtIDtnQMaJw2GeP0ovZ24uSWiTfzwni0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx9uL-0002OK-JT;
	Mon, 02 Mar 2026 20:30:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vx9uJ-0002Nt-PL;
 Mon, 02 Mar 2026 20:30:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6KpKfaRNZ5wYjQtfVgj9AKFtGAgHK5uZkRyZ2seBYiU=; b=kQjZnyutmKKu1L8teUrZpecYb/
 UEg6PJnGspu2w9LO2X6KkoDZqaSIKbu9Fd4u9yac9hW3OYEjVsfQOkpyUmdVf1vbPkI63T4gBGMp8
 sHBYpXACWoaU8qVGY0FSoLJJi7xkBO2BBa8y1VFd8FtDxRot4GMV/yVfScnJhU34zXPk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6KpKfaRNZ5wYjQtfVgj9AKFtGAgHK5uZkRyZ2seBYiU=; b=Q5LpiiMXx0J6pro/GYI59SgiPG
 42nhq0KWjnck8LOefUaqMi+RHOhWpCSN07J+N0cMyBfEb1XmlweDIg8tVmhZo3UsRCwEgIpmzB4NM
 7qOgFjHkTS/Vdk+LG+XKL0G+yCIxXaFEddqLcG0ljY/JcNF+N3+ouM6YwOxN7DL/BgTg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx9uJ-0004y2-Mh; Mon, 02 Mar 2026 20:30:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B5A5961118;
 Mon,  2 Mar 2026 20:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3952DC2BCB2;
 Mon,  2 Mar 2026 20:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483417;
 bh=SFRV06+LrpGHyP+DQJTOgjuew1xPKXuf8ELCQbvFgSw=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=j4Q0pC9gVLX/GuwL7w/ffoGxBSP7RPq+NpPeuKosbD6Ck2Gau/xQeD4N8u/naDEfg
 sQvcWEs62tYZz1Og6NpqphRwz7cEYCfdKIKPrjOotUTkt3XZhHEwi/2iG912xqPECA
 7YMNOiIX+IghztcKyWE7Ox/VLOKYNqsl7Rsk8r9ufWjVVx6E/HxKBo2GjSiifNcZO4
 ietEPmuzEpsEPHkaC7xO+bNI/vdAUkDAuAuVRxSyT1gJUTSRzevU77MTueOLTV7YVl
 kY7/Mvx1lXjTk92Cl5v04JlNgyEnC26cdENhAS0zGOG9gxP2feZIqQD2OjFTyOXtxA
 RoeIwgF10gexQ==
Date: Mon, 02 Mar 2026 15:24:06 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-22-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4457; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=SFRV06+LrpGHyP+DQJTOgjuew1xPKXuf8ELCQbvFgSw=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH1W0urNlOitGlDcMkogI9SpWyxFPxip32Cx
 0CQBjKPBryJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx9QAKCRAADmhBGVaC
 Fa4nEACgU9mb4glul3V7gbaPmMmo0AVe5vpRFRnW3696SkbgSJ0VBjlh5PZmnldNvzfjR8agjgC
 blt9LYwfP104fdmxdFml5BhFoIICV/xdU/ZyqeJkY47XmrEU5i4i5TxfUk09rsNI7IYdHEhvlrs
 yxbfR83D5O9puMDcxFZK5FzMN08g6gq5jd8Sm02cpZH6PeQ/q6gGjDTlsD3V7cGbunZE0XTPUd1
 P68x0C+ZLSqEg1xDgLoI0TElMvVIrEixULTNgmd0kgC5jlBlesUvYw3366GeftrljvSKHhWmApN
 TNwJ/vPHrrrNk7im2W0S+Avn0l94NtR8AJryn1v3iznfSFcQEUPbVetlK2xQDcFGAEuTndnYEXz
 dBEU7aqaV0M+0jegI910gHVLl6bxFEtpLOa1Dzhj04T8Zpy8DA7L3OAesSYO1O/UZaslux7SR5o
 18Yveno33NG/TnVYsZT3yLBEhatWz/zjHJexQnXLaHGNgAbKlBtxpBNXbBxPeJ69/LVKYCLXJAS
 0jHnDr+/6Fwt6q4ZNad4+cN6/v5ijaB83K1rkncF1nwi7Hv7rTPP0nnbHRQ7SebPbfMyP6vpezH
 zgm/wh5VFkMEEGaDIOaVnyq+jjB1YsDsMP8aOsxwA4sgn3ksKF1jwyvsyoe1fPWmuY9FbmOuRyy
 Q9ROlaQrf2RDRXA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert cachefiles i_ino format strings to use the PRIino
 format macro in preparation for the widening of i_ino via kino_t.
 Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/cachefiles/io.c | 6 +++---
 fs/cachefiles/namei.c
 | 12 ++++++------ fs/cachefiles/xattr.c | 2 +- 3 files changed,
 10 insertions(+), 10 deletions(- [...] 
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
X-Headers-End: 1vx9uJ-0004y2-Mh
Subject: [f2fs-dev] [PATCH v2 022/110] cachefiles: use PRIino format for
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
X-Rspamd-Queue-Id: 50AED1DF84E
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

Convert cachefiles i_ino format strings to use the PRIino format
macro in preparation for the widening of i_ino via kino_t.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/cachefiles/io.c    |  6 +++---
 fs/cachefiles/namei.c | 12 ++++++------
 fs/cachefiles/xattr.c |  2 +-
 3 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/cachefiles/io.c b/fs/cachefiles/io.c
index eaf47851c65f4736a7a27f13c498028c7c8dd1b4..d879b80a0bedc95533ce05361ed8cb79c7ed3826 100644
--- a/fs/cachefiles/io.c
+++ b/fs/cachefiles/io.c
@@ -93,7 +93,7 @@ static int cachefiles_read(struct netfs_cache_resources *cres,
 	object = cachefiles_cres_object(cres);
 	file = cachefiles_cres_file(cres);
 
-	_enter("%pD,%li,%llx,%zx/%llx",
+	_enter("%pD,%llu,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start_pos, len,
 	       i_size_read(file_inode(file)));
 
@@ -214,7 +214,7 @@ static int cachefiles_query_occupancy(struct netfs_cache_resources *cres,
 	file = cachefiles_cres_file(cres);
 	granularity = max_t(size_t, object->volume->cache->bsize, granularity);
 
-	_enter("%pD,%li,%llx,%zx/%llx",
+	_enter("%pD,%llu,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start, len,
 	       i_size_read(file_inode(file)));
 
@@ -294,7 +294,7 @@ int __cachefiles_write(struct cachefiles_object *object,
 	fscache_count_write();
 	cache = object->volume->cache;
 
-	_enter("%pD,%li,%llx,%zx/%llx",
+	_enter("%pD,%llu,%llx,%zx/%llx",
 	       file, file_inode(file)->i_ino, start_pos, len,
 	       i_size_read(file_inode(file)));
 
diff --git a/fs/cachefiles/namei.c b/fs/cachefiles/namei.c
index e5ec90dccc27f71dc19219f7632f3e48eaf51545..ace111f29c6fa006b69a0808764b60a0074db229 100644
--- a/fs/cachefiles/namei.c
+++ b/fs/cachefiles/namei.c
@@ -147,7 +147,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 		}
 		ASSERT(d_backing_inode(subdir));
 
-		_debug("mkdir -> %pd{ino=%lu}",
+		_debug("mkdir -> %pd{ino=%" PRIino "u}",
 		       subdir, d_backing_inode(subdir)->i_ino);
 		if (_is_new)
 			*_is_new = true;
@@ -158,7 +158,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	end_creating_keep(subdir);
 
 	if (!__cachefiles_mark_inode_in_use(NULL, d_inode(subdir))) {
-		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
+		pr_notice("cachefiles: Inode already in use: %pd (B=%" PRIino "x)\n",
 			  subdir, d_inode(subdir)->i_ino);
 		goto mark_error;
 	}
@@ -183,7 +183,7 @@ struct dentry *cachefiles_get_directory(struct cachefiles_cache *cache,
 	    !d_backing_inode(subdir)->i_op->unlink)
 		goto check_error;
 
-	_leave(" = [%lu]", d_backing_inode(subdir)->i_ino);
+	_leave(" = [%" PRIino "u]", d_backing_inode(subdir)->i_ino);
 	return subdir;
 
 check_error:
@@ -529,7 +529,7 @@ static bool cachefiles_create_file(struct cachefiles_object *object)
 
 	set_bit(FSCACHE_COOKIE_NEEDS_UPDATE, &object->cookie->flags);
 	set_bit(CACHEFILES_OBJECT_USING_TMPFILE, &object->flags);
-	_debug("create -> %pD{ino=%lu}", file, file_inode(file)->i_ino);
+	_debug("create -> %pD{ino=%" PRIino "u}", file, file_inode(file)->i_ino);
 	object->file = file;
 	return true;
 }
@@ -549,7 +549,7 @@ static bool cachefiles_open_file(struct cachefiles_object *object,
 	_enter("%pd", dentry);
 
 	if (!cachefiles_mark_inode_in_use(object, d_inode(dentry))) {
-		pr_notice("cachefiles: Inode already in use: %pd (B=%lx)\n",
+		pr_notice("cachefiles: Inode already in use: %pd (B=%" PRIino "x)\n",
 			  dentry, d_inode(dentry)->i_ino);
 		return false;
 	}
@@ -657,7 +657,7 @@ bool cachefiles_look_up_object(struct cachefiles_object *object)
 	if (!ret)
 		return false;
 
-	_leave(" = t [%lu]", file_inode(object->file)->i_ino);
+	_leave(" = t [%" PRIino "u]", file_inode(object->file)->i_ino);
 	return true;
 
 new_file:
diff --git a/fs/cachefiles/xattr.c b/fs/cachefiles/xattr.c
index 52383b1d0ba63d4a09413177d8c0d841b5b5b43c..1cfeadc4f8f0b95ce861a2faf5b7b41b8156cf47 100644
--- a/fs/cachefiles/xattr.c
+++ b/fs/cachefiles/xattr.c
@@ -179,7 +179,7 @@ int cachefiles_remove_object_xattr(struct cachefiles_cache *cache,
 			ret = 0;
 		else if (ret != -ENOMEM)
 			cachefiles_io_error(cache,
-					    "Can't remove xattr from %lu"
+					    "Can't remove xattr from %" PRIino "u"
 					    " (error %d)",
 					    d_backing_inode(dentry)->i_ino, -ret);
 	}

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
