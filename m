Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kAI9AwH3pWmkIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:45:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EA601E088B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pNN8jjVogzA+kgGqNQt5mt7cQ4P3GjbhRuqzLdVDoBU=; b=eEBtNOpKTKcZCnaOrNiF6BYkpi
	hFha9UEAdWdGyV8I9waGUF/WLRzIEWy3uMRISH+jrognZYIlRox8ckAANOaqXGf5LfB8yo2pIma/u
	ckd6ZRqzSxLz34/dNhJFtl6GcEAhTARwpo94zkjAMrKLSXzuE2dfYMuN/GWZtYEydCdY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA9G-0003at-JH;
	Mon, 02 Mar 2026 20:45:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA9F-0003ab-7T;
 Mon, 02 Mar 2026 20:45:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0f+FPaAjJsTEMdpl9as50SzMo85wC8aIF4RrAro20ak=; b=FsmelVuUhDSPPvBnSNxj7ECPTF
 J7Qvp3tvBwjW8FrBax8wd+L+THGr5Jp1Xi0UwOW/TSS7hUIERYii4X72BG5Nu7iaBniOczCNHiSHw
 WgYWw1CSQJ8mekrWWZpRMHFUZ8S7Xaih2GOSue0flGbAWdSNWF73/nVUEq/2TI79ruTE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0f+FPaAjJsTEMdpl9as50SzMo85wC8aIF4RrAro20ak=; b=jVUhC63OOl+ZxRWKEtmCDoRDQO
 SF2r7XI0AO/TtpOa+VIihbYQUmFmcpZw/ZyRAZIwUY1r5AWFX2zTfYXwFShLfEac5eL+daNkreIvs
 5BEbNDzqjMkaiN6MX7HkteRzIKvy6b6/FpmEQKeZ4WxYzKtIpXL2JMErvMVDABd2fyB8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA9D-0006hO-4V; Mon, 02 Mar 2026 20:45:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 506766132F;
 Mon,  2 Mar 2026 20:45:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB9E5C19425;
 Mon,  2 Mar 2026 20:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484336;
 bh=GisfDvIMJS5+/ACR6XGt6OCvg/VPhMFu0yCg5/zEC50=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=d8pF+XiAxxr5Rd6pQVJKLalnobSDcbvAKp7+uPSnJED0FReFWYFYpEORS8k0pwIqB
 YZHzvmCBs6dVFXO9QXSd70XKUDaz3xDROfqfmr/MUnvyxVorS44POhT8CYOWQ2k9AB
 suUyfu12Q0CGQSNjZPBklFgI3+OexDnF1iet8YNlUt+woxx1CRDBsLOFZ+tPgCyywk
 /75nyQP+/1HvQkeaSBY3kM/Cx67T8SYk7/aMgkHYSwMh1mmVdGedbXic/WXDRB5Y+r
 dFGjYxzs4s52/N1vRMV9HBLBi0AVw/P/8Mqi+8PFWvXQz2YuJs1s+DJCdjzYaM9K4B
 I3bQ59DG2FizA==
Date: Mon, 02 Mar 2026 15:25:10 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-86-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2692; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=GisfDvIMJS5+/ACR6XGt6OCvg/VPhMFu0yCg5/zEC50=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfIG9oWwNKw+7hnDwGQdVh7GuK9QLizbtdRLK
 yabNEQe8VaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXyBgAKCRAADmhBGVaC
 FbDcEAChwPefJDL+u2bmVreu8DWYGyQ8npBbLa81Vem1c4WA6LYCYxDVDGCeAxPXrS6+lAJtZPv
 eVf9lhme77ZJuIjxbm4gZ/zpawMnPWl+qZYybB3T9WQ8KgsWx3sRKvc1csYXukuesFoTYjNNxRP
 sr88BlCeZD+RLp8Zn5n0BOCW+ChiZEubHaHo9Fv/NgjV73ahYqW7bSWN5+q0eykiDClNtvJYhFV
 jtXZA7qcS6Dt+S2V+sR6KOjZGaotQNDH5I2UOpuOpDGTIEMT+GmvY/tR7vI6CAWWFNFRev1jgA0
 Q3kmAkwrBPaWToV9sExBMIvAjTdx2mT3GUn7eISMCU8bXtfw36MLqCav3dutjCOREaLQjqaczok
 d653t1zQLh0Wfar6y3VgjsDBQceqDh/2hj6l/csE694vTuvcjgNGmAtVhuC5VNWcOon3Rjxr0Nk
 DXPWZKevZWeId2Lq0kz+880etRXEeIa4vCrGMGoF7sCbH0ErDMrHNK4z658CjqErRdZjT+yHIPc
 yHVd50g9/hsbvwYD3hKtlw3qCoDQ/XgAp9gLqMGMBQXRGjU2lSuJHX3yXxrsvGBOianeXJZ4/bd
 elCq3IKPa4PKIK91kx4NtdhXR42XE05iXjZyBVLebErmWVU2IdNLEEfu0N5kt3di8z2KUXsusjJ
 g6/cfvTu2mdTqvQ==
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
 replace all uses in hpfs with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/hpfs/dir.c | 2 +- fs/hpfs/dnode.c
 | 2 +- fs/hpfs/ea.c | 2 +- fs/hpfs/inode.c | 2 +- 4 files changed,
 4 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1vxA9D-0006hO-4V
