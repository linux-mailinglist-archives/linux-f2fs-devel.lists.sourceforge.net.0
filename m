Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0P0vGz71pWkxIQAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:38:22 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BBBD01DFFC4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 21:38:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:In-Reply-To:References:Message-Id:
	MIME-Version:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkTPhrWGJ/T7n33I0BFAtenPJOoyZz31XrA934n2zgE=; b=C2af9k42Kdf6REoCcAnds3tF2s
	8tcQ6ReII5zoJAdnN6WHYDLbO41A2gefsLpHzspTvlBa7rb2FJxbC4Zk6H11OEsXOL2lylMITLILz
	Zmrop1DXM7WcQQjZWBqZ5huiRpBBy43gQ5FIg7mdBP9FcWIefR+TCqRfXRPZmxIxcmc8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxA20-00033K-6Z;
	Mon, 02 Mar 2026 20:38:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jlayton@kernel.org>) id 1vxA1y-00032p-8Z;
 Mon, 02 Mar 2026 20:38:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Cc:To:In-Reply-To:References:Message-Id:
 Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R7QOLH4F6SVW69mm8ZWBBGSwyZl4pStv0v5H5uLZHpU=; b=Nvoq3ITyEmPuQiD2NuyRyJntTU
 cmV63H4VSOtJpPbU8+w66s0t97EhrZLceZGsI+PbsWrJFlmwfjxsdd9oXHrOs7Aoltp0ft2/vMRjm
 5VMeh8jU0Q+JX51U+GphYnCeHxPJoMjlTwwSe6KH9dH2Q/FpUVEuhsPoQjEJBQYjoO5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Cc:To:In-Reply-To:References:Message-Id:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Subject:Date:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R7QOLH4F6SVW69mm8ZWBBGSwyZl4pStv0v5H5uLZHpU=; b=hVmm438GlBLc9y1P7uzaXTBI+d
 RZTNON2oFI2/8rtxR8DBI5T9vNLuByUeWoE2QaZzT7Itne11yiEKKvBe1RysImsG/c13x305Wl8Hm
 o9hRGOHsLNSpp2XhuB497ZGYBvKct3+YjVW0PDz/lxXv5vqmCHH48aJsxqrjt5HkiBgY=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxA1x-0005sy-Br; Mon, 02 Mar 2026 20:38:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id B137D60145;
 Mon,  2 Mar 2026 20:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 490D7C2BC9E;
 Mon,  2 Mar 2026 20:37:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772483891;
 bh=dnPu98PpOBsxLD5hcLK4mgf9NbKurHnG2PHV/YVPMtE=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=dfihw1jFSIdvvofM7GeczTRZaGjN56IVko/RjWryiRlHmabpPZmIfpljOJ2J9MNOV
 ys0IDuA6hyXtNpLSD2zuRcDoVU/QLP7NlQ3Ef9jE+J8bRYhSKrBKc3JqiKI3zZiRQf
 Cdu1+/pJ2+qo+qXqDf3bRWM7JI3BxxucWbSP5c0+7xYBk+8f8BOmCFC/cctg83T9iw
 6MUxikSWx/kJCJgX/mbJrJmLC3xowGW+PwD3vA3NivcNM6sfK0x43czxIYsP6PktEY
 KhKMBNMYfkJiICleMUUBg0ZVsV+gi0abWrxcL/3dVrICnxMxJygieV9huNAKdzhf+Q
 1CEdudwrsxe+g==
Date: Mon, 02 Mar 2026 15:24:39 -0500
MIME-Version: 1.0
Message-Id: <20260302-iino-u64-v2-55-e5388800dae0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3328; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=dnPu98PpOBsxLD5hcLK4mgf9NbKurHnG2PHV/YVPMtE=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBppfH97wgCsVXgRJvPbO7D9YfwDtQeOfAz7v61x
 OuSsVRyaqaJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCaaXx/QAKCRAADmhBGVaC
 FT5qD/9WD46NwA8dANhwhXI+E4wgQ2ujvVgqswNVOt/R0A3KIx0sWulEaOIVfb0S5FhqLDrP0g8
 O0nsiKplGgwCYCETurJGyhKlKT3Hs5NMI+PMPNHbHDEummbv973D/kH9gzHzg28yaYLCxBEkXxr
 WN10jr1wEowWdjCJkQepvboyqOMMphj/mMqpwI/oaUyNOTilpa2TaMSQypi8qXY5tFyPWAoVZEm
 1gafS/GnYTOLOuvdBmxV00tHamx+t24MobT4a+bXvq+W1le30GP/PZq8XNUEIGAVssSdSK8jlCv
 V9hxJbB6ouLnkbYzPUy2wzaeyNHM+T2wZ2zW+e1zP9+sxk8cp3nHhoT4kKfZ2aRnmSQxEUMoGf1
 C+xlt3Ko9v+UoVeYS46O44bFTxxfQjVYFqlHK0X7hv0fRr8vo+OGzmWNX2YopKnaVxWvcTOgmvK
 VUionH4RvddXKuFr7wkk7h9HPsU1IIrpQn/DO9boSCZKCmn+0+P808UszU176RwChBwc5wIdmAK
 97bikNaDuaAHX3GPGyo4TzY9azrw/+7t/X5pIsfbRpJ+s9gJE246v9pS3SXnM3x07Hu9gpUjJ2K
 e24X9IhPT9nnEQbjLHrTrbB9ufKbvzg1uI/0emWw7jPTLCJOf1nxHIBi0rAn7v39h1caBc0EMZ+
 1r9FSwPv866FIaw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert fscrypt i_ino format strings to use the PRIino format
 macro in preparation for the widening of i_ino via kino_t. Also change the
 temporary variable in check_for_busy_inodes() to be kino_t in p [...] 
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
X-Headers-End: 1vxA1x-0005sy-Br
Subject: [f2fs-dev] [PATCH v2 055/110] fscrypt: use PRIino format for i_ino
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
X-Rspamd-Queue-Id: BBBD01DFFC4
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

