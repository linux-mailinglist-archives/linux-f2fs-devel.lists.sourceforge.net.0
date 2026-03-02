Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cAdVFRv2pWmkIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:42:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B66C61E044B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:42:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qsf2rfRgjC0d8ugbe+RAePILzQ/FzGVgTltc5OJOkic=; b=he7Ykfe1qjzVQ00bHI1UhRRrWt
	H799VYIovfRWiu/KuJG/k/lDCuJTfOSc3llbalR7eUJfp9vqc6yPoKTMINqIXDPOzZxTDOQJ0chSW
	7/0XUToGl7/BFnagouW/N+mXgrX45+zp2CCQOhufknVlL3jYWQ2rSuEEFuS7XU/IFvYU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA5Y-0004Cq-Jn;
	Mon, 02 Mar 2026 20:42:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA5V-0004By-AC;
 Mon, 02 Mar 2026 20:41:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=87ihwadu12RwMh1f+CD9Cci7xtbgwi60tE+T+BS0JHo=; b=a1uxFvCeM7widJNzsQLJjoT6p3
 bJpjooorzE5EdQ1d62gdW0Q0yk0TF0qQaEyXT7hfNEBFoGY+S9qN92JxZ/G5Gao+ScT9PJzyHGCso
 N5l/J3rbIwvVy4w1mOK/6bdGW207emnG+EmX+6GYvt+8GYD3TC3RsLpbl93RXv8KA/eI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=87ihwadu12RwMh1f+CD9Cci7xtbgwi60tE+T+BS0JHo=; b=b04M1MCrMJbP4N2upn8IRoCeZZ
 YoY2cCC8ETjH1rwe4dq/0ni2AOXVTp2KEVJ8n0hOi8Tx/Gw8zk9QA74u2JKCddEv1MY8aRh/QUw61
 Uu5BwlwdbCWqOnjwnTDextKvFB5qqqqUJHGxL61es/PNsQhHfjhf+MaAlJ/LnTT0neqs=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA5V-0006JC-46; Mon, 02 Mar 2026 20:41:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9F46241909;
 Mon,  2 Mar 2026 20:41:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69E3CC2BCB5;
 Mon,  2 Mar 2026 20:41:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772484106;
 bh=vNkzHuGLAk6SRSLBijwmtGmdFlDfgPU49VRuVG8BzJA=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=X/phi7giFaiaj1D5rEFCicJuPbTWAsn004MqbAjC0lc7T3FifsJTWN6txiKvvhPxR
 oIB8oR1w/cMe51tLB8DbblN3yOgcW4zdAnbjf5yO4FCsvs5RMrq0qTihvN2IseYp40
 +QunU7MlsngzRdOyWxLaFxrJVOED606+Nr+pIr+mZKTzfVojHse/GuifEIFhh1hUKn
 A/5CxguwtMB2GqqnCaIVPuZ8bqQZmmsgab86o88A3MEM2rlxJQEPPclKHNjtulT8qj
 i+E9qCaozbnzrTSAInWiG5fTyZXUKm2QpPYfZqjb9hAn7PUwtwMGxcOGcBAslnC8+p
 f0evqvl1eIhKw==
