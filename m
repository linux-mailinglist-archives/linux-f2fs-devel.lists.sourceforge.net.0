Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qC8CCFL3pWkEIgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:47:14 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AD781E09DF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:47:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gjidTKe31FrjErO8mlzIDXBPejIM4KqQztB9z3Ml6Ik=; b=DDxX5uzdHDTf03//gXNiUymvgA
	1ylnSa+f1I93uciNFfq7vINNmq5NOMBHMB+UvUspiPcUSyzd984P0+cEdrhVROiJiTOUg1alHDo8K
	E73IQADDHHJJ77iy3Y1lFfQGNdzypyk+w3OuHaNrrWqxLkxb3jFWpjP5Sw16iAudpZxs=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxAAY-0003j5-FG;
	Mon, 02 Mar 2026 20:47:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxAAX-0003ig-HN;
 Mon, 02 Mar 2026 20:47:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bFaD7sjS7sfimEKOYa5+6i82qhBzvyU2XQtixt9c5iQ=; b=Vp1hc72imNsqHm8toOmcfWn88N
 NpVkP8l/LNLBB+DhkksTCxQNjEdWFkKY5Tj+rRZIKR5dWIbqY++dSjC+P+H8xDkGRhZsF71zv0ikH
 SBo3tqAnnFoQ3/qTx+3hbgj8c9akZW0EzMk0Ecz+0TnN8jhLeadq0akBproHi+/eaSVM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bFaD7sjS7sfimEKOYa5+6i82qhBzvyU2XQtixt9c5iQ=; b=nShAQiaJq/7eqXHaaqog4aseUH
 RSvWt1bvuWq4yns5u1HReCnJFDrFQHC9tciDHYo8j45JbeP0DnPtBhOfdz57649WxWH7sz8Dzmy9R
 hWpTQxq/fhyhKq98xoHV3aEClWXm1kIm62kjQtLtuEJoMdRrh/RjCLBd0n6kU9dbAcfQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxAAV-0006qN-IB; Mon, 02 Mar 2026 20:47:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 34FE943B9D;
 Mon,  2 Mar 2026 20:47:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E88BBC2BCB5;
 Mon,  2 Mar 2026 20:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484422;
 bh=oqS9QCg9tNmYBpy8UvwdK8zGUnF+eDzx/i9FXGO/+NE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ambSviBjmCNOk2xXOf+nbet7ut3aY5kYin6cYiQEteMyYXzmNBttnALg2M4Xxw/i+
 xggPLGKocc224mtCMRZsty2EiRAB2oMlOk4zzemvCltwJ7/ucAR1ntsajehYzEsknw
 KwZUPHkK/S3Ti9fnei4Hc140jc80cuTALDU1qcx3m3hJc1SIBjv6Ysr9al2qul8l7D
 wV8MKIk8MM0CcD5fbuRZCOzXA8QY0l9XSoGiWNJFX8dhE1M4UI7eXgUpBJoxSyQi2m
 l80+gaEUFDBf60BEkoo+/oD3sXNYEGTCZdVXExhxfkOIvZBm2iInrtdQbzzz0Kc+O9
 73Ra1j8td5Efw==