Convert fscrypt i_ino format strings to use the PRIino format macro in
preparation for the widening of i_ino via kino_t.  Also change the
temporary variable in check_for_busy_inodes() to be kino_t in
preparation of the same change.

Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
 fs/crypto/crypto.c   | 2 +-
 fs/crypto/hooks.c    | 2 +-
 fs/crypto/keyring.c  | 4 ++--
 fs/crypto/keysetup.c | 2 +-
 4 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 07f9cbfe3ea4115b8fcc881ae5154b3c3e898c04..4fc2990642fd3ee385a9919183cbb0f1c5ba6a58 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -365,7 +365,7 @@ void fscrypt_msg(const struct inode *inode, const char *level,
 	vaf.fmt = fmt;
 	vaf.va = &args;
 	if (inode && inode->i_ino)
-		printk("%sfscrypt (%s, inode %lu): %pV\n",
+		printk("%sfscrypt (%s, inode %" PRIino "u): %pV\n",
 		       level, inode->i_sb->s_id, inode->i_ino, &vaf);
 	else if (inode)
 		printk("%sfscrypt (%s): %pV\n", level, inode->i_sb->s_id, &vaf);
diff --git a/fs/crypto/hooks.c b/fs/crypto/hooks.c
index b97de0d1430fd6ec764f4a758dffe00263496118..f41809f1f1ed0b1ed78b85a4a987ec9e6cbcfa9d 100644
--- a/fs/crypto/hooks.c
+++ b/fs/crypto/hooks.c
@@ -62,7 +62,7 @@ int fscrypt_file_open(struct inode *inode, struct file *filp)
 	dentry_parent = dget_parent(dentry);
 	if (!fscrypt_has_permitted_context(d_inode(dentry_parent), inode)) {
 		fscrypt_warn(inode,
-			     "Inconsistent encryption context (parent directory: %lu)",
+			     "Inconsistent encryption context (parent directory: %" PRIino "u)",
 			     d_inode(dentry_parent)->i_ino);
 		err = -EPERM;
 	}
diff --git a/fs/crypto/keyring.c b/fs/crypto/keyring.c
index 9ec6e5ef0947eff394166d8af438a808cc8a4b2b..c0a2568a88cf6318877dec0f5379c5c8511c00f8 100644
--- a/fs/crypto/keyring.c
+++ b/fs/crypto/keyring.c
@@ -969,8 +969,8 @@ static int check_for_busy_inodes(struct super_block *sb,
 {
 	struct list_head *pos;
 	size_t busy_count = 0;
-	unsigned long ino;
 	char ino_str[50] = "";
+	kino_t ino;
 
 	spin_lock(&mk->mk_decrypted_inodes_lock);
 
@@ -994,7 +994,7 @@ static int check_for_busy_inodes(struct super_block *sb,
 
 	/* If the inode is currently being created, ino may still be 0. */
 	if (ino)
-		snprintf(ino_str, sizeof(ino_str), ", including ino %lu", ino);
+		snprintf(ino_str, sizeof(ino_str), ", including ino %" PRIino "u", ino);
 
 	fscrypt_warn(NULL,
 		     "%s: %zu inode(s) still busy after removing key with %s %*phN%s",
diff --git a/fs/crypto/keysetup.c b/fs/crypto/keysetup.c
index 40fa05688d3a1d4aa33d29e9508441faf4bca933..b30630f2c6a4e341c72af0db6aa173f59f742fa1 100644
--- a/fs/crypto/keysetup.c
+++ b/fs/crypto/keysetup.c
@@ -91,7 +91,7 @@ select_encryption_mode(const union fscrypt_policy *policy,
 	if (S_ISDIR(inode->i_mode) || S_ISLNK(inode->i_mode))
 		return &fscrypt_modes[fscrypt_policy_fnames_mode(policy)];
 
-	WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %lu, which is not encryptable (file type %d)\n",
+	WARN_ONCE(1, "fscrypt: filesystem tried to load encryption info for inode %" PRIino "u, which is not encryptable (file type %d)\n",
 		  inode->i_ino, (inode->i_mode & S_IFMT));
 	return ERR_PTR(-EINVAL);
 }

-- 
2.53.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