Date: Mon, 02 Mar 2026 15:24:54 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-70-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=12112; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=vNkzHuGLAk6SRSLBijwmtGmdFlDfgPU49VRuVG8BzJA=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfICX1Jxnt0SgWXJk6o0J3qu6igz5r+jH8R/L
 pnDRJJlhteJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXyAgAKCRAADmhBGVaC
 FdM5EADXgpT6XXk4/t6U1lGf/D91W3n6UCz5rUXRXJvxglEv4H2rIa4+9wcmkUfftfPhsOiPXhQ
 CYcCa+mL1tE5ShaNZijMFX1p78taK83nEzxe6bP4j/iJPiXBwfpvKwS6Sq2rcTFfwmJ3FXKrEhO
 PH3duzRbwNBvAmHPMj8EAWexWj4ASOMuUZdK6jXjYyFrSN+a/MCBai+8yYabyGOo4cMepM6wdTx
 JSiYjJiq8M+YN8GvqxmDiAk4FpyHJqEMGx3ruCWks3LuPHakheWi+qndFj6c6G77jUJrue/C5mf
 FhvsCWRlJEIKH8jTgtdyJWt5mDRuiKuh3iO+HflCjHlw/jb+Q18gipr/Yv3WFHyPG1gKBjpP46D
 BKFnIxHLsDlD52tUH2S4iXa76L0j+hgk0NS8GFFLhO9ifPYZsgit8R8oaTvovtbqj3VbmgmDppb
 oCREEYsP4ZMu1wNvM+Fu5CSRlP+WiY/LEMZNosat/fGxfjzsXjlH185lU9hDmsU1bZvVL1Ca8ie
 3hvK7wfHF26GolLrq33oXZY3n57DEqySFiyzBGAmTSZ/zkZX3BQmsi5AM4NmcGxgsq8UAV5Ukgy
 3tz8EmMCwtxdmMYYQtPxpbT0meSfhd1XAEBMSFsN9evDOiLTQ/KjA17PT3PzqoRTn+rMke7e3Yt
 njvdWX9LkqIDaUg==
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
 replace all uses in affs with the concrete format strings. Signed-off-by:
 Jeff Layton <jlayton@kernel.org> --- fs/affs/amigaffs.c | 8 ++++----
 fs/affs/bitmap.c
 | 2 +- fs/affs/dir.c | 2 +- fs/affs/file.c | 20 ++++++++++ fs/affs/inode.c
 | 12 ++++++--- [...] 
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
X-Headers-End: 1vxA5V-0006JC-46
Subject: [f2fs-dev] [PATCH v2 070/110] affs: replace PRIino with %llu/%llx
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
X-Rspamd-Queue-Id: B66C61E044B
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
replace all uses in affs with the concrete format strings.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/affs/amigaffs.c |  8 ++++----
 fs/affs/bitmap.c   |  2 +-
 fs/affs/dir.c      |  2 +-
 fs/affs/file.c     | 20 ++++++++++----------
 fs/affs/inode.c    | 12 ++++++------
 fs/affs/namei.c    | 14 +++++++-------
 fs/affs/symlink.c  |  2 +-
 7 files changed, 30 insertions(+), 30 deletions(-)

diff --git a/fs/affs/amigaffs.c b/fs/affs/amigaffs.c
index 0e1939cf27bba0c10d2b657b94f3cd5dbee1a61c..b401aacaa06744130eb191daf334bdf979fdc0a6 100644
--- a/fs/affs/amigaffs.c
+++ b/fs/affs/amigaffs.c
@@ -33,7 +33,7 @@ affs_insert_hash(struct inode *dir, struct buffer_head *bh)
 	ino = bh->b_blocknr;
 	offset = affs_hash_name(sb, AFFS_TAIL(sb, bh)->name + 1, AFFS_TAIL(sb, bh)->name[0]);
 
-	pr_debug("%s(dir=%" PRIino "u, ino=%d)\n", __func__, dir->i_ino, ino);
+	pr_debug("%s(dir=%llu, ino=%d)\n", __func__, dir->i_ino, ino);
 
 	dir_bh = affs_bread(sb, dir->i_ino);
 	if (!dir_bh)
@@ -83,7 +83,7 @@ affs_remove_hash(struct inode *dir, struct buffer_head *rem_bh)
 	sb = dir->i_sb;
 	rem_ino = rem_bh->b_blocknr;
 	offset = affs_hash_name(sb, AFFS_TAIL(sb, rem_bh)->name+1, AFFS_TAIL(sb, rem_bh)->name[0]);