Date: Mon, 02 Mar 2026 15:25:16 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-92-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12030; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=oqS9QCg9tNmYBpy8UvwdK8zGUnF+eDzx/i9FXGO/+NE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfIIj81VxxMGzhEZ8rAVGcYo7t3Bf8RZm//xr
 Fh4EJj3nFeJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXyCAAKCRAADmhBGVaC
 Fei3D/4wQsOGhcBSZj1b0ZsugS9tZtv8BCz0qm495sOCVFVK6YtC8n6F/VSVFgwg5sL1qtMl3VS
 6jEVUa0opP1CekoyqC/kE3lbCPLd5Q77Ol4H50/ZjTjfCcP0ml1W5m/7nYgZwSMeootACnqCmMu
 QE8ASYqomYlLtYLIM4+mdEZg/JIVmQPMG2N8BPend9rXOiR3xgh+78HEBsGLONI4XLkI9yvk8aY
 8uuVtJxCk0BlZc48sSzcsX2iCnxxv+gJx+bGpzflfdkakD8DFD6UkSXGIElmu8mHXFBca4R6IF/
 OdAIABvb2rD8HoOB4raSQZhp1AtqtMI/YD3Ks+sVRENXgTm1yc8E23s5+rpiIo3GxtXcYE6JKiF
 2tx6HaxLYI1MTiBzk1TrOMtvSSZSpXm+RfXRnudO/NgZ498jDMt4/vtaNJdTqAZuYyB5KB/3aht
 j4vxSd5DoKTpAIl4NYZyBU6zjw//Y6zDWoYDGcv96K81P5SJ0qz4dMHZT/HItjOtjOWcw0MIM2Z
 Rta4q357T3iCydta3+cNFEbSdAYOlmWhh03+doo2FKeswDWfRVtrHxEPN4+/ImPCYS5FcamCIEy
 uqv3BipzONX947eUI8oaT0TrY/sq7WV015zEmJPpU3QND5ZkZbF7M/wI0rSkdI4jxQWAxmF4E6G
 mhRwe7ufflieqxQ==
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
 replace all uses in ocfs2 with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/ocfs2/alloc.c | 2 +- fs/ocfs2/aops.c
 | 4 ++-- fs/ocfs2/dir.c | 8 ++++---- fs/ocfs2/dlmfs/dlmfs.c | 10 +++++-----
 fs/ocfs2/extent_map.c | 12 +++++ [...] 
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
X-Headers-End: 1vxAAV-0006qN-IB
Subject: [f2fs-dev] [PATCH v2 092/110] ocfs2: replace PRIino with %llu/%llx
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
X-Rspamd-Queue-Id: 2AD781E09DF
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
replace all uses in ocfs2 with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/ocfs2/alloc.c        |  2 +-
 fs/ocfs2/aops.c         |  4 ++--
 fs/ocfs2/dir.c          |  8 ++++----
 fs/ocfs2/dlmfs/dlmfs.c  | 10 +++++-----
 fs/ocfs2/extent_map.c   | 12 ++++++------
 fs/ocfs2/inode.c        |  2 +-
 fs/ocfs2/refcounttree.c | 10 +++++-----
 fs/ocfs2/xattr.c        |  4 ++--
 8 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/fs/ocfs2/alloc.c b/fs/ocfs2/alloc.c