Subject: [f2fs-dev] [PATCH v2 086/110] hpfs: replace PRIino with %llu/%llx
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
X-Rspamd-Queue-Id: 6EA601E088B
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
replace all uses in hpfs with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/hpfs/dir.c   | 2 +-
 fs/hpfs/dnode.c | 2 +-
 fs/hpfs/ea.c    | 2 +-
 fs/hpfs/inode.c | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/hpfs/dir.c b/fs/hpfs/dir.c
index 9db0e7a101c2a8d9cc265c14ed74c58533ab31ff..3bf11202e2d3c585a3f1aefb5180da82fd7d4a3f 100644
--- a/fs/hpfs/dir.c
+++ b/fs/hpfs/dir.c
@@ -96,7 +96,7 @@ static int hpfs_readdir(struct file *file, struct dir_context *ctx)
 		}
 		if (!fnode_is_dir(fno)) {
 			e = 1;
-			hpfs_error(inode->i_sb, "not a directory, fnode %08" PRIino "x",
+			hpfs_error(inode->i_sb, "not a directory, fnode %08llx",
 					inode->i_ino);
 		}
 		if (hpfs_inode->i_dno != le32_to_cpu(fno->u.external[0].disk_secno)) {
diff --git a/fs/hpfs/dnode.c b/fs/hpfs/dnode.c
index 5df10c82f84ca40c4d65b97b6c6b61ec364029b5..8c6aa060fd874ac9ac844268b016491204d978fd 100644
--- a/fs/hpfs/dnode.c
+++ b/fs/hpfs/dnode.c
@@ -550,7 +550,7 @@ static void delete_empty_dnode(struct inode *i, dnode_secno dno)
 			if (hpfs_sb(i->i_sb)->sb_chk)
 				if (up != i->i_ino) {
 					hpfs_error(i->i_sb,
-						   "bad pointer to fnode, dnode %08x, pointing to %08x, should be %08" PRIino "x",
+						   "bad pointer to fnode, dnode %08x, pointing to %08x, should be %08llx",
 						   dno, up,
 						   i->i_ino);
 					return;
diff --git a/fs/hpfs/ea.c b/fs/hpfs/ea.c
index f4fce87110d77c6af47fd45e024fb913c09e82f7..4664f9ab06eef3795b33cebcdc57e598cf83b0e9 100644
--- a/fs/hpfs/ea.c
+++ b/fs/hpfs/ea.c
@@ -245,7 +245,7 @@ void hpfs_set_ea(struct inode *inode, struct fnode *fnode, const char *key,
 		fnode->ea_offs = cpu_to_le16(0xc4);
 	}
 	if (le16_to_cpu(fnode->ea_offs) < 0xc4 || le16_to_cpu(fnode->ea_offs) + le16_to_cpu(fnode->acl_size_s) + le16_to_cpu(fnode->ea_size_s) > 0x200) {
-		hpfs_error(s, "fnode %08" PRIino "x: ea_offs == %03x, ea_size_s == %03x",
+		hpfs_error(s, "fnode %08llx: ea_offs == %03x, ea_size_s == %03x",
 			inode->i_ino,
 			le16_to_cpu(fnode->ea_offs), le16_to_cpu(fnode->ea_size_s));
 		return;
diff --git a/fs/hpfs/inode.c b/fs/hpfs/inode.c
index c82f5f7f435a1a6f6c26fc62ff0c680c26c9f4ad..0e932cc8be1b28353cffd8e62e26f77a02394edb 100644
--- a/fs/hpfs/inode.c
+++ b/fs/hpfs/inode.c
@@ -250,7 +250,7 @@ void hpfs_write_inode_nolock(struct inode *i)
 			hpfs_brelse4(&qbh);
 		} else
 			hpfs_error(i->i_sb,
-				"directory %08" PRIino "x doesn't have '.' entry",
+				"directory %08llx doesn't have '.' entry",
 				i->i_ino);
 	}
 	mark_buffer_dirty(bh);

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