-	pr_debug("%s(dir=%" PRIino "u, ino=%d, hashval=%d)\n", __func__, dir->i_ino,
+	pr_debug("%s(dir=%llu, ino=%d, hashval=%d)\n", __func__, dir->i_ino,
 		 rem_ino, offset);
 
 	bh = affs_bread(sb, dir->i_ino);
@@ -147,7 +147,7 @@ affs_remove_link(struct dentry *dentry)
 	u32 link_ino, ino;
 	int retval;
 
-	pr_debug("%s(key=%" PRIino "u)\n", __func__, inode->i_ino);
+	pr_debug("%s(key=%llu)\n", __func__, inode->i_ino);
 	retval = -EIO;
 	bh = affs_bread(sb, inode->i_ino);
 	if (!bh)
@@ -279,7 +279,7 @@ affs_remove_header(struct dentry *dentry)
 	if (!inode)
 		goto done;
 
-	pr_debug("%s(key=%" PRIino "u)\n", __func__, inode->i_ino);
+	pr_debug("%s(key=%llu)\n", __func__, inode->i_ino);
 	retval = -EIO;
 	bh = affs_bread(sb, (u32)(long)dentry->d_fsdata);
 	if (!bh)
diff --git a/fs/affs/bitmap.c b/fs/affs/bitmap.c
index 904cd5bc5a4bd5719017bf1820a053557c35d67c..40bc4ce6af4ac9d8dba81809e22516a58f0aaf15 100644
--- a/fs/affs/bitmap.c
+++ b/fs/affs/bitmap.c
@@ -125,7 +125,7 @@ affs_alloc_block(struct inode *inode, u32 goal)
 	sb = inode->i_sb;
 	sbi = AFFS_SB(sb);
 
-	pr_debug("balloc(inode=%" PRIino "u,goal=%u): ", inode->i_ino, goal);
+	pr_debug("balloc(inode=%llu,goal=%u): ", inode->i_ino, goal);
 
 	if (AFFS_I(inode)->i_pa_cnt) {
 		pr_debug("%d\n", AFFS_I(inode)->i_lastalloc+1);
diff --git a/fs/affs/dir.c b/fs/affs/dir.c
index 127741d9cac940a45a832bf78b36296dec77cd40..11e2bac2e391896a32109335530a6af5543a0abe 100644
--- a/fs/affs/dir.c
+++ b/fs/affs/dir.c
@@ -90,7 +90,7 @@ affs_readdir(struct file *file, struct dir_context *ctx)
 	u32			 ino;
 	int			 error = 0;
 
-	pr_debug("%s(ino=%" PRIino "u,f_pos=%llx)\n", __func__, inode->i_ino, ctx->pos);
+	pr_debug("%s(ino=%llu,f_pos=%llx)\n", __func__, inode->i_ino, ctx->pos);
 
 	if (ctx->pos < 2) {
 		data->ino = 0;
diff --git a/fs/affs/file.c b/fs/affs/file.c
index e2129cc3411f1cc6cf8bf29fe6740e619554e420..a51dee9d7d7ec3724c642725812415bd33c76273 100644
--- a/fs/affs/file.c
+++ b/fs/affs/file.c
@@ -24,7 +24,7 @@ static struct buffer_head *affs_get_extblock_slow(struct inode *inode, u32 ext);
 static int
 affs_file_open(struct inode *inode, struct file *filp)
 {
-	pr_debug("open(%" PRIino "u,%d)\n",
+	pr_debug("open(%llu,%d)\n",
 		 inode->i_ino, atomic_read(&AFFS_I(inode)->i_opencnt));
 	atomic_inc(&AFFS_I(inode)->i_opencnt);
 	return 0;
@@ -33,7 +33,7 @@ affs_file_open(struct inode *inode, struct file *filp)
 static int
 affs_file_release(struct inode *inode, struct file *filp)
 {
-	pr_debug("release(%" PRIino "u, %d)\n",
+	pr_debug("release(%llu, %d)\n",
 		 inode->i_ino, atomic_read(&AFFS_I(inode)->i_opencnt));
 
 	if (atomic_dec_and_test(&AFFS_I(inode)->i_opencnt)) {
@@ -301,7 +301,7 @@ affs_get_block(struct inode *inode, sector_t block, struct buffer_head *bh_resul
 	struct buffer_head	*ext_bh;
 	u32			 ext;
 
-	pr_debug("%s(%" PRIino "u, %llu)\n", __func__, inode->i_ino,
+	pr_debug("%s(%llu, %llu)\n", __func__, inode->i_ino,
 		 (unsigned long long)block);
 
 	BUG_ON(block > (sector_t)0x7fffffffUL);
@@ -534,7 +534,7 @@ static int affs_do_read_folio_ofs(struct folio *folio, size_t to, int create)
 	size_t bidx, boff, bsize;
 	u32 tmp;
 
-	pr_debug("%s(%" PRIino "u, %ld, 0, %zu)\n", __func__, inode->i_ino,
+	pr_debug("%s(%llu, %ld, 0, %zu)\n", __func__, inode->i_ino,
 		 folio->index, to);
 	BUG_ON(to > folio_size(folio));
 	bsize = AFFS_SB(sb)->s_data_blksize;
@@ -566,7 +566,7 @@ affs_extent_file_ofs(struct inode *inode, u32 newsize)
 	u32 size, bsize;
 	u32 tmp;
 
-	pr_debug("%s(%" PRIino "u, %d)\n", __func__, inode->i_ino, newsize);
+	pr_debug("%s(%llu, %d)\n", __func__, inode->i_ino, newsize);
 	bsize = AFFS_SB(sb)->s_data_blksize;
 	bh = NULL;
 	size = AFFS_I(inode)->mmu_private;
@@ -634,7 +634,7 @@ static int affs_read_folio_ofs(struct file *file, struct folio *folio)
 	size_t to;
 	int err;
 
-	pr_debug("%s(%" PRIino "u, %ld)\n", __func__, inode->i_ino, folio->index);
+	pr_debug("%s(%llu, %ld)\n", __func__, inode->i_ino, folio->index);
 	to = folio_size(folio);
 	if (folio_pos(folio) + to > inode->i_size) {
 		to = inode->i_size - folio_pos(folio);
@@ -658,7 +658,7 @@ static int affs_write_begin_ofs(const struct kiocb *iocb,
 	pgoff_t index;
 	int err = 0;
 
-	pr_debug("%s(%" PRIino "u, %llu, %llu)\n", __func__, inode->i_ino, pos,
+	pr_debug("%s(%llu, %llu, %llu)\n", __func__, inode->i_ino, pos,
 		 pos + len);
 	if (pos > AFFS_I(inode)->mmu_private) {
 		/* XXX: this probably leaves a too-big i_size in case of
@@ -710,7 +710,7 @@ static int affs_write_end_ofs(const struct kiocb *iocb,
 	 * due to write_begin.
 	 */
 
-	pr_debug("%s(%" PRIino "u, %llu, %llu)\n", __func__, inode->i_ino, pos,
+	pr_debug("%s(%llu, %llu, %llu)\n", __func__, inode->i_ino, pos,
 		 pos + len);
 	bsize = AFFS_SB(sb)->s_data_blksize;
 	data = folio_address(folio);
@@ -854,7 +854,7 @@ affs_free_prealloc(struct inode *inode)
 {
 	struct super_block *sb = inode->i_sb;
 
-	pr_debug("free_prealloc(ino=%" PRIino "u)\n", inode->i_ino);
+	pr_debug("free_prealloc(ino=%llu)\n", inode->i_ino);
 
 	while (AFFS_I(inode)->i_pa_cnt) {
 		AFFS_I(inode)->i_pa_cnt--;
@@ -874,7 +874,7 @@ affs_truncate(struct inode *inode)
 	struct buffer_head *ext_bh;
 	int i;
 
-	pr_debug("truncate(inode=%" PRIino "u, oldsize=%llu, newsize=%llu)\n",
+	pr_debug("truncate(inode=%llu, oldsize=%llu, newsize=%llu)\n",
 		 inode->i_ino, AFFS_I(inode)->mmu_private, inode->i_size);
 
 	last_blk = 0;
diff --git a/fs/affs/inode.c b/fs/affs/inode.c
index 14f6a6352662ba9514a64ea0893e848e79abed63..561fc0185e89c47947c83bd1a56cdc8be46f8d0e 100644
--- a/fs/affs/inode.c
+++ b/fs/affs/inode.c
@@ -32,7 +32,7 @@ struct inode *affs_iget(struct super_block *sb, unsigned long ino)
 	if (!(inode_state_read_once(inode) & I_NEW))
 		return inode;
 
-	pr_debug("affs_iget(%" PRIino "u)\n", inode->i_ino);
+	pr_debug("affs_iget(%llu)\n", inode->i_ino);
 
 	block = inode->i_ino;
 	bh = affs_bread(sb, block);
@@ -171,14 +171,14 @@ affs_write_inode(struct inode *inode, struct writeback_control *wbc)
 	uid_t			 uid;
 	gid_t			 gid;
 
-	pr_debug("write_inode(%" PRIino "u)\n", inode->i_ino);
+	pr_debug("write_inode(%llu)\n", inode->i_ino);
 
 	if (!inode->i_nlink)
 		// possibly free block
 		return 0;
 	bh = affs_bread(sb, inode->i_ino);
 	if (!bh) {
-		affs_error(sb, "write_inode", "Cannot read block %" PRIino "u", inode->i_ino);
+		affs_error(sb, "write_inode", "Cannot read block %llu", inode->i_ino);
 		return -EIO;
 	}
 	tail = AFFS_TAIL(sb, bh);
@@ -219,7 +219,7 @@ affs_notify_change(struct mnt_idmap *idmap, struct dentry *dentry,
 	struct inode *inode = d_inode(dentry);
 	int error;
 
-	pr_debug("notify_change(%" PRIino "u,0x%x)\n", inode->i_ino, attr->ia_valid);
+	pr_debug("notify_change(%llu,0x%x)\n", inode->i_ino, attr->ia_valid);
 
 	error = setattr_prepare(&nop_mnt_idmap, dentry, attr);
 	if (error)
@@ -260,7 +260,7 @@ void
 affs_evict_inode(struct inode *inode)
 {
 	unsigned long cache_page;
-	pr_debug("evict_inode(ino=%" PRIino "u, nlink=%u)\n",
+	pr_debug("evict_inode(ino=%llu, nlink=%u)\n",
 		 inode->i_ino, inode->i_nlink);
 	truncate_inode_pages_final(&inode->i_data);
 
@@ -353,7 +353,7 @@ affs_add_entry(struct inode *dir, struct inode *inode, struct dentry *dentry, s3
 	u32 block = 0;
 	int retval;
 
-	pr_debug("%s(dir=%" PRIino "u, inode=%" PRIino "u, \"%pd\", type=%d)\n", __func__,
+	pr_debug("%s(dir=%llu, inode=%llu, \"%pd\", type=%d)\n", __func__,
 		 dir->i_ino, inode->i_ino, dentry, type);
 
 	retval = -EIO;
diff --git a/fs/affs/namei.c b/fs/affs/namei.c
index 725a005a0aec9d4727b6bf561333b236844ae7ec..8705321926007f559bac1af42fbadca8da67afcc 100644
--- a/fs/affs/namei.c
+++ b/fs/affs/namei.c
@@ -235,7 +235,7 @@ affs_lookup(struct inode *dir, struct dentry *dentry, unsigned int flags)
 int
 affs_unlink(struct inode *dir, struct dentry *dentry)
 {
-	pr_debug("%s(dir=%" PRIino "u, %" PRIino "u \"%pd\")\n", __func__, dir->i_ino,
+	pr_debug("%s(dir=%llu, %llu \"%pd\")\n", __func__, dir->i_ino,
 		 d_inode(dentry)->i_ino, dentry);
 
 	return affs_remove_header(dentry);
@@ -249,7 +249,7 @@ affs_create(struct mnt_idmap *idmap, struct inode *dir,
 	struct inode	*inode;
 	int		 error;
 
-	pr_debug("%s(%" PRIino "u,\"%pd\",0%ho)\n",
+	pr_debug("%s(%llu,\"%pd\",0%ho)\n",
 		 __func__, dir->i_ino, dentry, mode);
 
 	inode = affs_new_inode(dir);
@@ -280,7 +280,7 @@ affs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 	struct inode		*inode;
 	int			 error;
 
-	pr_debug("%s(%" PRIino "u,\"%pd\",0%ho)\n",
+	pr_debug("%s(%llu,\"%pd\",0%ho)\n",
 		 __func__, dir->i_ino, dentry, mode);
 
 	inode = affs_new_inode(dir);
@@ -306,7 +306,7 @@ affs_mkdir(struct mnt_idmap *idmap, struct inode *dir,
 int
 affs_rmdir(struct inode *dir, struct dentry *dentry)
 {
-	pr_debug("%s(dir=%" PRIino "u, %" PRIino "u \"%pd\")\n", __func__, dir->i_ino,
+	pr_debug("%s(dir=%llu, %llu \"%pd\")\n", __func__, dir->i_ino,
 		 d_inode(dentry)->i_ino, dentry);
 
 	return affs_remove_header(dentry);
@@ -323,7 +323,7 @@ affs_symlink(struct mnt_idmap *idmap, struct inode *dir,
 	int			 i, maxlen, error;
 	char			 c, lc;
 
-	pr_debug("%s(%" PRIino "u,\"%pd\" -> \"%s\")\n",
+	pr_debug("%s(%llu,\"%pd\" -> \"%s\")\n",
 		 __func__, dir->i_ino, dentry, symname);
 
 	maxlen = AFFS_SB(sb)->s_hashsize * sizeof(u32) - 1;
@@ -395,7 +395,7 @@ affs_link(struct dentry *old_dentry, struct inode *dir, struct dentry *dentry)
 {
 	struct inode *inode = d_inode(old_dentry);
 
-	pr_debug("%s(%" PRIino "u, %" PRIino "u, \"%pd\")\n", __func__, inode->i_ino, dir->i_ino,
+	pr_debug("%s(%llu, %llu, \"%pd\")\n", __func__, inode->i_ino, dir->i_ino,
 		 dentry);
 
 	return affs_add_entry(dir, inode, dentry, ST_LINKFILE);
@@ -511,7 +511,7 @@ int affs_rename2(struct mnt_idmap *idmap, struct inode *old_dir,
 	if (flags & ~(RENAME_NOREPLACE | RENAME_EXCHANGE))
 		return -EINVAL;
 
-	pr_debug("%s(old=%" PRIino "u,\"%pd\" to new=%" PRIino "u,\"%pd\")\n", __func__,
+	pr_debug("%s(old=%llu,\"%pd\" to new=%llu,\"%pd\")\n", __func__,
 		 old_dir->i_ino, old_dentry, new_dir->i_ino, new_dentry);
 
 	if (flags & RENAME_EXCHANGE)
diff --git a/fs/affs/symlink.c b/fs/affs/symlink.c
index 05ec904089fb8287545ccc8128ba4057175576cf..de31ed2e71dfcb71b770a98c9b43a248de8d7041 100644
--- a/fs/affs/symlink.c
+++ b/fs/affs/symlink.c
@@ -21,7 +21,7 @@ static int affs_symlink_read_folio(struct file *file, struct folio *folio)
 	char			 c;
 	char			 lc;
 
-	pr_debug("get_link(ino=%" PRIino "u)\n", inode->i_ino);
+	pr_debug("get_link(ino=%llu)\n", inode->i_ino);
 
 	bh = affs_bread(inode->i_sb, inode->i_ino);
 	if (!bh)

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