index d7703549645b548d9f5d77b2214a9a7c0af0ef6f..d40f5d205bce3675ffd37e0e6c228e88c1804a1a 100644
--- a/fs/ocfs2/alloc.c
+++ b/fs/ocfs2/alloc.c
@@ -7318,7 +7318,7 @@ int ocfs2_commit_truncate(struct ocfs2_super *osb,
 		 * to check it up here before changing the tree.
 		*/
 		if (root_el->l_tree_depth && rec->e_int_clusters == 0) {
-			mlog(ML_ERROR, "Inode %" PRIino "u has an empty "
+			mlog(ML_ERROR, "Inode %llu has an empty "
 				    "extent record, depth %u\n", inode->i_ino,
 				    le16_to_cpu(root_el->l_tree_depth));
 			status = ocfs2_remove_rightmost_empty_extent(osb,
diff --git a/fs/ocfs2/aops.c b/fs/ocfs2/aops.c
index aea35b1c9fa3ce7327672c1862d0d1201c895c40..c7ad912ec7a0d6fffd09c3d38f110e5d1517d829 100644
--- a/fs/ocfs2/aops.c
+++ b/fs/ocfs2/aops.c
@@ -137,7 +137,7 @@ int ocfs2_get_block(struct inode *inode, sector_t iblock,
 			      (unsigned long long)iblock, bh_result, create);
 
 	if (OCFS2_I(inode)->ip_flags & OCFS2_INODE_SYSTEM_FILE)
-		mlog(ML_NOTICE, "get_block on system inode 0x%p (%" PRIino "u)\n",
+		mlog(ML_NOTICE, "get_block on system inode 0x%p (%llu)\n",
 		     inode, inode->i_ino);
 
 	if (S_ISLNK(inode->i_mode)) {
@@ -2146,7 +2146,7 @@ static int ocfs2_dio_wr_get_block(struct inode *inode, sector_t iblock,
 	    ((iblock + ((len - 1) >> i_blkbits)) > endblk))
 		len = (endblk - iblock + 1) << i_blkbits;
 
-	mlog(0, "get block of %" PRIino "u at %llu:%u req %u\n",
+	mlog(0, "get block of %llu at %llu:%u req %u\n",
 			inode->i_ino, pos, len, total_len);
 
 	/*
diff --git a/fs/ocfs2/dir.c b/fs/ocfs2/dir.c
index eecb2b1d2ec17fb4b3f09abb9e168d2f28f9b420..b82fe4431eb1f0811d81525237d02c5a3f3b021c 100644
--- a/fs/ocfs2/dir.c
+++ b/fs/ocfs2/dir.c
@@ -794,7 +794,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 	if (le16_to_cpu(el->l_count) !=
 	    ocfs2_extent_recs_per_dx_root(inode->i_sb)) {
 		ret = ocfs2_error(inode->i_sb,
-				  "Inode %" PRIino "u has invalid extent list length %u\n",
+				  "Inode %llu has invalid extent list length %u\n",
 				  inode->i_ino, le16_to_cpu(el->l_count));
 		goto out;
 	}
@@ -812,7 +812,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 
 		if (el->l_tree_depth) {
 			ret = ocfs2_error(inode->i_sb,
-					  "Inode %" PRIino "u has non zero tree depth in btree tree block %llu\n",
+					  "Inode %llu has non zero tree depth in btree tree block %llu\n",
 					  inode->i_ino,
 					  (unsigned long long)eb_bh->b_blocknr);
 			goto out;
@@ -821,7 +821,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 
 	if (le16_to_cpu(el->l_next_free_rec) == 0) {
 		ret = ocfs2_error(inode->i_sb,
-				  "Inode %" PRIino "u has empty extent list at depth %u\n",
+				  "Inode %llu has empty extent list at depth %u\n",
 				  inode->i_ino,
 				  le16_to_cpu(el->l_tree_depth));
 		goto out;
@@ -839,7 +839,7 @@ static int ocfs2_dx_dir_lookup_rec(struct inode *inode,
 
 	if (!found) {
 		ret = ocfs2_error(inode->i_sb,
-				  "Inode %" PRIino "u has bad extent record (%u, %u, 0) in btree\n",
+				  "Inode %llu has bad extent record (%u, %u, 0) in btree\n",
 				  inode->i_ino,
 				  le32_to_cpu(rec->e_cpos),
 				  ocfs2_rec_clusters(el, rec));
diff --git a/fs/ocfs2/dlmfs/dlmfs.c b/fs/ocfs2/dlmfs/dlmfs.c
index e96c1c574ff7dc3dffad58ce8536b7e337d3f6fa..5821e33df78fd92fabc7fe7fa1c3b3c62c50f9f8 100644
--- a/fs/ocfs2/dlmfs/dlmfs.c
+++ b/fs/ocfs2/dlmfs/dlmfs.c
@@ -123,7 +123,7 @@ static int dlmfs_file_open(struct inode *inode,
 	if (S_ISDIR(inode->i_mode))
 		BUG();
 
-	mlog(0, "open called on inode %" PRIino "u, flags 0x%x\n", inode->i_ino,
+	mlog(0, "open called on inode %llu, flags 0x%x\n", inode->i_ino,
 		file->f_flags);
 
 	status = dlmfs_decode_open_flags(file->f_flags, &level, &flags);
@@ -170,7 +170,7 @@ static int dlmfs_file_release(struct inode *inode,
 	if (S_ISDIR(inode->i_mode))
 		BUG();
 
-	mlog(0, "close called on inode %" PRIino "u\n", inode->i_ino);
+	mlog(0, "close called on inode %llu\n", inode->i_ino);
 
 	if (fp) {
 		level = fp->fp_lock_level;
@@ -242,7 +242,7 @@ static ssize_t dlmfs_file_write(struct file *filp,
 	int bytes_left;
 	struct inode *inode = file_inode(filp);
 
-	mlog(0, "inode %" PRIino "u, count = %zu, *ppos = %llu\n",
+	mlog(0, "inode %llu, count = %zu, *ppos = %llu\n",
 		inode->i_ino, count, *ppos);
 
 	if (*ppos >= DLM_LVB_LEN)
@@ -301,7 +301,7 @@ static void dlmfs_evict_inode(struct inode *inode)
 
 	clear_inode(inode);
 
-	mlog(0, "inode %" PRIino "u\n", inode->i_ino);
+	mlog(0, "inode %llu\n", inode->i_ino);
 
 	ip = DLMFS_I(inode);
 	lockres = &ip->ip_lockres;
@@ -490,7 +490,7 @@ static int dlmfs_unlink(struct inode *dir,
 	int status;
 	struct inode *inode = d_inode(dentry);
 
-	mlog(0, "unlink inode %" PRIino "u\n", inode->i_ino);
+	mlog(0, "unlink inode %llu\n", inode->i_ino);
 
 	/* if there are no current holders, or none that are waiting
 	 * to acquire a lock, this basically destroys our lockres. */
diff --git a/fs/ocfs2/extent_map.c b/fs/ocfs2/extent_map.c
index 3cf93a08f7a8946810ccd2de246be4d07a23b53b..eb5dcd17d43752c08eab423fd667b7c0363ba6a1 100644
--- a/fs/ocfs2/extent_map.c
+++ b/fs/ocfs2/extent_map.c
@@ -291,7 +291,7 @@ static int ocfs2_last_eb_is_empty(struct inode *inode,
 
 	if (el->l_tree_depth) {
 		ocfs2_error(inode->i_sb,
-			    "Inode %" PRIino "u has non zero tree depth in leaf block %llu\n",
+			    "Inode %llu has non zero tree depth in leaf block %llu\n",
 			    inode->i_ino,
 			    (unsigned long long)eb_bh->b_blocknr);
 		ret = -EROFS;
@@ -427,7 +427,7 @@ static int ocfs2_get_clusters_nocache(struct inode *inode,
 
 		if (el->l_tree_depth) {
 			ocfs2_error(inode->i_sb,
-				    "Inode %" PRIino "u has non zero tree depth in leaf block %llu\n",
+				    "Inode %llu has non zero tree depth in leaf block %llu\n",
 				    inode->i_ino,
 				    (unsigned long long)eb_bh->b_blocknr);
 			ret = -EROFS;
@@ -437,7 +437,7 @@ static int ocfs2_get_clusters_nocache(struct inode *inode,
 
 	if (le16_to_cpu(el->l_next_free_rec) > le16_to_cpu(el->l_count)) {
 		ocfs2_error(inode->i_sb,
-			    "Inode %" PRIino "u has an invalid extent (next_free_rec %u, count %u)\n",
+			    "Inode %llu has an invalid extent (next_free_rec %u, count %u)\n",
 			    inode->i_ino,
 			    le16_to_cpu(el->l_next_free_rec),
 			    le16_to_cpu(el->l_count));
@@ -472,7 +472,7 @@ static int ocfs2_get_clusters_nocache(struct inode *inode,
 
 	if (!rec->e_blkno) {
 		ocfs2_error(inode->i_sb,
-			    "Inode %" PRIino "u has bad extent record (%u, %u, 0)\n",
+			    "Inode %llu has bad extent record (%u, %u, 0)\n",
 			    inode->i_ino,
 			    le32_to_cpu(rec->e_cpos),
 			    ocfs2_rec_clusters(el, rec));
@@ -561,7 +561,7 @@ int ocfs2_xattr_get_clusters(struct inode *inode, u32 v_cluster,
 
 		if (el->l_tree_depth) {
 			ocfs2_error(inode->i_sb,
-				    "Inode %" PRIino "u has non zero tree depth in xattr leaf block %llu\n",
+				    "Inode %llu has non zero tree depth in xattr leaf block %llu\n",
 				    inode->i_ino,
 				    (unsigned long long)eb_bh->b_blocknr);
 			ret = -EROFS;
@@ -580,7 +580,7 @@ int ocfs2_xattr_get_clusters(struct inode *inode, u32 v_cluster,
 
 		if (!rec->e_blkno) {
 			ocfs2_error(inode->i_sb,
-				    "Inode %" PRIino "u has bad extent record (%u, %u, 0) in xattr\n",
+				    "Inode %llu has bad extent record (%u, %u, 0) in xattr\n",
 				    inode->i_ino,
 				    le32_to_cpu(rec->e_cpos),
 				    ocfs2_rec_clusters(el, rec));
diff --git a/fs/ocfs2/inode.c b/fs/ocfs2/inode.c
index c3076b450de3599291c386ceeb8b2d26e8680904..26025ba2656c66b61866deaff60a0da204745c4f 100644
--- a/fs/ocfs2/inode.c
+++ b/fs/ocfs2/inode.c
@@ -1196,7 +1196,7 @@ static void ocfs2_clear_inode(struct inode *inode)
 				inode->i_nlink);
 
 	mlog_bug_on_msg(osb == NULL,
-			"Inode=%" PRIino "u\n", inode->i_ino);
+			"Inode=%llu\n", inode->i_ino);
 
 	dquot_drop(inode);
 
diff --git a/fs/ocfs2/refcounttree.c b/fs/ocfs2/refcounttree.c
index 1586c42fdabe70056bf7f103d583dd9000fe9510..6d7f44d3e929d94f3ba6121cc30a867887e0bbe3 100644
--- a/fs/ocfs2/refcounttree.c
+++ b/fs/ocfs2/refcounttree.c
@@ -2341,7 +2341,7 @@ static int ocfs2_mark_extent_refcounted(struct inode *inode,
 					   cpos, len, phys);
 
 	if (!ocfs2_refcount_tree(OCFS2_SB(inode->i_sb))) {
-		ret = ocfs2_error(inode->i_sb, "Inode %" PRIino "u want to use refcount tree, but the feature bit is not set in the super block\n",
+		ret = ocfs2_error(inode->i_sb, "Inode %llu want to use refcount tree, but the feature bit is not set in the super block\n",
 				  inode->i_ino);
 		goto out;
 	}
@@ -2524,7 +2524,7 @@ int ocfs2_prepare_refcount_change_for_del(struct inode *inode,
 	u64 start_cpos = ocfs2_blocks_to_clusters(inode->i_sb, phys_blkno);
 
 	if (!ocfs2_refcount_tree(OCFS2_SB(inode->i_sb))) {
-		ret = ocfs2_error(inode->i_sb, "Inode %" PRIino "u want to use refcount tree, but the feature bit is not set in the super block\n",
+		ret = ocfs2_error(inode->i_sb, "Inode %llu want to use refcount tree, but the feature bit is not set in the super block\n",
 				  inode->i_ino);
 		goto out;
 	}
@@ -2650,7 +2650,7 @@ static int ocfs2_refcount_cal_cow_clusters(struct inode *inode,
 
 		if (el->l_tree_depth) {
 			ret = ocfs2_error(inode->i_sb,
-					  "Inode %" PRIino "u has non zero tree depth in leaf block %llu\n",
+					  "Inode %llu has non zero tree depth in leaf block %llu\n",
 					  inode->i_ino,
 					  (unsigned long long)eb_bh->b_blocknr);
 			goto out;
@@ -2662,7 +2662,7 @@ static int ocfs2_refcount_cal_cow_clusters(struct inode *inode,
 		rec = &el->l_recs[i];
 
 		if (ocfs2_is_empty_extent(rec)) {
-			mlog_bug_on_msg(i != 0, "Inode %" PRIino "u has empty record in "
+			mlog_bug_on_msg(i != 0, "Inode %llu has empty record in "
 					"index %d\n", inode->i_ino, i);
 			continue;
 		}
@@ -3325,7 +3325,7 @@ static int ocfs2_replace_cow(struct ocfs2_cow_context *context)
 	struct ocfs2_super *osb = OCFS2_SB(inode->i_sb);
 
 	if (!ocfs2_refcount_tree(osb)) {
-		return ocfs2_error(inode->i_sb, "Inode %" PRIino "u want to use refcount tree, but the feature bit is not set in the super block\n",
+		return ocfs2_error(inode->i_sb, "Inode %llu want to use refcount tree, but the feature bit is not set in the super block\n",
 				   inode->i_ino);
 	}
 
diff --git a/fs/ocfs2/xattr.c b/fs/ocfs2/xattr.c
index 74cd6dd57abf71a69adef18863d057e48496ccfe..4d55ad963ac514b4b4081447af0992345facd83a 100644
--- a/fs/ocfs2/xattr.c
+++ b/fs/ocfs2/xattr.c
@@ -3741,7 +3741,7 @@ static int ocfs2_xattr_get_rec(struct inode *inode,
 
 		if (el->l_tree_depth) {
 			ret = ocfs2_error(inode->i_sb,
-					  "Inode %" PRIino "u has non zero tree depth in xattr tree block %llu\n",
+					  "Inode %llu has non zero tree depth in xattr tree block %llu\n",
 					  inode->i_ino,
 					  (unsigned long long)eb_bh->b_blocknr);
 			goto out;
@@ -3758,7 +3758,7 @@ static int ocfs2_xattr_get_rec(struct inode *inode,
 	}
 
 	if (!e_blkno) {
-		ret = ocfs2_error(inode->i_sb, "Inode %" PRIino "u has bad extent record (%u, %u, 0) in xattr\n",
+		ret = ocfs2_error(inode->i_sb, "Inode %llu has bad extent record (%u, %u, 0) in xattr\n",
 				  inode->i_ino,
 				  le32_to_cpu(rec->e_cpos),
 				  ocfs2_rec_clusters(el, rec));

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
